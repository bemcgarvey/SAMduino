#include "can.h"
#include "definitions.h"
#include "basic_tasks.h"
#include "peripheral/mcan/plib_mcan1.h"
#include "stdlib.h"

uint8_t Mcan1MessageRAM[MCAN1_MESSAGE_RAM_CONFIG_SIZE] __attribute__((aligned(32)))__attribute__((space(data), section(".ram_nocache")));

/* Standard identifier id[28:18]*/
#define WRITE_ID(id) (id << 18)
#define READ_ID(id)  (id >> 18)

static uint32_t status = 0;
static volatile uint8_t bufferNumber;
static volatile uint8_t numberOfMessages;

static uint8_t txFiFo[MCAN1_TX_FIFO_BUFFER_SIZE];
static uint8_t rxFiFo0[MCAN1_RX_FIFO0_SIZE];
static uint8_t rxBuffer[MCAN1_RX_BUFFER_SIZE];

//interrupt callbacks
void rxBufferCallback(uint8_t bufferNum, uintptr_t contextHandle);
void rxFifo0Callback(uint8_t numberOfMessage, uintptr_t contextHandle);

//local functions
static void initCAN(void);
static void send_CAN_FD_Message(void);
static void send_CAN_2_Message(void);
static void rxBufferReceive(void);
static void rxFifo0Receive(void);
static void print_message(uint8_t numberOfMessage, MCAN_RX_BUFFER *rxBuf, uint8_t rxBufLen, uint8_t rxFifoBuf);
static int dlcToLen(uint8_t dlc);

void canMenu(void) {
    bool done = false;
    initCAN();
    while (!done) {
        printf("  CAN-FD\r\n");
        printf("     1) Send CAN-FD message\r\n");
        printf("     2) Send CAN 2.0 message\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        printf("\r\n");
        printf("         ***Receives ID's 0x123, 0x10123, 0x00 - 0xff and 0x1000 - 10ff***\r\n\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT | CAN_RX_BUFFER_BIT | CAN_RX_FIFO0_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & UART_RX_BIT) {
                switch (rx) {
                    case '1': send_CAN_FD_Message();
                        break;
                    case '2': send_CAN_2_Message();
                        break;
                    case 'm': repeatMenu = true;
                        break;
                    case 'b': CAN_Standby_Set();
                        //vTaskDelete(rxTask);  //Need heap type 4 first
                        //rxTask = NULL;
                        return;
                }
            }
            if (uxBits & CAN_RX_BUFFER_BIT) {
                rxBufferReceive();
            }
            if (uxBits & CAN_RX_FIFO0_BIT) {
                rxFifo0Receive();
            }
        }
    }
}

void initCAN(void) {
    CAN_Standby_Clear();
    MCAN1_MessageRAMConfigSet(Mcan1MessageRAM);
    MCAN1_RxBuffersCallbackRegister(rxBufferCallback, (uintptr_t)NULL);
    MCAN1_RxFifoCallbackRegister(0, rxFifo0Callback, (uintptr_t)NULL);
}

void send_CAN_FD_Message(void) {
    MCAN_TX_BUFFER *txBuffer = NULL;
    char str[256];
    getStr("MsgID: 0x", str, 12);
    uint32_t id = strtol(str, NULL, 16);
    memset(txFiFo, 0x00, MCAN1_TX_FIFO_BUFFER_ELEMENT_SIZE);
    txBuffer = (MCAN_TX_BUFFER *) txFiFo;
    if (id <= 0x7ff) {
        //Standard id
        txBuffer->id = WRITE_ID(id);
    } else {
        //Extended id
        txBuffer->id = id;
        txBuffer->xtd = 1;
    }
    txBuffer->dlc = 15; //64 bytes
    txBuffer->fdf = 1;
    txBuffer->brs = 1;
    for (int i = 0; i < 64; ++i) {
        txBuffer->data[i] = i;
    }
    if (MCAN1_MessageTransmitFifo(1, txBuffer) == true) {
        printf("    Message Sent\r\n");
    } else {
        printf("    Error sending message\r\n");
    }
}

void send_CAN_2_Message(void) {
    MCAN_TX_BUFFER *txBuffer = NULL;
    char str[256];
    getStr("MsgID: 0x", str, 12);
    uint32_t id = strtol(str, NULL, 16);
    memset(txFiFo, 0x00, MCAN1_TX_FIFO_BUFFER_ELEMENT_SIZE);
    txBuffer = (MCAN_TX_BUFFER *) txFiFo;
    if (id <= 0x7ff) {
        //Standard id
        txBuffer->id = WRITE_ID(id);
    } else {
        //Extended id
        txBuffer->id = id;
        txBuffer->xtd = 1;
    }
    txBuffer->dlc = 8; //8 bytes
    txBuffer->fdf = 0;
    txBuffer->brs = 0;
    for (int i = 0; i < 8; ++i) {
        txBuffer->data[i] = i;
    }
    if (MCAN1_MessageTransmitFifo(1, txBuffer) == true) {
        printf("    Message Sent\r\n");
    } else {
        printf("    Error sending message\r\n");
    }
}

