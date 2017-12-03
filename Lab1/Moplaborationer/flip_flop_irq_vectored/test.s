   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.bss
  16              		.align	2
  17              	c:
  18 0000 00000000 		.space	4
  20              		.comm	count,1,1
  21              		.comm	systick_flag,1,1
  22              		.global	isOn
  25              	isOn:
  26 0004 00       		.space	1
  27              		.section	.start_section,"ax",%progbits
  28              		.align	1
  29              		.global	startup
  30              		.syntax unified
  31              		.code	16
  32              		.thumb_func
  33              		.fpu softvfp
  35              	startup:
  36              	.LFB0:
  37              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define	GPIO_D			0x40020C00
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO beh�
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste 
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define	GPIO_E			0x40021000
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 b
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO beh�
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIO_E_OUTPUT	((volatile unsigned char *)		(GPIO_E+0x14))
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste 
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  #define	RCC			((volatile unsigned int *) 0x40023844)
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define SYSCFG_EXTICR1	0x40013808
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI_IMR	0x40013C00
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI_FTSR	0x40013C0C
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI_PR	0x40013C14
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define NVIC_ISER0	0xE000E100
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** //EXTI3
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI3_IRQ_BPOS	(1<<3)
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI3_IRQVEC	0x2001C064
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define NVIC_EXTI3_IRQ_BPOS	(1<<9)
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** //EXTI2
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI2_IRQ_BPOS	(1<<2)
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI2_IRQVEC	0x2001C060
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define NVIC_EXTI2_IRQ_BPOS	(1<<8)
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** //EXTI1
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI1_IRQ_BPOS	(1<<1)
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI1_IRQVEC	0x2001C05c
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define NVIC_EXTI1_IRQ_BPOS	(1<<7)
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** //EXTI0
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI0_IRQ_BPOS	(1<<0)
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define EXTI0_IRQVEC	0x2001C058
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define NVIC_EXTI0_IRQ_BPOS	(1<<6)
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define B_E 0x40 // Enable
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define B_RST 0x20 // Reset
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define B_CS2 0x10 // Controller Select 2
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define B_CS1 8 // Controller Select 1
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define B_RW 2 // 0 Write, 1 Read
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define B_RS 1 // 0 Command, 1 Data
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define LCD_ON 0x3F // Display on
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define LCD_OFF 0x3E // Display off
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define LCD_DISP_START 0xC0 // Start address
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** #define LCD_BUSY 0x80 // Read busy status
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** static volatile int c = 0;
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  unsigned char count;
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  char systick_flag;
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  char isOn = 0;
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void startup ( void )
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** {
  38              		.loc 1 79 0
  39              		.cfi_startproc
  40              		@ Naked Function: prologue and epilogue provided by programmer.
  41              		@ args = 0, pretend = 0, frame = 0
  42              		@ frame_needed = 1, uses_anonymous_args = 0
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** __asm volatile(
  43              		.loc 1 80 0
  44              		.syntax divided
  45              	@ 80 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored/startup.c" 1
  46 0000 0248     		 LDR R0,=0x2001C000
  47 0002 8546     	 MOV SP,R0
  48 0004 FFF7FEFF 	 BL main
  49 0008 FEE7     	_exit: B .
  50              	
  51              	@ 0 "" 2
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	" MOV SP,R0\n"
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	" BL main\n"				/* call main */
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	"_exit: B .\n"				/* never return */
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	) ;
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
  52              		.loc 1 86 0
  53              		.thumb
  54              		.syntax unified
  55 000a C046     		nop
  56              		.cfi_endproc
  57              	.LFE0:
  59              		.text
  60              		.align	1
  61              		.global	irq_handler
  62              		.syntax unified
  63              		.code	16
  64              		.thumb_func
  65              		.fpu softvfp
  67              	irq_handler:
  68              	.LFB1:
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void irq_handler ( void )
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** {
  69              		.loc 1 88 0
  70              		.cfi_startproc
  71              		@ args = 0, pretend = 0, frame = 0
  72              		@ frame_needed = 1, uses_anonymous_args = 0
  73 0000 80B5     		push	{r7, lr}
  74              		.cfi_def_cfa_offset 8
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 00AF     		add	r7, sp, #0
  78              		.cfi_def_cfa_register 7
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*GPIOD_ODR_LOW  = 0xFF;
  79              		.loc 1 89 0
  80 0004 124B     		ldr	r3, .L4
  81 0006 FF22     		movs	r2, #255
  82 0008 1A70     		strb	r2, [r3]
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	if(   *((unsigned int *) EXTI_PR) & EXTI3_IRQ_BPOS )
  83              		.loc 1 90 0
  84 000a 124B     		ldr	r3, .L4+4
  85 000c 1B68     		ldr	r3, [r3]
  86 000e 0822     		movs	r2, #8
  87 0010 1340     		ands	r3, r2
  88 0012 0AD0     		beq	.L3
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	{
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****         c++;
  89              		.loc 1 92 0
  90 0014 104B     		ldr	r3, .L4+8
  91 0016 1B68     		ldr	r3, [r3]
  92 0018 5A1C     		adds	r2, r3, #1
  93 001a 0F4B     		ldr	r3, .L4+8
  94 001c 1A60     		str	r2, [r3]
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****        *((unsigned int *) EXTI_PR) |= EXTI3_IRQ_BPOS;
  95              		.loc 1 93 0
  96 001e 0D4B     		ldr	r3, .L4+4
  97 0020 0C4A     		ldr	r2, .L4+4
  98 0022 1268     		ldr	r2, [r2]
  99 0024 0821     		movs	r1, #8
 100 0026 0A43     		orrs	r2, r1
 101 0028 1A60     		str	r2, [r3]
 102              	.L3:
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  	}
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *((unsigned int *) EXTI_PR) |= EXTI3_IRQ_BPOS;
 103              		.loc 1 95 0
 104 002a 0A4B     		ldr	r3, .L4+4
 105 002c 094A     		ldr	r2, .L4+4
 106 002e 1268     		ldr	r2, [r2]
 107 0030 0821     		movs	r1, #8
 108 0032 0A43     		orrs	r2, r1
 109 0034 1A60     		str	r2, [r3]
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
 110              		.loc 1 96 0
 111 0036 094B     		ldr	r3, .L4+12
 112 0038 7022     		movs	r2, #112
 113 003a 1A60     		str	r2, [r3]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
 114              		.loc 1 97 0
 115 003c 074B     		ldr	r3, .L4+12
 116 003e 074A     		ldr	r2, .L4+12
 117 0040 1268     		ldr	r2, [r2]
 118 0042 7021     		movs	r1, #112
 119 0044 8A43     		bics	r2, r1
 120 0046 1A60     		str	r2, [r3]
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
 121              		.loc 1 98 0
 122 0048 C046     		nop
 123 004a BD46     		mov	sp, r7
 124              		@ sp needed
 125 004c 80BD     		pop	{r7, pc}
 126              	.L5:
 127 004e C046     		.align	2
 128              	.L4:
 129 0050 140C0240 		.word	1073875988
 130 0054 143C0140 		.word	1073822740
 131 0058 00000000 		.word	c
 132 005c 14100240 		.word	1073877012
 133              		.cfi_endproc
 134              	.LFE1:
 136              		.align	1
 137              		.global	irq_handler2
 138              		.syntax unified
 139              		.code	16
 140              		.thumb_func
 141              		.fpu softvfp
 143              	irq_handler2:
 144              	.LFB2:
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void irq_handler2 ( void )
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** {
 145              		.loc 1 100 0
 146              		.cfi_startproc
 147              		@ args = 0, pretend = 0, frame = 0
 148              		@ frame_needed = 1, uses_anonymous_args = 0
 149 0060 80B5     		push	{r7, lr}
 150              		.cfi_def_cfa_offset 8
 151              		.cfi_offset 7, -8
 152              		.cfi_offset 14, -4
 153 0062 00AF     		add	r7, sp, #0
 154              		.cfi_def_cfa_register 7
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*GPIOD_ODR_LOW  = 0xFF;
 155              		.loc 1 101 0
 156 0064 104B     		ldr	r3, .L8
 157 0066 FF22     		movs	r2, #255
 158 0068 1A70     		strb	r2, [r3]
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	if(   *((unsigned int *) EXTI_PR) & EXTI2_IRQ_BPOS )
 159              		.loc 1 102 0
 160 006a 104B     		ldr	r3, .L8+4
 161 006c 1B68     		ldr	r3, [r3]
 162 006e 0422     		movs	r2, #4
 163 0070 1340     		ands	r3, r2
 164 0072 07D0     		beq	.L7
 165              	.LBB2:
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	{
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****         lightUp();
 166              		.loc 1 104 0
 167 0074 FFF7FEFF 		bl	lightUp
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****        *((unsigned int *) EXTI_PR) |= EXTI2_IRQ_BPOS;
 168              		.loc 1 105 0
 169 0078 0C4B     		ldr	r3, .L8+4
 170 007a 0C4A     		ldr	r2, .L8+4
 171 007c 1268     		ldr	r2, [r2]
 172 007e 0421     		movs	r1, #4
 173 0080 0A43     		orrs	r2, r1
 174 0082 1A60     		str	r2, [r3]
 175              	.L7:
 176              	.LBE2:
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  	}
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *((unsigned int *) EXTI_PR) |= EXTI2_IRQ_BPOS;
 177              		.loc 1 107 0
 178 0084 094B     		ldr	r3, .L8+4
 179 0086 094A     		ldr	r2, .L8+4
 180 0088 1268     		ldr	r2, [r2]
 181 008a 0421     		movs	r1, #4
 182 008c 0A43     		orrs	r2, r1
 183 008e 1A60     		str	r2, [r3]
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
 184              		.loc 1 108 0
 185 0090 074B     		ldr	r3, .L8+8
 186 0092 7022     		movs	r2, #112
 187 0094 1A60     		str	r2, [r3]
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
 188              		.loc 1 109 0
 189 0096 064B     		ldr	r3, .L8+8
 190 0098 054A     		ldr	r2, .L8+8
 191 009a 1268     		ldr	r2, [r2]
 192 009c 7021     		movs	r1, #112
 193 009e 8A43     		bics	r2, r1
 194 00a0 1A60     		str	r2, [r3]
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
 195              		.loc 1 110 0
 196 00a2 C046     		nop
 197 00a4 BD46     		mov	sp, r7
 198              		@ sp needed
 199 00a6 80BD     		pop	{r7, pc}
 200              	.L9:
 201              		.align	2
 202              	.L8:
 203 00a8 140C0240 		.word	1073875988
 204 00ac 143C0140 		.word	1073822740
 205 00b0 14100240 		.word	1073877012
 206              		.cfi_endproc
 207              	.LFE2:
 209              		.align	1
 210              		.global	irq_handler1
 211              		.syntax unified
 212              		.code	16
 213              		.thumb_func
 214              		.fpu softvfp
 216              	irq_handler1:
 217              	.LFB3:
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void irq_handler1 ( void )
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** {
 218              		.loc 1 112 0
 219              		.cfi_startproc
 220              		@ args = 0, pretend = 0, frame = 0
 221              		@ frame_needed = 1, uses_anonymous_args = 0
 222 00b4 80B5     		push	{r7, lr}
 223              		.cfi_def_cfa_offset 8
 224              		.cfi_offset 7, -8
 225              		.cfi_offset 14, -4
 226 00b6 00AF     		add	r7, sp, #0
 227              		.cfi_def_cfa_register 7
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*GPIOD_ODR_LOW  = 0xFF;
 228              		.loc 1 113 0
 229 00b8 114B     		ldr	r3, .L12
 230 00ba FF22     		movs	r2, #255
 231 00bc 1A70     		strb	r2, [r3]
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	if(   *((unsigned int *) EXTI_PR) & EXTI1_IRQ_BPOS )
 232              		.loc 1 114 0
 233 00be 114B     		ldr	r3, .L12+4
 234 00c0 1B68     		ldr	r3, [r3]
 235 00c2 0222     		movs	r2, #2
 236 00c4 1340     		ands	r3, r2
 237 00c6 08D0     		beq	.L11
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	{
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****         c = 0;
 238              		.loc 1 116 0
 239 00c8 0F4B     		ldr	r3, .L12+8
 240 00ca 0022     		movs	r2, #0
 241 00cc 1A60     		str	r2, [r3]
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****        *((unsigned int *) EXTI_PR) |= EXTI1_IRQ_BPOS;
 242              		.loc 1 117 0
 243 00ce 0D4B     		ldr	r3, .L12+4
 244 00d0 0C4A     		ldr	r2, .L12+4
 245 00d2 1268     		ldr	r2, [r2]
 246 00d4 0221     		movs	r1, #2
 247 00d6 0A43     		orrs	r2, r1
 248 00d8 1A60     		str	r2, [r3]
 249              	.L11:
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  	}
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *((unsigned int *) EXTI_PR)|= EXTI1_IRQ_BPOS;
 250              		.loc 1 119 0
 251 00da 0A4B     		ldr	r3, .L12+4
 252 00dc 094A     		ldr	r2, .L12+4
 253 00de 1268     		ldr	r2, [r2]
 254 00e0 0221     		movs	r1, #2
 255 00e2 0A43     		orrs	r2, r1
 256 00e4 1A60     		str	r2, [r3]
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
 257              		.loc 1 120 0
 258 00e6 094B     		ldr	r3, .L12+12
 259 00e8 7022     		movs	r2, #112
 260 00ea 1A60     		str	r2, [r3]
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
 261              		.loc 1 121 0
 262 00ec 074B     		ldr	r3, .L12+12
 263 00ee 074A     		ldr	r2, .L12+12
 264 00f0 1268     		ldr	r2, [r2]
 265 00f2 7021     		movs	r1, #112
 266 00f4 8A43     		bics	r2, r1
 267 00f6 1A60     		str	r2, [r3]
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
 268              		.loc 1 122 0
 269 00f8 C046     		nop
 270 00fa BD46     		mov	sp, r7
 271              		@ sp needed
 272 00fc 80BD     		pop	{r7, pc}
 273              	.L13:
 274 00fe C046     		.align	2
 275              	.L12:
 276 0100 140C0240 		.word	1073875988
 277 0104 143C0140 		.word	1073822740
 278 0108 00000000 		.word	c
 279 010c 14100240 		.word	1073877012
 280              		.cfi_endproc
 281              	.LFE3:
 283              		.align	1
 284              		.global	irq_handler0
 285              		.syntax unified
 286              		.code	16
 287              		.thumb_func
 288              		.fpu softvfp
 290              	irq_handler0:
 291              	.LFB4:
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void irq_handler0 ( void )
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** {
 292              		.loc 1 124 0
 293              		.cfi_startproc
 294              		@ args = 0, pretend = 0, frame = 0
 295              		@ frame_needed = 1, uses_anonymous_args = 0
 296 0110 80B5     		push	{r7, lr}
 297              		.cfi_def_cfa_offset 8
 298              		.cfi_offset 7, -8
 299              		.cfi_offset 14, -4
 300 0112 00AF     		add	r7, sp, #0
 301              		.cfi_def_cfa_register 7
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*GPIOD_ODR_LOW  = 0xFF;
 302              		.loc 1 125 0
 303 0114 124B     		ldr	r3, .L16
 304 0116 FF22     		movs	r2, #255
 305 0118 1A70     		strb	r2, [r3]
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	if(   *((unsigned int *) EXTI_PR) & EXTI0_IRQ_BPOS )
 306              		.loc 1 126 0
 307 011a 124B     		ldr	r3, .L16+4
 308 011c 1B68     		ldr	r3, [r3]
 309 011e 0122     		movs	r2, #1
 310 0120 1340     		ands	r3, r2
 311 0122 0AD0     		beq	.L15
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	{
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****         c++;
 312              		.loc 1 128 0
 313 0124 104B     		ldr	r3, .L16+8
 314 0126 1B68     		ldr	r3, [r3]
 315 0128 5A1C     		adds	r2, r3, #1
 316 012a 0F4B     		ldr	r3, .L16+8
 317 012c 1A60     		str	r2, [r3]
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****        *((unsigned int *) EXTI_PR) |= EXTI0_IRQ_BPOS;
 318              		.loc 1 129 0
 319 012e 0D4B     		ldr	r3, .L16+4
 320 0130 0C4A     		ldr	r2, .L16+4
 321 0132 1268     		ldr	r2, [r2]
 322 0134 0121     		movs	r1, #1
 323 0136 0A43     		orrs	r2, r1
 324 0138 1A60     		str	r2, [r3]
 325              	.L15:
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  	}
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *((unsigned int *) EXTI_PR) |= EXTI0_IRQ_BPOS;
 326              		.loc 1 131 0
 327 013a 0A4B     		ldr	r3, .L16+4
 328 013c 094A     		ldr	r2, .L16+4
 329 013e 1268     		ldr	r2, [r2]
 330 0140 0121     		movs	r1, #1
 331 0142 0A43     		orrs	r2, r1
 332 0144 1A60     		str	r2, [r3]
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
 333              		.loc 1 132 0
 334 0146 094B     		ldr	r3, .L16+12
 335 0148 7022     		movs	r2, #112
 336 014a 1A60     		str	r2, [r3]
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
 337              		.loc 1 133 0
 338 014c 074B     		ldr	r3, .L16+12
 339 014e 074A     		ldr	r2, .L16+12
 340 0150 1268     		ldr	r2, [r2]
 341 0152 7021     		movs	r1, #112
 342 0154 8A43     		bics	r2, r1
 343 0156 1A60     		str	r2, [r3]
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
 344              		.loc 1 134 0
 345 0158 C046     		nop
 346 015a BD46     		mov	sp, r7
 347              		@ sp needed
 348 015c 80BD     		pop	{r7, pc}
 349              	.L17:
 350 015e C046     		.align	2
 351              	.L16:
 352 0160 140C0240 		.word	1073875988
 353 0164 143C0140 		.word	1073822740
 354 0168 00000000 		.word	c
 355 016c 14100240 		.word	1073877012
 356              		.cfi_endproc
 357              	.LFE4:
 359              		.align	1
 360              		.global	init_app
 361              		.syntax unified
 362              		.code	16
 363              		.thumb_func
 364              		.fpu softvfp
 366              	init_app:
 367              	.LFB5:
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void init_app( void )
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** {   
 368              		.loc 1 137 0
 369              		.cfi_startproc
 370              		@ args = 0, pretend = 0, frame = 0
 371              		@ frame_needed = 1, uses_anonymous_args = 0
 372 0170 80B5     		push	{r7, lr}
 373              		.cfi_def_cfa_offset 8
 374              		.cfi_offset 7, -8
 375              		.cfi_offset 14, -4
 376 0172 00AF     		add	r7, sp, #0
 377              		.cfi_def_cfa_register 7
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   *GPIOD_MODER = 0x55555555;
 378              		.loc 1 139 0
 379 0174 3B4B     		ldr	r3, .L19
 380 0176 3C4A     		ldr	r2, .L19+4
 381 0178 1A60     		str	r2, [r3]
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/*sätter våra in och ut portar*/
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*GPIOD_OTYPER = 0x70;
 382              		.loc 1 141 0
 383 017a 3C4B     		ldr	r3, .L19+8
 384 017c 7022     		movs	r2, #112
 385 017e 1A80     		strh	r2, [r3]
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*GPIOD_PUPDR = 0x0AA;
 386              		.loc 1 142 0
 387 0180 3B4B     		ldr	r3, .L19+12
 388 0182 AA22     		movs	r2, #170
 389 0184 1A60     		str	r2, [r3]
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
 390              		.loc 1 143 0
 391 0186 3B4B     		ldr	r3, .L19+16
 392 0188 3A4A     		ldr	r2, .L19+16
 393 018a 1278     		ldrb	r2, [r2]
 394 018c D2B2     		uxtb	r2, r2
 395 018e 1A70     		strb	r2, [r3]
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   // port 0-7 -> Keypad
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *GPIOE_MODER = 0x00005500;
 396              		.loc 1 147 0
 397 0190 394B     		ldr	r3, .L19+20
 398 0192 AA22     		movs	r2, #170
 399 0194 D201     		lsls	r2, r2, #7
 400 0196 1A60     		str	r2, [r3]
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     //OTYPER bits 15-8 to push-pull
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *GPIOE_OTYPER = 0x0000; //00000000
 401              		.loc 1 150 0
 402 0198 384B     		ldr	r3, .L19+24
 403 019a 0022     		movs	r2, #0
 404 019c 1A80     		strh	r2, [r3]
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	//OSPEEDR high
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *GPIOE_OSPEDER = 0x55555555; //00000000
 405              		.loc 1 153 0
 406 019e 384B     		ldr	r3, .L19+28
 407 01a0 314A     		ldr	r2, .L19+4
 408 01a2 1A60     		str	r2, [r3]
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     //PUPDR bits 23-16 to pull-down, rest to zero
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     *GPIOE_PUPDR = 0x00000000; //10101010 000000000 000000000
 409              		.loc 1 156 0
 410 01a4 374B     		ldr	r3, .L19+32
 411 01a6 0022     		movs	r2, #0
 412 01a8 1A60     		str	r2, [r3]
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	//Activate clock for SYSCFG
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	*RCC |= 0x4000;
 413              		.loc 1 159 0
 414 01aa 374B     		ldr	r3, .L19+36
 415 01ac 364A     		ldr	r2, .L19+36
 416 01ae 1268     		ldr	r2, [r2]
 417 01b0 8021     		movs	r1, #128
 418 01b2 C901     		lsls	r1, r1, #7
 419 01b4 0A43     		orrs	r2, r1
 420 01b6 1A60     		str	r2, [r3]
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Koppla PE0 till avbrottslina EXTI0 */
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x0004;
 421              		.loc 1 162 0
 422 01b8 344B     		ldr	r3, .L19+40
 423 01ba 344A     		ldr	r2, .L19+40
 424 01bc 1268     		ldr	r2, [r2]
 425 01be 0421     		movs	r1, #4
 426 01c0 0A43     		orrs	r2, r1
 427 01c2 1A60     		str	r2, [r3]
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Konfigurera EXTI3 för att generera avbrott */
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((unsigned int *) EXTI_IMR) |= EXTI0_IRQ_BPOS;
 428              		.loc 1 164 0
 429 01c4 324B     		ldr	r3, .L19+44
 430 01c6 324A     		ldr	r2, .L19+44
 431 01c8 1268     		ldr	r2, [r2]
 432 01ca 0121     		movs	r1, #1
 433 01cc 0A43     		orrs	r2, r1
 434 01ce 1A60     		str	r2, [r3]
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Konfigurera för avbrott på negativ flank */
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  	 *((unsigned int *) EXTI_FTSR) |= EXTI0_IRQ_BPOS;		
 435              		.loc 1 166 0
 436 01d0 304B     		ldr	r3, .L19+48
 437 01d2 304A     		ldr	r2, .L19+48
 438 01d4 1268     		ldr	r2, [r2]
 439 01d6 0121     		movs	r1, #1
 440 01d8 0A43     		orrs	r2, r1
 441 01da 1A60     		str	r2, [r3]
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Sätt upp avbrottsvektor */
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((void (**)(void) ) EXTI0_IRQVEC ) = irq_handler0;     
 442              		.loc 1 168 0
 443 01dc 2E4B     		ldr	r3, .L19+52
 444 01de 2F4A     		ldr	r2, .L19+56
 445 01e0 1A60     		str	r2, [r3]
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****    	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI0_IRQ_BPOS; 
 446              		.loc 1 170 0
 447 01e2 2F4B     		ldr	r3, .L19+60
 448 01e4 2E4A     		ldr	r2, .L19+60
 449 01e6 1268     		ldr	r2, [r2]
 450 01e8 4021     		movs	r1, #64
 451 01ea 0A43     		orrs	r2, r1
 452 01ec 1A60     		str	r2, [r3]
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      /* Koppla PE1 till avbrottslina EXTI1 */
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x0040;
 453              		.loc 1 174 0
 454 01ee 274B     		ldr	r3, .L19+40
 455 01f0 264A     		ldr	r2, .L19+40
 456 01f2 1268     		ldr	r2, [r2]
 457 01f4 4021     		movs	r1, #64
 458 01f6 0A43     		orrs	r2, r1
 459 01f8 1A60     		str	r2, [r3]
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Konfigurera EXTI3 för att generera avbrott */
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((unsigned int *) EXTI_IMR) |= EXTI1_IRQ_BPOS;
 460              		.loc 1 176 0
 461 01fa 254B     		ldr	r3, .L19+44
 462 01fc 244A     		ldr	r2, .L19+44
 463 01fe 1268     		ldr	r2, [r2]
 464 0200 0221     		movs	r1, #2
 465 0202 0A43     		orrs	r2, r1
 466 0204 1A60     		str	r2, [r3]
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Konfigurera för avbrott på negativ flank */
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  	 *((unsigned int *) EXTI_FTSR) |= EXTI1_IRQ_BPOS;		
 467              		.loc 1 178 0
 468 0206 234B     		ldr	r3, .L19+48
 469 0208 224A     		ldr	r2, .L19+48
 470 020a 1268     		ldr	r2, [r2]
 471 020c 0221     		movs	r1, #2
 472 020e 0A43     		orrs	r2, r1
 473 0210 1A60     		str	r2, [r3]
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Sätt upp avbrottsvektor */
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((void (**)(void) ) EXTI1_IRQVEC ) = irq_handler1;     
 474              		.loc 1 180 0
 475 0212 244B     		ldr	r3, .L19+64
 476 0214 244A     		ldr	r2, .L19+68
 477 0216 1A60     		str	r2, [r3]
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****    	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI1_IRQ_BPOS; 
 478              		.loc 1 182 0
 479 0218 214B     		ldr	r3, .L19+60
 480 021a 214A     		ldr	r2, .L19+60
 481 021c 1268     		ldr	r2, [r2]
 482 021e 8021     		movs	r1, #128
 483 0220 0A43     		orrs	r2, r1
 484 0222 1A60     		str	r2, [r3]
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      /* Koppla PE2 till avbrottslina EXTI2 */
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x0400;
 485              		.loc 1 186 0
 486 0224 194B     		ldr	r3, .L19+40
 487 0226 194A     		ldr	r2, .L19+40
 488 0228 1268     		ldr	r2, [r2]
 489 022a 8021     		movs	r1, #128
 490 022c C900     		lsls	r1, r1, #3
 491 022e 0A43     		orrs	r2, r1
 492 0230 1A60     		str	r2, [r3]
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Konfigurera EXTI3 för att generera avbrott */
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((unsigned int *) EXTI_IMR) |= EXTI2_IRQ_BPOS;
 493              		.loc 1 188 0
 494 0232 174B     		ldr	r3, .L19+44
 495 0234 164A     		ldr	r2, .L19+44
 496 0236 1268     		ldr	r2, [r2]
 497 0238 0421     		movs	r1, #4
 498 023a 0A43     		orrs	r2, r1
 499 023c 1A60     		str	r2, [r3]
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Konfigurera för avbrott på negativ flank */
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****  	 *((unsigned int *) EXTI_FTSR) |= EXTI2_IRQ_BPOS;		
 500              		.loc 1 190 0
 501 023e 154B     		ldr	r3, .L19+48
 502 0240 144A     		ldr	r2, .L19+48
 503 0242 1268     		ldr	r2, [r2]
 504 0244 0421     		movs	r1, #4
 505 0246 0A43     		orrs	r2, r1
 506 0248 1A60     		str	r2, [r3]
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	/* Sätt upp avbrottsvektor */
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****   	 *((void (**)(void) ) EXTI2_IRQVEC ) = irq_handler2;     
 507              		.loc 1 192 0
 508 024a 184B     		ldr	r3, .L19+72
 509 024c 184A     		ldr	r2, .L19+76
 510 024e 1A60     		str	r2, [r3]
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****    	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****      *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI2_IRQ_BPOS; 
 511              		.loc 1 194 0
 512 0250 134B     		ldr	r3, .L19+60
 513 0252 134A     		ldr	r2, .L19+60
 514 0254 1268     		ldr	r2, [r2]
 515 0256 8021     		movs	r1, #128
 516 0258 4900     		lsls	r1, r1, #1
 517 025a 0A43     		orrs	r2, r1
 518 025c 1A60     		str	r2, [r3]
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
 519              		.loc 1 195 0
 520 025e C046     		nop
 521 0260 BD46     		mov	sp, r7
 522              		@ sp needed
 523 0262 80BD     		pop	{r7, pc}
 524              	.L20:
 525              		.align	2
 526              	.L19:
 527 0264 000C0240 		.word	1073875968
 528 0268 55555555 		.word	1431655765
 529 026c 040C0240 		.word	1073875972
 530 0270 0C0C0240 		.word	1073875980
 531 0274 150C0240 		.word	1073875989
 532 0278 00100240 		.word	1073876992
 533 027c 04100240 		.word	1073876996
 534 0280 08100240 		.word	1073877000
 535 0284 0C100240 		.word	1073877004
 536 0288 44380240 		.word	1073887300
 537 028c 08380140 		.word	1073821704
 538 0290 003C0140 		.word	1073822720
 539 0294 0C3C0140 		.word	1073822732
 540 0298 58C00120 		.word	536985688
 541 029c 00000000 		.word	irq_handler0
 542 02a0 00E100E0 		.word	-536813312
 543 02a4 5CC00120 		.word	536985692
 544 02a8 00000000 		.word	irq_handler1
 545 02ac 60C00120 		.word	536985696
 546 02b0 00000000 		.word	irq_handler2
 547              		.cfi_endproc
 548              	.LFE5:
 550              		.align	1
 551              		.global	main
 552              		.syntax unified
 553              		.code	16
 554              		.thumb_func
 555              		.fpu softvfp
 557              	main:
 558              	.LFB6:
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void main(void)
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** {
 559              		.loc 1 197 0
 560              		.cfi_startproc
 561              		@ args = 0, pretend = 0, frame = 0
 562              		@ frame_needed = 1, uses_anonymous_args = 0
 563 02b4 80B5     		push	{r7, lr}
 564              		.cfi_def_cfa_offset 8
 565              		.cfi_offset 7, -8
 566              		.cfi_offset 14, -4
 567 02b6 00AF     		add	r7, sp, #0
 568              		.cfi_def_cfa_register 7
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     init_app();
 569              		.loc 1 198 0
 570 02b8 FFF7FEFF 		bl	init_app
 571              	.L22:
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****     while(1){
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****         *GPIOD_ODR_LOW = c;
 572              		.loc 1 200 0 discriminator 1
 573 02bc 024A     		ldr	r2, .L23
 574 02be 034B     		ldr	r3, .L23+4
 575 02c0 1B68     		ldr	r3, [r3]
 576 02c2 DBB2     		uxtb	r3, r3
 577 02c4 1370     		strb	r3, [r2]
 578 02c6 F9E7     		b	.L22
 579              	.L24:
 580              		.align	2
 581              	.L23:
 582 02c8 140C0240 		.word	1073875988
 583 02cc 00000000 		.word	c
 584              		.cfi_endproc
 585              	.LFE6:
 587              		.align	1
 588              		.global	lightUp
 589              		.syntax unified
 590              		.code	16
 591              		.thumb_func
 592              		.fpu softvfp
 594              	lightUp:
 595              	.LFB7:
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****         //c++;
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c ****         }
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** void lightUp(void){
 596              		.loc 1 204 0
 597              		.cfi_startproc
 598              		@ args = 0, pretend = 0, frame = 0
 599              		@ frame_needed = 1, uses_anonymous_args = 0
 600 02d0 80B5     		push	{r7, lr}
 601              		.cfi_def_cfa_offset 8
 602              		.cfi_offset 7, -8
 603              		.cfi_offset 14, -4
 604 02d2 00AF     		add	r7, sp, #0
 605              		.cfi_def_cfa_register 7
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	if (isOn == 0){
 606              		.loc 1 205 0
 607 02d4 094B     		ldr	r3, .L29
 608 02d6 1B78     		ldrb	r3, [r3]
 609 02d8 002B     		cmp	r3, #0
 610 02da 06D1     		bne	.L26
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		count = 0xFF;
 611              		.loc 1 206 0
 612 02dc 084B     		ldr	r3, .L29+4
 613 02de FF22     		movs	r2, #255
 614 02e0 1A70     		strb	r2, [r3]
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		isOn = 1;
 615              		.loc 1 207 0
 616 02e2 064B     		ldr	r3, .L29
 617 02e4 0122     		movs	r2, #1
 618 02e6 1A70     		strb	r2, [r3]
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	} else{
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		count = 0;
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		isOn = 0;
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	}
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** }
 619              		.loc 1 212 0
 620 02e8 05E0     		b	.L28
 621              	.L26:
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 		isOn = 0;
 622              		.loc 1 209 0
 623 02ea 054B     		ldr	r3, .L29+4
 624 02ec 0022     		movs	r2, #0
 625 02ee 1A70     		strb	r2, [r3]
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flip_flop_irq_vectored\startup.c **** 	}
 626              		.loc 1 210 0
 627 02f0 024B     		ldr	r3, .L29
 628 02f2 0022     		movs	r2, #0
 629 02f4 1A70     		strb	r2, [r3]
 630              	.L28:
 631              		.loc 1 212 0
 632 02f6 C046     		nop
 633 02f8 BD46     		mov	sp, r7
 634              		@ sp needed
 635 02fa 80BD     		pop	{r7, pc}
 636              	.L30:
 637              		.align	2
 638              	.L29:
 639 02fc 00000000 		.word	isOn
 640 0300 00000000 		.word	count
 641              		.cfi_endproc
 642              	.LFE7:
 644              	.Letext0:
