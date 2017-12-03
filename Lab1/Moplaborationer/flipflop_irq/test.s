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
  30              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****  #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define	GPIO_D			0x40020C00
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO beh�
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste 
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define	GPIO_E			0x40021000
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 b
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO beh�
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste 
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define SYSCFG_EXTICR1	0x40013808
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define EXTI_IMR	0x40013C00
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define EXTI_FTSR	0x40013C0C
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define EXTI_PR	0x40013C14
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define NVIC_ISER0	0xE000E100
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define EXTI3_IRQ_BPOS	(1<<3)
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define EXTI3_IRQVEC	0x2001C064
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define NVIC_EXTI3_IRQ_BPOS	(1<<9)
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define B_E 0x40 // Enable
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define B_RST 0x20 // Reset
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define B_CS2 0x10 // Controller Select 2
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define B_CS1 8 // Controller Select 1
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define B_RW 2 // 0 Write, 1 Read
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define B_RS 1 // 0 Command, 1 Data
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define LCD_ON 0x3F // Display on
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define LCD_OFF 0x3E // Display off
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define LCD_DISP_START 0xC0 // Start address
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** #define LCD_BUSY 0x80 // Read busy status
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** static volatile int c = 0;
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** void startup ( void )
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** {
  31              		.loc 1 58 0
  32              		.cfi_startproc
  33              		@ Naked Function: prologue and epilogue provided by programmer.
  34              		@ args = 0, pretend = 0, frame = 0
  35              		@ frame_needed = 1, uses_anonymous_args = 0
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** __asm volatile(
  36              		.loc 1 59 0
  37              		.syntax divided
  38              	@ 59 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq/startup.c" 1
  39 0000 0248     		 LDR R0,=0x2001C000
  40 0002 8546     	 MOV SP,R0
  41 0004 FFF7FEFF 	 BL main
  42 0008 FEE7     	_exit: B .
  43              	
  44              	@ 0 "" 2
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	" MOV SP,R0\n"
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	" BL main\n"				/* call main */
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	) ;
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** }
  45              		.loc 1 65 0
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
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** void irq_handler ( void )
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** {
  62              		.loc 1 67 0
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 0
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 0002 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	/* Om avbrott från EXTI3:
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 		kvittera avbrott från EXTI3 */
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	if(   *((unsigned int *) EXTI_PR) & EXTI3_IRQ_BPOS )
  72              		.loc 1 70 0
  73 0004 094B     		ldr	r3, .L5
  74 0006 1B68     		ldr	r3, [r3]
  75 0008 0822     		movs	r2, #8
  76 000a 1340     		ands	r3, r2
  77 000c 0AD0     		beq	.L4
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	{
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****         c++;
  78              		.loc 1 72 0
  79 000e 084B     		ldr	r3, .L5+4
  80 0010 1B68     		ldr	r3, [r3]
  81 0012 5A1C     		adds	r2, r3, #1
  82 0014 064B     		ldr	r3, .L5+4
  83 0016 1A60     		str	r2, [r3]
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****        *((unsigned int *) EXTI_PR) |= EXTI3_IRQ_BPOS;
  84              		.loc 1 73 0
  85 0018 044B     		ldr	r3, .L5
  86 001a 044A     		ldr	r2, .L5
  87 001c 1268     		ldr	r2, [r2]
  88 001e 0821     		movs	r1, #8
  89 0020 0A43     		orrs	r2, r1
  90 0022 1A60     		str	r2, [r3]
  91              	.L4:
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****  	}
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** }
  92              		.loc 1 75 0
  93 0024 C046     		nop
  94 0026 BD46     		mov	sp, r7
  95              		@ sp needed
  96 0028 80BD     		pop	{r7, pc}
  97              	.L6:
  98 002a C046     		.align	2
  99              	.L5:
 100 002c 143C0140 		.word	1073822740
 101 0030 00000000 		.word	c
 102              		.cfi_endproc
 103              	.LFE1:
 105              		.align	1
 106              		.global	init_app
 107              		.syntax unified
 108              		.code	16
 109              		.thumb_func
 110              		.fpu softvfp
 112              	init_app:
 113              	.LFB2:
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** void init_app( void )
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** {   
 114              		.loc 1 78 0
 115              		.cfi_startproc
 116              		@ args = 0, pretend = 0, frame = 0
 117              		@ frame_needed = 1, uses_anonymous_args = 0
 118 0034 80B5     		push	{r7, lr}
 119              		.cfi_def_cfa_offset 8
 120              		.cfi_offset 7, -8
 121              		.cfi_offset 14, -4
 122 0036 00AF     		add	r7, sp, #0
 123              		.cfi_def_cfa_register 7
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****   
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****   *GPIOD_MODER = 0x55555555;
 124              		.loc 1 80 0
 125 0038 1E4B     		ldr	r3, .L8
 126 003a 1F4A     		ldr	r2, .L8+4
 127 003c 1A60     		str	r2, [r3]
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	/*sätter våra in och ut portar*/
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	*GPIOD_OTYPER = 0x70;
 128              		.loc 1 82 0
 129 003e 1F4B     		ldr	r3, .L8+8
 130 0040 7022     		movs	r2, #112
 131 0042 1A80     		strh	r2, [r3]
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	*GPIOD_PUPDR = 0x0AA;
 132              		.loc 1 83 0
 133 0044 1E4B     		ldr	r3, .L8+12
 134 0046 AA22     		movs	r2, #170
 135 0048 1A60     		str	r2, [r3]
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
 136              		.loc 1 84 0
 137 004a 1E4B     		ldr	r3, .L8+16
 138 004c 1D4A     		ldr	r2, .L8+16
 139 004e 1278     		ldrb	r2, [r2]
 140 0050 D2B2     		uxtb	r2, r2
 141 0052 1A70     		strb	r2, [r3]
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****     
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****   *GPIOE_MODER = 0x100;		/* Data direction digital io */	
 142              		.loc 1 86 0
 143 0054 1C4B     		ldr	r3, .L8+20
 144 0056 8022     		movs	r2, #128
 145 0058 5200     		lsls	r2, r2, #1
 146 005a 1A60     		str	r2, [r3]
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	*GPIOE_PUPDR = 0;			/* Input floating */	
 147              		.loc 1 87 0
 148 005c 1B4B     		ldr	r3, .L8+24
 149 005e 0022     		movs	r2, #0
 150 0060 1A60     		str	r2, [r3]
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	*GPIOE_OTYPER = 0;			/* Output push/pull */	
 151              		.loc 1 88 0
 152 0062 1B4B     		ldr	r3, .L8+28
 153 0064 0022     		movs	r2, #0
 154 0066 1A80     		strh	r2, [r3]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	*GPIOE_ODR_LOW = 0x10;		/* RESET Flipflop */
 155              		.loc 1 90 0
 156 0068 1A4B     		ldr	r3, .L8+32
 157 006a 1022     		movs	r2, #16
 158 006c 1A70     		strb	r2, [r3]
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	*GPIOE_ODR_LOW = ~0x10;   
 159              		.loc 1 91 0
 160 006e 194B     		ldr	r3, .L8+32
 161 0070 EF22     		movs	r2, #239
 162 0072 1A70     		strb	r2, [r3]
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****     
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****   
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	/* Koppla PE3 till avbrottslina EXTI3 */
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****   	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
 163              		.loc 1 96 0
 164 0074 184B     		ldr	r3, .L8+36
 165 0076 184A     		ldr	r2, .L8+36
 166 0078 1268     		ldr	r2, [r2]
 167 007a 8021     		movs	r1, #128
 168 007c C901     		lsls	r1, r1, #7
 169 007e 0A43     		orrs	r2, r1
 170 0080 1A60     		str	r2, [r3]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	/* Konfigurera EXTI3 för att generera avbrott */
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****   	 *((unsigned int *) EXTI_IMR) |= EXTI3_IRQ_BPOS;
 171              		.loc 1 98 0
 172 0082 164B     		ldr	r3, .L8+40
 173 0084 154A     		ldr	r2, .L8+40
 174 0086 1268     		ldr	r2, [r2]
 175 0088 0821     		movs	r1, #8
 176 008a 0A43     		orrs	r2, r1
 177 008c 1A60     		str	r2, [r3]
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	/* Konfigurera för avbrott på negativ flank */
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****  	 *((unsigned int *) EXTI_FTSR) |= EXTI3_IRQ_BPOS;		
 178              		.loc 1 100 0
 179 008e 144B     		ldr	r3, .L8+44
 180 0090 134A     		ldr	r2, .L8+44
 181 0092 1268     		ldr	r2, [r2]
 182 0094 0821     		movs	r1, #8
 183 0096 0A43     		orrs	r2, r1
 184 0098 1A60     		str	r2, [r3]
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** 	/* Sätt upp avbrottsvektor */
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****   	 *((void (**)(void) ) EXTI3_IRQVEC ) = irq_handler;     
 185              		.loc 1 102 0
 186 009a 124B     		ldr	r3, .L8+48
 187 009c 124A     		ldr	r2, .L8+52
 188 009e 1A60     		str	r2, [r3]
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****    	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI3 kopplats till */
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****      *((unsigned int *) NVIC_ISER0) |= NVIC_EXTI3_IRQ_BPOS; 
 189              		.loc 1 104 0
 190 00a0 124B     		ldr	r3, .L8+56
 191 00a2 124A     		ldr	r2, .L8+56
 192 00a4 1268     		ldr	r2, [r2]
 193 00a6 8021     		movs	r1, #128
 194 00a8 8900     		lsls	r1, r1, #2
 195 00aa 0A43     		orrs	r2, r1
 196 00ac 1A60     		str	r2, [r3]
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** }
 197              		.loc 1 105 0
 198 00ae C046     		nop
 199 00b0 BD46     		mov	sp, r7
 200              		@ sp needed
 201 00b2 80BD     		pop	{r7, pc}
 202              	.L9:
 203              		.align	2
 204              	.L8:
 205 00b4 000C0240 		.word	1073875968
 206 00b8 55555555 		.word	1431655765
 207 00bc 040C0240 		.word	1073875972
 208 00c0 0C0C0240 		.word	1073875980
 209 00c4 150C0240 		.word	1073875989
 210 00c8 00100240 		.word	1073876992
 211 00cc 0C100240 		.word	1073877004
 212 00d0 04100240 		.word	1073876996
 213 00d4 14100240 		.word	1073877012
 214 00d8 08380140 		.word	1073821704
 215 00dc 003C0140 		.word	1073822720
 216 00e0 0C3C0140 		.word	1073822732
 217 00e4 64C00120 		.word	536985700
 218 00e8 00000000 		.word	irq_handler
 219 00ec 00E100E0 		.word	-536813312
 220              		.cfi_endproc
 221              	.LFE2:
 223              		.align	1
 224              		.global	main
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	main:
 231              	.LFB3:
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** void main(void)
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c **** {
 232              		.loc 1 107 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 0
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00f0 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00f2 00AF     		add	r7, sp, #0
 241              		.cfi_def_cfa_register 7
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****     init_app();
 242              		.loc 1 108 0
 243 00f4 FFF7FEFF 		bl	init_app
 244              	.L11:
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****     while(1){
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq\startup.c ****         *GPIOD_ODR_LOW = c;
 245              		.loc 1 110 0 discriminator 1
 246 00f8 024A     		ldr	r2, .L12
 247 00fa 034B     		ldr	r3, .L12+4
 248 00fc 1B68     		ldr	r3, [r3]
 249 00fe DBB2     		uxtb	r3, r3
 250 0100 1370     		strb	r3, [r2]
 251 0102 F9E7     		b	.L11
 252              	.L13:
 253              		.align	2
 254              	.L12:
 255 0104 140C0240 		.word	1073875988
 256 0108 00000000 		.word	c
 257              		.cfi_endproc
 258              	.LFE3:
 260              	.Letext0:
