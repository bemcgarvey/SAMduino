
#include "rtc_menu.h"
#include "definitions.h"
#include "basic_tasks.h"
#include <stdbool.h>
#include "peripheral/rtc/plib_rtc.h"
#include <string.h>
#include <stdlib.h>

#define RTC_INT_SEC  0x04

static void setTimeDate(void);
void rtcCallback(uint32_t int_cause, uintptr_t context);

void rtcMenu(void) {
    bool done = false;
    RTC_CallbackRegister(rtcCallback, (uintptr_t)NULL);
    RTC_InterruptEnable(RTC_INT_SEC);
    while (!done) {
        printf("  Real Time Clock\r\n");
        printf("     1) Set time and date\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT | RTC_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & UART_RX_BIT) {
                switch (rx) {
                    case '1': setTimeDate();
                        repeatMenu = true;
                        break;
                    case 'm': repeatMenu = true;
                        break;
                    case 'b':
                        RTC_InterruptDisable(RTC_INT_SEC);
                        return;
                }
            }
            if (uxBits & RTC_BIT) {
                struct tm currentTime;
                RTC_TimeGet(&currentTime);
                printf("\r     %02d:%02d:%02d  %d/%d/%d  ", currentTime.tm_hour
                        , currentTime.tm_min, currentTime.tm_sec
                        , currentTime.tm_mon + 1, currentTime.tm_mday
                        , currentTime.tm_year + 1900);
            }
        }
    }
}

void setTimeDate(void) {
    struct tm time;
    char str[6];
    RTC_InterruptDisable(RTC_INT_SEC);
    memset(&time, 0, sizeof(time));
    getStr("\r\nHour (24 hour):", str, 5);
    time.tm_hour = atoi(str);
    getStr("Minutes:", str, 6);
    time.tm_min = atoi(str);
    getStr("Month:", str, 6);
    time.tm_mon = atoi(str) - 1;
    getStr("Day:", str, 6);
    time.tm_mday = atoi(str);
    getStr("Year:", str, 6);
    time.tm_year = atoi(str) - 1900;
    getStr("Enter sets time - seconds will be 0", str, 1);
    if (RTC_TimeSet(&time)) {
        printf("    ***Time Set***\r\n");
        RTC_InterruptEnable(RTC_INT_SEC);
    } else {
        printf("*****Error*****\r\n");
    }
}

void rtcCallback(uint32_t int_cause, uintptr_t context) {
    BaseType_t xHigherPriorityTaskWoken, xResult;
    xHigherPriorityTaskWoken = pdFALSE;
    xResult = xEventGroupSetBitsFromISR(menuEventGroup, RTC_BIT, &xHigherPriorityTaskWoken);
    if (xResult != pdFAIL) {
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
    }
}