/*******************************************************************************
  XDMAC PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_xdmac.c

  Summary:
    XDMAC PLIB Implementation File

  Description:
    None

*******************************************************************************/

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

#include "device.h"
#include "plib_xdmac.h"
#include "interrupts.h"

/* Macro for limiting XDMAC objects to highest channel enabled */
#define XDMAC_ACTIVE_CHANNELS_MAX 1


typedef struct
{
    uint8_t                inUse;
    uintptr_t              context;
    uint8_t                busyStatus;

} XDMAC_CH_OBJECT ;

XDMAC_CH_OBJECT xdmacChannelObj[XDMAC_ACTIVE_CHANNELS_MAX];

// *****************************************************************************
// *****************************************************************************
// Section: XDMAC Implementation
// *****************************************************************************
// *****************************************************************************

void XDMAC_Initialize( void )
{
    XDMAC_CH_OBJECT *xdmacChObj = (XDMAC_CH_OBJECT *)&xdmacChannelObj[0];
    uint8_t channel = 0U;

    /* Initialize channel objects */
    for(channel = 0U; channel < XDMAC_ACTIVE_CHANNELS_MAX; channel++)
    {
        xdmacChObj->inUse = 0U;
        xdmacChObj->context = 0U;
        xdmacChObj->busyStatus = false;

        /* Point to next channel object */
        xdmacChObj += 1U;
    }

    /* Configure Channel 0 */
    XDMAC_REGS->XDMAC_CHID[0].XDMAC_CC =  (XDMAC_CC_TYPE_MEM_TRAN |
                                            XDMAC_CC_DAM_INCREMENTED_AM |
                                            XDMAC_CC_SAM_INCREMENTED_AM |
                                            XDMAC_CC_SIF_AHB_IF0 |
                                            XDMAC_CC_DIF_AHB_IF0 |
                                            XDMAC_CC_DWIDTH_WORD |
                                            XDMAC_CC_MBSIZE_SIXTEEN);
                XDMAC_REGS->XDMAC_CHID[0].XDMAC_CIE= (XDMAC_CIE_BIE_Msk | XDMAC_CIE_RBIE_Msk | XDMAC_CIE_WBIE_Msk | XDMAC_CIE_ROIE_Msk);
                xdmacChannelObj[0].inUse = 1U;

    return;
}


bool XDMAC_ChannelTransfer( XDMAC_CHANNEL channel, const void *srcAddr, const void *destAddr, size_t blockSize )
{
    volatile uint32_t status = 0U;
    bool returnStatus = false;

    if ((xdmacChannelObj[channel].busyStatus == false) || ((XDMAC_REGS->XDMAC_GS & (XDMAC_GS_ST0_Msk << channel)) == 0))
    {
        /* Clear channel level status before adding transfer parameters */
        status = XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CIS;
        (void)status;

        xdmacChannelObj[channel].busyStatus = true;

        /*Set source address */
        XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CSA= (uint32_t)srcAddr;

        /* Set destination address */
        XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CDA= (uint32_t)destAddr;

        /* Set block size */
        XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CUBC= XDMAC_CUBC_UBLEN(blockSize);

        /* Make sure all memory transfers are completed before enabling the DMA */
        __DMB();

        /* Enable the channel */
        XDMAC_REGS->XDMAC_GE= (XDMAC_GE_EN0_Msk << channel);

        returnStatus = true;
    }

    return returnStatus;
}

bool XDMAC_ChannelIsBusy (XDMAC_CHANNEL channel)
{
    if (xdmacChannelObj[channel].busyStatus == true && (XDMAC_REGS->XDMAC_GS & (XDMAC_GS_ST0_Msk << channel)))
    {
        return true;
    }
    else
    {
        return false;
    }
}

XDMAC_TRANSFER_EVENT XDMAC_ChannelTransferStatusGet(XDMAC_CHANNEL channel)
{
    uint32_t chanIntStatus;

    XDMAC_TRANSFER_EVENT xdmacTransferStatus = XDMAC_TRANSFER_NONE;

    /* Read the interrupt status for the requested DMA channel */
    chanIntStatus = XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CIS;

    if (chanIntStatus & ( XDMAC_CIS_RBEIS_Msk | XDMAC_CIS_WBEIS_Msk | XDMAC_CIS_ROIS_Msk))
    {
        xdmacTransferStatus = XDMAC_TRANSFER_ERROR;
    }
    else if (chanIntStatus & XDMAC_CIS_BIS_Msk)
    {
        xdmacTransferStatus = XDMAC_TRANSFER_COMPLETE;
    }

    return xdmacTransferStatus;
}

void XDMAC_ChannelDisable (XDMAC_CHANNEL channel)
{
    /* Disable the channel */
    XDMAC_REGS->XDMAC_GD = (XDMAC_GD_DI0_Msk << channel);
    xdmacChannelObj[channel].busyStatus = false;
    return;
}

XDMAC_CHANNEL_CONFIG XDMAC_ChannelSettingsGet (XDMAC_CHANNEL channel)
{
    return (XDMAC_CHANNEL_CONFIG)XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CC;
}

bool XDMAC_ChannelSettingsSet (XDMAC_CHANNEL channel, XDMAC_CHANNEL_CONFIG setting)
{
    /* Disable the channel */
    XDMAC_REGS->XDMAC_GD= (XDMAC_GD_DI0_Msk << channel);

    /* Set the new settings */
    XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CC= setting;

    return true;
}

void XDMAC_ChannelBlockLengthSet (XDMAC_CHANNEL channel, uint16_t length)
{
    /* Disable the channel */
    XDMAC_REGS->XDMAC_GD= (XDMAC_GD_DI0_Msk << channel);

    XDMAC_REGS->XDMAC_CHID[channel].XDMAC_CBC = length;
}

void XDMAC_ChannelSuspend (XDMAC_CHANNEL channel)
{
    /* Suspend the channel */
    XDMAC_REGS->XDMAC_GRWS = (XDMAC_GRWS_RWS0_Msk << channel);
}

void XDMAC_ChannelResume (XDMAC_CHANNEL channel)
{
    /* Resume the channel */
    XDMAC_REGS->XDMAC_GRWR = (XDMAC_GRWR_RWR0_Msk << channel);
}