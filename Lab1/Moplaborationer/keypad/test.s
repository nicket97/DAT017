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
  25              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define	GPIO_D			0x40020C00
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define	GPIO_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define	GPIO_OTYPER		((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define GPIO_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO behö
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define GPIO_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define GPIO_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste m
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define GPIO_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** #define GPIO_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste m
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** void startup ( void )
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** {
  26              		.loc 1 17 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** __asm volatile(
  31              		.loc 1 18 0
  32              		.syntax divided
  33              	@ 18 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	" MOV SP,R0\n"
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	" BL main\n"				/* call main */
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	"_exit: B .\n"				/* never return */
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	) ;
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** }
  40              		.loc 1 24 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB1:
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** void app_init ( void )
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** {
  57              		.loc 1 27 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	*GPIO_MODER = 0x55005555;
  67              		.loc 1 28 0
  68 0004 084B     		ldr	r3, .L3
  69 0006 094A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	/*sätter våra in och ut portar*/
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	*GPIO_OTYPER = 0x70;
  71              		.loc 1 30 0
  72 000a 094B     		ldr	r3, .L3+8
  73 000c 7022     		movs	r2, #112
  74 000e 1A80     		strh	r2, [r3]
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	*GPIO_PUPDR = 0x0AA;
  75              		.loc 1 31 0
  76 0010 084B     		ldr	r3, .L3+12
  77 0012 AA22     		movs	r2, #170
  78 0014 1A60     		str	r2, [r3]
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	*GPIO_ODR_HIGH = *GPIO_ODR_HIGH & 0x00FF;
  79              		.loc 1 32 0
  80 0016 084B     		ldr	r3, .L3+16
  81 0018 074A     		ldr	r2, .L3+16
  82 001a 1278     		ldrb	r2, [r2]
  83 001c D2B2     		uxtb	r2, r2
  84 001e 1A70     		strb	r2, [r3]
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** }
  85              		.loc 1 33 0
  86 0020 C046     		nop
  87 0022 BD46     		mov	sp, r7
  88              		@ sp needed
  89 0024 80BD     		pop	{r7, pc}
  90              	.L4:
  91 0026 C046     		.align	2
  92              	.L3:
  93 0028 000C0240 		.word	1073875968
  94 002c 55550055 		.word	1426085205
  95 0030 040C0240 		.word	1073875972
  96 0034 0C0C0240 		.word	1073875980
  97 0038 150C0240 		.word	1073875989
  98              		.cfi_endproc
  99              	.LFE1:
 101              		.align	1
 102              		.global	activateRow
 103              		.syntax unified
 104              		.code	16
 105              		.thumb_func
 106              		.fpu softvfp
 108              	activateRow:
 109              	.LFB2:
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** void activateRow ( unsigned int row )
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** {
 110              		.loc 1 36 0
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
 122 0042 7860     		str	r0, [r7, #4]
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	/*ativerar raden för den nedtryckta tangented och man borde deaktivera de andra*/
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	switch ( row )
 123              		.loc 1 38 0
 124 0044 7B68     		ldr	r3, [r7, #4]
 125 0046 042B     		cmp	r3, #4
 126 0048 19D8     		bhi	.L13
 127 004a 7B68     		ldr	r3, [r7, #4]
 128 004c 9A00     		lsls	r2, r3, #2
 129 004e 0E4B     		ldr	r3, .L14
 130 0050 D318     		adds	r3, r2, r3
 131 0052 1B68     		ldr	r3, [r3]
 132 0054 9F46     		mov	pc, r3
 133              		.section	.rodata
 134              		.align	2
 135              	.L8:
 136 0000 76000000 		.word	.L7
 137 0004 56000000 		.word	.L9
 138 0008 5E000000 		.word	.L10
 139 000c 66000000 		.word	.L11
 140 0010 6E000000 		.word	.L12
 141              		.text
 142              	.L9:
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	{
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	case 1: *GPIO_ODR_HIGH = 0x10; break;
 143              		.loc 1 40 0
 144 0056 0D4B     		ldr	r3, .L14+4
 145 0058 1022     		movs	r2, #16
 146 005a 1A70     		strb	r2, [r3]
 147 005c 0FE0     		b	.L6
 148              	.L10:
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	case 2: *GPIO_ODR_HIGH = 0x20; break;
 149              		.loc 1 41 0
 150 005e 0B4B     		ldr	r3, .L14+4
 151 0060 2022     		movs	r2, #32
 152 0062 1A70     		strb	r2, [r3]
 153 0064 0BE0     		b	.L6
 154              	.L11:
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	case 3: *GPIO_ODR_HIGH = 0x40; break;
 155              		.loc 1 42 0
 156 0066 094B     		ldr	r3, .L14+4
 157 0068 4022     		movs	r2, #64
 158 006a 1A70     		strb	r2, [r3]
 159 006c 07E0     		b	.L6
 160              	.L12:
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	case 4: *GPIO_ODR_HIGH = 0x80; break;
 161              		.loc 1 43 0
 162 006e 074B     		ldr	r3, .L14+4
 163 0070 8022     		movs	r2, #128
 164 0072 1A70     		strb	r2, [r3]
 165 0074 03E0     		b	.L6
 166              	.L7:
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	case 0: *GPIO_ODR_HIGH = 0x00; break;
 167              		.loc 1 44 0
 168 0076 054B     		ldr	r3, .L14+4
 169 0078 0022     		movs	r2, #0
 170 007a 1A70     		strb	r2, [r3]
 171 007c C046     		nop
 172              	.L6:
 173              	.L13:
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	}
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** }
 174              		.loc 1 46 0
 175 007e C046     		nop
 176 0080 BD46     		mov	sp, r7
 177 0082 02B0     		add	sp, sp, #8
 178              		@ sp needed
 179 0084 80BD     		pop	{r7, pc}
 180              	.L15:
 181 0086 C046     		.align	2
 182              	.L14:
 183 0088 00000000 		.word	.L8
 184 008c 150C0240 		.word	1073875989
 185              		.cfi_endproc
 186              	.LFE2:
 188              		.section	.rodata
 189              		.align	2
 190              	.LC0:
 191 0014 3F       		.byte	63
 192 0015 06       		.byte	6
 193 0016 5B       		.byte	91
 194 0017 4F       		.byte	79
 195 0018 66       		.byte	102
 196 0019 6D       		.byte	109
 197 001a 7D       		.byte	125
 198 001b 07       		.byte	7
 199 001c 7F       		.byte	127
 200 001d 67       		.byte	103
 201 001e F7       		.byte	-9
 202 001f FF       		.byte	-1
 203 0020 B9       		.byte	-71
 204 0021 BF       		.byte	-65
 205 0022 F9       		.byte	-7
 206 0023 F1       		.byte	-15
 207              		.text
 208              		.align	1
 209              		.global	out7seg
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	out7seg:
 216              	.LFB3:
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** void out7seg( unsigned char c ) /*c skall tolkas som tangentkod*/
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** {
 217              		.loc 1 49 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 24
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 0090 90B5     		push	{r4, r7, lr}
 222              		.cfi_def_cfa_offset 12
 223              		.cfi_offset 4, -12
 224              		.cfi_offset 7, -8
 225              		.cfi_offset 14, -4
 226 0092 87B0     		sub	sp, sp, #28
 227              		.cfi_def_cfa_offset 40
 228 0094 00AF     		add	r7, sp, #0
 229              		.cfi_def_cfa_register 7
 230 0096 0200     		movs	r2, r0
 231 0098 FB1D     		adds	r3, r7, #7
 232 009a 1A70     		strb	r2, [r3]
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	unsigned char segCode[]={0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0xF7, 0xFF, 0
 233              		.loc 1 50 0
 234 009c 0823     		movs	r3, #8
 235 009e FB18     		adds	r3, r7, r3
 236 00a0 0B4A     		ldr	r2, .L20
 237 00a2 13CA     		ldmia	r2!, {r0, r1, r4}
 238 00a4 13C3     		stmia	r3!, {r0, r1, r4}
 239 00a6 1268     		ldr	r2, [r2]
 240 00a8 1A60     		str	r2, [r3]
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	if ( c == 0xFF)
 241              		.loc 1 51 0
 242 00aa FB1D     		adds	r3, r7, #7
 243 00ac 1B78     		ldrb	r3, [r3]
 244 00ae FF2B     		cmp	r3, #255
 245 00b0 03D1     		bne	.L17
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	{
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		*GPIO_ODR_LOW = 0x00; /*sätter värde 0 på 7segmentssaken, släcker alla dioder */
 246              		.loc 1 53 0
 247 00b2 084B     		ldr	r3, .L20+4
 248 00b4 0022     		movs	r2, #0
 249 00b6 1A70     		strb	r2, [r3]
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	} 
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	else
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	{
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		*GPIO_ODR_LOW = segCode[c]; /*sätter vad knapptrycket är på 7segmentsdisplayen.*/
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	}	
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** }
 250              		.loc 1 59 0
 251 00b8 06E0     		b	.L19
 252              	.L17:
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	}	
 253              		.loc 1 57 0
 254 00ba 0649     		ldr	r1, .L20+4
 255 00bc FB1D     		adds	r3, r7, #7
 256 00be 1B78     		ldrb	r3, [r3]
 257 00c0 0822     		movs	r2, #8
 258 00c2 BA18     		adds	r2, r7, r2
 259 00c4 D35C     		ldrb	r3, [r2, r3]
 260 00c6 0B70     		strb	r3, [r1]
 261              	.L19:
 262              		.loc 1 59 0
 263 00c8 C046     		nop
 264 00ca BD46     		mov	sp, r7
 265 00cc 07B0     		add	sp, sp, #28
 266              		@ sp needed
 267 00ce 90BD     		pop	{r4, r7, pc}
 268              	.L21:
 269              		.align	2
 270              	.L20:
 271 00d0 14000000 		.word	.LC0
 272 00d4 140C0240 		.word	1073875988
 273              		.cfi_endproc
 274              	.LFE3:
 276              		.align	1
 277              		.global	getCol
 278              		.syntax unified
 279              		.code	16
 280              		.thumb_func
 281              		.fpu softvfp
 283              	getCol:
 284              	.LFB4:
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** int getCol ( void )
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** {
 285              		.loc 1 64 0
 286              		.cfi_startproc
 287              		@ args = 0, pretend = 0, frame = 8
 288              		@ frame_needed = 1, uses_anonymous_args = 0
 289 00d8 80B5     		push	{r7, lr}
 290              		.cfi_def_cfa_offset 8
 291              		.cfi_offset 7, -8
 292              		.cfi_offset 14, -4
 293 00da 82B0     		sub	sp, sp, #8
 294              		.cfi_def_cfa_offset 16
 295 00dc 00AF     		add	r7, sp, #0
 296              		.cfi_def_cfa_register 7
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	/*om någon tangent i aktiverad rad är nedtryckt så skall dess kolumn nummer returneras. Annars 
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	unsigned char c;
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	c = *GPIO_IDR_HIGH;
 297              		.loc 1 67 0
 298 00de 124A     		ldr	r2, .L28
 299 00e0 FB1D     		adds	r3, r7, #7
 300 00e2 1278     		ldrb	r2, [r2]
 301 00e4 1A70     		strb	r2, [r3]
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	if ( c & 0x8 ) return 4;
 302              		.loc 1 68 0
 303 00e6 FB1D     		adds	r3, r7, #7
 304 00e8 1B78     		ldrb	r3, [r3]
 305 00ea 0822     		movs	r2, #8
 306 00ec 1340     		ands	r3, r2
 307 00ee 01D0     		beq	.L23
 308              		.loc 1 68 0 is_stmt 0 discriminator 1
 309 00f0 0423     		movs	r3, #4
 310 00f2 15E0     		b	.L24
 311              	.L23:
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	if ( c & 0x4 ) return 3;
 312              		.loc 1 69 0 is_stmt 1
 313 00f4 FB1D     		adds	r3, r7, #7
 314 00f6 1B78     		ldrb	r3, [r3]
 315 00f8 0422     		movs	r2, #4
 316 00fa 1340     		ands	r3, r2
 317 00fc 01D0     		beq	.L25
 318              		.loc 1 69 0 is_stmt 0 discriminator 1
 319 00fe 0323     		movs	r3, #3
 320 0100 0EE0     		b	.L24
 321              	.L25:
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	if ( c & 0x2 ) return 2;
 322              		.loc 1 70 0 is_stmt 1
 323 0102 FB1D     		adds	r3, r7, #7
 324 0104 1B78     		ldrb	r3, [r3]
 325 0106 0222     		movs	r2, #2
 326 0108 1340     		ands	r3, r2
 327 010a 01D0     		beq	.L26
 328              		.loc 1 70 0 is_stmt 0 discriminator 1
 329 010c 0223     		movs	r3, #2
 330 010e 07E0     		b	.L24
 331              	.L26:
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	if ( c & 0x1 ) return 1;
 332              		.loc 1 71 0 is_stmt 1
 333 0110 FB1D     		adds	r3, r7, #7
 334 0112 1B78     		ldrb	r3, [r3]
 335 0114 0122     		movs	r2, #1
 336 0116 1340     		ands	r3, r2
 337 0118 01D0     		beq	.L27
 338              		.loc 1 71 0 is_stmt 0 discriminator 1
 339 011a 0123     		movs	r3, #1
 340 011c 00E0     		b	.L24
 341              	.L27:
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	return 0;
 342              		.loc 1 72 0 is_stmt 1
 343 011e 0023     		movs	r3, #0
 344              	.L24:
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** }
 345              		.loc 1 73 0
 346 0120 1800     		movs	r0, r3
 347 0122 BD46     		mov	sp, r7
 348 0124 02B0     		add	sp, sp, #8
 349              		@ sp needed
 350 0126 80BD     		pop	{r7, pc}
 351              	.L29:
 352              		.align	2
 353              	.L28:
 354 0128 110C0240 		.word	1073875985
 355              		.cfi_endproc
 356              	.LFE4:
 358              		.section	.rodata
 359              		.align	2
 360              	.LC1:
 361 0024 01       		.byte	1
 362 0025 02       		.byte	2
 363 0026 03       		.byte	3
 364 0027 0A       		.byte	10
 365 0028 04       		.byte	4
 366 0029 05       		.byte	5
 367 002a 06       		.byte	6
 368 002b 0B       		.byte	11
 369 002c 07       		.byte	7
 370 002d 08       		.byte	8
 371 002e 09       		.byte	9
 372 002f 0C       		.byte	12
 373 0030 0E       		.byte	14
 374 0031 00       		.byte	0
 375 0032 0F       		.byte	15
 376 0033 0D       		.byte	13
 377              		.text
 378              		.align	1
 379              		.global	keyb
 380              		.syntax unified
 381              		.code	16
 382              		.thumb_func
 383              		.fpu softvfp
 385              	keyb:
 386              	.LFB5:
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** unsigned char keyb ( void ) 
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** {
 387              		.loc 1 75 0
 388              		.cfi_startproc
 389              		@ args = 0, pretend = 0, frame = 24
 390              		@ frame_needed = 1, uses_anonymous_args = 0
 391 012c 90B5     		push	{r4, r7, lr}
 392              		.cfi_def_cfa_offset 12
 393              		.cfi_offset 4, -12
 394              		.cfi_offset 7, -8
 395              		.cfi_offset 14, -4
 396 012e 87B0     		sub	sp, sp, #28
 397              		.cfi_def_cfa_offset 40
 398 0130 00AF     		add	r7, sp, #0
 399              		.cfi_def_cfa_register 7
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 400              		.loc 1 76 0
 401 0132 3B00     		movs	r3, r7
 402 0134 164A     		ldr	r2, .L36
 403 0136 13CA     		ldmia	r2!, {r0, r1, r4}
 404 0138 13C3     		stmia	r3!, {r0, r1, r4}
 405 013a 1268     		ldr	r2, [r2]
 406 013c 1A60     		str	r2, [r3]
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	int row, col;
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	for (row=1; row<=4; row++){
 407              		.loc 1 78 0
 408 013e 0123     		movs	r3, #1
 409 0140 7B61     		str	r3, [r7, #20]
 410 0142 19E0     		b	.L31
 411              	.L34:
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		activateRow( row );
 412              		.loc 1 79 0
 413 0144 7B69     		ldr	r3, [r7, #20]
 414 0146 1800     		movs	r0, r3
 415 0148 FFF7FEFF 		bl	activateRow
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		if( ( col = getCol() ) ) /* om col blir tilldelat nol kommer inte ifsatsen att köras*/
 416              		.loc 1 80 0
 417 014c FFF7FEFF 		bl	getCol
 418 0150 0300     		movs	r3, r0
 419 0152 3B61     		str	r3, [r7, #16]
 420 0154 3B69     		ldr	r3, [r7, #16]
 421 0156 002B     		cmp	r3, #0
 422 0158 0BD0     		beq	.L32
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		{
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 			activateRow( 0 ); /*sätter raden til 0 så att den lir nolstäld och att avläsning efter åt i
 423              		.loc 1 82 0
 424 015a 0020     		movs	r0, #0
 425 015c FFF7FEFF 		bl	activateRow
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 			return key[ 4*(row-1)+(col-1) ];
 426              		.loc 1 83 0
 427 0160 7B69     		ldr	r3, [r7, #20]
 428 0162 013B     		subs	r3, r3, #1
 429 0164 9A00     		lsls	r2, r3, #2
 430 0166 3B69     		ldr	r3, [r7, #16]
 431 0168 013B     		subs	r3, r3, #1
 432 016a D318     		adds	r3, r2, r3
 433 016c 3A00     		movs	r2, r7
 434 016e D35C     		ldrb	r3, [r2, r3]
 435 0170 09E0     		b	.L35
 436              	.L32:
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		activateRow( row );
 437              		.loc 1 78 0 discriminator 2
 438 0172 7B69     		ldr	r3, [r7, #20]
 439 0174 0133     		adds	r3, r3, #1
 440 0176 7B61     		str	r3, [r7, #20]
 441              	.L31:
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		activateRow( row );
 442              		.loc 1 78 0 is_stmt 0 discriminator 1
 443 0178 7B69     		ldr	r3, [r7, #20]
 444 017a 042B     		cmp	r3, #4
 445 017c E2DD     		ble	.L34
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		}
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	}
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	activateRow ( 0 );
 446              		.loc 1 86 0 is_stmt 1
 447 017e 0020     		movs	r0, #0
 448 0180 FFF7FEFF 		bl	activateRow
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	return 0xFF;
 449              		.loc 1 87 0
 450 0184 FF23     		movs	r3, #255
 451              	.L35:
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** }
 452              		.loc 1 88 0 discriminator 1
 453 0186 1800     		movs	r0, r3
 454 0188 BD46     		mov	sp, r7
 455 018a 07B0     		add	sp, sp, #28
 456              		@ sp needed
 457 018c 90BD     		pop	{r4, r7, pc}
 458              	.L37:
 459 018e C046     		.align	2
 460              	.L36:
 461 0190 24000000 		.word	.LC1
 462              		.cfi_endproc
 463              	.LFE5:
 465              		.align	1
 466              		.global	main
 467              		.syntax unified
 468              		.code	16
 469              		.thumb_func
 470              		.fpu softvfp
 472              	main:
 473              	.LFB6:
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** void main(void)
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** {
 474              		.loc 1 91 0
 475              		.cfi_startproc
 476              		@ args = 0, pretend = 0, frame = 0
 477              		@ frame_needed = 1, uses_anonymous_args = 0
 478 0194 80B5     		push	{r7, lr}
 479              		.cfi_def_cfa_offset 8
 480              		.cfi_offset 7, -8
 481              		.cfi_offset 14, -4
 482 0196 00AF     		add	r7, sp, #0
 483              		.cfi_def_cfa_register 7
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	app_init();
 484              		.loc 1 92 0
 485 0198 FFF7FEFF 		bl	app_init
 486              	.L39:
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 	while(1){
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/keypad\startup.c **** 		out7seg( keyb() );
 487              		.loc 1 94 0 discriminator 1
 488 019c FFF7FEFF 		bl	keyb
 489 01a0 0300     		movs	r3, r0
 490 01a2 1800     		movs	r0, r3
 491 01a4 FFF7FEFF 		bl	out7seg
 492 01a8 F8E7     		b	.L39
 493              		.cfi_endproc
 494              	.LFE6:
 496              	.Letext0:
