;/**
; ***************************************************************************
; * @file:    startup_TMPM365.s
; * @brief    CMSIS Cortex-M3 Core Device Startup File for the
; *           TOSHIBA 'TMPM365' Device Series 
; * @version  V2.0.2.1 (Tentative)
; * @date     2012/7/09
; * 
; * THE SOURCE CODE AND ITS RELATED DOCUMENTATION IS PROVIDED "AS IS". TOSHIBA
; * CORPORATION MAKES NO OTHER WARRANTY OF ANY KIND, WHETHER EXPRESS, IMPLIED OR,
; * STATUTORY AND DISCLAIMS ANY AND ALL IMPLIED WARRANTIES OF MERCHANTABILITY,
; * SATISFACTORY QUALITY, NON INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
; * 
; * THE SOURCE CODE AND DOCUMENTATION MAY INCLUDE ERRORS. TOSHIBA CORPORATION
; * RESERVES THE RIGHT TO INCORPORATE MODIFICATIONS TO THE SOURCE CODE IN LATER
; * REVISIONS OF IT, AND TO MAKE IMPROVEMENTS OR CHANGES IN THE DOCUMENTATION OR
; * THE PRODUCTS OR TECHNOLOGIES DESCRIBED THEREIN AT ANY TIME.
; * 
; * TOSHIBA CORPORATION SHALL NOT BE LIABLE FOR ANY DIRECT, INDIRECT OR
; * CONSEQUENTIAL DAMAGE OR LIABILITY ARISING FROM YOUR USE OF THE SOURCE CODE OR
; * ANY DOCUMENTATION, INCLUDING BUT NOT LIMITED TO, LOST REVENUES, DATA OR
; * PROFITS, DAMAGES OF ANY SPECIAL, INCIDENTAL OR CONSEQUENTIAL NATURE, PUNITIVE
; * DAMAGES, LOSS OF PROPERTY OR LOSS OF PROFITS ARISING OUT OF OR IN CONNECTION
; * WITH THIS AGREEMENT, OR BEING UNUSABLE, EVEN IF ADVISED OF THE POSSIBILITY OR
; * PROBABILITY OF SUCH DAMAGES AND WHETHER A CLAIM FOR SUCH DAMAGE IS BASED UPON
; * WARRANTY, CONTRACT, TORT, NEGLIGENCE OR OTHERWISE.
; * 
; * (C)Copyright TOSHIBA CORPORATION 2012 All rights reserved
; *****************************************************************************
; */
;
; The modules in this file are included in the libraries, and may be replaced
; by any user-defined modules that define the PUBLIC symbol _program_start or
; a user defined start symbol.
; To override the cstartup defined in the library, simply add your modified
; version to the workbench project.
;
; Cortex-M version
;

                MODULE  ?cstartup

                ;; Forward declaration of sections.
                SECTION CSTACK:DATA:NOROOT(3)

                SECTION .intvec:CODE:NOROOT(2)

                EXTERN  __iar_program_start
                EXTERN  SystemInit
                PUBLIC  __vector_table

                DATA
__vector_table  DCD     sfe(CSTACK)
                DCD     Reset_Handler

                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
                DCD     INT0_IRQHandler           ; 0:  Interrupt pin 0
                DCD     INT1_IRQHandler           ; 1:  Interrupt pin 1
                DCD     INT2_IRQHandler           ; 2:  Interrupt pin 2
                DCD     INT3_IRQHandler           ; 3:  Interrupt pin 3
                DCD     INT4_IRQHandler           ; 4:  Interrupt pin 4
                DCD     INT5_IRQHandler           ; 5:  Interrupt pin 5
                DCD     INT6_IRQHandler           ; 6:  Interrupt pin 6
                DCD     INT7_IRQHandler           ; 7:  Interrupt pin 7
                DCD     INTRX0_IRQHandler         ; 8:  Serial reception (channel.0)
                DCD     INTTX0_IRQHandler         ; 9:  Serial transmission (channel.0)
                DCD     INTRX1_IRQHandler         ; 10: Serial reception (channel.1)
                DCD     INTTX1_IRQHandler         ; 11: Serial transmission (channel.1)
                DCD     INTUSBWKUP_IRQHandler     ; 12: USB WakeUp 
                DCD     0                         ; 13: Reserved    
                DCD     INTSBI0_IRQHandler        ; 14: Serial bus interface 0
                DCD     INTSBI1_IRQHandler        ; 15: Serial bus interface 1
                DCD     INTADHP_IRQHandler        ; 16: Highest priority AD conversion complete interrupt
                DCD     INTAD_IRQHandler          ; 17: AD conversion interrupt             
                DCD     INTADM0_IRQHandler        ; 18: AD conversion monitoring function interrupt 0
                DCD     INTADM1_IRQHandler        ; 19: AD conversion monitoring function interrupt 1
                DCD     INTTB0_IRQHandler         ; 20: 16-bit TMRB match detection 0
                DCD     INTTB1_IRQHandler         ; 21: 16-bit TMRB match detection 1
                DCD     INTTB2_IRQHandler         ; 22: 16-bit TMRB match detection 2
                DCD     INTTB3_IRQHandler         ; 23: 16-bit TMRB match detection 3
                DCD     INTTB4_IRQHandler         ; 24: 16-bit TMRB match detection 4
                DCD     INTTB5_IRQHandler         ; 25: 16-bit TMRB match detection 5
                DCD     INTTB6_IRQHandler         ; 26: 16-bit TMRB match detection 6
                DCD     INTTB7_IRQHandler         ; 27: 16-bit TMRB match detection 7
                DCD     INTTB8_IRQHandler         ; 28: 16-bit TMRB match detection 8
                DCD     INTTB9_IRQHandler         ; 29: 16-bit TMRB match detection 9
                DCD     INTUSB_IRQHandler         ; 30: USB Interrupt
                DCD     0                         ; 31: Reserved  
                DCD     0                         ; 32: Reserved  
                DCD     0                         ; 33: Reserved  
                DCD     INTUSBPON_IRQHandler      ; 34: USB Power On connection detectioninterrupt
                DCD     0                         ; 35: Reserved
                DCD     INTCAP00_IRQHandler       ; 36: 16-bit TMRB0 input capture 0
                DCD     INTCAP01_IRQHandler       ; 37: 16-bit TMRB0 input capture 1
                DCD     INTCAP10_IRQHandler       ; 38: 16-bit TMRB1 input capture 0
                DCD     INTCAP11_IRQHandler       ; 39: 16-bit TMRB1 input capture 1
                DCD     INTCAP20_IRQHandler       ; 40: 16-bit TMRB2 input capture 0
                DCD     INTCAP21_IRQHandler       ; 41: 16-bit TMRB2 input capture 1  
                DCD     INTCAP30_IRQHandler       ; 42: 16-bit TMRB3 input capture 0
                DCD     INTCAP31_IRQHandler       ; 43: 16-bit TMRB3 input capture 1
                DCD     INTCAP40_IRQHandler       ; 44: 16-bit TMRB4 input capture 0
                DCD     INTCAP41_IRQHandler       ; 45: 16-bit TMRB4 input capture 1
                DCD     INTCAP50_IRQHandler       ; 46: 16-bit TMRB5 input capture 0
                DCD     INTCAP51_IRQHandler       ; 47: 16-bit TMRB5 input capture 1
                DCD     INTCAP60_IRQHandler       ; 48: 16-bit TMRB6 input capture 0
                DCD     INTCAP61_IRQHandler       ; 49: 16-bit TMRB6 input capture 1  
                DCD     INTCAP70_IRQHandler       ; 50: 16-bit TMRB7 input capture 0
                DCD     INTCAP71_IRQHandler       ; 51: 16-bit TMRB7 input capture 1
                DCD     INTCAP80_IRQHandler       ; 52: 16-bit TMRB8 input capture 0
                DCD     INTCAP81_IRQHandler       ; 53: 16-bit TMRB8 input capture 1
                DCD     INTCAP90_IRQHandler       ; 54: 16-bit TMRB9 input capture 0
                DCD     INTCAP91_IRQHandler       ; 55: 16-bit TMRB9 input capture 1 
                DCD     INT8_IRQHandler           ; 56: Interrupt pin 8
                DCD     INT9_IRQHandler           ; 57: Interrupt pin 9                
                DCD     0                         ; 58: Reserved  
                DCD     0                         ; 59: Reserved                                                               
                DCD     INTDMAC0TC_IRQHandler     ; 60: DMA terminal count status interrupt 0
                DCD     INTABTLOSS0_IRQHandler    ; 61: I2C arbitration lost interrupt 0
                DCD     INTDMAC0ERR_IRQHandler    ; 62: DMA error status interrupt 0
                DCD     INTABTLOSS1_IRQHandler    ; 63: I2C arbitration lost interrupt 1
                
                THUMB
; Dummy Exception Handlers (infinite loops which can be modified)

                PUBWEAK Reset_Handler
                SECTION .text:CODE:REORDER(2)
Reset_Handler
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__iar_program_start
                BX      R0

                PUBWEAK NMI_Handler
                SECTION .text:CODE:REORDER(1)
NMI_Handler
                B       NMI_Handler

                PUBWEAK HardFault_Handler
                SECTION .text:CODE:REORDER(1)
HardFault_Handler
                B       HardFault_Handler

                PUBWEAK MemManage_Handler
                SECTION .text:CODE:REORDER(1)
MemManage_Handler
                B       MemManage_Handler

                PUBWEAK BusFault_Handler
                SECTION .text:CODE:REORDER(1)
BusFault_Handler
                B       BusFault_Handler

                PUBWEAK UsageFault_Handler
                SECTION .text:CODE:REORDER(1)
UsageFault_Handler
                B       UsageFault_Handler

                PUBWEAK SVC_Handler
                SECTION .text:CODE:REORDER(1)
SVC_Handler
                B       SVC_Handler

                PUBWEAK DebugMon_Handler
                SECTION .text:CODE:REORDER(1)
DebugMon_Handler
                B       DebugMon_Handler

                PUBWEAK PendSV_Handler
                SECTION .text:CODE:REORDER(1)
PendSV_Handler
                B       PendSV_Handler

                PUBWEAK SysTick_Handler
                SECTION .text:CODE:REORDER(1)
SysTick_Handler
                B       SysTick_Handler

                PUBWEAK INT0_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT0_IRQHandler
                B       INT0_IRQHandler

                PUBWEAK INT1_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT1_IRQHandler
                B       INT1_IRQHandler

                PUBWEAK INT2_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT2_IRQHandler
                B       INT2_IRQHandler

                PUBWEAK INT3_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT3_IRQHandler
                B       INT3_IRQHandler

                PUBWEAK INT4_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT4_IRQHandler
                B       INT4_IRQHandler

                PUBWEAK INT5_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT5_IRQHandler
                B       INT5_IRQHandler

                PUBWEAK INT6_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT6_IRQHandler
                B       INT6_IRQHandler

                PUBWEAK INT7_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT7_IRQHandler
                B       INT7_IRQHandler

                PUBWEAK INTRX0_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTRX0_IRQHandler
                B       INTRX0_IRQHandler

                PUBWEAK INTTX0_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTX0_IRQHandler
                B       INTTX0_IRQHandler

                PUBWEAK INTRX1_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTRX1_IRQHandler
                B       INTRX1_IRQHandler

                PUBWEAK INTTX1_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTX1_IRQHandler
                B       INTTX1_IRQHandler

                PUBWEAK INTUSBWKUP_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTUSBWKUP_IRQHandler
                B       INTUSBWKUP_IRQHandler

                PUBWEAK INTSBI0_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTSBI0_IRQHandler
                B       INTSBI0_IRQHandler

                PUBWEAK INTSBI1_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTSBI1_IRQHandler
                B       INTSBI1_IRQHandler

                PUBWEAK INTADHP_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTADHP_IRQHandler
                B       INTADHP_IRQHandler

                PUBWEAK INTAD_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTAD_IRQHandler
                B       INTAD_IRQHandler

                PUBWEAK INTADM0_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTADM0_IRQHandler
                B       INTADM0_IRQHandler

                PUBWEAK INTADM1_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTADM1_IRQHandler
                B       INTADM1_IRQHandler

                PUBWEAK INTTB0_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB0_IRQHandler
                B       INTTB0_IRQHandler

                PUBWEAK INTTB1_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB1_IRQHandler 
                B       INTTB1_IRQHandler 

                PUBWEAK INTTB2_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB2_IRQHandler 
                B       INTTB2_IRQHandler 

                PUBWEAK INTTB3_IRQHandler 
                SECTION .text:CODE:REORDER(1)
