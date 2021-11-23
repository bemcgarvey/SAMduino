
#include "analog.h"
#include "definitions.h"
#include "basic_tasks.h"
#include <stdbool.h>

static void readChannel(AFEC_CHANNEL_NUM ch);
static void sampleTimerCallback(TimerHandle_t xTimer);
static void setResolution(int bits);
static TimerHandle_t sampleTimer = NULL;
int activeChannel = -1;

void analogMenu(void) {
    bool done = false;
    if (sampleTimer == NULL) {
        sampleTimer = xTimerCreate("sample", 200, true, 0, sampleTimerCallback);
    }
    while (!done) {
        printf("  Analog functions\r\n");
        printf("     1) Convert Analog CH0 (12 bit)\r\n");
        printf("     2) Convert Analog CH1 (16 bit)\r\n");
        printf("     3) 1 kHz sine wave on DAC0\r\n");
        printf("     4) 2 kHz sawtooth on DAC0\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & UART_RX_BIT) {
                uint8_t rx;
                UART0_Read(&rx, 1);
                switch (rx) {
                    case '1':
                        xTimerStop(sampleTimer, 10);
                        activeChannel = 0;
                        setResolution(12);
                        xTimerStart(sampleTimer, 10);
                        break;
                    case '2':
                        xTimerStop(sampleTimer, 10);
                        activeChannel = 1;
                        setResolution(16);
                        xTimerStart(sampleTimer, 10);
                        break;
                    case 'm': xTimerStop(sampleTimer, 10);
                        repeatMenu = true;
                        break;
                    case 'b': xTimerStop(sampleTimer, 10);
                        return;
                }
            }
        }
    }
}

void readChannel(AFEC_CHANNEL_NUM ch) {
    AFEC0_ConversionStart();
    while (!AFEC0_ChannelResultIsReady(ch));
    uint16_t result = AFEC0_ChannelResultGet(ch);
    printf("     CH%d:%-5u\r", ch, result);
}

void sampleTimerCallback(TimerHandle_t xTimer) {
    readChannel(activeChannel);
}

void setResolution(int bits) {
    AFEC0_REGS->AFEC_EMR = AFEC_EMR_SIGNMODE_SE_UNSG_DF_SIGN | AFEC_EMR_TAG_Msk
            | AFEC_EMR_STM_Msk;
    switch (bits) {
        case 12:
            AFEC0_REGS->AFEC_EMR |= AFEC_EMR_RES_NO_AVERAGE;
            break;
        case 13:
            AFEC0_REGS->AFEC_EMR |= AFEC_EMR_RES_OSR4;
            break;
        case 14:
            AFEC0_REGS->AFEC_EMR |= AFEC_EMR_RES_OSR16;
            break;
        case 15:
            AFEC0_REGS->AFEC_EMR |= AFEC_EMR_RES_OSR64;
            break;
        case 16: 
            AFEC0_REGS->AFEC_EMR |= AFEC_EMR_RES_OSR256;
            break;
        default:
            AFEC0_REGS->AFEC_EMR |= AFEC_EMR_RES_NO_AVERAGE;  //12bit
            break;
    }
}