
#include "twi.h"
#include "definitions.h"
#include "basic_tasks.h"
#include "lcd.h"
#include <stdbool.h>

void twiMenu(void) {
    bool done = false;
    LCDInit();
    while (!done) {
        printf("  TWI(I2C) with LCD\r\n");
        printf("     1) Write to LCD line 0\r\n");
        printf("     2) Write to LCD line 1\r\n");
        printf("     3) Clear LCD\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & UART_RX_BIT) {
                uint8_t rx;
                UART0_Read(&rx, 1);
                switch (rx) {
                    case '1': lprintf(0, "This is line 0");
                        break;
                    case '2': lprintf(1, "Hello line 1");
                        break;
                    case '3': LCDClear();
                        break;
                    case 'm': repeatMenu = true;
                        break;
                    case 'b':
                        return;
                }
            }
        }
    }
}
