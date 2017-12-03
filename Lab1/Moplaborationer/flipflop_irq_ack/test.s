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
  20              		.section	.start_section,"ax",%progbits
  21              		.align	1
  22              		.global	startup
  23              		.syntax unified
  24              		.code	16
  25              		.thumb_func
  26              		.fpu softvfp
  28              	startup:
  29              	.LFB0:
  30              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****  #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define	GPIO_D			0x40020C00
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO beh�
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste 
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define	GPIO_E			0x40021000
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 b
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO beh�
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste 
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define SYSCFG_EXTICR1	0x40013808
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXTI_IMR	0x40013C00
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXTI_FTSR	0x40013C0C
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXTI_PR	0x40013C14
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define NVIC_ISER0	0xE000E100
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXTI3_IRQ_BPOS	(1<<3)
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXTI3_IRQVEC	0x2001C064
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define NVIC_EXTI3_IRQ_BPOS	(1<<9)
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXIT3_IRQ0 0x1
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXIT3_IRQ1 0x2
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define EXIT3_IRQ2 0x4
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define B_E 0x40 // Enable
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define B_RST 0x20 // Reset
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define B_CS2 0x10 // Controller Select 2
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define B_CS1 8 // Controller Select 1
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define B_RW 2 // 0 Write, 1 Read
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define B_RS 1 // 0 Command, 1 Data
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define LCD_ON 0x3F // Display on
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define LCD_OFF 0x3E // Display off
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define LCD_DISP_START 0xC0 // Start address
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** #define LCD_BUSY 0x80 // Read busy status
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** static volatile int c = 0;
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** void startup ( void )
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** {
  31              		.loc 1 62 0
  32              		.cfi_startproc
  33              		@ Naked Function: prologue and epilogue provided by programmer.
  34              		@ args = 0, pretend = 0, frame = 0
  35              		@ frame_needed = 1, uses_anonymous_args = 0
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** __asm volatile(
  36              		.loc 1 63 0
  37              		.syntax divided
  38              	@ 63 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack/startup.c" 1
  39 0000 0248     		 LDR R0,=0x2001C000
  40 0002 8546     	 MOV SP,R0
  41 0004 FFF7FEFF 	 BL main
  42 0008 FEE7     	_exit: B .
  43              	
  44              	@ 0 "" 2
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	" MOV SP,R0\n"
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	" BL main\n"				/* call main */
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	"_exit: B .\n"				/* never return */
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	) ;
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** }
  45              		.loc 1 69 0
  46              		.thumb
  47              		.syntax unified
  48 000a C046     		nop
  49              		.cfi_endproc
  50              	.LFE0:
  52              		.text
  53              		.align	1
  54              		.global	irq_handler
  55              		.syntax unified
  56              		.code	16
  57              		.thumb_func
  58              		.fpu softvfp
  60              	irq_handler:
  61              	.LFB1:
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** void irq_handler ( void )
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** {
  62              		.loc 1 71 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 8
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 0002 82B0     		sub	sp, sp, #8
  71              		.cfi_def_cfa_offset 16
  72 0004 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Om avbrott från EXTI3:
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 		kvittera avbrott från EXTI3 */
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	if(   *((unsigned int *) EXTI_PR) & EXTI3_IRQ_BPOS )
  74              		.loc 1 74 0
  75 0006 0C4B     		ldr	r3, .L5
  76 0008 1B68     		ldr	r3, [r3]
  77 000a 0822     		movs	r2, #8
  78 000c 1340     		ands	r3, r2
  79 000e 0ED0     		beq	.L4
  80              	.LBB2:
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	{
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****         volatile unsigned int x =  *GPIOE_IDR_LOW;
  81              		.loc 1 76 0
  82 0010 0A4B     		ldr	r3, .L5+4
  83 0012 1B78     		ldrb	r3, [r3]
  84 0014 DBB2     		uxtb	r3, r3
  85 0016 7B60     		str	r3, [r7, #4]
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****         if(EXIT3_IRQ0 == 1){
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****         c++;
  86              		.loc 1 78 0
  87 0018 094B     		ldr	r3, .L5+8
  88 001a 1B68     		ldr	r3, [r3]
  89 001c 5A1C     		adds	r2, r3, #1
  90 001e 084B     		ldr	r3, .L5+8
  91 0020 1A60     		str	r2, [r3]
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****        *((unsigned int *) EXTI_PR) |= EXTI3_IRQ_BPOS;
  92              		.loc 1 79 0
  93 0022 054B     		ldr	r3, .L5
  94 0024 044A     		ldr	r2, .L5
  95 0026 1268     		ldr	r2, [r2]
  96 0028 0821     		movs	r1, #8
  97 002a 0A43     		orrs	r2, r1
  98 002c 1A60     		str	r2, [r3]
  99              	.L4:
 100              	.LBE2:
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****         }
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****         
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****  	}
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** }
 101              		.loc 1 83 0
 102 002e C046     		nop
 103 0030 BD46     		mov	sp, r7
 104 0032 02B0     		add	sp, sp, #8
 105              		@ sp needed
 106 0034 80BD     		pop	{r7, pc}
 107              	.L6:
 108 0036 C046     		.align	2
 109              	.L5:
 110 0038 143C0140 		.word	1073822740
 111 003c 10100240 		.word	1073877008
 112 0040 00000000 		.word	c
 113              		.cfi_endproc
 114              	.LFE1:
 116              		.align	1
 117              		.global	init_app
 118              		.syntax unified
 119              		.code	16
 120              		.thumb_func
 121              		.fpu softvfp
 123              	init_app:
 124              	.LFB2:
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** void init_app( void )
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** {   
 125              		.loc 1 86 0
 126              		.cfi_startproc
 127              		@ args = 0, pretend = 0, frame = 0
 128              		@ frame_needed = 1, uses_anonymous_args = 0
 129 0044 80B5     		push	{r7, lr}
 130              		.cfi_def_cfa_offset 8
 131              		.cfi_offset 7, -8
 132              		.cfi_offset 14, -4
 133 0046 00AF     		add	r7, sp, #0
 134              		.cfi_def_cfa_register 7
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****   
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****   *GPIOD_MODER = 0x55555555;
 135              		.loc 1 88 0
 136 0048 1E4B     		ldr	r3, .L8
 137 004a 1F4A     		ldr	r2, .L8+4
 138 004c 1A60     		str	r2, [r3]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	/*sätter våra in och ut portar*/
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	*GPIOD_OTYPER = 0x70;
 139              		.loc 1 90 0
 140 004e 1F4B     		ldr	r3, .L8+8
 141 0050 7022     		movs	r2, #112
 142 0052 1A80     		strh	r2, [r3]
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	*GPIOD_PUPDR = 0x0AA;
 143              		.loc 1 91 0
 144 0054 1E4B     		ldr	r3, .L8+12
 145 0056 AA22     		movs	r2, #170
 146 0058 1A60     		str	r2, [r3]
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
 147              		.loc 1 92 0
 148 005a 1E4B     		ldr	r3, .L8+16
 149 005c 1D4A     		ldr	r2, .L8+16
 150 005e 1278     		ldrb	r2, [r2]
 151 0060 D2B2     		uxtb	r2, r2
 152 0062 1A70     		strb	r2, [r3]
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****     
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****   *GPIOE_MODER = 0x0100;		/* Data direction digital io */	
 153              		.loc 1 94 0
 154 0064 1C4B     		ldr	r3, .L8+20
 155 0066 8022     		movs	r2, #128
 156 0068 5200     		lsls	r2, r2, #1
 157 006a 1A60     		str	r2, [r3]
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	*GPIOE_PUPDR = 0;			/* Input floating */	
 158              		.loc 1 95 0
 159 006c 1B4B     		ldr	r3, .L8+24
 160 006e 0022     		movs	r2, #0
 161 0070 1A60     		str	r2, [r3]
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	*GPIOE_OTYPER = 0;			/* Output push/pull */	
 162              		.loc 1 96 0
 163 0072 1B4B     		ldr	r3, .L8+28
 164 0074 0022     		movs	r2, #0
 165 0076 1A80     		strh	r2, [r3]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	*GPIOE_ODR_LOW = 0x10;		/* RESET Flipflop */
 166              		.loc 1 98 0
 167 0078 1A4B     		ldr	r3, .L8+32
 168 007a 1022     		movs	r2, #16
 169 007c 1A70     		strb	r2, [r3]
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	*GPIOE_ODR_LOW = ~0x10;   
 170              		.loc 1 99 0
 171 007e 194B     		ldr	r3, .L8+32
 172 0080 EF22     		movs	r2, #239
 173 0082 1A70     		strb	r2, [r3]
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****     
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****   
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Koppla PE3 till avbrottslina EXTI3 */
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****   	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x4444;
 174              		.loc 1 104 0
 175 0084 184B     		ldr	r3, .L8+36
 176 0086 184A     		ldr	r2, .L8+36
 177 0088 1268     		ldr	r2, [r2]
 178 008a 1849     		ldr	r1, .L8+40
 179 008c 0A43     		orrs	r2, r1
 180 008e 1A60     		str	r2, [r3]
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Konfigurera EXTI3 för att generera avbrott */
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****   	 *((unsigned int *) EXTI_IMR) |= EXTI3_IRQ_BPOS;
 181              		.loc 1 106 0
 182 0090 174B     		ldr	r3, .L8+44
 183 0092 174A     		ldr	r2, .L8+44
 184 0094 1268     		ldr	r2, [r2]
 185 0096 0821     		movs	r1, #8
 186 0098 0A43     		orrs	r2, r1
 187 009a 1A60     		str	r2, [r3]
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Konfigurera för avbrott på negativ flank */
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****  	 *((unsigned int *) EXTI_FTSR) |= EXTI3_IRQ_BPOS;		
 188              		.loc 1 108 0
 189 009c 154B     		ldr	r3, .L8+48
 190 009e 154A     		ldr	r2, .L8+48
 191 00a0 1268     		ldr	r2, [r2]
 192 00a2 0821     		movs	r1, #8
 193 00a4 0A43     		orrs	r2, r1
 194 00a6 1A60     		str	r2, [r3]
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** 	/* Sätt upp avbrottsvektor */
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****   	 *((void (**)(void) ) EXTI3_IRQVEC ) = irq_handler;     
 195              		.loc 1 110 0
 196 00a8 134B     		ldr	r3, .L8+52
 197 00aa 144A     		ldr	r2, .L8+56
 198 00ac 1A60     		str	r2, [r3]
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****    	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****      *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI3_IRQ_BPOS; 
 199              		.loc 1 112 0
 200 00ae 144B     		ldr	r3, .L8+60
 201 00b0 134A     		ldr	r2, .L8+60
 202 00b2 1268     		ldr	r2, [r2]
 203 00b4 8021     		movs	r1, #128
 204 00b6 8900     		lsls	r1, r1, #2
 205 00b8 0A43     		orrs	r2, r1
 206 00ba 1A60     		str	r2, [r3]
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** }
 207              		.loc 1 113 0
 208 00bc C046     		nop
 209 00be BD46     		mov	sp, r7
 210              		@ sp needed
 211 00c0 80BD     		pop	{r7, pc}
 212              	.L9:
 213 00c2 C046     		.align	2
 214              	.L8:
 215 00c4 000C0240 		.word	1073875968
 216 00c8 55555555 		.word	1431655765
 217 00cc 040C0240 		.word	1073875972
 218 00d0 0C0C0240 		.word	1073875980
 219 00d4 150C0240 		.word	1073875989
 220 00d8 00100240 		.word	1073876992
 221 00dc 0C100240 		.word	1073877004
 222 00e0 04100240 		.word	1073876996
 223 00e4 14100240 		.word	1073877012
 224 00e8 08380140 		.word	1073821704
 225 00ec 44440000 		.word	17476
 226 00f0 003C0140 		.word	1073822720
 227 00f4 0C3C0140 		.word	1073822732
 228 00f8 64C00120 		.word	536985700
 229 00fc 00000000 		.word	irq_handler
 230 0100 00E100E0 		.word	-536813312
 231              		.cfi_endproc
 232              	.LFE2:
 234              		.align	1
 235              		.global	main
 236              		.syntax unified
 237              		.code	16
 238              		.thumb_func
 239              		.fpu softvfp
 241              	main:
 242              	.LFB3:
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** void main(void)
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c **** {
 243              		.loc 1 115 0
 244              		.cfi_startproc
 245              		@ args = 0, pretend = 0, frame = 0
 246              		@ frame_needed = 1, uses_anonymous_args = 0
 247 0104 80B5     		push	{r7, lr}
 248              		.cfi_def_cfa_offset 8
 249              		.cfi_offset 7, -8
 250              		.cfi_offset 14, -4
 251 0106 00AF     		add	r7, sp, #0
 252              		.cfi_def_cfa_register 7
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****     init_app();
 253              		.loc 1 116 0
 254 0108 FFF7FEFF 		bl	init_app
 255              	.L11:
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****     while(1){
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack\startup.c ****         *GPIOD_ODR_LOW = c;
 256              		.loc 1 118 0 discriminator 1
 257 010c 024A     		ldr	r2, .L12
 258 010e 034B     		ldr	r3, .L12+4
 259 0110 1B68     		ldr	r3, [r3]
 260 0112 DBB2     		uxtb	r3, r3
 261 0114 1370     		strb	r3, [r2]
 262 0116 F9E7     		b	.L11
 263              	.L13:
 264              		.align	2
 265              	.L12:
 266 0118 140C0240 		.word	1073875988
 267 011c 00000000 		.word	c
 268              		.cfi_endproc
 269              	.LFE3:
 271              	.Letext0:
