/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

void tc0Callback(TC_TIMER_STATUS status, uintptr_t context);
void tc1Callback(TC_TIMER_STATUS status, uintptr_t context);

int main(void) {
    bool b1Pressed = 0;
    bool b2Pressed = 0;
    bool b3Pressed = 0;
    char rx;
    /* Initialize all modules */
    SYS_Initialize(NULL);

    printf("SAMduino started\r\n");
    TC0_CH0_TimerCallbackRegister(tc0Callback, (uintptr_t)NULL);
    TC0_CH1_TimerCallbackRegister(tc1Callback, (uintptr_t)NULL);
    TC0_CH0_TimerStart();
    TC0_CH1_TimerStart();
    
    while (true) {
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks();
        if (UART0_ReceiverIsReady()) {
            UART0_Read(&rx, 1);
            switch (rx) {
                case 'g': LED_GREEN_Clear();
                    break;
                case 'm': printf("Message\r\n");
                    break;
            }
        }
        if (BUTTON1_Get() && b1Pressed) {
            LED_GREEN_Set();
            b1Pressed = false;
        }
        if (!BUTTON1_Get() && !b1Pressed) {
            LED_GREEN_Clear();
            b1Pressed = true;
            printf("B1 Pressed\r\n");
        }
        if (BUTTON2_Get() && b2Pressed) {
            LED_RED_Set();
            b2Pressed = false;
        }
        if (!BUTTON2_Get() && !b2Pressed) {
            LED_RED_Clear();
            b2Pressed = true;
            printf("B2 Pressed\r\n");
        }
        if (!BUTTON3_Get() && b3Pressed) {
            LED_GREEN_Set();
            LED_RED_Set();
            b3Pressed = false;
        }
        if (BUTTON3_Get() && !b3Pressed) {
            LED_GREEN_Clear();
            LED_RED_Clear();
            b3Pressed = true;
            printf("Erase Pressed\r\n");
        }
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE);
}

void tc0Callback(TC_TIMER_STATUS status, uintptr_t context) {
    LED_BLUE_Toggle();
}

void tc1Callback(TC_TIMER_STATUS status, uintptr_t context) {
    LED_YELLOW_Toggle();
}
/*******************************************************************************
 End of File
 */

