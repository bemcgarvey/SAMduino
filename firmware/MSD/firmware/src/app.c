/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "app.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
 */

APP_DATA appData;


// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/******************************************************************************
  Function:
    void APP_USBDeviceEventHandler
    (
        USB_DEVICE_EVENTS event
        void * pEventData,
        uintptr_t context
    );

  Remarks:
    Handles the Device Layers Events.
 */

void APP_USBDeviceEventHandler(USB_DEVICE_EVENT event, void * pEventData, uintptr_t context) {
    /* This is an example of how the context parameter
       in the event handler can be used.*/

    APP_DATA * appDataObject = (APP_DATA*) context;

    switch (event) {
        case USB_DEVICE_EVENT_RESET:
        case USB_DEVICE_EVENT_DECONFIGURED:

            /* Device was reset or de-configured. Update LED status */
            RedLed_Set();
            break;

        case USB_DEVICE_EVENT_CONFIGURED:

            /* Device is configured. Update LED status */
            RedLed_Clear();
            break;

        case USB_DEVICE_EVENT_SUSPENDED:

            RedLed_Set();
            break;

        case USB_DEVICE_EVENT_POWER_DETECTED:

            /* VBUS is detected. Attach the device. */
            USB_DEVICE_Attach(appDataObject->usbDeviceHandle);
            break;

        case USB_DEVICE_EVENT_POWER_REMOVED:

            /* VBUS is not detected. Detach the device */
            USB_DEVICE_Detach(appDataObject->usbDeviceHandle);
            RedLed_Set();
            break;

            /* These events are not used in this demo */
        case USB_DEVICE_EVENT_RESUMED:
        case USB_DEVICE_EVENT_ERROR:
        case USB_DEVICE_EVENT_SOF:
        default:
            break;
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary local functions.
 */


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

SYS_FS_FSTAT fsStat;
int count = 0;
char fileName[30];
SYS_FS_RESULT res;
SYS_FS_FORMAT_PARAM opt = {0};
uint8_t CACHE_ALIGN work[1024];
SYS_FS_HANDLE fileHandle;

void APP_Initialize(void) {
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;

    /* Set device layer handle as invalid */
    appData.usbDeviceHandle = USB_DEVICE_HANDLE_INVALID;
}

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks(void) {
    /* Check the application's current state. */
    switch (appData.state) {
            /* Application's initial state. */
        case APP_STATE_INIT:
        {
            appData.usbDeviceHandle = USB_DEVICE_Open(USB_DEVICE_INDEX_0, DRV_IO_INTENT_READWRITE);

            if (appData.usbDeviceHandle != USB_DEVICE_HANDLE_INVALID) {
                /* Set the Event Handler. We will start receiving events after
                 * the handler is set */
                USB_DEVICE_EventHandlerSet(appData.usbDeviceHandle, APP_USBDeviceEventHandler, (uintptr_t) & appData);

                printf("\r\nDemo Started\r\n");
                printf("Type d to print root directory\r\n");
                printf("     k to make a new directory\r\n");
                printf("     w to create a text file\r\n");
                printf("     u to unmount the disk\r\n");
                printf("     m to mount the disk (it is auto mounted at start)\r\n");
                printf("     f to format the disk\r\n");
                /* Move the application to the next state */
                appData.state = APP_STATE_RUNNING;
            }

            break;
        }

        case APP_STATE_RUNNING:
            /* The MSD Device is maintained completely by the MSD function
             * driver and does not require application intervention. So there
             * is nothing related to MSD Device to do here. */
            if (UART0_ReceiverIsReady()) {
                char rx = UART0_ReadByte();
                SYS_FS_HANDLE dirHandle;
                switch (rx) {
                    case 'd':
                        dirHandle = SYS_FS_DirOpen("/mnt/flashDrive/");
                        if (dirHandle != SYS_FS_HANDLE_INVALID) {
                            printf("Directory of /\r\n");
                            do {
                                if (SYS_FS_DirRead(dirHandle, &fsStat) == SYS_FS_RES_SUCCESS) {
                                    if (fsStat.fname[0] != 0) {
                                        printf("  %s\r\n", fsStat.fname);
                                    } else {
                                        break;
                                    }
                                } else {
                                    break;
                                }
                            } while (1);
                            SYS_FS_DirClose(dirHandle);
                            printf("\r\n");
                        } else {
                            printf("Dir open failed\r\n");
                        }
                        break;
                    case 'k':
                        snprintf(fileName, sizeof (fileName), "New Folder%d", count);
                        ++count;
                        printf("Creating directory: %s\r\n", fileName);
                        SYS_FS_DirectoryMake(fileName);
                        break;
                    case 'w':
                        snprintf(fileName, sizeof (fileName), "New Text File%d.txt", count);
                        ++count;
                        printf("Creating file: %s\r\n", fileName);
                        fileHandle = SYS_FS_FileOpen(fileName, SYS_FS_FILE_OPEN_WRITE);
                        if (fileHandle != SYS_FS_HANDLE_INVALID) {
                            SYS_FS_FilePrintf(fileHandle, "This is a test file");
                            SYS_FS_FileClose(fileHandle);
                        } else {
                            printf("Error");
                        }
                        break;
                    case 'u':
                        printf("Unmount\r\n");
                        SYS_FS_Unmount("/mnt/flashDrive");
                        break;
                    case 'm':
                        printf("Mount\r\n");
                        SYS_FS_Mount("/dev/mtda1", "/mnt/flashDrive", FAT, 0, NULL);
                        break;
                    case 'f':
                        //TODO check to see if formatting works after the flash has been erased
                        // or written by another application
                        printf("Formatting\r\n");
                        opt.fmt = SYS_FS_FORMAT_FAT;
                        opt.au_size = 0;
                        opt.n_fat = 1;
                        opt.n_root = 32;
                        opt.align = 0;
                        res = SYS_FS_DriveFormat("/mnt/flashDrive", &opt, (void *) work, 1024);
                        if (res == SYS_FS_RES_FAILURE) {
                            printf("Format failed\r\n");
                        } else {
                            SYS_FS_DriveLabelSet("/mnt/flashDrive", "SAMduino");
                            printf("Format complete\r\n");
                        }
                        break;
                    default:
                        printf("Type d, k, w, u, m or f\r\n");
                        break;
                }
            }
            break;
            /* The default state should never be executed. */
        default:
            break;

    }
}


/*******************************************************************************
 End of File
 */

