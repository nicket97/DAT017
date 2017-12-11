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
  47              		.section	.rodata
  48              		.align	2
  49              	.LC0:
  50 0000 48       		.byte	72
  51 0001 45       		.byte	69
  52 0002 4A       		.byte	74
  53              		.text
  54              		.align	1
  55              		.global	main
  56              		.syntax unified
  57              		.code	16
  58              		.thumb_func
  59              		.fpu softvfp
  61              	main:
  62              	.LFB1:
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void main(void)
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
  63              		.loc 1 46 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 8
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 82B0     		sub	sp, sp, #8
  72              		.cfi_def_cfa_offset 16
  73 0004 00AF     		add	r7, sp, #0
  74              		.cfi_def_cfa_register 7
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     char *s;
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     char test1[] = {'H','E','J'};
  75              		.loc 1 48 0
  76 0006 3B00     		movs	r3, r7
  77 0008 0C4A     		ldr	r2, .L5
  78 000a 1188     		ldrh	r1, [r2]
  79 000c 1980     		strh	r1, [r3]
  80 000e 9278     		ldrb	r2, [r2, #2]
  81 0010 9A70     		strb	r2, [r3, #2]
  82              	.LBB2:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     for(int i = 0; i < 3; i++){
  83              		.loc 1 49 0
  84 0012 0023     		movs	r3, #0
  85 0014 7B60     		str	r3, [r7, #4]
  86 0016 09E0     		b	.L3
  87              	.L4:
  88              	.LBB3:
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****         ascii_write_cmd(test1[i]);
  89              		.loc 1 50 0 discriminator 3
  90 0018 3A00     		movs	r2, r7
  91 001a 7B68     		ldr	r3, [r7, #4]
  92 001c D318     		adds	r3, r2, r3
  93 001e 1B78     		ldrb	r3, [r3]
  94 0020 1800     		movs	r0, r3
  95 0022 FFF7FEFF 		bl	ascii_write_cmd
  96              	.LBE3:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     for(int i = 0; i < 3; i++){
  97              		.loc 1 49 0 discriminator 3
  98 0026 7B68     		ldr	r3, [r7, #4]
  99 0028 0133     		adds	r3, r3, #1
 100 002a 7B60     		str	r3, [r7, #4]
 101              	.L3:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     for(int i = 0; i < 3; i++){
 102              		.loc 1 49 0 is_stmt 0 discriminator 1
 103 002c 7B68     		ldr	r3, [r7, #4]
 104 002e 022B     		cmp	r3, #2
 105 0030 F2DD     		ble	.L4
 106              	.LBE2:
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****         }
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
 107              		.loc 1 52 0 is_stmt 1
 108 0032 C046     		nop
 109 0034 BD46     		mov	sp, r7
 110 0036 02B0     		add	sp, sp, #8
 111              		@ sp needed
 112 0038 80BD     		pop	{r7, pc}
 113              	.L6:
 114 003a C046     		.align	2
 115              	.L5:
 116 003c 00000000 		.word	.LC0
 117              		.cfi_endproc
 118              	.LFE1:
 120              		.align	1
 121              		.global	delay_250ns
 122              		.syntax unified
 123              		.code	16
 124              		.thumb_func
 125              		.fpu softvfp
 127              	delay_250ns:
 128              	.LFB2:
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void delay_250ns(void){
 129              		.loc 1 53 0
 130              		.cfi_startproc
 131              		@ args = 0, pretend = 0, frame = 0
 132              		@ frame_needed = 1, uses_anonymous_args = 0
 133 0040 80B5     		push	{r7, lr}
 134              		.cfi_def_cfa_offset 8
 135              		.cfi_offset 7, -8
 136              		.cfi_offset 14, -4
 137 0042 00AF     		add	r7, sp, #0
 138              		.cfi_def_cfa_register 7
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_CTRL = 0;
 139              		.loc 1 55 0
 140 0044 0C4B     		ldr	r3, .L9
 141 0046 0022     		movs	r2, #0
 142 0048 1A60     		str	r2, [r3]
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_LOAD = ( (168/4) -1 );
 143              		.loc 1 56 0
 144 004a 0C4B     		ldr	r3, .L9+4
 145 004c 2922     		movs	r2, #41
 146 004e 1A60     		str	r2, [r3]
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_VAL = 0;
 147              		.loc 1 57 0
 148 0050 0B4B     		ldr	r3, .L9+8
 149 0052 0022     		movs	r2, #0
 150 0054 1A60     		str	r2, [r3]
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *STK_CTRL = 5;
 151              		.loc 1 58 0
 152 0056 084B     		ldr	r3, .L9
 153 0058 0522     		movs	r2, #5
 154 005a 1A60     		str	r2, [r3]
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  while( (*STK_CTRL & 0x10000 )== 0 )
 155              		.loc 1 60 0
 156 005c C046     		nop
 157              	.L8:
 158              		.loc 1 60 0 is_stmt 0 discriminator 1
 159 005e 064B     		ldr	r3, .L9
 160 0060 1A68     		ldr	r2, [r3]
 161 0062 8023     		movs	r3, #128
 162 0064 5B02     		lsls	r3, r3, #9
 163 0066 1340     		ands	r3, r2
 164 0068 F9D0     		beq	.L8
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  {}
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  *STK_CTRL = 0; 
 165              		.loc 1 62 0 is_stmt 1
 166 006a 034B     		ldr	r3, .L9
 167 006c 0022     		movs	r2, #0
 168 006e 1A60     		str	r2, [r3]
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     }
 169              		.loc 1 63 0
 170 0070 C046     		nop
 171 0072 BD46     		mov	sp, r7
 172              		@ sp needed
 173 0074 80BD     		pop	{r7, pc}
 174              	.L10:
 175 0076 C046     		.align	2
 176              	.L9:
 177 0078 10E000E0 		.word	-536813552
 178 007c 14E000E0 		.word	-536813548
 179 0080 18E000E0 		.word	-536813544
 180              		.cfi_endproc
 181              	.LFE2:
 183              		.align	1
 184              		.global	delay_mikro
 185              		.syntax unified
 186              		.code	16
 187              		.thumb_func
 188              		.fpu softvfp
 190              	delay_mikro:
 191              	.LFB3:
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void delay_mikro(unsigned int us){
 192              		.loc 1 64 0
 193              		.cfi_startproc
 194              		@ args = 0, pretend = 0, frame = 8
 195              		@ frame_needed = 1, uses_anonymous_args = 0
 196 0084 80B5     		push	{r7, lr}
 197              		.cfi_def_cfa_offset 8
 198              		.cfi_offset 7, -8
 199              		.cfi_offset 14, -4
 200 0086 82B0     		sub	sp, sp, #8
 201              		.cfi_def_cfa_offset 16
 202 0088 00AF     		add	r7, sp, #0
 203              		.cfi_def_cfa_register 7
 204 008a 7860     		str	r0, [r7, #4]
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      while(us--) {
 205              		.loc 1 66 0
 206 008c 07E0     		b	.L12
 207              	.L13:
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 208              		.loc 1 67 0
 209 008e FFF7FEFF 		bl	delay_250ns
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 210              		.loc 1 68 0
 211 0092 FFF7FEFF 		bl	delay_250ns
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 212              		.loc 1 69 0
 213 0096 FFF7FEFF 		bl	delay_250ns
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 214              		.loc 1 70 0
 215 009a FFF7FEFF 		bl	delay_250ns
 216              	.L12:
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****      delay_250ns();
 217              		.loc 1 66 0
 218 009e 7B68     		ldr	r3, [r7, #4]
 219 00a0 5A1E     		subs	r2, r3, #1
 220 00a2 7A60     		str	r2, [r7, #4]
 221 00a4 002B     		cmp	r3, #0
 222 00a6 F2D1     		bne	.L13
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     }
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  }
 223              		.loc 1 72 0
 224 00a8 C046     		nop
 225 00aa BD46     		mov	sp, r7
 226 00ac 02B0     		add	sp, sp, #8
 227              		@ sp needed
 228 00ae 80BD     		pop	{r7, pc}
 229              		.cfi_endproc
 230              	.LFE3:
 232              		.align	1
 233              		.global	delay_milli
 234              		.syntax unified
 235              		.code	16
 236              		.thumb_func
 237              		.fpu softvfp
 239              	delay_milli:
 240              	.LFB4:
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void delay_milli(unsigned int ms){
 241              		.loc 1 73 0
 242              		.cfi_startproc
 243              		@ args = 0, pretend = 0, frame = 8
 244              		@ frame_needed = 1, uses_anonymous_args = 0
 245 00b0 80B5     		push	{r7, lr}
 246              		.cfi_def_cfa_offset 8
 247              		.cfi_offset 7, -8
 248              		.cfi_offset 14, -4
 249 00b2 82B0     		sub	sp, sp, #8
 250              		.cfi_def_cfa_offset 16
 251 00b4 00AF     		add	r7, sp, #0
 252              		.cfi_def_cfa_register 7
 253 00b6 7860     		str	r0, [r7, #4]
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****    #ifdef SIMULATOR
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** while( ms-- )
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  delay_mikro(1);
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #else
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** while( ms-- )
 254              		.loc 1 79 0
 255 00b8 02E0     		b	.L15
 256              	.L16:
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  delay_mikro(1);// ska vara 1000
 257              		.loc 1 80 0
 258 00ba 0120     		movs	r0, #1
 259 00bc FFF7FEFF 		bl	delay_mikro
 260              	.L15:
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****  delay_mikro(1);// ska vara 1000
 261              		.loc 1 79 0
 262 00c0 7B68     		ldr	r3, [r7, #4]
 263 00c2 5A1E     		subs	r2, r3, #1
 264 00c4 7A60     		str	r2, [r7, #4]
 265 00c6 002B     		cmp	r3, #0
 266 00c8 F7D1     		bne	.L16
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** #endif
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     }
 267              		.loc 1 82 0
 268 00ca C046     		nop
 269 00cc BD46     		mov	sp, r7
 270 00ce 02B0     		add	sp, sp, #8
 271              		@ sp needed
 272 00d0 80BD     		pop	{r7, pc}
 273              		.cfi_endproc
 274              	.LFE4:
 276              		.align	1
 277              		.global	ascii_ctrl_bit_set
 278              		.syntax unified
 279              		.code	16
 280              		.thumb_func
 281              		.fpu softvfp
 283              	ascii_ctrl_bit_set:
 284              	.LFB5:
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_set( unsigned char x )
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** { /* Funktion för att 1-ställa bitar */
 285              		.loc 1 84 0
 286              		.cfi_startproc
 287              		@ args = 0, pretend = 0, frame = 16
 288              		@ frame_needed = 1, uses_anonymous_args = 0
 289 00d2 80B5     		push	{r7, lr}
 290              		.cfi_def_cfa_offset 8
 291              		.cfi_offset 7, -8
 292              		.cfi_offset 14, -4
 293 00d4 84B0     		sub	sp, sp, #16
 294              		.cfi_def_cfa_offset 24
 295 00d6 00AF     		add	r7, sp, #0
 296              		.cfi_def_cfa_register 7
 297 00d8 0200     		movs	r2, r0
 298 00da FB1D     		adds	r3, r7, #7
 299 00dc 1A70     		strb	r2, [r3]
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char c;
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = *GPIOE_ODR_LOW;
 300              		.loc 1 87 0
 301 00de 0D4A     		ldr	r2, .L18
 302 00e0 0F23     		movs	r3, #15
 303 00e2 FB18     		adds	r3, r7, r3
 304 00e4 1278     		ldrb	r2, [r2]
 305 00e6 1A70     		strb	r2, [r3]
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c |= ( B_SELECT | x );
 306              		.loc 1 88 0
 307 00e8 FA1D     		adds	r2, r7, #7
 308 00ea 0F23     		movs	r3, #15
 309 00ec FB18     		adds	r3, r7, r3
 310 00ee 1278     		ldrb	r2, [r2]
 311 00f0 1B78     		ldrb	r3, [r3]
 312 00f2 1343     		orrs	r3, r2
 313 00f4 DAB2     		uxtb	r2, r3
 314 00f6 0F23     		movs	r3, #15
 315 00f8 FB18     		adds	r3, r7, r3
 316 00fa 0421     		movs	r1, #4
 317 00fc 0A43     		orrs	r2, r1
 318 00fe 1A70     		strb	r2, [r3]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *GPIOE_ODR_LOW = c;
 319              		.loc 1 89 0
 320 0100 044A     		ldr	r2, .L18
 321 0102 0F23     		movs	r3, #15
 322 0104 FB18     		adds	r3, r7, r3
 323 0106 1B78     		ldrb	r3, [r3]
 324 0108 1370     		strb	r3, [r2]
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
 325              		.loc 1 90 0
 326 010a C046     		nop
 327 010c BD46     		mov	sp, r7
 328 010e 04B0     		add	sp, sp, #16
 329              		@ sp needed
 330 0110 80BD     		pop	{r7, pc}
 331              	.L19:
 332 0112 C046     		.align	2
 333              	.L18:
 334 0114 14100240 		.word	1073877012
 335              		.cfi_endproc
 336              	.LFE5:
 338              		.align	1
 339              		.global	ascii_ctrl_bit_clear
 340              		.syntax unified
 341              		.code	16
 342              		.thumb_func
 343              		.fpu softvfp
 345              	ascii_ctrl_bit_clear:
 346              	.LFB6:
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_ctrl_bit_clear( unsigned char x )
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 347              		.loc 1 93 0
 348              		.cfi_startproc
 349              		@ args = 0, pretend = 0, frame = 16
 350              		@ frame_needed = 1, uses_anonymous_args = 0
 351 0118 80B5     		push	{r7, lr}
 352              		.cfi_def_cfa_offset 8
 353              		.cfi_offset 7, -8
 354              		.cfi_offset 14, -4
 355 011a 84B0     		sub	sp, sp, #16
 356              		.cfi_def_cfa_offset 24
 357 011c 00AF     		add	r7, sp, #0
 358              		.cfi_def_cfa_register 7
 359 011e 0200     		movs	r2, r0
 360 0120 FB1D     		adds	r3, r7, #7
 361 0122 1A70     		strb	r2, [r3]
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char c;
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = *GPIOE_ODR_LOW;
 362              		.loc 1 95 0
 363 0124 0F4A     		ldr	r2, .L21
 364 0126 0F23     		movs	r3, #15
 365 0128 FB18     		adds	r3, r7, r3
 366 012a 1278     		ldrb	r2, [r2]
 367 012c 1A70     		strb	r2, [r3]
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = B_SELECT | ( c & ~x );
 368              		.loc 1 96 0
 369 012e FB1D     		adds	r3, r7, #7
 370 0130 1B78     		ldrb	r3, [r3]
 371 0132 5BB2     		sxtb	r3, r3
 372 0134 DB43     		mvns	r3, r3
 373 0136 5BB2     		sxtb	r3, r3
 374 0138 0F22     		movs	r2, #15
 375 013a BA18     		adds	r2, r7, r2
 376 013c 1278     		ldrb	r2, [r2]
 377 013e 52B2     		sxtb	r2, r2
 378 0140 1340     		ands	r3, r2
 379 0142 5BB2     		sxtb	r3, r3
 380 0144 0422     		movs	r2, #4
 381 0146 1343     		orrs	r3, r2
 382 0148 5AB2     		sxtb	r2, r3
 383 014a 0F23     		movs	r3, #15
 384 014c FB18     		adds	r3, r7, r3
 385 014e 1A70     		strb	r2, [r3]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *GPIOE_ODR_LOW = c;
 386              		.loc 1 97 0
 387 0150 044A     		ldr	r2, .L21
 388 0152 0F23     		movs	r3, #15
 389 0154 FB18     		adds	r3, r7, r3
 390 0156 1B78     		ldrb	r3, [r3]
 391 0158 1370     		strb	r3, [r2]
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** } 
 392              		.loc 1 98 0
 393 015a C046     		nop
 394 015c BD46     		mov	sp, r7
 395 015e 04B0     		add	sp, sp, #16
 396              		@ sp needed
 397 0160 80BD     		pop	{r7, pc}
 398              	.L22:
 399 0162 C046     		.align	2
 400              	.L21:
 401 0164 14100240 		.word	1073877012
 402              		.cfi_endproc
 403              	.LFE6:
 405              		.align	1
 406              		.global	ascii_write_cmd
 407              		.syntax unified
 408              		.code	16
 409              		.thumb_func
 410              		.fpu softvfp
 412              	ascii_write_cmd:
 413              	.LFB7:
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** 
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_write_cmd(unsigned char c)
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 414              		.loc 1 102 0
 415              		.cfi_startproc
 416              		@ args = 0, pretend = 0, frame = 8
 417              		@ frame_needed = 1, uses_anonymous_args = 0
 418 0168 80B5     		push	{r7, lr}
 419              		.cfi_def_cfa_offset 8
 420              		.cfi_offset 7, -8
 421              		.cfi_offset 14, -4
 422 016a 82B0     		sub	sp, sp, #8
 423              		.cfi_def_cfa_offset 16
 424 016c 00AF     		add	r7, sp, #0
 425              		.cfi_def_cfa_register 7
 426 016e 0200     		movs	r2, r0
 427 0170 FB1D     		adds	r3, r7, #7
 428 0172 1A70     		strb	r2, [r3]
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     ascii_ctrl_bit_clear(B_RS | B_RW);    // "|" = bitvis eller
 429              		.loc 1 103 0
 430 0174 0320     		movs	r0, #3
 431 0176 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c ****     ascii_write_controller(c);
 432              		.loc 1 104 0
 433 017a FB1D     		adds	r3, r7, #7
 434 017c 1B78     		ldrb	r3, [r3]
 435 017e 1800     		movs	r0, r3
 436 0180 FFF7FEFF 		bl	ascii_write_controller
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
 437              		.loc 1 105 0
 438 0184 C046     		nop
 439 0186 BD46     		mov	sp, r7
 440 0188 02B0     		add	sp, sp, #8
 441              		@ sp needed
 442 018a 80BD     		pop	{r7, pc}
 443              		.cfi_endproc
 444              	.LFE7:
 446              		.align	1
 447              		.global	ascii_write_controller
 448              		.syntax unified
 449              		.code	16
 450              		.thumb_func
 451              		.fpu softvfp
 453              	ascii_write_controller:
 454              	.LFB8:
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** void ascii_write_controller( unsigned char c )
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 455              		.loc 1 107 0
 456              		.cfi_startproc
 457              		@ args = 0, pretend = 0, frame = 8
 458              		@ frame_needed = 1, uses_anonymous_args = 0
 459 018c 80B5     		push	{r7, lr}
 460              		.cfi_def_cfa_offset 8
 461              		.cfi_offset 7, -8
 462              		.cfi_offset 14, -4
 463 018e 82B0     		sub	sp, sp, #8
 464              		.cfi_def_cfa_offset 16
 465 0190 00AF     		add	r7, sp, #0
 466              		.cfi_def_cfa_register 7
 467 0192 0200     		movs	r2, r0
 468 0194 FB1D     		adds	r3, r7, #7
 469 0196 1A70     		strb	r2, [r3]
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_set( B_E );
 470              		.loc 1 108 0
 471 0198 4020     		movs	r0, #64
 472 019a FFF7FEFF 		bl	ascii_ctrl_bit_set
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** *GPIOE_ODR_HIGH = c;
 473              		.loc 1 109 0
 474 019e 064A     		ldr	r2, .L25
 475 01a0 FB1D     		adds	r3, r7, #7
 476 01a2 1B78     		ldrb	r3, [r3]
 477 01a4 1370     		strb	r3, [r2]
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** delay_250ns();
 478              		.loc 1 110 0
 479 01a6 FFF7FEFF 		bl	delay_250ns
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_clear( B_E );
 480              		.loc 1 111 0
 481 01aa 4020     		movs	r0, #64
 482 01ac FFF7FEFF 		bl	ascii_ctrl_bit_clear
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** }
 483              		.loc 1 112 0
 484 01b0 C046     		nop
 485 01b2 BD46     		mov	sp, r7
 486 01b4 02B0     		add	sp, sp, #8
 487              		@ sp needed
 488 01b6 80BD     		pop	{r7, pc}
 489              	.L26:
 490              		.align	2
 491              	.L25:
 492 01b8 15100240 		.word	1073877013
 493              		.cfi_endproc
 494              	.LFE8:
 496              		.align	1
 497              		.global	ascii_read_controller
 498              		.syntax unified
 499              		.code	16
 500              		.thumb_func
 501              		.fpu softvfp
 503              	ascii_read_controller:
 504              	.LFB9:
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char ascii_read_controller( void )
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** {
 505              		.loc 1 114 0
 506              		.cfi_startproc
 507              		@ args = 0, pretend = 0, frame = 8
 508              		@ frame_needed = 1, uses_anonymous_args = 0
 509 01bc 80B5     		push	{r7, lr}
 510              		.cfi_def_cfa_offset 8
 511              		.cfi_offset 7, -8
 512              		.cfi_offset 14, -4
 513 01be 82B0     		sub	sp, sp, #8
 514              		.cfi_def_cfa_offset 16
 515 01c0 00AF     		add	r7, sp, #0
 516              		.cfi_def_cfa_register 7
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** unsigned char c;
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_set( B_E );
 517              		.loc 1 116 0
 518 01c2 4020     		movs	r0, #64
 519 01c4 FFF7FEFF 		bl	ascii_ctrl_bit_set
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** delay_250ns(); /* max 360 ns */
 520              		.loc 1 117 0
 521 01c8 FFF7FEFF 		bl	delay_250ns
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** delay_250ns();
 522              		.loc 1 118 0
 523 01cc FFF7FEFF 		bl	delay_250ns
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** c = *GPIOE_IDR_HIGH;
 524              		.loc 1 119 0
 525 01d0 064A     		ldr	r2, .L29
 526 01d2 FB1D     		adds	r3, r7, #7
 527 01d4 1278     		ldrb	r2, [r2]
 528 01d6 1A70     		strb	r2, [r3]
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** ascii_ctrl_bit_clear( B_E );
 529              		.loc 1 120 0
 530 01d8 4020     		movs	r0, #64
 531 01da FFF7FEFF 		bl	ascii_ctrl_bit_clear
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** return c;
 532              		.loc 1 121 0
 533 01de FB1D     		adds	r3, r7, #7
 534 01e0 1B78     		ldrb	r3, [r3]
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/asciidisplay\startup.c **** } ...
 535              		.loc 1 122 0
 536 01e2 1800     		movs	r0, r3
 537 01e4 BD46     		mov	sp, r7
 538 01e6 02B0     		add	sp, sp, #8
 539              		@ sp needed
 540 01e8 80BD     		pop	{r7, pc}
 541              	.L30:
 542 01ea C046     		.align	2
 543              	.L29:
 544 01ec 11100240 		.word	1073877009
 545              		.cfi_endproc
 546              	.LFE9:
 548              	.Letext0:
