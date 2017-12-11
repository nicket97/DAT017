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
  15              		.align	1
  16              		.global	graphic_write_command
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	graphic_write_command:
  23              	.LFB0:
  24              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5/graphicsDriver.h"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define	GPIO_D			0x40020C00
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO beh�
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste 
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste 
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define	GPIO_E			0x40021000
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 b
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO beh�
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste 
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste 
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define B_E 0x40 // Enable
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define B_RST 0x20 // Reset
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define B_CS2 0x10 // Controller Select 2
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define B_CS1 8 // Controller Select 1
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define B_RW 2 // 0 Write, 1 Read
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define B_RS 1 // 0 Command, 1 Data
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define LCD_ON 0x3F // Display on
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define LCD_OFF 0x3E // Display off
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define LCD_DISP_START 0xC0 // Start address
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** #define LCD_BUSY 0x80 // Read busy status
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void graphic_write_command(uint8_t command, uint8_t controller) {
  25              		.loc 1 41 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 8
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 82B0     		sub	sp, sp, #8
  34              		.cfi_def_cfa_offset 16
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 0200     		movs	r2, r0
  38 0008 FB1D     		adds	r3, r7, #7
  39 000a 1A70     		strb	r2, [r3]
  40 000c BB1D     		adds	r3, r7, #6
  41 000e 0A1C     		adds	r2, r1, #0
  42 0010 1A70     		strb	r2, [r3]
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_E);
  43              		.loc 1 42 0
  44 0012 4020     		movs	r0, #64
  45 0014 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller(controller);
  46              		.loc 1 43 0
  47 0018 BB1D     		adds	r3, r7, #6
  48 001a 1B78     		ldrb	r3, [r3]
  49 001c 1800     		movs	r0, r3
  50 001e FFF7FEFF 		bl	select_controller
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_RS|B_RW);
  51              		.loc 1 44 0
  52 0022 0320     		movs	r0, #3
  53 0024 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write(command, controller);
  54              		.loc 1 45 0
  55 0028 FB1D     		adds	r3, r7, #7
  56 002a 1A78     		ldrb	r2, [r3]
  57 002c BB1D     		adds	r3, r7, #6
  58 002e 1B78     		ldrb	r3, [r3]
  59 0030 1900     		movs	r1, r3
  60 0032 1000     		movs	r0, r2
  61 0034 FFF7FEFF 		bl	graphic_write
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
  62              		.loc 1 46 0
  63 0038 C046     		nop
  64 003a BD46     		mov	sp, r7
  65 003c 02B0     		add	sp, sp, #8
  66              		@ sp needed
  67 003e 80BD     		pop	{r7, pc}
  68              		.cfi_endproc
  69              	.LFE0:
  71              		.align	1
  72              		.global	graphic_write_data
  73              		.syntax unified
  74              		.code	16
  75              		.thumb_func
  76              		.fpu softvfp
  78              	graphic_write_data:
  79              	.LFB1:
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void graphic_write_data(uint8_t data, uint8_t controller) {
  80              		.loc 1 47 0
  81              		.cfi_startproc
  82              		@ args = 0, pretend = 0, frame = 8
  83              		@ frame_needed = 1, uses_anonymous_args = 0
  84 0040 80B5     		push	{r7, lr}
  85              		.cfi_def_cfa_offset 8
  86              		.cfi_offset 7, -8
  87              		.cfi_offset 14, -4
  88 0042 82B0     		sub	sp, sp, #8
  89              		.cfi_def_cfa_offset 16
  90 0044 00AF     		add	r7, sp, #0
  91              		.cfi_def_cfa_register 7
  92 0046 0200     		movs	r2, r0
  93 0048 FB1D     		adds	r3, r7, #7
  94 004a 1A70     		strb	r2, [r3]
  95 004c BB1D     		adds	r3, r7, #6
  96 004e 0A1C     		adds	r2, r1, #0
  97 0050 1A70     		strb	r2, [r3]
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_E);
  98              		.loc 1 48 0
  99 0052 4020     		movs	r0, #64
 100 0054 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller(controller);
 101              		.loc 1 49 0
 102 0058 BB1D     		adds	r3, r7, #6
 103 005a 1B78     		ldrb	r3, [r3]
 104 005c 1800     		movs	r0, r3
 105 005e FFF7FEFF 		bl	select_controller
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_RS);
 106              		.loc 1 50 0
 107 0062 0120     		movs	r0, #1
 108 0064 FFF7FEFF 		bl	graphic_ctrl_bit_set
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_RW);
 109              		.loc 1 51 0
 110 0068 0220     		movs	r0, #2
 111 006a FFF7FEFF 		bl	graphic_ctrl_bit_clear
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write(data, controller);
 112              		.loc 1 52 0
 113 006e FB1D     		adds	r3, r7, #7
 114 0070 1A78     		ldrb	r2, [r3]
 115 0072 BB1D     		adds	r3, r7, #6
 116 0074 1B78     		ldrb	r3, [r3]
 117 0076 1900     		movs	r1, r3
 118 0078 1000     		movs	r0, r2
 119 007a FFF7FEFF 		bl	graphic_write
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 120              		.loc 1 53 0
 121 007e C046     		nop
 122 0080 BD46     		mov	sp, r7
 123 0082 02B0     		add	sp, sp, #8
 124              		@ sp needed
 125 0084 80BD     		pop	{r7, pc}
 126              		.cfi_endproc
 127              	.LFE1:
 129              		.align	1
 130              		.global	graphic_initialize
 131              		.syntax unified
 132              		.code	16
 133              		.thumb_func
 134              		.fpu softvfp
 136              	graphic_initialize:
 137              	.LFB2:
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void graphic_initialize(void) {
 138              		.loc 1 55 0
 139              		.cfi_startproc
 140              		@ args = 0, pretend = 0, frame = 0
 141              		@ frame_needed = 1, uses_anonymous_args = 0
 142 0086 80B5     		push	{r7, lr}
 143              		.cfi_def_cfa_offset 8
 144              		.cfi_offset 7, -8
 145              		.cfi_offset 14, -4
 146 0088 00AF     		add	r7, sp, #0
 147              		.cfi_def_cfa_register 7
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_E);
 148              		.loc 1 56 0
 149 008a 4020     		movs	r0, #64
 150 008c FFF7FEFF 		bl	graphic_ctrl_bit_set
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_mikro(10);
 151              		.loc 1 57 0
 152 0090 0A20     		movs	r0, #10
 153 0092 FFF7FEFF 		bl	delay_mikro
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 154              		.loc 1 58 0
 155 0096 7820     		movs	r0, #120
 156 0098 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_milli(30);
 157              		.loc 1 59 0
 158 009c 1E20     		movs	r0, #30
 159 009e FFF7FEFF 		bl	delay_milli
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_RST);
 160              		.loc 1 60 0
 161 00a2 2020     		movs	r0, #32
 162 00a4 FFF7FEFF 		bl	graphic_ctrl_bit_set
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_milli(100);
 163              		.loc 1 61 0
 164 00a8 6420     		movs	r0, #100
 165 00aa FFF7FEFF 		bl	delay_milli
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 166              		.loc 1 62 0
 167 00ae 1821     		movs	r1, #24
 168 00b0 3E20     		movs	r0, #62
 169 00b2 FFF7FEFF 		bl	graphic_write_command
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_ON, B_CS1|B_CS2);
 170              		.loc 1 63 0
 171 00b6 1821     		movs	r1, #24
 172 00b8 3F20     		movs	r0, #63
 173 00ba FFF7FEFF 		bl	graphic_write_command
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 174              		.loc 1 64 0
 175 00be 1821     		movs	r1, #24
 176 00c0 C020     		movs	r0, #192
 177 00c2 FFF7FEFF 		bl	graphic_write_command
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 178              		.loc 1 65 0
 179 00c6 1821     		movs	r1, #24
 180 00c8 4020     		movs	r0, #64
 181 00ca FFF7FEFF 		bl	graphic_write_command
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 182              		.loc 1 66 0
 183 00ce 1821     		movs	r1, #24
 184 00d0 B820     		movs	r0, #184
 185 00d2 FFF7FEFF 		bl	graphic_write_command
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller(0);
 186              		.loc 1 67 0
 187 00d6 0020     		movs	r0, #0
 188 00d8 FFF7FEFF 		bl	select_controller
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 189              		.loc 1 68 0
 190 00dc C046     		nop
 191 00de BD46     		mov	sp, r7
 192              		@ sp needed
 193 00e0 80BD     		pop	{r7, pc}
 194              		.cfi_endproc
 195              	.LFE2:
 197              		.align	1
 198              		.syntax unified
 199              		.code	16
 200              		.thumb_func
 201              		.fpu softvfp
 203              	graphic_wait_ready:
 204              	.LFB3:
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** static void graphic_wait_ready(void) {
 205              		.loc 1 69 0
 206              		.cfi_startproc
 207              		@ args = 0, pretend = 0, frame = 8
 208              		@ frame_needed = 1, uses_anonymous_args = 0
 209 00e2 80B5     		push	{r7, lr}
 210              		.cfi_def_cfa_offset 8
 211              		.cfi_offset 7, -8
 212              		.cfi_offset 14, -4
 213 00e4 82B0     		sub	sp, sp, #8
 214              		.cfi_def_cfa_offset 16
 215 00e6 00AF     		add	r7, sp, #0
 216              		.cfi_def_cfa_register 7
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** uint8_t c;
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_E);
 217              		.loc 1 71 0
 218 00e8 4020     		movs	r0, #64
 219 00ea FFF7FEFF 		bl	graphic_ctrl_bit_clear
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** // 15-8 inputs, 7-0 outputs
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** *GPIOE_MODER = 0x00005555;
 220              		.loc 1 73 0
 221 00ee 144B     		ldr	r3, .L10
 222 00f0 144A     		ldr	r2, .L10+4
 223 00f2 1A60     		str	r2, [r3]
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_RS);
 224              		.loc 1 74 0
 225 00f4 0120     		movs	r0, #1
 226 00f6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_RW);
 227              		.loc 1 75 0
 228 00fa 0220     		movs	r0, #2
 229 00fc FFF7FEFF 		bl	graphic_ctrl_bit_set
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 230              		.loc 1 76 0
 231 0100 FFF7FEFF 		bl	delay_500ns
 232              	.L7:
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** while(1) {
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_E);
 233              		.loc 1 78 0
 234 0104 4020     		movs	r0, #64
 235 0106 FFF7FEFF 		bl	graphic_ctrl_bit_set
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 236              		.loc 1 79 0
 237 010a FFF7FEFF 		bl	delay_500ns
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c = *GPIOE_IDR_HIGH & LCD_BUSY;
 238              		.loc 1 80 0
 239 010e 0E4B     		ldr	r3, .L10+8
 240 0110 1B78     		ldrb	r3, [r3]
 241 0112 DAB2     		uxtb	r2, r3
 242 0114 FB1D     		adds	r3, r7, #7
 243 0116 7F21     		movs	r1, #127
 244 0118 8A43     		bics	r2, r1
 245 011a 1A70     		strb	r2, [r3]
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_E);
 246              		.loc 1 81 0
 247 011c 4020     		movs	r0, #64
 248 011e FFF7FEFF 		bl	graphic_ctrl_bit_clear
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 249              		.loc 1 82 0
 250 0122 FFF7FEFF 		bl	delay_500ns
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** if( c == 0 ) break;
 251              		.loc 1 83 0
 252 0126 FB1D     		adds	r3, r7, #7
 253 0128 1B78     		ldrb	r3, [r3]
 254 012a 002B     		cmp	r3, #0
 255 012c 00D0     		beq	.L9
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 256              		.loc 1 78 0
 257 012e E9E7     		b	.L7
 258              	.L9:
 259              		.loc 1 83 0
 260 0130 C046     		nop
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 261              		.loc 1 85 0
 262 0132 034B     		ldr	r3, .L10
 263 0134 054A     		ldr	r2, .L10+12
 264 0136 1A60     		str	r2, [r3]
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 265              		.loc 1 86 0
 266 0138 C046     		nop
 267 013a BD46     		mov	sp, r7
 268 013c 02B0     		add	sp, sp, #8
 269              		@ sp needed
 270 013e 80BD     		pop	{r7, pc}
 271              	.L11:
 272              		.align	2
 273              	.L10:
 274 0140 00100240 		.word	1073876992
 275 0144 55550000 		.word	21845
 276 0148 11100240 		.word	1073877009
 277 014c 55555555 		.word	1431655765
 278              		.cfi_endproc
 279              	.LFE3:
 281              		.align	1
 282              		.syntax unified
 283              		.code	16
 284              		.thumb_func
 285              		.fpu softvfp
 287              	graphic_read:
 288              	.LFB4:
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** static uint8_t graphic_read(uint8_t controller) {
 289              		.loc 1 87 0
 290              		.cfi_startproc
 291              		@ args = 0, pretend = 0, frame = 16
 292              		@ frame_needed = 1, uses_anonymous_args = 0
 293 0150 80B5     		push	{r7, lr}
 294              		.cfi_def_cfa_offset 8
 295              		.cfi_offset 7, -8
 296              		.cfi_offset 14, -4
 297 0152 84B0     		sub	sp, sp, #16
 298              		.cfi_def_cfa_offset 24
 299 0154 00AF     		add	r7, sp, #0
 300              		.cfi_def_cfa_register 7
 301 0156 0200     		movs	r2, r0
 302 0158 FB1D     		adds	r3, r7, #7
 303 015a 1A70     		strb	r2, [r3]
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** uint8_t c;
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_E);
 304              		.loc 1 89 0
 305 015c 4020     		movs	r0, #64
 306 015e FFF7FEFF 		bl	graphic_ctrl_bit_clear
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** *GPIOE_MODER = 0x00005555; // 15-8 inputs, 7-0 outputs
 307              		.loc 1 90 0
 308 0162 1C4B     		ldr	r3, .L16
 309 0164 1C4A     		ldr	r2, .L16+4
 310 0166 1A60     		str	r2, [r3]
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_RS|B_RW);
 311              		.loc 1 91 0
 312 0168 0320     		movs	r0, #3
 313 016a FFF7FEFF 		bl	graphic_ctrl_bit_set
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller(controller);
 314              		.loc 1 92 0
 315 016e FB1D     		adds	r3, r7, #7
 316 0170 1B78     		ldrb	r3, [r3]
 317 0172 1800     		movs	r0, r3
 318 0174 FFF7FEFF 		bl	select_controller
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 319              		.loc 1 93 0
 320 0178 FFF7FEFF 		bl	delay_500ns
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_E);
 321              		.loc 1 94 0
 322 017c 4020     		movs	r0, #64
 323 017e FFF7FEFF 		bl	graphic_ctrl_bit_set
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 324              		.loc 1 95 0
 325 0182 FFF7FEFF 		bl	delay_500ns
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c = *GPIOE_IDR_HIGH;
 326              		.loc 1 96 0
 327 0186 154A     		ldr	r2, .L16+8
 328 0188 0F23     		movs	r3, #15
 329 018a FB18     		adds	r3, r7, r3
 330 018c 1278     		ldrb	r2, [r2]
 331 018e 1A70     		strb	r2, [r3]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear(B_E);
 332              		.loc 1 97 0
 333 0190 4020     		movs	r0, #64
 334 0192 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 335              		.loc 1 98 0
 336 0196 0F4B     		ldr	r3, .L16
 337 0198 114A     		ldr	r2, .L16+12
 338 019a 1A60     		str	r2, [r3]
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** if( controller & B_CS1 ) {
 339              		.loc 1 99 0
 340 019c FB1D     		adds	r3, r7, #7
 341 019e 1B78     		ldrb	r3, [r3]
 342 01a0 0822     		movs	r2, #8
 343 01a2 1340     		ands	r3, r2
 344 01a4 04D0     		beq	.L13
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller(B_CS1);
 345              		.loc 1 100 0
 346 01a6 0820     		movs	r0, #8
 347 01a8 FFF7FEFF 		bl	select_controller
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_wait_ready();
 348              		.loc 1 101 0
 349 01ac FFF799FF 		bl	graphic_wait_ready
 350              	.L13:
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** if( controller & B_CS2 ) {
 351              		.loc 1 103 0
 352 01b0 FB1D     		adds	r3, r7, #7
 353 01b2 1B78     		ldrb	r3, [r3]
 354 01b4 1022     		movs	r2, #16
 355 01b6 1340     		ands	r3, r2
 356 01b8 04D0     		beq	.L14
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller(B_CS2);
 357              		.loc 1 104 0
 358 01ba 1020     		movs	r0, #16
 359 01bc FFF7FEFF 		bl	select_controller
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_wait_ready();
 360              		.loc 1 105 0
 361 01c0 FFF78FFF 		bl	graphic_wait_ready
 362              	.L14:
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** return c;
 363              		.loc 1 107 0
 364 01c4 0F23     		movs	r3, #15
 365 01c6 FB18     		adds	r3, r7, r3
 366 01c8 1B78     		ldrb	r3, [r3]
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 367              		.loc 1 108 0
 368 01ca 1800     		movs	r0, r3
 369 01cc BD46     		mov	sp, r7
 370 01ce 04B0     		add	sp, sp, #16
 371              		@ sp needed
 372 01d0 80BD     		pop	{r7, pc}
 373              	.L17:
 374 01d2 C046     		.align	2
 375              	.L16:
 376 01d4 00100240 		.word	1073876992
 377 01d8 55550000 		.word	21845
 378 01dc 11100240 		.word	1073877009
 379 01e0 55555555 		.word	1431655765
 380              		.cfi_endproc
 381              	.LFE4:
 383              		.align	1
 384              		.syntax unified
 385              		.code	16
 386              		.thumb_func
 387              		.fpu softvfp
 389              	graphic_read_data:
 390              	.LFB5:
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** static uint8_t graphic_read_data(uint8_t controller) {
 391              		.loc 1 109 0
 392              		.cfi_startproc
 393              		@ args = 0, pretend = 0, frame = 8
 394              		@ frame_needed = 1, uses_anonymous_args = 0
 395 01e4 80B5     		push	{r7, lr}
 396              		.cfi_def_cfa_offset 8
 397              		.cfi_offset 7, -8
 398              		.cfi_offset 14, -4
 399 01e6 82B0     		sub	sp, sp, #8
 400              		.cfi_def_cfa_offset 16
 401 01e8 00AF     		add	r7, sp, #0
 402              		.cfi_def_cfa_register 7
 403 01ea 0200     		movs	r2, r0
 404 01ec FB1D     		adds	r3, r7, #7
 405 01ee 1A70     		strb	r2, [r3]
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_read(controller);
 406              		.loc 1 110 0
 407 01f0 FB1D     		adds	r3, r7, #7
 408 01f2 1B78     		ldrb	r3, [r3]
 409 01f4 1800     		movs	r0, r3
 410 01f6 FFF7ABFF 		bl	graphic_read
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** return graphic_read(controller);
 411              		.loc 1 111 0
 412 01fa FB1D     		adds	r3, r7, #7
 413 01fc 1B78     		ldrb	r3, [r3]
 414 01fe 1800     		movs	r0, r3
 415 0200 FFF7A6FF 		bl	graphic_read
 416 0204 0300     		movs	r3, r0
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 417              		.loc 1 112 0
 418 0206 1800     		movs	r0, r3
 419 0208 BD46     		mov	sp, r7
 420 020a 02B0     		add	sp, sp, #8
 421              		@ sp needed
 422 020c 80BD     		pop	{r7, pc}
 423              		.cfi_endproc
 424              	.LFE5:
 426              		.align	1
 427              		.global	graphic_write
 428              		.syntax unified
 429              		.code	16
 430              		.thumb_func
 431              		.fpu softvfp
 433              	graphic_write:
 434              	.LFB6:
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void graphic_write(uint8_t value, uint8_t controller) {
 435              		.loc 1 113 0
 436              		.cfi_startproc
 437              		@ args = 0, pretend = 0, frame = 8
 438              		@ frame_needed = 1, uses_anonymous_args = 0
 439 020e 80B5     		push	{r7, lr}
 440              		.cfi_def_cfa_offset 8
 441              		.cfi_offset 7, -8
 442              		.cfi_offset 14, -4
 443 0210 82B0     		sub	sp, sp, #8
 444              		.cfi_def_cfa_offset 16
 445 0212 00AF     		add	r7, sp, #0
 446              		.cfi_def_cfa_register 7
 447 0214 0200     		movs	r2, r0
 448 0216 FB1D     		adds	r3, r7, #7
 449 0218 1A70     		strb	r2, [r3]
 450 021a BB1D     		adds	r3, r7, #6
 451 021c 0A1C     		adds	r2, r1, #0
 452 021e 1A70     		strb	r2, [r3]
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** *GPIOE_ODR_HIGH = value;
 453              		.loc 1 114 0
 454 0220 154A     		ldr	r2, .L24
 455 0222 FB1D     		adds	r3, r7, #7
 456 0224 1B78     		ldrb	r3, [r3]
 457 0226 1370     		strb	r3, [r2]
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller(controller);
 458              		.loc 1 115 0
 459 0228 BB1D     		adds	r3, r7, #6
 460 022a 1B78     		ldrb	r3, [r3]
 461 022c 1800     		movs	r0, r3
 462 022e FFF7FEFF 		bl	select_controller
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 463              		.loc 1 116 0
 464 0232 FFF7FEFF 		bl	delay_500ns
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_set(B_E);
 465              		.loc 1 117 0
 466 0236 4020     		movs	r0, #64
 467 0238 FFF7FEFF 		bl	graphic_ctrl_bit_set
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** delay_500ns();
 468              		.loc 1 118 0
 469 023c FFF7FEFF 		bl	delay_500ns
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_ctrl_bit_clear( B_E );
 470              		.loc 1 119 0
 471 0240 4020     		movs	r0, #64
 472 0242 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** if(controller & B_CS1) {
 473              		.loc 1 120 0
 474 0246 BB1D     		adds	r3, r7, #6
 475 0248 1B78     		ldrb	r3, [r3]
 476 024a 0822     		movs	r2, #8
 477 024c 1340     		ands	r3, r2
 478 024e 04D0     		beq	.L21
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller( B_CS1);
 479              		.loc 1 121 0
 480 0250 0820     		movs	r0, #8
 481 0252 FFF7FEFF 		bl	select_controller
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_wait_ready();
 482              		.loc 1 122 0
 483 0256 FFF744FF 		bl	graphic_wait_ready
 484              	.L21:
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** if(controller & B_CS2) {
 485              		.loc 1 124 0
 486 025a BB1D     		adds	r3, r7, #6
 487 025c 1B78     		ldrb	r3, [r3]
 488 025e 1022     		movs	r2, #16
 489 0260 1340     		ands	r3, r2
 490 0262 04D0     		beq	.L23
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** select_controller( B_CS2);
 491              		.loc 1 125 0
 492 0264 1020     		movs	r0, #16
 493 0266 FFF7FEFF 		bl	select_controller
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_wait_ready();
 494              		.loc 1 126 0
 495 026a FFF73AFF 		bl	graphic_wait_ready
 496              	.L23:
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 497              		.loc 1 128 0
 498 026e C046     		nop
 499 0270 BD46     		mov	sp, r7
 500 0272 02B0     		add	sp, sp, #8
 501              		@ sp needed
 502 0274 80BD     		pop	{r7, pc}
 503              	.L25:
 504 0276 C046     		.align	2
 505              	.L24:
 506 0278 15100240 		.word	1073877013
 507              		.cfi_endproc
 508              	.LFE6:
 510              		.align	1
 511              		.global	graphic_clear_screen
 512              		.syntax unified
 513              		.code	16
 514              		.thumb_func
 515              		.fpu softvfp
 517              	graphic_clear_screen:
 518              	.LFB7:
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void graphic_clear_screen(void) {
 519              		.loc 1 130 0
 520              		.cfi_startproc
 521              		@ args = 0, pretend = 0, frame = 8
 522              		@ frame_needed = 1, uses_anonymous_args = 0
 523 027c 80B5     		push	{r7, lr}
 524              		.cfi_def_cfa_offset 8
 525              		.cfi_offset 7, -8
 526              		.cfi_offset 14, -4
 527 027e 82B0     		sub	sp, sp, #8
 528              		.cfi_def_cfa_offset 16
 529 0280 00AF     		add	r7, sp, #0
 530              		.cfi_def_cfa_register 7
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** uint8_t i, j;
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** for(j = 0; j < 8; j++) {
 531              		.loc 1 132 0
 532 0282 BB1D     		adds	r3, r7, #6
 533 0284 0022     		movs	r2, #0
 534 0286 1A70     		strb	r2, [r3]
 535 0288 23E0     		b	.L27
 536              	.L30:
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 537              		.loc 1 133 0
 538 028a BB1D     		adds	r3, r7, #6
 539 028c 1B78     		ldrb	r3, [r3]
 540 028e 4822     		movs	r2, #72
 541 0290 5242     		rsbs	r2, r2, #0
 542 0292 1343     		orrs	r3, r2
 543 0294 DBB2     		uxtb	r3, r3
 544 0296 1821     		movs	r1, #24
 545 0298 1800     		movs	r0, r3
 546 029a FFF7FEFF 		bl	graphic_write_command
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 547              		.loc 1 134 0
 548 029e 1821     		movs	r1, #24
 549 02a0 4020     		movs	r0, #64
 550 02a2 FFF7FEFF 		bl	graphic_write_command
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** for(i = 0; i <= 63; i++){
 551              		.loc 1 135 0
 552 02a6 FB1D     		adds	r3, r7, #7
 553 02a8 0022     		movs	r2, #0
 554 02aa 1A70     		strb	r2, [r3]
 555 02ac 08E0     		b	.L28
 556              	.L29:
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_data(0, B_CS1|B_CS2);
 557              		.loc 1 136 0 discriminator 3
 558 02ae 1821     		movs	r1, #24
 559 02b0 0020     		movs	r0, #0
 560 02b2 FFF7FEFF 		bl	graphic_write_data
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** for(i = 0; i <= 63; i++){
 561              		.loc 1 135 0 discriminator 3
 562 02b6 FB1D     		adds	r3, r7, #7
 563 02b8 1A78     		ldrb	r2, [r3]
 564 02ba FB1D     		adds	r3, r7, #7
 565 02bc 0132     		adds	r2, r2, #1
 566 02be 1A70     		strb	r2, [r3]
 567              	.L28:
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** for(i = 0; i <= 63; i++){
 568              		.loc 1 135 0 is_stmt 0 discriminator 1
 569 02c0 FB1D     		adds	r3, r7, #7
 570 02c2 1B78     		ldrb	r3, [r3]
 571 02c4 3F2B     		cmp	r3, #63
 572 02c6 F2D9     		bls	.L29
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 573              		.loc 1 132 0 is_stmt 1 discriminator 2
 574 02c8 BB1D     		adds	r3, r7, #6
 575 02ca 1A78     		ldrb	r2, [r3]
 576 02cc BB1D     		adds	r3, r7, #6
 577 02ce 0132     		adds	r2, r2, #1
 578 02d0 1A70     		strb	r2, [r3]
 579              	.L27:
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 580              		.loc 1 132 0 is_stmt 0 discriminator 1
 581 02d2 BB1D     		adds	r3, r7, #6
 582 02d4 1B78     		ldrb	r3, [r3]
 583 02d6 072B     		cmp	r3, #7
 584 02d8 D7D9     		bls	.L30
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 585              		.loc 1 139 0 is_stmt 1
 586 02da C046     		nop
 587 02dc BD46     		mov	sp, r7
 588 02de 02B0     		add	sp, sp, #8
 589              		@ sp needed
 590 02e0 80BD     		pop	{r7, pc}
 591              		.cfi_endproc
 592              	.LFE7:
 594              		.align	1
 595              		.global	graphic_ctrl_bit_set
 596              		.syntax unified
 597              		.code	16
 598              		.thumb_func
 599              		.fpu softvfp
 601              	graphic_ctrl_bit_set:
 602              	.LFB8:
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void graphic_ctrl_bit_set(uint8_t x) {
 603              		.loc 1 140 0
 604              		.cfi_startproc
 605              		@ args = 0, pretend = 0, frame = 16
 606              		@ frame_needed = 1, uses_anonymous_args = 0
 607 02e2 80B5     		push	{r7, lr}
 608              		.cfi_def_cfa_offset 8
 609              		.cfi_offset 7, -8
 610              		.cfi_offset 14, -4
 611 02e4 84B0     		sub	sp, sp, #16
 612              		.cfi_def_cfa_offset 24
 613 02e6 00AF     		add	r7, sp, #0
 614              		.cfi_def_cfa_register 7
 615 02e8 0200     		movs	r2, r0
 616 02ea FB1D     		adds	r3, r7, #7
 617 02ec 1A70     		strb	r2, [r3]
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** uint8_t c;
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c = *GPIOE_ODR_LOW;
 618              		.loc 1 142 0
 619 02ee 124A     		ldr	r2, .L32
 620 02f0 0F23     		movs	r3, #15
 621 02f2 FB18     		adds	r3, r7, r3
 622 02f4 1278     		ldrb	r2, [r2]
 623 02f6 1A70     		strb	r2, [r3]
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c &= ~B_SELECT;
 624              		.loc 1 143 0
 625 02f8 0F23     		movs	r3, #15
 626 02fa FB18     		adds	r3, r7, r3
 627 02fc 0F22     		movs	r2, #15
 628 02fe BA18     		adds	r2, r7, r2
 629 0300 1278     		ldrb	r2, [r2]
 630 0302 0421     		movs	r1, #4
 631 0304 8A43     		bics	r2, r1
 632 0306 1A70     		strb	r2, [r3]
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c |= (~B_SELECT & x);
 633              		.loc 1 144 0
 634 0308 FB1D     		adds	r3, r7, #7
 635 030a 1B78     		ldrb	r3, [r3]
 636 030c 5BB2     		sxtb	r3, r3
 637 030e 0422     		movs	r2, #4
 638 0310 9343     		bics	r3, r2
 639 0312 5AB2     		sxtb	r2, r3
 640 0314 0F23     		movs	r3, #15
 641 0316 FB18     		adds	r3, r7, r3
 642 0318 1B78     		ldrb	r3, [r3]
 643 031a 5BB2     		sxtb	r3, r3
 644 031c 1343     		orrs	r3, r2
 645 031e 5AB2     		sxtb	r2, r3
 646 0320 0F23     		movs	r3, #15
 647 0322 FB18     		adds	r3, r7, r3
 648 0324 1A70     		strb	r2, [r3]
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** *GPIOE_ODR_LOW = c;
 649              		.loc 1 145 0
 650 0326 044A     		ldr	r2, .L32
 651 0328 0F23     		movs	r3, #15
 652 032a FB18     		adds	r3, r7, r3
 653 032c 1B78     		ldrb	r3, [r3]
 654 032e 1370     		strb	r3, [r2]
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 655              		.loc 1 146 0
 656 0330 C046     		nop
 657 0332 BD46     		mov	sp, r7
 658 0334 04B0     		add	sp, sp, #16
 659              		@ sp needed
 660 0336 80BD     		pop	{r7, pc}
 661              	.L33:
 662              		.align	2
 663              	.L32:
 664 0338 14100240 		.word	1073877012
 665              		.cfi_endproc
 666              	.LFE8:
 668              		.align	1
 669              		.global	graphic_ctrl_bit_clear
 670              		.syntax unified
 671              		.code	16
 672              		.thumb_func
 673              		.fpu softvfp
 675              	graphic_ctrl_bit_clear:
 676              	.LFB9:
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void graphic_ctrl_bit_clear(uint8_t x) {
 677              		.loc 1 147 0
 678              		.cfi_startproc
 679              		@ args = 0, pretend = 0, frame = 16
 680              		@ frame_needed = 1, uses_anonymous_args = 0
 681 033c 80B5     		push	{r7, lr}
 682              		.cfi_def_cfa_offset 8
 683              		.cfi_offset 7, -8
 684              		.cfi_offset 14, -4
 685 033e 84B0     		sub	sp, sp, #16
 686              		.cfi_def_cfa_offset 24
 687 0340 00AF     		add	r7, sp, #0
 688              		.cfi_def_cfa_register 7
 689 0342 0200     		movs	r2, r0
 690 0344 FB1D     		adds	r3, r7, #7
 691 0346 1A70     		strb	r2, [r3]
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** uint8_t c;
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c = *GPIOE_ODR_LOW;
 692              		.loc 1 149 0
 693 0348 114A     		ldr	r2, .L35
 694 034a 0F23     		movs	r3, #15
 695 034c FB18     		adds	r3, r7, r3
 696 034e 1278     		ldrb	r2, [r2]
 697 0350 1A70     		strb	r2, [r3]
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c &= ~B_SELECT;
 698              		.loc 1 150 0
 699 0352 0F23     		movs	r3, #15
 700 0354 FB18     		adds	r3, r7, r3
 701 0356 0F22     		movs	r2, #15
 702 0358 BA18     		adds	r2, r7, r2
 703 035a 1278     		ldrb	r2, [r2]
 704 035c 0421     		movs	r1, #4
 705 035e 8A43     		bics	r2, r1
 706 0360 1A70     		strb	r2, [r3]
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** c &= ~x;
 707              		.loc 1 151 0
 708 0362 FB1D     		adds	r3, r7, #7
 709 0364 1B78     		ldrb	r3, [r3]
 710 0366 5BB2     		sxtb	r3, r3
 711 0368 DB43     		mvns	r3, r3
 712 036a 5BB2     		sxtb	r3, r3
 713 036c 0F22     		movs	r2, #15
 714 036e BA18     		adds	r2, r7, r2
 715 0370 1278     		ldrb	r2, [r2]
 716 0372 52B2     		sxtb	r2, r2
 717 0374 1340     		ands	r3, r2
 718 0376 5AB2     		sxtb	r2, r3
 719 0378 0F23     		movs	r3, #15
 720 037a FB18     		adds	r3, r7, r3
 721 037c 1A70     		strb	r2, [r3]
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** *GPIOE_ODR_LOW = c;
 722              		.loc 1 152 0
 723 037e 044A     		ldr	r2, .L35
 724 0380 0F23     		movs	r3, #15
 725 0382 FB18     		adds	r3, r7, r3
 726 0384 1B78     		ldrb	r3, [r3]
 727 0386 1370     		strb	r3, [r2]
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 728              		.loc 1 153 0
 729 0388 C046     		nop
 730 038a BD46     		mov	sp, r7
 731 038c 04B0     		add	sp, sp, #16
 732              		@ sp needed
 733 038e 80BD     		pop	{r7, pc}
 734              	.L36:
 735              		.align	2
 736              	.L35:
 737 0390 14100240 		.word	1073877012
 738              		.cfi_endproc
 739              	.LFE9:
 741              		.align	1
 742              		.global	select_controller
 743              		.syntax unified
 744              		.code	16
 745              		.thumb_func
 746              		.fpu softvfp
 748              	select_controller:
 749              	.LFB10:
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void select_controller(uint8_t controller){
 750              		.loc 1 154 0
 751              		.cfi_startproc
 752              		@ args = 0, pretend = 0, frame = 8
 753              		@ frame_needed = 1, uses_anonymous_args = 0
 754 0394 80B5     		push	{r7, lr}
 755              		.cfi_def_cfa_offset 8
 756              		.cfi_offset 7, -8
 757              		.cfi_offset 14, -4
 758 0396 82B0     		sub	sp, sp, #8
 759              		.cfi_def_cfa_offset 16
 760 0398 00AF     		add	r7, sp, #0
 761              		.cfi_def_cfa_register 7
 762 039a 0200     		movs	r2, r0
 763 039c FB1D     		adds	r3, r7, #7
 764 039e 1A70     		strb	r2, [r3]
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     switch(controller){
 765              		.loc 1 155 0
 766 03a0 FB1D     		adds	r3, r7, #7
 767 03a2 1B78     		ldrb	r3, [r3]
 768 03a4 082B     		cmp	r3, #8
 769 03a6 0CD0     		beq	.L39
 770 03a8 02DC     		bgt	.L40
 771 03aa 002B     		cmp	r3, #0
 772 03ac 05D0     		beq	.L41
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     case 0:
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_clear(B_CS1|B_CS2);
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     case B_CS1 :
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_set(B_CS1);
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_clear(B_CS2);
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     case B_CS2 :
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_set(B_CS2);
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_clear(B_CS1);
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     case B_CS1|B_CS2 :
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_set(B_CS1|B_CS2);
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 773              		.loc 1 171 0
 774 03ae 1AE0     		b	.L44
 775              	.L40:
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     switch(controller){
 776              		.loc 1 155 0
 777 03b0 102B     		cmp	r3, #16
 778 03b2 0DD0     		beq	.L42
 779 03b4 182B     		cmp	r3, #24
 780 03b6 12D0     		beq	.L43
 781              		.loc 1 171 0
 782 03b8 15E0     		b	.L44
 783              	.L41:
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 784              		.loc 1 157 0
 785 03ba 1820     		movs	r0, #24
 786 03bc FFF7FEFF 		bl	graphic_ctrl_bit_clear
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     case B_CS1 :
 787              		.loc 1 158 0
 788 03c0 11E0     		b	.L38
 789              	.L39:
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_clear(B_CS2);
 790              		.loc 1 160 0
 791 03c2 0820     		movs	r0, #8
 792 03c4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 793              		.loc 1 161 0
 794 03c8 1020     		movs	r0, #16
 795 03ca FFF7FEFF 		bl	graphic_ctrl_bit_clear
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     case B_CS2 :
 796              		.loc 1 162 0
 797 03ce 0AE0     		b	.L38
 798              	.L42:
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     graphic_ctrl_bit_clear(B_CS1);
 799              		.loc 1 164 0
 800 03d0 1020     		movs	r0, #16
 801 03d2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 802              		.loc 1 165 0
 803 03d6 0820     		movs	r0, #8
 804 03d8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     case B_CS1|B_CS2 :
 805              		.loc 1 166 0
 806 03dc 03E0     		b	.L38
 807              	.L43:
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     break;
 808              		.loc 1 168 0
 809 03de 1820     		movs	r0, #24
 810 03e0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 811              		.loc 1 169 0
 812 03e4 C046     		nop
 813              	.L38:
 814              	.L44:
 815              		.loc 1 171 0
 816 03e6 C046     		nop
 817 03e8 BD46     		mov	sp, r7
 818 03ea 02B0     		add	sp, sp, #8
 819              		@ sp needed
 820 03ec 80BD     		pop	{r7, pc}
 821              		.cfi_endproc
 822              	.LFE10:
 824              		.align	1
 825              		.global	ascii_ctrl_bit_set
 826              		.syntax unified
 827              		.code	16
 828              		.thumb_func
 829              		.fpu softvfp
 831              	ascii_ctrl_bit_set:
 832              	.LFB11:
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_ctrl_bit_set( unsigned char x )
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 833              		.loc 1 173 0
 834              		.cfi_startproc
 835              		@ args = 0, pretend = 0, frame = 16
 836              		@ frame_needed = 1, uses_anonymous_args = 0
 837 03ee 80B5     		push	{r7, lr}
 838              		.cfi_def_cfa_offset 8
 839              		.cfi_offset 7, -8
 840              		.cfi_offset 14, -4
 841 03f0 84B0     		sub	sp, sp, #16
 842              		.cfi_def_cfa_offset 24
 843 03f2 00AF     		add	r7, sp, #0
 844              		.cfi_def_cfa_register 7
 845 03f4 0200     		movs	r2, r0
 846 03f6 FB1D     		adds	r3, r7, #7
 847 03f8 1A70     		strb	r2, [r3]
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     unsigned char c;
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     c = *GPIOE_ODR_LOW;
 848              		.loc 1 175 0
 849 03fa 0D4A     		ldr	r2, .L46
 850 03fc 0F23     		movs	r3, #15
 851 03fe FB18     		adds	r3, r7, r3
 852 0400 1278     		ldrb	r2, [r2]
 853 0402 1A70     		strb	r2, [r3]
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     c |=  (B_SELECT | x);
 854              		.loc 1 176 0
 855 0404 FA1D     		adds	r2, r7, #7
 856 0406 0F23     		movs	r3, #15
 857 0408 FB18     		adds	r3, r7, r3
 858 040a 1278     		ldrb	r2, [r2]
 859 040c 1B78     		ldrb	r3, [r3]
 860 040e 1343     		orrs	r3, r2
 861 0410 DAB2     		uxtb	r2, r3
 862 0412 0F23     		movs	r3, #15
 863 0414 FB18     		adds	r3, r7, r3
 864 0416 0421     		movs	r1, #4
 865 0418 0A43     		orrs	r2, r1
 866 041a 1A70     		strb	r2, [r3]
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     *GPIOE_ODR_LOW = c;
 867              		.loc 1 177 0
 868 041c 044A     		ldr	r2, .L46
 869 041e 0F23     		movs	r3, #15
 870 0420 FB18     		adds	r3, r7, r3
 871 0422 1B78     		ldrb	r3, [r3]
 872 0424 1370     		strb	r3, [r2]
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 873              		.loc 1 178 0
 874 0426 C046     		nop
 875 0428 BD46     		mov	sp, r7
 876 042a 04B0     		add	sp, sp, #16
 877              		@ sp needed
 878 042c 80BD     		pop	{r7, pc}
 879              	.L47:
 880 042e C046     		.align	2
 881              	.L46:
 882 0430 14100240 		.word	1073877012
 883              		.cfi_endproc
 884              	.LFE11:
 886              		.align	1
 887              		.global	ascii_ctrl_bit_clear
 888              		.syntax unified
 889              		.code	16
 890              		.thumb_func
 891              		.fpu softvfp
 893              	ascii_ctrl_bit_clear:
 894              	.LFB12:
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_ctrl_bit_clear(unsigned char x)
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 895              		.loc 1 181 0
 896              		.cfi_startproc
 897              		@ args = 0, pretend = 0, frame = 16
 898              		@ frame_needed = 1, uses_anonymous_args = 0
 899 0434 80B5     		push	{r7, lr}
 900              		.cfi_def_cfa_offset 8
 901              		.cfi_offset 7, -8
 902              		.cfi_offset 14, -4
 903 0436 84B0     		sub	sp, sp, #16
 904              		.cfi_def_cfa_offset 24
 905 0438 00AF     		add	r7, sp, #0
 906              		.cfi_def_cfa_register 7
 907 043a 0200     		movs	r2, r0
 908 043c FB1D     		adds	r3, r7, #7
 909 043e 1A70     		strb	r2, [r3]
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     unsigned char  c;
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     c = *GPIOE_ODR_LOW;
 910              		.loc 1 183 0
 911 0440 0F4A     		ldr	r2, .L49
 912 0442 0F23     		movs	r3, #15
 913 0444 FB18     		adds	r3, r7, r3
 914 0446 1278     		ldrb	r2, [r2]
 915 0448 1A70     		strb	r2, [r3]
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     c &= (B_SELECT | ~x);
 916              		.loc 1 184 0
 917 044a FB1D     		adds	r3, r7, #7
 918 044c 1B78     		ldrb	r3, [r3]
 919 044e 5BB2     		sxtb	r3, r3
 920 0450 DB43     		mvns	r3, r3
 921 0452 5BB2     		sxtb	r3, r3
 922 0454 0422     		movs	r2, #4
 923 0456 1343     		orrs	r3, r2
 924 0458 5BB2     		sxtb	r3, r3
 925 045a 0F22     		movs	r2, #15
 926 045c BA18     		adds	r2, r7, r2
 927 045e 1278     		ldrb	r2, [r2]
 928 0460 52B2     		sxtb	r2, r2
 929 0462 1340     		ands	r3, r2
 930 0464 5AB2     		sxtb	r2, r3
 931 0466 0F23     		movs	r3, #15
 932 0468 FB18     		adds	r3, r7, r3
 933 046a 1A70     		strb	r2, [r3]
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****    *GPIOE_ODR_LOW = c;
 934              		.loc 1 185 0
 935 046c 044A     		ldr	r2, .L49
 936 046e 0F23     		movs	r3, #15
 937 0470 FB18     		adds	r3, r7, r3
 938 0472 1B78     		ldrb	r3, [r3]
 939 0474 1370     		strb	r3, [r2]
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 940              		.loc 1 186 0
 941 0476 C046     		nop
 942 0478 BD46     		mov	sp, r7
 943 047a 04B0     		add	sp, sp, #16
 944              		@ sp needed
 945 047c 80BD     		pop	{r7, pc}
 946              	.L50:
 947 047e C046     		.align	2
 948              	.L49:
 949 0480 14100240 		.word	1073877012
 950              		.cfi_endproc
 951              	.LFE12:
 953              		.align	1
 954              		.global	ascii_write_controller
 955              		.syntax unified
 956              		.code	16
 957              		.thumb_func
 958              		.fpu softvfp
 960              	ascii_write_controller:
 961              	.LFB13:
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_write_controller( unsigned char c)
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 962              		.loc 1 189 0
 963              		.cfi_startproc
 964              		@ args = 0, pretend = 0, frame = 8
 965              		@ frame_needed = 1, uses_anonymous_args = 0
 966 0484 80B5     		push	{r7, lr}
 967              		.cfi_def_cfa_offset 8
 968              		.cfi_offset 7, -8
 969              		.cfi_offset 14, -4
 970 0486 82B0     		sub	sp, sp, #8
 971              		.cfi_def_cfa_offset 16
 972 0488 00AF     		add	r7, sp, #0
 973              		.cfi_def_cfa_register 7
 974 048a 0200     		movs	r2, r0
 975 048c FB1D     		adds	r3, r7, #7
 976 048e 1A70     		strb	r2, [r3]
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_set(B_E);      // E = 1
 977              		.loc 1 190 0
 978 0490 4020     		movs	r0, #64
 979 0492 FFF7FEFF 		bl	ascii_ctrl_bit_set
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     *GPIOE_ODR_HIGH = c;
 980              		.loc 1 191 0
 981 0496 064A     		ldr	r2, .L52
 982 0498 FB1D     		adds	r3, r7, #7
 983 049a 1B78     		ldrb	r3, [r3]
 984 049c 1370     		strb	r3, [r2]
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_clear(B_E);    // E = 0
 985              		.loc 1 192 0
 986 049e 4020     		movs	r0, #64
 987 04a0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_250ns();
 988              		.loc 1 193 0
 989 04a4 FFF7FEFF 		bl	delay_250ns
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 990              		.loc 1 194 0
 991 04a8 C046     		nop
 992 04aa BD46     		mov	sp, r7
 993 04ac 02B0     		add	sp, sp, #8
 994              		@ sp needed
 995 04ae 80BD     		pop	{r7, pc}
 996              	.L53:
 997              		.align	2
 998              	.L52:
 999 04b0 15100240 		.word	1073877013
 1000              		.cfi_endproc
 1001              	.LFE13:
 1003              		.align	1
 1004              		.global	ascii_write_cmd
 1005              		.syntax unified
 1006              		.code	16
 1007              		.thumb_func
 1008              		.fpu softvfp
 1010              	ascii_write_cmd:
 1011              	.LFB14:
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_write_cmd(unsigned char c)
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1012              		.loc 1 197 0
 1013              		.cfi_startproc
 1014              		@ args = 0, pretend = 0, frame = 8
 1015              		@ frame_needed = 1, uses_anonymous_args = 0
 1016 04b4 80B5     		push	{r7, lr}
 1017              		.cfi_def_cfa_offset 8
 1018              		.cfi_offset 7, -8
 1019              		.cfi_offset 14, -4
 1020 04b6 82B0     		sub	sp, sp, #8
 1021              		.cfi_def_cfa_offset 16
 1022 04b8 00AF     		add	r7, sp, #0
 1023              		.cfi_def_cfa_register 7
 1024 04ba 0200     		movs	r2, r0
 1025 04bc FB1D     		adds	r3, r7, #7
 1026 04be 1A70     		strb	r2, [r3]
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_clear(B_RS | B_RW);    // "|" = bitvis eller
 1027              		.loc 1 198 0
 1028 04c0 0320     		movs	r0, #3
 1029 04c2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_controller(c);
 1030              		.loc 1 199 0
 1031 04c6 FB1D     		adds	r3, r7, #7
 1032 04c8 1B78     		ldrb	r3, [r3]
 1033 04ca 1800     		movs	r0, r3
 1034 04cc FFF7FEFF 		bl	ascii_write_controller
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1035              		.loc 1 200 0
 1036 04d0 C046     		nop
 1037 04d2 BD46     		mov	sp, r7
 1038 04d4 02B0     		add	sp, sp, #8
 1039              		@ sp needed
 1040 04d6 80BD     		pop	{r7, pc}
 1041              		.cfi_endproc
 1042              	.LFE14:
 1044              		.align	1
 1045              		.global	ascii_write_data
 1046              		.syntax unified
 1047              		.code	16
 1048              		.thumb_func
 1049              		.fpu softvfp
 1051              	ascii_write_data:
 1052              	.LFB15:
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_write_data(unsigned char c)
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1053              		.loc 1 204 0
 1054              		.cfi_startproc
 1055              		@ args = 0, pretend = 0, frame = 8
 1056              		@ frame_needed = 1, uses_anonymous_args = 0
 1057 04d8 80B5     		push	{r7, lr}
 1058              		.cfi_def_cfa_offset 8
 1059              		.cfi_offset 7, -8
 1060              		.cfi_offset 14, -4
 1061 04da 82B0     		sub	sp, sp, #8
 1062              		.cfi_def_cfa_offset 16
 1063 04dc 00AF     		add	r7, sp, #0
 1064              		.cfi_def_cfa_register 7
 1065 04de 0200     		movs	r2, r0
 1066 04e0 FB1D     		adds	r3, r7, #7
 1067 04e2 1A70     		strb	r2, [r3]
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_clear(B_RW);
 1068              		.loc 1 205 0
 1069 04e4 0220     		movs	r0, #2
 1070 04e6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_set(B_RS);
 1071              		.loc 1 206 0
 1072 04ea 0120     		movs	r0, #1
 1073 04ec FFF7FEFF 		bl	ascii_ctrl_bit_set
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_controller(c);
 1074              		.loc 1 207 0
 1075 04f0 FB1D     		adds	r3, r7, #7
 1076 04f2 1B78     		ldrb	r3, [r3]
 1077 04f4 1800     		movs	r0, r3
 1078 04f6 FFF7FEFF 		bl	ascii_write_controller
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1079              		.loc 1 208 0
 1080 04fa C046     		nop
 1081 04fc BD46     		mov	sp, r7
 1082 04fe 02B0     		add	sp, sp, #8
 1083              		@ sp needed
 1084 0500 80BD     		pop	{r7, pc}
 1085              		.cfi_endproc
 1086              	.LFE15:
 1088              		.align	1
 1089              		.global	ascii_read_controller
 1090              		.syntax unified
 1091              		.code	16
 1092              		.thumb_func
 1093              		.fpu softvfp
 1095              	ascii_read_controller:
 1096              	.LFB16:
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** unsigned char ascii_read_controller(void)
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1097              		.loc 1 211 0
 1098              		.cfi_startproc
 1099              		@ args = 0, pretend = 0, frame = 8
 1100              		@ frame_needed = 1, uses_anonymous_args = 0
 1101 0502 80B5     		push	{r7, lr}
 1102              		.cfi_def_cfa_offset 8
 1103              		.cfi_offset 7, -8
 1104              		.cfi_offset 14, -4
 1105 0504 82B0     		sub	sp, sp, #8
 1106              		.cfi_def_cfa_offset 16
 1107 0506 00AF     		add	r7, sp, #0
 1108              		.cfi_def_cfa_register 7
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     unsigned char c;
 213:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_set(B_E);
 1109              		.loc 1 213 0
 1110 0508 4020     		movs	r0, #64
 1111 050a FFF7FEFF 		bl	ascii_ctrl_bit_set
 214:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_250ns();
 1112              		.loc 1 214 0
 1113 050e FFF7FEFF 		bl	delay_250ns
 215:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_250ns();
 1114              		.loc 1 215 0
 1115 0512 FFF7FEFF 		bl	delay_250ns
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     c = *GPIOE_IDR_HIGH;
 1116              		.loc 1 216 0
 1117 0516 064A     		ldr	r2, .L58
 1118 0518 FB1D     		adds	r3, r7, #7
 1119 051a 1278     		ldrb	r2, [r2]
 1120 051c 1A70     		strb	r2, [r3]
 217:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_clear(B_E);
 1121              		.loc 1 217 0
 1122 051e 4020     		movs	r0, #64
 1123 0520 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     return c;
 1124              		.loc 1 218 0
 1125 0524 FB1D     		adds	r3, r7, #7
 1126 0526 1B78     		ldrb	r3, [r3]
 219:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1127              		.loc 1 219 0
 1128 0528 1800     		movs	r0, r3
 1129 052a BD46     		mov	sp, r7
 1130 052c 02B0     		add	sp, sp, #8
 1131              		@ sp needed
 1132 052e 80BD     		pop	{r7, pc}
 1133              	.L59:
 1134              		.align	2
 1135              	.L58:
 1136 0530 11100240 		.word	1073877009
 1137              		.cfi_endproc
 1138              	.LFE16:
 1140              		.align	1
 1141              		.global	ascii_read_status
 1142              		.syntax unified
 1143              		.code	16
 1144              		.thumb_func
 1145              		.fpu softvfp
 1147              	ascii_read_status:
 1148              	.LFB17:
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** unsigned char ascii_read_status(void)
 222:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1149              		.loc 1 222 0
 1150              		.cfi_startproc
 1151              		@ args = 0, pretend = 0, frame = 8
 1152              		@ frame_needed = 1, uses_anonymous_args = 0
 1153 0534 90B5     		push	{r4, r7, lr}
 1154              		.cfi_def_cfa_offset 12
 1155              		.cfi_offset 4, -12
 1156              		.cfi_offset 7, -8
 1157              		.cfi_offset 14, -4
 1158 0536 83B0     		sub	sp, sp, #12
 1159              		.cfi_def_cfa_offset 24
 1160 0538 00AF     		add	r7, sp, #0
 1161              		.cfi_def_cfa_register 7
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     unsigned char c;
 224:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     *GPIOE_MODER = 0x00005555;
 1162              		.loc 1 224 0
 1163 053a 0B4B     		ldr	r3, .L62
 1164 053c 0B4A     		ldr	r2, .L62+4
 1165 053e 1A60     		str	r2, [r3]
 225:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_set(B_RW);
 1166              		.loc 1 225 0
 1167 0540 0220     		movs	r0, #2
 1168 0542 FFF7FEFF 		bl	ascii_ctrl_bit_set
 226:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_ctrl_bit_clear(B_RS);
 1169              		.loc 1 226 0
 1170 0546 0120     		movs	r0, #1
 1171 0548 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 227:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     c = ascii_read_controller();
 1172              		.loc 1 227 0
 1173 054c FC1D     		adds	r4, r7, #7
 1174 054e FFF7FEFF 		bl	ascii_read_controller
 1175 0552 0300     		movs	r3, r0
 1176 0554 2370     		strb	r3, [r4]
 228:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     *GPIOE_MODER = 0x55555555;
 1177              		.loc 1 228 0
 1178 0556 044B     		ldr	r3, .L62
 1179 0558 054A     		ldr	r2, .L62+8
 1180 055a 1A60     		str	r2, [r3]
 229:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     return c;
 1181              		.loc 1 229 0
 1182 055c FB1D     		adds	r3, r7, #7
 1183 055e 1B78     		ldrb	r3, [r3]
 230:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1184              		.loc 1 230 0
 1185 0560 1800     		movs	r0, r3
 1186 0562 BD46     		mov	sp, r7
 1187 0564 03B0     		add	sp, sp, #12
 1188              		@ sp needed
 1189 0566 90BD     		pop	{r4, r7, pc}
 1190              	.L63:
 1191              		.align	2
 1192              	.L62:
 1193 0568 00100240 		.word	1073876992
 1194 056c 55550000 		.word	21845
 1195 0570 55555555 		.word	1431655765
 1196              		.cfi_endproc
 1197              	.LFE17:
 1199              		.align	1
 1200              		.global	ascii_read_data
 1201              		.syntax unified
 1202              		.code	16
 1203              		.thumb_func
 1204              		.fpu softvfp
 1206              	ascii_read_data:
 1207              	.LFB18:
 231:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** unsigned char ascii_read_data ( void ) 
 232:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1208              		.loc 1 232 0
 1209              		.cfi_startproc
 1210              		@ args = 0, pretend = 0, frame = 8
 1211              		@ frame_needed = 1, uses_anonymous_args = 0
 1212 0574 90B5     		push	{r4, r7, lr}
 1213              		.cfi_def_cfa_offset 12
 1214              		.cfi_offset 4, -12
 1215              		.cfi_offset 7, -8
 1216              		.cfi_offset 14, -4
 1217 0576 83B0     		sub	sp, sp, #12
 1218              		.cfi_def_cfa_offset 24
 1219 0578 00AF     		add	r7, sp, #0
 1220              		.cfi_def_cfa_register 7
 233:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 	unsigned char c;
 234:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 	 *GPIOE_MODER = 0x00005555;
 1221              		.loc 1 234 0
 1222 057a 0B4B     		ldr	r3, .L66
 1223 057c 0B4A     		ldr	r2, .L66+4
 1224 057e 1A60     		str	r2, [r3]
 235:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 	ascii_ctrl_bit_set(B_RW);
 1225              		.loc 1 235 0
 1226 0580 0220     		movs	r0, #2
 1227 0582 FFF7FEFF 		bl	ascii_ctrl_bit_set
 236:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 	ascii_ctrl_bit_set(B_RS);
 1228              		.loc 1 236 0
 1229 0586 0120     		movs	r0, #1
 1230 0588 FFF7FEFF 		bl	ascii_ctrl_bit_set
 237:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 	c = ascii_read_controller();
 1231              		.loc 1 237 0
 1232 058c FC1D     		adds	r4, r7, #7
 1233 058e FFF7FEFF 		bl	ascii_read_controller
 1234 0592 0300     		movs	r3, r0
 1235 0594 2370     		strb	r3, [r4]
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 	 *GPIOE_MODER = 0x55555555; /*sätt portE bit15-bit8 som utgångar*/
 1236              		.loc 1 238 0
 1237 0596 044B     		ldr	r3, .L66
 1238 0598 054A     		ldr	r2, .L66+8
 1239 059a 1A60     		str	r2, [r3]
 239:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 	return c;
 1240              		.loc 1 239 0
 1241 059c FB1D     		adds	r3, r7, #7
 1242 059e 1B78     		ldrb	r3, [r3]
 240:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1243              		.loc 1 240 0
 1244 05a0 1800     		movs	r0, r3
 1245 05a2 BD46     		mov	sp, r7
 1246 05a4 03B0     		add	sp, sp, #12
 1247              		@ sp needed
 1248 05a6 90BD     		pop	{r4, r7, pc}
 1249              	.L67:
 1250              		.align	2
 1251              	.L66:
 1252 05a8 00100240 		.word	1073876992
 1253 05ac 55550000 		.word	21845
 1254 05b0 55555555 		.word	1431655765
 1255              		.cfi_endproc
 1256              	.LFE18:
 1258              		.align	1
 1259              		.global	ascii_wait_ready
 1260              		.syntax unified
 1261              		.code	16
 1262              		.thumb_func
 1263              		.fpu softvfp
 1265              	ascii_wait_ready:
 1266              	.LFB19:
 241:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 242:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_wait_ready( void )
 243:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1267              		.loc 1 243 0
 1268              		.cfi_startproc
 1269              		@ args = 0, pretend = 0, frame = 0
 1270              		@ frame_needed = 1, uses_anonymous_args = 0
 1271 05b4 80B5     		push	{r7, lr}
 1272              		.cfi_def_cfa_offset 8
 1273              		.cfi_offset 7, -8
 1274              		.cfi_offset 14, -4
 1275 05b6 00AF     		add	r7, sp, #0
 1276              		.cfi_def_cfa_register 7
 244:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     while( ( ascii_read_status() & 0x80) == 0x80) ;
 1277              		.loc 1 244 0
 1278 05b8 C046     		nop
 1279              	.L69:
 1280              		.loc 1 244 0 is_stmt 0 discriminator 1
 1281 05ba FFF7FEFF 		bl	ascii_read_status
 1282 05be 0300     		movs	r3, r0
 1283 05c0 1A00     		movs	r2, r3
 1284 05c2 8023     		movs	r3, #128
 1285 05c4 1340     		ands	r3, r2
 1286 05c6 802B     		cmp	r3, #128
 1287 05c8 F7D0     		beq	.L69
 245:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_mikro(8);
 1288              		.loc 1 245 0 is_stmt 1
 1289 05ca 0820     		movs	r0, #8
 1290 05cc FFF7FEFF 		bl	delay_mikro
 246:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1291              		.loc 1 246 0
 1292 05d0 C046     		nop
 1293 05d2 BD46     		mov	sp, r7
 1294              		@ sp needed
 1295 05d4 80BD     		pop	{r7, pc}
 1296              		.cfi_endproc
 1297              	.LFE19:
 1299              		.align	1
 1300              		.global	ascii_write_char
 1301              		.syntax unified
 1302              		.code	16
 1303              		.thumb_func
 1304              		.fpu softvfp
 1306              	ascii_write_char:
 1307              	.LFB20:
 247:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 248:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_write_char(unsigned char c)
 249:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1308              		.loc 1 249 0
 1309              		.cfi_startproc
 1310              		@ args = 0, pretend = 0, frame = 8
 1311              		@ frame_needed = 1, uses_anonymous_args = 0
 1312 05d6 80B5     		push	{r7, lr}
 1313              		.cfi_def_cfa_offset 8
 1314              		.cfi_offset 7, -8
 1315              		.cfi_offset 14, -4
 1316 05d8 82B0     		sub	sp, sp, #8
 1317              		.cfi_def_cfa_offset 16
 1318 05da 00AF     		add	r7, sp, #0
 1319              		.cfi_def_cfa_register 7
 1320 05dc 0200     		movs	r2, r0
 1321 05de FB1D     		adds	r3, r7, #7
 1322 05e0 1A70     		strb	r2, [r3]
 250:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_wait_ready();
 1323              		.loc 1 250 0
 1324 05e2 FFF7FEFF 		bl	ascii_wait_ready
 251:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_data(c);
 1325              		.loc 1 251 0
 1326 05e6 FB1D     		adds	r3, r7, #7
 1327 05e8 1B78     		ldrb	r3, [r3]
 1328 05ea 1800     		movs	r0, r3
 1329 05ec FFF7FEFF 		bl	ascii_write_data
 252:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_mikro(39);
 1330              		.loc 1 252 0
 1331 05f0 2720     		movs	r0, #39
 1332 05f2 FFF7FEFF 		bl	delay_mikro
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     
 254:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1333              		.loc 1 254 0
 1334 05f6 C046     		nop
 1335 05f8 BD46     		mov	sp, r7
 1336 05fa 02B0     		add	sp, sp, #8
 1337              		@ sp needed
 1338 05fc 80BD     		pop	{r7, pc}
 1339              		.cfi_endproc
 1340              	.LFE20:
 1342              		.align	1
 1343              		.global	ascii_init
 1344              		.syntax unified
 1345              		.code	16
 1346              		.thumb_func
 1347              		.fpu softvfp
 1349              	ascii_init:
 1350              	.LFB21:
 255:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_init(void)
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1351              		.loc 1 257 0
 1352              		.cfi_startproc
 1353              		@ args = 0, pretend = 0, frame = 0
 1354              		@ frame_needed = 1, uses_anonymous_args = 0
 1355 05fe 80B5     		push	{r7, lr}
 1356              		.cfi_def_cfa_offset 8
 1357              		.cfi_offset 7, -8
 1358              		.cfi_offset 14, -4
 1359 0600 00AF     		add	r7, sp, #0
 1360              		.cfi_def_cfa_register 7
 258:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_wait_ready();
 1361              		.loc 1 258 0
 1362 0602 FFF7FEFF 		bl	ascii_wait_ready
 259:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_cmd( 0x0C);    /*display on*/
 1363              		.loc 1 259 0
 1364 0606 0C20     		movs	r0, #12
 1365 0608 FFF7FEFF 		bl	ascii_write_cmd
 260:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_mikro(39);
 1366              		.loc 1 260 0
 1367 060c 2720     		movs	r0, #39
 1368 060e FFF7FEFF 		bl	delay_mikro
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_wait_ready();
 1369              		.loc 1 261 0
 1370 0612 FFF7FEFF 		bl	ascii_wait_ready
 262:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_cmd( 0x38);    /*function set*/
 1371              		.loc 1 262 0
 1372 0616 3820     		movs	r0, #56
 1373 0618 FFF7FEFF 		bl	ascii_write_cmd
 263:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_mikro(39);
 1374              		.loc 1 263 0
 1375 061c 2720     		movs	r0, #39
 1376 061e FFF7FEFF 		bl	delay_mikro
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_wait_ready();
 1377              		.loc 1 264 0
 1378 0622 FFF7FEFF 		bl	ascii_wait_ready
 265:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_cmd( 1 );    /*clear display*/
 1379              		.loc 1 265 0
 1380 0626 0120     		movs	r0, #1
 1381 0628 FFF7FEFF 		bl	ascii_write_cmd
 266:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_milli(2);
 1382              		.loc 1 266 0
 1383 062c 0220     		movs	r0, #2
 1384 062e FFF7FEFF 		bl	delay_milli
 267:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_wait_ready();
 1385              		.loc 1 267 0
 1386 0632 FFF7FEFF 		bl	ascii_wait_ready
 268:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_cmd( 6 );    /*entry mode set*/
 1387              		.loc 1 268 0
 1388 0636 0620     		movs	r0, #6
 1389 0638 FFF7FEFF 		bl	ascii_write_cmd
 269:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     delay_mikro(39);
 1390              		.loc 1 269 0
 1391 063c 2720     		movs	r0, #39
 1392 063e FFF7FEFF 		bl	delay_mikro
 270:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1393              		.loc 1 270 0
 1394 0642 C046     		nop
 1395 0644 BD46     		mov	sp, r7
 1396              		@ sp needed
 1397 0646 80BD     		pop	{r7, pc}
 1398              		.cfi_endproc
 1399              	.LFE21:
 1401              		.align	1
 1402              		.global	ascii_gotoxy
 1403              		.syntax unified
 1404              		.code	16
 1405              		.thumb_func
 1406              		.fpu softvfp
 1408              	ascii_gotoxy:
 1409              	.LFB22:
 271:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** 
 272:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** void ascii_gotoxy( unsigned char x, unsigned char y)
 273:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** {
 1410              		.loc 1 273 0
 1411              		.cfi_startproc
 1412              		@ args = 0, pretend = 0, frame = 16
 1413              		@ frame_needed = 1, uses_anonymous_args = 0
 1414 0648 80B5     		push	{r7, lr}
 1415              		.cfi_def_cfa_offset 8
 1416              		.cfi_offset 7, -8
 1417              		.cfi_offset 14, -4
 1418 064a 84B0     		sub	sp, sp, #16
 1419              		.cfi_def_cfa_offset 24
 1420 064c 00AF     		add	r7, sp, #0
 1421              		.cfi_def_cfa_register 7
 1422 064e 0200     		movs	r2, r0
 1423 0650 FB1D     		adds	r3, r7, #7
 1424 0652 1A70     		strb	r2, [r3]
 1425 0654 BB1D     		adds	r3, r7, #6
 1426 0656 0A1C     		adds	r2, r1, #0
 1427 0658 1A70     		strb	r2, [r3]
 274:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_wait_ready();
 1428              		.loc 1 274 0
 1429 065a FFF7FEFF 		bl	ascii_wait_ready
 275:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     unsigned char address;
 276:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     if(y != 1){
 1430              		.loc 1 276 0
 1431 065e BB1D     		adds	r3, r7, #6
 1432 0660 1B78     		ldrb	r3, [r3]
 1433 0662 012B     		cmp	r3, #1
 1434 0664 0BD0     		beq	.L73
 277:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****         address = 0x40 | (x-1);
 1435              		.loc 1 277 0
 1436 0666 FB1D     		adds	r3, r7, #7
 1437 0668 1B78     		ldrb	r3, [r3]
 1438 066a 013B     		subs	r3, r3, #1
 1439 066c DBB2     		uxtb	r3, r3
 1440 066e 5BB2     		sxtb	r3, r3
 1441 0670 4022     		movs	r2, #64
 1442 0672 1343     		orrs	r3, r2
 1443 0674 5AB2     		sxtb	r2, r3
 1444 0676 0F23     		movs	r3, #15
 1445 0678 FB18     		adds	r3, r7, r3
 1446 067a 1A70     		strb	r2, [r3]
 1447 067c 05E0     		b	.L74
 1448              	.L73:
 278:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     }
 279:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     else{
 280:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****         address = x-1;
 1449              		.loc 1 280 0
 1450 067e 0F23     		movs	r3, #15
 1451 0680 FB18     		adds	r3, r7, r3
 1452 0682 FA1D     		adds	r2, r7, #7
 1453 0684 1278     		ldrb	r2, [r2]
 1454 0686 013A     		subs	r2, r2, #1
 1455 0688 1A70     		strb	r2, [r3]
 1456              	.L74:
 281:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     }
 282:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     
 283:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h ****     ascii_write_cmd ( 0x80 | address);
 1457              		.loc 1 283 0
 1458 068a 0F23     		movs	r3, #15
 1459 068c FB18     		adds	r3, r7, r3
 1460 068e 1B78     		ldrb	r3, [r3]
 1461 0690 8022     		movs	r2, #128
 1462 0692 5242     		rsbs	r2, r2, #0
 1463 0694 1343     		orrs	r3, r2
 1464 0696 DBB2     		uxtb	r3, r3
 1465 0698 1800     		movs	r0, r3
 1466 069a FFF7FEFF 		bl	ascii_write_cmd
 284:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\graphicsDriver.h **** }
 1467              		.loc 1 284 0
 1468 069e C046     		nop
 1469 06a0 BD46     		mov	sp, r7
 1470 06a2 04B0     		add	sp, sp, #16
 1471              		@ sp needed
 1472 06a4 80BD     		pop	{r7, pc}
 1473              		.cfi_endproc
 1474              	.LFE22:
 1476              		.global	ball_geometry
 1477              		.data
 1478              		.align	2
 1481              	ball_geometry:
 1482 0000 0C000000 		.word	12
 1483 0004 04000000 		.word	4
 1484 0008 04000000 		.word	4
 1485 000c 00       		.byte	0
 1486 000d 01       		.byte	1
 1487 000e 00       		.byte	0
 1488 000f 02       		.byte	2
 1489 0010 01       		.byte	1
 1490 0011 00       		.byte	0
 1491 0012 01       		.byte	1
 1492 0013 01       		.byte	1
 1493 0014 01       		.byte	1
 1494 0015 02       		.byte	2
 1495 0016 01       		.byte	1
 1496 0017 03       		.byte	3
 1497 0018 02       		.byte	2
 1498 0019 00       		.byte	0
 1499 001a 02       		.byte	2
 1500 001b 01       		.byte	1
 1501 001c 02       		.byte	2
 1502 001d 02       		.byte	2
 1503 001e 02       		.byte	2
 1504 001f 03       		.byte	3
 1505 0020 03       		.byte	3
 1506 0021 01       		.byte	1
 1507 0022 03       		.byte	3
 1508 0023 02       		.byte	2
 1509 0024 00000000 		.space	16
 1509      00000000 
 1509      00000000 
 1509      00000000 
 1510              		.global	paddle_geometry
 1511              		.align	2
 1514              	paddle_geometry:
 1515 0034 00000000 		.word	0
 1516 0038 02000000 		.word	2
 1517 003c 0A000000 		.word	10
 1518 0040 00       		.byte	0
 1519 0041 00       		.byte	0
 1520 0042 00000000 		.space	38
 1520      00000000 
 1520      00000000 
 1520      00000000 
 1520      00000000 
 1521              		.text
 1522              		.align	1
 1523              		.global	set_object_speed
 1524              		.syntax unified
 1525              		.code	16
 1526              		.thumb_func
 1527              		.fpu softvfp
 1529              	set_object_speed:
 1530              	.LFB23:
 1531              		.file 2 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  typedef unsigned char uint8_t;
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  #include "graphicsDriver.h"
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define	GPIO_D			0x40020C00
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO beh�
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste 
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste 
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define	GPIO_E			0x40021000
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 b
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO beh�
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste 
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste 
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define B_E 0x40 // Enable
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define B_RST 0x20 // Reset
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define B_CS2 0x10 // Controller Select 2
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define B_CS1 8 // Controller Select 1
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define B_RW 2 // 0 Write, 1 Read
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define B_RS 1 // 0 Command, 1 Data
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define LCD_ON 0x3F // Display on
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define LCD_OFF 0x3E // Display off
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define LCD_DISP_START 0xC0 // Start address
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define LCD_BUSY 0x80 // Read busy status
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #define MAX_POINTS 20
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** typedef struct tPoint{
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     unsigned char x;
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     unsigned char y;
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }POINT;
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** typedef struct tGeometry{
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      int numpoints;
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      int sizex;
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      int sizey;
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      POINT px[MAX_POINTS];
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }GEOMETRY, *PGEOMETRY;
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** typedef struct tObj{
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     PGEOMETRY geo;
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int dirx,diry;
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int posx,posy;
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     void (* draw)(struct tObj *);
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     void (* clear)(struct tObj *);
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     void (* move)(struct tObj *);
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     void (* set_speed)(struct tObj * , int, int);
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }OBJECT, *POBJECT;
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** GEOMETRY ball_geometry = {
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     12,
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     4,4,
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     {
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {0,1}, {0,2}, {1,0},{1,1},{1,2},
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {1,3},{2,0},{2,1},{2,2},{2,3},
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {3,1},
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {3,2}
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     };
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     GEOMETRY paddle_geometry = {
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     0,
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     2,10,
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     {
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {0,0}
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     };
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void set_object_speed(POBJECT p, int x, int y){
 1532              		.loc 2 89 0
 1533              		.cfi_startproc
 1534              		@ args = 0, pretend = 0, frame = 16
 1535              		@ frame_needed = 1, uses_anonymous_args = 0
 1536 06a6 80B5     		push	{r7, lr}
 1537              		.cfi_def_cfa_offset 8
 1538              		.cfi_offset 7, -8
 1539              		.cfi_offset 14, -4
 1540 06a8 84B0     		sub	sp, sp, #16
 1541              		.cfi_def_cfa_offset 24
 1542 06aa 00AF     		add	r7, sp, #0
 1543              		.cfi_def_cfa_register 7
 1544 06ac F860     		str	r0, [r7, #12]
 1545 06ae B960     		str	r1, [r7, #8]
 1546 06b0 7A60     		str	r2, [r7, #4]
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->dirx = x;
 1547              		.loc 2 90 0
 1548 06b2 FB68     		ldr	r3, [r7, #12]
 1549 06b4 BA68     		ldr	r2, [r7, #8]
 1550 06b6 5A60     		str	r2, [r3, #4]
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->diry = y;
 1551              		.loc 2 91 0
 1552 06b8 FB68     		ldr	r3, [r7, #12]
 1553 06ba 7A68     		ldr	r2, [r7, #4]
 1554 06bc 9A60     		str	r2, [r3, #8]
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 1555              		.loc 2 92 0
 1556 06be C046     		nop
 1557 06c0 BD46     		mov	sp, r7
 1558 06c2 04B0     		add	sp, sp, #16
 1559              		@ sp needed
 1560 06c4 80BD     		pop	{r7, pc}
 1561              		.cfi_endproc
 1562              	.LFE23:
 1564              		.align	1
 1565              		.global	draw_object
 1566              		.syntax unified
 1567              		.code	16
 1568              		.thumb_func
 1569              		.fpu softvfp
 1571              	draw_object:
 1572              	.LFB24:
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void draw_object(POBJECT p){
 1573              		.loc 2 94 0
 1574              		.cfi_startproc
 1575              		@ args = 0, pretend = 0, frame = 24
 1576              		@ frame_needed = 1, uses_anonymous_args = 0
 1577 06c6 80B5     		push	{r7, lr}
 1578              		.cfi_def_cfa_offset 8
 1579              		.cfi_offset 7, -8
 1580              		.cfi_offset 14, -4
 1581 06c8 86B0     		sub	sp, sp, #24
 1582              		.cfi_def_cfa_offset 32
 1583 06ca 00AF     		add	r7, sp, #0
 1584              		.cfi_def_cfa_register 7
 1585 06cc 7860     		str	r0, [r7, #4]
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      POINT *ptr = p->geo->px;
 1586              		.loc 2 95 0
 1587 06ce 7B68     		ldr	r3, [r7, #4]
 1588 06d0 1B68     		ldr	r3, [r3]
 1589 06d2 0C33     		adds	r3, r3, #12
 1590 06d4 7B61     		str	r3, [r7, #20]
 1591              	.LBB2:
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int i = 0; i < p->geo->numpoints; i++){
 1592              		.loc 2 96 0
 1593 06d6 0023     		movs	r3, #0
 1594 06d8 3B61     		str	r3, [r7, #16]
 1595 06da 17E0     		b	.L77
 1596              	.L78:
 1597              	.LBB3:
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         //unsigned int x = p->posx + (p->geo->px->x + i);
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         //unsigned int y = p->posy + (p->geo->px->y+ i);
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****        
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         unsigned int x = p->posx + ptr->x;
 1598              		.loc 2 101 0 discriminator 3
 1599 06dc 7B68     		ldr	r3, [r7, #4]
 1600 06de DB68     		ldr	r3, [r3, #12]
 1601 06e0 7A69     		ldr	r2, [r7, #20]
 1602 06e2 1278     		ldrb	r2, [r2]
 1603 06e4 9B18     		adds	r3, r3, r2
 1604 06e6 FB60     		str	r3, [r7, #12]
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         unsigned int y = p->posy + ptr->y;
 1605              		.loc 2 102 0 discriminator 3
 1606 06e8 7B68     		ldr	r3, [r7, #4]
 1607 06ea 1B69     		ldr	r3, [r3, #16]
 1608 06ec 7A69     		ldr	r2, [r7, #20]
 1609 06ee 5278     		ldrb	r2, [r2, #1]
 1610 06f0 9B18     		adds	r3, r3, r2
 1611 06f2 BB60     		str	r3, [r7, #8]
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         pixel(x,y, 1);
 1612              		.loc 2 104 0 discriminator 3
 1613 06f4 B968     		ldr	r1, [r7, #8]
 1614 06f6 FB68     		ldr	r3, [r7, #12]
 1615 06f8 0122     		movs	r2, #1
 1616 06fa 1800     		movs	r0, r3
 1617 06fc FFF7FEFF 		bl	pixel
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         ptr++;
 1618              		.loc 2 105 0 discriminator 3
 1619 0700 7B69     		ldr	r3, [r7, #20]
 1620 0702 0233     		adds	r3, r3, #2
 1621 0704 7B61     		str	r3, [r7, #20]
 1622              	.LBE3:
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         
 1623              		.loc 2 96 0 discriminator 3
 1624 0706 3B69     		ldr	r3, [r7, #16]
 1625 0708 0133     		adds	r3, r3, #1
 1626 070a 3B61     		str	r3, [r7, #16]
 1627              	.L77:
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         
 1628              		.loc 2 96 0 is_stmt 0 discriminator 1
 1629 070c 7B68     		ldr	r3, [r7, #4]
 1630 070e 1B68     		ldr	r3, [r3]
 1631 0710 1A68     		ldr	r2, [r3]
 1632 0712 3B69     		ldr	r3, [r7, #16]
 1633 0714 9A42     		cmp	r2, r3
 1634 0716 E1DC     		bgt	.L78
 1635              	.LBE2:
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 1636              		.loc 2 107 0 is_stmt 1
 1637 0718 C046     		nop
 1638 071a BD46     		mov	sp, r7
 1639 071c 06B0     		add	sp, sp, #24
 1640              		@ sp needed
 1641 071e 80BD     		pop	{r7, pc}
 1642              		.cfi_endproc
 1643              	.LFE24:
 1645              		.align	1
 1646              		.global	clear_object
 1647              		.syntax unified
 1648              		.code	16
 1649              		.thumb_func
 1650              		.fpu softvfp
 1652              	clear_object:
 1653              	.LFB25:
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void clear_object(POBJECT p){
 1654              		.loc 2 108 0
 1655              		.cfi_startproc
 1656              		@ args = 0, pretend = 0, frame = 24
 1657              		@ frame_needed = 1, uses_anonymous_args = 0
 1658 0720 80B5     		push	{r7, lr}
 1659              		.cfi_def_cfa_offset 8
 1660              		.cfi_offset 7, -8
 1661              		.cfi_offset 14, -4
 1662 0722 86B0     		sub	sp, sp, #24
 1663              		.cfi_def_cfa_offset 32
 1664 0724 00AF     		add	r7, sp, #0
 1665              		.cfi_def_cfa_register 7
 1666 0726 7860     		str	r0, [r7, #4]
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      POINT *ptr = p->geo->px;
 1667              		.loc 2 109 0
 1668 0728 7B68     		ldr	r3, [r7, #4]
 1669 072a 1B68     		ldr	r3, [r3]
 1670 072c 0C33     		adds	r3, r3, #12
 1671 072e 7B61     		str	r3, [r7, #20]
 1672              	.LBB4:
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int i = 0; i < p->geo->numpoints; i++){
 1673              		.loc 2 110 0
 1674 0730 0023     		movs	r3, #0
 1675 0732 3B61     		str	r3, [r7, #16]
 1676 0734 17E0     		b	.L80
 1677              	.L81:
 1678              	.LBB5:
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         unsigned int x = p->posx + ptr->x;
 1679              		.loc 2 111 0 discriminator 3
 1680 0736 7B68     		ldr	r3, [r7, #4]
 1681 0738 DB68     		ldr	r3, [r3, #12]
 1682 073a 7A69     		ldr	r2, [r7, #20]
 1683 073c 1278     		ldrb	r2, [r2]
 1684 073e 9B18     		adds	r3, r3, r2
 1685 0740 FB60     		str	r3, [r7, #12]
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         unsigned int y = p->posy + ptr->y;
 1686              		.loc 2 112 0 discriminator 3
 1687 0742 7B68     		ldr	r3, [r7, #4]
 1688 0744 1B69     		ldr	r3, [r3, #16]
 1689 0746 7A69     		ldr	r2, [r7, #20]
 1690 0748 5278     		ldrb	r2, [r2, #1]
 1691 074a 9B18     		adds	r3, r3, r2
 1692 074c BB60     		str	r3, [r7, #8]
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         pixel(x,y, 0);
 1693              		.loc 2 114 0 discriminator 3
 1694 074e B968     		ldr	r1, [r7, #8]
 1695 0750 FB68     		ldr	r3, [r7, #12]
 1696 0752 0022     		movs	r2, #0
 1697 0754 1800     		movs	r0, r3
 1698 0756 FFF7FEFF 		bl	pixel
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         ptr++;
 1699              		.loc 2 115 0 discriminator 3
 1700 075a 7B69     		ldr	r3, [r7, #20]
 1701 075c 0233     		adds	r3, r3, #2
 1702 075e 7B61     		str	r3, [r7, #20]
 1703              	.LBE5:
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         unsigned int x = p->posx + ptr->x;
 1704              		.loc 2 110 0 discriminator 3
 1705 0760 3B69     		ldr	r3, [r7, #16]
 1706 0762 0133     		adds	r3, r3, #1
 1707 0764 3B61     		str	r3, [r7, #16]
 1708              	.L80:
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         unsigned int x = p->posx + ptr->x;
 1709              		.loc 2 110 0 is_stmt 0 discriminator 1
 1710 0766 7B68     		ldr	r3, [r7, #4]
 1711 0768 1B68     		ldr	r3, [r3]
 1712 076a 1A68     		ldr	r2, [r3]
 1713 076c 3B69     		ldr	r3, [r7, #16]
 1714 076e 9A42     		cmp	r2, r3
 1715 0770 E1DC     		bgt	.L81
 1716              	.LBE4:
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 1717              		.loc 2 119 0 is_stmt 1
 1718 0772 C046     		nop
 1719 0774 BD46     		mov	sp, r7
 1720 0776 06B0     		add	sp, sp, #24
 1721              		@ sp needed
 1722 0778 80BD     		pop	{r7, pc}
 1723              		.cfi_endproc
 1724              	.LFE25:
 1726              		.align	1
 1727              		.global	move_object
 1728              		.syntax unified
 1729              		.code	16
 1730              		.thumb_func
 1731              		.fpu softvfp
 1733              	move_object:
 1734              	.LFB26:
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void move_object(POBJECT p){
 1735              		.loc 2 120 0
 1736              		.cfi_startproc
 1737              		@ args = 0, pretend = 0, frame = 16
 1738              		@ frame_needed = 1, uses_anonymous_args = 0
 1739 077a 80B5     		push	{r7, lr}
 1740              		.cfi_def_cfa_offset 8
 1741              		.cfi_offset 7, -8
 1742              		.cfi_offset 14, -4
 1743 077c 84B0     		sub	sp, sp, #16
 1744              		.cfi_def_cfa_offset 24
 1745 077e 00AF     		add	r7, sp, #0
 1746              		.cfi_def_cfa_register 7
 1747 0780 7860     		str	r0, [r7, #4]
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     clear_object(p);
 1748              		.loc 2 121 0
 1749 0782 7B68     		ldr	r3, [r7, #4]
 1750 0784 1800     		movs	r0, r3
 1751 0786 FFF7FEFF 		bl	clear_object
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->posx = p->posx + p->dirx;
 1752              		.loc 2 123 0
 1753 078a 7B68     		ldr	r3, [r7, #4]
 1754 078c DA68     		ldr	r2, [r3, #12]
 1755 078e 7B68     		ldr	r3, [r7, #4]
 1756 0790 5B68     		ldr	r3, [r3, #4]
 1757 0792 D218     		adds	r2, r2, r3
 1758 0794 7B68     		ldr	r3, [r7, #4]
 1759 0796 DA60     		str	r2, [r3, #12]
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->posy = p->posy + p->diry;
 1760              		.loc 2 124 0
 1761 0798 7B68     		ldr	r3, [r7, #4]
 1762 079a 1A69     		ldr	r2, [r3, #16]
 1763 079c 7B68     		ldr	r3, [r7, #4]
 1764 079e 9B68     		ldr	r3, [r3, #8]
 1765 07a0 D218     		adds	r2, r2, r3
 1766 07a2 7B68     		ldr	r3, [r7, #4]
 1767 07a4 1A61     		str	r2, [r3, #16]
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int px = p->posx;
 1768              		.loc 2 125 0
 1769 07a6 7B68     		ldr	r3, [r7, #4]
 1770 07a8 DB68     		ldr	r3, [r3, #12]
 1771 07aa FB60     		str	r3, [r7, #12]
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int py = p->posy;
 1772              		.loc 2 126 0
 1773 07ac 7B68     		ldr	r3, [r7, #4]
 1774 07ae 1B69     		ldr	r3, [r3, #16]
 1775 07b0 BB60     		str	r3, [r7, #8]
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     draw_object(p);
 1776              		.loc 2 128 0
 1777 07b2 7B68     		ldr	r3, [r7, #4]
 1778 07b4 1800     		movs	r0, r3
 1779 07b6 FFF7FEFF 		bl	draw_object
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 1780              		.loc 2 129 0
 1781 07ba C046     		nop
 1782 07bc BD46     		mov	sp, r7
 1783 07be 04B0     		add	sp, sp, #16
 1784              		@ sp needed
 1785 07c0 80BD     		pop	{r7, pc}
 1786              		.cfi_endproc
 1787              	.LFE26:
 1789              		.align	1
 1790              		.global	move_paddle_object
 1791              		.syntax unified
 1792              		.code	16
 1793              		.thumb_func
 1794              		.fpu softvfp
 1796              	move_paddle_object:
 1797              	.LFB27:
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     void move_paddle_object(POBJECT p){
 1798              		.loc 2 130 0
 1799              		.cfi_startproc
 1800              		@ args = 0, pretend = 0, frame = 16
 1801              		@ frame_needed = 1, uses_anonymous_args = 0
 1802 07c2 80B5     		push	{r7, lr}
 1803              		.cfi_def_cfa_offset 8
 1804              		.cfi_offset 7, -8
 1805              		.cfi_offset 14, -4
 1806 07c4 84B0     		sub	sp, sp, #16
 1807              		.cfi_def_cfa_offset 24
 1808 07c6 00AF     		add	r7, sp, #0
 1809              		.cfi_def_cfa_register 7
 1810 07c8 7860     		str	r0, [r7, #4]
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     clear_rect_object(p);
 1811              		.loc 2 131 0
 1812 07ca 7B68     		ldr	r3, [r7, #4]
 1813 07cc 1800     		movs	r0, r3
 1814 07ce FFF7FEFF 		bl	clear_rect_object
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->posx = p->posx + p->dirx;
 1815              		.loc 2 133 0
 1816 07d2 7B68     		ldr	r3, [r7, #4]
 1817 07d4 DA68     		ldr	r2, [r3, #12]
 1818 07d6 7B68     		ldr	r3, [r7, #4]
 1819 07d8 5B68     		ldr	r3, [r3, #4]
 1820 07da D218     		adds	r2, r2, r3
 1821 07dc 7B68     		ldr	r3, [r7, #4]
 1822 07de DA60     		str	r2, [r3, #12]
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->posy = p->posy + p->diry;
 1823              		.loc 2 134 0
 1824 07e0 7B68     		ldr	r3, [r7, #4]
 1825 07e2 1A69     		ldr	r2, [r3, #16]
 1826 07e4 7B68     		ldr	r3, [r7, #4]
 1827 07e6 9B68     		ldr	r3, [r3, #8]
 1828 07e8 D218     		adds	r2, r2, r3
 1829 07ea 7B68     		ldr	r3, [r7, #4]
 1830 07ec 1A61     		str	r2, [r3, #16]
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int px = p->posx;
 1831              		.loc 2 135 0
 1832 07ee 7B68     		ldr	r3, [r7, #4]
 1833 07f0 DB68     		ldr	r3, [r3, #12]
 1834 07f2 FB60     		str	r3, [r7, #12]
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int py = p->posy;
 1835              		.loc 2 136 0
 1836 07f4 7B68     		ldr	r3, [r7, #4]
 1837 07f6 1B69     		ldr	r3, [r3, #16]
 1838 07f8 BB60     		str	r3, [r7, #8]
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     draw_rect_object(p);
 1839              		.loc 2 138 0
 1840 07fa 7B68     		ldr	r3, [r7, #4]
 1841 07fc 1800     		movs	r0, r3
 1842 07fe FFF7FEFF 		bl	draw_rect_object
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 1843              		.loc 2 139 0
 1844 0802 C046     		nop
 1845 0804 BD46     		mov	sp, r7
 1846 0806 04B0     		add	sp, sp, #16
 1847              		@ sp needed
 1848 0808 80BD     		pop	{r7, pc}
 1849              		.cfi_endproc
 1850              	.LFE27:
 1852              		.align	1
 1853              		.global	draw_rect_object
 1854              		.syntax unified
 1855              		.code	16
 1856              		.thumb_func
 1857              		.fpu softvfp
 1859              	draw_rect_object:
 1860              	.LFB28:
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void draw_rect_object(POBJECT pa){
 1861              		.loc 2 140 0
 1862              		.cfi_startproc
 1863              		@ args = 0, pretend = 0, frame = 16
 1864              		@ frame_needed = 1, uses_anonymous_args = 0
 1865 080a 80B5     		push	{r7, lr}
 1866              		.cfi_def_cfa_offset 8
 1867              		.cfi_offset 7, -8
 1868              		.cfi_offset 14, -4
 1869 080c 84B0     		sub	sp, sp, #16
 1870              		.cfi_def_cfa_offset 24
 1871 080e 00AF     		add	r7, sp, #0
 1872              		.cfi_def_cfa_register 7
 1873 0810 7860     		str	r0, [r7, #4]
 1874              	.LBB6:
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int ii = 0; ii < pa->geo->sizex; ii++){
 1875              		.loc 2 141 0
 1876 0812 0023     		movs	r3, #0
 1877 0814 FB60     		str	r3, [r7, #12]
 1878 0816 1AE0     		b	.L85
 1879              	.L88:
 1880              	.LBB7:
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
 1881              		.loc 2 142 0
 1882 0818 0023     		movs	r3, #0
 1883 081a BB60     		str	r3, [r7, #8]
 1884 081c 0EE0     		b	.L86
 1885              	.L87:
 1886              	.LBB8:
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             pixel(pa->posx + ii, pa->posy + jj, 1);
 1887              		.loc 2 143 0 discriminator 3
 1888 081e 7B68     		ldr	r3, [r7, #4]
 1889 0820 DA68     		ldr	r2, [r3, #12]
 1890 0822 FB68     		ldr	r3, [r7, #12]
 1891 0824 D018     		adds	r0, r2, r3
 1892 0826 7B68     		ldr	r3, [r7, #4]
 1893 0828 1A69     		ldr	r2, [r3, #16]
 1894 082a BB68     		ldr	r3, [r7, #8]
 1895 082c D318     		adds	r3, r2, r3
 1896 082e 0122     		movs	r2, #1
 1897 0830 1900     		movs	r1, r3
 1898 0832 FFF7FEFF 		bl	pixel
 1899              	.LBE8:
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
 1900              		.loc 2 142 0 discriminator 3
 1901 0836 BB68     		ldr	r3, [r7, #8]
 1902 0838 0133     		adds	r3, r3, #1
 1903 083a BB60     		str	r3, [r7, #8]
 1904              	.L86:
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
 1905              		.loc 2 142 0 is_stmt 0 discriminator 1
 1906 083c 7B68     		ldr	r3, [r7, #4]
 1907 083e 1B68     		ldr	r3, [r3]
 1908 0840 9A68     		ldr	r2, [r3, #8]
 1909 0842 BB68     		ldr	r3, [r7, #8]
 1910 0844 9A42     		cmp	r2, r3
 1911 0846 EADC     		bgt	.L87
 1912              	.LBE7:
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int ii = 0; ii < pa->geo->sizex; ii++){
 1913              		.loc 2 141 0 is_stmt 1 discriminator 2
 1914 0848 FB68     		ldr	r3, [r7, #12]
 1915 084a 0133     		adds	r3, r3, #1
 1916 084c FB60     		str	r3, [r7, #12]
 1917              	.L85:
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int ii = 0; ii < pa->geo->sizex; ii++){
 1918              		.loc 2 141 0 is_stmt 0 discriminator 1
 1919 084e 7B68     		ldr	r3, [r7, #4]
 1920 0850 1B68     		ldr	r3, [r3]
 1921 0852 5A68     		ldr	r2, [r3, #4]
 1922 0854 FB68     		ldr	r3, [r7, #12]
 1923 0856 9A42     		cmp	r2, r3
 1924 0858 DEDC     		bgt	.L88
 1925              	.LBE6:
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             }
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 1926              		.loc 2 146 0 is_stmt 1
 1927 085a C046     		nop
 1928 085c BD46     		mov	sp, r7
 1929 085e 04B0     		add	sp, sp, #16
 1930              		@ sp needed
 1931 0860 80BD     		pop	{r7, pc}
 1932              		.cfi_endproc
 1933              	.LFE28:
 1935              		.align	1
 1936              		.global	clear_rect_object
 1937              		.syntax unified
 1938              		.code	16
 1939              		.thumb_func
 1940              		.fpu softvfp
 1942              	clear_rect_object:
 1943              	.LFB29:
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     void clear_rect_object(POBJECT pa){
 1944              		.loc 2 147 0
 1945              		.cfi_startproc
 1946              		@ args = 0, pretend = 0, frame = 16
 1947              		@ frame_needed = 1, uses_anonymous_args = 0
 1948 0862 80B5     		push	{r7, lr}
 1949              		.cfi_def_cfa_offset 8
 1950              		.cfi_offset 7, -8
 1951              		.cfi_offset 14, -4
 1952 0864 84B0     		sub	sp, sp, #16
 1953              		.cfi_def_cfa_offset 24
 1954 0866 00AF     		add	r7, sp, #0
 1955              		.cfi_def_cfa_register 7
 1956 0868 7860     		str	r0, [r7, #4]
 1957              	.LBB9:
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int ii = 0; ii < pa->geo->sizex; ii++){
 1958              		.loc 2 148 0
 1959 086a 0023     		movs	r3, #0
 1960 086c FB60     		str	r3, [r7, #12]
 1961 086e 1AE0     		b	.L90
 1962              	.L93:
 1963              	.LBB10:
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
 1964              		.loc 2 149 0
 1965 0870 0023     		movs	r3, #0
 1966 0872 BB60     		str	r3, [r7, #8]
 1967 0874 0EE0     		b	.L91
 1968              	.L92:
 1969              	.LBB11:
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             pixel(pa->posx + ii, pa->posy + jj, 0);
 1970              		.loc 2 150 0 discriminator 3
 1971 0876 7B68     		ldr	r3, [r7, #4]
 1972 0878 DA68     		ldr	r2, [r3, #12]
 1973 087a FB68     		ldr	r3, [r7, #12]
 1974 087c D018     		adds	r0, r2, r3
 1975 087e 7B68     		ldr	r3, [r7, #4]
 1976 0880 1A69     		ldr	r2, [r3, #16]
 1977 0882 BB68     		ldr	r3, [r7, #8]
 1978 0884 D318     		adds	r3, r2, r3
 1979 0886 0022     		movs	r2, #0
 1980 0888 1900     		movs	r1, r3
 1981 088a FFF7FEFF 		bl	pixel
 1982              	.LBE11:
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
 1983              		.loc 2 149 0 discriminator 3
 1984 088e BB68     		ldr	r3, [r7, #8]
 1985 0890 0133     		adds	r3, r3, #1
 1986 0892 BB60     		str	r3, [r7, #8]
 1987              	.L91:
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         for(int jj = 0 ;  jj < pa->geo->sizey; jj++){
 1988              		.loc 2 149 0 is_stmt 0 discriminator 1
 1989 0894 7B68     		ldr	r3, [r7, #4]
 1990 0896 1B68     		ldr	r3, [r3]
 1991 0898 9A68     		ldr	r2, [r3, #8]
 1992 089a BB68     		ldr	r3, [r7, #8]
 1993 089c 9A42     		cmp	r2, r3
 1994 089e EADC     		bgt	.L92
 1995              	.LBE10:
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int ii = 0; ii < pa->geo->sizex; ii++){
 1996              		.loc 2 148 0 is_stmt 1 discriminator 2
 1997 08a0 FB68     		ldr	r3, [r7, #12]
 1998 08a2 0133     		adds	r3, r3, #1
 1999 08a4 FB60     		str	r3, [r7, #12]
 2000              	.L90:
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     for(int ii = 0; ii < pa->geo->sizex; ii++){
 2001              		.loc 2 148 0 is_stmt 0 discriminator 1
 2002 08a6 7B68     		ldr	r3, [r7, #4]
 2003 08a8 1B68     		ldr	r3, [r3]
 2004 08aa 5A68     		ldr	r2, [r3, #4]
 2005 08ac FB68     		ldr	r3, [r7, #12]
 2006 08ae 9A42     		cmp	r2, r3
 2007 08b0 DEDC     		bgt	.L93
 2008              	.LBE9:
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             }
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 2009              		.loc 2 153 0 is_stmt 1
 2010 08b2 C046     		nop
 2011 08b4 BD46     		mov	sp, r7
 2012 08b6 04B0     		add	sp, sp, #16
 2013              		@ sp needed
 2014 08b8 80BD     		pop	{r7, pc}
 2015              		.cfi_endproc
 2016              	.LFE29:
 2018              		.data
 2019              		.align	2
 2022              	ball:
 2023 0068 00000000 		.word	ball_geometry
 2024 006c 00000000 		.word	0
 2025 0070 00000000 		.word	0
 2026 0074 50000000 		.word	80
 2027 0078 0A000000 		.word	10
 2028 007c 00000000 		.word	draw_rect_object
 2029 0080 00000000 		.word	clear_object
 2030 0084 00000000 		.word	move_object
 2031 0088 00000000 		.word	set_object_speed
 2032              		.align	2
 2035              	paddle1:
 2036 008c 00000000 		.word	paddle_geometry
 2037 0090 00000000 		.word	0
 2038 0094 00000000 		.word	0
 2039 0098 03000000 		.word	3
 2040 009c 1E000000 		.word	30
 2041 00a0 00000000 		.word	draw_rect_object
 2042 00a4 00000000 		.word	clear_rect_object
 2043 00a8 00000000 		.word	move_paddle_object
 2044 00ac 00000000 		.word	set_object_speed
 2045              		.align	2
 2048              	paddle2:
 2049 00b0 00000000 		.word	paddle_geometry
 2050 00b4 00000000 		.word	0
 2051 00b8 00000000 		.word	0
 2052 00bc 7D000000 		.word	125
 2053 00c0 1E000000 		.word	30
 2054 00c4 00000000 		.word	draw_rect_object
 2055 00c8 00000000 		.word	clear_rect_object
 2056 00cc 00000000 		.word	move_paddle_object
 2057 00d0 00000000 		.word	set_object_speed
 2058              		.global	point1
 2059              		.bss
 2060              		.align	2
 2063              	point1:
 2064 0000 00000000 		.space	4
 2065              		.global	point2
 2066              		.align	2
 2069              	point2:
 2070 0004 00000000 		.space	4
 2071              		.section	.start_section,"ax",%progbits
 2072              		.align	1
 2073              		.global	startup
 2074              		.syntax unified
 2075              		.code	16
 2076              		.thumb_func
 2077              		.fpu softvfp
 2079              	startup:
 2080              	.LFB30:
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     static OBJECT ball = {
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     &ball_geometry,
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     0,0,
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     80,10,
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     draw_rect_object,
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     clear_object,
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     move_object,
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     set_object_speed
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     };
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     static OBJECT paddle1 = {
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         &paddle_geometry,
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         0,0,
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         3,30,
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         draw_rect_object,
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         clear_rect_object,
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         move_paddle_object,
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         set_object_speed
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         };
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          static OBJECT paddle2 = {
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         &paddle_geometry,
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         0,0,
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         125,30,
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         draw_rect_object,
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         clear_rect_object,
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         move_paddle_object,
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         set_object_speed
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         };
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int point1 = 0;
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int point2 = 0;
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void startup ( void )
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {
 2081              		.loc 2 186 0
 2082              		.cfi_startproc
 2083              		@ Naked Function: prologue and epilogue provided by programmer.
 2084              		@ args = 0, pretend = 0, frame = 0
 2085              		@ frame_needed = 1, uses_anonymous_args = 0
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** __asm volatile(
 2086              		.loc 2 187 0
 2087              		.syntax divided
 2088              	@ 187 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5/startup.c" 1
 2089 0000 0248     		 LDR R0,=0x2001C000
 2090 0002 8546     	 MOV SP,R0
 2091 0004 FFF7FEFF 	 BL main
 2092 0008 FEE7     	_exit: B .
 2093              	
 2094              	@ 0 "" 2
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	" MOV SP,R0\n"
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	" BL main\n"				/* call main */
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	"_exit: B .\n"				/* never return */
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	) ;
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 2095              		.loc 2 193 0
 2096              		.thumb
 2097              		.syntax unified
 2098 000a C046     		nop
 2099              		.cfi_endproc
 2100              	.LFE30:
 2102              		.text
 2103              		.align	1
 2104              		.global	init_app
 2105              		.syntax unified
 2106              		.code	16
 2107              		.thumb_func
 2108              		.fpu softvfp
 2110              	init_app:
 2111              	.LFB31:
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void init_app(void){
 2112              		.loc 2 194 0
 2113              		.cfi_startproc
 2114              		@ args = 0, pretend = 0, frame = 0
 2115              		@ frame_needed = 1, uses_anonymous_args = 0
 2116 08ba 80B5     		push	{r7, lr}
 2117              		.cfi_def_cfa_offset 8
 2118              		.cfi_offset 7, -8
 2119              		.cfi_offset 14, -4
 2120 08bc 00AF     		add	r7, sp, #0
 2121              		.cfi_def_cfa_register 7
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *GPIOE_MODER = 0x55555555;
 2122              		.loc 2 195 0
 2123 08be 0E4B     		ldr	r3, .L96
 2124 08c0 0E4A     		ldr	r2, .L96+4
 2125 08c2 1A60     		str	r2, [r3]
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	/*sätter våra in och ut portar*/
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	*GPIOE_OTYPER = 0x00000000;
 2126              		.loc 2 197 0
 2127 08c4 0E4B     		ldr	r3, .L96+8
 2128 08c6 0022     		movs	r2, #0
 2129 08c8 1A80     		strh	r2, [r3]
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	*GPIOE_PUPDR = 0x55550000;
 2130              		.loc 2 198 0
 2131 08ca 0E4B     		ldr	r3, .L96+12
 2132 08cc 0E4A     		ldr	r2, .L96+16
 2133 08ce 1A60     		str	r2, [r3]
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *GPIOE_OSPEDER = 0x00005555;
 2134              		.loc 2 199 0
 2135 08d0 0E4B     		ldr	r3, .L96+20
 2136 08d2 0F4A     		ldr	r2, .L96+24
 2137 08d4 1A60     		str	r2, [r3]
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	//*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *GPIOD_MODER = 0x55005555;
 2138              		.loc 2 202 0
 2139 08d6 0F4B     		ldr	r3, .L96+28
 2140 08d8 0F4A     		ldr	r2, .L96+32
 2141 08da 1A60     		str	r2, [r3]
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	/*sätter våra in och ut portar*/
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	*GPIOD_OTYPER = 0x70;
 2142              		.loc 2 204 0
 2143 08dc 0F4B     		ldr	r3, .L96+36
 2144 08de 7022     		movs	r2, #112
 2145 08e0 1A80     		strh	r2, [r3]
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	*GPIOD_PUPDR = 0x0AA;
 2146              		.loc 2 205 0
 2147 08e2 0F4B     		ldr	r3, .L96+40
 2148 08e4 AA22     		movs	r2, #170
 2149 08e6 1A60     		str	r2, [r3]
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
 2150              		.loc 2 206 0
 2151 08e8 0E4B     		ldr	r3, .L96+44
 2152 08ea 0E4A     		ldr	r2, .L96+44
 2153 08ec 1278     		ldrb	r2, [r2]
 2154 08ee D2B2     		uxtb	r2, r2
 2155 08f0 1A70     		strb	r2, [r3]
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 2156              		.loc 2 208 0
 2157 08f2 C046     		nop
 2158 08f4 BD46     		mov	sp, r7
 2159              		@ sp needed
 2160 08f6 80BD     		pop	{r7, pc}
 2161              	.L97:
 2162              		.align	2
 2163              	.L96:
 2164 08f8 00100240 		.word	1073876992
 2165 08fc 55555555 		.word	1431655765
 2166 0900 04100240 		.word	1073876996
 2167 0904 0C100240 		.word	1073877004
 2168 0908 00005555 		.word	1431633920
 2169 090c 08100240 		.word	1073877000
 2170 0910 55550000 		.word	21845
 2171 0914 000C0240 		.word	1073875968
 2172 0918 55550055 		.word	1426085205
 2173 091c 040C0240 		.word	1073875972
 2174 0920 0C0C0240 		.word	1073875980
 2175 0924 150C0240 		.word	1073875989
 2176              		.cfi_endproc
 2177              	.LFE31:
 2179              		.align	1
 2180              		.global	getCol
 2181              		.syntax unified
 2182              		.code	16
 2183              		.thumb_func
 2184              		.fpu softvfp
 2186              	getCol:
 2187              	.LFB32:
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     int getCol ( void )
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {
 2188              		.loc 2 210 0
 2189              		.cfi_startproc
 2190              		@ args = 0, pretend = 0, frame = 8
 2191              		@ frame_needed = 1, uses_anonymous_args = 0
 2192 0928 80B5     		push	{r7, lr}
 2193              		.cfi_def_cfa_offset 8
 2194              		.cfi_offset 7, -8
 2195              		.cfi_offset 14, -4
 2196 092a 82B0     		sub	sp, sp, #8
 2197              		.cfi_def_cfa_offset 16
 2198 092c 00AF     		add	r7, sp, #0
 2199              		.cfi_def_cfa_register 7
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	/*om nÃ¥gon tangent i aktiverad rad Ã¤r nedtryckt sÃ¥ skall dess kolumn nummer returneras. A
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	unsigned char c;
 213:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	c = *GPIOD_IDR_HIGH;
 2200              		.loc 2 213 0
 2201 092e 124A     		ldr	r2, .L104
 2202 0930 FB1D     		adds	r3, r7, #7
 2203 0932 1278     		ldrb	r2, [r2]
 2204 0934 1A70     		strb	r2, [r3]
 214:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	if ( c & 0x8 ) return 4;
 2205              		.loc 2 214 0
 2206 0936 FB1D     		adds	r3, r7, #7
 2207 0938 1B78     		ldrb	r3, [r3]
 2208 093a 0822     		movs	r2, #8
 2209 093c 1340     		ands	r3, r2
 2210 093e 01D0     		beq	.L99
 2211              		.loc 2 214 0 is_stmt 0 discriminator 1
 2212 0940 0423     		movs	r3, #4
 2213 0942 15E0     		b	.L100
 2214              	.L99:
 215:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	if ( c & 0x4 ) return 3;
 2215              		.loc 2 215 0 is_stmt 1
 2216 0944 FB1D     		adds	r3, r7, #7
 2217 0946 1B78     		ldrb	r3, [r3]
 2218 0948 0422     		movs	r2, #4
 2219 094a 1340     		ands	r3, r2
 2220 094c 01D0     		beq	.L101
 2221              		.loc 2 215 0 is_stmt 0 discriminator 1
 2222 094e 0323     		movs	r3, #3
 2223 0950 0EE0     		b	.L100
 2224              	.L101:
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	if ( c & 0x2 ) return 2;
 2225              		.loc 2 216 0 is_stmt 1
 2226 0952 FB1D     		adds	r3, r7, #7
 2227 0954 1B78     		ldrb	r3, [r3]
 2228 0956 0222     		movs	r2, #2
 2229 0958 1340     		ands	r3, r2
 2230 095a 01D0     		beq	.L102
 2231              		.loc 2 216 0 is_stmt 0 discriminator 1
 2232 095c 0223     		movs	r3, #2
 2233 095e 07E0     		b	.L100
 2234              	.L102:
 217:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	if ( c & 0x1 ) return 1;
 2235              		.loc 2 217 0 is_stmt 1
 2236 0960 FB1D     		adds	r3, r7, #7
 2237 0962 1B78     		ldrb	r3, [r3]
 2238 0964 0122     		movs	r2, #1
 2239 0966 1340     		ands	r3, r2
 2240 0968 01D0     		beq	.L103
 2241              		.loc 2 217 0 is_stmt 0 discriminator 1
 2242 096a 0123     		movs	r3, #1
 2243 096c 00E0     		b	.L100
 2244              	.L103:
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	return 0;
 2245              		.loc 2 218 0 is_stmt 1
 2246 096e 0023     		movs	r3, #0
 2247              	.L100:
 219:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 2248              		.loc 2 219 0
 2249 0970 1800     		movs	r0, r3
 2250 0972 BD46     		mov	sp, r7
 2251 0974 02B0     		add	sp, sp, #8
 2252              		@ sp needed
 2253 0976 80BD     		pop	{r7, pc}
 2254              	.L105:
 2255              		.align	2
 2256              	.L104:
 2257 0978 110C0240 		.word	1073875985
 2258              		.cfi_endproc
 2259              	.LFE32:
 2261              		.align	1
 2262              		.global	activateRow
 2263              		.syntax unified
 2264              		.code	16
 2265              		.thumb_func
 2266              		.fpu softvfp
 2268              	activateRow:
 2269              	.LFB33:
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void activateRow ( unsigned int row )
 222:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {
 2270              		.loc 2 222 0
 2271              		.cfi_startproc
 2272              		@ args = 0, pretend = 0, frame = 8
 2273              		@ frame_needed = 1, uses_anonymous_args = 0
 2274 097c 80B5     		push	{r7, lr}
 2275              		.cfi_def_cfa_offset 8
 2276              		.cfi_offset 7, -8
 2277              		.cfi_offset 14, -4
 2278 097e 82B0     		sub	sp, sp, #8
 2279              		.cfi_def_cfa_offset 16
 2280 0980 00AF     		add	r7, sp, #0
 2281              		.cfi_def_cfa_register 7
 2282 0982 7860     		str	r0, [r7, #4]
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	/*ativerar raden fÃ¶r den nedtryckta tangented och man borde deaktivera de andra*/
 224:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	switch ( row )
 2283              		.loc 2 224 0
 2284 0984 7B68     		ldr	r3, [r7, #4]
 2285 0986 042B     		cmp	r3, #4
 2286 0988 19D8     		bhi	.L114
 2287 098a 7B68     		ldr	r3, [r7, #4]
 2288 098c 9A00     		lsls	r2, r3, #2
 2289 098e 0E4B     		ldr	r3, .L115
 2290 0990 D318     		adds	r3, r2, r3
 2291 0992 1B68     		ldr	r3, [r3]
 2292 0994 9F46     		mov	pc, r3
 2293              		.section	.rodata
 2294              		.align	2
 2295              	.L109:
 2296 0000 B6090000 		.word	.L108
 2297 0004 96090000 		.word	.L110
 2298 0008 9E090000 		.word	.L111
 2299 000c A6090000 		.word	.L112
 2300 0010 AE090000 		.word	.L113
 2301              		.text
 2302              	.L110:
 225:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	{
 226:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	case 1: *GPIOD_ODR_HIGH = 0x10; break;
 2303              		.loc 2 226 0
 2304 0996 0D4B     		ldr	r3, .L115+4
 2305 0998 1022     		movs	r2, #16
 2306 099a 1A70     		strb	r2, [r3]
 2307 099c 0FE0     		b	.L107
 2308              	.L111:
 227:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	case 2: *GPIOD_ODR_HIGH = 0x20; break;
 2309              		.loc 2 227 0
 2310 099e 0B4B     		ldr	r3, .L115+4
 2311 09a0 2022     		movs	r2, #32
 2312 09a2 1A70     		strb	r2, [r3]
 2313 09a4 0BE0     		b	.L107
 2314              	.L112:
 228:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	case 3: *GPIOD_ODR_HIGH = 0x40; break;
 2315              		.loc 2 228 0
 2316 09a6 094B     		ldr	r3, .L115+4
 2317 09a8 4022     		movs	r2, #64
 2318 09aa 1A70     		strb	r2, [r3]
 2319 09ac 07E0     		b	.L107
 2320              	.L113:
 229:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	case 4: *GPIOD_ODR_HIGH = 0x80; break;
 2321              		.loc 2 229 0
 2322 09ae 074B     		ldr	r3, .L115+4
 2323 09b0 8022     		movs	r2, #128
 2324 09b2 1A70     		strb	r2, [r3]
 2325 09b4 03E0     		b	.L107
 2326              	.L108:
 230:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	case 0: *GPIOD_ODR_HIGH = 0x00; break;
 2327              		.loc 2 230 0
 2328 09b6 054B     		ldr	r3, .L115+4
 2329 09b8 0022     		movs	r2, #0
 2330 09ba 1A70     		strb	r2, [r3]
 2331 09bc C046     		nop
 2332              	.L107:
 2333              	.L114:
 231:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	}
 232:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 2334              		.loc 2 232 0
 2335 09be C046     		nop
 2336 09c0 BD46     		mov	sp, r7
 2337 09c2 02B0     		add	sp, sp, #8
 2338              		@ sp needed
 2339 09c4 80BD     		pop	{r7, pc}
 2340              	.L116:
 2341 09c6 C046     		.align	2
 2342              	.L115:
 2343 09c8 00000000 		.word	.L109
 2344 09cc 150C0240 		.word	1073875989
 2345              		.cfi_endproc
 2346              	.LFE33:
 2348              		.section	.rodata
 2349              		.align	2
 2350              	.LC0:
 2351 0014 01       		.byte	1
 2352 0015 02       		.byte	2
 2353 0016 03       		.byte	3
 2354 0017 0A       		.byte	10
 2355 0018 04       		.byte	4
 2356 0019 05       		.byte	5
 2357 001a 06       		.byte	6
 2358 001b 0B       		.byte	11
 2359 001c 07       		.byte	7
 2360 001d 08       		.byte	8
 2361 001e 09       		.byte	9
 2362 001f 0C       		.byte	12
 2363 0020 0E       		.byte	14
 2364 0021 00       		.byte	0
 2365 0022 0F       		.byte	15
 2366 0023 0D       		.byte	13
 2367              		.text
 2368              		.align	1
 2369              		.global	keyb
 2370              		.syntax unified
 2371              		.code	16
 2372              		.thumb_func
 2373              		.fpu softvfp
 2375              	keyb:
 2376              	.LFB34:
 233:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 234:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     unsigned char keyb ( void ) 
 235:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {
 2377              		.loc 2 235 0
 2378              		.cfi_startproc
 2379              		@ args = 0, pretend = 0, frame = 24
 2380              		@ frame_needed = 1, uses_anonymous_args = 0
 2381 09d0 90B5     		push	{r4, r7, lr}
 2382              		.cfi_def_cfa_offset 12
 2383              		.cfi_offset 4, -12
 2384              		.cfi_offset 7, -8
 2385              		.cfi_offset 14, -4
 2386 09d2 87B0     		sub	sp, sp, #28
 2387              		.cfi_def_cfa_offset 40
 2388 09d4 00AF     		add	r7, sp, #0
 2389              		.cfi_def_cfa_register 7
 236:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 2390              		.loc 2 236 0
 2391 09d6 3B00     		movs	r3, r7
 2392 09d8 164A     		ldr	r2, .L123
 2393 09da 13CA     		ldmia	r2!, {r0, r1, r4}
 2394 09dc 13C3     		stmia	r3!, {r0, r1, r4}
 2395 09de 1268     		ldr	r2, [r2]
 2396 09e0 1A60     		str	r2, [r3]
 237:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	int row, col;
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	for (row=1; row<=4; row++){
 2397              		.loc 2 238 0
 2398 09e2 0123     		movs	r3, #1
 2399 09e4 7B61     		str	r3, [r7, #20]
 2400 09e6 19E0     		b	.L118
 2401              	.L121:
 239:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 		activateRow( row );
 2402              		.loc 2 239 0
 2403 09e8 7B69     		ldr	r3, [r7, #20]
 2404 09ea 1800     		movs	r0, r3
 2405 09ec FFF7FEFF 		bl	activateRow
 240:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 		if( ( col = getCol() ) ) /* om col blir tilldelat nol kommer inte ifsatsen att kÃ¶ras*/
 2406              		.loc 2 240 0
 2407 09f0 FFF7FEFF 		bl	getCol
 2408 09f4 0300     		movs	r3, r0
 2409 09f6 3B61     		str	r3, [r7, #16]
 2410 09f8 3B69     		ldr	r3, [r7, #16]
 2411 09fa 002B     		cmp	r3, #0
 2412 09fc 0BD0     		beq	.L119
 241:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 		{
 242:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 			activateRow( 0 ); /*sÃ¤tter raden til 0 sÃ¥ att den lir nolstÃ¤ld och att avlÃ¤sning eft
 2413              		.loc 2 242 0
 2414 09fe 0020     		movs	r0, #0
 2415 0a00 FFF7FEFF 		bl	activateRow
 243:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 			return key[ 4*(row-1)+(col-1) ];
 2416              		.loc 2 243 0
 2417 0a04 7B69     		ldr	r3, [r7, #20]
 2418 0a06 013B     		subs	r3, r3, #1
 2419 0a08 9A00     		lsls	r2, r3, #2
 2420 0a0a 3B69     		ldr	r3, [r7, #16]
 2421 0a0c 013B     		subs	r3, r3, #1
 2422 0a0e D318     		adds	r3, r2, r3
 2423 0a10 3A00     		movs	r2, r7
 2424 0a12 D35C     		ldrb	r3, [r2, r3]
 2425 0a14 09E0     		b	.L122
 2426              	.L119:
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 		activateRow( row );
 2427              		.loc 2 238 0 discriminator 2
 2428 0a16 7B69     		ldr	r3, [r7, #20]
 2429 0a18 0133     		adds	r3, r3, #1
 2430 0a1a 7B61     		str	r3, [r7, #20]
 2431              	.L118:
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 		activateRow( row );
 2432              		.loc 2 238 0 is_stmt 0 discriminator 1
 2433 0a1c 7B69     		ldr	r3, [r7, #20]
 2434 0a1e 042B     		cmp	r3, #4
 2435 0a20 E2DD     		ble	.L121
 244:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 		}
 245:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	}
 246:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	activateRow ( 0 );
 2436              		.loc 2 246 0 is_stmt 1
 2437 0a22 0020     		movs	r0, #0
 2438 0a24 FFF7FEFF 		bl	activateRow
 247:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 	return 0xFF;
 2439              		.loc 2 247 0
 2440 0a28 FF23     		movs	r3, #255
 2441              	.L122:
 248:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 2442              		.loc 2 248 0 discriminator 1
 2443 0a2a 1800     		movs	r0, r3
 2444 0a2c BD46     		mov	sp, r7
 2445 0a2e 07B0     		add	sp, sp, #28
 2446              		@ sp needed
 2447 0a30 90BD     		pop	{r4, r7, pc}
 2448              	.L124:
 2449 0a32 C046     		.align	2
 2450              	.L123:
 2451 0a34 14000000 		.word	.LC0
 2452              		.cfi_endproc
 2453              	.LFE34:
 2455              		.align	1
 2456              		.global	main
 2457              		.syntax unified
 2458              		.code	16
 2459              		.thumb_func
 2460              		.fpu softvfp
 2462              	main:
 2463              	.LFB35:
 249:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void main(void)
 250:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {   
 2464              		.loc 2 250 0
 2465              		.cfi_startproc
 2466              		@ args = 0, pretend = 0, frame = 24
 2467              		@ frame_needed = 1, uses_anonymous_args = 0
 2468 0a38 90B5     		push	{r4, r7, lr}
 2469              		.cfi_def_cfa_offset 12
 2470              		.cfi_offset 4, -12
 2471              		.cfi_offset 7, -8
 2472              		.cfi_offset 14, -4
 2473 0a3a 87B0     		sub	sp, sp, #28
 2474              		.cfi_def_cfa_offset 40
 2475 0a3c 00AF     		add	r7, sp, #0
 2476              		.cfi_def_cfa_register 7
 251:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     init_app();
 2477              		.loc 2 251 0
 2478 0a3e FFF7FEFF 		bl	init_app
 252:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     char c;
 254:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     POBJECT p = &ball;
 2479              		.loc 2 254 0
 2480 0a42 624B     		ldr	r3, .L136
 2481 0a44 7B61     		str	r3, [r7, #20]
 255:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     POBJECT pa1 = &paddle1;
 2482              		.loc 2 255 0
 2483 0a46 624B     		ldr	r3, .L136+4
 2484 0a48 3B61     		str	r3, [r7, #16]
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     POBJECT pa2 = &paddle2;
 2485              		.loc 2 256 0
 2486 0a4a 624B     		ldr	r3, .L136+8
 2487 0a4c FB60     		str	r3, [r7, #12]
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     graphic_initialize();
 2488              		.loc 2 257 0
 2489 0a4e FFF7FEFF 		bl	graphic_initialize
 258:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     ascii_init();
 2490              		.loc 2 258 0
 2491 0a52 FFF7FEFF 		bl	ascii_init
 259:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****    updatePoints();
 2492              		.loc 2 259 0
 2493 0a56 FFF7FEFF 		bl	updatePoints
 260:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****    graphic_clear_screen();// simulator onely
 2494              		.loc 2 260 0
 2495 0a5a FFF7FEFF 		bl	graphic_clear_screen
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     pa1->draw(pa1);
 2496              		.loc 2 261 0
 2497 0a5e 3B69     		ldr	r3, [r7, #16]
 2498 0a60 5B69     		ldr	r3, [r3, #20]
 2499 0a62 3A69     		ldr	r2, [r7, #16]
 2500 0a64 1000     		movs	r0, r2
 2501 0a66 9847     		blx	r3
 2502              	.LVL0:
 262:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     pa2->draw(pa2);
 2503              		.loc 2 262 0
 2504 0a68 FB68     		ldr	r3, [r7, #12]
 2505 0a6a 5B69     		ldr	r3, [r3, #20]
 2506 0a6c FA68     		ldr	r2, [r7, #12]
 2507 0a6e 1000     		movs	r0, r2
 2508 0a70 9847     		blx	r3
 2509              	.LVL1:
 263:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->set_speed(p,5,0);
 2510              		.loc 2 263 0
 2511 0a72 7B69     		ldr	r3, [r7, #20]
 2512 0a74 1B6A     		ldr	r3, [r3, #32]
 2513 0a76 7869     		ldr	r0, [r7, #20]
 2514 0a78 0022     		movs	r2, #0
 2515 0a7a 0521     		movs	r1, #5
 2516 0a7c 9847     		blx	r3
 2517              	.LVL2:
 2518              	.L135:
 2519              	.LBB12:
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****  while(1){
 265:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      checkForGoals(p);
 2520              		.loc 2 265 0
 2521 0a7e 7B69     		ldr	r3, [r7, #20]
 2522 0a80 1800     		movs	r0, r3
 2523 0a82 FFF7FEFF 		bl	checkForGoals
 266:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 267:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->move(p);
 2524              		.loc 2 267 0
 2525 0a86 7B69     		ldr	r3, [r7, #20]
 2526 0a88 DB69     		ldr	r3, [r3, #28]
 2527 0a8a 7A69     		ldr	r2, [r7, #20]
 2528 0a8c 1000     		movs	r0, r2
 2529 0a8e 9847     		blx	r3
 2530              	.LVL3:
 268:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     pa1->move(pa1);
 2531              		.loc 2 268 0
 2532 0a90 3B69     		ldr	r3, [r7, #16]
 2533 0a92 DB69     		ldr	r3, [r3, #28]
 2534 0a94 3A69     		ldr	r2, [r7, #16]
 2535 0a96 1000     		movs	r0, r2
 2536 0a98 9847     		blx	r3
 2537              	.LVL4:
 269:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     pa2->move(pa2);
 2538              		.loc 2 269 0
 2539 0a9a FB68     		ldr	r3, [r7, #12]
 2540 0a9c DB69     		ldr	r3, [r3, #28]
 2541 0a9e FA68     		ldr	r2, [r7, #12]
 2542 0aa0 1000     		movs	r0, r2
 2543 0aa2 9847     		blx	r3
 2544              	.LVL5:
 270:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      delay_milli(40);
 2545              		.loc 2 270 0
 2546 0aa4 2820     		movs	r0, #40
 2547 0aa6 FFF7FEFF 		bl	delay_milli
 271:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      c = keyb();
 2548              		.loc 2 271 0
 2549 0aaa 0B23     		movs	r3, #11
 2550 0aac FC18     		adds	r4, r7, r3
 2551 0aae FFF7FEFF 		bl	keyb
 2552 0ab2 0300     		movs	r3, r0
 2553 0ab4 2370     		strb	r3, [r4]
 272:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      switch(c)
 2554              		.loc 2 272 0
 2555 0ab6 0B23     		movs	r3, #11
 2556 0ab8 FB18     		adds	r3, r7, r3
 2557 0aba 1B78     		ldrb	r3, [r3]
 2558 0abc 012B     		cmp	r3, #1
 2559 0abe 02D0     		beq	.L127
 2560 0ac0 072B     		cmp	r3, #7
 2561 0ac2 08D0     		beq	.L128
 2562 0ac4 0EE0     		b	.L126
 2563              	.L127:
 273:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      {
 274:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          case 1: pa1->set_speed(pa1,0,-2);
 2564              		.loc 2 274 0
 2565 0ac6 3B69     		ldr	r3, [r7, #16]
 2566 0ac8 1B6A     		ldr	r3, [r3, #32]
 2567 0aca 0222     		movs	r2, #2
 2568 0acc 5242     		rsbs	r2, r2, #0
 2569 0ace 3869     		ldr	r0, [r7, #16]
 2570 0ad0 0021     		movs	r1, #0
 2571 0ad2 9847     		blx	r3
 2572              	.LVL6:
 275:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          break;
 2573              		.loc 2 275 0
 2574 0ad4 06E0     		b	.L126
 2575              	.L128:
 276:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          case 7: pa1->set_speed(pa1,0,2);
 2576              		.loc 2 276 0
 2577 0ad6 3B69     		ldr	r3, [r7, #16]
 2578 0ad8 1B6A     		ldr	r3, [r3, #32]
 2579 0ada 3869     		ldr	r0, [r7, #16]
 2580 0adc 0222     		movs	r2, #2
 2581 0ade 0021     		movs	r1, #0
 2582 0ae0 9847     		blx	r3
 2583              	.LVL7:
 277:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          break;
 2584              		.loc 2 277 0
 2585 0ae2 C046     		nop
 2586              	.L126:
 278:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          //case 3: pa2->set_speed(pa2,0,-2);
 279:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          //case 9: pa2->set_speed(pa2,0,2);
 280:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          }
 281:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          if(pa2->posy < p->posy){
 2587              		.loc 2 281 0
 2588 0ae4 FB68     		ldr	r3, [r7, #12]
 2589 0ae6 1A69     		ldr	r2, [r3, #16]
 2590 0ae8 7B69     		ldr	r3, [r7, #20]
 2591 0aea 1B69     		ldr	r3, [r3, #16]
 2592 0aec 9A42     		cmp	r2, r3
 2593 0aee 05DA     		bge	.L129
 282:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              pa2->set_speed(pa2, 0, 2);
 2594              		.loc 2 282 0
 2595 0af0 FB68     		ldr	r3, [r7, #12]
 2596 0af2 1B6A     		ldr	r3, [r3, #32]
 2597 0af4 F868     		ldr	r0, [r7, #12]
 2598 0af6 0222     		movs	r2, #2
 2599 0af8 0021     		movs	r1, #0
 2600 0afa 9847     		blx	r3
 2601              	.LVL8:
 2602              	.L129:
 283:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              }
 284:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              if(pa2->posy > p->posy){
 2603              		.loc 2 284 0
 2604 0afc FB68     		ldr	r3, [r7, #12]
 2605 0afe 1A69     		ldr	r2, [r3, #16]
 2606 0b00 7B69     		ldr	r3, [r7, #20]
 2607 0b02 1B69     		ldr	r3, [r3, #16]
 2608 0b04 9A42     		cmp	r2, r3
 2609 0b06 06DD     		ble	.L130
 285:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              pa2->set_speed(pa2, 0, -2);
 2610              		.loc 2 285 0
 2611 0b08 FB68     		ldr	r3, [r7, #12]
 2612 0b0a 1B6A     		ldr	r3, [r3, #32]
 2613 0b0c 0222     		movs	r2, #2
 2614 0b0e 5242     		rsbs	r2, r2, #0
 2615 0b10 F868     		ldr	r0, [r7, #12]
 2616 0b12 0021     		movs	r1, #0
 2617 0b14 9847     		blx	r3
 2618              	.LVL9:
 2619              	.L130:
 286:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              }
 287:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          if(p->posy < 1){
 2620              		.loc 2 287 0
 2621 0b16 7B69     		ldr	r3, [r7, #20]
 2622 0b18 1B69     		ldr	r3, [r3, #16]
 2623 0b1a 002B     		cmp	r3, #0
 2624 0b1c 07DC     		bgt	.L131
 288:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              p->set_speed(p,p->dirx,2);
 2625              		.loc 2 288 0
 2626 0b1e 7B69     		ldr	r3, [r7, #20]
 2627 0b20 1C6A     		ldr	r4, [r3, #32]
 2628 0b22 7B69     		ldr	r3, [r7, #20]
 2629 0b24 5968     		ldr	r1, [r3, #4]
 2630 0b26 7B69     		ldr	r3, [r7, #20]
 2631 0b28 0222     		movs	r2, #2
 2632 0b2a 1800     		movs	r0, r3
 2633 0b2c A047     		blx	r4
 2634              	.LVL10:
 2635              	.L131:
 289:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              }
 290:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             if(p->posy > 60){
 2636              		.loc 2 290 0
 2637 0b2e 7B69     		ldr	r3, [r7, #20]
 2638 0b30 1B69     		ldr	r3, [r3, #16]
 2639 0b32 3C2B     		cmp	r3, #60
 2640 0b34 08DD     		ble	.L132
 291:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              p->set_speed(p,p->dirx,-2);
 2641              		.loc 2 291 0
 2642 0b36 7B69     		ldr	r3, [r7, #20]
 2643 0b38 1C6A     		ldr	r4, [r3, #32]
 2644 0b3a 7B69     		ldr	r3, [r7, #20]
 2645 0b3c 5968     		ldr	r1, [r3, #4]
 2646 0b3e 0223     		movs	r3, #2
 2647 0b40 5A42     		rsbs	r2, r3, #0
 2648 0b42 7B69     		ldr	r3, [r7, #20]
 2649 0b44 1800     		movs	r0, r3
 2650 0b46 A047     		blx	r4
 2651              	.LVL11:
 2652              	.L132:
 292:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              }
 293:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              int yy = p->posy;
 2653              		.loc 2 293 0
 2654 0b48 7B69     		ldr	r3, [r7, #20]
 2655 0b4a 1B69     		ldr	r3, [r3, #16]
 2656 0b4c 7B60     		str	r3, [r7, #4]
 294:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              int yy2 = pa2->posy;
 2657              		.loc 2 294 0
 2658 0b4e FB68     		ldr	r3, [r7, #12]
 2659 0b50 1B69     		ldr	r3, [r3, #16]
 2660 0b52 3B60     		str	r3, [r7]
 295:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****              if(p->posx < 6 ){
 2661              		.loc 2 295 0
 2662 0b54 7B69     		ldr	r3, [r7, #20]
 2663 0b56 DB68     		ldr	r3, [r3, #12]
 2664 0b58 052B     		cmp	r3, #5
 2665 0b5a 16DC     		bgt	.L133
 296:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                  if((p->posy+2) > pa1->posy ){
 2666              		.loc 2 296 0
 2667 0b5c 7B69     		ldr	r3, [r7, #20]
 2668 0b5e 1B69     		ldr	r3, [r3, #16]
 2669 0b60 9A1C     		adds	r2, r3, #2
 2670 0b62 3B69     		ldr	r3, [r7, #16]
 2671 0b64 1B69     		ldr	r3, [r3, #16]
 2672 0b66 9A42     		cmp	r2, r3
 2673 0b68 0FDD     		ble	.L133
 297:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                      if( (p->posy +2)<( pa1->posy +10)){
 2674              		.loc 2 297 0
 2675 0b6a 7B69     		ldr	r3, [r7, #20]
 2676 0b6c 1B69     		ldr	r3, [r3, #16]
 2677 0b6e 9A1C     		adds	r2, r3, #2
 2678 0b70 3B69     		ldr	r3, [r7, #16]
 2679 0b72 1B69     		ldr	r3, [r3, #16]
 2680 0b74 0A33     		adds	r3, r3, #10
 2681 0b76 9A42     		cmp	r2, r3
 2682 0b78 07DA     		bge	.L133
 298:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                         p->set_speed(p, 2, p->diry);
 2683              		.loc 2 298 0
 2684 0b7a 7B69     		ldr	r3, [r7, #20]
 2685 0b7c 1C6A     		ldr	r4, [r3, #32]
 2686 0b7e 7B69     		ldr	r3, [r7, #20]
 2687 0b80 9A68     		ldr	r2, [r3, #8]
 2688 0b82 7B69     		ldr	r3, [r7, #20]
 2689 0b84 0221     		movs	r1, #2
 2690 0b86 1800     		movs	r0, r3
 2691 0b88 A047     		blx	r4
 2692              	.LVL12:
 2693              	.L133:
 299:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                      }
 300:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                  }
 301:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             }
 302:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             if(p->posx > 119){
 2694              		.loc 2 302 0
 2695 0b8a 7B69     		ldr	r3, [r7, #20]
 2696 0b8c DB68     		ldr	r3, [r3, #12]
 2697 0b8e 772B     		cmp	r3, #119
 2698 0b90 00DC     		bgt	.LCB2112
 2699 0b92 74E7     		b	.L135	@long jump
 2700              	.LCB2112:
 303:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                  if((p->posy+2) > pa2->posy ){
 2701              		.loc 2 303 0
 2702 0b94 7B69     		ldr	r3, [r7, #20]
 2703 0b96 1B69     		ldr	r3, [r3, #16]
 2704 0b98 9A1C     		adds	r2, r3, #2
 2705 0b9a FB68     		ldr	r3, [r7, #12]
 2706 0b9c 1B69     		ldr	r3, [r3, #16]
 2707 0b9e 9A42     		cmp	r2, r3
 2708 0ba0 00DC     		bgt	.LCB2119
 2709 0ba2 6CE7     		b	.L135	@long jump
 2710              	.LCB2119:
 304:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                      if( (p->posy +2)<( pa2->posy +10)){
 2711              		.loc 2 304 0
 2712 0ba4 7B69     		ldr	r3, [r7, #20]
 2713 0ba6 1B69     		ldr	r3, [r3, #16]
 2714 0ba8 9A1C     		adds	r2, r3, #2
 2715 0baa FB68     		ldr	r3, [r7, #12]
 2716 0bac 1B69     		ldr	r3, [r3, #16]
 2717 0bae 0A33     		adds	r3, r3, #10
 2718 0bb0 9A42     		cmp	r2, r3
 2719 0bb2 00DB     		blt	.LCB2127
 2720 0bb4 63E7     		b	.L135	@long jump
 2721              	.LCB2127:
 305:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                         p->set_speed(p, -2, p->diry);
 2722              		.loc 2 305 0
 2723 0bb6 7B69     		ldr	r3, [r7, #20]
 2724 0bb8 1C6A     		ldr	r4, [r3, #32]
 2725 0bba 7B69     		ldr	r3, [r7, #20]
 2726 0bbc 9A68     		ldr	r2, [r3, #8]
 2727 0bbe 0223     		movs	r3, #2
 2728 0bc0 5942     		rsbs	r1, r3, #0
 2729 0bc2 7B69     		ldr	r3, [r7, #20]
 2730 0bc4 1800     		movs	r0, r3
 2731 0bc6 A047     		blx	r4
 2732              	.LVL13:
 2733              	.LBE12:
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      checkForGoals(p);
 2734              		.loc 2 264 0
 2735 0bc8 59E7     		b	.L135
 2736              	.L137:
 2737 0bca C046     		.align	2
 2738              	.L136:
 2739 0bcc 68000000 		.word	ball
 2740 0bd0 8C000000 		.word	paddle1
 2741 0bd4 B0000000 		.word	paddle2
 2742              		.cfi_endproc
 2743              	.LFE35:
 2745              		.align	1
 2746              		.global	delay_250ns
 2747              		.syntax unified
 2748              		.code	16
 2749              		.thumb_func
 2750              		.fpu softvfp
 2752              	delay_250ns:
 2753              	.LFB36:
 306:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                      }
 307:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                  }
 308:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             }
 309:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****      }      
 310:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     
 311:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 312:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 313:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void delay_250ns(void)
 314:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {
 2754              		.loc 2 314 0
 2755              		.cfi_startproc
 2756              		@ args = 0, pretend = 0, frame = 0
 2757              		@ frame_needed = 1, uses_anonymous_args = 0
 2758 0bd8 80B5     		push	{r7, lr}
 2759              		.cfi_def_cfa_offset 8
 2760              		.cfi_offset 7, -8
 2761              		.cfi_offset 14, -4
 2762 0bda 00AF     		add	r7, sp, #0
 2763              		.cfi_def_cfa_register 7
 315:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *STK_CTRL = 0;
 2764              		.loc 2 315 0
 2765 0bdc 0C4B     		ldr	r3, .L140
 2766 0bde 0022     		movs	r2, #0
 2767 0be0 1A60     		str	r2, [r3]
 316:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *STK_LOAD = (168/4)-1;   // minst 500 ns
 2768              		.loc 2 316 0
 2769 0be2 0C4B     		ldr	r3, .L140+4
 2770 0be4 2922     		movs	r2, #41
 2771 0be6 1A60     		str	r2, [r3]
 317:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *STK_VAL = 0;
 2772              		.loc 2 317 0
 2773 0be8 0B4B     		ldr	r3, .L140+8
 2774 0bea 0022     		movs	r2, #0
 2775 0bec 1A60     		str	r2, [r3]
 318:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *STK_CTRL = 5;
 2776              		.loc 2 318 0
 2777 0bee 084B     		ldr	r3, .L140
 2778 0bf0 0522     		movs	r2, #5
 2779 0bf2 1A60     		str	r2, [r3]
 319:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     while((* STK_CTRL & 0x10000) == 0) ;
 2780              		.loc 2 319 0
 2781 0bf4 C046     		nop
 2782              	.L139:
 2783              		.loc 2 319 0 is_stmt 0 discriminator 1
 2784 0bf6 064B     		ldr	r3, .L140
 2785 0bf8 1A68     		ldr	r2, [r3]
 2786 0bfa 8023     		movs	r3, #128
 2787 0bfc 5B02     		lsls	r3, r3, #9
 2788 0bfe 1340     		ands	r3, r2
 2789 0c00 F9D0     		beq	.L139
 320:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     *STK_CTRL = 0;
 2790              		.loc 2 320 0 is_stmt 1
 2791 0c02 034B     		ldr	r3, .L140
 2792 0c04 0022     		movs	r2, #0
 2793 0c06 1A60     		str	r2, [r3]
 321:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 2794              		.loc 2 321 0
 2795 0c08 C046     		nop
 2796 0c0a BD46     		mov	sp, r7
 2797              		@ sp needed
 2798 0c0c 80BD     		pop	{r7, pc}
 2799              	.L141:
 2800 0c0e C046     		.align	2
 2801              	.L140:
 2802 0c10 10E000E0 		.word	-536813552
 2803 0c14 14E000E0 		.word	-536813548
 2804 0c18 18E000E0 		.word	-536813544
 2805              		.cfi_endproc
 2806              	.LFE36:
 2808              		.global	__aeabi_uidiv
 2809              		.align	1
 2810              		.global	delay_mikro
 2811              		.syntax unified
 2812              		.code	16
 2813              		.thumb_func
 2814              		.fpu softvfp
 2816              	delay_mikro:
 2817              	.LFB37:
 322:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 323:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 324:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void delay_mikro(unsigned int us)
 325:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {
 2818              		.loc 2 325 0
 2819              		.cfi_startproc
 2820              		@ args = 0, pretend = 0, frame = 8
 2821              		@ frame_needed = 1, uses_anonymous_args = 0
 2822 0c1c 80B5     		push	{r7, lr}
 2823              		.cfi_def_cfa_offset 8
 2824              		.cfi_offset 7, -8
 2825              		.cfi_offset 14, -4
 2826 0c1e 82B0     		sub	sp, sp, #8
 2827              		.cfi_def_cfa_offset 16
 2828 0c20 00AF     		add	r7, sp, #0
 2829              		.cfi_def_cfa_register 7
 2830 0c22 7860     		str	r0, [r7, #4]
 326:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #ifdef   SIMULATOR
 327:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     us = us / 1000;
 328:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     us++;
 329:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** #endif
 330:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** us = us / 1000;
 2831              		.loc 2 330 0
 2832 0c24 7A68     		ldr	r2, [r7, #4]
 2833 0c26 FA23     		movs	r3, #250
 2834 0c28 9900     		lsls	r1, r3, #2
 2835 0c2a 1000     		movs	r0, r2
 2836 0c2c FFF7FEFF 		bl	__aeabi_uidiv
 2837              	.LVL14:
 2838 0c30 0300     		movs	r3, r0
 2839 0c32 7B60     		str	r3, [r7, #4]
 331:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     us++;
 2840              		.loc 2 331 0
 2841 0c34 7B68     		ldr	r3, [r7, #4]
 2842 0c36 0133     		adds	r3, r3, #1
 2843 0c38 7B60     		str	r3, [r7, #4]
 332:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     while(us < 0){
 2844              		.loc 2 332 0
 2845 0c3a C046     		nop
 333:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {
 334:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             delay_250ns();
 335:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             delay_250ns();
 336:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             delay_250ns();
 337:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             delay_250ns();
 338:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             us--;
 339:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 340:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 341:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 2846              		.loc 2 341 0
 2847 0c3c C046     		nop
 2848 0c3e BD46     		mov	sp, r7
 2849 0c40 02B0     		add	sp, sp, #8
 2850              		@ sp needed
 2851 0c42 80BD     		pop	{r7, pc}
 2852              		.cfi_endproc
 2853              	.LFE37:
 2855              		.align	1
 2856              		.global	delay_milli
 2857              		.syntax unified
 2858              		.code	16
 2859              		.thumb_func
 2860              		.fpu softvfp
 2862              	delay_milli:
 2863              	.LFB38:
 342:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 343:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void delay_milli(unsigned ms)
 344:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** {
 2864              		.loc 2 344 0
 2865              		.cfi_startproc
 2866              		@ args = 0, pretend = 0, frame = 8
 2867              		@ frame_needed = 1, uses_anonymous_args = 0
 2868 0c44 80B5     		push	{r7, lr}
 2869              		.cfi_def_cfa_offset 8
 2870              		.cfi_offset 7, -8
 2871              		.cfi_offset 14, -4
 2872 0c46 82B0     		sub	sp, sp, #8
 2873              		.cfi_def_cfa_offset 16
 2874 0c48 00AF     		add	r7, sp, #0
 2875              		.cfi_def_cfa_register 7
 2876 0c4a 7860     		str	r0, [r7, #4]
 345:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 346:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     ms = ms/1000;// simulator onely
 2877              		.loc 2 346 0
 2878 0c4c 7A68     		ldr	r2, [r7, #4]
 2879 0c4e FA23     		movs	r3, #250
 2880 0c50 9900     		lsls	r1, r3, #2
 2881 0c52 1000     		movs	r0, r2
 2882 0c54 FFF7FEFF 		bl	__aeabi_uidiv
 2883              	.LVL15:
 2884 0c58 0300     		movs	r3, r0
 2885 0c5a 7B60     		str	r3, [r7, #4]
 347:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     ms++;//simulator
 2886              		.loc 2 347 0
 2887 0c5c 7B68     		ldr	r3, [r7, #4]
 2888 0c5e 0133     		adds	r3, r3, #1
 2889 0c60 7B60     		str	r3, [r7, #4]
 348:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 349:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     while(ms > 0){
 2890              		.loc 2 349 0
 2891 0c62 07E0     		b	.L144
 2892              	.L145:
 350:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {
 351:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             delay_mikro(1000);
 2893              		.loc 2 351 0
 2894 0c64 FA23     		movs	r3, #250
 2895 0c66 9B00     		lsls	r3, r3, #2
 2896 0c68 1800     		movs	r0, r3
 2897 0c6a FFF7FEFF 		bl	delay_mikro
 352:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             ms--;
 2898              		.loc 2 352 0
 2899 0c6e 7B68     		ldr	r3, [r7, #4]
 2900 0c70 013B     		subs	r3, r3, #1
 2901 0c72 7B60     		str	r3, [r7, #4]
 2902              	.L144:
 349:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         {
 2903              		.loc 2 349 0
 2904 0c74 7B68     		ldr	r3, [r7, #4]
 2905 0c76 002B     		cmp	r3, #0
 2906 0c78 F4D1     		bne	.L145
 353:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             
 354:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 355:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 356:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 2907              		.loc 2 356 0
 2908 0c7a C046     		nop
 2909 0c7c BD46     		mov	sp, r7
 2910 0c7e 02B0     		add	sp, sp, #8
 2911              		@ sp needed
 2912 0c80 80BD     		pop	{r7, pc}
 2913              		.cfi_endproc
 2914              	.LFE38:
 2916              		.align	1
 2917              		.global	delay_500ns
 2918              		.syntax unified
 2919              		.code	16
 2920              		.thumb_func
 2921              		.fpu softvfp
 2923              	delay_500ns:
 2924              	.LFB39:
 357:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void delay_500ns(void){
 2925              		.loc 2 357 0
 2926              		.cfi_startproc
 2927              		@ args = 0, pretend = 0, frame = 0
 2928              		@ frame_needed = 1, uses_anonymous_args = 0
 2929 0c82 80B5     		push	{r7, lr}
 2930              		.cfi_def_cfa_offset 8
 2931              		.cfi_offset 7, -8
 2932              		.cfi_offset 14, -4
 2933 0c84 00AF     		add	r7, sp, #0
 2934              		.cfi_def_cfa_register 7
 358:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     delay_250ns();
 2935              		.loc 2 358 0
 2936 0c86 FFF7FEFF 		bl	delay_250ns
 359:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     delay_250ns();
 2937              		.loc 2 359 0
 2938 0c8a FFF7FEFF 		bl	delay_250ns
 360:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 2939              		.loc 2 360 0
 2940 0c8e C046     		nop
 2941 0c90 BD46     		mov	sp, r7
 2942              		@ sp needed
 2943 0c92 80BD     		pop	{r7, pc}
 2944              		.cfi_endproc
 2945              	.LFE39:
 2947              		.align	1
 2948              		.global	pixel
 2949              		.syntax unified
 2950              		.code	16
 2951              		.thumb_func
 2952              		.fpu softvfp
 2954              	pixel:
 2955              	.LFB40:
 361:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 362:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void pixel(int x, int y, int set) {
 2956              		.loc 2 362 0
 2957              		.cfi_startproc
 2958              		@ args = 0, pretend = 0, frame = 32
 2959              		@ frame_needed = 1, uses_anonymous_args = 0
 2960 0c94 90B5     		push	{r4, r7, lr}
 2961              		.cfi_def_cfa_offset 12
 2962              		.cfi_offset 4, -12
 2963              		.cfi_offset 7, -8
 2964              		.cfi_offset 14, -4
 2965 0c96 89B0     		sub	sp, sp, #36
 2966              		.cfi_def_cfa_offset 48
 2967 0c98 00AF     		add	r7, sp, #0
 2968              		.cfi_def_cfa_register 7
 2969 0c9a F860     		str	r0, [r7, #12]
 2970 0c9c B960     		str	r1, [r7, #8]
 2971 0c9e 7A60     		str	r2, [r7, #4]
 363:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** uint8_t mask, c, controller;
 364:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** int index;
 365:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 2972              		.loc 2 365 0
 2973 0ca0 FB68     		ldr	r3, [r7, #12]
 2974 0ca2 002B     		cmp	r3, #0
 2975 0ca4 00DC     		bgt	.LCB2322
 2976 0ca6 BCE0     		b	.L168	@long jump
 2977              	.LCB2322:
 2978              		.loc 2 365 0 is_stmt 0 discriminator 1
 2979 0ca8 BB68     		ldr	r3, [r7, #8]
 2980 0caa 002B     		cmp	r3, #0
 2981 0cac 00DC     		bgt	.LCB2325
 2982 0cae B8E0     		b	.L168	@long jump
 2983              	.LCB2325:
 2984              		.loc 2 365 0 discriminator 2
 2985 0cb0 FB68     		ldr	r3, [r7, #12]
 2986 0cb2 802B     		cmp	r3, #128
 2987 0cb4 00DD     		ble	.LCB2328
 2988 0cb6 B4E0     		b	.L168	@long jump
 2989              	.LCB2328:
 2990              		.loc 2 365 0 discriminator 3
 2991 0cb8 BB68     		ldr	r3, [r7, #8]
 2992 0cba 402B     		cmp	r3, #64
 2993 0cbc 00DD     		ble	.LCB2331
 2994 0cbe B0E0     		b	.L168	@long jump
 2995              	.LCB2331:
 366:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** index = (y-1)/8;
 2996              		.loc 2 366 0 is_stmt 1
 2997 0cc0 BB68     		ldr	r3, [r7, #8]
 2998 0cc2 013B     		subs	r3, r3, #1
 2999 0cc4 002B     		cmp	r3, #0
 3000 0cc6 00DA     		bge	.L151
 3001 0cc8 0733     		adds	r3, r3, #7
 3002              	.L151:
 3003 0cca DB10     		asrs	r3, r3, #3
 3004 0ccc BB61     		str	r3, [r7, #24]
 367:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** switch( (y-1)%8 ) {
 3005              		.loc 2 367 0
 3006 0cce BB68     		ldr	r3, [r7, #8]
 3007 0cd0 013B     		subs	r3, r3, #1
 3008 0cd2 564A     		ldr	r2, .L169
 3009 0cd4 1340     		ands	r3, r2
 3010 0cd6 04D5     		bpl	.L152
 3011 0cd8 013B     		subs	r3, r3, #1
 3012 0cda 0822     		movs	r2, #8
 3013 0cdc 5242     		rsbs	r2, r2, #0
 3014 0cde 1343     		orrs	r3, r2
 3015 0ce0 0133     		adds	r3, r3, #1
 3016              	.L152:
 3017 0ce2 072B     		cmp	r3, #7
 3018 0ce4 2CD8     		bhi	.L153
 3019 0ce6 9A00     		lsls	r2, r3, #2
 3020 0ce8 514B     		ldr	r3, .L169+4
 3021 0cea D318     		adds	r3, r2, r3
 3022 0cec 1B68     		ldr	r3, [r3]
 3023 0cee 9F46     		mov	pc, r3
 3024              		.section	.rodata
 3025              		.align	2
 3026              	.L155:
 3027 0024 F00C0000 		.word	.L154
 3028 0028 FA0C0000 		.word	.L156
 3029 002c 040D0000 		.word	.L157
 3030 0030 0E0D0000 		.word	.L158
 3031 0034 180D0000 		.word	.L159
 3032 0038 220D0000 		.word	.L160
 3033 003c 2C0D0000 		.word	.L161
 3034 0040 360D0000 		.word	.L162
 3035              		.text
 3036              	.L154:
 368:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 0: mask = 1; break;
 3037              		.loc 2 368 0
 3038 0cf0 1F23     		movs	r3, #31
 3039 0cf2 FB18     		adds	r3, r7, r3
 3040 0cf4 0122     		movs	r2, #1
 3041 0cf6 1A70     		strb	r2, [r3]
 3042 0cf8 22E0     		b	.L153
 3043              	.L156:
 369:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 1: mask = 2; break;
 3044              		.loc 2 369 0
 3045 0cfa 1F23     		movs	r3, #31
 3046 0cfc FB18     		adds	r3, r7, r3
 3047 0cfe 0222     		movs	r2, #2
 3048 0d00 1A70     		strb	r2, [r3]
 3049 0d02 1DE0     		b	.L153
 3050              	.L157:
 370:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 2: mask = 4; break;
 3051              		.loc 2 370 0
 3052 0d04 1F23     		movs	r3, #31
 3053 0d06 FB18     		adds	r3, r7, r3
 3054 0d08 0422     		movs	r2, #4
 3055 0d0a 1A70     		strb	r2, [r3]
 3056 0d0c 18E0     		b	.L153
 3057              	.L158:
 371:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 3: mask = 8; break;
 3058              		.loc 2 371 0
 3059 0d0e 1F23     		movs	r3, #31
 3060 0d10 FB18     		adds	r3, r7, r3
 3061 0d12 0822     		movs	r2, #8
 3062 0d14 1A70     		strb	r2, [r3]
 3063 0d16 13E0     		b	.L153
 3064              	.L159:
 372:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 4: mask = 0x10; break;
 3065              		.loc 2 372 0
 3066 0d18 1F23     		movs	r3, #31
 3067 0d1a FB18     		adds	r3, r7, r3
 3068 0d1c 1022     		movs	r2, #16
 3069 0d1e 1A70     		strb	r2, [r3]
 3070 0d20 0EE0     		b	.L153
 3071              	.L160:
 373:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 5: mask = 0x20; break;
 3072              		.loc 2 373 0
 3073 0d22 1F23     		movs	r3, #31
 3074 0d24 FB18     		adds	r3, r7, r3
 3075 0d26 2022     		movs	r2, #32
 3076 0d28 1A70     		strb	r2, [r3]
 3077 0d2a 09E0     		b	.L153
 3078              	.L161:
 374:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 6: mask = 0x40; break;
 3079              		.loc 2 374 0
 3080 0d2c 1F23     		movs	r3, #31
 3081 0d2e FB18     		adds	r3, r7, r3
 3082 0d30 4022     		movs	r2, #64
 3083 0d32 1A70     		strb	r2, [r3]
 3084 0d34 04E0     		b	.L153
 3085              	.L162:
 375:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** case 7: mask = 0x80; break;
 3086              		.loc 2 375 0
 3087 0d36 1F23     		movs	r3, #31
 3088 0d38 FB18     		adds	r3, r7, r3
 3089 0d3a 8022     		movs	r2, #128
 3090 0d3c 1A70     		strb	r2, [r3]
 3091 0d3e C046     		nop
 3092              	.L153:
 376:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 377:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** if(set == 0)
 3093              		.loc 2 377 0
 3094 0d40 7B68     		ldr	r3, [r7, #4]
 3095 0d42 002B     		cmp	r3, #0
 3096 0d44 06D1     		bne	.L163
 378:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** mask = ~mask;
 3097              		.loc 2 378 0
 3098 0d46 1F23     		movs	r3, #31
 3099 0d48 FB18     		adds	r3, r7, r3
 3100 0d4a 1F22     		movs	r2, #31
 3101 0d4c BA18     		adds	r2, r7, r2
 3102 0d4e 1278     		ldrb	r2, [r2]
 3103 0d50 D243     		mvns	r2, r2
 3104 0d52 1A70     		strb	r2, [r3]
 3105              	.L163:
 379:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** if(x > 64){
 3106              		.loc 2 379 0
 3107 0d54 FB68     		ldr	r3, [r7, #12]
 3108 0d56 402B     		cmp	r3, #64
 3109 0d58 07DD     		ble	.L164
 380:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** controller = B_CS2;
 3110              		.loc 2 380 0
 3111 0d5a 1E23     		movs	r3, #30
 3112 0d5c FB18     		adds	r3, r7, r3
 3113 0d5e 1022     		movs	r2, #16
 3114 0d60 1A70     		strb	r2, [r3]
 381:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** x = x - 65;
 3115              		.loc 2 381 0
 3116 0d62 FB68     		ldr	r3, [r7, #12]
 3117 0d64 413B     		subs	r3, r3, #65
 3118 0d66 FB60     		str	r3, [r7, #12]
 3119 0d68 06E0     		b	.L165
 3120              	.L164:
 382:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** } else {
 383:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** controller = B_CS1;
 3121              		.loc 2 383 0
 3122 0d6a 1E23     		movs	r3, #30
 3123 0d6c FB18     		adds	r3, r7, r3
 3124 0d6e 0822     		movs	r2, #8
 3125 0d70 1A70     		strb	r2, [r3]
 384:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** x = x-1;
 3126              		.loc 2 384 0
 3127 0d72 FB68     		ldr	r3, [r7, #12]
 3128 0d74 013B     		subs	r3, r3, #1
 3129 0d76 FB60     		str	r3, [r7, #12]
 3130              	.L165:
 385:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 386:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller );
 3131              		.loc 2 386 0
 3132 0d78 FB68     		ldr	r3, [r7, #12]
 3133 0d7a 5BB2     		sxtb	r3, r3
 3134 0d7c 4022     		movs	r2, #64
 3135 0d7e 1343     		orrs	r3, r2
 3136 0d80 5BB2     		sxtb	r3, r3
 3137 0d82 DAB2     		uxtb	r2, r3
 3138 0d84 1E23     		movs	r3, #30
 3139 0d86 FB18     		adds	r3, r7, r3
 3140 0d88 1B78     		ldrb	r3, [r3]
 3141 0d8a 1900     		movs	r1, r3
 3142 0d8c 1000     		movs	r0, r2
 3143 0d8e FFF7FEFF 		bl	graphic_write_command
 387:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** graphic_write_command(LCD_SET_PAGE | index, controller );
 3144              		.loc 2 387 0
 3145 0d92 BB69     		ldr	r3, [r7, #24]
 3146 0d94 5BB2     		sxtb	r3, r3
 3147 0d96 4822     		movs	r2, #72
 3148 0d98 5242     		rsbs	r2, r2, #0
 3149 0d9a 1343     		orrs	r3, r2
 3150 0d9c 5BB2     		sxtb	r3, r3
 3151 0d9e DAB2     		uxtb	r2, r3
 3152 0da0 1E23     		movs	r3, #30
 3153 0da2 FB18     		adds	r3, r7, r3
 3154 0da4 1B78     		ldrb	r3, [r3]
 3155 0da6 1900     		movs	r1, r3
 3156 0da8 1000     		movs	r0, r2
 3157 0daa FFF7FEFF 		bl	graphic_write_command
 388:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** c = graphic_read_data(controller);
 3158              		.loc 2 388 0
 3159 0dae 1723     		movs	r3, #23
 3160 0db0 FC18     		adds	r4, r7, r3
 3161 0db2 1E23     		movs	r3, #30
 3162 0db4 FB18     		adds	r3, r7, r3
 3163 0db6 1B78     		ldrb	r3, [r3]
 3164 0db8 1800     		movs	r0, r3
 3165 0dba FFF713FA 		bl	graphic_read_data
 3166 0dbe 0300     		movs	r3, r0
 3167 0dc0 2370     		strb	r3, [r4]
 389:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller);
 3168              		.loc 2 389 0
 3169 0dc2 FB68     		ldr	r3, [r7, #12]
 3170 0dc4 5BB2     		sxtb	r3, r3
 3171 0dc6 4022     		movs	r2, #64
 3172 0dc8 1343     		orrs	r3, r2
 3173 0dca 5BB2     		sxtb	r3, r3
 3174 0dcc DAB2     		uxtb	r2, r3
 3175 0dce 1E23     		movs	r3, #30
 3176 0dd0 FB18     		adds	r3, r7, r3
 3177 0dd2 1B78     		ldrb	r3, [r3]
 3178 0dd4 1900     		movs	r1, r3
 3179 0dd6 1000     		movs	r0, r2
 3180 0dd8 FFF7FEFF 		bl	graphic_write_command
 390:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** if(set)
 3181              		.loc 2 390 0
 3182 0ddc 7B68     		ldr	r3, [r7, #4]
 3183 0dde 002B     		cmp	r3, #0
 3184 0de0 0AD0     		beq	.L166
 391:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** mask = mask | c;
 3185              		.loc 2 391 0
 3186 0de2 1F23     		movs	r3, #31
 3187 0de4 FB18     		adds	r3, r7, r3
 3188 0de6 1F22     		movs	r2, #31
 3189 0de8 B918     		adds	r1, r7, r2
 3190 0dea 1722     		movs	r2, #23
 3191 0dec BA18     		adds	r2, r7, r2
 3192 0dee 0978     		ldrb	r1, [r1]
 3193 0df0 1278     		ldrb	r2, [r2]
 3194 0df2 0A43     		orrs	r2, r1
 3195 0df4 1A70     		strb	r2, [r3]
 3196 0df6 09E0     		b	.L167
 3197              	.L166:
 392:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** else
 393:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** mask = mask & c;
 3198              		.loc 2 393 0
 3199 0df8 1F23     		movs	r3, #31
 3200 0dfa FB18     		adds	r3, r7, r3
 3201 0dfc 1F22     		movs	r2, #31
 3202 0dfe BA18     		adds	r2, r7, r2
 3203 0e00 1721     		movs	r1, #23
 3204 0e02 7918     		adds	r1, r7, r1
 3205 0e04 1278     		ldrb	r2, [r2]
 3206 0e06 0978     		ldrb	r1, [r1]
 3207 0e08 0A40     		ands	r2, r1
 3208 0e0a 1A70     		strb	r2, [r3]
 3209              	.L167:
 394:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** graphic_write_data(mask, controller);
 3210              		.loc 2 394 0
 3211 0e0c 1E23     		movs	r3, #30
 3212 0e0e FB18     		adds	r3, r7, r3
 3213 0e10 1A78     		ldrb	r2, [r3]
 3214 0e12 1F23     		movs	r3, #31
 3215 0e14 FB18     		adds	r3, r7, r3
 3216 0e16 1B78     		ldrb	r3, [r3]
 3217 0e18 1100     		movs	r1, r2
 3218 0e1a 1800     		movs	r0, r3
 3219 0e1c FFF7FEFF 		bl	graphic_write_data
 3220 0e20 00E0     		b	.L147
 3221              	.L168:
 365:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** index = (y-1)/8;
 3222              		.loc 2 365 0
 3223 0e22 C046     		nop
 3224              	.L147:
 395:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 3225              		.loc 2 395 0
 3226 0e24 BD46     		mov	sp, r7
 3227 0e26 09B0     		add	sp, sp, #36
 3228              		@ sp needed
 3229 0e28 90BD     		pop	{r4, r7, pc}
 3230              	.L170:
 3231 0e2a C046     		.align	2
 3232              	.L169:
 3233 0e2c 07000080 		.word	-2147483641
 3234 0e30 24000000 		.word	.L155
 3235              		.cfi_endproc
 3236              	.LFE40:
 3238              		.align	1
 3239              		.global	drawRect
 3240              		.syntax unified
 3241              		.code	16
 3242              		.thumb_func
 3243              		.fpu softvfp
 3245              	drawRect:
 3246              	.LFB41:
 396:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void drawRect(int x, int y){}
 3247              		.loc 2 396 0
 3248              		.cfi_startproc
 3249              		@ args = 0, pretend = 0, frame = 8
 3250              		@ frame_needed = 1, uses_anonymous_args = 0
 3251 0e34 80B5     		push	{r7, lr}
 3252              		.cfi_def_cfa_offset 8
 3253              		.cfi_offset 7, -8
 3254              		.cfi_offset 14, -4
 3255 0e36 82B0     		sub	sp, sp, #8
 3256              		.cfi_def_cfa_offset 16
 3257 0e38 00AF     		add	r7, sp, #0
 3258              		.cfi_def_cfa_register 7
 3259 0e3a 7860     		str	r0, [r7, #4]
 3260 0e3c 3960     		str	r1, [r7]
 3261              		.loc 2 396 0
 3262 0e3e C046     		nop
 3263 0e40 BD46     		mov	sp, r7
 3264 0e42 02B0     		add	sp, sp, #8
 3265              		@ sp needed
 3266 0e44 80BD     		pop	{r7, pc}
 3267              		.cfi_endproc
 3268              	.LFE41:
 3270              		.align	1
 3271              		.global	checkForGoals
 3272              		.syntax unified
 3273              		.code	16
 3274              		.thumb_func
 3275              		.fpu softvfp
 3277              	checkForGoals:
 3278              	.LFB42:
 397:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 398:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** 
 399:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void checkForGoals(POBJECT p){
 3279              		.loc 2 399 0
 3280              		.cfi_startproc
 3281              		@ args = 0, pretend = 0, frame = 8
 3282              		@ frame_needed = 1, uses_anonymous_args = 0
 3283 0e46 80B5     		push	{r7, lr}
 3284              		.cfi_def_cfa_offset 8
 3285              		.cfi_offset 7, -8
 3286              		.cfi_offset 14, -4
 3287 0e48 82B0     		sub	sp, sp, #8
 3288              		.cfi_def_cfa_offset 16
 3289 0e4a 00AF     		add	r7, sp, #0
 3290              		.cfi_def_cfa_register 7
 3291 0e4c 7860     		str	r0, [r7, #4]
 400:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     if(p->posx < 1){
 3292              		.loc 2 400 0
 3293 0e4e 7B68     		ldr	r3, [r7, #4]
 3294 0e50 DB68     		ldr	r3, [r3, #12]
 3295 0e52 002B     		cmp	r3, #0
 3296 0e54 0EDC     		bgt	.L173
 3297              	.LBB13:
 401:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         point2++;
 3298              		.loc 2 401 0
 3299 0e56 4A4B     		ldr	r3, .L178
 3300 0e58 1B68     		ldr	r3, [r3]
 3301 0e5a 5A1C     		adds	r2, r3, #1
 3302 0e5c 484B     		ldr	r3, .L178
 3303 0e5e 1A60     		str	r2, [r3]
 402:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         p->set_speed(p,2,3);
 3304              		.loc 2 402 0
 3305 0e60 7B68     		ldr	r3, [r7, #4]
 3306 0e62 1B6A     		ldr	r3, [r3, #32]
 3307 0e64 7868     		ldr	r0, [r7, #4]
 3308 0e66 0322     		movs	r2, #3
 3309 0e68 0221     		movs	r1, #2
 3310 0e6a 9847     		blx	r3
 3311              	.LVL16:
 403:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         resetBall();
 3312              		.loc 2 403 0
 3313 0e6c FFF7FEFF 		bl	resetBall
 404:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         updatePoints();
 3314              		.loc 2 404 0
 3315 0e70 FFF7FEFF 		bl	updatePoints
 3316              	.L173:
 3317              	.LBE13:
 405:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 406:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         if(p->posx > 120){
 3318              		.loc 2 406 0
 3319 0e74 7B68     		ldr	r3, [r7, #4]
 3320 0e76 DB68     		ldr	r3, [r3, #12]
 3321 0e78 782B     		cmp	r3, #120
 3322 0e7a 0FDD     		ble	.L174
 3323              	.LBB14:
 407:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             p->set_speed(p,-2,3);
 3324              		.loc 2 407 0
 3325 0e7c 7B68     		ldr	r3, [r7, #4]
 3326 0e7e 1B6A     		ldr	r3, [r3, #32]
 3327 0e80 0222     		movs	r2, #2
 3328 0e82 5142     		rsbs	r1, r2, #0
 3329 0e84 7868     		ldr	r0, [r7, #4]
 3330 0e86 0322     		movs	r2, #3
 3331 0e88 9847     		blx	r3
 3332              	.LVL17:
 408:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             resetBall();
 3333              		.loc 2 408 0
 3334 0e8a FFF7FEFF 		bl	resetBall
 409:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             point1 ++;
 3335              		.loc 2 409 0
 3336 0e8e 3D4B     		ldr	r3, .L178+4
 3337 0e90 1B68     		ldr	r3, [r3]
 3338 0e92 5A1C     		adds	r2, r3, #1
 3339 0e94 3B4B     		ldr	r3, .L178+4
 3340 0e96 1A60     		str	r2, [r3]
 410:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             updatePoints();
 3341              		.loc 2 410 0
 3342 0e98 FFF7FEFF 		bl	updatePoints
 3343              	.L174:
 3344              	.LBE14:
 411:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             }
 412:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****             if(point1 == 5){
 3345              		.loc 2 412 0
 3346 0e9c 394B     		ldr	r3, .L178+4
 3347 0e9e 1B68     		ldr	r3, [r3]
 3348 0ea0 052B     		cmp	r3, #5
 3349 0ea2 32D1     		bne	.L175
 3350              	.LBB15:
 413:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                  ascii_gotoxy(1,2);
 3351              		.loc 2 413 0
 3352 0ea4 0221     		movs	r1, #2
 3353 0ea6 0120     		movs	r0, #1
 3354 0ea8 FFF7FEFF 		bl	ascii_gotoxy
 414:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('P');
 3355              		.loc 2 414 0
 3356 0eac 5020     		movs	r0, #80
 3357 0eae FFF7FEFF 		bl	ascii_write_char
 415:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('L');
 3358              		.loc 2 415 0
 3359 0eb2 4C20     		movs	r0, #76
 3360 0eb4 FFF7FEFF 		bl	ascii_write_char
 416:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('A');
 3361              		.loc 2 416 0
 3362 0eb8 4120     		movs	r0, #65
 3363 0eba FFF7FEFF 		bl	ascii_write_char
 417:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('Y');
 3364              		.loc 2 417 0
 3365 0ebe 5920     		movs	r0, #89
 3366 0ec0 FFF7FEFF 		bl	ascii_write_char
 418:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('E');
 3367              		.loc 2 418 0
 3368 0ec4 4520     		movs	r0, #69
 3369 0ec6 FFF7FEFF 		bl	ascii_write_char
 419:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('R');
 3370              		.loc 2 419 0
 3371 0eca 5220     		movs	r0, #82
 3372 0ecc FFF7FEFF 		bl	ascii_write_char
 420:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char(' ');
 3373              		.loc 2 420 0
 3374 0ed0 2020     		movs	r0, #32
 3375 0ed2 FFF7FEFF 		bl	ascii_write_char
 421:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('1');
 3376              		.loc 2 421 0
 3377 0ed6 3120     		movs	r0, #49
 3378 0ed8 FFF7FEFF 		bl	ascii_write_char
 422:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char(' ');
 3379              		.loc 2 422 0
 3380 0edc 2020     		movs	r0, #32
 3381 0ede FFF7FEFF 		bl	ascii_write_char
 423:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('W');
 3382              		.loc 2 423 0
 3383 0ee2 5720     		movs	r0, #87
 3384 0ee4 FFF7FEFF 		bl	ascii_write_char
 424:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('O');
 3385              		.loc 2 424 0
 3386 0ee8 4F20     		movs	r0, #79
 3387 0eea FFF7FEFF 		bl	ascii_write_char
 425:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('N');
 3388              		.loc 2 425 0
 3389 0eee 4E20     		movs	r0, #78
 3390 0ef0 FFF7FEFF 		bl	ascii_write_char
 426:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('!');
 3391              		.loc 2 426 0
 3392 0ef4 2120     		movs	r0, #33
 3393 0ef6 FFF7FEFF 		bl	ascii_write_char
 427:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 p->set_speed(p,0,0);
 3394              		.loc 2 427 0
 3395 0efa 7B68     		ldr	r3, [r7, #4]
 3396 0efc 1B6A     		ldr	r3, [r3, #32]
 3397 0efe 7868     		ldr	r0, [r7, #4]
 3398 0f00 0022     		movs	r2, #0
 3399 0f02 0021     		movs	r1, #0
 3400 0f04 9847     		blx	r3
 3401              	.LVL18:
 428:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 waitForNewGame();
 3402              		.loc 2 428 0
 3403 0f06 FFF7FEFF 		bl	waitForNewGame
 3404              	.L175:
 3405              	.LBE15:
 429:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 }
 430:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 if(point2 == 5){
 3406              		.loc 2 430 0
 3407 0f0a 1D4B     		ldr	r3, .L178
 3408 0f0c 1B68     		ldr	r3, [r3]
 3409 0f0e 052B     		cmp	r3, #5
 3410 0f10 32D1     		bne	.L177
 3411              	.LBB16:
 431:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                     
 432:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                       ascii_gotoxy(1,2);
 3412              		.loc 2 432 0
 3413 0f12 0221     		movs	r1, #2
 3414 0f14 0120     		movs	r0, #1
 3415 0f16 FFF7FEFF 		bl	ascii_gotoxy
 433:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('P');
 3416              		.loc 2 433 0
 3417 0f1a 5020     		movs	r0, #80
 3418 0f1c FFF7FEFF 		bl	ascii_write_char
 434:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('L');
 3419              		.loc 2 434 0
 3420 0f20 4C20     		movs	r0, #76
 3421 0f22 FFF7FEFF 		bl	ascii_write_char
 435:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('A');
 3422              		.loc 2 435 0
 3423 0f26 4120     		movs	r0, #65
 3424 0f28 FFF7FEFF 		bl	ascii_write_char
 436:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('Y');
 3425              		.loc 2 436 0
 3426 0f2c 5920     		movs	r0, #89
 3427 0f2e FFF7FEFF 		bl	ascii_write_char
 437:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('E');
 3428              		.loc 2 437 0
 3429 0f32 4520     		movs	r0, #69
 3430 0f34 FFF7FEFF 		bl	ascii_write_char
 438:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('R');
 3431              		.loc 2 438 0
 3432 0f38 5220     		movs	r0, #82
 3433 0f3a FFF7FEFF 		bl	ascii_write_char
 439:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char(' ');
 3434              		.loc 2 439 0
 3435 0f3e 2020     		movs	r0, #32
 3436 0f40 FFF7FEFF 		bl	ascii_write_char
 440:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('2');
 3437              		.loc 2 440 0
 3438 0f44 3220     		movs	r0, #50
 3439 0f46 FFF7FEFF 		bl	ascii_write_char
 441:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char(' ');
 3440              		.loc 2 441 0
 3441 0f4a 2020     		movs	r0, #32
 3442 0f4c FFF7FEFF 		bl	ascii_write_char
 442:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('W');
 3443              		.loc 2 442 0
 3444 0f50 5720     		movs	r0, #87
 3445 0f52 FFF7FEFF 		bl	ascii_write_char
 443:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('O');
 3446              		.loc 2 443 0
 3447 0f56 4F20     		movs	r0, #79
 3448 0f58 FFF7FEFF 		bl	ascii_write_char
 444:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('N');
 3449              		.loc 2 444 0
 3450 0f5c 4E20     		movs	r0, #78
 3451 0f5e FFF7FEFF 		bl	ascii_write_char
 445:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 ascii_write_char('!');
 3452              		.loc 2 445 0
 3453 0f62 2120     		movs	r0, #33
 3454 0f64 FFF7FEFF 		bl	ascii_write_char
 446:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 p->set_speed(p,0,0);
 3455              		.loc 2 446 0
 3456 0f68 7B68     		ldr	r3, [r7, #4]
 3457 0f6a 1B6A     		ldr	r3, [r3, #32]
 3458 0f6c 7868     		ldr	r0, [r7, #4]
 3459 0f6e 0022     		movs	r2, #0
 3460 0f70 0021     		movs	r1, #0
 3461 0f72 9847     		blx	r3
 3462              	.LVL19:
 447:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 waitForNewGame();
 3463              		.loc 2 447 0
 3464 0f74 FFF7FEFF 		bl	waitForNewGame
 3465              	.L177:
 3466              	.LBE16:
 448:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****                 }
 449:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     }
 3467              		.loc 2 449 0
 3468 0f78 C046     		nop
 3469 0f7a BD46     		mov	sp, r7
 3470 0f7c 02B0     		add	sp, sp, #8
 3471              		@ sp needed
 3472 0f7e 80BD     		pop	{r7, pc}
 3473              	.L179:
 3474              		.align	2
 3475              	.L178:
 3476 0f80 00000000 		.word	point2
 3477 0f84 00000000 		.word	point1
 3478              		.cfi_endproc
 3479              	.LFE42:
 3481              		.align	1
 3482              		.global	updatePoints
 3483              		.syntax unified
 3484              		.code	16
 3485              		.thumb_func
 3486              		.fpu softvfp
 3488              	updatePoints:
 3489              	.LFB43:
 450:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     void updatePoints(void){
 3490              		.loc 2 450 0
 3491              		.cfi_startproc
 3492              		@ args = 0, pretend = 0, frame = 0
 3493              		@ frame_needed = 1, uses_anonymous_args = 0
 3494 0f88 80B5     		push	{r7, lr}
 3495              		.cfi_def_cfa_offset 8
 3496              		.cfi_offset 7, -8
 3497              		.cfi_offset 14, -4
 3498 0f8a 00AF     		add	r7, sp, #0
 3499              		.cfi_def_cfa_register 7
 451:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****          ascii_gotoxy(8,1);
 3500              		.loc 2 451 0
 3501 0f8c 0121     		movs	r1, #1
 3502 0f8e 0820     		movs	r0, #8
 3503 0f90 FFF7FEFF 		bl	ascii_gotoxy
 452:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         ascii_write_char(point1 + '0');
 3504              		.loc 2 452 0
 3505 0f94 0D4B     		ldr	r3, .L181
 3506 0f96 1B68     		ldr	r3, [r3]
 3507 0f98 DBB2     		uxtb	r3, r3
 3508 0f9a 3033     		adds	r3, r3, #48
 3509 0f9c DBB2     		uxtb	r3, r3
 3510 0f9e 1800     		movs	r0, r3
 3511 0fa0 FFF7FEFF 		bl	ascii_write_char
 453:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         ascii_write_char(' ');
 3512              		.loc 2 453 0
 3513 0fa4 2020     		movs	r0, #32
 3514 0fa6 FFF7FEFF 		bl	ascii_write_char
 454:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         ascii_write_char('-');
 3515              		.loc 2 454 0
 3516 0faa 2D20     		movs	r0, #45
 3517 0fac FFF7FEFF 		bl	ascii_write_char
 455:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         ascii_write_char(' ');
 3518              		.loc 2 455 0
 3519 0fb0 2020     		movs	r0, #32
 3520 0fb2 FFF7FEFF 		bl	ascii_write_char
 456:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         ascii_write_char(point2 + '0');
 3521              		.loc 2 456 0
 3522 0fb6 064B     		ldr	r3, .L181+4
 3523 0fb8 1B68     		ldr	r3, [r3]
 3524 0fba DBB2     		uxtb	r3, r3
 3525 0fbc 3033     		adds	r3, r3, #48
 3526 0fbe DBB2     		uxtb	r3, r3
 3527 0fc0 1800     		movs	r0, r3
 3528 0fc2 FFF7FEFF 		bl	ascii_write_char
 457:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         }
 3529              		.loc 2 457 0
 3530 0fc6 C046     		nop
 3531 0fc8 BD46     		mov	sp, r7
 3532              		@ sp needed
 3533 0fca 80BD     		pop	{r7, pc}
 3534              	.L182:
 3535              		.align	2
 3536              	.L181:
 3537 0fcc 00000000 		.word	point1
 3538 0fd0 00000000 		.word	point2
 3539              		.cfi_endproc
 3540              	.LFE43:
 3542              		.align	1
 3543              		.global	resetBall
 3544              		.syntax unified
 3545              		.code	16
 3546              		.thumb_func
 3547              		.fpu softvfp
 3549              	resetBall:
 3550              	.LFB44:
 458:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void resetBall(POBJECT p){
 3551              		.loc 2 458 0
 3552              		.cfi_startproc
 3553              		@ args = 0, pretend = 0, frame = 8
 3554              		@ frame_needed = 1, uses_anonymous_args = 0
 3555 0fd4 80B5     		push	{r7, lr}
 3556              		.cfi_def_cfa_offset 8
 3557              		.cfi_offset 7, -8
 3558              		.cfi_offset 14, -4
 3559 0fd6 82B0     		sub	sp, sp, #8
 3560              		.cfi_def_cfa_offset 16
 3561 0fd8 00AF     		add	r7, sp, #0
 3562              		.cfi_def_cfa_register 7
 3563 0fda 7860     		str	r0, [r7, #4]
 459:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     clear_object(p);
 3564              		.loc 2 459 0
 3565 0fdc 7B68     		ldr	r3, [r7, #4]
 3566 0fde 1800     		movs	r0, r3
 3567 0fe0 FFF7FEFF 		bl	clear_object
 460:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->posx = 60;
 3568              		.loc 2 460 0
 3569 0fe4 7B68     		ldr	r3, [r7, #4]
 3570 0fe6 3C22     		movs	r2, #60
 3571 0fe8 DA60     		str	r2, [r3, #12]
 461:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     p->posy = 30;
 3572              		.loc 2 461 0
 3573 0fea 7B68     		ldr	r3, [r7, #4]
 3574 0fec 1E22     		movs	r2, #30
 3575 0fee 1A61     		str	r2, [r3, #16]
 462:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** }
 3576              		.loc 2 462 0
 3577 0ff0 C046     		nop
 3578 0ff2 BD46     		mov	sp, r7
 3579 0ff4 02B0     		add	sp, sp, #8
 3580              		@ sp needed
 3581 0ff6 80BD     		pop	{r7, pc}
 3582              		.cfi_endproc
 3583              	.LFE44:
 3585              		.align	1
 3586              		.global	waitForNewGame
 3587              		.syntax unified
 3588              		.code	16
 3589              		.thumb_func
 3590              		.fpu softvfp
 3592              	waitForNewGame:
 3593              	.LFB45:
 463:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c **** void waitForNewGame(void){
 3594              		.loc 2 463 0
 3595              		.cfi_startproc
 3596              		@ args = 0, pretend = 0, frame = 8
 3597              		@ frame_needed = 1, uses_anonymous_args = 0
 3598 0ff8 90B5     		push	{r4, r7, lr}
 3599              		.cfi_def_cfa_offset 12
 3600              		.cfi_offset 4, -12
 3601              		.cfi_offset 7, -8
 3602              		.cfi_offset 14, -4
 3603 0ffa 83B0     		sub	sp, sp, #12
 3604              		.cfi_def_cfa_offset 24
 3605 0ffc 00AF     		add	r7, sp, #0
 3606              		.cfi_def_cfa_register 7
 3607              	.L186:
 464:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     char c;
 465:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     while(1){
 466:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     c = keyb();
 3608              		.loc 2 466 0
 3609 0ffe FC1D     		adds	r4, r7, #7
 3610 1000 FFF7FEFF 		bl	keyb
 3611 1004 0300     		movs	r3, r0
 3612 1006 2370     		strb	r3, [r4]
 467:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     if(c == '0'){
 3613              		.loc 2 467 0
 3614 1008 FB1D     		adds	r3, r7, #7
 3615 100a 1B78     		ldrb	r3, [r3]
 3616 100c 302B     		cmp	r3, #48
 3617 100e F6D1     		bne	.L186
 468:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****         main();
 3618              		.loc 2 468 0
 3619 1010 FFF7FEFF 		bl	main
 466:C:/Users/nicla/DAT017/Lab1/Moplaborationer/Lab5\startup.c ****     if(c == '0'){
 3620              		.loc 2 466 0
 3621 1014 F3E7     		b	.L186
 3622              		.cfi_endproc
 3623              	.LFE45:
 3625              	.Letext0:
