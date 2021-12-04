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
#define BUFFER_SIZE (10 * 1024)
uint32_t __attribute__ ((aligned(32))) sourceBuffer[BUFFER_SIZE];
uint32_t __attribute__ ((aligned(32))) destBuffer[BUFFER_SIZE];
char txBuffer[1024];
char rxBuffer[11];

int _mon_getc(int canblock);

//Notes:
//  RAM is accessible through DMA Interface Bus 0 or 1
//  Peripherals are only accessible through DMA Interface Bus 1
//  Cache cleans and invalidates are mandatory

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );

    while ( true )
    {
        printf("\r\nDMA Demo starting\r\n");
        printf("Enter any key to start memory to memory transfer\r\n");
        _mon_getc(true);
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
        printf("Any key to start memory to peripheral test\r\n");
        _mon_getc(true);
        printf("Filling buffer with text\r\n");
        for (int i = 0; i < sizeof(txBuffer); ++i) {
            txBuffer[i] = 'a' + (i % 26);
        }
        SYS_CACHE_CleanDCache_by_Addr((uint32_t *)txBuffer, sizeof(txBuffer));
        printf("Beginning transfer to UART0 tx\r\n");
        XDMAC_ChannelTransfer(XDMAC_CHANNEL_1, txBuffer, (void *)(&(UART0_REGS->UART_THR)), sizeof(txBuffer));
        while (XDMAC_ChannelIsBusy(XDMAC_CHANNEL_1));
        printf("r\n\r\nTransfer complete - any key to continue\r\n");
        _mon_getc(true);
        printf("Beginning UART0 to memory transfer.  Type %d characters\r\n", sizeof(rxBuffer) - 1);
        XDMAC_ChannelTransfer(XDMAC_CHANNEL_2, (void *)(&(UART0_REGS->UART_RHR)), rxBuffer, sizeof(rxBuffer) - 1);
        while (XDMAC_ChannelIsBusy(XDMAC_CHANNEL_2));
        rxBuffer[sizeof(rxBuffer) - 1] = '\0';
        SYS_CACHE_InvalidateDCache_by_Addr((uint32_t *)rxBuffer, sizeof(rxBuffer));
        printf("Transfer complete - %s\r\n", rxBuffer);
        printf("Any key to repeat\r\n");
        _mon_getc(true);
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}

/*******************************************************************************
 End of File
*/

