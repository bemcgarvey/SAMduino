#include "mouse_tasks.h"
#include "definitions.h"

#define APP_USB_CONVERT_TO_MILLISECOND (1)

APP_DATA appData;
TaskHandle_t mouseTasksHandle = NULL;
StreamBufferHandle_t mouseStreamHandle = NULL;

/* Mouse Report */
MOUSE_REPORT mouseReport USB_ALIGN;
MOUSE_REPORT previousReport USB_ALIGN;

void APP_USBDeviceHIDEventHandler(USB_DEVICE_HID_INDEX hidInstance,
        USB_DEVICE_HID_EVENT event, void * eventData, uintptr_t userData) {
    APP_DATA * appDataObject = (APP_DATA *) userData;

    switch (event) {
        case USB_DEVICE_HID_EVENT_REPORT_SENT:

            /* This means the mouse report was sent.
             We are free to send another report */

            appDataObject->isMouseReportSendBusy = false;
            break;

        case USB_DEVICE_HID_EVENT_REPORT_RECEIVED:

            /* Dont care for other event in this demo */
            break;

        case USB_DEVICE_HID_EVENT_SET_IDLE:

            /* Acknowledge the Control Write Transfer */
            USB_DEVICE_ControlStatus(appDataObject->deviceHandle, USB_DEVICE_CONTROL_STATUS_OK);

            /* save Idle rate received from Host */
            appDataObject->idleRate = ((USB_DEVICE_HID_EVENT_DATA_SET_IDLE*) eventData)->duration;
            break;

        case USB_DEVICE_HID_EVENT_GET_IDLE:

            /* Host is requesting for Idle rate. Now send the Idle rate */
            USB_DEVICE_ControlSend(appDataObject->deviceHandle, &(appDataObject->idleRate), 1);

            /* On successfully receiving Idle rate, the Host would acknowledge back with a
               Zero Length packet. The HID function driver returns an event
               USB_DEVICE_HID_EVENT_CONTROL_TRANSFER_DATA_SENT to the application upon
               receiving this Zero Length packet from Host.
               USB_DEVICE_HID_EVENT_CONTROL_TRANSFER_DATA_SENT event indicates this control transfer
               event is complete */

            break;

        case USB_DEVICE_HID_EVENT_SET_PROTOCOL:
            /* Host is trying set protocol. Now receive the protocol and save */
            appDataObject->activeProtocol = *(USB_HID_PROTOCOL_CODE *) eventData;

            /* Acknowledge the Control Write Transfer */
            USB_DEVICE_ControlStatus(appDataObject->deviceHandle, USB_DEVICE_CONTROL_STATUS_OK);
            break;

        case USB_DEVICE_HID_EVENT_GET_PROTOCOL:

            /* Host is requesting for Current Protocol. Now send the Idle rate */
            USB_DEVICE_ControlSend(appDataObject->deviceHandle, &(appDataObject->activeProtocol), 1);

            /* On successfully receiving Idle rate, the Host would acknowledge
              back with a Zero Length packet. The HID function driver returns
              an event USB_DEVICE_HID_EVENT_CONTROL_TRANSFER_DATA_SENT to the
              application upon receiving this Zero Length packet from Host.
              USB_DEVICE_HID_EVENT_CONTROL_TRANSFER_DATA_SENT event indicates
              this control transfer event is complete */
            break;

        case USB_DEVICE_HID_EVENT_CONTROL_TRANSFER_DATA_SENT:
            break;

        default:
            break;
    }
}

void APP_USBDeviceEventHandler(USB_DEVICE_EVENT event, void * eventData, uintptr_t context) {
    USB_DEVICE_EVENT_DATA_CONFIGURED * configurationValue;
    switch (event) {
        case USB_DEVICE_EVENT_SOF:
            appData.idleTicks++;
            break;
        case USB_DEVICE_EVENT_RESET:
        case USB_DEVICE_EVENT_DECONFIGURED:
            appData.isConfigured = false;
            appData.isMouseReportSendBusy = false;
            RedLed_Set();
            appData.state = APP_STATE_WAIT_FOR_CONFIGURATION;
            break;
        case USB_DEVICE_EVENT_CONFIGURED:
            configurationValue = (USB_DEVICE_EVENT_DATA_CONFIGURED *) eventData;
            if (configurationValue->configurationValue == 1) {
                appData.isConfigured = true;
                /* Register the Application HID Event Handler. */
                USB_DEVICE_HID_EventHandlerSet(appData.hidInstance,
                        APP_USBDeviceHIDEventHandler, (uintptr_t) & appData);
            }
            break;
        case USB_DEVICE_EVENT_POWER_DETECTED:
            /* VBUS was detected. We can attach the device */
            appData.powerDetected = true;
            break;
        case USB_DEVICE_EVENT_POWER_REMOVED:
            /* VBUS is not available any more. Detach the device. */
            appData.powerDetected = false;
            USB_DEVICE_Detach(appData.deviceHandle);
            RedLed_Set();
            appData.state = APP_STATE_WAIT_FOR_ATTACH;
            break;
        case USB_DEVICE_EVENT_SUSPENDED:
            break;
        case USB_DEVICE_EVENT_RESUMED:
        case USB_DEVICE_EVENT_ERROR:
        default:
            break;

    }
}

