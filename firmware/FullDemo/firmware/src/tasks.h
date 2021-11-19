/* 
 * File:   tasks.h
 * Author: bemcg
 *
 * Created on November 18, 2021, 11:01 PM
 */

#ifndef TASKS_H
#define	TASKS_H

#include "FreeRTOS.h"
#include "task.h"
#include "event_groups.h"

#ifdef	__cplusplus
extern "C" {
#endif

    extern EventGroupHandle_t menuEventGroup;
    
    void setupTasks(void);



#ifdef	__cplusplus
}
#endif

#endif	/* TASKS_H */

