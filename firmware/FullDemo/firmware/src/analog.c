
#include "analog.h"
#include "definitions.h"
#include "basic_tasks.h"
#include <stdbool.h>
#include <math.h>

static void readChannel(AFEC_CHANNEL_NUM ch);
static void sampleTimerCallback(TimerHandle_t xTimer);
static void setResolution(int bits);
static void calculateSineValues(void);
static void tc3ch1Callback(TC_TIMER_STATUS status, uintptr_t context);


#define DAC_SINE_STEPS  200
#define DAC_SAW_STEPS   100
#define DAC_SAW_INC     (4095 / DAC_SAW_STEPS)
static TimerHandle_t sampleTimer = NULL;
int activeChannel = -1;
static int dacStep = 0;
enum {
    DAC_SINE_WAVE, DAC_SAW_WAVE
} waveType;
static uint32_t sineValues[DAC_SINE_STEPS];
static uint32_t sawValue;

void analogMenu(void) {
    bool done = false;
    if (sampleTimer == NULL) {
        sampleTimer = xTimerCreate("sample", 200, true, 0, sampleTimerCallback);
    }
    calculateSineValues();
    TC3_CH1_TimerCallbackRegister(tc3ch1Callback, (uintptr_t) NULL);
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
                        TC3_CH1_TimerStop();
                        xTimerStop(sampleTimer, 10);
                        activeChannel = 0;
                        setResolution(12);
                        xTimerStart(sampleTimer, 10);
                        break;
                    case '2':
                        TC3_CH1_TimerStop();
                        xTimerStop(sampleTimer, 10);
                        activeChannel = 1;
                        setResolution(16);
                        xTimerStart(sampleTimer, 10);
                        break;
                    case '3':
                        printf("    **1 kHz sine wave\r\n");
                        xTimerStop(sampleTimer, 10);
                        dacStep = 0;
                        waveType = DAC_SINE_WAVE;
                        TC3_CH1_TimerStart();
                        break;
                    case '4':
                        printf("    **2 kHz saw tooth\r\n");
                        xTimerStop(sampleTimer, 10);
                        dacStep = 0;
                        sawValue = 0;
                        waveType = DAC_SAW_WAVE;
                        TC3_CH1_TimerStart();
                        break;
                    case 'm':
                        TC3_CH1_TimerStop();
                        xTimerStop(sampleTimer, 10);
                        repeatMenu = true;
                        break;
                    case 'b':
                        TC3_CH1_TimerStop();
                        xTimerStop(sampleTimer, 10);
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
            AFEC0_REGS->AFEC_EMR |= AFEC_EMR_RES_NO_AVERAGE; //12bit
            break;
    }
}

void tc3ch1Callback(TC_TIMER_STATUS status, uintptr_t context) {
    if (waveType == DAC_SINE_WAVE) {
        DACC_DataWrite(0, sineValues[dacStep++]);
        if (dacStep == DAC_SINE_STEPS) {
            dacStep = 0;
        }
    } else if (waveType == DAC_SAW_WAVE) {
        DACC_DataWrite(0, sawValue);
        ++dacStep;
        sawValue += DAC_SAW_INC;
        if (dacStep == DAC_SAW_STEPS) {
            dacStep = 0;
            sawValue = 0;
        }
    }
}

static void calculateSineValues(void) {
    const double dTheta = (2.0 * M_PI) / DAC_SINE_STEPS;
    for (int i = 0; i < DAC_SINE_STEPS; ++i) {
        double s = sin(i * dTheta);
        sineValues[i] = (uint32_t)(((int32_t)round(s * 2047)) + 2048);
    }
}