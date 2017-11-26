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
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****  typedef unsigned char uint8_t;
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****  
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define	GPIO_D			0x40020C00
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 by
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO behöv
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste m
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste m
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define	GPIO_E			0x40021000
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 by
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO behöv
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste m
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste m
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define B_E 0x40 // Enable
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define B_RST 0x20 // Reset
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define B_CS2 0x10 // Controller Select 2
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define B_CS1 8 // Controller Select 1
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define B_RW 2 // 0 Write, 1 Read
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define B_RS 1 // 0 Command, 1 Data
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define LCD_ON 0x3F // Display on
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define LCD_OFF 0x3E // Display off
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define LCD_DISP_START 0xC0 // Start address
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #define LCD_BUSY 0x80 // Read busy status
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void startup ( void )
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** {
  26              		.loc 1 50 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** __asm volatile(
  31              		.loc 1 51 0
  32              		.syntax divided
  33              	@ 51 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	" MOV SP,R0\n"
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	" BL main\n"				/* call main */
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	) ;
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
  40              		.loc 1 57 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	init_app
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_app:
  56              	.LFB1:
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void init_app(void){
  57              		.loc 1 58 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     *GPIOE_MODER = 0x55555555;
  67              		.loc 1 59 0
  68 0004 084B     		ldr	r3, .L3
  69 0006 094A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	/*sätter våra in och ut portar*/
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	*GPIOE_OTYPER = 0x70;
  71              		.loc 1 61 0
  72 000a 094B     		ldr	r3, .L3+8
  73 000c 7022     		movs	r2, #112
  74 000e 1A80     		strh	r2, [r3]
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	*GPIOE_PUPDR = 0x0AA;
  75              		.loc 1 62 0
  76 0010 084B     		ldr	r3, .L3+12
  77 0012 AA22     		movs	r2, #170
  78 0014 1A60     		str	r2, [r3]
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 	*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
  79              		.loc 1 63 0
  80 0016 084B     		ldr	r3, .L3+16
  81 0018 074A     		ldr	r2, .L3+16
  82 001a 1278     		ldrb	r2, [r2]
  83 001c D2B2     		uxtb	r2, r2
  84 001e 1A70     		strb	r2, [r3]
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
  85              		.loc 1 64 0
  86 0020 C046     		nop
  87 0022 BD46     		mov	sp, r7
  88              		@ sp needed
  89 0024 80BD     		pop	{r7, pc}
  90              	.L4:
  91 0026 C046     		.align	2
  92              	.L3:
  93 0028 00100240 		.word	1073876992
  94 002c 55555555 		.word	1431655765
  95 0030 04100240 		.word	1073876996
  96 0034 0C100240 		.word	1073877004
  97 0038 15100240 		.word	1073877013
  98              		.cfi_endproc
  99              	.LFE1:
 101              		.align	1
 102              		.global	main
 103              		.syntax unified
 104              		.code	16
 105              		.thumb_func
 106              		.fpu softvfp
 108              	main:
 109              	.LFB2:
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void main(void)
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** {
 110              		.loc 1 66 0
 111              		.cfi_startproc
 112              		@ args = 0, pretend = 0, frame = 16
 113              		@ frame_needed = 1, uses_anonymous_args = 0
 114 003c 80B5     		push	{r7, lr}
 115              		.cfi_def_cfa_offset 8
 116              		.cfi_offset 7, -8
 117              		.cfi_offset 14, -4
 118 003e 84B0     		sub	sp, sp, #16
 119              		.cfi_def_cfa_offset 24
 120 0040 00AF     		add	r7, sp, #0
 121              		.cfi_def_cfa_register 7
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****    init_app();
 122              		.loc 1 67 0
 123 0042 FFF7FEFF 		bl	init_app
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_initialize();
 124              		.loc 1 68 0
 125 0046 FFF7FEFF 		bl	graphic_initialize
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_clear_screen();// simulator onely
 126              		.loc 1 69 0
 127 004a FFF7FEFF 		bl	graphic_clear_screen
 128              	.LBB2:
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 128; i++){
 129              		.loc 1 70 0
 130 004e 0023     		movs	r3, #0
 131 0050 FB60     		str	r3, [r7, #12]
 132 0052 08E0     		b	.L6
 133              	.L7:
 134              	.LBB3:
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(i,10,1);
 135              		.loc 1 71 0 discriminator 3
 136 0054 FB68     		ldr	r3, [r7, #12]
 137 0056 0122     		movs	r2, #1
 138 0058 0A21     		movs	r1, #10
 139 005a 1800     		movs	r0, r3
 140 005c FFF7FEFF 		bl	pixel
 141              	.LBE3:
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 128; i++){
 142              		.loc 1 70 0 discriminator 3
 143 0060 FB68     		ldr	r3, [r7, #12]
 144 0062 0133     		adds	r3, r3, #1
 145 0064 FB60     		str	r3, [r7, #12]
 146              	.L6:
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 128; i++){
 147              		.loc 1 70 0 is_stmt 0 discriminator 1
 148 0066 FB68     		ldr	r3, [r7, #12]
 149 0068 7F2B     		cmp	r3, #127
 150 006a F3DD     		ble	.L7
 151              	.LBE2:
 152              	.LBB4:
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 64; i++){
 153              		.loc 1 73 0 is_stmt 1
 154 006c 0023     		movs	r3, #0
 155 006e BB60     		str	r3, [r7, #8]
 156 0070 08E0     		b	.L8
 157              	.L9:
 158              	.LBB5:
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(10,i,1);
 159              		.loc 1 74 0 discriminator 3
 160 0072 BB68     		ldr	r3, [r7, #8]
 161 0074 0122     		movs	r2, #1
 162 0076 1900     		movs	r1, r3
 163 0078 0A20     		movs	r0, #10
 164 007a FFF7FEFF 		bl	pixel
 165              	.LBE5:
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(10,i,1);
 166              		.loc 1 73 0 discriminator 3
 167 007e BB68     		ldr	r3, [r7, #8]
 168 0080 0133     		adds	r3, r3, #1
 169 0082 BB60     		str	r3, [r7, #8]
 170              	.L8:
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(10,i,1);
 171              		.loc 1 73 0 is_stmt 0 discriminator 1
 172 0084 BB68     		ldr	r3, [r7, #8]
 173 0086 3F2B     		cmp	r3, #63
 174 0088 F3DD     		ble	.L9
 175              	.LBE4:
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_milli(500);
 176              		.loc 1 76 0 is_stmt 1
 177 008a FA23     		movs	r3, #250
 178 008c 5B00     		lsls	r3, r3, #1
 179 008e 1800     		movs	r0, r3
 180 0090 FFF7FEFF 		bl	delay_milli
 181              	.LBB6:
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 128; i++){
 182              		.loc 1 77 0
 183 0094 0023     		movs	r3, #0
 184 0096 7B60     		str	r3, [r7, #4]
 185 0098 08E0     		b	.L10
 186              	.L11:
 187              	.LBB7:
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(i,10,0);
 188              		.loc 1 78 0 discriminator 3
 189 009a 7B68     		ldr	r3, [r7, #4]
 190 009c 0022     		movs	r2, #0
 191 009e 0A21     		movs	r1, #10
 192 00a0 1800     		movs	r0, r3
 193 00a2 FFF7FEFF 		bl	pixel
 194              	.LBE7:
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 128; i++){
 195              		.loc 1 77 0 discriminator 3
 196 00a6 7B68     		ldr	r3, [r7, #4]
 197 00a8 0133     		adds	r3, r3, #1
 198 00aa 7B60     		str	r3, [r7, #4]
 199              	.L10:
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 128; i++){
 200              		.loc 1 77 0 is_stmt 0 discriminator 1
 201 00ac 7B68     		ldr	r3, [r7, #4]
 202 00ae 7F2B     		cmp	r3, #127
 203 00b0 F3DD     		ble	.L11
 204              	.LBE6:
 205              	.LBB8:
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(int i = 0; i < 64; i++){
 206              		.loc 1 80 0 is_stmt 1
 207 00b2 0023     		movs	r3, #0
 208 00b4 3B60     		str	r3, [r7]
 209 00b6 08E0     		b	.L12
 210              	.L13:
 211              	.LBB9:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(10,i,0);
 212              		.loc 1 81 0 discriminator 3
 213 00b8 3B68     		ldr	r3, [r7]
 214 00ba 0022     		movs	r2, #0
 215 00bc 1900     		movs	r1, r3
 216 00be 0A20     		movs	r0, #10
 217 00c0 FFF7FEFF 		bl	pixel
 218              	.LBE9:
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(10,i,0);
 219              		.loc 1 80 0 discriminator 3
 220 00c4 3B68     		ldr	r3, [r7]
 221 00c6 0133     		adds	r3, r3, #1
 222 00c8 3B60     		str	r3, [r7]
 223              	.L12:
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     pixel(10,i,0);
 224              		.loc 1 80 0 is_stmt 0 discriminator 1
 225 00ca 3B68     		ldr	r3, [r7]
 226 00cc 3F2B     		cmp	r3, #63
 227 00ce F3DD     		ble	.L13
 228              	.LBE8:
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 229              		.loc 1 84 0 is_stmt 1
 230 00d0 C046     		nop
 231 00d2 BD46     		mov	sp, r7
 232 00d4 04B0     		add	sp, sp, #16
 233              		@ sp needed
 234 00d6 80BD     		pop	{r7, pc}
 235              		.cfi_endproc
 236              	.LFE2:
 238              		.align	1
 239              		.global	delay_250ns
 240              		.syntax unified
 241              		.code	16
 242              		.thumb_func
 243              		.fpu softvfp
 245              	delay_250ns:
 246              	.LFB3:
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void delay_250ns(void)
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** {
 247              		.loc 1 87 0
 248              		.cfi_startproc
 249              		@ args = 0, pretend = 0, frame = 0
 250              		@ frame_needed = 1, uses_anonymous_args = 0
 251 00d8 80B5     		push	{r7, lr}
 252              		.cfi_def_cfa_offset 8
 253              		.cfi_offset 7, -8
 254              		.cfi_offset 14, -4
 255 00da 00AF     		add	r7, sp, #0
 256              		.cfi_def_cfa_register 7
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     *STK_CTRL = 0;
 257              		.loc 1 88 0
 258 00dc 0C4B     		ldr	r3, .L16
 259 00de 0022     		movs	r2, #0
 260 00e0 1A60     		str	r2, [r3]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     *STK_LOAD = (168/4)-1;   // minst 500 ns
 261              		.loc 1 89 0
 262 00e2 0C4B     		ldr	r3, .L16+4
 263 00e4 2922     		movs	r2, #41
 264 00e6 1A60     		str	r2, [r3]
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     *STK_VAL = 0;
 265              		.loc 1 90 0
 266 00e8 0B4B     		ldr	r3, .L16+8
 267 00ea 0022     		movs	r2, #0
 268 00ec 1A60     		str	r2, [r3]
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     *STK_CTRL = 5;
 269              		.loc 1 91 0
 270 00ee 084B     		ldr	r3, .L16
 271 00f0 0522     		movs	r2, #5
 272 00f2 1A60     		str	r2, [r3]
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     while((* STK_CTRL & 0x10000) == 0) ;
 273              		.loc 1 92 0
 274 00f4 C046     		nop
 275              	.L15:
 276              		.loc 1 92 0 is_stmt 0 discriminator 1
 277 00f6 064B     		ldr	r3, .L16
 278 00f8 1A68     		ldr	r2, [r3]
 279 00fa 8023     		movs	r3, #128
 280 00fc 5B02     		lsls	r3, r3, #9
 281 00fe 1340     		ands	r3, r2
 282 0100 F9D0     		beq	.L15
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     *STK_CTRL = 0;
 283              		.loc 1 93 0 is_stmt 1
 284 0102 034B     		ldr	r3, .L16
 285 0104 0022     		movs	r2, #0
 286 0106 1A60     		str	r2, [r3]
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 287              		.loc 1 94 0
 288 0108 C046     		nop
 289 010a BD46     		mov	sp, r7
 290              		@ sp needed
 291 010c 80BD     		pop	{r7, pc}
 292              	.L17:
 293 010e C046     		.align	2
 294              	.L16:
 295 0110 10E000E0 		.word	-536813552
 296 0114 14E000E0 		.word	-536813548
 297 0118 18E000E0 		.word	-536813544
 298              		.cfi_endproc
 299              	.LFE3:
 301              		.align	1
 302              		.global	delay_mikro
 303              		.syntax unified
 304              		.code	16
 305              		.thumb_func
 306              		.fpu softvfp
 308              	delay_mikro:
 309              	.LFB4:
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void delay_mikro(unsigned int us)
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** {
 310              		.loc 1 98 0
 311              		.cfi_startproc
 312              		@ args = 0, pretend = 0, frame = 8
 313              		@ frame_needed = 1, uses_anonymous_args = 0
 314 011c 80B5     		push	{r7, lr}
 315              		.cfi_def_cfa_offset 8
 316              		.cfi_offset 7, -8
 317              		.cfi_offset 14, -4
 318 011e 82B0     		sub	sp, sp, #8
 319              		.cfi_def_cfa_offset 16
 320 0120 00AF     		add	r7, sp, #0
 321              		.cfi_def_cfa_register 7
 322 0122 7860     		str	r0, [r7, #4]
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #ifdef   SIMULATOR
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     us = us / 1000;
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     us++;
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** #endif
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     while(us < 0){
 323              		.loc 1 103 0
 324 0124 C046     		nop
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****         {
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             delay_250ns();
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             delay_250ns();
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             delay_250ns();
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             delay_250ns();
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             us--;
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****         }
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 325              		.loc 1 112 0
 326 0126 C046     		nop
 327 0128 BD46     		mov	sp, r7
 328 012a 02B0     		add	sp, sp, #8
 329              		@ sp needed
 330 012c 80BD     		pop	{r7, pc}
 331              		.cfi_endproc
 332              	.LFE4:
 334              		.global	__aeabi_uidiv
 335              		.align	1
 336              		.global	delay_milli
 337              		.syntax unified
 338              		.code	16
 339              		.thumb_func
 340              		.fpu softvfp
 342              	delay_milli:
 343              	.LFB5:
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void delay_milli(unsigned ms)
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** {
 344              		.loc 1 115 0
 345              		.cfi_startproc
 346              		@ args = 0, pretend = 0, frame = 8
 347              		@ frame_needed = 1, uses_anonymous_args = 0
 348 012e 80B5     		push	{r7, lr}
 349              		.cfi_def_cfa_offset 8
 350              		.cfi_offset 7, -8
 351              		.cfi_offset 14, -4
 352 0130 82B0     		sub	sp, sp, #8
 353              		.cfi_def_cfa_offset 16
 354 0132 00AF     		add	r7, sp, #0
 355              		.cfi_def_cfa_register 7
 356 0134 7860     		str	r0, [r7, #4]
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     ms = ms/1000;// simulator onely
 357              		.loc 1 117 0
 358 0136 7A68     		ldr	r2, [r7, #4]
 359 0138 FA23     		movs	r3, #250
 360 013a 9900     		lsls	r1, r3, #2
 361 013c 1000     		movs	r0, r2
 362 013e FFF7FEFF 		bl	__aeabi_uidiv
 363              	.LVL0:
 364 0142 0300     		movs	r3, r0
 365 0144 7B60     		str	r3, [r7, #4]
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     ms++;//simulator
 366              		.loc 1 118 0
 367 0146 7B68     		ldr	r3, [r7, #4]
 368 0148 0133     		adds	r3, r3, #1
 369 014a 7B60     		str	r3, [r7, #4]
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** 
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     while(ms > 0){
 370              		.loc 1 120 0
 371 014c 07E0     		b	.L20
 372              	.L21:
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****         {
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             delay_mikro(1000);
 373              		.loc 1 122 0
 374 014e FA23     		movs	r3, #250
 375 0150 9B00     		lsls	r3, r3, #2
 376 0152 1800     		movs	r0, r3
 377 0154 FFF7FEFF 		bl	delay_mikro
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             ms--;
 378              		.loc 1 123 0
 379 0158 7B68     		ldr	r3, [r7, #4]
 380 015a 013B     		subs	r3, r3, #1
 381 015c 7B60     		str	r3, [r7, #4]
 382              	.L20:
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****         {
 383              		.loc 1 120 0
 384 015e 7B68     		ldr	r3, [r7, #4]
 385 0160 002B     		cmp	r3, #0
 386 0162 F4D1     		bne	.L21
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****             
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****         }
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 387              		.loc 1 127 0
 388 0164 C046     		nop
 389 0166 BD46     		mov	sp, r7
 390 0168 02B0     		add	sp, sp, #8
 391              		@ sp needed
 392 016a 80BD     		pop	{r7, pc}
 393              		.cfi_endproc
 394              	.LFE5:
 396              		.align	1
 397              		.global	delay_500ns
 398              		.syntax unified
 399              		.code	16
 400              		.thumb_func
 401              		.fpu softvfp
 403              	delay_500ns:
 404              	.LFB6:
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void delay_500ns(void){
 405              		.loc 1 128 0
 406              		.cfi_startproc
 407              		@ args = 0, pretend = 0, frame = 0
 408              		@ frame_needed = 1, uses_anonymous_args = 0
 409 016c 80B5     		push	{r7, lr}
 410              		.cfi_def_cfa_offset 8
 411              		.cfi_offset 7, -8
 412              		.cfi_offset 14, -4
 413 016e 00AF     		add	r7, sp, #0
 414              		.cfi_def_cfa_register 7
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     delay_250ns();
 415              		.loc 1 129 0
 416 0170 FFF7FEFF 		bl	delay_250ns
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     delay_250ns();
 417              		.loc 1 130 0
 418 0174 FFF7FEFF 		bl	delay_250ns
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     }
 419              		.loc 1 131 0
 420 0178 C046     		nop
 421 017a BD46     		mov	sp, r7
 422              		@ sp needed
 423 017c 80BD     		pop	{r7, pc}
 424              		.cfi_endproc
 425              	.LFE6:
 427              		.align	1
 428              		.syntax unified
 429              		.code	16
 430              		.thumb_func
 431              		.fpu softvfp
 433              	graphic_ctrl_bit_set:
 434              	.LFB7:
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** static void graphic_ctrl_bit_set(uint8_t x) {
 435              		.loc 1 132 0
 436              		.cfi_startproc
 437              		@ args = 0, pretend = 0, frame = 16
 438              		@ frame_needed = 1, uses_anonymous_args = 0
 439 017e 80B5     		push	{r7, lr}
 440              		.cfi_def_cfa_offset 8
 441              		.cfi_offset 7, -8
 442              		.cfi_offset 14, -4
 443 0180 84B0     		sub	sp, sp, #16
 444              		.cfi_def_cfa_offset 24
 445 0182 00AF     		add	r7, sp, #0
 446              		.cfi_def_cfa_register 7
 447 0184 0200     		movs	r2, r0
 448 0186 FB1D     		adds	r3, r7, #7
 449 0188 1A70     		strb	r2, [r3]
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** uint8_t c;
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c = *GPIOE_ODR_LOW;
 450              		.loc 1 134 0
 451 018a 124A     		ldr	r2, .L24
 452 018c 0F23     		movs	r3, #15
 453 018e FB18     		adds	r3, r7, r3
 454 0190 1278     		ldrb	r2, [r2]
 455 0192 1A70     		strb	r2, [r3]
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c &= ~B_SELECT;
 456              		.loc 1 135 0
 457 0194 0F23     		movs	r3, #15
 458 0196 FB18     		adds	r3, r7, r3
 459 0198 0F22     		movs	r2, #15
 460 019a BA18     		adds	r2, r7, r2
 461 019c 1278     		ldrb	r2, [r2]
 462 019e 0421     		movs	r1, #4
 463 01a0 8A43     		bics	r2, r1
 464 01a2 1A70     		strb	r2, [r3]
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c |= (~B_SELECT & x);
 465              		.loc 1 136 0
 466 01a4 FB1D     		adds	r3, r7, #7
 467 01a6 1B78     		ldrb	r3, [r3]
 468 01a8 5BB2     		sxtb	r3, r3
 469 01aa 0422     		movs	r2, #4
 470 01ac 9343     		bics	r3, r2
 471 01ae 5AB2     		sxtb	r2, r3
 472 01b0 0F23     		movs	r3, #15
 473 01b2 FB18     		adds	r3, r7, r3
 474 01b4 1B78     		ldrb	r3, [r3]
 475 01b6 5BB2     		sxtb	r3, r3
 476 01b8 1343     		orrs	r3, r2
 477 01ba 5AB2     		sxtb	r2, r3
 478 01bc 0F23     		movs	r3, #15
 479 01be FB18     		adds	r3, r7, r3
 480 01c0 1A70     		strb	r2, [r3]
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** *GPIOE_ODR_LOW = c;
 481              		.loc 1 137 0
 482 01c2 044A     		ldr	r2, .L24
 483 01c4 0F23     		movs	r3, #15
 484 01c6 FB18     		adds	r3, r7, r3
 485 01c8 1B78     		ldrb	r3, [r3]
 486 01ca 1370     		strb	r3, [r2]
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 487              		.loc 1 138 0
 488 01cc C046     		nop
 489 01ce BD46     		mov	sp, r7
 490 01d0 04B0     		add	sp, sp, #16
 491              		@ sp needed
 492 01d2 80BD     		pop	{r7, pc}
 493              	.L25:
 494              		.align	2
 495              	.L24:
 496 01d4 14100240 		.word	1073877012
 497              		.cfi_endproc
 498              	.LFE7:
 500              		.align	1
 501              		.syntax unified
 502              		.code	16
 503              		.thumb_func
 504              		.fpu softvfp
 506              	graphic_ctrl_bit_clear:
 507              	.LFB8:
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** static void graphic_ctrl_bit_clear(uint8_t x) {
 508              		.loc 1 139 0
 509              		.cfi_startproc
 510              		@ args = 0, pretend = 0, frame = 16
 511              		@ frame_needed = 1, uses_anonymous_args = 0
 512 01d8 80B5     		push	{r7, lr}
 513              		.cfi_def_cfa_offset 8
 514              		.cfi_offset 7, -8
 515              		.cfi_offset 14, -4
 516 01da 84B0     		sub	sp, sp, #16
 517              		.cfi_def_cfa_offset 24
 518 01dc 00AF     		add	r7, sp, #0
 519              		.cfi_def_cfa_register 7
 520 01de 0200     		movs	r2, r0
 521 01e0 FB1D     		adds	r3, r7, #7
 522 01e2 1A70     		strb	r2, [r3]
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** uint8_t c;
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c = *GPIOE_ODR_LOW;
 523              		.loc 1 141 0
 524 01e4 114A     		ldr	r2, .L27
 525 01e6 0F23     		movs	r3, #15
 526 01e8 FB18     		adds	r3, r7, r3
 527 01ea 1278     		ldrb	r2, [r2]
 528 01ec 1A70     		strb	r2, [r3]
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c &= ~B_SELECT;
 529              		.loc 1 142 0
 530 01ee 0F23     		movs	r3, #15
 531 01f0 FB18     		adds	r3, r7, r3
 532 01f2 0F22     		movs	r2, #15
 533 01f4 BA18     		adds	r2, r7, r2
 534 01f6 1278     		ldrb	r2, [r2]
 535 01f8 0421     		movs	r1, #4
 536 01fa 8A43     		bics	r2, r1
 537 01fc 1A70     		strb	r2, [r3]
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c &= ~x;
 538              		.loc 1 143 0
 539 01fe FB1D     		adds	r3, r7, #7
 540 0200 1B78     		ldrb	r3, [r3]
 541 0202 5BB2     		sxtb	r3, r3
 542 0204 DB43     		mvns	r3, r3
 543 0206 5BB2     		sxtb	r3, r3
 544 0208 0F22     		movs	r2, #15
 545 020a BA18     		adds	r2, r7, r2
 546 020c 1278     		ldrb	r2, [r2]
 547 020e 52B2     		sxtb	r2, r2
 548 0210 1340     		ands	r3, r2
 549 0212 5AB2     		sxtb	r2, r3
 550 0214 0F23     		movs	r3, #15
 551 0216 FB18     		adds	r3, r7, r3
 552 0218 1A70     		strb	r2, [r3]
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** *GPIOE_ODR_LOW = c;
 553              		.loc 1 144 0
 554 021a 044A     		ldr	r2, .L27
 555 021c 0F23     		movs	r3, #15
 556 021e FB18     		adds	r3, r7, r3
 557 0220 1B78     		ldrb	r3, [r3]
 558 0222 1370     		strb	r3, [r2]
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 559              		.loc 1 145 0
 560 0224 C046     		nop
 561 0226 BD46     		mov	sp, r7
 562 0228 04B0     		add	sp, sp, #16
 563              		@ sp needed
 564 022a 80BD     		pop	{r7, pc}
 565              	.L28:
 566              		.align	2
 567              	.L27:
 568 022c 14100240 		.word	1073877012
 569              		.cfi_endproc
 570              	.LFE8:
 572              		.align	1
 573              		.syntax unified
 574              		.code	16
 575              		.thumb_func
 576              		.fpu softvfp
 578              	select_controller:
 579              	.LFB9:
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** static void select_controller(uint8_t controller){
 580              		.loc 1 146 0
 581              		.cfi_startproc
 582              		@ args = 0, pretend = 0, frame = 8
 583              		@ frame_needed = 1, uses_anonymous_args = 0
 584 0230 80B5     		push	{r7, lr}
 585              		.cfi_def_cfa_offset 8
 586              		.cfi_offset 7, -8
 587              		.cfi_offset 14, -4
 588 0232 82B0     		sub	sp, sp, #8
 589              		.cfi_def_cfa_offset 16
 590 0234 00AF     		add	r7, sp, #0
 591              		.cfi_def_cfa_register 7
 592 0236 0200     		movs	r2, r0
 593 0238 FB1D     		adds	r3, r7, #7
 594 023a 1A70     		strb	r2, [r3]
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     switch(controller){
 595              		.loc 1 147 0
 596 023c FB1D     		adds	r3, r7, #7
 597 023e 1B78     		ldrb	r3, [r3]
 598 0240 082B     		cmp	r3, #8
 599 0242 0CD0     		beq	.L31
 600 0244 02DC     		bgt	.L32
 601 0246 002B     		cmp	r3, #0
 602 0248 05D0     		beq	.L33
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     case 0:
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_clear(B_CS1|B_CS2);
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     case B_CS1 :
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_set(B_CS1);
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_clear(B_CS2);
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     case B_CS2 :
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_set(B_CS2);
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_clear(B_CS1);
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     case B_CS1|B_CS2 :
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_set(B_CS1|B_CS2);
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 603              		.loc 1 163 0
 604 024a 1AE0     		b	.L36
 605              	.L32:
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     switch(controller){
 606              		.loc 1 147 0
 607 024c 102B     		cmp	r3, #16
 608 024e 0DD0     		beq	.L34
 609 0250 182B     		cmp	r3, #24
 610 0252 12D0     		beq	.L35
 611              		.loc 1 163 0
 612 0254 15E0     		b	.L36
 613              	.L33:
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 614              		.loc 1 149 0
 615 0256 1820     		movs	r0, #24
 616 0258 FFF7BEFF 		bl	graphic_ctrl_bit_clear
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     case B_CS1 :
 617              		.loc 1 150 0
 618 025c 11E0     		b	.L30
 619              	.L31:
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_clear(B_CS2);
 620              		.loc 1 152 0
 621 025e 0820     		movs	r0, #8
 622 0260 FFF78DFF 		bl	graphic_ctrl_bit_set
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 623              		.loc 1 153 0
 624 0264 1020     		movs	r0, #16
 625 0266 FFF7B7FF 		bl	graphic_ctrl_bit_clear
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     case B_CS2 :
 626              		.loc 1 154 0
 627 026a 0AE0     		b	.L30
 628              	.L34:
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     graphic_ctrl_bit_clear(B_CS1);
 629              		.loc 1 156 0
 630 026c 1020     		movs	r0, #16
 631 026e FFF786FF 		bl	graphic_ctrl_bit_set
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 632              		.loc 1 157 0
 633 0272 0820     		movs	r0, #8
 634 0274 FFF7B0FF 		bl	graphic_ctrl_bit_clear
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     case B_CS1|B_CS2 :
 635              		.loc 1 158 0
 636 0278 03E0     		b	.L30
 637              	.L35:
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c ****     break;
 638              		.loc 1 160 0
 639 027a 1820     		movs	r0, #24
 640 027c FFF77FFF 		bl	graphic_ctrl_bit_set
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 641              		.loc 1 161 0
 642 0280 C046     		nop
 643              	.L30:
 644              	.L36:
 645              		.loc 1 163 0
 646 0282 C046     		nop
 647 0284 BD46     		mov	sp, r7
 648 0286 02B0     		add	sp, sp, #8
 649              		@ sp needed
 650 0288 80BD     		pop	{r7, pc}
 651              		.cfi_endproc
 652              	.LFE9:
 654              		.align	1
 655              		.global	graphic_initialize
 656              		.syntax unified
 657              		.code	16
 658              		.thumb_func
 659              		.fpu softvfp
 661              	graphic_initialize:
 662              	.LFB10:
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void graphic_initialize(void) {
 663              		.loc 1 164 0
 664              		.cfi_startproc
 665              		@ args = 0, pretend = 0, frame = 0
 666              		@ frame_needed = 1, uses_anonymous_args = 0
 667 028a 80B5     		push	{r7, lr}
 668              		.cfi_def_cfa_offset 8
 669              		.cfi_offset 7, -8
 670              		.cfi_offset 14, -4
 671 028c 00AF     		add	r7, sp, #0
 672              		.cfi_def_cfa_register 7
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_E);
 673              		.loc 1 165 0
 674 028e 4020     		movs	r0, #64
 675 0290 FFF775FF 		bl	graphic_ctrl_bit_set
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_mikro(10);
 676              		.loc 1 166 0
 677 0294 0A20     		movs	r0, #10
 678 0296 FFF7FEFF 		bl	delay_mikro
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 679              		.loc 1 167 0
 680 029a 7820     		movs	r0, #120
 681 029c FFF79CFF 		bl	graphic_ctrl_bit_clear
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_milli(30);
 682              		.loc 1 168 0
 683 02a0 1E20     		movs	r0, #30
 684 02a2 FFF7FEFF 		bl	delay_milli
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_RST);
 685              		.loc 1 169 0
 686 02a6 2020     		movs	r0, #32
 687 02a8 FFF769FF 		bl	graphic_ctrl_bit_set
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_milli(100);
 688              		.loc 1 170 0
 689 02ac 6420     		movs	r0, #100
 690 02ae FFF7FEFF 		bl	delay_milli
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 691              		.loc 1 171 0
 692 02b2 1821     		movs	r1, #24
 693 02b4 3E20     		movs	r0, #62
 694 02b6 FFF7FEFF 		bl	graphic_write_command
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_ON, B_CS1|B_CS2);
 695              		.loc 1 172 0
 696 02ba 1821     		movs	r1, #24
 697 02bc 3F20     		movs	r0, #63
 698 02be FFF7FEFF 		bl	graphic_write_command
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 699              		.loc 1 173 0
 700 02c2 1821     		movs	r1, #24
 701 02c4 C020     		movs	r0, #192
 702 02c6 FFF7FEFF 		bl	graphic_write_command
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 703              		.loc 1 174 0
 704 02ca 1821     		movs	r1, #24
 705 02cc 4020     		movs	r0, #64
 706 02ce FFF7FEFF 		bl	graphic_write_command
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 707              		.loc 1 175 0
 708 02d2 1821     		movs	r1, #24
 709 02d4 B820     		movs	r0, #184
 710 02d6 FFF7FEFF 		bl	graphic_write_command
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller(0);
 711              		.loc 1 176 0
 712 02da 0020     		movs	r0, #0
 713 02dc FFF7A8FF 		bl	select_controller
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 714              		.loc 1 177 0
 715 02e0 C046     		nop
 716 02e2 BD46     		mov	sp, r7
 717              		@ sp needed
 718 02e4 80BD     		pop	{r7, pc}
 719              		.cfi_endproc
 720              	.LFE10:
 722              		.align	1
 723              		.syntax unified
 724              		.code	16
 725              		.thumb_func
 726              		.fpu softvfp
 728              	graphic_wait_ready:
 729              	.LFB11:
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** static void graphic_wait_ready(void) {
 730              		.loc 1 178 0
 731              		.cfi_startproc
 732              		@ args = 0, pretend = 0, frame = 8
 733              		@ frame_needed = 1, uses_anonymous_args = 0
 734 02e6 80B5     		push	{r7, lr}
 735              		.cfi_def_cfa_offset 8
 736              		.cfi_offset 7, -8
 737              		.cfi_offset 14, -4
 738 02e8 82B0     		sub	sp, sp, #8
 739              		.cfi_def_cfa_offset 16
 740 02ea 00AF     		add	r7, sp, #0
 741              		.cfi_def_cfa_register 7
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** uint8_t c;
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_E);
 742              		.loc 1 180 0
 743 02ec 4020     		movs	r0, #64
 744 02ee FFF773FF 		bl	graphic_ctrl_bit_clear
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** // 15-8 inputs, 7-0 outputs
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** *GPIOE_MODER = 0x00005555;
 745              		.loc 1 182 0
 746 02f2 144B     		ldr	r3, .L44
 747 02f4 144A     		ldr	r2, .L44+4
 748 02f6 1A60     		str	r2, [r3]
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_RS);
 749              		.loc 1 183 0
 750 02f8 0120     		movs	r0, #1
 751 02fa FFF76DFF 		bl	graphic_ctrl_bit_clear
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_RW);
 752              		.loc 1 184 0
 753 02fe 0220     		movs	r0, #2
 754 0300 FFF73DFF 		bl	graphic_ctrl_bit_set
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 755              		.loc 1 185 0
 756 0304 FFF7FEFF 		bl	delay_500ns
 757              	.L41:
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** while(1) {
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_E);
 758              		.loc 1 187 0
 759 0308 4020     		movs	r0, #64
 760 030a FFF738FF 		bl	graphic_ctrl_bit_set
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 761              		.loc 1 188 0
 762 030e FFF7FEFF 		bl	delay_500ns
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c = *GPIOE_IDR_HIGH & LCD_BUSY;
 763              		.loc 1 189 0
 764 0312 0E4B     		ldr	r3, .L44+8
 765 0314 1B78     		ldrb	r3, [r3]
 766 0316 DAB2     		uxtb	r2, r3
 767 0318 FB1D     		adds	r3, r7, #7
 768 031a 7F21     		movs	r1, #127
 769 031c 8A43     		bics	r2, r1
 770 031e 1A70     		strb	r2, [r3]
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_E);
 771              		.loc 1 190 0
 772 0320 4020     		movs	r0, #64
 773 0322 FFF759FF 		bl	graphic_ctrl_bit_clear
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 774              		.loc 1 191 0
 775 0326 FFF7FEFF 		bl	delay_500ns
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if( c == 0 ) break;
 776              		.loc 1 192 0
 777 032a FB1D     		adds	r3, r7, #7
 778 032c 1B78     		ldrb	r3, [r3]
 779 032e 002B     		cmp	r3, #0
 780 0330 00D0     		beq	.L43
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 781              		.loc 1 187 0
 782 0332 E9E7     		b	.L41
 783              	.L43:
 784              		.loc 1 192 0
 785 0334 C046     		nop
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 786              		.loc 1 194 0
 787 0336 034B     		ldr	r3, .L44
 788 0338 054A     		ldr	r2, .L44+12
 789 033a 1A60     		str	r2, [r3]
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 790              		.loc 1 195 0
 791 033c C046     		nop
 792 033e BD46     		mov	sp, r7
 793 0340 02B0     		add	sp, sp, #8
 794              		@ sp needed
 795 0342 80BD     		pop	{r7, pc}
 796              	.L45:
 797              		.align	2
 798              	.L44:
 799 0344 00100240 		.word	1073876992
 800 0348 55550000 		.word	21845
 801 034c 11100240 		.word	1073877009
 802 0350 55555555 		.word	1431655765
 803              		.cfi_endproc
 804              	.LFE11:
 806              		.align	1
 807              		.syntax unified
 808              		.code	16
 809              		.thumb_func
 810              		.fpu softvfp
 812              	graphic_read:
 813              	.LFB12:
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** static uint8_t graphic_read(uint8_t controller) {
 814              		.loc 1 196 0
 815              		.cfi_startproc
 816              		@ args = 0, pretend = 0, frame = 16
 817              		@ frame_needed = 1, uses_anonymous_args = 0
 818 0354 80B5     		push	{r7, lr}
 819              		.cfi_def_cfa_offset 8
 820              		.cfi_offset 7, -8
 821              		.cfi_offset 14, -4
 822 0356 84B0     		sub	sp, sp, #16
 823              		.cfi_def_cfa_offset 24
 824 0358 00AF     		add	r7, sp, #0
 825              		.cfi_def_cfa_register 7
 826 035a 0200     		movs	r2, r0
 827 035c FB1D     		adds	r3, r7, #7
 828 035e 1A70     		strb	r2, [r3]
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** uint8_t c;
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_E);
 829              		.loc 1 198 0
 830 0360 4020     		movs	r0, #64
 831 0362 FFF739FF 		bl	graphic_ctrl_bit_clear
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** *GPIOE_MODER = 0x00005555; // 15-8 inputs, 7-0 outputs
 832              		.loc 1 199 0
 833 0366 1C4B     		ldr	r3, .L50
 834 0368 1C4A     		ldr	r2, .L50+4
 835 036a 1A60     		str	r2, [r3]
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_RS|B_RW);
 836              		.loc 1 200 0
 837 036c 0320     		movs	r0, #3
 838 036e FFF706FF 		bl	graphic_ctrl_bit_set
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller(controller);
 839              		.loc 1 201 0
 840 0372 FB1D     		adds	r3, r7, #7
 841 0374 1B78     		ldrb	r3, [r3]
 842 0376 1800     		movs	r0, r3
 843 0378 FFF75AFF 		bl	select_controller
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 844              		.loc 1 202 0
 845 037c FFF7FEFF 		bl	delay_500ns
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_E);
 846              		.loc 1 203 0
 847 0380 4020     		movs	r0, #64
 848 0382 FFF7FCFE 		bl	graphic_ctrl_bit_set
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 849              		.loc 1 204 0
 850 0386 FFF7FEFF 		bl	delay_500ns
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c = *GPIOE_IDR_HIGH;
 851              		.loc 1 205 0
 852 038a 154A     		ldr	r2, .L50+8
 853 038c 0F23     		movs	r3, #15
 854 038e FB18     		adds	r3, r7, r3
 855 0390 1278     		ldrb	r2, [r2]
 856 0392 1A70     		strb	r2, [r3]
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_E);
 857              		.loc 1 206 0
 858 0394 4020     		movs	r0, #64
 859 0396 FFF71FFF 		bl	graphic_ctrl_bit_clear
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 860              		.loc 1 207 0
 861 039a 0F4B     		ldr	r3, .L50
 862 039c 114A     		ldr	r2, .L50+12
 863 039e 1A60     		str	r2, [r3]
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if( controller & B_CS1 ) {
 864              		.loc 1 208 0
 865 03a0 FB1D     		adds	r3, r7, #7
 866 03a2 1B78     		ldrb	r3, [r3]
 867 03a4 0822     		movs	r2, #8
 868 03a6 1340     		ands	r3, r2
 869 03a8 04D0     		beq	.L47
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller(B_CS1);
 870              		.loc 1 209 0
 871 03aa 0820     		movs	r0, #8
 872 03ac FFF740FF 		bl	select_controller
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_wait_ready();
 873              		.loc 1 210 0
 874 03b0 FFF799FF 		bl	graphic_wait_ready
 875              	.L47:
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if( controller & B_CS2 ) {
 876              		.loc 1 212 0
 877 03b4 FB1D     		adds	r3, r7, #7
 878 03b6 1B78     		ldrb	r3, [r3]
 879 03b8 1022     		movs	r2, #16
 880 03ba 1340     		ands	r3, r2
 881 03bc 04D0     		beq	.L48
 213:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller(B_CS2);
 882              		.loc 1 213 0
 883 03be 1020     		movs	r0, #16
 884 03c0 FFF736FF 		bl	select_controller
 214:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_wait_ready();
 885              		.loc 1 214 0
 886 03c4 FFF78FFF 		bl	graphic_wait_ready
 887              	.L48:
 215:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** return c;
 888              		.loc 1 216 0
 889 03c8 0F23     		movs	r3, #15
 890 03ca FB18     		adds	r3, r7, r3
 891 03cc 1B78     		ldrb	r3, [r3]
 217:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 892              		.loc 1 217 0
 893 03ce 1800     		movs	r0, r3
 894 03d0 BD46     		mov	sp, r7
 895 03d2 04B0     		add	sp, sp, #16
 896              		@ sp needed
 897 03d4 80BD     		pop	{r7, pc}
 898              	.L51:
 899 03d6 C046     		.align	2
 900              	.L50:
 901 03d8 00100240 		.word	1073876992
 902 03dc 55550000 		.word	21845
 903 03e0 11100240 		.word	1073877009
 904 03e4 55555555 		.word	1431655765
 905              		.cfi_endproc
 906              	.LFE12:
 908              		.align	1
 909              		.syntax unified
 910              		.code	16
 911              		.thumb_func
 912              		.fpu softvfp
 914              	graphic_read_data:
 915              	.LFB13:
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** static uint8_t graphic_read_data(uint8_t controller) {
 916              		.loc 1 218 0
 917              		.cfi_startproc
 918              		@ args = 0, pretend = 0, frame = 8
 919              		@ frame_needed = 1, uses_anonymous_args = 0
 920 03e8 80B5     		push	{r7, lr}
 921              		.cfi_def_cfa_offset 8
 922              		.cfi_offset 7, -8
 923              		.cfi_offset 14, -4
 924 03ea 82B0     		sub	sp, sp, #8
 925              		.cfi_def_cfa_offset 16
 926 03ec 00AF     		add	r7, sp, #0
 927              		.cfi_def_cfa_register 7
 928 03ee 0200     		movs	r2, r0
 929 03f0 FB1D     		adds	r3, r7, #7
 930 03f2 1A70     		strb	r2, [r3]
 219:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_read(controller);
 931              		.loc 1 219 0
 932 03f4 FB1D     		adds	r3, r7, #7
 933 03f6 1B78     		ldrb	r3, [r3]
 934 03f8 1800     		movs	r0, r3
 935 03fa FFF7ABFF 		bl	graphic_read
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** return graphic_read(controller);
 936              		.loc 1 220 0
 937 03fe FB1D     		adds	r3, r7, #7
 938 0400 1B78     		ldrb	r3, [r3]
 939 0402 1800     		movs	r0, r3
 940 0404 FFF7A6FF 		bl	graphic_read
 941 0408 0300     		movs	r3, r0
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 942              		.loc 1 221 0
 943 040a 1800     		movs	r0, r3
 944 040c BD46     		mov	sp, r7
 945 040e 02B0     		add	sp, sp, #8
 946              		@ sp needed
 947 0410 80BD     		pop	{r7, pc}
 948              		.cfi_endproc
 949              	.LFE13:
 951              		.align	1
 952              		.syntax unified
 953              		.code	16
 954              		.thumb_func
 955              		.fpu softvfp
 957              	graphic_write:
 958              	.LFB14:
 222:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** static void graphic_write(uint8_t value, uint8_t controller) {
 959              		.loc 1 222 0
 960              		.cfi_startproc
 961              		@ args = 0, pretend = 0, frame = 8
 962              		@ frame_needed = 1, uses_anonymous_args = 0
 963 0412 80B5     		push	{r7, lr}
 964              		.cfi_def_cfa_offset 8
 965              		.cfi_offset 7, -8
 966              		.cfi_offset 14, -4
 967 0414 82B0     		sub	sp, sp, #8
 968              		.cfi_def_cfa_offset 16
 969 0416 00AF     		add	r7, sp, #0
 970              		.cfi_def_cfa_register 7
 971 0418 0200     		movs	r2, r0
 972 041a FB1D     		adds	r3, r7, #7
 973 041c 1A70     		strb	r2, [r3]
 974 041e BB1D     		adds	r3, r7, #6
 975 0420 0A1C     		adds	r2, r1, #0
 976 0422 1A70     		strb	r2, [r3]
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** *GPIOE_ODR_HIGH = value;
 977              		.loc 1 223 0
 978 0424 154A     		ldr	r2, .L58
 979 0426 FB1D     		adds	r3, r7, #7
 980 0428 1B78     		ldrb	r3, [r3]
 981 042a 1370     		strb	r3, [r2]
 224:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller(controller);
 982              		.loc 1 224 0
 983 042c BB1D     		adds	r3, r7, #6
 984 042e 1B78     		ldrb	r3, [r3]
 985 0430 1800     		movs	r0, r3
 986 0432 FFF7FDFE 		bl	select_controller
 225:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 987              		.loc 1 225 0
 988 0436 FFF7FEFF 		bl	delay_500ns
 226:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_E);
 989              		.loc 1 226 0
 990 043a 4020     		movs	r0, #64
 991 043c FFF79FFE 		bl	graphic_ctrl_bit_set
 227:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** delay_500ns();
 992              		.loc 1 227 0
 993 0440 FFF7FEFF 		bl	delay_500ns
 228:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear( B_E );
 994              		.loc 1 228 0
 995 0444 4020     		movs	r0, #64
 996 0446 FFF7C7FE 		bl	graphic_ctrl_bit_clear
 229:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if(controller & B_CS1) {
 997              		.loc 1 229 0
 998 044a BB1D     		adds	r3, r7, #6
 999 044c 1B78     		ldrb	r3, [r3]
 1000 044e 0822     		movs	r2, #8
 1001 0450 1340     		ands	r3, r2
 1002 0452 04D0     		beq	.L55
 230:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller( B_CS1);
 1003              		.loc 1 230 0
 1004 0454 0820     		movs	r0, #8
 1005 0456 FFF7EBFE 		bl	select_controller
 231:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_wait_ready();
 1006              		.loc 1 231 0
 1007 045a FFF744FF 		bl	graphic_wait_ready
 1008              	.L55:
 232:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 233:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if(controller & B_CS2) {
 1009              		.loc 1 233 0
 1010 045e BB1D     		adds	r3, r7, #6
 1011 0460 1B78     		ldrb	r3, [r3]
 1012 0462 1022     		movs	r2, #16
 1013 0464 1340     		ands	r3, r2
 1014 0466 04D0     		beq	.L57
 234:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller( B_CS2);
 1015              		.loc 1 234 0
 1016 0468 1020     		movs	r0, #16
 1017 046a FFF7E1FE 		bl	select_controller
 235:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_wait_ready();
 1018              		.loc 1 235 0
 1019 046e FFF73AFF 		bl	graphic_wait_ready
 1020              	.L57:
 236:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 237:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 1021              		.loc 1 237 0
 1022 0472 C046     		nop
 1023 0474 BD46     		mov	sp, r7
 1024 0476 02B0     		add	sp, sp, #8
 1025              		@ sp needed
 1026 0478 80BD     		pop	{r7, pc}
 1027              	.L59:
 1028 047a C046     		.align	2
 1029              	.L58:
 1030 047c 15100240 		.word	1073877013
 1031              		.cfi_endproc
 1032              	.LFE14:
 1034              		.align	1
 1035              		.global	graphic_write_command
 1036              		.syntax unified
 1037              		.code	16
 1038              		.thumb_func
 1039              		.fpu softvfp
 1041              	graphic_write_command:
 1042              	.LFB15:
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller) {
 1043              		.loc 1 238 0
 1044              		.cfi_startproc
 1045              		@ args = 0, pretend = 0, frame = 8
 1046              		@ frame_needed = 1, uses_anonymous_args = 0
 1047 0480 80B5     		push	{r7, lr}
 1048              		.cfi_def_cfa_offset 8
 1049              		.cfi_offset 7, -8
 1050              		.cfi_offset 14, -4
 1051 0482 82B0     		sub	sp, sp, #8
 1052              		.cfi_def_cfa_offset 16
 1053 0484 00AF     		add	r7, sp, #0
 1054              		.cfi_def_cfa_register 7
 1055 0486 0200     		movs	r2, r0
 1056 0488 FB1D     		adds	r3, r7, #7
 1057 048a 1A70     		strb	r2, [r3]
 1058 048c BB1D     		adds	r3, r7, #6
 1059 048e 0A1C     		adds	r2, r1, #0
 1060 0490 1A70     		strb	r2, [r3]
 239:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_E);
 1061              		.loc 1 239 0
 1062 0492 4020     		movs	r0, #64
 1063 0494 FFF7A0FE 		bl	graphic_ctrl_bit_clear
 240:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller(controller);
 1064              		.loc 1 240 0
 1065 0498 BB1D     		adds	r3, r7, #6
 1066 049a 1B78     		ldrb	r3, [r3]
 1067 049c 1800     		movs	r0, r3
 1068 049e FFF7C7FE 		bl	select_controller
 241:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_RS|B_RW);
 1069              		.loc 1 241 0
 1070 04a2 0320     		movs	r0, #3
 1071 04a4 FFF798FE 		bl	graphic_ctrl_bit_clear
 242:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write(command, controller);
 1072              		.loc 1 242 0
 1073 04a8 BB1D     		adds	r3, r7, #6
 1074 04aa 1A78     		ldrb	r2, [r3]
 1075 04ac FB1D     		adds	r3, r7, #7
 1076 04ae 1B78     		ldrb	r3, [r3]
 1077 04b0 1100     		movs	r1, r2
 1078 04b2 1800     		movs	r0, r3
 1079 04b4 FFF7ADFF 		bl	graphic_write
 243:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 1080              		.loc 1 243 0
 1081 04b8 C046     		nop
 1082 04ba BD46     		mov	sp, r7
 1083 04bc 02B0     		add	sp, sp, #8
 1084              		@ sp needed
 1085 04be 80BD     		pop	{r7, pc}
 1086              		.cfi_endproc
 1087              	.LFE15:
 1089              		.align	1
 1090              		.global	graphic_write_data
 1091              		.syntax unified
 1092              		.code	16
 1093              		.thumb_func
 1094              		.fpu softvfp
 1096              	graphic_write_data:
 1097              	.LFB16:
 244:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller) {
 1098              		.loc 1 244 0
 1099              		.cfi_startproc
 1100              		@ args = 0, pretend = 0, frame = 8
 1101              		@ frame_needed = 1, uses_anonymous_args = 0
 1102 04c0 80B5     		push	{r7, lr}
 1103              		.cfi_def_cfa_offset 8
 1104              		.cfi_offset 7, -8
 1105              		.cfi_offset 14, -4
 1106 04c2 82B0     		sub	sp, sp, #8
 1107              		.cfi_def_cfa_offset 16
 1108 04c4 00AF     		add	r7, sp, #0
 1109              		.cfi_def_cfa_register 7
 1110 04c6 0200     		movs	r2, r0
 1111 04c8 FB1D     		adds	r3, r7, #7
 1112 04ca 1A70     		strb	r2, [r3]
 1113 04cc BB1D     		adds	r3, r7, #6
 1114 04ce 0A1C     		adds	r2, r1, #0
 1115 04d0 1A70     		strb	r2, [r3]
 245:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_E);
 1116              		.loc 1 245 0
 1117 04d2 4020     		movs	r0, #64
 1118 04d4 FFF780FE 		bl	graphic_ctrl_bit_clear
 246:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** select_controller(controller);
 1119              		.loc 1 246 0
 1120 04d8 BB1D     		adds	r3, r7, #6
 1121 04da 1B78     		ldrb	r3, [r3]
 1122 04dc 1800     		movs	r0, r3
 1123 04de FFF7A7FE 		bl	select_controller
 247:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_set(B_RS);
 1124              		.loc 1 247 0
 1125 04e2 0120     		movs	r0, #1
 1126 04e4 FFF74BFE 		bl	graphic_ctrl_bit_set
 248:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_ctrl_bit_clear(B_RW);
 1127              		.loc 1 248 0
 1128 04e8 0220     		movs	r0, #2
 1129 04ea FFF775FE 		bl	graphic_ctrl_bit_clear
 249:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write(data, controller);
 1130              		.loc 1 249 0
 1131 04ee BB1D     		adds	r3, r7, #6
 1132 04f0 1A78     		ldrb	r2, [r3]
 1133 04f2 FB1D     		adds	r3, r7, #7
 1134 04f4 1B78     		ldrb	r3, [r3]
 1135 04f6 1100     		movs	r1, r2
 1136 04f8 1800     		movs	r0, r3
 1137 04fa FFF78AFF 		bl	graphic_write
 250:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 1138              		.loc 1 250 0
 1139 04fe C046     		nop
 1140 0500 BD46     		mov	sp, r7
 1141 0502 02B0     		add	sp, sp, #8
 1142              		@ sp needed
 1143 0504 80BD     		pop	{r7, pc}
 1144              		.cfi_endproc
 1145              	.LFE16:
 1147              		.align	1
 1148              		.global	graphic_clear_screen
 1149              		.syntax unified
 1150              		.code	16
 1151              		.thumb_func
 1152              		.fpu softvfp
 1154              	graphic_clear_screen:
 1155              	.LFB17:
 251:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void graphic_clear_screen(void) {
 1156              		.loc 1 251 0
 1157              		.cfi_startproc
 1158              		@ args = 0, pretend = 0, frame = 8
 1159              		@ frame_needed = 1, uses_anonymous_args = 0
 1160 0506 80B5     		push	{r7, lr}
 1161              		.cfi_def_cfa_offset 8
 1162              		.cfi_offset 7, -8
 1163              		.cfi_offset 14, -4
 1164 0508 82B0     		sub	sp, sp, #8
 1165              		.cfi_def_cfa_offset 16
 1166 050a 00AF     		add	r7, sp, #0
 1167              		.cfi_def_cfa_register 7
 252:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** uint8_t i, j;
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(j = 0; j < 8; j++) {
 1168              		.loc 1 253 0
 1169 050c BB1D     		adds	r3, r7, #6
 1170 050e 0022     		movs	r2, #0
 1171 0510 1A70     		strb	r2, [r3]
 1172 0512 23E0     		b	.L63
 1173              	.L66:
 254:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1174              		.loc 1 254 0
 1175 0514 BB1D     		adds	r3, r7, #6
 1176 0516 1B78     		ldrb	r3, [r3]
 1177 0518 4822     		movs	r2, #72
 1178 051a 5242     		rsbs	r2, r2, #0
 1179 051c 1343     		orrs	r3, r2
 1180 051e DBB2     		uxtb	r3, r3
 1181 0520 1821     		movs	r1, #24
 1182 0522 1800     		movs	r0, r3
 1183 0524 FFF7FEFF 		bl	graphic_write_command
 255:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1184              		.loc 1 255 0
 1185 0528 1821     		movs	r1, #24
 1186 052a 4020     		movs	r0, #64
 1187 052c FFF7FEFF 		bl	graphic_write_command
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(i = 0; i <= 63; i++){
 1188              		.loc 1 256 0
 1189 0530 FB1D     		adds	r3, r7, #7
 1190 0532 0022     		movs	r2, #0
 1191 0534 1A70     		strb	r2, [r3]
 1192 0536 08E0     		b	.L64
 1193              	.L65:
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_data(0, B_CS1|B_CS2);
 1194              		.loc 1 257 0 discriminator 3
 1195 0538 1821     		movs	r1, #24
 1196 053a 0020     		movs	r0, #0
 1197 053c FFF7FEFF 		bl	graphic_write_data
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(i = 0; i <= 63; i++){
 1198              		.loc 1 256 0 discriminator 3
 1199 0540 FB1D     		adds	r3, r7, #7
 1200 0542 1A78     		ldrb	r2, [r3]
 1201 0544 FB1D     		adds	r3, r7, #7
 1202 0546 0132     		adds	r2, r2, #1
 1203 0548 1A70     		strb	r2, [r3]
 1204              	.L64:
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** for(i = 0; i <= 63; i++){
 1205              		.loc 1 256 0 is_stmt 0 discriminator 1
 1206 054a FB1D     		adds	r3, r7, #7
 1207 054c 1B78     		ldrb	r3, [r3]
 1208 054e 3F2B     		cmp	r3, #63
 1209 0550 F2D9     		bls	.L65
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1210              		.loc 1 253 0 is_stmt 1 discriminator 2
 1211 0552 BB1D     		adds	r3, r7, #6
 1212 0554 1A78     		ldrb	r2, [r3]
 1213 0556 BB1D     		adds	r3, r7, #6
 1214 0558 0132     		adds	r2, r2, #1
 1215 055a 1A70     		strb	r2, [r3]
 1216              	.L63:
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1217              		.loc 1 253 0 is_stmt 0 discriminator 1
 1218 055c BB1D     		adds	r3, r7, #6
 1219 055e 1B78     		ldrb	r3, [r3]
 1220 0560 072B     		cmp	r3, #7
 1221 0562 D7D9     		bls	.L66
 258:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 259:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 260:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 1222              		.loc 1 260 0 is_stmt 1
 1223 0564 C046     		nop
 1224 0566 BD46     		mov	sp, r7
 1225 0568 02B0     		add	sp, sp, #8
 1226              		@ sp needed
 1227 056a 80BD     		pop	{r7, pc}
 1228              		.cfi_endproc
 1229              	.LFE17:
 1231              		.align	1
 1232              		.global	pixel
 1233              		.syntax unified
 1234              		.code	16
 1235              		.thumb_func
 1236              		.fpu softvfp
 1238              	pixel:
 1239              	.LFB18:
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** void pixel(int x, int y, int set) {
 1240              		.loc 1 261 0
 1241              		.cfi_startproc
 1242              		@ args = 0, pretend = 0, frame = 32
 1243              		@ frame_needed = 1, uses_anonymous_args = 0
 1244 056c 90B5     		push	{r4, r7, lr}
 1245              		.cfi_def_cfa_offset 12
 1246              		.cfi_offset 4, -12
 1247              		.cfi_offset 7, -8
 1248              		.cfi_offset 14, -4
 1249 056e 89B0     		sub	sp, sp, #36
 1250              		.cfi_def_cfa_offset 48
 1251 0570 00AF     		add	r7, sp, #0
 1252              		.cfi_def_cfa_register 7
 1253 0572 F860     		str	r0, [r7, #12]
 1254 0574 B960     		str	r1, [r7, #8]
 1255 0576 7A60     		str	r2, [r7, #4]
 262:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** uint8_t mask, c, controller;
 263:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** int index;
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1256              		.loc 1 264 0
 1257 0578 FB68     		ldr	r3, [r7, #12]
 1258 057a 002B     		cmp	r3, #0
 1259 057c 00DC     		bgt	.LCB1007
 1260 057e BCE0     		b	.L88	@long jump
 1261              	.LCB1007:
 1262              		.loc 1 264 0 is_stmt 0 discriminator 1
 1263 0580 BB68     		ldr	r3, [r7, #8]
 1264 0582 002B     		cmp	r3, #0
 1265 0584 00DC     		bgt	.LCB1010
 1266 0586 B8E0     		b	.L88	@long jump
 1267              	.LCB1010:
 1268              		.loc 1 264 0 discriminator 2
 1269 0588 FB68     		ldr	r3, [r7, #12]
 1270 058a 802B     		cmp	r3, #128
 1271 058c 00DD     		ble	.LCB1013
 1272 058e B4E0     		b	.L88	@long jump
 1273              	.LCB1013:
 1274              		.loc 1 264 0 discriminator 3
 1275 0590 BB68     		ldr	r3, [r7, #8]
 1276 0592 402B     		cmp	r3, #64
 1277 0594 00DD     		ble	.LCB1016
 1278 0596 B0E0     		b	.L88	@long jump
 1279              	.LCB1016:
 265:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** index = (y-1)/8;
 1280              		.loc 1 265 0 is_stmt 1
 1281 0598 BB68     		ldr	r3, [r7, #8]
 1282 059a 013B     		subs	r3, r3, #1
 1283 059c 002B     		cmp	r3, #0
 1284 059e 00DA     		bge	.L71
 1285 05a0 0733     		adds	r3, r3, #7
 1286              	.L71:
 1287 05a2 DB10     		asrs	r3, r3, #3
 1288 05a4 BB61     		str	r3, [r7, #24]
 266:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** switch( (y-1)%8 ) {
 1289              		.loc 1 266 0
 1290 05a6 BB68     		ldr	r3, [r7, #8]
 1291 05a8 013B     		subs	r3, r3, #1
 1292 05aa 564A     		ldr	r2, .L89
 1293 05ac 1340     		ands	r3, r2
 1294 05ae 04D5     		bpl	.L72
 1295 05b0 013B     		subs	r3, r3, #1
 1296 05b2 0822     		movs	r2, #8
 1297 05b4 5242     		rsbs	r2, r2, #0
 1298 05b6 1343     		orrs	r3, r2
 1299 05b8 0133     		adds	r3, r3, #1
 1300              	.L72:
 1301 05ba 072B     		cmp	r3, #7
 1302 05bc 2CD8     		bhi	.L73
 1303 05be 9A00     		lsls	r2, r3, #2
 1304 05c0 514B     		ldr	r3, .L89+4
 1305 05c2 D318     		adds	r3, r2, r3
 1306 05c4 1B68     		ldr	r3, [r3]
 1307 05c6 9F46     		mov	pc, r3
 1308              		.section	.rodata
 1309              		.align	2
 1310              	.L75:
 1311 0000 C8050000 		.word	.L74
 1312 0004 D2050000 		.word	.L76
 1313 0008 DC050000 		.word	.L77
 1314 000c E6050000 		.word	.L78
 1315 0010 F0050000 		.word	.L79
 1316 0014 FA050000 		.word	.L80
 1317 0018 04060000 		.word	.L81
 1318 001c 0E060000 		.word	.L82
 1319              		.text
 1320              	.L74:
 267:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 0: mask = 1; break;
 1321              		.loc 1 267 0
 1322 05c8 1F23     		movs	r3, #31
 1323 05ca FB18     		adds	r3, r7, r3
 1324 05cc 0122     		movs	r2, #1
 1325 05ce 1A70     		strb	r2, [r3]
 1326 05d0 22E0     		b	.L73
 1327              	.L76:
 268:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 1: mask = 2; break;
 1328              		.loc 1 268 0
 1329 05d2 1F23     		movs	r3, #31
 1330 05d4 FB18     		adds	r3, r7, r3
 1331 05d6 0222     		movs	r2, #2
 1332 05d8 1A70     		strb	r2, [r3]
 1333 05da 1DE0     		b	.L73
 1334              	.L77:
 269:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 2: mask = 4; break;
 1335              		.loc 1 269 0
 1336 05dc 1F23     		movs	r3, #31
 1337 05de FB18     		adds	r3, r7, r3
 1338 05e0 0422     		movs	r2, #4
 1339 05e2 1A70     		strb	r2, [r3]
 1340 05e4 18E0     		b	.L73
 1341              	.L78:
 270:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 3: mask = 8; break;
 1342              		.loc 1 270 0
 1343 05e6 1F23     		movs	r3, #31
 1344 05e8 FB18     		adds	r3, r7, r3
 1345 05ea 0822     		movs	r2, #8
 1346 05ec 1A70     		strb	r2, [r3]
 1347 05ee 13E0     		b	.L73
 1348              	.L79:
 271:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 4: mask = 0x10; break;
 1349              		.loc 1 271 0
 1350 05f0 1F23     		movs	r3, #31
 1351 05f2 FB18     		adds	r3, r7, r3
 1352 05f4 1022     		movs	r2, #16
 1353 05f6 1A70     		strb	r2, [r3]
 1354 05f8 0EE0     		b	.L73
 1355              	.L80:
 272:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 5: mask = 0x20; break;
 1356              		.loc 1 272 0
 1357 05fa 1F23     		movs	r3, #31
 1358 05fc FB18     		adds	r3, r7, r3
 1359 05fe 2022     		movs	r2, #32
 1360 0600 1A70     		strb	r2, [r3]
 1361 0602 09E0     		b	.L73
 1362              	.L81:
 273:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 6: mask = 0x40; break;
 1363              		.loc 1 273 0
 1364 0604 1F23     		movs	r3, #31
 1365 0606 FB18     		adds	r3, r7, r3
 1366 0608 4022     		movs	r2, #64
 1367 060a 1A70     		strb	r2, [r3]
 1368 060c 04E0     		b	.L73
 1369              	.L82:
 274:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** case 7: mask = 0x80; break;
 1370              		.loc 1 274 0
 1371 060e 1F23     		movs	r3, #31
 1372 0610 FB18     		adds	r3, r7, r3
 1373 0612 8022     		movs	r2, #128
 1374 0614 1A70     		strb	r2, [r3]
 1375 0616 C046     		nop
 1376              	.L73:
 275:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 276:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if(set == 0)
 1377              		.loc 1 276 0
 1378 0618 7B68     		ldr	r3, [r7, #4]
 1379 061a 002B     		cmp	r3, #0
 1380 061c 06D1     		bne	.L83
 277:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** mask = ~mask;
 1381              		.loc 1 277 0
 1382 061e 1F23     		movs	r3, #31
 1383 0620 FB18     		adds	r3, r7, r3
 1384 0622 1F22     		movs	r2, #31
 1385 0624 BA18     		adds	r2, r7, r2
 1386 0626 1278     		ldrb	r2, [r2]
 1387 0628 D243     		mvns	r2, r2
 1388 062a 1A70     		strb	r2, [r3]
 1389              	.L83:
 278:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if(x > 64){
 1390              		.loc 1 278 0
 1391 062c FB68     		ldr	r3, [r7, #12]
 1392 062e 402B     		cmp	r3, #64
 1393 0630 07DD     		ble	.L84
 279:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** controller = B_CS2;
 1394              		.loc 1 279 0
 1395 0632 1E23     		movs	r3, #30
 1396 0634 FB18     		adds	r3, r7, r3
 1397 0636 1022     		movs	r2, #16
 1398 0638 1A70     		strb	r2, [r3]
 280:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** x = x - 65;
 1399              		.loc 1 280 0
 1400 063a FB68     		ldr	r3, [r7, #12]
 1401 063c 413B     		subs	r3, r3, #65
 1402 063e FB60     		str	r3, [r7, #12]
 1403 0640 06E0     		b	.L85
 1404              	.L84:
 281:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** } else {
 282:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** controller = B_CS1;
 1405              		.loc 1 282 0
 1406 0642 1E23     		movs	r3, #30
 1407 0644 FB18     		adds	r3, r7, r3
 1408 0646 0822     		movs	r2, #8
 1409 0648 1A70     		strb	r2, [r3]
 283:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** x = x-1;
 1410              		.loc 1 283 0
 1411 064a FB68     		ldr	r3, [r7, #12]
 1412 064c 013B     		subs	r3, r3, #1
 1413 064e FB60     		str	r3, [r7, #12]
 1414              	.L85:
 284:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 285:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller );
 1415              		.loc 1 285 0
 1416 0650 FB68     		ldr	r3, [r7, #12]
 1417 0652 5BB2     		sxtb	r3, r3
 1418 0654 4022     		movs	r2, #64
 1419 0656 1343     		orrs	r3, r2
 1420 0658 5BB2     		sxtb	r3, r3
 1421 065a DAB2     		uxtb	r2, r3
 1422 065c 1E23     		movs	r3, #30
 1423 065e FB18     		adds	r3, r7, r3
 1424 0660 1B78     		ldrb	r3, [r3]
 1425 0662 1900     		movs	r1, r3
 1426 0664 1000     		movs	r0, r2
 1427 0666 FFF7FEFF 		bl	graphic_write_command
 286:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_PAGE | index, controller );
 1428              		.loc 1 286 0
 1429 066a BB69     		ldr	r3, [r7, #24]
 1430 066c 5BB2     		sxtb	r3, r3
 1431 066e 4822     		movs	r2, #72
 1432 0670 5242     		rsbs	r2, r2, #0
 1433 0672 1343     		orrs	r3, r2
 1434 0674 5BB2     		sxtb	r3, r3
 1435 0676 DAB2     		uxtb	r2, r3
 1436 0678 1E23     		movs	r3, #30
 1437 067a FB18     		adds	r3, r7, r3
 1438 067c 1B78     		ldrb	r3, [r3]
 1439 067e 1900     		movs	r1, r3
 1440 0680 1000     		movs	r0, r2
 1441 0682 FFF7FEFF 		bl	graphic_write_command
 287:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** c = graphic_read_data(controller);
 1442              		.loc 1 287 0
 1443 0686 1723     		movs	r3, #23
 1444 0688 FC18     		adds	r4, r7, r3
 1445 068a 1E23     		movs	r3, #30
 1446 068c FB18     		adds	r3, r7, r3
 1447 068e 1B78     		ldrb	r3, [r3]
 1448 0690 1800     		movs	r0, r3
 1449 0692 FFF7A9FE 		bl	graphic_read_data
 1450 0696 0300     		movs	r3, r0
 1451 0698 2370     		strb	r3, [r4]
 288:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller);
 1452              		.loc 1 288 0
 1453 069a FB68     		ldr	r3, [r7, #12]
 1454 069c 5BB2     		sxtb	r3, r3
 1455 069e 4022     		movs	r2, #64
 1456 06a0 1343     		orrs	r3, r2
 1457 06a2 5BB2     		sxtb	r3, r3
 1458 06a4 DAB2     		uxtb	r2, r3
 1459 06a6 1E23     		movs	r3, #30
 1460 06a8 FB18     		adds	r3, r7, r3
 1461 06aa 1B78     		ldrb	r3, [r3]
 1462 06ac 1900     		movs	r1, r3
 1463 06ae 1000     		movs	r0, r2
 1464 06b0 FFF7FEFF 		bl	graphic_write_command
 289:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** if(set)
 1465              		.loc 1 289 0
 1466 06b4 7B68     		ldr	r3, [r7, #4]
 1467 06b6 002B     		cmp	r3, #0
 1468 06b8 0AD0     		beq	.L86
 290:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** mask = mask | c;
 1469              		.loc 1 290 0
 1470 06ba 1F23     		movs	r3, #31
 1471 06bc FB18     		adds	r3, r7, r3
 1472 06be 1F22     		movs	r2, #31
 1473 06c0 B918     		adds	r1, r7, r2
 1474 06c2 1722     		movs	r2, #23
 1475 06c4 BA18     		adds	r2, r7, r2
 1476 06c6 0978     		ldrb	r1, [r1]
 1477 06c8 1278     		ldrb	r2, [r2]
 1478 06ca 0A43     		orrs	r2, r1
 1479 06cc 1A70     		strb	r2, [r3]
 1480 06ce 09E0     		b	.L87
 1481              	.L86:
 291:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** else
 292:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** mask = mask & c;
 1482              		.loc 1 292 0
 1483 06d0 1F23     		movs	r3, #31
 1484 06d2 FB18     		adds	r3, r7, r3
 1485 06d4 1F22     		movs	r2, #31
 1486 06d6 BA18     		adds	r2, r7, r2
 1487 06d8 1721     		movs	r1, #23
 1488 06da 7918     		adds	r1, r7, r1
 1489 06dc 1278     		ldrb	r2, [r2]
 1490 06de 0978     		ldrb	r1, [r1]
 1491 06e0 0A40     		ands	r2, r1
 1492 06e2 1A70     		strb	r2, [r3]
 1493              	.L87:
 293:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** graphic_write_data(mask, controller);
 1494              		.loc 1 293 0
 1495 06e4 1E23     		movs	r3, #30
 1496 06e6 FB18     		adds	r3, r7, r3
 1497 06e8 1A78     		ldrb	r2, [r3]
 1498 06ea 1F23     		movs	r3, #31
 1499 06ec FB18     		adds	r3, r7, r3
 1500 06ee 1B78     		ldrb	r3, [r3]
 1501 06f0 1100     		movs	r1, r2
 1502 06f2 1800     		movs	r0, r3
 1503 06f4 FFF7FEFF 		bl	graphic_write_data
 1504 06f8 00E0     		b	.L67
 1505              	.L88:
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** index = (y-1)/8;
 1506              		.loc 1 264 0
 1507 06fa C046     		nop
 1508              	.L67:
 294:C:/Users/nicla/DAT017/Lab1/Moplaborationer/graphicdisplay\startup.c **** }
 1509              		.loc 1 294 0
 1510 06fc BD46     		mov	sp, r7
 1511 06fe 09B0     		add	sp, sp, #36
 1512              		@ sp needed
 1513 0700 90BD     		pop	{r4, r7, pc}
 1514              	.L90:
 1515 0702 C046     		.align	2
 1516              	.L89:
 1517 0704 07000080 		.word	-2147483641
 1518 0708 00000000 		.word	.L75
 1519              		.cfi_endproc
 1520              	.LFE18:
 1522              	.Letext0:
