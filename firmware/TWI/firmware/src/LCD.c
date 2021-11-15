#include <xc.h>
#include "LCD.h"
#include <stdio.h>
#include <stdarg.h>

//Functions below must be defined for the interface
void LCDWriteByte(char c, char rs);
char LCDReadByte(char rs);
void LCDInitPort(void);
void LCDWrite8(char c, char rs); //Only needed if 4 bit mode is supported

//Private LCD Functions
void LCDCommand(unsigned char command);
void LCDInitCommand(unsigned char command);
void LCDWriteData(char c);
char LCDBusy(void);
char LCDReadData(void);
char LCDGetAC(void);

//Utility functions
unsigned char calculateBase(char line);
void wait(void);
void longDelay(void);
void shortDelay(void);

void LCDInit(void) {
    char functionSet = 0b00111000;
    LCDInitPort();
    __delay_ms(10);
#if LCD_DATA_WIDTH == 4
    LCDWrite8(functionSet, 0);
    __delay_us(40);
    LCDWrite8(functionSet, 0);
    __delay_us(40);
    functionSet = 0b00101000;
    LCDWrite8(functionSet, 0);
    __delay_us(40);
#endif
    LCDInitCommand(functionSet); //Function set
    __delay_us(40);
    LCDInitCommand(0b00001100); //Display on, cursor and blink off
    __delay_us(40);
    LCDInitCommand(0b00000001); //Clear
    __delay_us(1700);
    LCDInitCommand(0b00000110); //Entry mode increment, no shift
    __delay_us(40);
}

void LCDClear(void) {
    LCDCommand(0b00000001);
    longDelay();
}

void LCDPutStr(char *str) {
    while (*str) {
        LCDWriteData(*str);
        ++str;
    }
}

void LCDWriteLine(const char *str, char line) {
    if (line >= LCD_ROWS) {
        return;
    }
    LCDSetPos(line, 0);
    while (*str) {
        if (*str == '\n') {
            ++line;
            if (line == LCD_ROWS) {
                line = 0;
            }
        }
        if (*str == '\r' || *str == '\n') {
            LCDSetPos(line, 0);
        } else {
            LCDWriteData(*str);
        }
        ++str;
    }
}

void LCDClearLine(char line) {
    char c = 0;
    if (line >= LCD_ROWS) {
        return;
    }
    LCDSetPos(line, 0);
    while (c < LCD_CHARS) {
        LCDWriteData(' ');
        ++c;
    }
}

void LCDPutChar(char c) {
    LCDWriteData(c);
}

void LCDSetPos(int row, int col) {
    int pos;
    if (row < 0 || col < 0 || row >= LCD_ROWS || col >= LCD_CHARS) {
        return;
    }
    pos = calculateBase((char)row) + col;
    LCDCommand(128 + (unsigned char)pos);
}

void LCDGetPos(int *row, int *col) {
    char ac;
    ac = LCDGetAC();
    *row = (ac / 64);
    if (LCD_ROWS > 2 && ac % 64 >= 20) {
        ++(*row);
    }
    *col = ac % 64;
    if (LCD_ROWS > 2) {
        *col = *col % 20;
    }
}

void LCDLoadCustomChar(const char *pixels, char pattern) {
    int rows = 8;
    char ac;
    if (pattern < 8) {
        ac = LCDGetAC();
        LCDCommand(64 + (pattern * 8));
        while (rows > 0) {
            LCDWriteData(*pixels);
            ++pixels;
            --rows;
        }
        LCDCommand(128 + ac);
    }
}

void LCDReadLine(char *str, char line) {
    int i;
    if (line >= LCD_ROWS) {
        str[0] = '\0';
        return;
    }
    LCDSetPos(line, 0);
    for (i = 0; i < LCD_CHARS; ++i) {
        str[i] = LCDReadData();
    }
    str[LCD_CHARS] = '\0';
}

char LCDGetChar(void) {
    char c;
    c = LCDReadData();
    return c;
}

void LCDScroll(signed char dir) {
    char str[LCD_CHARS + 1];
    char ac;
    signed char i;
    ac = LCDGetAC();
    if (dir == LCD_SCROLL_UP) {
        for (i = 1; i < LCD_ROWS; ++i) {
            LCDReadLine(str, (char)i);
            LCDWriteLine(str, (char)(i - 1));
        }
        LCDClearLine(LCD_ROWS - 1);
    } else {
        for (i = LCD_ROWS - 2; i >= 0; --i) {
            LCDReadLine(str, (char)i);
            LCDWriteLine(str, (char)(i + 1));
        }
        LCDClearLine(0);
    }
    LCDCommand(128 + ac);
}

void LCDDisplay(char enableDisplay, char enableCursor, char blink) {
    unsigned char command = 0b00001000;
    if (enableDisplay) {
        command |= 0b00000100;
    }
    if (enableCursor) {
        command |= 0b00000010;
    }
    if (blink) {
        command |= 0b00000001;
    }
    LCDCommand(command);
}

int lprintf(int line, const char *format, ...) {
    char str[LCD_CHARS + 1];
    int result;
    va_list args;
    va_start(args, format);
    result = vsnprintf(str, LCD_CHARS + 1, format, args);
    va_end(args);
    LCDClearLine((char)line);
    LCDWriteLine(str, (char)line);
    return result;
}

void LCDCommand(unsigned char command) {
    wait();
    LCDWriteByte(command, 0);
    shortDelay();
}

void LCDInitCommand(unsigned char command) {
    LCDWriteByte(command, 0);
}

void LCDWriteData(char c) {
    wait();
    LCDWriteByte(c, 1);
    shortDelay();
}

char LCDBusy(void) {
    char b;
    b = LCDReadByte(0);
    return (b & 0b10000000) != 0;
}

char LCDReadData(void) {
    char c;
    wait();
    c = LCDReadByte(1);
    shortDelay();
    return c;
}

char LCDGetAC(void) {
    char b;
    wait();
    b = LCDReadByte(0);
    shortDelay();
    return b & 0b01111111;
}

unsigned char calculateBase(char line) {
    char lineBase;
    if (line % 2 == 0) {
        lineBase = line * 10;
    } else {
        lineBase = 54 + line * 10;
    }
    return lineBase;
}

void wait(void) {
#ifdef LCD_POLLING
    while (LCDBusy());
#endif
}

void longDelay(void) {
#ifndef LCD_POLLING
    __delay_us(1660);
#endif
}

void shortDelay(void) {
#ifndef LCD_POLLING
    __delay_us(40);
#endif
}

#define RS_ON   0b00000001
#define RW_ON   0b00000010
#define E_ON    0b00000100
#define E_OFF   0b11111011
#define BACKLIGHT_ON    0b00001000

void LCDInitPort(void) {
//    I2C_TRIS();
//    SSPxADD = BAUD; //100kHz
//    SSPxCON1bits.SSPM = 0b1000;
//    SSPxCON1bits.SSPEN = 1;
//    Nop();
//    SSPxCON2bits.SEN = 1;
//    while (SSPxCON2bits.SEN == 1);
//    SSPxBUF = LCD_I2C_ADDRESS;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = BACKLIGHT_ON;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxCON2bits.PEN = 1;
//    while (SSPxCON2bits.PEN == 1);
}

void LCDWrite8(char c, char rs) {
    unsigned char dataByte;
    unsigned char comFlags = BACKLIGHT_ON;
    if (rs) {
        comFlags |= RS_ON;
    }
//    SSPxCON2bits.SEN = 1;
//    while (SSPxCON2bits.SEN == 1);
//    SSPxBUF = LCD_I2C_ADDRESS;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    dataByte = c & 0b11110000;
//    SSPxBUF = dataByte | E_ON | comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = dataByte | comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxCON2bits.PEN = 1;
//    while (SSPxCON2bits.PEN == 1);
}

void LCDWriteByte(char c, char rs) {
    unsigned char dataByte;
    unsigned char comFlags = BACKLIGHT_ON;
    if (rs) {
        comFlags |= RS_ON;
    }
//    SSPxCON2bits.SEN = 1;
//    while (SSPxCON2bits.SEN == 1);
//    SSPxBUF = LCD_I2C_ADDRESS;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    dataByte = c & 0b11110000;
//    SSPxBUF = dataByte | E_ON | comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = dataByte | comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    dataByte = (c << 4) & 0b11110000;
//    SSPxBUF = dataByte | E_ON | comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = dataByte | comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = BACKLIGHT_ON;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxCON2bits.PEN = 1;
//    while (SSPxCON2bits.PEN == 1);
}

char LCDReadNibble(char rs) {
    char b;
    char comFlags = 0b11111000 | RW_ON;
    if (rs) {
        comFlags |= RS_ON;
    }
//    SSPxCON2bits.SEN = 1; //Start
//    while (SSPxCON2bits.SEN == 1);
//    SSPxBUF = LCD_I2C_ADDRESS;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = comFlags | E_ON;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxCON2bits.RSEN = 1; //restart
//    while (SSPxCON2bits.RSEN == 1);
//    SSPxBUF = LCD_I2C_ADDRESS | 1;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxCON2bits.RCEN = 1;
//    while (SSPxSTATbits.BF == 0); //Wait for byte
//    b = SSPxBUF & 0b11110000; //Upper nibble
//    SSPxCON2bits.ACKDT = 1;
//    SSPxCON2bits.ACKEN = 1; //Send NACK
//    while (SSPxCON2bits.ACKEN == 1);
//    SSPxCON2bits.RSEN = 1; //restart
//    while (SSPxCON2bits.RSEN == 1);
//    SSPxBUF = LCD_I2C_ADDRESS;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxBUF = comFlags;
//    while (SSPxSTATbits.BF || SSPxSTATbits.R_W);
//    SSPxCON2bits.PEN = 1; //stop
//    while (SSPxCON2bits.PEN == 1);
    return b;
}

char LCDReadByte(char rs) {
    unsigned char ub;
    unsigned char lb;
    ub = LCDReadNibble(rs);
    lb = LCDReadNibble(rs);
    return ub | (lb >> 4);
}