void rxBufferReceive(void) {
    status = MCAN1_ErrorGet();
    if (((status & MCAN_PSR_LEC_Msk) == MCAN_ERROR_NONE) || ((status & MCAN_PSR_LEC_Msk) == MCAN_ERROR_LEC_NO_CHANGE)) {
        memset(rxBuffer, 0x00, MCAN1_RX_BUFFER_ELEMENT_SIZE);
        if (MCAN1_MessageReceive(bufferNumber, (MCAN_RX_BUFFER *) rxBuffer) == true) {
            print_message(1, (MCAN_RX_BUFFER *) rxBuffer, MCAN1_RX_BUFFER_ELEMENT_SIZE, 2);
        } else {
            printf("    ****Error in received message\r\n");
        }
    } else {
        printf("    ****Error in received message\r\n");
    }
}

void rxFifo0Receive(void) {
    status = MCAN1_ErrorGet();

    if (((status & MCAN_PSR_LEC_Msk) == MCAN_ERROR_NONE) || ((status & MCAN_PSR_LEC_Msk) == MCAN_ERROR_LEC_NO_CHANGE)) {
        if (numberOfMessages != 0) {
            memset(rxFiFo0, 0x00, (numberOfMessages * MCAN1_RX_FIFO0_ELEMENT_SIZE));
            if (MCAN1_MessageReceiveFifo(MCAN_RX_FIFO_0, numberOfMessages, (MCAN_RX_BUFFER *) rxFiFo0) == true) {
                print_message(numberOfMessages, (MCAN_RX_BUFFER *) rxFiFo0, MCAN1_RX_FIFO0_ELEMENT_SIZE, 0);
            } else {
                printf("    ****Error in received message\r\n");
            }
        }
    } else {
        printf("    ****Error in received message\r\n");
    }
}

static void print_message(uint8_t numberOfMessage, MCAN_RX_BUFFER *rxBuf, uint8_t rxBufLen, uint8_t rxFifoBuf) {
    uint8_t length = 0;
    uint8_t msgLength = 0;
    uint32_t id = 0;

    if (rxFifoBuf == 0)
        printf("    Rx FIFO0 :");
    else if (rxFifoBuf == 1)
        printf("    Rx FIFO1 :");
    else if (rxFifoBuf == 2)
        printf("    Rx Buffer :");

    for (uint8_t count = 0; count < numberOfMessage; count++) {
        printf("    **Message Received**\r\n");
        id = rxBuf->xtd ? rxBuf->id : READ_ID(rxBuf->id);
        msgLength = dlcToLen(rxBuf->dlc);
        length = msgLength;
        printf("    Message ID:0x%x Length:0x%x ", (unsigned int) id, (unsigned int) msgLength);
        printf("    Message:");
        while (length) {
            printf("0x%02x ", rxBuf->data[msgLength - length--]);
        }
        printf("\r\n");
        rxBuf += rxBufLen;
    }
}

static int dlcToLen(uint8_t dlc) {
    static int len[] = {12, 16, 20, 24, 32, 48, 64};
    dlc &= 0x0f;
    if (dlc <= 8) {
        return dlc;
    } else {
        return len[dlc - 9];
    }

}

void rxBufferCallback(uint8_t bufferNum, uintptr_t contextHandle) {
    bufferNumber = bufferNum;
    BaseType_t xHigherPriorityTaskWoken, xResult;
    xHigherPriorityTaskWoken = pdFALSE;
    xResult = xEventGroupSetBitsFromISR(menuEventGroup, CAN_RX_BUFFER_BIT, &xHigherPriorityTaskWoken);
    if (xResult != pdFAIL) {
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    }
}

void rxFifo0Callback(uint8_t numberOfMessage, uintptr_t contextHandle) {
    numberOfMessages = numberOfMessage;
    BaseType_t xHigherPriorityTaskWoken, xResult;
    xHigherPriorityTaskWoken = pdFALSE;
    xResult = xEventGroupSetBitsFromISR(menuEventGroup, CAN_RX_FIFO0_BIT, &xHigherPriorityTaskWoken);
    if (xResult != pdFAIL) {
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    }
}