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
  25              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define	GPIO_D			0x40020C00
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes 채r 32 bitar*/
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define	GPIOD_OTYPER		((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper an채nder 2 
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC s채ger vilken offset GPIO beh�
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high m책ste 
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high m책ste 
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define	GPIO_E			0x40021000
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes 채r 32 bitar*/
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define	GPIOE_OTYPER		((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper an채nder 2 
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC s채ger vilken offset GPIO beh�
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high m책ste 
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high m책ste 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** void startup ( void )
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** {
  26              		.loc 1 29 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** __asm volatile(
  31              		.loc 1 30 0
  32              		.syntax divided
  33              	@ 30 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	" MOV SP,R0\n"
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	" BL main\n"				/* call main */
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	"_exit: B .\n"				/* never return */
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	) ;
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** }
  40              		.loc 1 36 0
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
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** void init_app ( void )
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** {
  57              		.loc 1 38 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	*GPIOE_MODER = 0x55005555;
  67              		.loc 1 39 0
  68 0004 084B     		ldr	r3, .L3
  69 0006 094A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	/*s채tter v책ra in och ut portar*/
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	*GPIOE_OTYPER = 0x70;
  71              		.loc 1 41 0
  72 000a 094B     		ldr	r3, .L3+8
  73 000c 7022     		movs	r2, #112
  74 000e 1A80     		strh	r2, [r3]
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	*GPIOE_PUPDR = 0x0AA;
  75              		.loc 1 42 0
  76 0010 084B     		ldr	r3, .L3+12
  77 0012 AA22     		movs	r2, #170
  78 0014 1A60     		str	r2, [r3]
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 	*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
  79              		.loc 1 43 0
  80 0016 084B     		ldr	r3, .L3+16
  81 0018 074A     		ldr	r2, .L3+16
  82 001a 1278     		ldrb	r2, [r2]
  83 001c D2B2     		uxtb	r2, r2
  84 001e 1A70     		strb	r2, [r3]
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** }
  85              		.loc 1 44 0
  86 0020 C046     		nop
  87 0022 BD46     		mov	sp, r7
  88              		@ sp needed
  89 0024 80BD     		pop	{r7, pc}
  90              	.L4:
  91 0026 C046     		.align	2
  92              	.L3:
  93 0028 00100240 		.word	1073876992
  94 002c 55550055 		.word	1426085205
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
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** void main(void)
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** {
 110              		.loc 1 46 0
 111              		.cfi_startproc
 112              		@ args = 0, pretend = 0, frame = 8
 113              		@ frame_needed = 1, uses_anonymous_args = 0
 114 003c 80B5     		push	{r7, lr}
 115              		.cfi_def_cfa_offset 8
 116              		.cfi_offset 7, -8
 117              		.cfi_offset 14, -4
 118 003e 82B0     		sub	sp, sp, #8
 119              		.cfi_def_cfa_offset 16
 120 0040 00AF     		add	r7, sp, #0
 121              		.cfi_def_cfa_register 7
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     init_app();
 122              		.loc 1 47 0
 123 0042 FFF7FEFF 		bl	init_app
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     volatile unsigned char bargraph = *GPIOE_ODR_LOW;
 124              		.loc 1 48 0
 125 0046 0B4B     		ldr	r3, .L7
 126 0048 1B78     		ldrb	r3, [r3]
 127 004a DAB2     		uxtb	r2, r3
 128 004c FB1D     		adds	r3, r7, #7
 129 004e 1A70     		strb	r2, [r3]
 130              	.L6:
 131              	.LBB2:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     while(1){
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****         *GPIOE_ODR_LOW = 0;
 132              		.loc 1 50 0 discriminator 1
 133 0050 084B     		ldr	r3, .L7
 134 0052 0022     		movs	r2, #0
 135 0054 1A70     		strb	r2, [r3]
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****         delay_milli(500);
 136              		.loc 1 51 0 discriminator 1
 137 0056 FA23     		movs	r3, #250
 138 0058 5B00     		lsls	r3, r3, #1
 139 005a 1800     		movs	r0, r3
 140 005c FFF7FEFF 		bl	delay_milli
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****         *GPIOE_ODR_LOW= 0xFF; 
 141              		.loc 1 52 0 discriminator 1
 142 0060 044B     		ldr	r3, .L7
 143 0062 FF22     		movs	r2, #255
 144 0064 1A70     		strb	r2, [r3]
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****         delay_milli(500);   
 145              		.loc 1 53 0 discriminator 1
 146 0066 FA23     		movs	r3, #250
 147 0068 5B00     		lsls	r3, r3, #1
 148 006a 1800     		movs	r0, r3
 149 006c FFF7FEFF 		bl	delay_milli
 150              	.LBE2:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****         *GPIOE_ODR_LOW = 0;
 151              		.loc 1 49 0 discriminator 1
 152 0070 EEE7     		b	.L6
 153              	.L8:
 154 0072 C046     		.align	2
 155              	.L7:
 156 0074 14100240 		.word	1073877012
 157              		.cfi_endproc
 158              	.LFE2:
 160              		.align	1
 161              		.global	delay_250ns
 162              		.syntax unified
 163              		.code	16
 164              		.thumb_func
 165              		.fpu softvfp
 167              	delay_250ns:
 168              	.LFB3:
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     }
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** }
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** void delay_250ns(void){
 169              		.loc 1 56 0
 170              		.cfi_startproc
 171              		@ args = 0, pretend = 0, frame = 0
 172              		@ frame_needed = 1, uses_anonymous_args = 0
 173 0078 80B5     		push	{r7, lr}
 174              		.cfi_def_cfa_offset 8
 175              		.cfi_offset 7, -8
 176              		.cfi_offset 14, -4
 177 007a 00AF     		add	r7, sp, #0
 178              		.cfi_def_cfa_register 7
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** *STK_CTRL = 0;
 179              		.loc 1 58 0
 180 007c 0C4B     		ldr	r3, .L11
 181 007e 0022     		movs	r2, #0
 182 0080 1A60     		str	r2, [r3]
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** *STK_LOAD = ( (168/4) -1 );
 183              		.loc 1 59 0
 184 0082 0C4B     		ldr	r3, .L11+4
 185 0084 2922     		movs	r2, #41
 186 0086 1A60     		str	r2, [r3]
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** *STK_VAL = 0;
 187              		.loc 1 60 0
 188 0088 0B4B     		ldr	r3, .L11+8
 189 008a 0022     		movs	r2, #0
 190 008c 1A60     		str	r2, [r3]
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** *STK_CTRL = 5;
 191              		.loc 1 61 0
 192 008e 084B     		ldr	r3, .L11
 193 0090 0522     		movs	r2, #5
 194 0092 1A60     		str	r2, [r3]
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** 
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  while( (*STK_CTRL & 0x10000 )== 0 )
 195              		.loc 1 63 0
 196 0094 C046     		nop
 197              	.L10:
 198              		.loc 1 63 0 is_stmt 0 discriminator 1
 199 0096 064B     		ldr	r3, .L11
 200 0098 1A68     		ldr	r2, [r3]
 201 009a 8023     		movs	r3, #128
 202 009c 5B02     		lsls	r3, r3, #9
 203 009e 1340     		ands	r3, r2
 204 00a0 F9D0     		beq	.L10
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  {}
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  *STK_CTRL = 0; 
 205              		.loc 1 65 0 is_stmt 1
 206 00a2 034B     		ldr	r3, .L11
 207 00a4 0022     		movs	r2, #0
 208 00a6 1A60     		str	r2, [r3]
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     }
 209              		.loc 1 66 0
 210 00a8 C046     		nop
 211 00aa BD46     		mov	sp, r7
 212              		@ sp needed
 213 00ac 80BD     		pop	{r7, pc}
 214              	.L12:
 215 00ae C046     		.align	2
 216              	.L11:
 217 00b0 10E000E0 		.word	-536813552
 218 00b4 14E000E0 		.word	-536813548
 219 00b8 18E000E0 		.word	-536813544
 220              		.cfi_endproc
 221              	.LFE3:
 223              		.align	1
 224              		.global	delay_mikro
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	delay_mikro:
 231              	.LFB4:
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** void delay_mikro(unsigned int us){
 232              		.loc 1 67 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 8
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00bc 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00be 82B0     		sub	sp, sp, #8
 241              		.cfi_def_cfa_offset 16
 242 00c0 00AF     		add	r7, sp, #0
 243              		.cfi_def_cfa_register 7
 244 00c2 7860     		str	r0, [r7, #4]
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****      while(us--) {
 245              		.loc 1 69 0
 246 00c4 07E0     		b	.L14
 247              	.L15:
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****      delay_250ns();
 248              		.loc 1 70 0
 249 00c6 FFF7FEFF 		bl	delay_250ns
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****      delay_250ns();
 250              		.loc 1 71 0
 251 00ca FFF7FEFF 		bl	delay_250ns
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****      delay_250ns();
 252              		.loc 1 72 0
 253 00ce FFF7FEFF 		bl	delay_250ns
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****      delay_250ns();
 254              		.loc 1 73 0
 255 00d2 FFF7FEFF 		bl	delay_250ns
 256              	.L14:
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****      delay_250ns();
 257              		.loc 1 69 0
 258 00d6 7B68     		ldr	r3, [r7, #4]
 259 00d8 5A1E     		subs	r2, r3, #1
 260 00da 7A60     		str	r2, [r7, #4]
 261 00dc 002B     		cmp	r3, #0
 262 00de F2D1     		bne	.L15
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     }
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  }
 263              		.loc 1 75 0
 264 00e0 C046     		nop
 265 00e2 BD46     		mov	sp, r7
 266 00e4 02B0     		add	sp, sp, #8
 267              		@ sp needed
 268 00e6 80BD     		pop	{r7, pc}
 269              		.cfi_endproc
 270              	.LFE4:
 272              		.align	1
 273              		.global	delay_milli
 274              		.syntax unified
 275              		.code	16
 276              		.thumb_func
 277              		.fpu softvfp
 279              	delay_milli:
 280              	.LFB5:
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** void delay_milli(unsigned int ms){
 281              		.loc 1 76 0
 282              		.cfi_startproc
 283              		@ args = 0, pretend = 0, frame = 8
 284              		@ frame_needed = 1, uses_anonymous_args = 0
 285 00e8 80B5     		push	{r7, lr}
 286              		.cfi_def_cfa_offset 8
 287              		.cfi_offset 7, -8
 288              		.cfi_offset 14, -4
 289 00ea 82B0     		sub	sp, sp, #8
 290              		.cfi_def_cfa_offset 16
 291 00ec 00AF     		add	r7, sp, #0
 292              		.cfi_def_cfa_register 7
 293 00ee 7860     		str	r0, [r7, #4]
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****    #ifdef SIMULATOR
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** while( ms-- )
 294              		.loc 1 79 0
 295 00f0 02E0     		b	.L17
 296              	.L18:
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  delay_mikro(1);
 297              		.loc 1 80 0
 298 00f2 0120     		movs	r0, #1
 299 00f4 FFF7FEFF 		bl	delay_mikro
 300              	.L17:
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  delay_mikro(1);
 301              		.loc 1 79 0
 302 00f8 7B68     		ldr	r3, [r7, #4]
 303 00fa 5A1E     		subs	r2, r3, #1
 304 00fc 7A60     		str	r2, [r7, #4]
 305 00fe 002B     		cmp	r3, #0
 306 0100 F7D1     		bne	.L18
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #else
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** while( ms-- )
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****  delay_mikro(1);// ska vara 1000
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c **** #endif
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Delay\startup.c ****     }
 307              		.loc 1 85 0
 308 0102 C046     		nop
 309 0104 BD46     		mov	sp, r7
 310 0106 02B0     		add	sp, sp, #8
 311              		@ sp needed
 312 0108 80BD     		pop	{r7, pc}
 313              		.cfi_endproc
 314              	.LFE5:
 316              	.Letext0:
