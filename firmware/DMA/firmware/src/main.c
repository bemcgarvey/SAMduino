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
#include <string.h>

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
#define BUFFER_SIZE (40 * 1024)
uint32_t __attribute__ ((aligned(32))) sourceBuffer[BUFFER_SIZE];
uint32_t __attribute__ ((aligned(32))) destBuffer[BUFFER_SIZE];

//volatile bool dmaDone = false;

//void dmaCallback(XDMAC_TRANSFER_EVENT event, uintptr_t contextHandle);
int _mon_getc(int canblock);

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );

    while ( true )
    {
        printf("\r\nDMA Demo starting\r\n");
        //XDMAC_ChannelCallbackRegister(XDMAC_CHANNEL_0, dmaCallback, (uintptr_t) NULL);
        printf("Generating random data\r\n");
        srand(TRNG_ReadData());
        for (int i = 0; i < BUFFER_SIZE; ++i) {
            sourceBuffer[i] = rand();
            destBuffer[i] = 0;
        }
        printf("Transferring data to destination\r\n");
        SYS_CACHE_CleanDCache_by_Addr(sourceBuffer, sizeof(sourceBuffer));
        SYS_CACHE_CleanDCache_by_Addr(destBuffer, sizeof(destBuffer));
        XDMAC_ChannelTransfer(XDMAC_CHANNEL_0, sourceBuffer, destBuffer, BUFFER_SIZE);
        while (XDMAC_ChannelIsBusy(XDMAC_CHANNEL_0));
        printf("Transfer complete.  Verifying\r\n");
        SYS_CACHE_InvalidateDCache_by_Addr(destBuffer, sizeof(destBuffer));
        if (memcmp(sourceBuffer, destBuffer, sizeof(sourceBuffer)) == 0) {
            printf("Destination matches source\r\n");
            printf("Random spot check:\r\n");
            for (int i = 0; i < 10; ++i) {
                int pos = rand() % BUFFER_SIZE;
                printf("source[%5d] = %10lu dest[%5d] = %10lu\r\n", pos, sourceBuffer[pos], pos, destBuffer[pos]);
            }
        } else {
            printf("Memory mismatch\r\n");
        }
        printf("Any key to restart\r\n");
        _mon_getc(true);
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}

//void dmaCallback(XDMAC_TRANSFER_EVENT event, uintptr_t contextHandle) {
//    if (event == XDMAC_TRANSFER_COMPLETE) {
//        dmaDone = true;
//    } else if (event == XDMAC_TRANSFER_ERROR) {
//        printf("Transfer error\r\n");
//    }
//}

/*******************************************************************************
 End of File
*/

