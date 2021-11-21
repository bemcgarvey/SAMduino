/*******************************************************************************
  MCAN Peripheral Library Interface Header File

  Company:
    Microchip Technology Inc.

  File Name:
    plib_mcan1.h

  Summary:
    MCAN PLIB interface declarations.

  Description:
    The MCAN plib provides a simple interface to manage the MCAN modules on
    Microchip microcontrollers. This file defines the interface declarations
    for the MCAN plib.

  Remarks:
    None.

*******************************************************************************/
//DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
//DOM-IGNORE-END

#ifndef PLIB_MCAN1_H
#define PLIB_MCAN1_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

/*
 * This section lists the other files that are included in this file.
 */
#include <stdbool.h>
#include <string.h>

#include "device.h"
#include "plib_mcan_common.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility
    extern "C" {
#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Data Types
// *****************************************************************************
// *****************************************************************************
/* MCAN1 Message RAM Configuration Size */
#define MCAN1_RX_FIFO0_ELEMENT_SIZE       72U
#define MCAN1_RX_FIFO0_SIZE               144U
#define MCAN1_RX_BUFFER_ELEMENT_SIZE      72U
#define MCAN1_RX_BUFFER_SIZE              144U
#define MCAN1_TX_FIFO_BUFFER_ELEMENT_SIZE 72U
#define MCAN1_TX_FIFO_BUFFER_SIZE         72U
#define MCAN1_TX_EVENT_FIFO_SIZE          8U
#define MCAN1_STD_MSG_ID_FILTER_SIZE      8U
#define MCAN1_EXT_MSG_ID_FILTER_SIZE      16U

/* MCAN1_MESSAGE_RAM_CONFIG_SIZE to be used by application or driver
   for allocating buffer from non-cached contiguous memory */
#define MCAN1_MESSAGE_RAM_CONFIG_SIZE     392U

// *****************************************************************************
// *****************************************************************************
// Section: Interface Routines
// *****************************************************************************
// *****************************************************************************
void MCAN1_Initialize(void);
bool MCAN1_MessageTransmitFifo(uint8_t numberOfMessage, MCAN_TX_BUFFER *txBuffer);
uint8_t MCAN1_TxFifoFreeLevelGet(void);
bool MCAN1_TxBufferIsBusy(uint8_t bufferNumber);
bool MCAN1_TxEventFifoRead(uint8_t numberOfTxEvent, MCAN_TX_EVENT_FIFO *txEventFifo);
uint8_t MCAN1_TxEventFifoFillLevelGet(void);
bool MCAN1_MessageReceive(uint8_t bufferNumber, MCAN_RX_BUFFER *rxBuffer);
bool MCAN1_RxBufferNumberGet(uint8_t* bufferNumber);
bool MCAN1_MessageReceiveFifo(MCAN_RX_FIFO_NUM rxFifoNum, uint8_t numberOfMessage, MCAN_RX_BUFFER *rxBuffer);
uint8_t MCAN1_RxFifoFillLevelGet(MCAN_RX_FIFO_NUM rxFifoNum);
MCAN_ERROR MCAN1_ErrorGet(void);
void MCAN1_ErrorCountGet(uint8_t *txErrorCount, uint8_t *rxErrorCount);
bool MCAN1_InterruptGet(MCAN_INTERRUPT_MASK interruptMask);
void MCAN1_InterruptClear(MCAN_INTERRUPT_MASK interruptMask);
void MCAN1_MessageRAMConfigSet(uint8_t *msgRAMConfigBaseAddress);
bool MCAN1_StandardFilterElementSet(uint8_t filterNumber, mcan_sidfe_registers_t *stdMsgIDFilterElement);
bool MCAN1_StandardFilterElementGet(uint8_t filterNumber, mcan_sidfe_registers_t *stdMsgIDFilterElement);
bool MCAN1_ExtendedFilterElementSet(uint8_t filterNumber, mcan_xidfe_registers_t *extMsgIDFilterElement);
bool MCAN1_ExtendedFilterElementGet(uint8_t filterNumber, mcan_xidfe_registers_t *extMsgIDFilterElement);
void MCAN1_SleepModeEnter(void);
void MCAN1_SleepModeExit(void);
// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility
    }
#endif
// DOM-IGNORE-END

#endif // PLIB_MCAN1_H

/*******************************************************************************
 End of File
*/
