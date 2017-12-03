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
  17              	systick_flag:
  18 0000 00000000 		.space	4
  20              		.align	2
  21              	delay_count:
  22 0004 00000000 		.space	4
  24              		.section	.start_section,"ax",%progbits
  25              		.align	1
  26              		.global	startup
  27              		.syntax unified
  28              		.code	16
  29              		.thumb_func
  30              		.fpu softvfp
  32              	startup:
  33              	.LFB0:
  34              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define DELAY_COUNT 100
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define	GPIO_D			0x40020C00
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes 채r 32 bitar*/
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper an채nder 2 b
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC s채ger vilken offset GPIO beh�
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high m책ste 
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high m책ste 
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define	GPIO_E			0x40021000
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes 채r 32 bitar*/
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper an채nder 2 b
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC s채ger vilken offset GPIO beh�
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high m책ste 
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high m책ste 
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** static volatile int systick_flag;
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** static volatile int delay_count;
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** //H책rdvara
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** //#define DELAY_COUNT 100000
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** void startup ( void )
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** {
  35              		.loc 1 37 0
  36              		.cfi_startproc
  37              		@ Naked Function: prologue and epilogue provided by programmer.
  38              		@ args = 0, pretend = 0, frame = 0
  39              		@ frame_needed = 1, uses_anonymous_args = 0
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** __asm volatile(
  40              		.loc 1 38 0
  41              		.syntax divided
  42              	@ 38 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick/startup.c" 1
  43 0000 0248     		 LDR R0,=0x2001C000
  44 0002 8546     	 MOV SP,R0
  45 0004 FFF7FEFF 	 BL main
  46 0008 FEE7     	_exit: B .
  47              	
  48              	@ 0 "" 2
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	" MOV SP,R0\n"
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	" BL main\n"				/* call main */
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	"_exit: B .\n"				/* never return */
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	) ;
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** }
  49              		.loc 1 44 0
  50              		.thumb
  51              		.syntax unified
  52 000a C046     		nop
  53              		.cfi_endproc
  54              	.LFE0:
  56              		.text
  57              		.align	1
  58              		.global	systick_irq_handler
  59              		.syntax unified
  60              		.code	16
  61              		.thumb_func
  62              		.fpu softvfp
  64              	systick_irq_handler:
  65              	.LFB1:
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** void systick_irq_handler(void){
  66              		.loc 1 45 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 0
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0000 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0002 00AF     		add	r7, sp, #0
  75              		.cfi_def_cfa_register 7
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *STK_CTRL = 0;
  76              		.loc 1 46 0
  77 0004 0B4B     		ldr	r3, .L5
  78 0006 0022     		movs	r2, #0
  79 0008 1A60     		str	r2, [r3]
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     delay_count --;
  80              		.loc 1 47 0
  81 000a 0B4B     		ldr	r3, .L5+4
  82 000c 1B68     		ldr	r3, [r3]
  83 000e 5A1E     		subs	r2, r3, #1
  84 0010 094B     		ldr	r3, .L5+4
  85 0012 1A60     		str	r2, [r3]
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     if(delay_count > 0)
  86              		.loc 1 48 0
  87 0014 084B     		ldr	r3, .L5+4
  88 0016 1B68     		ldr	r3, [r3]
  89 0018 002B     		cmp	r3, #0
  90 001a 02DD     		ble	.L3
  91              	.LBB2:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         delay_1mikro();
  92              		.loc 1 49 0
  93 001c FFF7FEFF 		bl	delay_1mikro
  94              	.LBE2:
  95 0020 02E0     		b	.L4
  96              	.L3:
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     else
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         systick_flag = 1;
  97              		.loc 1 51 0
  98 0022 064B     		ldr	r3, .L5+8
  99 0024 0122     		movs	r2, #1
 100 0026 1A60     		str	r2, [r3]
 101              	.L4:
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     systick_flag = 1;
 102              		.loc 1 52 0
 103 0028 044B     		ldr	r3, .L5+8
 104 002a 0122     		movs	r2, #1
 105 002c 1A60     		str	r2, [r3]
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     }
 106              		.loc 1 53 0
 107 002e C046     		nop
 108 0030 BD46     		mov	sp, r7
 109              		@ sp needed
 110 0032 80BD     		pop	{r7, pc}
 111              	.L6:
 112              		.align	2
 113              	.L5:
 114 0034 10E000E0 		.word	-536813552
 115 0038 04000000 		.word	delay_count
 116 003c 00000000 		.word	systick_flag
 117              		.cfi_endproc
 118              	.LFE1:
 120              		.align	1
 121              		.global	init_app
 122              		.syntax unified
 123              		.code	16
 124              		.thumb_func
 125              		.fpu softvfp
 127              	init_app:
 128              	.LFB2:
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** void init_app(void){
 129              		.loc 1 54 0
 130              		.cfi_startproc
 131              		@ args = 0, pretend = 0, frame = 0
 132              		@ frame_needed = 1, uses_anonymous_args = 0
 133 0040 80B5     		push	{r7, lr}
 134              		.cfi_def_cfa_offset 8
 135              		.cfi_offset 7, -8
 136              		.cfi_offset 14, -4
 137 0042 00AF     		add	r7, sp, #0
 138              		.cfi_def_cfa_register 7
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****      *GPIOE_MODER = 0x55555555;
 139              		.loc 1 55 0
 140 0044 0B4B     		ldr	r3, .L8
 141 0046 0C4A     		ldr	r2, .L8+4
 142 0048 1A60     		str	r2, [r3]
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	/*s채tter v책ra in och ut portar*/
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	//*GPIOE_OTYPER = 0x70;
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	//*GPIOE_PUPDR = 0x0AA;
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	//*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *GPIOD_MODER = 0x55005555;
 143              		.loc 1 61 0
 144 004a 0C4B     		ldr	r3, .L8+8
 145 004c 0C4A     		ldr	r2, .L8+12
 146 004e 1A60     		str	r2, [r3]
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	/*s채tter v책ra in och ut portar*/
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	*GPIOD_OTYPER = 0x70;
 147              		.loc 1 63 0
 148 0050 0C4B     		ldr	r3, .L8+16
 149 0052 7022     		movs	r2, #112
 150 0054 1A80     		strh	r2, [r3]
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	*GPIOD_PUPDR = 0x0AA;
 151              		.loc 1 64 0
 152 0056 0C4B     		ldr	r3, .L8+20
 153 0058 AA22     		movs	r2, #170
 154 005a 1A60     		str	r2, [r3]
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** 	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
 155              		.loc 1 65 0
 156 005c 0B4B     		ldr	r3, .L8+24
 157 005e 0B4A     		ldr	r2, .L8+24
 158 0060 1278     		ldrb	r2, [r2]
 159 0062 D2B2     		uxtb	r2, r2
 160 0064 1A70     		strb	r2, [r3]
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *((void (**) (void)) 0x2001c03c) = systick_irq_handler;
 161              		.loc 1 66 0
 162 0066 0A4B     		ldr	r3, .L8+28
 163 0068 0A4A     		ldr	r2, .L8+32
 164 006a 1A60     		str	r2, [r3]
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     }
 165              		.loc 1 67 0
 166 006c C046     		nop
 167 006e BD46     		mov	sp, r7
 168              		@ sp needed
 169 0070 80BD     		pop	{r7, pc}
 170              	.L9:
 171 0072 C046     		.align	2
 172              	.L8:
 173 0074 00100240 		.word	1073876992
 174 0078 55555555 		.word	1431655765
 175 007c 000C0240 		.word	1073875968
 176 0080 55550055 		.word	1426085205
 177 0084 040C0240 		.word	1073875972
 178 0088 0C0C0240 		.word	1073875980
 179 008c 150C0240 		.word	1073875989
 180 0090 3CC00120 		.word	536985660
 181 0094 00000000 		.word	systick_irq_handler
 182              		.cfi_endproc
 183              	.LFE2:
 185              		.align	1
 186              		.global	main
 187              		.syntax unified
 188              		.code	16
 189              		.thumb_func
 190              		.fpu softvfp
 192              	main:
 193              	.LFB3:
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** void main(void)
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** {
 194              		.loc 1 69 0
 195              		.cfi_startproc
 196              		@ args = 0, pretend = 0, frame = 8
 197              		@ frame_needed = 1, uses_anonymous_args = 0
 198 0098 80B5     		push	{r7, lr}
 199              		.cfi_def_cfa_offset 8
 200              		.cfi_offset 7, -8
 201              		.cfi_offset 14, -4
 202 009a 82B0     		sub	sp, sp, #8
 203              		.cfi_def_cfa_offset 16
 204 009c 00AF     		add	r7, sp, #0
 205              		.cfi_def_cfa_register 7
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     init_app();
 206              		.loc 1 70 0
 207 009e FFF7FEFF 		bl	init_app
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     int c = 0;
 208              		.loc 1 71 0
 209 00a2 0023     		movs	r3, #0
 210 00a4 7B60     		str	r3, [r7, #4]
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *GPIOE_ODR_LOW = 0x00;
 211              		.loc 1 72 0
 212 00a6 0C4B     		ldr	r3, .L16
 213 00a8 0022     		movs	r2, #0
 214 00aa 1A70     		strb	r2, [r3]
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     delay(DELAY_COUNT);
 215              		.loc 1 73 0
 216 00ac 6420     		movs	r0, #100
 217 00ae FFF7FEFF 		bl	delay
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *GPIOE_ODR_LOW = 0xFF;
 218              		.loc 1 74 0
 219 00b2 094B     		ldr	r3, .L16
 220 00b4 FF22     		movs	r2, #255
 221 00b6 1A70     		strb	r2, [r3]
 222              	.L13:
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     while(1){
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         if(systick_flag){
 223              		.loc 1 76 0
 224 00b8 084B     		ldr	r3, .L16+4
 225 00ba 1B68     		ldr	r3, [r3]
 226 00bc 002B     		cmp	r3, #0
 227 00be 03D1     		bne	.L15
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****             break;
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****             }
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****             c++;
 228              		.loc 1 79 0
 229 00c0 7B68     		ldr	r3, [r7, #4]
 230 00c2 0133     		adds	r3, r3, #1
 231 00c4 7B60     		str	r3, [r7, #4]
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****             break;
 232              		.loc 1 76 0
 233 00c6 F7E7     		b	.L13
 234              	.L15:
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****             break;
 235              		.loc 1 77 0
 236 00c8 C046     		nop
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         }
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *GPIOE_ODR_LOW = 0;
 237              		.loc 1 81 0
 238 00ca 034B     		ldr	r3, .L16
 239 00cc 0022     		movs	r2, #0
 240 00ce 1A70     		strb	r2, [r3]
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** }
 241              		.loc 1 82 0
 242 00d0 C046     		nop
 243 00d2 BD46     		mov	sp, r7
 244 00d4 02B0     		add	sp, sp, #8
 245              		@ sp needed
 246 00d6 80BD     		pop	{r7, pc}
 247              	.L17:
 248              		.align	2
 249              	.L16:
 250 00d8 14100240 		.word	1073877012
 251 00dc 00000000 		.word	systick_flag
 252              		.cfi_endproc
 253              	.LFE3:
 255              		.align	1
 256              		.global	delay_1mikro
 257              		.syntax unified
 258              		.code	16
 259              		.thumb_func
 260              		.fpu softvfp
 262              	delay_1mikro:
 263              	.LFB4:
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** void delay_1mikro(void){
 264              		.loc 1 83 0
 265              		.cfi_startproc
 266              		@ args = 0, pretend = 0, frame = 0
 267              		@ frame_needed = 1, uses_anonymous_args = 0
 268 00e0 80B5     		push	{r7, lr}
 269              		.cfi_def_cfa_offset 8
 270              		.cfi_offset 7, -8
 271              		.cfi_offset 14, -4
 272 00e2 00AF     		add	r7, sp, #0
 273              		.cfi_def_cfa_register 7
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *STK_CTRL = 0;
 274              		.loc 1 84 0
 275 00e4 074B     		ldr	r3, .L19
 276 00e6 0022     		movs	r2, #0
 277 00e8 1A60     		str	r2, [r3]
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *STK_LOAD = (168 -1);
 278              		.loc 1 85 0
 279 00ea 074B     		ldr	r3, .L19+4
 280 00ec A722     		movs	r2, #167
 281 00ee 1A60     		str	r2, [r3]
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *STK_VAL = 0;
 282              		.loc 1 86 0
 283 00f0 064B     		ldr	r3, .L19+8
 284 00f2 0022     		movs	r2, #0
 285 00f4 1A60     		str	r2, [r3]
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     *STK_CTRL = 7;
 286              		.loc 1 87 0
 287 00f6 034B     		ldr	r3, .L19
 288 00f8 0722     		movs	r2, #7
 289 00fa 1A60     		str	r2, [r3]
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     }
 290              		.loc 1 88 0
 291 00fc C046     		nop
 292 00fe BD46     		mov	sp, r7
 293              		@ sp needed
 294 0100 80BD     		pop	{r7, pc}
 295              	.L20:
 296 0102 C046     		.align	2
 297              	.L19:
 298 0104 10E000E0 		.word	-536813552
 299 0108 14E000E0 		.word	-536813548
 300 010c 18E000E0 		.word	-536813544
 301              		.cfi_endproc
 302              	.LFE4:
 304              		.align	1
 305              		.global	delay
 306              		.syntax unified
 307              		.code	16
 308              		.thumb_func
 309              		.fpu softvfp
 311              	delay:
 312              	.LFB5:
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** void delay(unsigned int count)
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c **** {
 313              		.loc 1 90 0
 314              		.cfi_startproc
 315              		@ args = 0, pretend = 0, frame = 8
 316              		@ frame_needed = 1, uses_anonymous_args = 0
 317 0110 80B5     		push	{r7, lr}
 318              		.cfi_def_cfa_offset 8
 319              		.cfi_offset 7, -8
 320              		.cfi_offset 14, -4
 321 0112 82B0     		sub	sp, sp, #8
 322              		.cfi_def_cfa_offset 16
 323 0114 00AF     		add	r7, sp, #0
 324              		.cfi_def_cfa_register 7
 325 0116 7860     		str	r0, [r7, #4]
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     if(count == 0)
 326              		.loc 1 91 0
 327 0118 7B68     		ldr	r3, [r7, #4]
 328 011a 002B     		cmp	r3, #0
 329 011c 08D0     		beq	.L24
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         return;
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         delay_count = count;
 330              		.loc 1 93 0
 331 011e 7A68     		ldr	r2, [r7, #4]
 332 0120 054B     		ldr	r3, .L25
 333 0122 1A60     		str	r2, [r3]
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         systick_flag = 0;
 334              		.loc 1 94 0
 335 0124 054B     		ldr	r3, .L25+4
 336 0126 0022     		movs	r2, #0
 337 0128 1A60     		str	r2, [r3]
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         delay_1mikro();
 338              		.loc 1 95 0
 339 012a FFF7FEFF 		bl	delay_1mikro
 340 012e 00E0     		b	.L21
 341              	.L24:
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****         return;
 342              		.loc 1 92 0
 343 0130 C046     		nop
 344              	.L21:
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/SystTick\startup.c ****     }
 345              		.loc 1 96 0
 346 0132 BD46     		mov	sp, r7
 347 0134 02B0     		add	sp, sp, #8
 348              		@ sp needed
 349 0136 80BD     		pop	{r7, pc}
 350              	.L26:
 351              		.align	2
 352              	.L25:
 353 0138 04000000 		.word	delay_count
 354 013c 00000000 		.word	systick_flag
 355              		.cfi_endproc
 356              	.LFE5:
 358              	.Letext0:
