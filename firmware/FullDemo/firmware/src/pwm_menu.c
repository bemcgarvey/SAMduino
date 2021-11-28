
#include "pwm_menu.h"
#include "definitions.h"
#include "basic_tasks.h"
#include <stdbool.h>

#define SERVO_MIN       18000
#define SERVO_CENTER    18500
#define SERVO_MAX       19000
#define SERVO_STEP      10
#define SERVO_PERIOD    20000
#define MAX_DC          7500
#define DC_STEP         (MAX_DC / 100)

static void servo(void);
static void pushPullPWM(void);

void pwmMenu(void) {
    bool done = false;
    while (!done) {
        printf("  PWM\r\n");
        printf("     1) Servo control on PB0\r\n");
        printf("     2) Push/pull 20kHz, 0-100%% duty cycle with deadband on PB1 and PD25\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & UART_RX_BIT) {
                switch (rx) {
                    case '1': servo();
                        repeatMenu = true;
                        break;
                    case '2': pushPullPWM();
                        repeatMenu = true;
                        break;
                    case 'm': repeatMenu = true;
                        break;
                    case 'b':
                        return;
                }
            }
        }
    }
}

void servo(void) {
    printf("    Use + and - keys to move servo.  ESC to quit\r\n");
    static uint16_t servoPos = SERVO_CENTER;
    PWM0_ChannelDutySet(PWM_CHANNEL_0, servoPos);
    printf("\r    Position = %d us", SERVO_PERIOD - servoPos);
    PWM0_ChannelsStart(PWM_CHANNEL_0_MASK);
    RedLed_Clear();
    while (1) {
        EventBits_t uxBits;
        uxBits = xEventGroupWaitBits(menuEventGroup
                , UART_RX_BIT
                , pdTRUE, pdFALSE, portMAX_DELAY);
        if (uxBits & UART_RX_BIT) {
            switch (rx) {
                case '-': servoPos += SERVO_STEP;
                    if (servoPos > SERVO_MAX) {
                        servoPos = SERVO_MAX;
                    }
                    PWM0_ChannelDutySet(PWM_CHANNEL_0, servoPos);
                    printf("\r    Position = %d us", SERVO_PERIOD - servoPos);
                    break;
                case '+':
                    servoPos -= SERVO_STEP;
                    if (servoPos < SERVO_MIN) {
                        servoPos = SERVO_MIN;
                    }
                    PWM0_ChannelDutySet(PWM_CHANNEL_0, servoPos);
                    printf("\r    Position = %d us", SERVO_PERIOD - servoPos);
                    break;
                case 27: //esc key
                    PWM0_ChannelsStop(PWM_CHANNEL_0_MASK);
                    RedLed_Set();
                    printf("\r\n");
                    return;
            }
        }
    }
}

static void pushPullPWM(void) {
    static uint16_t dutyCycle = MAX_DC;  //Note that this gives a 0% dc on the high output
    printf("    Use + and - keys to change duty cycle.  ESC to quit\r\n");
    PWM0_ChannelDutySet(PWM_CHANNEL_1, dutyCycle);
    int dcPercent = dutyCycle * 100 / MAX_DC;
    printf("\r    DC = %d%%", 100 - dcPercent);
    PWM0_ChannelsStart(PWM_CHANNEL_1_MASK);
    RedLed_Clear();
    while (1) {
        EventBits_t uxBits;
        uxBits = xEventGroupWaitBits(menuEventGroup
                , UART_RX_BIT
                , pdTRUE, pdFALSE, portMAX_DELAY);
        if (uxBits & UART_RX_BIT) {
            switch (rx) {
                case '-':
                    dutyCycle += DC_STEP;
                    if (dutyCycle > MAX_DC) {
                        dutyCycle = MAX_DC;
                    }
                    PWM0_ChannelDutySet(PWM_CHANNEL_1, dutyCycle);
                    dcPercent = dutyCycle * 100 / MAX_DC;
                    printf("\r    DC = %d%% ", 100 - dcPercent);
                    break;
                case '+':
                    dutyCycle -= DC_STEP;
                    if (dutyCycle > MAX_DC) {  //unsigned so this happens when it goes below zero
                        dutyCycle = 0;
                    }
                    PWM0_ChannelDutySet(PWM_CHANNEL_1, dutyCycle);
                    dcPercent = dutyCycle * 100 / MAX_DC;
                    printf("\r    DC = %d%% ", 100 - dcPercent);
                    break;
                case 27: //esc key
                    PWM0_ChannelsStop(PWM_CHANNEL_1_MASK);
                    RedLed_Set();
                    printf("\r\n");
                    return;
            }
        }
    }
}