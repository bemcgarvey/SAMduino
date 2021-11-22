/* 
 * File:   tasks.h
 * Author: bemcg
 *
 * Created on November 18, 2021, 11:01 PM
 */

#ifndef BASIC_TASKS_H
#define	BASIC_TASKS_H

#include "FreeRTOS.h"
#include "event_groups.h"

#ifdef	__cplusplus
extern "C" {
#endif
    
//Event flags    
#define LEFT_BUTTON_BIT     (1 << 0)
#define RIGHT_BUTTON_BIT    (1 << 1)
#define UART_RX_BIT         (1 << 2)
#define CAN_RX_BUFFER_BIT   (1 << 3)
#define CAN_RX_FIFO0_BIT    (1 << 4)
#define RTC_BIT             (1 << 5)

    extern EventGroupHandle_t menuEventGroup;

    void setupBasicTasks(void);
    int getStr(const char *prompt, char *buffer, int maxLen);



#ifdef	__cplusplus
}
#endif

#endif	/* TASKS_H */

