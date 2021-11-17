#include "flash.h"
#include "config/default/definitions.h"
#include "config/default/peripheral/qspi/plib_qspi.h"

bool initFlash(void) {
    
}

bool unlockFlash(void);
bool resetFlash(void);
bool setQuadIO(void);
uint8_t readStatus(void);
uint8_t readConfig(void);
bool writeConfig(uint8_t c);
bool readFlash(int address, uint8_t *buffer, int len);