INTTB3_IRQHandler 
                B       INTTB3_IRQHandler

                PUBWEAK INTTB4_IRQHandler 
                SECTION .text:CODE:REORDER(1)
INTTB4_IRQHandler 
                B       INTTB4_IRQHandler

                PUBWEAK INTTB5_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB5_IRQHandler
                B       INTTB5_IRQHandler

                PUBWEAK INTTB6_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB6_IRQHandler
                B       INTTB6_IRQHandler

                PUBWEAK INTTB7_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB7_IRQHandler
                B       INTTB7_IRQHandler

                PUBWEAK INTTB8_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB8_IRQHandler
                B       INTTB8_IRQHandler

                PUBWEAK INTTB9_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTTB9_IRQHandler
                B       INTTB9_IRQHandler

                PUBWEAK INTUSB_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTUSB_IRQHandler
                B       INTUSB_IRQHandler

                PUBWEAK INTUSBPON_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTUSBPON_IRQHandler
                B       INTUSBPON_IRQHandler

                PUBWEAK INTCAP00_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP00_IRQHandler
                B       INTCAP00_IRQHandler

                PUBWEAK INTCAP01_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP01_IRQHandler
                B       INTCAP01_IRQHandler

                PUBWEAK INTCAP10_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP10_IRQHandler
                B       INTCAP10_IRQHandler

                PUBWEAK INTCAP11_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP11_IRQHandler
                B       INTCAP11_IRQHandler

                PUBWEAK INTCAP20_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP20_IRQHandler
                B       INTCAP20_IRQHandler

                PUBWEAK INTCAP21_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP21_IRQHandler
                B       INTCAP21_IRQHandler
                
                PUBWEAK INTCAP30_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP30_IRQHandler
                B       INTCAP30_IRQHandler

                PUBWEAK INTCAP31_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP31_IRQHandler
                B       INTCAP31_IRQHandler
                
                PUBWEAK INTCAP40_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP40_IRQHandler
                B       INTCAP40_IRQHandler

                PUBWEAK INTCAP41_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP41_IRQHandler
                B       INTCAP41_IRQHandler
                
                PUBWEAK INTCAP50_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP50_IRQHandler
                B       INTCAP50_IRQHandler

                PUBWEAK INTCAP51_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP51_IRQHandler
                B       INTCAP51_IRQHandler
                
                PUBWEAK INTCAP60_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP60_IRQHandler
                B       INTCAP60_IRQHandler

                PUBWEAK INTCAP61_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP61_IRQHandler
                B       INTCAP61_IRQHandler
                
                PUBWEAK INTCAP70_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP70_IRQHandler
                B       INTCAP70_IRQHandler

                PUBWEAK INTCAP71_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP71_IRQHandler
                B       INTCAP71_IRQHandler
                
                PUBWEAK INTCAP80_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP80_IRQHandler
                B       INTCAP80_IRQHandler

                PUBWEAK INTCAP81_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP81_IRQHandler
                B       INTCAP81_IRQHandler   
                
                PUBWEAK INTCAP90_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP90_IRQHandler
                B       INTCAP90_IRQHandler

                PUBWEAK INTCAP91_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTCAP91_IRQHandler
                B       INTCAP91_IRQHandler                                                                                                                                                

                PUBWEAK INT8_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT8_IRQHandler
                B       INT8_IRQHandler

                PUBWEAK INT9_IRQHandler
                SECTION .text:CODE:REORDER(1)
INT9_IRQHandler
                B       INT9_IRQHandler

                PUBWEAK INTDMAC0TC_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTDMAC0TC_IRQHandler
                B       INTDMAC0TC_IRQHandler

                PUBWEAK INTABTLOSS0_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTABTLOSS0_IRQHandler
                B       INTABTLOSS0_IRQHandler

                PUBWEAK INTDMAC0ERR_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTDMAC0ERR_IRQHandler
                B       INTDMAC0ERR_IRQHandler

                PUBWEAK INTABTLOSS1_IRQHandler
                SECTION .text:CODE:REORDER(1)
INTABTLOSS1_IRQHandler
                B       INTABTLOSS1_IRQHandler

                END
