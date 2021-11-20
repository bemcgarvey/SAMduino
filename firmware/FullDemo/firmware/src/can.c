#include "can.h"
#include "definitions.h"
#include "basic_tasks.h"
#include "peripheral/mcan/plib_mcan1.h"
#include "stdlib.h"

uint8_t Mcan1MessageRAM[MCAN1_MESSAGE_RAM_CONFIG_SIZE] __attribute__((aligned(32)))__attribute__((space(data), section(".ram_nocache")));

/* Standard identifier id[28:18]*/
#define WRITE_ID(id) (id << 18)
#define READ_ID(id)  (id >> 18)

//static uint32_t status = 0;

static uint8_t txFiFo[MCAN1_TX_FIFO_BUFFER_SIZE];
static uint8_t rxFiFo0[MCAN1_RX_FIFO0_SIZE];
//static uint8_t rxFiFo1[MCAN1_RX_FIFO1_SIZE];
static uint8_t rxBuffer[MCAN1_RX_BUFFER_SIZE];


void initCAN(void);
void send_CAN_FD_Message(void);
void send_CAN_2_Message(void);

void canMenu(void) {
    bool done = false;
    initCAN();
    while (!done) {
        printf("  CAN-FD\r\n");
        printf("     1) Send CAN-FD message\r\n");
        printf("     2) Send CAN 2.0 message\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT | CAN_RX_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & UART_RX_BIT) {
                uint8_t rx;
                UART0_Read(&rx, 1);
                switch (rx) {
                    case '1': send_CAN_FD_Message();
                        break;
                    case '2': send_CAN_2_Message();
                        break;
                    case 'm': repeatMenu = true;
                        break;
                    case 'b': CAN_Standby_Set();
                        return;
                }
            }
        }
    }
}

void initCAN(void) {
    CAN_Standby_Clear();
    MCAN1_MessageRAMConfigSet(Mcan1MessageRAM);
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
    txBuffer->dlc = 15;  //64 bytes
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
    txBuffer->dlc = 8;  //8 bytes
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