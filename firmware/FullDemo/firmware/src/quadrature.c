#include "quadrature.h"
#include "definitions.h"
#include "basic_tasks.h"

static void readQuad(void);

void quadratureMenu(void) {
    bool done = false;
    while (!done) {
        printf("  Quadrature Decoder\r\n");
        printf("     1) Read position\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & UART_RX_BIT) {
                switch (rx) {
                    case '1': readQuad();
                        repeatMenu = true;
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

void readQuad(void) {
    int position;
    printf("    Starting quadrature decoder - esc to quit, click to zero\r\n");
    TC0_QuadratureStart();
    position = TC0_QuadraturePositionGet();  //Will be last position but will become 0 as soon as turned
    printf("\rPosition = %-5d", 0);
    RedLed_Clear();
    while (1) {
        EventBits_t uxBits;
        uxBits = xEventGroupWaitBits(menuEventGroup
                , UART_RX_BIT
                , pdTRUE, pdFALSE, 1);
        if (uxBits & UART_RX_BIT) {
            switch (rx) {
                case 27: //esc key
                    TC0_QuadratureStop();
                    RedLed_Set();
                    printf("\r\n");
                    return;
            }
        }
        if ((TC0_QuadratureStatusGet() & TC_QUADRATURE_INDEX) == true) {
            position = TC0_QuadraturePositionGet();
            printf("\rPosition = %-5d", 0);
        } else {
            int newPos = TC0_QuadraturePositionGet();
            if (newPos != position) {
                position = newPos;
                printf("\rPosition = %-5d", position);
            }
        }
    }
}