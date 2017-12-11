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
  25              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** /*
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****  * 	startup.c
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****  *
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****  */
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define		STK_CTRL ((volatile unsigned int*) (0xE000E010))
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define		STK_LOAD ((volatile unsigned int*) (0xE000E014))
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define		STK_VAL ((volatile unsigned int*) (0xE000E018))
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define B_E         0x40
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define B_SELECT    4
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define B_RW        2
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define B_RS        1
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define PORT_DISPLAY_BASE       0x40021000  
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** /*Definiera word-adresser för initieringar*/
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portModer   ((volatile unsigned int *) (PORT_DISPLAY_BASE))
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portOtyper  ((volatile unsigned short *)(PORT_DISPLAY_BASE+0x4))
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portOspeedr ((volatile unsigned int *) (PORT_DISPLAY_BASE+0x8))
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portPupdr   ((volatile unsigned int *) (PORT_DISPLAY_BASE+ 0xC ))
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** /*Definiera byte-adresser för data och styrregister*/
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portIdrLow  ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x10))
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portIdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x11))
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portOdrLow  ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x14))
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #define portOdrHigh ((volatile unsigned char *) (PORT_DISPLAY_BASE + 0x15))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void startup ( void )
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
  26              		.loc 1 31 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** __asm volatile(
  31              		.loc 1 32 0
  32              		.syntax divided
  33              	@ 32 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	" MOV SP,R0\n"
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	" BL main\n"				/* call main */
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	"_exit: B .\n"				/* never return */
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	) ;
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
  40              		.loc 1 38 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	delay_250ns
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	delay_250ns:
  56              	.LFB1:
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void delay_250ns(void)
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
  57              		.loc 1 41 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 42 0
  68 0004 0C4B     		ldr	r3, .L4
  69 0006 0022     		movs	r2, #0
  70 0008 1A60     		str	r2, [r3]
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *STK_LOAD = (168/4)-1;   // minst 500 ns
  71              		.loc 1 43 0
  72 000a 0C4B     		ldr	r3, .L4+4
  73 000c 2922     		movs	r2, #41
  74 000e 1A60     		str	r2, [r3]
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *STK_VAL = 0;
  75              		.loc 1 44 0
  76 0010 0B4B     		ldr	r3, .L4+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A60     		str	r2, [r3]
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *STK_CTRL = 5;
  79              		.loc 1 45 0
  80 0016 084B     		ldr	r3, .L4
  81 0018 0522     		movs	r2, #5
  82 001a 1A60     		str	r2, [r3]
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while((* STK_CTRL & 0x10000) == 0) ;
  83              		.loc 1 46 0
  84 001c C046     		nop
  85              	.L3:
  86              		.loc 1 46 0 is_stmt 0 discriminator 1
  87 001e 064B     		ldr	r3, .L4
  88 0020 1A68     		ldr	r2, [r3]
  89 0022 8023     		movs	r3, #128
  90 0024 5B02     		lsls	r3, r3, #9
  91 0026 1340     		ands	r3, r2
  92 0028 F9D0     		beq	.L3
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *STK_CTRL = 0;
  93              		.loc 1 47 0 is_stmt 1
  94 002a 034B     		ldr	r3, .L4
  95 002c 0022     		movs	r2, #0
  96 002e 1A60     		str	r2, [r3]
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
  97              		.loc 1 48 0
  98 0030 C046     		nop
  99 0032 BD46     		mov	sp, r7
 100              		@ sp needed
 101 0034 80BD     		pop	{r7, pc}
 102              	.L5:
 103 0036 C046     		.align	2
 104              	.L4:
 105 0038 10E000E0 		.word	-536813552
 106 003c 14E000E0 		.word	-536813548
 107 0040 18E000E0 		.word	-536813544
 108              		.cfi_endproc
 109              	.LFE1:
 111              		.align	1
 112              		.global	delay_mikro
 113              		.syntax unified
 114              		.code	16
 115              		.thumb_func
 116              		.fpu softvfp
 118              	delay_mikro:
 119              	.LFB2:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void delay_mikro(unsigned int us)
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 120              		.loc 1 52 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 8
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0044 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0046 82B0     		sub	sp, sp, #8
 129              		.cfi_def_cfa_offset 16
 130 0048 00AF     		add	r7, sp, #0
 131              		.cfi_def_cfa_register 7
 132 004a 7860     		str	r0, [r7, #4]
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #ifdef   SIMULATOR
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     us = us / 1000;
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     us++;
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #endif
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while(us < 0){
 133              		.loc 1 57 0
 134 004c C046     		nop
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         {
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             delay_250ns();
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             delay_250ns();
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             delay_250ns();
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             delay_250ns();
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             us--;
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         }
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     }
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 135              		.loc 1 66 0
 136 004e C046     		nop
 137 0050 BD46     		mov	sp, r7
 138 0052 02B0     		add	sp, sp, #8
 139              		@ sp needed
 140 0054 80BD     		pop	{r7, pc}
 141              		.cfi_endproc
 142              	.LFE2:
 144              		.align	1
 145              		.global	delay_milli
 146              		.syntax unified
 147              		.code	16
 148              		.thumb_func
 149              		.fpu softvfp
 151              	delay_milli:
 152              	.LFB3:
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void delay_milli(unsigned ms)
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 153              		.loc 1 69 0
 154              		.cfi_startproc
 155              		@ args = 0, pretend = 0, frame = 8
 156              		@ frame_needed = 1, uses_anonymous_args = 0
 157 0056 80B5     		push	{r7, lr}
 158              		.cfi_def_cfa_offset 8
 159              		.cfi_offset 7, -8
 160              		.cfi_offset 14, -4
 161 0058 82B0     		sub	sp, sp, #8
 162              		.cfi_def_cfa_offset 16
 163 005a 00AF     		add	r7, sp, #0
 164              		.cfi_def_cfa_register 7
 165 005c 7860     		str	r0, [r7, #4]
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #ifdef  SIMULATOR
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ms = ms/1000;
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ms++;
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** #endif
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while(ms > 0){
 166              		.loc 1 74 0
 167 005e 07E0     		b	.L8
 168              	.L9:
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         {
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             delay_mikro(1000);
 169              		.loc 1 76 0
 170 0060 FA23     		movs	r3, #250
 171 0062 9B00     		lsls	r3, r3, #2
 172 0064 1800     		movs	r0, r3
 173 0066 FFF7FEFF 		bl	delay_mikro
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             ms--;
 174              		.loc 1 77 0
 175 006a 7B68     		ldr	r3, [r7, #4]
 176 006c 013B     		subs	r3, r3, #1
 177 006e 7B60     		str	r3, [r7, #4]
 178              	.L8:
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         {
 179              		.loc 1 74 0
 180 0070 7B68     		ldr	r3, [r7, #4]
 181 0072 002B     		cmp	r3, #0
 182 0074 F4D1     		bne	.L9
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****             
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         }
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     }
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 183              		.loc 1 81 0
 184 0076 C046     		nop
 185 0078 BD46     		mov	sp, r7
 186 007a 02B0     		add	sp, sp, #8
 187              		@ sp needed
 188 007c 80BD     		pop	{r7, pc}
 189              		.cfi_endproc
 190              	.LFE3:
 192              		.align	1
 193              		.global	ascii_ctrl_bit_set
 194              		.syntax unified
 195              		.code	16
 196              		.thumb_func
 197              		.fpu softvfp
 199              	ascii_ctrl_bit_set:
 200              	.LFB4:
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_ctrl_bit_set( unsigned char x )
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 201              		.loc 1 84 0
 202              		.cfi_startproc
 203              		@ args = 0, pretend = 0, frame = 16
 204              		@ frame_needed = 1, uses_anonymous_args = 0
 205 007e 80B5     		push	{r7, lr}
 206              		.cfi_def_cfa_offset 8
 207              		.cfi_offset 7, -8
 208              		.cfi_offset 14, -4
 209 0080 84B0     		sub	sp, sp, #16
 210              		.cfi_def_cfa_offset 24
 211 0082 00AF     		add	r7, sp, #0
 212              		.cfi_def_cfa_register 7
 213 0084 0200     		movs	r2, r0
 214 0086 FB1D     		adds	r3, r7, #7
 215 0088 1A70     		strb	r2, [r3]
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     unsigned char c;
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     c = *portOdrLow;
 216              		.loc 1 86 0
 217 008a 0D4A     		ldr	r2, .L11
 218 008c 0F23     		movs	r3, #15
 219 008e FB18     		adds	r3, r7, r3
 220 0090 1278     		ldrb	r2, [r2]
 221 0092 1A70     		strb	r2, [r3]
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     c |=  (B_SELECT | x);
 222              		.loc 1 87 0
 223 0094 FA1D     		adds	r2, r7, #7
 224 0096 0F23     		movs	r3, #15
 225 0098 FB18     		adds	r3, r7, r3
 226 009a 1278     		ldrb	r2, [r2]
 227 009c 1B78     		ldrb	r3, [r3]
 228 009e 1343     		orrs	r3, r2
 229 00a0 DAB2     		uxtb	r2, r3
 230 00a2 0F23     		movs	r3, #15
 231 00a4 FB18     		adds	r3, r7, r3
 232 00a6 0421     		movs	r1, #4
 233 00a8 0A43     		orrs	r2, r1
 234 00aa 1A70     		strb	r2, [r3]
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portOdrLow = c;
 235              		.loc 1 88 0
 236 00ac 044A     		ldr	r2, .L11
 237 00ae 0F23     		movs	r3, #15
 238 00b0 FB18     		adds	r3, r7, r3
 239 00b2 1B78     		ldrb	r3, [r3]
 240 00b4 1370     		strb	r3, [r2]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 241              		.loc 1 89 0
 242 00b6 C046     		nop
 243 00b8 BD46     		mov	sp, r7
 244 00ba 04B0     		add	sp, sp, #16
 245              		@ sp needed
 246 00bc 80BD     		pop	{r7, pc}
 247              	.L12:
 248 00be C046     		.align	2
 249              	.L11:
 250 00c0 14100240 		.word	1073877012
 251              		.cfi_endproc
 252              	.LFE4:
 254              		.align	1
 255              		.global	ascii_ctrl_bit_clear
 256              		.syntax unified
 257              		.code	16
 258              		.thumb_func
 259              		.fpu softvfp
 261              	ascii_ctrl_bit_clear:
 262              	.LFB5:
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_ctrl_bit_clear(unsigned char x)
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 263              		.loc 1 92 0
 264              		.cfi_startproc
 265              		@ args = 0, pretend = 0, frame = 16
 266              		@ frame_needed = 1, uses_anonymous_args = 0
 267 00c4 80B5     		push	{r7, lr}
 268              		.cfi_def_cfa_offset 8
 269              		.cfi_offset 7, -8
 270              		.cfi_offset 14, -4
 271 00c6 84B0     		sub	sp, sp, #16
 272              		.cfi_def_cfa_offset 24
 273 00c8 00AF     		add	r7, sp, #0
 274              		.cfi_def_cfa_register 7
 275 00ca 0200     		movs	r2, r0
 276 00cc FB1D     		adds	r3, r7, #7
 277 00ce 1A70     		strb	r2, [r3]
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     unsigned char  c;
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     c = *portOdrLow;
 278              		.loc 1 94 0
 279 00d0 0F4A     		ldr	r2, .L14
 280 00d2 0F23     		movs	r3, #15
 281 00d4 FB18     		adds	r3, r7, r3
 282 00d6 1278     		ldrb	r2, [r2]
 283 00d8 1A70     		strb	r2, [r3]
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     c &= (B_SELECT | ~x);
 284              		.loc 1 95 0
 285 00da FB1D     		adds	r3, r7, #7
 286 00dc 1B78     		ldrb	r3, [r3]
 287 00de 5BB2     		sxtb	r3, r3
 288 00e0 DB43     		mvns	r3, r3
 289 00e2 5BB2     		sxtb	r3, r3
 290 00e4 0422     		movs	r2, #4
 291 00e6 1343     		orrs	r3, r2
 292 00e8 5BB2     		sxtb	r3, r3
 293 00ea 0F22     		movs	r2, #15
 294 00ec BA18     		adds	r2, r7, r2
 295 00ee 1278     		ldrb	r2, [r2]
 296 00f0 52B2     		sxtb	r2, r2
 297 00f2 1340     		ands	r3, r2
 298 00f4 5AB2     		sxtb	r2, r3
 299 00f6 0F23     		movs	r3, #15
 300 00f8 FB18     		adds	r3, r7, r3
 301 00fa 1A70     		strb	r2, [r3]
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portOdrLow = c;
 302              		.loc 1 96 0
 303 00fc 044A     		ldr	r2, .L14
 304 00fe 0F23     		movs	r3, #15
 305 0100 FB18     		adds	r3, r7, r3
 306 0102 1B78     		ldrb	r3, [r3]
 307 0104 1370     		strb	r3, [r2]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 308              		.loc 1 97 0
 309 0106 C046     		nop
 310 0108 BD46     		mov	sp, r7
 311 010a 04B0     		add	sp, sp, #16
 312              		@ sp needed
 313 010c 80BD     		pop	{r7, pc}
 314              	.L15:
 315 010e C046     		.align	2
 316              	.L14:
 317 0110 14100240 		.word	1073877012
 318              		.cfi_endproc
 319              	.LFE5:
 321              		.align	1
 322              		.global	ascii_write_controller
 323              		.syntax unified
 324              		.code	16
 325              		.thumb_func
 326              		.fpu softvfp
 328              	ascii_write_controller:
 329              	.LFB6:
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_write_controller( unsigned char c)
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 330              		.loc 1 100 0
 331              		.cfi_startproc
 332              		@ args = 0, pretend = 0, frame = 8
 333              		@ frame_needed = 1, uses_anonymous_args = 0
 334 0114 80B5     		push	{r7, lr}
 335              		.cfi_def_cfa_offset 8
 336              		.cfi_offset 7, -8
 337              		.cfi_offset 14, -4
 338 0116 82B0     		sub	sp, sp, #8
 339              		.cfi_def_cfa_offset 16
 340 0118 00AF     		add	r7, sp, #0
 341              		.cfi_def_cfa_register 7
 342 011a 0200     		movs	r2, r0
 343 011c FB1D     		adds	r3, r7, #7
 344 011e 1A70     		strb	r2, [r3]
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_set(B_E);      // E = 1
 345              		.loc 1 101 0
 346 0120 4020     		movs	r0, #64
 347 0122 FFF7FEFF 		bl	ascii_ctrl_bit_set
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portOdrHigh = c;
 348              		.loc 1 102 0
 349 0126 064A     		ldr	r2, .L17
 350 0128 FB1D     		adds	r3, r7, #7
 351 012a 1B78     		ldrb	r3, [r3]
 352 012c 1370     		strb	r3, [r2]
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_clear(B_E);    // E = 0
 353              		.loc 1 103 0
 354 012e 4020     		movs	r0, #64
 355 0130 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_250ns();
 356              		.loc 1 104 0
 357 0134 FFF7FEFF 		bl	delay_250ns
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 358              		.loc 1 105 0
 359 0138 C046     		nop
 360 013a BD46     		mov	sp, r7
 361 013c 02B0     		add	sp, sp, #8
 362              		@ sp needed
 363 013e 80BD     		pop	{r7, pc}
 364              	.L18:
 365              		.align	2
 366              	.L17:
 367 0140 15100240 		.word	1073877013
 368              		.cfi_endproc
 369              	.LFE6:
 371              		.align	1
 372              		.global	ascii_write_cmd
 373              		.syntax unified
 374              		.code	16
 375              		.thumb_func
 376              		.fpu softvfp
 378              	ascii_write_cmd:
 379              	.LFB7:
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_write_cmd(unsigned char c)
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 380              		.loc 1 108 0
 381              		.cfi_startproc
 382              		@ args = 0, pretend = 0, frame = 8
 383              		@ frame_needed = 1, uses_anonymous_args = 0
 384 0144 80B5     		push	{r7, lr}
 385              		.cfi_def_cfa_offset 8
 386              		.cfi_offset 7, -8
 387              		.cfi_offset 14, -4
 388 0146 82B0     		sub	sp, sp, #8
 389              		.cfi_def_cfa_offset 16
 390 0148 00AF     		add	r7, sp, #0
 391              		.cfi_def_cfa_register 7
 392 014a 0200     		movs	r2, r0
 393 014c FB1D     		adds	r3, r7, #7
 394 014e 1A70     		strb	r2, [r3]
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_clear(B_RS | B_RW);    // "|" = bitvis eller
 395              		.loc 1 109 0
 396 0150 0320     		movs	r0, #3
 397 0152 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_controller(c);
 398              		.loc 1 110 0
 399 0156 FB1D     		adds	r3, r7, #7
 400 0158 1B78     		ldrb	r3, [r3]
 401 015a 1800     		movs	r0, r3
 402 015c FFF7FEFF 		bl	ascii_write_controller
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 403              		.loc 1 111 0
 404 0160 C046     		nop
 405 0162 BD46     		mov	sp, r7
 406 0164 02B0     		add	sp, sp, #8
 407              		@ sp needed
 408 0166 80BD     		pop	{r7, pc}
 409              		.cfi_endproc
 410              	.LFE7:
 412              		.align	1
 413              		.global	ascii_write_data
 414              		.syntax unified
 415              		.code	16
 416              		.thumb_func
 417              		.fpu softvfp
 419              	ascii_write_data:
 420              	.LFB8:
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_write_data(unsigned char c)
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 421              		.loc 1 115 0
 422              		.cfi_startproc
 423              		@ args = 0, pretend = 0, frame = 8
 424              		@ frame_needed = 1, uses_anonymous_args = 0
 425 0168 80B5     		push	{r7, lr}
 426              		.cfi_def_cfa_offset 8
 427              		.cfi_offset 7, -8
 428              		.cfi_offset 14, -4
 429 016a 82B0     		sub	sp, sp, #8
 430              		.cfi_def_cfa_offset 16
 431 016c 00AF     		add	r7, sp, #0
 432              		.cfi_def_cfa_register 7
 433 016e 0200     		movs	r2, r0
 434 0170 FB1D     		adds	r3, r7, #7
 435 0172 1A70     		strb	r2, [r3]
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_clear(B_RW);
 436              		.loc 1 116 0
 437 0174 0220     		movs	r0, #2
 438 0176 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_set(B_RS);
 439              		.loc 1 117 0
 440 017a 0120     		movs	r0, #1
 441 017c FFF7FEFF 		bl	ascii_ctrl_bit_set
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_controller(c);
 442              		.loc 1 118 0
 443 0180 FB1D     		adds	r3, r7, #7
 444 0182 1B78     		ldrb	r3, [r3]
 445 0184 1800     		movs	r0, r3
 446 0186 FFF7FEFF 		bl	ascii_write_controller
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 447              		.loc 1 119 0
 448 018a C046     		nop
 449 018c BD46     		mov	sp, r7
 450 018e 02B0     		add	sp, sp, #8
 451              		@ sp needed
 452 0190 80BD     		pop	{r7, pc}
 453              		.cfi_endproc
 454              	.LFE8:
 456              		.align	1
 457              		.global	ascii_read_controller
 458              		.syntax unified
 459              		.code	16
 460              		.thumb_func
 461              		.fpu softvfp
 463              	ascii_read_controller:
 464              	.LFB9:
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** unsigned char ascii_read_controller(void)
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 465              		.loc 1 122 0
 466              		.cfi_startproc
 467              		@ args = 0, pretend = 0, frame = 8
 468              		@ frame_needed = 1, uses_anonymous_args = 0
 469 0192 80B5     		push	{r7, lr}
 470              		.cfi_def_cfa_offset 8
 471              		.cfi_offset 7, -8
 472              		.cfi_offset 14, -4
 473 0194 82B0     		sub	sp, sp, #8
 474              		.cfi_def_cfa_offset 16
 475 0196 00AF     		add	r7, sp, #0
 476              		.cfi_def_cfa_register 7
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     unsigned char c;
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_set(B_E);
 477              		.loc 1 124 0
 478 0198 4020     		movs	r0, #64
 479 019a FFF7FEFF 		bl	ascii_ctrl_bit_set
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_250ns();
 480              		.loc 1 125 0
 481 019e FFF7FEFF 		bl	delay_250ns
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_250ns();
 482              		.loc 1 126 0
 483 01a2 FFF7FEFF 		bl	delay_250ns
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     c = *portIdrHigh;
 484              		.loc 1 127 0
 485 01a6 064A     		ldr	r2, .L23
 486 01a8 FB1D     		adds	r3, r7, #7
 487 01aa 1278     		ldrb	r2, [r2]
 488 01ac 1A70     		strb	r2, [r3]
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_clear(B_E);
 489              		.loc 1 128 0
 490 01ae 4020     		movs	r0, #64
 491 01b0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     return c;
 492              		.loc 1 129 0
 493 01b4 FB1D     		adds	r3, r7, #7
 494 01b6 1B78     		ldrb	r3, [r3]
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 495              		.loc 1 130 0
 496 01b8 1800     		movs	r0, r3
 497 01ba BD46     		mov	sp, r7
 498 01bc 02B0     		add	sp, sp, #8
 499              		@ sp needed
 500 01be 80BD     		pop	{r7, pc}
 501              	.L24:
 502              		.align	2
 503              	.L23:
 504 01c0 11100240 		.word	1073877009
 505              		.cfi_endproc
 506              	.LFE9:
 508              		.align	1
 509              		.global	ascii_read_status
 510              		.syntax unified
 511              		.code	16
 512              		.thumb_func
 513              		.fpu softvfp
 515              	ascii_read_status:
 516              	.LFB10:
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** unsigned char ascii_read_status(void)
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 517              		.loc 1 133 0
 518              		.cfi_startproc
 519              		@ args = 0, pretend = 0, frame = 8
 520              		@ frame_needed = 1, uses_anonymous_args = 0
 521 01c4 90B5     		push	{r4, r7, lr}
 522              		.cfi_def_cfa_offset 12
 523              		.cfi_offset 4, -12
 524              		.cfi_offset 7, -8
 525              		.cfi_offset 14, -4
 526 01c6 83B0     		sub	sp, sp, #12
 527              		.cfi_def_cfa_offset 24
 528 01c8 00AF     		add	r7, sp, #0
 529              		.cfi_def_cfa_register 7
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     unsigned char c;
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portModer = 0x00005555;
 530              		.loc 1 135 0
 531 01ca 0B4B     		ldr	r3, .L27
 532 01cc 0B4A     		ldr	r2, .L27+4
 533 01ce 1A60     		str	r2, [r3]
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_set(B_RW);
 534              		.loc 1 136 0
 535 01d0 0220     		movs	r0, #2
 536 01d2 FFF7FEFF 		bl	ascii_ctrl_bit_set
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_ctrl_bit_clear(B_RS);
 537              		.loc 1 137 0
 538 01d6 0120     		movs	r0, #1
 539 01d8 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     c = ascii_read_controller();
 540              		.loc 1 138 0
 541 01dc FC1D     		adds	r4, r7, #7
 542 01de FFF7FEFF 		bl	ascii_read_controller
 543 01e2 0300     		movs	r3, r0
 544 01e4 2370     		strb	r3, [r4]
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portModer = 0x55555555;
 545              		.loc 1 139 0
 546 01e6 044B     		ldr	r3, .L27
 547 01e8 054A     		ldr	r2, .L27+8
 548 01ea 1A60     		str	r2, [r3]
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     return c;
 549              		.loc 1 140 0
 550 01ec FB1D     		adds	r3, r7, #7
 551 01ee 1B78     		ldrb	r3, [r3]
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 552              		.loc 1 141 0
 553 01f0 1800     		movs	r0, r3
 554 01f2 BD46     		mov	sp, r7
 555 01f4 03B0     		add	sp, sp, #12
 556              		@ sp needed
 557 01f6 90BD     		pop	{r4, r7, pc}
 558              	.L28:
 559              		.align	2
 560              	.L27:
 561 01f8 00100240 		.word	1073876992
 562 01fc 55550000 		.word	21845
 563 0200 55555555 		.word	1431655765
 564              		.cfi_endproc
 565              	.LFE10:
 567              		.align	1
 568              		.global	ascii_read_data
 569              		.syntax unified
 570              		.code	16
 571              		.thumb_func
 572              		.fpu softvfp
 574              	ascii_read_data:
 575              	.LFB11:
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** unsigned char ascii_read_data ( void ) 
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 576              		.loc 1 143 0
 577              		.cfi_startproc
 578              		@ args = 0, pretend = 0, frame = 8
 579              		@ frame_needed = 1, uses_anonymous_args = 0
 580 0204 90B5     		push	{r4, r7, lr}
 581              		.cfi_def_cfa_offset 12
 582              		.cfi_offset 4, -12
 583              		.cfi_offset 7, -8
 584              		.cfi_offset 14, -4
 585 0206 83B0     		sub	sp, sp, #12
 586              		.cfi_def_cfa_offset 24
 587 0208 00AF     		add	r7, sp, #0
 588              		.cfi_def_cfa_register 7
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	unsigned char c;
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	*portModer = 0x00005555;
 589              		.loc 1 145 0
 590 020a 0B4B     		ldr	r3, .L31
 591 020c 0B4A     		ldr	r2, .L31+4
 592 020e 1A60     		str	r2, [r3]
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 593              		.loc 1 146 0
 594 0210 0220     		movs	r0, #2
 595 0212 FFF7FEFF 		bl	ascii_ctrl_bit_set
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 596              		.loc 1 147 0
 597 0216 0120     		movs	r0, #1
 598 0218 FFF7FEFF 		bl	ascii_ctrl_bit_set
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	c = ascii_read_controller();
 599              		.loc 1 148 0
 600 021c FC1D     		adds	r4, r7, #7
 601 021e FFF7FEFF 		bl	ascii_read_controller
 602 0222 0300     		movs	r3, r0
 603 0224 2370     		strb	r3, [r4]
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	*portModer = 0x55555555; /*sätt portE bit15-bit8 som utgångar*/
 604              		.loc 1 149 0
 605 0226 044B     		ldr	r3, .L31
 606 0228 054A     		ldr	r2, .L31+8
 607 022a 1A60     		str	r2, [r3]
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 	return c;
 608              		.loc 1 150 0
 609 022c FB1D     		adds	r3, r7, #7
 610 022e 1B78     		ldrb	r3, [r3]
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 611              		.loc 1 151 0
 612 0230 1800     		movs	r0, r3
 613 0232 BD46     		mov	sp, r7
 614 0234 03B0     		add	sp, sp, #12
 615              		@ sp needed
 616 0236 90BD     		pop	{r4, r7, pc}
 617              	.L32:
 618              		.align	2
 619              	.L31:
 620 0238 00100240 		.word	1073876992
 621 023c 55550000 		.word	21845
 622 0240 55555555 		.word	1431655765
 623              		.cfi_endproc
 624              	.LFE11:
 626              		.align	1
 627              		.global	ascii_wait_ready
 628              		.syntax unified
 629              		.code	16
 630              		.thumb_func
 631              		.fpu softvfp
 633              	ascii_wait_ready:
 634              	.LFB12:
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_wait_ready( void )
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 635              		.loc 1 154 0
 636              		.cfi_startproc
 637              		@ args = 0, pretend = 0, frame = 0
 638              		@ frame_needed = 1, uses_anonymous_args = 0
 639 0244 80B5     		push	{r7, lr}
 640              		.cfi_def_cfa_offset 8
 641              		.cfi_offset 7, -8
 642              		.cfi_offset 14, -4
 643 0246 00AF     		add	r7, sp, #0
 644              		.cfi_def_cfa_register 7
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while( ( ascii_read_status() & 0x80) == 0x80) ;
 645              		.loc 1 155 0
 646 0248 C046     		nop
 647              	.L34:
 648              		.loc 1 155 0 is_stmt 0 discriminator 1
 649 024a FFF7FEFF 		bl	ascii_read_status
 650 024e 0300     		movs	r3, r0
 651 0250 1A00     		movs	r2, r3
 652 0252 8023     		movs	r3, #128
 653 0254 1340     		ands	r3, r2
 654 0256 802B     		cmp	r3, #128
 655 0258 F7D0     		beq	.L34
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_mikro(8);
 656              		.loc 1 156 0 is_stmt 1
 657 025a 0820     		movs	r0, #8
 658 025c FFF7FEFF 		bl	delay_mikro
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 659              		.loc 1 157 0
 660 0260 C046     		nop
 661 0262 BD46     		mov	sp, r7
 662              		@ sp needed
 663 0264 80BD     		pop	{r7, pc}
 664              		.cfi_endproc
 665              	.LFE12:
 667              		.align	1
 668              		.global	ascii_write_char
 669              		.syntax unified
 670              		.code	16
 671              		.thumb_func
 672              		.fpu softvfp
 674              	ascii_write_char:
 675              	.LFB13:
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_write_char(unsigned char c)
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 676              		.loc 1 160 0
 677              		.cfi_startproc
 678              		@ args = 0, pretend = 0, frame = 8
 679              		@ frame_needed = 1, uses_anonymous_args = 0
 680 0266 80B5     		push	{r7, lr}
 681              		.cfi_def_cfa_offset 8
 682              		.cfi_offset 7, -8
 683              		.cfi_offset 14, -4
 684 0268 82B0     		sub	sp, sp, #8
 685              		.cfi_def_cfa_offset 16
 686 026a 00AF     		add	r7, sp, #0
 687              		.cfi_def_cfa_register 7
 688 026c 0200     		movs	r2, r0
 689 026e FB1D     		adds	r3, r7, #7
 690 0270 1A70     		strb	r2, [r3]
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_wait_ready();
 691              		.loc 1 161 0
 692 0272 FFF7FEFF 		bl	ascii_wait_ready
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_data(c);
 693              		.loc 1 162 0
 694 0276 FB1D     		adds	r3, r7, #7
 695 0278 1B78     		ldrb	r3, [r3]
 696 027a 1800     		movs	r0, r3
 697 027c FFF7FEFF 		bl	ascii_write_data
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_mikro(39);
 698              		.loc 1 163 0
 699 0280 2720     		movs	r0, #39
 700 0282 FFF7FEFF 		bl	delay_mikro
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 701              		.loc 1 165 0
 702 0286 C046     		nop
 703 0288 BD46     		mov	sp, r7
 704 028a 02B0     		add	sp, sp, #8
 705              		@ sp needed
 706 028c 80BD     		pop	{r7, pc}
 707              		.cfi_endproc
 708              	.LFE13:
 710              		.align	1
 711              		.global	ascii_init
 712              		.syntax unified
 713              		.code	16
 714              		.thumb_func
 715              		.fpu softvfp
 717              	ascii_init:
 718              	.LFB14:
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_init(void)
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 719              		.loc 1 168 0
 720              		.cfi_startproc
 721              		@ args = 0, pretend = 0, frame = 0
 722              		@ frame_needed = 1, uses_anonymous_args = 0
 723 028e 80B5     		push	{r7, lr}
 724              		.cfi_def_cfa_offset 8
 725              		.cfi_offset 7, -8
 726              		.cfi_offset 14, -4
 727 0290 00AF     		add	r7, sp, #0
 728              		.cfi_def_cfa_register 7
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_wait_ready();
 729              		.loc 1 169 0
 730 0292 FFF7FEFF 		bl	ascii_wait_ready
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_cmd( 0x0C);    /*display on*/
 731              		.loc 1 170 0
 732 0296 0C20     		movs	r0, #12
 733 0298 FFF7FEFF 		bl	ascii_write_cmd
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_mikro(39);
 734              		.loc 1 171 0
 735 029c 2720     		movs	r0, #39
 736 029e FFF7FEFF 		bl	delay_mikro
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_wait_ready();
 737              		.loc 1 172 0
 738 02a2 FFF7FEFF 		bl	ascii_wait_ready
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_cmd( 0x38);    /*function set*/
 739              		.loc 1 173 0
 740 02a6 3820     		movs	r0, #56
 741 02a8 FFF7FEFF 		bl	ascii_write_cmd
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_mikro(39);
 742              		.loc 1 174 0
 743 02ac 2720     		movs	r0, #39
 744 02ae FFF7FEFF 		bl	delay_mikro
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_wait_ready();
 745              		.loc 1 175 0
 746 02b2 FFF7FEFF 		bl	ascii_wait_ready
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_cmd( 1 );    /*clear display*/
 747              		.loc 1 176 0
 748 02b6 0120     		movs	r0, #1
 749 02b8 FFF7FEFF 		bl	ascii_write_cmd
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_milli(2);
 750              		.loc 1 177 0
 751 02bc 0220     		movs	r0, #2
 752 02be FFF7FEFF 		bl	delay_milli
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_wait_ready();
 753              		.loc 1 178 0
 754 02c2 FFF7FEFF 		bl	ascii_wait_ready
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_cmd( 6 );    /*entry mode set*/
 755              		.loc 1 179 0
 756 02c6 0620     		movs	r0, #6
 757 02c8 FFF7FEFF 		bl	ascii_write_cmd
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     delay_mikro(39);
 758              		.loc 1 180 0
 759 02cc 2720     		movs	r0, #39
 760 02ce FFF7FEFF 		bl	delay_mikro
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 761              		.loc 1 181 0
 762 02d2 C046     		nop
 763 02d4 BD46     		mov	sp, r7
 764              		@ sp needed
 765 02d6 80BD     		pop	{r7, pc}
 766              		.cfi_endproc
 767              	.LFE14:
 769              		.align	1
 770              		.global	ascii_gotoxy
 771              		.syntax unified
 772              		.code	16
 773              		.thumb_func
 774              		.fpu softvfp
 776              	ascii_gotoxy:
 777              	.LFB15:
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void ascii_gotoxy( unsigned char x, unsigned char y)
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 778              		.loc 1 184 0
 779              		.cfi_startproc
 780              		@ args = 0, pretend = 0, frame = 16
 781              		@ frame_needed = 1, uses_anonymous_args = 0
 782 02d8 80B5     		push	{r7, lr}
 783              		.cfi_def_cfa_offset 8
 784              		.cfi_offset 7, -8
 785              		.cfi_offset 14, -4
 786 02da 84B0     		sub	sp, sp, #16
 787              		.cfi_def_cfa_offset 24
 788 02dc 00AF     		add	r7, sp, #0
 789              		.cfi_def_cfa_register 7
 790 02de 0200     		movs	r2, r0
 791 02e0 FB1D     		adds	r3, r7, #7
 792 02e2 1A70     		strb	r2, [r3]
 793 02e4 BB1D     		adds	r3, r7, #6
 794 02e6 0A1C     		adds	r2, r1, #0
 795 02e8 1A70     		strb	r2, [r3]
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_wait_ready();
 796              		.loc 1 185 0
 797 02ea FFF7FEFF 		bl	ascii_wait_ready
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     unsigned char address;
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     if(y != 1){
 798              		.loc 1 187 0
 799 02ee BB1D     		adds	r3, r7, #6
 800 02f0 1B78     		ldrb	r3, [r3]
 801 02f2 012B     		cmp	r3, #1
 802 02f4 0BD0     		beq	.L38
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         address = 0x40 | (x-1);
 803              		.loc 1 188 0
 804 02f6 FB1D     		adds	r3, r7, #7
 805 02f8 1B78     		ldrb	r3, [r3]
 806 02fa 013B     		subs	r3, r3, #1
 807 02fc DBB2     		uxtb	r3, r3
 808 02fe 5BB2     		sxtb	r3, r3
 809 0300 4022     		movs	r2, #64
 810 0302 1343     		orrs	r3, r2
 811 0304 5AB2     		sxtb	r2, r3
 812 0306 0F23     		movs	r3, #15
 813 0308 FB18     		adds	r3, r7, r3
 814 030a 1A70     		strb	r2, [r3]
 815 030c 05E0     		b	.L39
 816              	.L38:
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     }
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     else{
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         address = x-1;
 817              		.loc 1 191 0
 818 030e 0F23     		movs	r3, #15
 819 0310 FB18     		adds	r3, r7, r3
 820 0312 FA1D     		adds	r2, r7, #7
 821 0314 1278     		ldrb	r2, [r2]
 822 0316 013A     		subs	r2, r2, #1
 823 0318 1A70     		strb	r2, [r3]
 824              	.L39:
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     }
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_write_cmd ( 0x80 | address);
 825              		.loc 1 194 0
 826 031a 0F23     		movs	r3, #15
 827 031c FB18     		adds	r3, r7, r3
 828 031e 1B78     		ldrb	r3, [r3]
 829 0320 8022     		movs	r2, #128
 830 0322 5242     		rsbs	r2, r2, #0
 831 0324 1343     		orrs	r3, r2
 832 0326 DBB2     		uxtb	r3, r3
 833 0328 1800     		movs	r0, r3
 834 032a FFF7FEFF 		bl	ascii_write_cmd
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 835              		.loc 1 195 0
 836 032e C046     		nop
 837 0330 BD46     		mov	sp, r7
 838 0332 04B0     		add	sp, sp, #16
 839              		@ sp needed
 840 0334 80BD     		pop	{r7, pc}
 841              		.cfi_endproc
 842              	.LFE15:
 844              		.align	1
 845              		.global	init_app
 846              		.syntax unified
 847              		.code	16
 848              		.thumb_func
 849              		.fpu softvfp
 851              	init_app:
 852              	.LFB16:
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** void init_app( void )
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 853              		.loc 1 198 0
 854              		.cfi_startproc
 855              		@ args = 0, pretend = 0, frame = 0
 856              		@ frame_needed = 1, uses_anonymous_args = 0
 857 0336 80B5     		push	{r7, lr}
 858              		.cfi_def_cfa_offset 8
 859              		.cfi_offset 7, -8
 860              		.cfi_offset 14, -4
 861 0338 00AF     		add	r7, sp, #0
 862              		.cfi_def_cfa_register 7
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portModer      = 0x00005555;
 863              		.loc 1 199 0
 864 033a 074B     		ldr	r3, .L41
 865 033c 074A     		ldr	r2, .L41+4
 866 033e 1A60     		str	r2, [r3]
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portOtyper     = 0x00000000;
 867              		.loc 1 200 0
 868 0340 074B     		ldr	r3, .L41+8
 869 0342 0022     		movs	r2, #0
 870 0344 1A80     		strh	r2, [r3]
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portOspeedr    = 0x00005555;
 871              		.loc 1 201 0
 872 0346 074B     		ldr	r3, .L41+12
 873 0348 044A     		ldr	r2, .L41+4
 874 034a 1A60     		str	r2, [r3]
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     *portPupdr      = 0x55550000;
 875              		.loc 1 202 0
 876 034c 064B     		ldr	r3, .L41+16
 877 034e 074A     		ldr	r2, .L41+20
 878 0350 1A60     		str	r2, [r3]
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 879              		.loc 1 203 0
 880 0352 C046     		nop
 881 0354 BD46     		mov	sp, r7
 882              		@ sp needed
 883 0356 80BD     		pop	{r7, pc}
 884              	.L42:
 885              		.align	2
 886              	.L41:
 887 0358 00100240 		.word	1073876992
 888 035c 55550000 		.word	21845
 889 0360 04100240 		.word	1073876996
 890 0364 08100240 		.word	1073877000
 891 0368 0C100240 		.word	1073877004
 892 036c 00005555 		.word	1431633920
 893              		.cfi_endproc
 894              	.LFE16:
 896              		.section	.rodata
 897              		.align	2
 898              	.LC0:
 899 0000 416C6661 		.ascii	"Alfanumerisk\000"
 899      6E756D65 
 899      7269736B 
 899      00
 900 000d 000000   		.align	2
 901              	.LC2:
 902 0010 44697370 		.ascii	"Display - test\000"
 902      6C617920 
 902      2D207465 
 902      737400
 903              		.text
 904              		.align	1
 905              		.global	main
 906              		.syntax unified
 907              		.code	16
 908              		.thumb_func
 909              		.fpu softvfp
 911              	main:
 912              	.LFB17:
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** 
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** int main(int argc, char **argv)
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** {
 913              		.loc 1 207 0
 914              		.cfi_startproc
 915              		@ args = 0, pretend = 0, frame = 48
 916              		@ frame_needed = 1, uses_anonymous_args = 0
 917 0370 90B5     		push	{r4, r7, lr}
 918              		.cfi_def_cfa_offset 12
 919              		.cfi_offset 4, -12
 920              		.cfi_offset 7, -8
 921              		.cfi_offset 14, -4
 922 0372 8DB0     		sub	sp, sp, #52
 923              		.cfi_def_cfa_offset 64
 924 0374 00AF     		add	r7, sp, #0
 925              		.cfi_def_cfa_register 7
 926 0376 7860     		str	r0, [r7, #4]
 927 0378 3960     		str	r1, [r7]
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     char *s;
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     char test1[] = "Alfanumerisk";
 928              		.loc 1 209 0
 929 037a 1C23     		movs	r3, #28
 930 037c FB18     		adds	r3, r7, r3
 931 037e 1E4A     		ldr	r2, .L49
 932 0380 13CA     		ldmia	r2!, {r0, r1, r4}
 933 0382 13C3     		stmia	r3!, {r0, r1, r4}
 934 0384 1278     		ldrb	r2, [r2]
 935 0386 1A70     		strb	r2, [r3]
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     char test2[] = "Display - test";
 936              		.loc 1 210 0
 937 0388 0C23     		movs	r3, #12
 938 038a FB18     		adds	r3, r7, r3
 939 038c 1B4A     		ldr	r2, .L49+4
 940 038e 13CA     		ldmia	r2!, {r0, r1, r4}
 941 0390 13C3     		stmia	r3!, {r0, r1, r4}
 942 0392 1188     		ldrh	r1, [r2]
 943 0394 1980     		strh	r1, [r3]
 944 0396 9278     		ldrb	r2, [r2, #2]
 945 0398 9A70     		strb	r2, [r3, #2]
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     init_app();
 946              		.loc 1 212 0
 947 039a FFF7FEFF 		bl	init_app
 213:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_init();
 948              		.loc 1 213 0
 949 039e FFF7FEFF 		bl	ascii_init
 214:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_gotoxy(1,1);
 950              		.loc 1 214 0
 951 03a2 0121     		movs	r1, #1
 952 03a4 0120     		movs	r0, #1
 953 03a6 FFF7FEFF 		bl	ascii_gotoxy
 215:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     s = test1;
 954              		.loc 1 215 0
 955 03aa 1C23     		movs	r3, #28
 956 03ac FB18     		adds	r3, r7, r3
 957 03ae FB62     		str	r3, [r7, #44]
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while( *s )
 958              		.loc 1 216 0
 959 03b0 06E0     		b	.L44
 960              	.L45:
 217:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         ascii_write_char( *s++ );
 961              		.loc 1 217 0
 962 03b2 FB6A     		ldr	r3, [r7, #44]
 963 03b4 5A1C     		adds	r2, r3, #1
 964 03b6 FA62     		str	r2, [r7, #44]
 965 03b8 1B78     		ldrb	r3, [r3]
 966 03ba 1800     		movs	r0, r3
 967 03bc FFF7FEFF 		bl	ascii_write_char
 968              	.L44:
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while( *s )
 969              		.loc 1 216 0
 970 03c0 FB6A     		ldr	r3, [r7, #44]
 971 03c2 1B78     		ldrb	r3, [r3]
 972 03c4 002B     		cmp	r3, #0
 973 03c6 F4D1     		bne	.L45
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     ascii_gotoxy(1,2);
 974              		.loc 1 218 0
 975 03c8 0221     		movs	r1, #2
 976 03ca 0120     		movs	r0, #1
 977 03cc FFF7FEFF 		bl	ascii_gotoxy
 219:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     s = test2;
 978              		.loc 1 219 0
 979 03d0 0C23     		movs	r3, #12
 980 03d2 FB18     		adds	r3, r7, r3
 981 03d4 FB62     		str	r3, [r7, #44]
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while (*s)
 982              		.loc 1 220 0
 983 03d6 06E0     		b	.L46
 984              	.L47:
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****         ascii_write_char( *s++ );
 985              		.loc 1 221 0
 986 03d8 FB6A     		ldr	r3, [r7, #44]
 987 03da 5A1C     		adds	r2, r3, #1
 988 03dc FA62     		str	r2, [r7, #44]
 989 03de 1B78     		ldrb	r3, [r3]
 990 03e0 1800     		movs	r0, r3
 991 03e2 FFF7FEFF 		bl	ascii_write_char
 992              	.L46:
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     while (*s)
 993              		.loc 1 220 0
 994 03e6 FB6A     		ldr	r3, [r7, #44]
 995 03e8 1B78     		ldrb	r3, [r3]
 996 03ea 002B     		cmp	r3, #0
 997 03ec F4D1     		bne	.L47
 222:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c ****     return 0;
 998              		.loc 1 222 0
 999 03ee 0023     		movs	r3, #0
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/ascii\startup.c **** }
 1000              		.loc 1 223 0
 1001 03f0 1800     		movs	r0, r3
 1002 03f2 BD46     		mov	sp, r7
 1003 03f4 0DB0     		add	sp, sp, #52
 1004              		@ sp needed
 1005 03f6 90BD     		pop	{r4, r7, pc}
 1006              	.L50:
 1007              		.align	2
 1008              	.L49:
 1009 03f8 00000000 		.word	.LC0
 1010 03fc 10000000 		.word	.LC2
 1011              		.cfi_endproc
 1012              	.LFE17:
 1014              	.Letext0:
