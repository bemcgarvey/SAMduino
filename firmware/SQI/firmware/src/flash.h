/* 
 * File:   flash.h
 * Author: bemcg
 *
 * Created on November 17, 2021, 2:02 PM
 */

#ifndef FLASH_H
#define	FLASH_H

#ifdef	__cplusplus
extern "C" {
#endif

    bool initFlash(void);
    bool unlockFlash(void);
    bool resetFlash(void);
    bool setQuadIO(void);
    uint8_t readStatus(void);
    uint8_t readConfig(void);
    bool writeConfig(uint8_t c);
    bool readFlash(int address, uint8_t *buffer, int len);



#ifdef	__cplusplus
}
#endif

#endif	/* FLASH_H */

