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
  25              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define	GPIO_D			0x40020C00
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO beh�
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste 
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define	GPIO_E			0x40021000
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 b
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO beh�
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste 
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define B_E 0x40
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define B_SELECT 4
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define B_RW 2
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #define B_RS 1 
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void startup ( void )
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
  26              		.loc 1 36 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** __asm volatile(
  31              		.loc 1 37 0
  32              		.syntax divided
  33              	@ 37 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 	" MOV SP,R0\n"
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 	" BL main\n"				/* call main */
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 	) ;
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
  40              		.loc 1 43 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	main
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	main:
  56              	.LFB1:
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void main(void)
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
  57              		.loc 1 46 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
  67              		.loc 1 47 0
  68 0004 C046     		nop
  69 0006 BD46     		mov	sp, r7
  70              		@ sp needed
  71 0008 80BD     		pop	{r7, pc}
  72              		.cfi_endproc
  73              	.LFE1:
  75              		.align	1
  76              		.global	delay_250ns
  77              		.syntax unified
  78              		.code	16
  79              		.thumb_func
  80              		.fpu softvfp
  82              	delay_250ns:
  83              	.LFB2:
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void delay_250ns(void){
  84              		.loc 1 48 0
  85              		.cfi_startproc
  86              		@ args = 0, pretend = 0, frame = 0
  87              		@ frame_needed = 1, uses_anonymous_args = 0
  88 000a 80B5     		push	{r7, lr}
  89              		.cfi_def_cfa_offset 8
  90              		.cfi_offset 7, -8
  91              		.cfi_offset 14, -4
  92 000c 00AF     		add	r7, sp, #0
  93              		.cfi_def_cfa_register 7
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_CTRL = 0;
  94              		.loc 1 50 0
  95 000e 0C4B     		ldr	r3, .L5
  96 0010 0022     		movs	r2, #0
  97 0012 1A60     		str	r2, [r3]
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_LOAD = ( (168/4) -1 );
  98              		.loc 1 51 0
  99 0014 0B4B     		ldr	r3, .L5+4
 100 0016 2922     		movs	r2, #41
 101 0018 1A60     		str	r2, [r3]
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_VAL = 0;
 102              		.loc 1 52 0
 103 001a 0B4B     		ldr	r3, .L5+8
 104 001c 0022     		movs	r2, #0
 105 001e 1A60     		str	r2, [r3]
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_CTRL = 5;
 106              		.loc 1 53 0
 107 0020 074B     		ldr	r3, .L5
 108 0022 0522     		movs	r2, #5
 109 0024 1A60     		str	r2, [r3]
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  while( (*STK_CTRL & 0x10000 )== 0 )
 110              		.loc 1 55 0
 111 0026 C046     		nop
 112              	.L4:
 113              		.loc 1 55 0 is_stmt 0 discriminator 1
 114 0028 054B     		ldr	r3, .L5
 115 002a 1A68     		ldr	r2, [r3]
 116 002c 8023     		movs	r3, #128
 117 002e 5B02     		lsls	r3, r3, #9
 118 0030 1340     		ands	r3, r2
 119 0032 F9D0     		beq	.L4
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  {}
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  *STK_CTRL = 0; 
 120              		.loc 1 57 0 is_stmt 1
 121 0034 024B     		ldr	r3, .L5
 122 0036 0022     		movs	r2, #0
 123 0038 1A60     		str	r2, [r3]
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     }
 124              		.loc 1 58 0
 125 003a C046     		nop
 126 003c BD46     		mov	sp, r7
 127              		@ sp needed
 128 003e 80BD     		pop	{r7, pc}
 129              	.L6:
 130              		.align	2
 131              	.L5:
 132 0040 10E000E0 		.word	-536813552
 133 0044 14E000E0 		.word	-536813548
 134 0048 18E000E0 		.word	-536813544
 135              		.cfi_endproc
 136              	.LFE2:
 138              		.align	1
 139              		.global	delay_mikro
 140              		.syntax unified
 141              		.code	16
 142              		.thumb_func
 143              		.fpu softvfp
 145              	delay_mikro:
 146              	.LFB3:
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void delay_mikro(unsigned int us){
 147              		.loc 1 59 0
 148              		.cfi_startproc
 149              		@ args = 0, pretend = 0, frame = 8
 150              		@ frame_needed = 1, uses_anonymous_args = 0
 151 004c 80B5     		push	{r7, lr}
 152              		.cfi_def_cfa_offset 8
 153              		.cfi_offset 7, -8
 154              		.cfi_offset 14, -4
 155 004e 82B0     		sub	sp, sp, #8
 156              		.cfi_def_cfa_offset 16
 157 0050 00AF     		add	r7, sp, #0
 158              		.cfi_def_cfa_register 7
 159 0052 7860     		str	r0, [r7, #4]
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      while(us--) {
 160              		.loc 1 61 0
 161 0054 07E0     		b	.L8
 162              	.L9:
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 163              		.loc 1 62 0
 164 0056 FFF7FEFF 		bl	delay_250ns
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 165              		.loc 1 63 0
 166 005a FFF7FEFF 		bl	delay_250ns
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 167              		.loc 1 64 0
 168 005e FFF7FEFF 		bl	delay_250ns
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 169              		.loc 1 65 0
 170 0062 FFF7FEFF 		bl	delay_250ns
 171              	.L8:
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 172              		.loc 1 61 0
 173 0066 7B68     		ldr	r3, [r7, #4]
 174 0068 5A1E     		subs	r2, r3, #1
 175 006a 7A60     		str	r2, [r7, #4]
 176 006c 002B     		cmp	r3, #0
 177 006e F2D1     		bne	.L9
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     }
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  }
 178              		.loc 1 67 0
 179 0070 C046     		nop
 180 0072 BD46     		mov	sp, r7
 181 0074 02B0     		add	sp, sp, #8
 182              		@ sp needed
 183 0076 80BD     		pop	{r7, pc}
 184              		.cfi_endproc
 185              	.LFE3:
 187              		.align	1
 188              		.global	delay_milli
 189              		.syntax unified
 190              		.code	16
 191              		.thumb_func
 192              		.fpu softvfp
 194              	delay_milli:
 195              	.LFB4:
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void delay_milli(unsigned int ms){
 196              		.loc 1 68 0
 197              		.cfi_startproc
 198              		@ args = 0, pretend = 0, frame = 8
 199              		@ frame_needed = 1, uses_anonymous_args = 0
 200 0078 80B5     		push	{r7, lr}
 201              		.cfi_def_cfa_offset 8
 202              		.cfi_offset 7, -8
 203              		.cfi_offset 14, -4
 204 007a 82B0     		sub	sp, sp, #8
 205              		.cfi_def_cfa_offset 16
 206 007c 00AF     		add	r7, sp, #0
 207              		.cfi_def_cfa_register 7
 208 007e 7860     		str	r0, [r7, #4]
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****    #ifdef SIMULATOR
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** while( ms-- )
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  delay_mikro(1);
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #else
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** while( ms-- )
 209              		.loc 1 74 0
 210 0080 02E0     		b	.L11
 211              	.L12:
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  delay_mikro(1);// ska vara 1000
 212              		.loc 1 75 0
 213 0082 0120     		movs	r0, #1
 214 0084 FFF7FEFF 		bl	delay_mikro
 215              	.L11:
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  delay_mikro(1);// ska vara 1000
 216              		.loc 1 74 0
 217 0088 7B68     		ldr	r3, [r7, #4]
 218 008a 5A1E     		subs	r2, r3, #1
 219 008c 7A60     		str	r2, [r7, #4]
 220 008e 002B     		cmp	r3, #0
 221 0090 F7D1     		bne	.L12
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #endif
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     }
 222              		.loc 1 77 0
 223 0092 C046     		nop
 224 0094 BD46     		mov	sp, r7
 225 0096 02B0     		add	sp, sp, #8
 226              		@ sp needed
 227 0098 80BD     		pop	{r7, pc}
 228              		.cfi_endproc
 229              	.LFE4:
 231              		.align	1
 232              		.global	ascii_ctrl_bit_set
 233              		.syntax unified
 234              		.code	16
 235              		.thumb_func
 236              		.fpu softvfp
 238              	ascii_ctrl_bit_set:
 239              	.LFB5:
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_set( unsigned char x )
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** { /* Funktion för att 1-ställa bitar */
 240              		.loc 1 79 0
 241              		.cfi_startproc
 242              		@ args = 0, pretend = 0, frame = 16
 243              		@ frame_needed = 1, uses_anonymous_args = 0
 244 009a 80B5     		push	{r7, lr}
 245              		.cfi_def_cfa_offset 8
 246              		.cfi_offset 7, -8
 247              		.cfi_offset 14, -4
 248 009c 84B0     		sub	sp, sp, #16
 249              		.cfi_def_cfa_offset 24
 250 009e 00AF     		add	r7, sp, #0
 251              		.cfi_def_cfa_register 7
 252 00a0 0200     		movs	r2, r0
 253 00a2 FB1D     		adds	r3, r7, #7
 254 00a4 1A70     		strb	r2, [r3]
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char c;
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = *GPIOE_ODR_LOW;
 255              		.loc 1 82 0
 256 00a6 0D4A     		ldr	r2, .L14
 257 00a8 0F23     		movs	r3, #15
 258 00aa FB18     		adds	r3, r7, r3
 259 00ac 1278     		ldrb	r2, [r2]
 260 00ae 1A70     		strb	r2, [r3]
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c |= ( B_SELECT | x );
 261              		.loc 1 83 0
 262 00b0 FA1D     		adds	r2, r7, #7
 263 00b2 0F23     		movs	r3, #15
 264 00b4 FB18     		adds	r3, r7, r3
 265 00b6 1278     		ldrb	r2, [r2]
 266 00b8 1B78     		ldrb	r3, [r3]
 267 00ba 1343     		orrs	r3, r2
 268 00bc DAB2     		uxtb	r2, r3
 269 00be 0F23     		movs	r3, #15
 270 00c0 FB18     		adds	r3, r7, r3
 271 00c2 0421     		movs	r1, #4
 272 00c4 0A43     		orrs	r2, r1
 273 00c6 1A70     		strb	r2, [r3]
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *GPIOE_ODR_LOW = c;
 274              		.loc 1 84 0
 275 00c8 044A     		ldr	r2, .L14
 276 00ca 0F23     		movs	r3, #15
 277 00cc FB18     		adds	r3, r7, r3
 278 00ce 1B78     		ldrb	r3, [r3]
 279 00d0 1370     		strb	r3, [r2]
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
 280              		.loc 1 85 0
 281 00d2 C046     		nop
 282 00d4 BD46     		mov	sp, r7
 283 00d6 04B0     		add	sp, sp, #16
 284              		@ sp needed
 285 00d8 80BD     		pop	{r7, pc}
 286              	.L15:
 287 00da C046     		.align	2
 288              	.L14:
 289 00dc 14100240 		.word	1073877012
 290              		.cfi_endproc
 291              	.LFE5:
 293              		.align	1
 294              		.global	ascii_ctrl_bit_clear
 295              		.syntax unified
 296              		.code	16
 297              		.thumb_func
 298              		.fpu softvfp
 300              	ascii_ctrl_bit_clear:
 301              	.LFB6:
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_clear( unsigned char x )
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 302              		.loc 1 88 0
 303              		.cfi_startproc
 304              		@ args = 0, pretend = 0, frame = 16
 305              		@ frame_needed = 1, uses_anonymous_args = 0
 306 00e0 80B5     		push	{r7, lr}
 307              		.cfi_def_cfa_offset 8
 308              		.cfi_offset 7, -8
 309              		.cfi_offset 14, -4
 310 00e2 84B0     		sub	sp, sp, #16
 311              		.cfi_def_cfa_offset 24
 312 00e4 00AF     		add	r7, sp, #0
 313              		.cfi_def_cfa_register 7
 314 00e6 0200     		movs	r2, r0
 315 00e8 FB1D     		adds	r3, r7, #7
 316 00ea 1A70     		strb	r2, [r3]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char c;
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = *GPIOE_ODR_LOW;
 317              		.loc 1 90 0
 318 00ec 0F4A     		ldr	r2, .L17
 319 00ee 0F23     		movs	r3, #15
 320 00f0 FB18     		adds	r3, r7, r3
 321 00f2 1278     		ldrb	r2, [r2]
 322 00f4 1A70     		strb	r2, [r3]
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = B_SELECT | ( c & ~x );
 323              		.loc 1 91 0
 324 00f6 FB1D     		adds	r3, r7, #7
 325 00f8 1B78     		ldrb	r3, [r3]
 326 00fa 5BB2     		sxtb	r3, r3
 327 00fc DB43     		mvns	r3, r3
 328 00fe 5BB2     		sxtb	r3, r3
 329 0100 0F22     		movs	r2, #15
 330 0102 BA18     		adds	r2, r7, r2
 331 0104 1278     		ldrb	r2, [r2]
 332 0106 52B2     		sxtb	r2, r2
 333 0108 1340     		ands	r3, r2
 334 010a 5BB2     		sxtb	r3, r3
 335 010c 0422     		movs	r2, #4
 336 010e 1343     		orrs	r3, r2
 337 0110 5AB2     		sxtb	r2, r3
 338 0112 0F23     		movs	r3, #15
 339 0114 FB18     		adds	r3, r7, r3
 340 0116 1A70     		strb	r2, [r3]
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *GPIOE_ODR_LOW = c;
 341              		.loc 1 92 0
 342 0118 044A     		ldr	r2, .L17
 343 011a 0F23     		movs	r3, #15
 344 011c FB18     		adds	r3, r7, r3
 345 011e 1B78     		ldrb	r3, [r3]
 346 0120 1370     		strb	r3, [r2]
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** } 
 347              		.loc 1 93 0
 348 0122 C046     		nop
 349 0124 BD46     		mov	sp, r7
 350 0126 04B0     		add	sp, sp, #16
 351              		@ sp needed
 352 0128 80BD     		pop	{r7, pc}
 353              	.L18:
 354 012a C046     		.align	2
 355              	.L17:
 356 012c 14100240 		.word	1073877012
 357              		.cfi_endproc
 358              	.LFE6:
 360              		.align	1
 361              		.global	ascii_write_cmd
 362              		.syntax unified
 363              		.code	16
 364              		.thumb_func
 365              		.fpu softvfp
 367              	ascii_write_cmd:
 368              	.LFB7:
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_write_cmd(unsigned char c)
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 369              		.loc 1 97 0
 370              		.cfi_startproc
 371              		@ args = 0, pretend = 0, frame = 8
 372              		@ frame_needed = 1, uses_anonymous_args = 0
 373 0130 80B5     		push	{r7, lr}
 374              		.cfi_def_cfa_offset 8
 375              		.cfi_offset 7, -8
 376              		.cfi_offset 14, -4
 377 0132 82B0     		sub	sp, sp, #8
 378              		.cfi_def_cfa_offset 16
 379 0134 00AF     		add	r7, sp, #0
 380              		.cfi_def_cfa_register 7
 381 0136 0200     		movs	r2, r0
 382 0138 FB1D     		adds	r3, r7, #7
 383 013a 1A70     		strb	r2, [r3]
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     ascii_ctrl_bit_clear(B_RS | B_RW);    // "|" = bitvis eller
 384              		.loc 1 98 0
 385 013c 0320     		movs	r0, #3
 386 013e FFF7FEFF 		bl	ascii_ctrl_bit_clear
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     ascii_write_controller(c);
 387              		.loc 1 99 0
 388 0142 FB1D     		adds	r3, r7, #7
 389 0144 1B78     		ldrb	r3, [r3]
 390 0146 1800     		movs	r0, r3
 391 0148 FFF7FEFF 		bl	ascii_write_controller
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
 392              		.loc 1 100 0
 393 014c C046     		nop
 394 014e BD46     		mov	sp, r7
 395 0150 02B0     		add	sp, sp, #8
 396              		@ sp needed
 397 0152 80BD     		pop	{r7, pc}
 398              		.cfi_endproc
 399              	.LFE7:
 401              		.align	1
 402              		.global	ascii_write_controller
 403              		.syntax unified
 404              		.code	16
 405              		.thumb_func
 406              		.fpu softvfp
 408              	ascii_write_controller:
 409              	.LFB8:
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_write_controller( unsigned char c )
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 410              		.loc 1 102 0
 411              		.cfi_startproc
 412              		@ args = 0, pretend = 0, frame = 8
 413              		@ frame_needed = 1, uses_anonymous_args = 0
 414 0154 80B5     		push	{r7, lr}
 415              		.cfi_def_cfa_offset 8
 416              		.cfi_offset 7, -8
 417              		.cfi_offset 14, -4
 418 0156 82B0     		sub	sp, sp, #8
 419              		.cfi_def_cfa_offset 16
 420 0158 00AF     		add	r7, sp, #0
 421              		.cfi_def_cfa_register 7
 422 015a 0200     		movs	r2, r0
 423 015c FB1D     		adds	r3, r7, #7
 424 015e 1A70     		strb	r2, [r3]
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_set( B_E );
 425              		.loc 1 103 0
 426 0160 4020     		movs	r0, #64
 427 0162 FFF7FEFF 		bl	ascii_ctrl_bit_set
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *GPIOE_ODR_HIGH = c;
 428              		.loc 1 104 0
 429 0166 064A     		ldr	r2, .L21
 430 0168 FB1D     		adds	r3, r7, #7
 431 016a 1B78     		ldrb	r3, [r3]
 432 016c 1370     		strb	r3, [r2]
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** delay_250ns();
 433              		.loc 1 105 0
 434 016e FFF7FEFF 		bl	delay_250ns
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_clear( B_E );
 435              		.loc 1 106 0
 436 0172 4020     		movs	r0, #64
 437 0174 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
 438              		.loc 1 107 0
 439 0178 C046     		nop
 440 017a BD46     		mov	sp, r7
 441 017c 02B0     		add	sp, sp, #8
 442              		@ sp needed
 443 017e 80BD     		pop	{r7, pc}
 444              	.L22:
 445              		.align	2
 446              	.L21:
 447 0180 15100240 		.word	1073877013
 448              		.cfi_endproc
 449              	.LFE8:
 451              		.align	1
 452              		.global	ascii_read_controller
 453              		.syntax unified
 454              		.code	16
 455              		.thumb_func
 456              		.fpu softvfp
 458              	ascii_read_controller:
 459              	.LFB9:
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_controller( void )
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 460              		.loc 1 109 0
 461              		.cfi_startproc
 462              		@ args = 0, pretend = 0, frame = 8
 463              		@ frame_needed = 1, uses_anonymous_args = 0
 464 0184 80B5     		push	{r7, lr}
 465              		.cfi_def_cfa_offset 8
 466              		.cfi_offset 7, -8
 467              		.cfi_offset 14, -4
 468 0186 82B0     		sub	sp, sp, #8
 469              		.cfi_def_cfa_offset 16
 470 0188 00AF     		add	r7, sp, #0
 471              		.cfi_def_cfa_register 7
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char c;
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_set( B_E );
 472              		.loc 1 111 0
 473 018a 4020     		movs	r0, #64
 474 018c FFF7FEFF 		bl	ascii_ctrl_bit_set
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** delay_250ns(); /* max 360 ns */
 475              		.loc 1 112 0
 476 0190 FFF7FEFF 		bl	delay_250ns
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** delay_250ns();
 477              		.loc 1 113 0
 478 0194 FFF7FEFF 		bl	delay_250ns
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = *GPIOE_IDR_HIGH;
 479              		.loc 1 114 0
 480 0198 064A     		ldr	r2, .L25
 481 019a FB1D     		adds	r3, r7, #7
 482 019c 1278     		ldrb	r2, [r2]
 483 019e 1A70     		strb	r2, [r3]
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_clear( B_E );
 484              		.loc 1 115 0
 485 01a0 4020     		movs	r0, #64
 486 01a2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** return c;
 487              		.loc 1 116 0
 488 01a6 FB1D     		adds	r3, r7, #7
 489 01a8 1B78     		ldrb	r3, [r3]
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** } ...
 490              		.loc 1 117 0
 491 01aa 1800     		movs	r0, r3
 492 01ac BD46     		mov	sp, r7
 493 01ae 02B0     		add	sp, sp, #8
 494              		@ sp needed
 495 01b0 80BD     		pop	{r7, pc}
 496              	.L26:
 497 01b2 C046     		.align	2
 498              	.L25:
 499 01b4 11100240 		.word	1073877009
 500              		.cfi_endproc
 501              	.LFE9:
 503              	.Letext0:
