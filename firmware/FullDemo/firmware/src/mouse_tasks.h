/* 
 * File:   usb_tasks.h
 * Author: bemcg
 *
 * Created on November 23, 2021, 4:11 PM
 */

#ifndef MOUSE_TASKS_H
#define	MOUSE_TASKS_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "string.h"
#include "definitions.h"
#include "stream_buffer.h"

#define MOUSE_BUTTON_NUMBERS 2

    typedef int8_t MOUSE_COORDINATE;

    typedef enum {
        /* Button is not pressed */
        MOUSE_BUTTON_STATE_RELEASED,
        /* Button is pressed */
        MOUSE_BUTTON_STATE_PRESSED
    }
    MOUSE_BUTTON_STATE;

    typedef struct {
        uint8_t data[3];
    }
    MOUSE_REPORT;

    void MOUSE_ReportCreate
    (
            MOUSE_COORDINATE x,
            MOUSE_COORDINATE y,
            MOUSE_BUTTON_STATE * buttonArray,
            MOUSE_REPORT * mouseReport
            );

    typedef enum {
        APP_STATE_INIT = 0,
        APP_STATE_WAIT_FOR_ATTACH,
        APP_STATE_WAIT_FOR_CONFIGURATION,
        APP_STATE_MOUSE_EMULATE,
        APP_STATE_ERROR
    } APP_STATES;

    typedef struct {
        /* The application's current state */
        APP_STATES state;
        /* device layer handle returned by device layer open function */
        USB_DEVICE_HANDLE deviceHandle;
        /* Is device configured */
        bool isConfigured;
        /* Mouse x coordinate*/
        MOUSE_COORDINATE xCoordinate;
        /* Mouse y coordinate*/
        MOUSE_COORDINATE yCoordinate;
        /* Mouse buttons*/
        MOUSE_BUTTON_STATE mouseButton[MOUSE_BUTTON_NUMBERS];
        /* HID instance associated with this app object*/
        SYS_MODULE_INDEX hidInstance;
        /* Transfer handle */
        USB_DEVICE_HID_TRANSFER_HANDLE reportTransferHandle;
        /* Device Layer System Module Object */
        SYS_MODULE_OBJ deviceLayerObject;
        /* USB HID active Protocol */
        uint8_t activeProtocol;
        /* USB HID current Idle */
        uint8_t idleRate;
        /* Tracks the progress of the report send */
        bool isMouseReportSendBusy;
        //idle timer
        uint16_t idleTicks;
        bool powerDetected;
        bool attachAllowed;
    } APP_DATA;

    enum {MOUSE_TASK_NOTIFY_ATTACH = 0x01, MOUSE_TASK_NOTIFY_DETACH = 0x02};

    void APP_Initialize(void);
    void MouseTasks(void *pvParameters);
    
    extern TaskHandle_t mouseTasksHandle;
    extern StreamBufferHandle_t mouseStreamHandle;

#ifdef	__cplusplus
}
#endif

#endif	/* USB_TASKS_H */

