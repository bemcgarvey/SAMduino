
#include "basic_tasks.h"
#include "definitions.h"
#include "flash.h"
#include "can.h"
#include "twi.h"
#include <ctype.h>

//task functions
void blinkTask(void *pvParameters);
void menuTask(void *pvParameters);
void uart0RxTask(void *pvParameters);

//handles
EventGroupHandle_t menuEventGroup;

//other functions
static void mainMenu(void);
static void buttonsAndLEDs(void);

//ISR callbacks
void buttonIntCallback(PIO_PIN pin, uintptr_t context);

//prototype from xc32_monitor.c - needed for echo
void _mon_putc(char c);

void setupBasicTasks(void) {
    //Register callbacks
    PIO_PinInterruptCallbackRegister(LeftButton_PIN, buttonIntCallback, 0);
    PIO_PinInterruptCallbackRegister(RightButton_PIN, buttonIntCallback, 0);
    PIO_PinInterruptEnable(LeftButton_PIN);
    PIO_PinInterruptEnable(RightButton_PIN);
    //Create tasks
    xTaskCreate(blinkTask, "blink", configMINIMAL_STACK_SIZE, (void *) NULL, 1, NULL);
    xTaskCreate(menuTask, "menu", configMINIMAL_STACK_SIZE + 2048, (void *) NULL, 2, NULL);
    xTaskCreate(uart0RxTask, "uartRx", configMINIMAL_STACK_SIZE, (void *) NULL, 1, NULL);
    //Create other object
    menuEventGroup = xEventGroupCreate();
}

void blinkTask(void *pvParameters) {
    (void) pvParameters;
    while (1) {
        YellowLed_Toggle();
        vTaskDelay(1000);
    }
}

void mainMenu(void) {
    printf("\r\n\r\nMain Menu\r\n");
    printf("    1) Buttons and LEDs\r\n");
    printf("    2) Flash Memory\r\n");
    printf("    3) CAN-FD\r\n");
    printf("    4) TWI LCD display\r\n");
    printf("    5) USB\r\n");
    printf("    6) Analog - ADC and DAC\r\n");
    printf("    7) True Random Number Generator\r\n");
    printf("    8) SPI?\r\n");
    printf("    9) Real time clock\r\n");
}

void menuTask(void *pvParameters) {
    (void) pvParameters;
    bool redrawMenu = true;
    vTaskDelay(100);
    while (1) {
        if (redrawMenu) {
            mainMenu();
        }
        redrawMenu = true;
        EventBits_t uxBits;
        uxBits = xEventGroupWaitBits(menuEventGroup, UART_RX_BIT, pdTRUE, pdFALSE, portMAX_DELAY);
        xEventGroupClearBits(menuEventGroup, uxBits);
        uint8_t rx;
        UART0_Read(&rx, 1);
        switch (rx) {
            case '1': buttonsAndLEDs();
                break;
            case '2': flashMenu();
                break;
            case '3': canMenu();
                break;
            case '4': twiMenu();
                break;
            case '7': printf("  **Random number generated = %lu\r\n", TRNG_ReadData());
                redrawMenu = false;
                break;
            default:
                break;
        }
    }
}

void buttonsAndLEDs(void) {
    bool done = false;
    while (!done) {
        printf("  Buttons and LEDs - Press a button or\r\n");
        printf("     1) Toggle green LED\r\n");
        printf("     2) Blue LED on\r\n");
        printf("     3) Blue LED off\r\n");
        printf("     m) This menu\r\n");
        printf("     b) Back to main menu\r\n");
        bool repeatMenu = false;
        while (!repeatMenu) {
            EventBits_t uxBits;
            uxBits = xEventGroupWaitBits(menuEventGroup
                    , UART_RX_BIT | LEFT_BUTTON_BIT | RIGHT_BUTTON_BIT
                    , pdTRUE, pdFALSE, portMAX_DELAY);
            if (uxBits & LEFT_BUTTON_BIT) {
                printf("    ***Left Button Pressed\r\n");
            } else if (uxBits & RIGHT_BUTTON_BIT) {
                printf("    Right Button Pressed***\r\n");
            } else if (uxBits & UART_RX_BIT) {
                uint8_t rx;
                UART0_Read(&rx, 1);
                switch (rx) {
                    case '1': GreenLed_Toggle();
                        break;
                    case '2': BlueLed_Clear();
                        break;
                    case '3': BlueLed_Set();
                        break;
                    case 'm': repeatMenu = true;
                        break;
                    case 'b': return;
                        break;
                }
            }
        }
    }
}

void buttonIntCallback(PIO_PIN pin, uintptr_t context) {
    //This is in the ISR context
    if (pin == LeftButton_PIN) {
        BaseType_t xHigherPriorityTaskWoken, xResult;
        xHigherPriorityTaskWoken = pdFALSE;
        xResult = xEventGroupSetBitsFromISR(menuEventGroup, LEFT_BUTTON_BIT, &xHigherPriorityTaskWoken);
        if (xResult != pdFAIL) {
            portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
        }
    }
    if (pin == RightButton_PIN) {
        BaseType_t xHigherPriorityTaskWoken, xResult;
        xHigherPriorityTaskWoken = pdFALSE;
        xResult = xEventGroupSetBitsFromISR(menuEventGroup, RIGHT_BUTTON_BIT, &xHigherPriorityTaskWoken);
        if (xResult != pdFAIL) {
            portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
        }
    }
}

void uart0RxTask(void *pvParameters) {
    while (1) {
        while (!UART0_ReceiverIsReady()) {
            vTaskDelay(10);
        }
        xEventGroupSetBits(menuEventGroup, UART_RX_BIT);
    }
}

int getStr(const char *prompt, char *buffer, int maxLen) {
    EventBits_t uxBits;
    int len = 0;
    bool done = false;
    if (prompt) {
        printf(prompt);
    }
    do {
        uxBits = xEventGroupWaitBits(menuEventGroup
                , UART_RX_BIT
                , pdTRUE, pdFALSE, portMAX_DELAY);
        if (uxBits & UART_RX_BIT) {
            uint8_t rx;
            UART0_Read(&rx, 1);
            if (rx == '\r' || rx == '\n') {
                done = true;
            } else if ((rx == '\b' || rx == 0x7f) && len > 0) {
                _mon_putc(0x7f);
                --buffer;
                --len;
            } else if (isprint(rx)) {
                _mon_putc(rx);
                *buffer = rx;
                ++buffer;
                ++len;
                if (len == maxLen - 1) {
                    done = true;
                }
            }
        }
    } while (!done);
    *buffer = '\0';
    printf("\r\n");
    return len;
}