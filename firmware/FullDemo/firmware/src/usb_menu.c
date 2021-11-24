
#include "usb_menu.h"
#include "definitions.h"
#include "basic_tasks.h"
#include <stdbool.h>

void usbMenu(void) {
    bool done = false;
    while (!done) {
        printf("  High speed USB mouse emulation\r\n");
        printf("     1) Attach USB\r\n");
        printf("     2) Detach USB\r\n");
        printf("     Use a, w, s, d, and x to move mouse\r\n");
        printf("        space for left button\r\n");
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
                    case '1':
                        
                        break;
                    case '2':
                        
                        break;
                    case 'm':
                        repeatMenu = true;
                        break;
                    case 'b':
                        return;
                }
            }
        }
    }
}