void APP_Initialize(void) {
    appData.state = APP_STATE_INIT;
    appData.deviceHandle = USB_DEVICE_HANDLE_INVALID;
    appData.isConfigured = false;
    appData.hidInstance = 0;
    appData.isMouseReportSendBusy = false;
    appData.powerDetected = USB_VBUS_SENSE_Get();
    appData.attachAllowed = false;
    appData.idleTicks = 0;
    appData.idleRate = 0;
    appData.xCoordinate = 0;
    appData.yCoordinate = 0;
    appData.mouseButton[0] = 0;
    appData.mouseButton[1] = 0;
    previousReport.data[0] = 0xff; //This will not match the first report so a new report will get sent
    mouseStreamHandle = xStreamBufferCreate(5, 1);
}

void MouseTasks(void *pvParameters) {
    while (1) {
        char cmd;
        bool doSend = false;
        if (xStreamBufferReceive(mouseStreamHandle, &cmd, 1, 1) != 0) {
            switch (cmd) {
                case 'w':
                    appData.xCoordinate = 0;
                    appData.yCoordinate = -1;
                    break;
                case 'd':
                    appData.xCoordinate = 1;
                    appData.yCoordinate = 0;
                    break;
                case 'x':
                    appData.xCoordinate = 0;
                    appData.yCoordinate = 1;
                    break;
                case 'a':
                    appData.xCoordinate = -1;
                    appData.yCoordinate = 0;
                    break;
                case 's':
                    appData.xCoordinate = 0;
                    appData.yCoordinate = 0;
                    break;
                case ' ':
                    appData.mouseButton[0] ^= 1;
                    break;
                case '1':
                    appData.attachAllowed = true;
                    break;
                case '2':
                case 'b':
                    appData.attachAllowed = false;
                    if (appData.deviceHandle != USB_DEVICE_HANDLE_INVALID) {
                        USB_DEVICE_Detach(appData.deviceHandle);
                        RedLed_Set();
                        appData.state = APP_STATE_WAIT_FOR_ATTACH;
                    }
                    break;
            }
        }
        switch (appData.state) {
            case APP_STATE_INIT:
            {
                /* Open the device layer */
                appData.deviceHandle = USB_DEVICE_Open(USB_DEVICE_INDEX_0,
                        DRV_IO_INTENT_READWRITE);
                if (appData.deviceHandle != USB_DEVICE_HANDLE_INVALID) {
                    /* Register a callback with device layer to get event notification (for end point 0) */
                    USB_DEVICE_EventHandlerSet(appData.deviceHandle,
                            APP_USBDeviceEventHandler, 0);
                    appData.state = APP_STATE_WAIT_FOR_ATTACH;
                } else {
                    /* The Device Layer is not ready to be opened. We should try
                     * again later. */
                }
                break;
            }
            case APP_STATE_WAIT_FOR_ATTACH:
                if (appData.attachAllowed && appData.powerDetected) {
                    USB_DEVICE_Attach(appData.deviceHandle);
                    appData.state = APP_STATE_WAIT_FOR_CONFIGURATION;
                }
                break;
            case APP_STATE_WAIT_FOR_CONFIGURATION:
                /* Check if the device is configured. The
                 * isConfigured flag is updated in the
                 * Device Event Handler */
                if (appData.isConfigured) {
                    RedLed_Clear();
                    appData.state = APP_STATE_MOUSE_EMULATE;
                }
                break;
            case APP_STATE_MOUSE_EMULATE:
                if (!appData.isMouseReportSendBusy) {
                    doSend = true;
                    MOUSE_ReportCreate(appData.xCoordinate, appData.yCoordinate,
                            appData.mouseButton, &mouseReport);
                    if (memcmp(&mouseReport, &previousReport, sizeof (mouseReport)) == 0) {
                        //report is the same
                        if (appData.xCoordinate == 0 && appData.yCoordinate == 0) {
                            //no move involved
                            if (appData.idleRate == 0) {
                                doSend = false;
                            } else {
                                if (appData.idleTicks < appData.idleRate * 4) {
                                    doSend = false;
                                }
                            }
                        }
                    }
                    memcpy(&previousReport, &mouseReport, sizeof (mouseReport));
                    if (doSend) {
                        appData.isMouseReportSendBusy = true;
                        USB_DEVICE_HID_ReportSend(appData.hidInstance,
                                &appData.reportTransferHandle, (uint8_t*) & mouseReport,
                                sizeof (MOUSE_REPORT));
                        appData.idleTicks = 0;
                    }
                }
                break;
            case APP_STATE_ERROR:
                break;
                /* The default state should never be executed. */
            default:
            {
                break;
            }
        }
    }
}

void MOUSE_ReportCreate
(
        MOUSE_COORDINATE x,
        MOUSE_COORDINATE y,
        MOUSE_BUTTON_STATE * buttonArray,
        MOUSE_REPORT * mouseReport
        ) {
    int index;

    /* Initialize the mouse buttons byte */
    mouseReport->data[0] = 0;

    for (index = 0; index < MOUSE_BUTTON_NUMBERS; index++) {
        /* Create the mouse button bit map */
        mouseReport->data[0] |= buttonArray[index];
    }

    /* Update the x and y co-ordinate */
    mouseReport->data[1] = x;
    mouseReport->data[2] = y;

    return;
}