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
#define BTL_TRIGGER_RAM_START   0x20400000
static uint32_t *ramStart = (uint32_t *) BTL_TRIGGER_RAM_START;


//Function at non-contiguous memory location to test bootloaders
int __attribute__((address(0x41A000))) calculate(void) {
    int i;
    int sum = 0;
    for (i = 0; i < 345; ++i) {
        sum += i;
    }
    return sum;
}

//A simple application to demonstrate firmware bootload trigger
//Must set Application Start Address to 0x4040000 in Harmony Project | linker config
// and disable programming fuses
int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    LED_Clear();
    SYSTICK_TimerStart();
    while ( true )
    {
        SYSTICK_DelayMs(1000);
        LED_Toggle();
        if (Boot_Get() == 0) {
            ramStart[0] = 0x12345678;
            ramStart[1] = 0x98765432;
            DCACHE_CLEAN();  //Essential
            NVIC_SystemReset();
        }
        int result = calculate();
        result = result + 10;
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

