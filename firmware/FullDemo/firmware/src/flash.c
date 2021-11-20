#include "flash.h"
#include "definitions.h"
#include "basic_tasks.h"
#include "driver/sst26/drv_sst26.h"
#include <stdlib.h>

static DRV_HANDLE handle;
void initFlash(void);
void readFlash(void);
void writeFlash(void);
void eraseSector(void);
void readID(void);
void chipErase(void);

void flashMenu(void) {
    bool done = false;
    initFlash();
    while (!done) {
        printf("  SQI Flash Memory\r\n");
        printf("     1) Read string from memory\r\n");
        printf("     2) Write string to memory (page write)\r\n");
        printf("     3) Erase sector\r\n");
        printf("     4) Erase chip\r\n");
        printf("     5) Read Jedec ID\r\n");
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
                    case '1': readFlash();
                        break;
                    case '2': writeFlash();
                        break;
                    case '3': eraseSector();
                        break;
                    case '4': chipErase();
                        break;
                    case '5': readID();
                        break;
                    case 'm': repeatMenu = true;
                        break;
                    case 'b': DRV_SST26_Close(handle);
                        return;
                        break;
                }
            }
        }
    }
}

void initFlash(void) {
    while (DRV_SST26_Status(DRV_SST26_INDEX) != SYS_STATUS_READY) {
        vTaskDelay(10);
    }
    handle = DRV_SST26_Open(DRV_SST26_INDEX, DRV_IO_INTENT_READWRITE);
    if (handle == DRV_HANDLE_INVALID) {
        printf("    *****Invalid Handle\r\n");
    }
}

void chipErase(void) {
    if (DRV_SST26_ChipErase(handle) == false) {
        printf("    *****Erase failed\r\n");
    } else {
        while (DRV_SST26_TRANSFER_BUSY == DRV_SST26_TransferStatusGet(handle));
        printf("    ***Chip Erased***\r\n");
    }
}

void readFlash(void) {
    char str[256];
    getStr("Address: 0x", str, 256);
    int address = strtol(str, NULL, 16);
    if (DRV_SST26_Read(handle, str, 255, address)) {
        str[255] = '\0';
        printf("Read: %s\r\n", str);
    } else {
        printf("    *****Read Error*****\r\n");
    }
}

void readID(void) {
    uint8_t id[3];
    DRV_SST26_ReadJedecId(handle, id);
    printf("    ID:%02x %02x %02x\r\n", id[0], id[1], id[2]);
}

void writeFlash(void) {
    char str[256];
    getStr("Address: 0x", str, 256);
    int address = strtol(str, NULL, 16);
    getStr("String to write: ", str, 256);
    address &= 0x007fff00;
    printf("    Writing to address 0x%06x\r\n", address);
    if (!DRV_SST26_PageWrite(handle, str, address)) {
        printf("    *****Write Error*****\r\n");
    } else {
        while (DRV_SST26_TRANSFER_BUSY == DRV_SST26_TransferStatusGet(handle));
        printf("    Write complete\r\n");
    }
}

void eraseSector(void) {
    char str[20];
    getStr("Address: 0x", str, 12);
    int address = strtol(str, NULL, 16);
    address &= 0x007ff000;
    printf("    Erasing sector 0x%06x\r\n", address);
    if(!DRV_SST26_SectorErase(handle, address))
    {
        printf("    *****Erase failed\r\n");
    } else {
        while (DRV_SST26_TRANSFER_BUSY == DRV_SST26_TransferStatusGet(handle));
        printf("    ***Sector Erased***\r\n");
    }
}