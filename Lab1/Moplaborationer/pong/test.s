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
  15              		.global	ball_geometry
  16              		.data
  17              		.align	2
  20              	ball_geometry:
  21 0000 0C000000 		.word	12
  22 0004 04000000 		.word	4
  23 0008 04000000 		.word	4
  24 000c 00       		.byte	0
  25 000d 01       		.byte	1
  26 000e 00       		.byte	0
  27 000f 02       		.byte	2
  28 0010 01       		.byte	1
  29 0011 00       		.byte	0
  30 0012 01       		.byte	1
  31 0013 01       		.byte	1
  32 0014 01       		.byte	1
  33 0015 02       		.byte	2
  34 0016 01       		.byte	1
  35 0017 03       		.byte	3
  36 0018 02       		.byte	2
  37 0019 00       		.byte	0
  38 001a 02       		.byte	2
  39 001b 01       		.byte	1
  40 001c 02       		.byte	2
  41 001d 02       		.byte	2
  42 001e 02       		.byte	2
  43 001f 03       		.byte	3
  44 0020 03       		.byte	3
  45 0021 01       		.byte	1
  46 0022 03       		.byte	3
  47 0023 02       		.byte	2
  48 0024 00000000 		.space	16
  48      00000000 
  48      00000000 
  48      00000000 
  49              		.text
  50              		.align	1
  51              		.global	set_object_speed
  52              		.syntax unified
  53              		.code	16
  54              		.thumb_func
  55              		.fpu softvfp
  57              	set_object_speed:
  58              	.LFB0:
  59              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****  typedef unsigned char uint8_t;
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****  
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define	GPIO_D			0x40020C00
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes är 32 bitar*/
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anänder 2 b
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC säger vilken offset GPIO beh�
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high måste 
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high måste 
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define	GPIO_E			0x40021000
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes är 32 bitar*/
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anänder 2 b
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC säger vilken offset GPIO beh�
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high måste 
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high måste 
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define B_E 0x40 // Enable
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define B_RST 0x20 // Reset
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define B_CS2 0x10 // Controller Select 2
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define B_CS1 8 // Controller Select 1
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define B_RW 2 // 0 Write, 1 Read
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define B_RS 1 // 0 Command, 1 Data
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define LCD_ON 0x3F // Display on
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define LCD_OFF 0x3E // Display off
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define LCD_DISP_START 0xC0 // Start address
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define LCD_BUSY 0x80 // Read busy status
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #define MAX_POINTS 20
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** typedef struct tPoint{
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     unsigned char x;
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     unsigned char y;
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }POINT;
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** typedef struct tGeometry{
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      int numpoints;
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      int sizex;
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      int sizey;
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      POINT px[MAX_POINTS];
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }GEOMETRY, *PGEOMETRY;
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** typedef struct tObj{
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     PGEOMETRY geo;
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     int dirx,diry;
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     int posx,posy;
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     void (* draw)(struct tObj *);
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     void (* clear)(struct tObj *);
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     void (* move)(struct tObj *);
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     void (* set_speed)(struct tObj * , int, int);
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }OBJECT, *POBJECT;
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** GEOMETRY ball_geometry = {
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     12,
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     4,4,
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     {
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         {0,1}, {0,2}, {1,0},{1,1},{1,2},
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         {1,3},{2,0},{2,1},{2,2},{2,3},
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         {3,1},
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         {3,2}
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     };
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void set_object_speed(POBJECT p, int x, int y){
  60              		.loc 1 75 0
  61              		.cfi_startproc
  62              		@ args = 0, pretend = 0, frame = 16
  63              		@ frame_needed = 1, uses_anonymous_args = 0
  64 0000 80B5     		push	{r7, lr}
  65              		.cfi_def_cfa_offset 8
  66              		.cfi_offset 7, -8
  67              		.cfi_offset 14, -4
  68 0002 84B0     		sub	sp, sp, #16
  69              		.cfi_def_cfa_offset 24
  70 0004 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  72 0006 F860     		str	r0, [r7, #12]
  73 0008 B960     		str	r1, [r7, #8]
  74 000a 7A60     		str	r2, [r7, #4]
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     p->dirx = x;
  75              		.loc 1 76 0
  76 000c FB68     		ldr	r3, [r7, #12]
  77 000e BA68     		ldr	r2, [r7, #8]
  78 0010 5A60     		str	r2, [r3, #4]
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     p->diry = y;
  79              		.loc 1 77 0
  80 0012 FB68     		ldr	r3, [r7, #12]
  81 0014 7A68     		ldr	r2, [r7, #4]
  82 0016 9A60     		str	r2, [r3, #8]
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
  83              		.loc 1 78 0
  84 0018 C046     		nop
  85 001a BD46     		mov	sp, r7
  86 001c 04B0     		add	sp, sp, #16
  87              		@ sp needed
  88 001e 80BD     		pop	{r7, pc}
  89              		.cfi_endproc
  90              	.LFE0:
  92              		.align	1
  93              		.global	draw_object
  94              		.syntax unified
  95              		.code	16
  96              		.thumb_func
  97              		.fpu softvfp
  99              	draw_object:
 100              	.LFB1:
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void draw_object(POBJECT p){
 101              		.loc 1 79 0
 102              		.cfi_startproc
 103              		@ args = 0, pretend = 0, frame = 24
 104              		@ frame_needed = 1, uses_anonymous_args = 0
 105 0020 80B5     		push	{r7, lr}
 106              		.cfi_def_cfa_offset 8
 107              		.cfi_offset 7, -8
 108              		.cfi_offset 14, -4
 109 0022 86B0     		sub	sp, sp, #24
 110              		.cfi_def_cfa_offset 32
 111 0024 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
 113 0026 7860     		str	r0, [r7, #4]
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      POINT *ptr = p->geo->px;
 114              		.loc 1 80 0
 115 0028 7B68     		ldr	r3, [r7, #4]
 116 002a 1B68     		ldr	r3, [r3]
 117 002c 0C33     		adds	r3, r3, #12
 118 002e 7B61     		str	r3, [r7, #20]
 119              	.LBB2:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     for(int i = 0; i < p->geo->numpoints; i++){
 120              		.loc 1 81 0
 121 0030 0023     		movs	r3, #0
 122 0032 3B61     		str	r3, [r7, #16]
 123 0034 17E0     		b	.L3
 124              	.L4:
 125              	.LBB3:
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         //unsigned int x = p->posx + (p->geo->px->x + i);
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         //unsigned int y = p->posy + (p->geo->px->y+ i);
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****        
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         unsigned int x = p->posx + ptr->x;
 126              		.loc 1 86 0 discriminator 3
 127 0036 7B68     		ldr	r3, [r7, #4]
 128 0038 DB68     		ldr	r3, [r3, #12]
 129 003a 7A69     		ldr	r2, [r7, #20]
 130 003c 1278     		ldrb	r2, [r2]
 131 003e 9B18     		adds	r3, r3, r2
 132 0040 FB60     		str	r3, [r7, #12]
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         unsigned int y = p->posy + ptr->y;
 133              		.loc 1 87 0 discriminator 3
 134 0042 7B68     		ldr	r3, [r7, #4]
 135 0044 1B69     		ldr	r3, [r3, #16]
 136 0046 7A69     		ldr	r2, [r7, #20]
 137 0048 5278     		ldrb	r2, [r2, #1]
 138 004a 9B18     		adds	r3, r3, r2
 139 004c BB60     		str	r3, [r7, #8]
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         pixel(x,y, 1);
 140              		.loc 1 89 0 discriminator 3
 141 004e B968     		ldr	r1, [r7, #8]
 142 0050 FB68     		ldr	r3, [r7, #12]
 143 0052 0122     		movs	r2, #1
 144 0054 1800     		movs	r0, r3
 145 0056 FFF7FEFF 		bl	pixel
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         ptr++;
 146              		.loc 1 90 0 discriminator 3
 147 005a 7B69     		ldr	r3, [r7, #20]
 148 005c 0233     		adds	r3, r3, #2
 149 005e 7B61     		str	r3, [r7, #20]
 150              	.LBE3:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         
 151              		.loc 1 81 0 discriminator 3
 152 0060 3B69     		ldr	r3, [r7, #16]
 153 0062 0133     		adds	r3, r3, #1
 154 0064 3B61     		str	r3, [r7, #16]
 155              	.L3:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         
 156              		.loc 1 81 0 is_stmt 0 discriminator 1
 157 0066 7B68     		ldr	r3, [r7, #4]
 158 0068 1B68     		ldr	r3, [r3]
 159 006a 1A68     		ldr	r2, [r3]
 160 006c 3B69     		ldr	r3, [r7, #16]
 161 006e 9A42     		cmp	r2, r3
 162 0070 E1DC     		bgt	.L4
 163              	.LBE2:
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         }
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
 164              		.loc 1 92 0 is_stmt 1
 165 0072 C046     		nop
 166 0074 BD46     		mov	sp, r7
 167 0076 06B0     		add	sp, sp, #24
 168              		@ sp needed
 169 0078 80BD     		pop	{r7, pc}
 170              		.cfi_endproc
 171              	.LFE1:
 173              		.align	1
 174              		.global	clear_object
 175              		.syntax unified
 176              		.code	16
 177              		.thumb_func
 178              		.fpu softvfp
 180              	clear_object:
 181              	.LFB2:
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void clear_object(POBJECT p){
 182              		.loc 1 93 0
 183              		.cfi_startproc
 184              		@ args = 0, pretend = 0, frame = 24
 185              		@ frame_needed = 1, uses_anonymous_args = 0
 186 007a 80B5     		push	{r7, lr}
 187              		.cfi_def_cfa_offset 8
 188              		.cfi_offset 7, -8
 189              		.cfi_offset 14, -4
 190 007c 86B0     		sub	sp, sp, #24
 191              		.cfi_def_cfa_offset 32
 192 007e 00AF     		add	r7, sp, #0
 193              		.cfi_def_cfa_register 7
 194 0080 7860     		str	r0, [r7, #4]
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      POINT *ptr = p->geo->px;
 195              		.loc 1 94 0
 196 0082 7B68     		ldr	r3, [r7, #4]
 197 0084 1B68     		ldr	r3, [r3]
 198 0086 0C33     		adds	r3, r3, #12
 199 0088 7B61     		str	r3, [r7, #20]
 200              	.LBB4:
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     for(int i = 0; i < p->geo->numpoints; i++){
 201              		.loc 1 95 0
 202 008a 0023     		movs	r3, #0
 203 008c 3B61     		str	r3, [r7, #16]
 204 008e 17E0     		b	.L6
 205              	.L7:
 206              	.LBB5:
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         unsigned int x = p->posx + ptr->x;
 207              		.loc 1 96 0 discriminator 3
 208 0090 7B68     		ldr	r3, [r7, #4]
 209 0092 DB68     		ldr	r3, [r3, #12]
 210 0094 7A69     		ldr	r2, [r7, #20]
 211 0096 1278     		ldrb	r2, [r2]
 212 0098 9B18     		adds	r3, r3, r2
 213 009a FB60     		str	r3, [r7, #12]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         unsigned int y = p->posy + ptr->y;
 214              		.loc 1 97 0 discriminator 3
 215 009c 7B68     		ldr	r3, [r7, #4]
 216 009e 1B69     		ldr	r3, [r3, #16]
 217 00a0 7A69     		ldr	r2, [r7, #20]
 218 00a2 5278     		ldrb	r2, [r2, #1]
 219 00a4 9B18     		adds	r3, r3, r2
 220 00a6 BB60     		str	r3, [r7, #8]
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         pixel(x,y, 0);
 221              		.loc 1 99 0 discriminator 3
 222 00a8 B968     		ldr	r1, [r7, #8]
 223 00aa FB68     		ldr	r3, [r7, #12]
 224 00ac 0022     		movs	r2, #0
 225 00ae 1800     		movs	r0, r3
 226 00b0 FFF7FEFF 		bl	pixel
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         ptr++;
 227              		.loc 1 100 0 discriminator 3
 228 00b4 7B69     		ldr	r3, [r7, #20]
 229 00b6 0233     		adds	r3, r3, #2
 230 00b8 7B61     		str	r3, [r7, #20]
 231              	.LBE5:
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         unsigned int x = p->posx + ptr->x;
 232              		.loc 1 95 0 discriminator 3
 233 00ba 3B69     		ldr	r3, [r7, #16]
 234 00bc 0133     		adds	r3, r3, #1
 235 00be 3B61     		str	r3, [r7, #16]
 236              	.L6:
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         unsigned int x = p->posx + ptr->x;
 237              		.loc 1 95 0 is_stmt 0 discriminator 1
 238 00c0 7B68     		ldr	r3, [r7, #4]
 239 00c2 1B68     		ldr	r3, [r3]
 240 00c4 1A68     		ldr	r2, [r3]
 241 00c6 3B69     		ldr	r3, [r7, #16]
 242 00c8 9A42     		cmp	r2, r3
 243 00ca E1DC     		bgt	.L7
 244              	.LBE4:
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         }
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
 245              		.loc 1 104 0 is_stmt 1
 246 00cc C046     		nop
 247 00ce BD46     		mov	sp, r7
 248 00d0 06B0     		add	sp, sp, #24
 249              		@ sp needed
 250 00d2 80BD     		pop	{r7, pc}
 251              		.cfi_endproc
 252              	.LFE2:
 254              		.align	1
 255              		.global	move_object
 256              		.syntax unified
 257              		.code	16
 258              		.thumb_func
 259              		.fpu softvfp
 261              	move_object:
 262              	.LFB3:
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void move_object(POBJECT p){
 263              		.loc 1 105 0
 264              		.cfi_startproc
 265              		@ args = 0, pretend = 0, frame = 16
 266              		@ frame_needed = 1, uses_anonymous_args = 0
 267 00d4 80B5     		push	{r7, lr}
 268              		.cfi_def_cfa_offset 8
 269              		.cfi_offset 7, -8
 270              		.cfi_offset 14, -4
 271 00d6 84B0     		sub	sp, sp, #16
 272              		.cfi_def_cfa_offset 24
 273 00d8 00AF     		add	r7, sp, #0
 274              		.cfi_def_cfa_register 7
 275 00da 7860     		str	r0, [r7, #4]
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     clear_object(p);
 276              		.loc 1 106 0
 277 00dc 7B68     		ldr	r3, [r7, #4]
 278 00de 1800     		movs	r0, r3
 279 00e0 FFF7FEFF 		bl	clear_object
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     p->posx = p->posx + p->dirx;
 280              		.loc 1 108 0
 281 00e4 7B68     		ldr	r3, [r7, #4]
 282 00e6 DA68     		ldr	r2, [r3, #12]
 283 00e8 7B68     		ldr	r3, [r7, #4]
 284 00ea 5B68     		ldr	r3, [r3, #4]
 285 00ec D218     		adds	r2, r2, r3
 286 00ee 7B68     		ldr	r3, [r7, #4]
 287 00f0 DA60     		str	r2, [r3, #12]
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     p->posy = p->posy + p->diry;
 288              		.loc 1 109 0
 289 00f2 7B68     		ldr	r3, [r7, #4]
 290 00f4 1A69     		ldr	r2, [r3, #16]
 291 00f6 7B68     		ldr	r3, [r7, #4]
 292 00f8 9B68     		ldr	r3, [r3, #8]
 293 00fa D218     		adds	r2, r2, r3
 294 00fc 7B68     		ldr	r3, [r7, #4]
 295 00fe 1A61     		str	r2, [r3, #16]
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     int px = p->posx;
 296              		.loc 1 110 0
 297 0100 7B68     		ldr	r3, [r7, #4]
 298 0102 DB68     		ldr	r3, [r3, #12]
 299 0104 FB60     		str	r3, [r7, #12]
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     int py = p->posy;
 300              		.loc 1 111 0
 301 0106 7B68     		ldr	r3, [r7, #4]
 302 0108 1B69     		ldr	r3, [r3, #16]
 303 010a BB60     		str	r3, [r7, #8]
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     draw_object(p);
 304              		.loc 1 113 0
 305 010c 7B68     		ldr	r3, [r7, #4]
 306 010e 1800     		movs	r0, r3
 307 0110 FFF7FEFF 		bl	draw_object
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
 308              		.loc 1 114 0
 309 0114 C046     		nop
 310 0116 BD46     		mov	sp, r7
 311 0118 04B0     		add	sp, sp, #16
 312              		@ sp needed
 313 011a 80BD     		pop	{r7, pc}
 314              		.cfi_endproc
 315              	.LFE3:
 317              		.data
 318              		.align	2
 321              	ball:
 322 0034 00000000 		.word	ball_geometry
 323 0038 00000000 		.word	0
 324 003c 00000000 		.word	0
 325 0040 01000000 		.word	1
 326 0044 01000000 		.word	1
 327 0048 00000000 		.word	draw_object
 328 004c 00000000 		.word	clear_object
 329 0050 00000000 		.word	move_object
 330 0054 00000000 		.word	set_object_speed
 331              		.section	.start_section,"ax",%progbits
 332              		.align	1
 333              		.global	startup
 334              		.syntax unified
 335              		.code	16
 336              		.thumb_func
 337              		.fpu softvfp
 339              	startup:
 340              	.LFB4:
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     static OBJECT ball = {
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     &ball_geometry,
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     0,0,
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     1,1,
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     draw_object,
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     clear_object,
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     move_object,
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     set_object_speed
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     };
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void startup ( void )
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 341              		.loc 1 128 0
 342              		.cfi_startproc
 343              		@ Naked Function: prologue and epilogue provided by programmer.
 344              		@ args = 0, pretend = 0, frame = 0
 345              		@ frame_needed = 1, uses_anonymous_args = 0
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** __asm volatile(
 346              		.loc 1 129 0
 347              		.syntax divided
 348              	@ 129 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong/startup.c" 1
 349 0000 0248     		 LDR R0,=0x2001C000
 350 0002 8546     	 MOV SP,R0
 351 0004 FFF7FEFF 	 BL main
 352 0008 FEE7     	_exit: B .
 353              	
 354              	@ 0 "" 2
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	" MOV SP,R0\n"
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	" BL main\n"				/* call main */
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	"_exit: B .\n"				/* never return */
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	) ;
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 355              		.loc 1 135 0
 356              		.thumb
 357              		.syntax unified
 358 000a C046     		nop
 359              		.cfi_endproc
 360              	.LFE4:
 362              		.text
 363              		.align	1
 364              		.global	init_app
 365              		.syntax unified
 366              		.code	16
 367              		.thumb_func
 368              		.fpu softvfp
 370              	init_app:
 371              	.LFB5:
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void init_app(void){
 372              		.loc 1 136 0
 373              		.cfi_startproc
 374              		@ args = 0, pretend = 0, frame = 0
 375              		@ frame_needed = 1, uses_anonymous_args = 0
 376 011c 80B5     		push	{r7, lr}
 377              		.cfi_def_cfa_offset 8
 378              		.cfi_offset 7, -8
 379              		.cfi_offset 14, -4
 380 011e 00AF     		add	r7, sp, #0
 381              		.cfi_def_cfa_register 7
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     *GPIOE_MODER = 0x55555555;
 382              		.loc 1 137 0
 383 0120 0F4B     		ldr	r3, .L11
 384 0122 104A     		ldr	r2, .L11+4
 385 0124 1A60     		str	r2, [r3]
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	/*sätter våra in och ut portar*/
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	*GPIOE_OTYPER = 0x70;
 386              		.loc 1 139 0
 387 0126 104B     		ldr	r3, .L11+8
 388 0128 7022     		movs	r2, #112
 389 012a 1A80     		strh	r2, [r3]
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	*GPIOE_PUPDR = 0x0AA;
 390              		.loc 1 140 0
 391 012c 0F4B     		ldr	r3, .L11+12
 392 012e AA22     		movs	r2, #170
 393 0130 1A60     		str	r2, [r3]
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
 394              		.loc 1 141 0
 395 0132 0F4B     		ldr	r3, .L11+16
 396 0134 0E4A     		ldr	r2, .L11+16
 397 0136 1278     		ldrb	r2, [r2]
 398 0138 D2B2     		uxtb	r2, r2
 399 013a 1A70     		strb	r2, [r3]
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     *GPIOD_MODER = 0x55005555;
 400              		.loc 1 143 0
 401 013c 0D4B     		ldr	r3, .L11+20
 402 013e 0E4A     		ldr	r2, .L11+24
 403 0140 1A60     		str	r2, [r3]
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	/*sätter våra in och ut portar*/
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	*GPIOD_OTYPER = 0x70;
 404              		.loc 1 145 0
 405 0142 0E4B     		ldr	r3, .L11+28
 406 0144 7022     		movs	r2, #112
 407 0146 1A80     		strh	r2, [r3]
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	*GPIOD_PUPDR = 0x0AA;
 408              		.loc 1 146 0
 409 0148 0D4B     		ldr	r3, .L11+32
 410 014a AA22     		movs	r2, #170
 411 014c 1A60     		str	r2, [r3]
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	*GPIOD_ODR_HIGH = *GPIOD_ODR_HIGH & 0x00FF;
 412              		.loc 1 147 0
 413 014e 0D4B     		ldr	r3, .L11+36
 414 0150 0C4A     		ldr	r2, .L11+36
 415 0152 1278     		ldrb	r2, [r2]
 416 0154 D2B2     		uxtb	r2, r2
 417 0156 1A70     		strb	r2, [r3]
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
 418              		.loc 1 148 0
 419 0158 C046     		nop
 420 015a BD46     		mov	sp, r7
 421              		@ sp needed
 422 015c 80BD     		pop	{r7, pc}
 423              	.L12:
 424 015e C046     		.align	2
 425              	.L11:
 426 0160 00100240 		.word	1073876992
 427 0164 55555555 		.word	1431655765
 428 0168 04100240 		.word	1073876996
 429 016c 0C100240 		.word	1073877004
 430 0170 15100240 		.word	1073877013
 431 0174 000C0240 		.word	1073875968
 432 0178 55550055 		.word	1426085205
 433 017c 040C0240 		.word	1073875972
 434 0180 0C0C0240 		.word	1073875980
 435 0184 150C0240 		.word	1073875989
 436              		.cfi_endproc
 437              	.LFE5:
 439              		.align	1
 440              		.global	getCol
 441              		.syntax unified
 442              		.code	16
 443              		.thumb_func
 444              		.fpu softvfp
 446              	getCol:
 447              	.LFB6:
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     int getCol ( void )
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 448              		.loc 1 150 0
 449              		.cfi_startproc
 450              		@ args = 0, pretend = 0, frame = 8
 451              		@ frame_needed = 1, uses_anonymous_args = 0
 452 0188 80B5     		push	{r7, lr}
 453              		.cfi_def_cfa_offset 8
 454              		.cfi_offset 7, -8
 455              		.cfi_offset 14, -4
 456 018a 82B0     		sub	sp, sp, #8
 457              		.cfi_def_cfa_offset 16
 458 018c 00AF     		add	r7, sp, #0
 459              		.cfi_def_cfa_register 7
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	/*om nÃ¥gon tangent i aktiverad rad Ã¤r nedtryckt sÃ¥ skall dess kolumn nummer returneras. A
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	unsigned char c;
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	c = *GPIOD_IDR_HIGH;
 460              		.loc 1 153 0
 461 018e 124A     		ldr	r2, .L19
 462 0190 FB1D     		adds	r3, r7, #7
 463 0192 1278     		ldrb	r2, [r2]
 464 0194 1A70     		strb	r2, [r3]
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	if ( c & 0x8 ) return 4;
 465              		.loc 1 154 0
 466 0196 FB1D     		adds	r3, r7, #7
 467 0198 1B78     		ldrb	r3, [r3]
 468 019a 0822     		movs	r2, #8
 469 019c 1340     		ands	r3, r2
 470 019e 01D0     		beq	.L14
 471              		.loc 1 154 0 is_stmt 0 discriminator 1
 472 01a0 0423     		movs	r3, #4
 473 01a2 15E0     		b	.L15
 474              	.L14:
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	if ( c & 0x4 ) return 3;
 475              		.loc 1 155 0 is_stmt 1
 476 01a4 FB1D     		adds	r3, r7, #7
 477 01a6 1B78     		ldrb	r3, [r3]
 478 01a8 0422     		movs	r2, #4
 479 01aa 1340     		ands	r3, r2
 480 01ac 01D0     		beq	.L16
 481              		.loc 1 155 0 is_stmt 0 discriminator 1
 482 01ae 0323     		movs	r3, #3
 483 01b0 0EE0     		b	.L15
 484              	.L16:
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	if ( c & 0x2 ) return 2;
 485              		.loc 1 156 0 is_stmt 1
 486 01b2 FB1D     		adds	r3, r7, #7
 487 01b4 1B78     		ldrb	r3, [r3]
 488 01b6 0222     		movs	r2, #2
 489 01b8 1340     		ands	r3, r2
 490 01ba 01D0     		beq	.L17
 491              		.loc 1 156 0 is_stmt 0 discriminator 1
 492 01bc 0223     		movs	r3, #2
 493 01be 07E0     		b	.L15
 494              	.L17:
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	if ( c & 0x1 ) return 1;
 495              		.loc 1 157 0 is_stmt 1
 496 01c0 FB1D     		adds	r3, r7, #7
 497 01c2 1B78     		ldrb	r3, [r3]
 498 01c4 0122     		movs	r2, #1
 499 01c6 1340     		ands	r3, r2
 500 01c8 01D0     		beq	.L18
 501              		.loc 1 157 0 is_stmt 0 discriminator 1
 502 01ca 0123     		movs	r3, #1
 503 01cc 00E0     		b	.L15
 504              	.L18:
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	return 0;
 505              		.loc 1 158 0 is_stmt 1
 506 01ce 0023     		movs	r3, #0
 507              	.L15:
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 508              		.loc 1 159 0
 509 01d0 1800     		movs	r0, r3
 510 01d2 BD46     		mov	sp, r7
 511 01d4 02B0     		add	sp, sp, #8
 512              		@ sp needed
 513 01d6 80BD     		pop	{r7, pc}
 514              	.L20:
 515              		.align	2
 516              	.L19:
 517 01d8 110C0240 		.word	1073875985
 518              		.cfi_endproc
 519              	.LFE6:
 521              		.align	1
 522              		.global	activateRow
 523              		.syntax unified
 524              		.code	16
 525              		.thumb_func
 526              		.fpu softvfp
 528              	activateRow:
 529              	.LFB7:
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void activateRow ( unsigned int row )
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 530              		.loc 1 162 0
 531              		.cfi_startproc
 532              		@ args = 0, pretend = 0, frame = 8
 533              		@ frame_needed = 1, uses_anonymous_args = 0
 534 01dc 80B5     		push	{r7, lr}
 535              		.cfi_def_cfa_offset 8
 536              		.cfi_offset 7, -8
 537              		.cfi_offset 14, -4
 538 01de 82B0     		sub	sp, sp, #8
 539              		.cfi_def_cfa_offset 16
 540 01e0 00AF     		add	r7, sp, #0
 541              		.cfi_def_cfa_register 7
 542 01e2 7860     		str	r0, [r7, #4]
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	/*ativerar raden fÃ¶r den nedtryckta tangented och man borde deaktivera de andra*/
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	switch ( row )
 543              		.loc 1 164 0
 544 01e4 7B68     		ldr	r3, [r7, #4]
 545 01e6 042B     		cmp	r3, #4
 546 01e8 19D8     		bhi	.L29
 547 01ea 7B68     		ldr	r3, [r7, #4]
 548 01ec 9A00     		lsls	r2, r3, #2
 549 01ee 0E4B     		ldr	r3, .L30
 550 01f0 D318     		adds	r3, r2, r3
 551 01f2 1B68     		ldr	r3, [r3]
 552 01f4 9F46     		mov	pc, r3
 553              		.section	.rodata
 554              		.align	2
 555              	.L24:
 556 0000 16020000 		.word	.L23
 557 0004 F6010000 		.word	.L25
 558 0008 FE010000 		.word	.L26
 559 000c 06020000 		.word	.L27
 560 0010 0E020000 		.word	.L28
 561              		.text
 562              	.L25:
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	{
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	case 1: *GPIOD_ODR_HIGH = 0x10; break;
 563              		.loc 1 166 0
 564 01f6 0D4B     		ldr	r3, .L30+4
 565 01f8 1022     		movs	r2, #16
 566 01fa 1A70     		strb	r2, [r3]
 567 01fc 0FE0     		b	.L22
 568              	.L26:
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	case 2: *GPIOD_ODR_HIGH = 0x20; break;
 569              		.loc 1 167 0
 570 01fe 0B4B     		ldr	r3, .L30+4
 571 0200 2022     		movs	r2, #32
 572 0202 1A70     		strb	r2, [r3]
 573 0204 0BE0     		b	.L22
 574              	.L27:
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	case 3: *GPIOD_ODR_HIGH = 0x40; break;
 575              		.loc 1 168 0
 576 0206 094B     		ldr	r3, .L30+4
 577 0208 4022     		movs	r2, #64
 578 020a 1A70     		strb	r2, [r3]
 579 020c 07E0     		b	.L22
 580              	.L28:
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	case 4: *GPIOD_ODR_HIGH = 0x80; break;
 581              		.loc 1 169 0
 582 020e 074B     		ldr	r3, .L30+4
 583 0210 8022     		movs	r2, #128
 584 0212 1A70     		strb	r2, [r3]
 585 0214 03E0     		b	.L22
 586              	.L23:
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	case 0: *GPIOD_ODR_HIGH = 0x00; break;
 587              		.loc 1 170 0
 588 0216 054B     		ldr	r3, .L30+4
 589 0218 0022     		movs	r2, #0
 590 021a 1A70     		strb	r2, [r3]
 591 021c C046     		nop
 592              	.L22:
 593              	.L29:
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	}
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 594              		.loc 1 172 0
 595 021e C046     		nop
 596 0220 BD46     		mov	sp, r7
 597 0222 02B0     		add	sp, sp, #8
 598              		@ sp needed
 599 0224 80BD     		pop	{r7, pc}
 600              	.L31:
 601 0226 C046     		.align	2
 602              	.L30:
 603 0228 00000000 		.word	.L24
 604 022c 150C0240 		.word	1073875989
 605              		.cfi_endproc
 606              	.LFE7:
 608              		.section	.rodata
 609              		.align	2
 610              	.LC0:
 611 0014 01       		.byte	1
 612 0015 02       		.byte	2
 613 0016 03       		.byte	3
 614 0017 0A       		.byte	10
 615 0018 04       		.byte	4
 616 0019 05       		.byte	5
 617 001a 06       		.byte	6
 618 001b 0B       		.byte	11
 619 001c 07       		.byte	7
 620 001d 08       		.byte	8
 621 001e 09       		.byte	9
 622 001f 0C       		.byte	12
 623 0020 0E       		.byte	14
 624 0021 00       		.byte	0
 625 0022 0F       		.byte	15
 626 0023 0D       		.byte	13
 627              		.text
 628              		.align	1
 629              		.global	keyb
 630              		.syntax unified
 631              		.code	16
 632              		.thumb_func
 633              		.fpu softvfp
 635              	keyb:
 636              	.LFB8:
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     unsigned char keyb ( void ) 
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 637              		.loc 1 175 0
 638              		.cfi_startproc
 639              		@ args = 0, pretend = 0, frame = 24
 640              		@ frame_needed = 1, uses_anonymous_args = 0
 641 0230 90B5     		push	{r4, r7, lr}
 642              		.cfi_def_cfa_offset 12
 643              		.cfi_offset 4, -12
 644              		.cfi_offset 7, -8
 645              		.cfi_offset 14, -4
 646 0232 87B0     		sub	sp, sp, #28
 647              		.cfi_def_cfa_offset 40
 648 0234 00AF     		add	r7, sp, #0
 649              		.cfi_def_cfa_register 7
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD};
 650              		.loc 1 176 0
 651 0236 3B00     		movs	r3, r7
 652 0238 164A     		ldr	r2, .L38
 653 023a 13CA     		ldmia	r2!, {r0, r1, r4}
 654 023c 13C3     		stmia	r3!, {r0, r1, r4}
 655 023e 1268     		ldr	r2, [r2]
 656 0240 1A60     		str	r2, [r3]
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	int row, col;
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	for (row=1; row<=4; row++){
 657              		.loc 1 178 0
 658 0242 0123     		movs	r3, #1
 659 0244 7B61     		str	r3, [r7, #20]
 660 0246 19E0     		b	.L33
 661              	.L36:
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 		activateRow( row );
 662              		.loc 1 179 0
 663 0248 7B69     		ldr	r3, [r7, #20]
 664 024a 1800     		movs	r0, r3
 665 024c FFF7FEFF 		bl	activateRow
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 		if( ( col = getCol() ) ) /* om col blir tilldelat nol kommer inte ifsatsen att kÃ¶ras*/
 666              		.loc 1 180 0
 667 0250 FFF7FEFF 		bl	getCol
 668 0254 0300     		movs	r3, r0
 669 0256 3B61     		str	r3, [r7, #16]
 670 0258 3B69     		ldr	r3, [r7, #16]
 671 025a 002B     		cmp	r3, #0
 672 025c 0BD0     		beq	.L34
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 		{
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 			activateRow( 0 ); /*sÃ¤tter raden til 0 sÃ¥ att den lir nolstÃ¤ld och att avlÃ¤sning eft
 673              		.loc 1 182 0
 674 025e 0020     		movs	r0, #0
 675 0260 FFF7FEFF 		bl	activateRow
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 			return key[ 4*(row-1)+(col-1) ];
 676              		.loc 1 183 0
 677 0264 7B69     		ldr	r3, [r7, #20]
 678 0266 013B     		subs	r3, r3, #1
 679 0268 9A00     		lsls	r2, r3, #2
 680 026a 3B69     		ldr	r3, [r7, #16]
 681 026c 013B     		subs	r3, r3, #1
 682 026e D318     		adds	r3, r2, r3
 683 0270 3A00     		movs	r2, r7
 684 0272 D35C     		ldrb	r3, [r2, r3]
 685 0274 09E0     		b	.L37
 686              	.L34:
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 		activateRow( row );
 687              		.loc 1 178 0 discriminator 2
 688 0276 7B69     		ldr	r3, [r7, #20]
 689 0278 0133     		adds	r3, r3, #1
 690 027a 7B61     		str	r3, [r7, #20]
 691              	.L33:
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 		activateRow( row );
 692              		.loc 1 178 0 is_stmt 0 discriminator 1
 693 027c 7B69     		ldr	r3, [r7, #20]
 694 027e 042B     		cmp	r3, #4
 695 0280 E2DD     		ble	.L36
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 		}
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	}
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	activateRow ( 0 );
 696              		.loc 1 186 0 is_stmt 1
 697 0282 0020     		movs	r0, #0
 698 0284 FFF7FEFF 		bl	activateRow
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 	return 0xFF;
 699              		.loc 1 187 0
 700 0288 FF23     		movs	r3, #255
 701              	.L37:
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 702              		.loc 1 188 0 discriminator 1
 703 028a 1800     		movs	r0, r3
 704 028c BD46     		mov	sp, r7
 705 028e 07B0     		add	sp, sp, #28
 706              		@ sp needed
 707 0290 90BD     		pop	{r4, r7, pc}
 708              	.L39:
 709 0292 C046     		.align	2
 710              	.L38:
 711 0294 14000000 		.word	.LC0
 712              		.cfi_endproc
 713              	.LFE8:
 715              		.align	1
 716              		.global	main
 717              		.syntax unified
 718              		.code	16
 719              		.thumb_func
 720              		.fpu softvfp
 722              	main:
 723              	.LFB9:
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void main(void)
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 724              		.loc 1 190 0
 725              		.cfi_startproc
 726              		@ args = 0, pretend = 0, frame = 8
 727              		@ frame_needed = 1, uses_anonymous_args = 0
 728 0298 90B5     		push	{r4, r7, lr}
 729              		.cfi_def_cfa_offset 12
 730              		.cfi_offset 4, -12
 731              		.cfi_offset 7, -8
 732              		.cfi_offset 14, -4
 733 029a 83B0     		sub	sp, sp, #12
 734              		.cfi_def_cfa_offset 24
 735 029c 00AF     		add	r7, sp, #0
 736              		.cfi_def_cfa_register 7
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     init_app();
 737              		.loc 1 191 0
 738 029e FFF7FEFF 		bl	init_app
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     char c;
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     POBJECT p = &ball;
 739              		.loc 1 193 0
 740 02a2 1F4B     		ldr	r3, .L48
 741 02a4 7B60     		str	r3, [r7, #4]
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_initialize();
 742              		.loc 1 194 0
 743 02a6 FFF7FEFF 		bl	graphic_initialize
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_clear_screen();// simulator onely
 744              		.loc 1 195 0
 745 02aa FFF7FEFF 		bl	graphic_clear_screen
 746              	.L47:
 747              	.LBB6:
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****  while(1){
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     p->move(p);
 748              		.loc 1 197 0
 749 02ae 7B68     		ldr	r3, [r7, #4]
 750 02b0 DB69     		ldr	r3, [r3, #28]
 751 02b2 7A68     		ldr	r2, [r7, #4]
 752 02b4 1000     		movs	r0, r2
 753 02b6 9847     		blx	r3
 754              	.LVL0:
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      delay_milli(40);
 755              		.loc 1 198 0
 756 02b8 2820     		movs	r0, #40
 757 02ba FFF7FEFF 		bl	delay_milli
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      c = keyb();
 758              		.loc 1 199 0
 759 02be FC1C     		adds	r4, r7, #3
 760 02c0 FFF7FEFF 		bl	keyb
 761 02c4 0300     		movs	r3, r0
 762 02c6 2370     		strb	r3, [r4]
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      switch(c)
 763              		.loc 1 200 0
 764 02c8 FB1C     		adds	r3, r7, #3
 765 02ca 1B78     		ldrb	r3, [r3]
 766 02cc 042B     		cmp	r3, #4
 767 02ce 0FD0     		beq	.L42
 768 02d0 02DC     		bgt	.L43
 769 02d2 022B     		cmp	r3, #2
 770 02d4 14D0     		beq	.L44
 771 02d6 22E0     		b	.L41
 772              	.L43:
 773 02d8 062B     		cmp	r3, #6
 774 02da 02D0     		beq	.L45
 775 02dc 082B     		cmp	r3, #8
 776 02de 17D0     		beq	.L46
 777 02e0 1DE0     		b	.L41
 778              	.L45:
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      {
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          case 6: p->set_speed(p,2,0);
 779              		.loc 1 202 0
 780 02e2 7B68     		ldr	r3, [r7, #4]
 781 02e4 1B6A     		ldr	r3, [r3, #32]
 782 02e6 7868     		ldr	r0, [r7, #4]
 783 02e8 0022     		movs	r2, #0
 784 02ea 0221     		movs	r1, #2
 785 02ec 9847     		blx	r3
 786              	.LVL1:
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          break;
 787              		.loc 1 203 0
 788 02ee 16E0     		b	.L41
 789              	.L42:
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          case 4: p->set_speed(p,-2,0);
 790              		.loc 1 204 0
 791 02f0 7B68     		ldr	r3, [r7, #4]
 792 02f2 1B6A     		ldr	r3, [r3, #32]
 793 02f4 0222     		movs	r2, #2
 794 02f6 5142     		rsbs	r1, r2, #0
 795 02f8 7868     		ldr	r0, [r7, #4]
 796 02fa 0022     		movs	r2, #0
 797 02fc 9847     		blx	r3
 798              	.LVL2:
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          break;
 799              		.loc 1 205 0
 800 02fe 0EE0     		b	.L41
 801              	.L44:
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          case 2: p->set_speed(p,0,-2);
 802              		.loc 1 206 0
 803 0300 7B68     		ldr	r3, [r7, #4]
 804 0302 1B6A     		ldr	r3, [r3, #32]
 805 0304 0222     		movs	r2, #2
 806 0306 5242     		rsbs	r2, r2, #0
 807 0308 7868     		ldr	r0, [r7, #4]
 808 030a 0021     		movs	r1, #0
 809 030c 9847     		blx	r3
 810              	.LVL3:
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          break;
 811              		.loc 1 207 0
 812 030e 06E0     		b	.L41
 813              	.L46:
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          case 8: p->set_speed(p,0,2);
 814              		.loc 1 208 0
 815 0310 7B68     		ldr	r3, [r7, #4]
 816 0312 1B6A     		ldr	r3, [r3, #32]
 817 0314 7868     		ldr	r0, [r7, #4]
 818 0316 0222     		movs	r2, #2
 819 0318 0021     		movs	r1, #0
 820 031a 9847     		blx	r3
 821              	.LVL4:
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          break;
 822              		.loc 1 209 0
 823 031c C046     		nop
 824              	.L41:
 825              	.LBE6:
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     p->move(p);
 826              		.loc 1 196 0
 827 031e C6E7     		b	.L47
 828              	.L49:
 829              		.align	2
 830              	.L48:
 831 0320 34000000 		.word	ball
 832              		.cfi_endproc
 833              	.LFE9:
 835              		.align	1
 836              		.global	delay_250ns
 837              		.syntax unified
 838              		.code	16
 839              		.thumb_func
 840              		.fpu softvfp
 842              	delay_250ns:
 843              	.LFB10:
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****          }
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****      }
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     
 213:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 214:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 215:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void delay_250ns(void)
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 844              		.loc 1 216 0
 845              		.cfi_startproc
 846              		@ args = 0, pretend = 0, frame = 0
 847              		@ frame_needed = 1, uses_anonymous_args = 0
 848 0324 80B5     		push	{r7, lr}
 849              		.cfi_def_cfa_offset 8
 850              		.cfi_offset 7, -8
 851              		.cfi_offset 14, -4
 852 0326 00AF     		add	r7, sp, #0
 853              		.cfi_def_cfa_register 7
 217:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     *STK_CTRL = 0;
 854              		.loc 1 217 0
 855 0328 0C4B     		ldr	r3, .L52
 856 032a 0022     		movs	r2, #0
 857 032c 1A60     		str	r2, [r3]
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     *STK_LOAD = (168/4)-1;   // minst 500 ns
 858              		.loc 1 218 0
 859 032e 0C4B     		ldr	r3, .L52+4
 860 0330 2922     		movs	r2, #41
 861 0332 1A60     		str	r2, [r3]
 219:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     *STK_VAL = 0;
 862              		.loc 1 219 0
 863 0334 0B4B     		ldr	r3, .L52+8
 864 0336 0022     		movs	r2, #0
 865 0338 1A60     		str	r2, [r3]
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     *STK_CTRL = 5;
 866              		.loc 1 220 0
 867 033a 084B     		ldr	r3, .L52
 868 033c 0522     		movs	r2, #5
 869 033e 1A60     		str	r2, [r3]
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     while((* STK_CTRL & 0x10000) == 0) ;
 870              		.loc 1 221 0
 871 0340 C046     		nop
 872              	.L51:
 873              		.loc 1 221 0 is_stmt 0 discriminator 1
 874 0342 064B     		ldr	r3, .L52
 875 0344 1A68     		ldr	r2, [r3]
 876 0346 8023     		movs	r3, #128
 877 0348 5B02     		lsls	r3, r3, #9
 878 034a 1340     		ands	r3, r2
 879 034c F9D0     		beq	.L51
 222:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     *STK_CTRL = 0;
 880              		.loc 1 222 0 is_stmt 1
 881 034e 034B     		ldr	r3, .L52
 882 0350 0022     		movs	r2, #0
 883 0352 1A60     		str	r2, [r3]
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 884              		.loc 1 223 0
 885 0354 C046     		nop
 886 0356 BD46     		mov	sp, r7
 887              		@ sp needed
 888 0358 80BD     		pop	{r7, pc}
 889              	.L53:
 890 035a C046     		.align	2
 891              	.L52:
 892 035c 10E000E0 		.word	-536813552
 893 0360 14E000E0 		.word	-536813548
 894 0364 18E000E0 		.word	-536813544
 895              		.cfi_endproc
 896              	.LFE10:
 898              		.align	1
 899              		.global	delay_mikro
 900              		.syntax unified
 901              		.code	16
 902              		.thumb_func
 903              		.fpu softvfp
 905              	delay_mikro:
 906              	.LFB11:
 224:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 225:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 226:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void delay_mikro(unsigned int us)
 227:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 907              		.loc 1 227 0
 908              		.cfi_startproc
 909              		@ args = 0, pretend = 0, frame = 8
 910              		@ frame_needed = 1, uses_anonymous_args = 0
 911 0368 80B5     		push	{r7, lr}
 912              		.cfi_def_cfa_offset 8
 913              		.cfi_offset 7, -8
 914              		.cfi_offset 14, -4
 915 036a 82B0     		sub	sp, sp, #8
 916              		.cfi_def_cfa_offset 16
 917 036c 00AF     		add	r7, sp, #0
 918              		.cfi_def_cfa_register 7
 919 036e 7860     		str	r0, [r7, #4]
 228:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #ifdef   SIMULATOR
 229:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     us = us / 1000;
 230:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     us++;
 231:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** #endif
 232:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     while(us < 0){
 920              		.loc 1 232 0
 921 0370 C046     		nop
 233:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         {
 234:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             delay_250ns();
 235:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             delay_250ns();
 236:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             delay_250ns();
 237:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             delay_250ns();
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             us--;
 239:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         }
 240:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
 241:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 922              		.loc 1 241 0
 923 0372 C046     		nop
 924 0374 BD46     		mov	sp, r7
 925 0376 02B0     		add	sp, sp, #8
 926              		@ sp needed
 927 0378 80BD     		pop	{r7, pc}
 928              		.cfi_endproc
 929              	.LFE11:
 931              		.global	__aeabi_uidiv
 932              		.align	1
 933              		.global	delay_milli
 934              		.syntax unified
 935              		.code	16
 936              		.thumb_func
 937              		.fpu softvfp
 939              	delay_milli:
 940              	.LFB12:
 242:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 243:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void delay_milli(unsigned ms)
 244:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** {
 941              		.loc 1 244 0
 942              		.cfi_startproc
 943              		@ args = 0, pretend = 0, frame = 8
 944              		@ frame_needed = 1, uses_anonymous_args = 0
 945 037a 80B5     		push	{r7, lr}
 946              		.cfi_def_cfa_offset 8
 947              		.cfi_offset 7, -8
 948              		.cfi_offset 14, -4
 949 037c 82B0     		sub	sp, sp, #8
 950              		.cfi_def_cfa_offset 16
 951 037e 00AF     		add	r7, sp, #0
 952              		.cfi_def_cfa_register 7
 953 0380 7860     		str	r0, [r7, #4]
 245:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 246:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     ms = ms/1000;// simulator onely
 954              		.loc 1 246 0
 955 0382 7A68     		ldr	r2, [r7, #4]
 956 0384 FA23     		movs	r3, #250
 957 0386 9900     		lsls	r1, r3, #2
 958 0388 1000     		movs	r0, r2
 959 038a FFF7FEFF 		bl	__aeabi_uidiv
 960              	.LVL5:
 961 038e 0300     		movs	r3, r0
 962 0390 7B60     		str	r3, [r7, #4]
 247:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     ms++;//simulator
 963              		.loc 1 247 0
 964 0392 7B68     		ldr	r3, [r7, #4]
 965 0394 0133     		adds	r3, r3, #1
 966 0396 7B60     		str	r3, [r7, #4]
 248:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** 
 249:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     while(ms > 0){
 967              		.loc 1 249 0
 968 0398 07E0     		b	.L56
 969              	.L57:
 250:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         {
 251:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             delay_mikro(1000);
 970              		.loc 1 251 0
 971 039a FA23     		movs	r3, #250
 972 039c 9B00     		lsls	r3, r3, #2
 973 039e 1800     		movs	r0, r3
 974 03a0 FFF7FEFF 		bl	delay_mikro
 252:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             ms--;
 975              		.loc 1 252 0
 976 03a4 7B68     		ldr	r3, [r7, #4]
 977 03a6 013B     		subs	r3, r3, #1
 978 03a8 7B60     		str	r3, [r7, #4]
 979              	.L56:
 249:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         {
 980              		.loc 1 249 0
 981 03aa 7B68     		ldr	r3, [r7, #4]
 982 03ac 002B     		cmp	r3, #0
 983 03ae F4D1     		bne	.L57
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****             
 254:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****         }
 255:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 984              		.loc 1 256 0
 985 03b0 C046     		nop
 986 03b2 BD46     		mov	sp, r7
 987 03b4 02B0     		add	sp, sp, #8
 988              		@ sp needed
 989 03b6 80BD     		pop	{r7, pc}
 990              		.cfi_endproc
 991              	.LFE12:
 993              		.align	1
 994              		.global	delay_500ns
 995              		.syntax unified
 996              		.code	16
 997              		.thumb_func
 998              		.fpu softvfp
 1000              	delay_500ns:
 1001              	.LFB13:
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void delay_500ns(void){
 1002              		.loc 1 257 0
 1003              		.cfi_startproc
 1004              		@ args = 0, pretend = 0, frame = 0
 1005              		@ frame_needed = 1, uses_anonymous_args = 0
 1006 03b8 80B5     		push	{r7, lr}
 1007              		.cfi_def_cfa_offset 8
 1008              		.cfi_offset 7, -8
 1009              		.cfi_offset 14, -4
 1010 03ba 00AF     		add	r7, sp, #0
 1011              		.cfi_def_cfa_register 7
 258:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     delay_250ns();
 1012              		.loc 1 258 0
 1013 03bc FFF7FEFF 		bl	delay_250ns
 259:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     delay_250ns();
 1014              		.loc 1 259 0
 1015 03c0 FFF7FEFF 		bl	delay_250ns
 260:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     }
 1016              		.loc 1 260 0
 1017 03c4 C046     		nop
 1018 03c6 BD46     		mov	sp, r7
 1019              		@ sp needed
 1020 03c8 80BD     		pop	{r7, pc}
 1021              		.cfi_endproc
 1022              	.LFE13:
 1024              		.align	1
 1025              		.syntax unified
 1026              		.code	16
 1027              		.thumb_func
 1028              		.fpu softvfp
 1030              	graphic_ctrl_bit_set:
 1031              	.LFB14:
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** static void graphic_ctrl_bit_set(uint8_t x) {
 1032              		.loc 1 261 0
 1033              		.cfi_startproc
 1034              		@ args = 0, pretend = 0, frame = 16
 1035              		@ frame_needed = 1, uses_anonymous_args = 0
 1036 03ca 80B5     		push	{r7, lr}
 1037              		.cfi_def_cfa_offset 8
 1038              		.cfi_offset 7, -8
 1039              		.cfi_offset 14, -4
 1040 03cc 84B0     		sub	sp, sp, #16
 1041              		.cfi_def_cfa_offset 24
 1042 03ce 00AF     		add	r7, sp, #0
 1043              		.cfi_def_cfa_register 7
 1044 03d0 0200     		movs	r2, r0
 1045 03d2 FB1D     		adds	r3, r7, #7
 1046 03d4 1A70     		strb	r2, [r3]
 262:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** uint8_t c;
 263:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c = *GPIOE_ODR_LOW;
 1047              		.loc 1 263 0
 1048 03d6 124A     		ldr	r2, .L60
 1049 03d8 0F23     		movs	r3, #15
 1050 03da FB18     		adds	r3, r7, r3
 1051 03dc 1278     		ldrb	r2, [r2]
 1052 03de 1A70     		strb	r2, [r3]
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c &= ~B_SELECT;
 1053              		.loc 1 264 0
 1054 03e0 0F23     		movs	r3, #15
 1055 03e2 FB18     		adds	r3, r7, r3
 1056 03e4 0F22     		movs	r2, #15
 1057 03e6 BA18     		adds	r2, r7, r2
 1058 03e8 1278     		ldrb	r2, [r2]
 1059 03ea 0421     		movs	r1, #4
 1060 03ec 8A43     		bics	r2, r1
 1061 03ee 1A70     		strb	r2, [r3]
 265:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c |= (~B_SELECT & x);
 1062              		.loc 1 265 0
 1063 03f0 FB1D     		adds	r3, r7, #7
 1064 03f2 1B78     		ldrb	r3, [r3]
 1065 03f4 5BB2     		sxtb	r3, r3
 1066 03f6 0422     		movs	r2, #4
 1067 03f8 9343     		bics	r3, r2
 1068 03fa 5AB2     		sxtb	r2, r3
 1069 03fc 0F23     		movs	r3, #15
 1070 03fe FB18     		adds	r3, r7, r3
 1071 0400 1B78     		ldrb	r3, [r3]
 1072 0402 5BB2     		sxtb	r3, r3
 1073 0404 1343     		orrs	r3, r2
 1074 0406 5AB2     		sxtb	r2, r3
 1075 0408 0F23     		movs	r3, #15
 1076 040a FB18     		adds	r3, r7, r3
 1077 040c 1A70     		strb	r2, [r3]
 266:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** *GPIOE_ODR_LOW = c;
 1078              		.loc 1 266 0
 1079 040e 044A     		ldr	r2, .L60
 1080 0410 0F23     		movs	r3, #15
 1081 0412 FB18     		adds	r3, r7, r3
 1082 0414 1B78     		ldrb	r3, [r3]
 1083 0416 1370     		strb	r3, [r2]
 267:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1084              		.loc 1 267 0
 1085 0418 C046     		nop
 1086 041a BD46     		mov	sp, r7
 1087 041c 04B0     		add	sp, sp, #16
 1088              		@ sp needed
 1089 041e 80BD     		pop	{r7, pc}
 1090              	.L61:
 1091              		.align	2
 1092              	.L60:
 1093 0420 14100240 		.word	1073877012
 1094              		.cfi_endproc
 1095              	.LFE14:
 1097              		.align	1
 1098              		.syntax unified
 1099              		.code	16
 1100              		.thumb_func
 1101              		.fpu softvfp
 1103              	graphic_ctrl_bit_clear:
 1104              	.LFB15:
 268:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** static void graphic_ctrl_bit_clear(uint8_t x) {
 1105              		.loc 1 268 0
 1106              		.cfi_startproc
 1107              		@ args = 0, pretend = 0, frame = 16
 1108              		@ frame_needed = 1, uses_anonymous_args = 0
 1109 0424 80B5     		push	{r7, lr}
 1110              		.cfi_def_cfa_offset 8
 1111              		.cfi_offset 7, -8
 1112              		.cfi_offset 14, -4
 1113 0426 84B0     		sub	sp, sp, #16
 1114              		.cfi_def_cfa_offset 24
 1115 0428 00AF     		add	r7, sp, #0
 1116              		.cfi_def_cfa_register 7
 1117 042a 0200     		movs	r2, r0
 1118 042c FB1D     		adds	r3, r7, #7
 1119 042e 1A70     		strb	r2, [r3]
 269:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** uint8_t c;
 270:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c = *GPIOE_ODR_LOW;
 1120              		.loc 1 270 0
 1121 0430 114A     		ldr	r2, .L63
 1122 0432 0F23     		movs	r3, #15
 1123 0434 FB18     		adds	r3, r7, r3
 1124 0436 1278     		ldrb	r2, [r2]
 1125 0438 1A70     		strb	r2, [r3]
 271:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c &= ~B_SELECT;
 1126              		.loc 1 271 0
 1127 043a 0F23     		movs	r3, #15
 1128 043c FB18     		adds	r3, r7, r3
 1129 043e 0F22     		movs	r2, #15
 1130 0440 BA18     		adds	r2, r7, r2
 1131 0442 1278     		ldrb	r2, [r2]
 1132 0444 0421     		movs	r1, #4
 1133 0446 8A43     		bics	r2, r1
 1134 0448 1A70     		strb	r2, [r3]
 272:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c &= ~x;
 1135              		.loc 1 272 0
 1136 044a FB1D     		adds	r3, r7, #7
 1137 044c 1B78     		ldrb	r3, [r3]
 1138 044e 5BB2     		sxtb	r3, r3
 1139 0450 DB43     		mvns	r3, r3
 1140 0452 5BB2     		sxtb	r3, r3
 1141 0454 0F22     		movs	r2, #15
 1142 0456 BA18     		adds	r2, r7, r2
 1143 0458 1278     		ldrb	r2, [r2]
 1144 045a 52B2     		sxtb	r2, r2
 1145 045c 1340     		ands	r3, r2
 1146 045e 5AB2     		sxtb	r2, r3
 1147 0460 0F23     		movs	r3, #15
 1148 0462 FB18     		adds	r3, r7, r3
 1149 0464 1A70     		strb	r2, [r3]
 273:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** *GPIOE_ODR_LOW = c;
 1150              		.loc 1 273 0
 1151 0466 044A     		ldr	r2, .L63
 1152 0468 0F23     		movs	r3, #15
 1153 046a FB18     		adds	r3, r7, r3
 1154 046c 1B78     		ldrb	r3, [r3]
 1155 046e 1370     		strb	r3, [r2]
 274:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1156              		.loc 1 274 0
 1157 0470 C046     		nop
 1158 0472 BD46     		mov	sp, r7
 1159 0474 04B0     		add	sp, sp, #16
 1160              		@ sp needed
 1161 0476 80BD     		pop	{r7, pc}
 1162              	.L64:
 1163              		.align	2
 1164              	.L63:
 1165 0478 14100240 		.word	1073877012
 1166              		.cfi_endproc
 1167              	.LFE15:
 1169              		.align	1
 1170              		.syntax unified
 1171              		.code	16
 1172              		.thumb_func
 1173              		.fpu softvfp
 1175              	select_controller:
 1176              	.LFB16:
 275:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** static void select_controller(uint8_t controller){
 1177              		.loc 1 275 0
 1178              		.cfi_startproc
 1179              		@ args = 0, pretend = 0, frame = 8
 1180              		@ frame_needed = 1, uses_anonymous_args = 0
 1181 047c 80B5     		push	{r7, lr}
 1182              		.cfi_def_cfa_offset 8
 1183              		.cfi_offset 7, -8
 1184              		.cfi_offset 14, -4
 1185 047e 82B0     		sub	sp, sp, #8
 1186              		.cfi_def_cfa_offset 16
 1187 0480 00AF     		add	r7, sp, #0
 1188              		.cfi_def_cfa_register 7
 1189 0482 0200     		movs	r2, r0
 1190 0484 FB1D     		adds	r3, r7, #7
 1191 0486 1A70     		strb	r2, [r3]
 276:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     switch(controller){
 1192              		.loc 1 276 0
 1193 0488 FB1D     		adds	r3, r7, #7
 1194 048a 1B78     		ldrb	r3, [r3]
 1195 048c 082B     		cmp	r3, #8
 1196 048e 0CD0     		beq	.L67
 1197 0490 02DC     		bgt	.L68
 1198 0492 002B     		cmp	r3, #0
 1199 0494 05D0     		beq	.L69
 277:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     case 0:
 278:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_clear(B_CS1|B_CS2);
 279:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 280:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     case B_CS1 :
 281:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_set(B_CS1);
 282:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_clear(B_CS2);
 283:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 284:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     case B_CS2 :
 285:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_set(B_CS2);
 286:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_clear(B_CS1);
 287:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 288:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     case B_CS1|B_CS2 :
 289:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_set(B_CS1|B_CS2);
 290:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 291:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 292:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1200              		.loc 1 292 0
 1201 0496 1AE0     		b	.L72
 1202              	.L68:
 276:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     switch(controller){
 1203              		.loc 1 276 0
 1204 0498 102B     		cmp	r3, #16
 1205 049a 0DD0     		beq	.L70
 1206 049c 182B     		cmp	r3, #24
 1207 049e 12D0     		beq	.L71
 1208              		.loc 1 292 0
 1209 04a0 15E0     		b	.L72
 1210              	.L69:
 278:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 1211              		.loc 1 278 0
 1212 04a2 1820     		movs	r0, #24
 1213 04a4 FFF7BEFF 		bl	graphic_ctrl_bit_clear
 279:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     case B_CS1 :
 1214              		.loc 1 279 0
 1215 04a8 11E0     		b	.L66
 1216              	.L67:
 281:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_clear(B_CS2);
 1217              		.loc 1 281 0
 1218 04aa 0820     		movs	r0, #8
 1219 04ac FFF78DFF 		bl	graphic_ctrl_bit_set
 282:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 1220              		.loc 1 282 0
 1221 04b0 1020     		movs	r0, #16
 1222 04b2 FFF7B7FF 		bl	graphic_ctrl_bit_clear
 283:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     case B_CS2 :
 1223              		.loc 1 283 0
 1224 04b6 0AE0     		b	.L66
 1225              	.L70:
 285:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     graphic_ctrl_bit_clear(B_CS1);
 1226              		.loc 1 285 0
 1227 04b8 1020     		movs	r0, #16
 1228 04ba FFF786FF 		bl	graphic_ctrl_bit_set
 286:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 1229              		.loc 1 286 0
 1230 04be 0820     		movs	r0, #8
 1231 04c0 FFF7B0FF 		bl	graphic_ctrl_bit_clear
 287:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     case B_CS1|B_CS2 :
 1232              		.loc 1 287 0
 1233 04c4 03E0     		b	.L66
 1234              	.L71:
 289:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c ****     break;
 1235              		.loc 1 289 0
 1236 04c6 1820     		movs	r0, #24
 1237 04c8 FFF77FFF 		bl	graphic_ctrl_bit_set
 290:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1238              		.loc 1 290 0
 1239 04cc C046     		nop
 1240              	.L66:
 1241              	.L72:
 1242              		.loc 1 292 0
 1243 04ce C046     		nop
 1244 04d0 BD46     		mov	sp, r7
 1245 04d2 02B0     		add	sp, sp, #8
 1246              		@ sp needed
 1247 04d4 80BD     		pop	{r7, pc}
 1248              		.cfi_endproc
 1249              	.LFE16:
 1251              		.align	1
 1252              		.global	graphic_initialize
 1253              		.syntax unified
 1254              		.code	16
 1255              		.thumb_func
 1256              		.fpu softvfp
 1258              	graphic_initialize:
 1259              	.LFB17:
 293:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void graphic_initialize(void) {
 1260              		.loc 1 293 0
 1261              		.cfi_startproc
 1262              		@ args = 0, pretend = 0, frame = 0
 1263              		@ frame_needed = 1, uses_anonymous_args = 0
 1264 04d6 80B5     		push	{r7, lr}
 1265              		.cfi_def_cfa_offset 8
 1266              		.cfi_offset 7, -8
 1267              		.cfi_offset 14, -4
 1268 04d8 00AF     		add	r7, sp, #0
 1269              		.cfi_def_cfa_register 7
 294:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_E);
 1270              		.loc 1 294 0
 1271 04da 4020     		movs	r0, #64
 1272 04dc FFF775FF 		bl	graphic_ctrl_bit_set
 295:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_mikro(10);
 1273              		.loc 1 295 0
 1274 04e0 0A20     		movs	r0, #10
 1275 04e2 FFF7FEFF 		bl	delay_mikro
 296:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 1276              		.loc 1 296 0
 1277 04e6 7820     		movs	r0, #120
 1278 04e8 FFF79CFF 		bl	graphic_ctrl_bit_clear
 297:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_milli(30);
 1279              		.loc 1 297 0
 1280 04ec 1E20     		movs	r0, #30
 1281 04ee FFF7FEFF 		bl	delay_milli
 298:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_RST);
 1282              		.loc 1 298 0
 1283 04f2 2020     		movs	r0, #32
 1284 04f4 FFF769FF 		bl	graphic_ctrl_bit_set
 299:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_milli(100);
 1285              		.loc 1 299 0
 1286 04f8 6420     		movs	r0, #100
 1287 04fa FFF7FEFF 		bl	delay_milli
 300:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 1288              		.loc 1 300 0
 1289 04fe 1821     		movs	r1, #24
 1290 0500 3E20     		movs	r0, #62
 1291 0502 FFF7FEFF 		bl	graphic_write_command
 301:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_ON, B_CS1|B_CS2);
 1292              		.loc 1 301 0
 1293 0506 1821     		movs	r1, #24
 1294 0508 3F20     		movs	r0, #63
 1295 050a FFF7FEFF 		bl	graphic_write_command
 302:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 1296              		.loc 1 302 0
 1297 050e 1821     		movs	r1, #24
 1298 0510 C020     		movs	r0, #192
 1299 0512 FFF7FEFF 		bl	graphic_write_command
 303:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 1300              		.loc 1 303 0
 1301 0516 1821     		movs	r1, #24
 1302 0518 4020     		movs	r0, #64
 1303 051a FFF7FEFF 		bl	graphic_write_command
 304:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 1304              		.loc 1 304 0
 1305 051e 1821     		movs	r1, #24
 1306 0520 B820     		movs	r0, #184
 1307 0522 FFF7FEFF 		bl	graphic_write_command
 305:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller(0);
 1308              		.loc 1 305 0
 1309 0526 0020     		movs	r0, #0
 1310 0528 FFF7A8FF 		bl	select_controller
 306:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1311              		.loc 1 306 0
 1312 052c C046     		nop
 1313 052e BD46     		mov	sp, r7
 1314              		@ sp needed
 1315 0530 80BD     		pop	{r7, pc}
 1316              		.cfi_endproc
 1317              	.LFE17:
 1319              		.align	1
 1320              		.syntax unified
 1321              		.code	16
 1322              		.thumb_func
 1323              		.fpu softvfp
 1325              	graphic_wait_ready:
 1326              	.LFB18:
 307:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** static void graphic_wait_ready(void) {
 1327              		.loc 1 307 0
 1328              		.cfi_startproc
 1329              		@ args = 0, pretend = 0, frame = 8
 1330              		@ frame_needed = 1, uses_anonymous_args = 0
 1331 0532 80B5     		push	{r7, lr}
 1332              		.cfi_def_cfa_offset 8
 1333              		.cfi_offset 7, -8
 1334              		.cfi_offset 14, -4
 1335 0534 82B0     		sub	sp, sp, #8
 1336              		.cfi_def_cfa_offset 16
 1337 0536 00AF     		add	r7, sp, #0
 1338              		.cfi_def_cfa_register 7
 308:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** uint8_t c;
 309:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1339              		.loc 1 309 0
 1340 0538 4020     		movs	r0, #64
 1341 053a FFF773FF 		bl	graphic_ctrl_bit_clear
 310:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** // 15-8 inputs, 7-0 outputs
 311:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** *GPIOE_MODER = 0x00005555;
 1342              		.loc 1 311 0
 1343 053e 144B     		ldr	r3, .L80
 1344 0540 144A     		ldr	r2, .L80+4
 1345 0542 1A60     		str	r2, [r3]
 312:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_RS);
 1346              		.loc 1 312 0
 1347 0544 0120     		movs	r0, #1
 1348 0546 FFF76DFF 		bl	graphic_ctrl_bit_clear
 313:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_RW);
 1349              		.loc 1 313 0
 1350 054a 0220     		movs	r0, #2
 1351 054c FFF73DFF 		bl	graphic_ctrl_bit_set
 314:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1352              		.loc 1 314 0
 1353 0550 FFF7FEFF 		bl	delay_500ns
 1354              	.L77:
 315:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** while(1) {
 316:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_E);
 1355              		.loc 1 316 0
 1356 0554 4020     		movs	r0, #64
 1357 0556 FFF738FF 		bl	graphic_ctrl_bit_set
 317:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1358              		.loc 1 317 0
 1359 055a FFF7FEFF 		bl	delay_500ns
 318:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c = *GPIOE_IDR_HIGH & LCD_BUSY;
 1360              		.loc 1 318 0
 1361 055e 0E4B     		ldr	r3, .L80+8
 1362 0560 1B78     		ldrb	r3, [r3]
 1363 0562 DAB2     		uxtb	r2, r3
 1364 0564 FB1D     		adds	r3, r7, #7
 1365 0566 7F21     		movs	r1, #127
 1366 0568 8A43     		bics	r2, r1
 1367 056a 1A70     		strb	r2, [r3]
 319:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1368              		.loc 1 319 0
 1369 056c 4020     		movs	r0, #64
 1370 056e FFF759FF 		bl	graphic_ctrl_bit_clear
 320:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1371              		.loc 1 320 0
 1372 0572 FFF7FEFF 		bl	delay_500ns
 321:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if( c == 0 ) break;
 1373              		.loc 1 321 0
 1374 0576 FB1D     		adds	r3, r7, #7
 1375 0578 1B78     		ldrb	r3, [r3]
 1376 057a 002B     		cmp	r3, #0
 1377 057c 00D0     		beq	.L79
 316:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1378              		.loc 1 316 0
 1379 057e E9E7     		b	.L77
 1380              	.L79:
 1381              		.loc 1 321 0
 1382 0580 C046     		nop
 322:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 323:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 1383              		.loc 1 323 0
 1384 0582 034B     		ldr	r3, .L80
 1385 0584 054A     		ldr	r2, .L80+12
 1386 0586 1A60     		str	r2, [r3]
 324:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1387              		.loc 1 324 0
 1388 0588 C046     		nop
 1389 058a BD46     		mov	sp, r7
 1390 058c 02B0     		add	sp, sp, #8
 1391              		@ sp needed
 1392 058e 80BD     		pop	{r7, pc}
 1393              	.L81:
 1394              		.align	2
 1395              	.L80:
 1396 0590 00100240 		.word	1073876992
 1397 0594 55550000 		.word	21845
 1398 0598 11100240 		.word	1073877009
 1399 059c 55555555 		.word	1431655765
 1400              		.cfi_endproc
 1401              	.LFE18:
 1403              		.align	1
 1404              		.syntax unified
 1405              		.code	16
 1406              		.thumb_func
 1407              		.fpu softvfp
 1409              	graphic_read:
 1410              	.LFB19:
 325:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** static uint8_t graphic_read(uint8_t controller) {
 1411              		.loc 1 325 0
 1412              		.cfi_startproc
 1413              		@ args = 0, pretend = 0, frame = 16
 1414              		@ frame_needed = 1, uses_anonymous_args = 0
 1415 05a0 80B5     		push	{r7, lr}
 1416              		.cfi_def_cfa_offset 8
 1417              		.cfi_offset 7, -8
 1418              		.cfi_offset 14, -4
 1419 05a2 84B0     		sub	sp, sp, #16
 1420              		.cfi_def_cfa_offset 24
 1421 05a4 00AF     		add	r7, sp, #0
 1422              		.cfi_def_cfa_register 7
 1423 05a6 0200     		movs	r2, r0
 1424 05a8 FB1D     		adds	r3, r7, #7
 1425 05aa 1A70     		strb	r2, [r3]
 326:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** uint8_t c;
 327:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1426              		.loc 1 327 0
 1427 05ac 4020     		movs	r0, #64
 1428 05ae FFF739FF 		bl	graphic_ctrl_bit_clear
 328:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** *GPIOE_MODER = 0x00005555; // 15-8 inputs, 7-0 outputs
 1429              		.loc 1 328 0
 1430 05b2 1C4B     		ldr	r3, .L86
 1431 05b4 1C4A     		ldr	r2, .L86+4
 1432 05b6 1A60     		str	r2, [r3]
 329:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_RS|B_RW);
 1433              		.loc 1 329 0
 1434 05b8 0320     		movs	r0, #3
 1435 05ba FFF706FF 		bl	graphic_ctrl_bit_set
 330:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller(controller);
 1436              		.loc 1 330 0
 1437 05be FB1D     		adds	r3, r7, #7
 1438 05c0 1B78     		ldrb	r3, [r3]
 1439 05c2 1800     		movs	r0, r3
 1440 05c4 FFF75AFF 		bl	select_controller
 331:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1441              		.loc 1 331 0
 1442 05c8 FFF7FEFF 		bl	delay_500ns
 332:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_E);
 1443              		.loc 1 332 0
 1444 05cc 4020     		movs	r0, #64
 1445 05ce FFF7FCFE 		bl	graphic_ctrl_bit_set
 333:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1446              		.loc 1 333 0
 1447 05d2 FFF7FEFF 		bl	delay_500ns
 334:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c = *GPIOE_IDR_HIGH;
 1448              		.loc 1 334 0
 1449 05d6 154A     		ldr	r2, .L86+8
 1450 05d8 0F23     		movs	r3, #15
 1451 05da FB18     		adds	r3, r7, r3
 1452 05dc 1278     		ldrb	r2, [r2]
 1453 05de 1A70     		strb	r2, [r3]
 335:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1454              		.loc 1 335 0
 1455 05e0 4020     		movs	r0, #64
 1456 05e2 FFF71FFF 		bl	graphic_ctrl_bit_clear
 336:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 1457              		.loc 1 336 0
 1458 05e6 0F4B     		ldr	r3, .L86
 1459 05e8 114A     		ldr	r2, .L86+12
 1460 05ea 1A60     		str	r2, [r3]
 337:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if( controller & B_CS1 ) {
 1461              		.loc 1 337 0
 1462 05ec FB1D     		adds	r3, r7, #7
 1463 05ee 1B78     		ldrb	r3, [r3]
 1464 05f0 0822     		movs	r2, #8
 1465 05f2 1340     		ands	r3, r2
 1466 05f4 04D0     		beq	.L83
 338:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller(B_CS1);
 1467              		.loc 1 338 0
 1468 05f6 0820     		movs	r0, #8
 1469 05f8 FFF740FF 		bl	select_controller
 339:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_wait_ready();
 1470              		.loc 1 339 0
 1471 05fc FFF799FF 		bl	graphic_wait_ready
 1472              	.L83:
 340:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 341:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if( controller & B_CS2 ) {
 1473              		.loc 1 341 0
 1474 0600 FB1D     		adds	r3, r7, #7
 1475 0602 1B78     		ldrb	r3, [r3]
 1476 0604 1022     		movs	r2, #16
 1477 0606 1340     		ands	r3, r2
 1478 0608 04D0     		beq	.L84
 342:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller(B_CS2);
 1479              		.loc 1 342 0
 1480 060a 1020     		movs	r0, #16
 1481 060c FFF736FF 		bl	select_controller
 343:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_wait_ready();
 1482              		.loc 1 343 0
 1483 0610 FFF78FFF 		bl	graphic_wait_ready
 1484              	.L84:
 344:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 345:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** return c;
 1485              		.loc 1 345 0
 1486 0614 0F23     		movs	r3, #15
 1487 0616 FB18     		adds	r3, r7, r3
 1488 0618 1B78     		ldrb	r3, [r3]
 346:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1489              		.loc 1 346 0
 1490 061a 1800     		movs	r0, r3
 1491 061c BD46     		mov	sp, r7
 1492 061e 04B0     		add	sp, sp, #16
 1493              		@ sp needed
 1494 0620 80BD     		pop	{r7, pc}
 1495              	.L87:
 1496 0622 C046     		.align	2
 1497              	.L86:
 1498 0624 00100240 		.word	1073876992
 1499 0628 55550000 		.word	21845
 1500 062c 11100240 		.word	1073877009
 1501 0630 55555555 		.word	1431655765
 1502              		.cfi_endproc
 1503              	.LFE19:
 1505              		.align	1
 1506              		.syntax unified
 1507              		.code	16
 1508              		.thumb_func
 1509              		.fpu softvfp
 1511              	graphic_read_data:
 1512              	.LFB20:
 347:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** static uint8_t graphic_read_data(uint8_t controller) {
 1513              		.loc 1 347 0
 1514              		.cfi_startproc
 1515              		@ args = 0, pretend = 0, frame = 8
 1516              		@ frame_needed = 1, uses_anonymous_args = 0
 1517 0634 80B5     		push	{r7, lr}
 1518              		.cfi_def_cfa_offset 8
 1519              		.cfi_offset 7, -8
 1520              		.cfi_offset 14, -4
 1521 0636 82B0     		sub	sp, sp, #8
 1522              		.cfi_def_cfa_offset 16
 1523 0638 00AF     		add	r7, sp, #0
 1524              		.cfi_def_cfa_register 7
 1525 063a 0200     		movs	r2, r0
 1526 063c FB1D     		adds	r3, r7, #7
 1527 063e 1A70     		strb	r2, [r3]
 348:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_read(controller);
 1528              		.loc 1 348 0
 1529 0640 FB1D     		adds	r3, r7, #7
 1530 0642 1B78     		ldrb	r3, [r3]
 1531 0644 1800     		movs	r0, r3
 1532 0646 FFF7ABFF 		bl	graphic_read
 349:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** return graphic_read(controller);
 1533              		.loc 1 349 0
 1534 064a FB1D     		adds	r3, r7, #7
 1535 064c 1B78     		ldrb	r3, [r3]
 1536 064e 1800     		movs	r0, r3
 1537 0650 FFF7A6FF 		bl	graphic_read
 1538 0654 0300     		movs	r3, r0
 350:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1539              		.loc 1 350 0
 1540 0656 1800     		movs	r0, r3
 1541 0658 BD46     		mov	sp, r7
 1542 065a 02B0     		add	sp, sp, #8
 1543              		@ sp needed
 1544 065c 80BD     		pop	{r7, pc}
 1545              		.cfi_endproc
 1546              	.LFE20:
 1548              		.align	1
 1549              		.syntax unified
 1550              		.code	16
 1551              		.thumb_func
 1552              		.fpu softvfp
 1554              	graphic_write:
 1555              	.LFB21:
 351:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** static void graphic_write(uint8_t value, uint8_t controller) {
 1556              		.loc 1 351 0
 1557              		.cfi_startproc
 1558              		@ args = 0, pretend = 0, frame = 8
 1559              		@ frame_needed = 1, uses_anonymous_args = 0
 1560 065e 80B5     		push	{r7, lr}
 1561              		.cfi_def_cfa_offset 8
 1562              		.cfi_offset 7, -8
 1563              		.cfi_offset 14, -4
 1564 0660 82B0     		sub	sp, sp, #8
 1565              		.cfi_def_cfa_offset 16
 1566 0662 00AF     		add	r7, sp, #0
 1567              		.cfi_def_cfa_register 7
 1568 0664 0200     		movs	r2, r0
 1569 0666 FB1D     		adds	r3, r7, #7
 1570 0668 1A70     		strb	r2, [r3]
 1571 066a BB1D     		adds	r3, r7, #6
 1572 066c 0A1C     		adds	r2, r1, #0
 1573 066e 1A70     		strb	r2, [r3]
 352:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** *GPIOE_ODR_HIGH = value;
 1574              		.loc 1 352 0
 1575 0670 154A     		ldr	r2, .L94
 1576 0672 FB1D     		adds	r3, r7, #7
 1577 0674 1B78     		ldrb	r3, [r3]
 1578 0676 1370     		strb	r3, [r2]
 353:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller(controller);
 1579              		.loc 1 353 0
 1580 0678 BB1D     		adds	r3, r7, #6
 1581 067a 1B78     		ldrb	r3, [r3]
 1582 067c 1800     		movs	r0, r3
 1583 067e FFF7FDFE 		bl	select_controller
 354:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1584              		.loc 1 354 0
 1585 0682 FFF7FEFF 		bl	delay_500ns
 355:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_E);
 1586              		.loc 1 355 0
 1587 0686 4020     		movs	r0, #64
 1588 0688 FFF79FFE 		bl	graphic_ctrl_bit_set
 356:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** delay_500ns();
 1589              		.loc 1 356 0
 1590 068c FFF7FEFF 		bl	delay_500ns
 357:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear( B_E );
 1591              		.loc 1 357 0
 1592 0690 4020     		movs	r0, #64
 1593 0692 FFF7C7FE 		bl	graphic_ctrl_bit_clear
 358:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if(controller & B_CS1) {
 1594              		.loc 1 358 0
 1595 0696 BB1D     		adds	r3, r7, #6
 1596 0698 1B78     		ldrb	r3, [r3]
 1597 069a 0822     		movs	r2, #8
 1598 069c 1340     		ands	r3, r2
 1599 069e 04D0     		beq	.L91
 359:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller( B_CS1);
 1600              		.loc 1 359 0
 1601 06a0 0820     		movs	r0, #8
 1602 06a2 FFF7EBFE 		bl	select_controller
 360:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_wait_ready();
 1603              		.loc 1 360 0
 1604 06a6 FFF744FF 		bl	graphic_wait_ready
 1605              	.L91:
 361:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 362:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if(controller & B_CS2) {
 1606              		.loc 1 362 0
 1607 06aa BB1D     		adds	r3, r7, #6
 1608 06ac 1B78     		ldrb	r3, [r3]
 1609 06ae 1022     		movs	r2, #16
 1610 06b0 1340     		ands	r3, r2
 1611 06b2 04D0     		beq	.L93
 363:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller( B_CS2);
 1612              		.loc 1 363 0
 1613 06b4 1020     		movs	r0, #16
 1614 06b6 FFF7E1FE 		bl	select_controller
 364:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_wait_ready();
 1615              		.loc 1 364 0
 1616 06ba FFF73AFF 		bl	graphic_wait_ready
 1617              	.L93:
 365:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 366:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1618              		.loc 1 366 0
 1619 06be C046     		nop
 1620 06c0 BD46     		mov	sp, r7
 1621 06c2 02B0     		add	sp, sp, #8
 1622              		@ sp needed
 1623 06c4 80BD     		pop	{r7, pc}
 1624              	.L95:
 1625 06c6 C046     		.align	2
 1626              	.L94:
 1627 06c8 15100240 		.word	1073877013
 1628              		.cfi_endproc
 1629              	.LFE21:
 1631              		.align	1
 1632              		.global	graphic_write_command
 1633              		.syntax unified
 1634              		.code	16
 1635              		.thumb_func
 1636              		.fpu softvfp
 1638              	graphic_write_command:
 1639              	.LFB22:
 367:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller) {
 1640              		.loc 1 367 0
 1641              		.cfi_startproc
 1642              		@ args = 0, pretend = 0, frame = 8
 1643              		@ frame_needed = 1, uses_anonymous_args = 0
 1644 06cc 80B5     		push	{r7, lr}
 1645              		.cfi_def_cfa_offset 8
 1646              		.cfi_offset 7, -8
 1647              		.cfi_offset 14, -4
 1648 06ce 82B0     		sub	sp, sp, #8
 1649              		.cfi_def_cfa_offset 16
 1650 06d0 00AF     		add	r7, sp, #0
 1651              		.cfi_def_cfa_register 7
 1652 06d2 0200     		movs	r2, r0
 1653 06d4 FB1D     		adds	r3, r7, #7
 1654 06d6 1A70     		strb	r2, [r3]
 1655 06d8 BB1D     		adds	r3, r7, #6
 1656 06da 0A1C     		adds	r2, r1, #0
 1657 06dc 1A70     		strb	r2, [r3]
 368:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1658              		.loc 1 368 0
 1659 06de 4020     		movs	r0, #64
 1660 06e0 FFF7A0FE 		bl	graphic_ctrl_bit_clear
 369:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller(controller);
 1661              		.loc 1 369 0
 1662 06e4 BB1D     		adds	r3, r7, #6
 1663 06e6 1B78     		ldrb	r3, [r3]
 1664 06e8 1800     		movs	r0, r3
 1665 06ea FFF7C7FE 		bl	select_controller
 370:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_RS|B_RW);
 1666              		.loc 1 370 0
 1667 06ee 0320     		movs	r0, #3
 1668 06f0 FFF798FE 		bl	graphic_ctrl_bit_clear
 371:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write(command, controller);
 1669              		.loc 1 371 0
 1670 06f4 BB1D     		adds	r3, r7, #6
 1671 06f6 1A78     		ldrb	r2, [r3]
 1672 06f8 FB1D     		adds	r3, r7, #7
 1673 06fa 1B78     		ldrb	r3, [r3]
 1674 06fc 1100     		movs	r1, r2
 1675 06fe 1800     		movs	r0, r3
 1676 0700 FFF7ADFF 		bl	graphic_write
 372:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1677              		.loc 1 372 0
 1678 0704 C046     		nop
 1679 0706 BD46     		mov	sp, r7
 1680 0708 02B0     		add	sp, sp, #8
 1681              		@ sp needed
 1682 070a 80BD     		pop	{r7, pc}
 1683              		.cfi_endproc
 1684              	.LFE22:
 1686              		.align	1
 1687              		.global	graphic_write_data
 1688              		.syntax unified
 1689              		.code	16
 1690              		.thumb_func
 1691              		.fpu softvfp
 1693              	graphic_write_data:
 1694              	.LFB23:
 373:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller) {
 1695              		.loc 1 373 0
 1696              		.cfi_startproc
 1697              		@ args = 0, pretend = 0, frame = 8
 1698              		@ frame_needed = 1, uses_anonymous_args = 0
 1699 070c 80B5     		push	{r7, lr}
 1700              		.cfi_def_cfa_offset 8
 1701              		.cfi_offset 7, -8
 1702              		.cfi_offset 14, -4
 1703 070e 82B0     		sub	sp, sp, #8
 1704              		.cfi_def_cfa_offset 16
 1705 0710 00AF     		add	r7, sp, #0
 1706              		.cfi_def_cfa_register 7
 1707 0712 0200     		movs	r2, r0
 1708 0714 FB1D     		adds	r3, r7, #7
 1709 0716 1A70     		strb	r2, [r3]
 1710 0718 BB1D     		adds	r3, r7, #6
 1711 071a 0A1C     		adds	r2, r1, #0
 1712 071c 1A70     		strb	r2, [r3]
 374:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1713              		.loc 1 374 0
 1714 071e 4020     		movs	r0, #64
 1715 0720 FFF780FE 		bl	graphic_ctrl_bit_clear
 375:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** select_controller(controller);
 1716              		.loc 1 375 0
 1717 0724 BB1D     		adds	r3, r7, #6
 1718 0726 1B78     		ldrb	r3, [r3]
 1719 0728 1800     		movs	r0, r3
 1720 072a FFF7A7FE 		bl	select_controller
 376:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_set(B_RS);
 1721              		.loc 1 376 0
 1722 072e 0120     		movs	r0, #1
 1723 0730 FFF74BFE 		bl	graphic_ctrl_bit_set
 377:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_ctrl_bit_clear(B_RW);
 1724              		.loc 1 377 0
 1725 0734 0220     		movs	r0, #2
 1726 0736 FFF775FE 		bl	graphic_ctrl_bit_clear
 378:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write(data, controller);
 1727              		.loc 1 378 0
 1728 073a BB1D     		adds	r3, r7, #6
 1729 073c 1A78     		ldrb	r2, [r3]
 1730 073e FB1D     		adds	r3, r7, #7
 1731 0740 1B78     		ldrb	r3, [r3]
 1732 0742 1100     		movs	r1, r2
 1733 0744 1800     		movs	r0, r3
 1734 0746 FFF78AFF 		bl	graphic_write
 379:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1735              		.loc 1 379 0
 1736 074a C046     		nop
 1737 074c BD46     		mov	sp, r7
 1738 074e 02B0     		add	sp, sp, #8
 1739              		@ sp needed
 1740 0750 80BD     		pop	{r7, pc}
 1741              		.cfi_endproc
 1742              	.LFE23:
 1744              		.align	1
 1745              		.global	graphic_clear_screen
 1746              		.syntax unified
 1747              		.code	16
 1748              		.thumb_func
 1749              		.fpu softvfp
 1751              	graphic_clear_screen:
 1752              	.LFB24:
 380:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void graphic_clear_screen(void) {
 1753              		.loc 1 380 0
 1754              		.cfi_startproc
 1755              		@ args = 0, pretend = 0, frame = 8
 1756              		@ frame_needed = 1, uses_anonymous_args = 0
 1757 0752 80B5     		push	{r7, lr}
 1758              		.cfi_def_cfa_offset 8
 1759              		.cfi_offset 7, -8
 1760              		.cfi_offset 14, -4
 1761 0754 82B0     		sub	sp, sp, #8
 1762              		.cfi_def_cfa_offset 16
 1763 0756 00AF     		add	r7, sp, #0
 1764              		.cfi_def_cfa_register 7
 381:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** uint8_t i, j;
 382:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** for(j = 0; j < 8; j++) {
 1765              		.loc 1 382 0
 1766 0758 BB1D     		adds	r3, r7, #6
 1767 075a 0022     		movs	r2, #0
 1768 075c 1A70     		strb	r2, [r3]
 1769 075e 23E0     		b	.L99
 1770              	.L102:
 383:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1771              		.loc 1 383 0
 1772 0760 BB1D     		adds	r3, r7, #6
 1773 0762 1B78     		ldrb	r3, [r3]
 1774 0764 4822     		movs	r2, #72
 1775 0766 5242     		rsbs	r2, r2, #0
 1776 0768 1343     		orrs	r3, r2
 1777 076a DBB2     		uxtb	r3, r3
 1778 076c 1821     		movs	r1, #24
 1779 076e 1800     		movs	r0, r3
 1780 0770 FFF7FEFF 		bl	graphic_write_command
 384:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1781              		.loc 1 384 0
 1782 0774 1821     		movs	r1, #24
 1783 0776 4020     		movs	r0, #64
 1784 0778 FFF7FEFF 		bl	graphic_write_command
 385:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** for(i = 0; i <= 63; i++){
 1785              		.loc 1 385 0
 1786 077c FB1D     		adds	r3, r7, #7
 1787 077e 0022     		movs	r2, #0
 1788 0780 1A70     		strb	r2, [r3]
 1789 0782 08E0     		b	.L100
 1790              	.L101:
 386:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_data(0, B_CS1|B_CS2);
 1791              		.loc 1 386 0 discriminator 3
 1792 0784 1821     		movs	r1, #24
 1793 0786 0020     		movs	r0, #0
 1794 0788 FFF7FEFF 		bl	graphic_write_data
 385:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** for(i = 0; i <= 63; i++){
 1795              		.loc 1 385 0 discriminator 3
 1796 078c FB1D     		adds	r3, r7, #7
 1797 078e 1A78     		ldrb	r2, [r3]
 1798 0790 FB1D     		adds	r3, r7, #7
 1799 0792 0132     		adds	r2, r2, #1
 1800 0794 1A70     		strb	r2, [r3]
 1801              	.L100:
 385:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** for(i = 0; i <= 63; i++){
 1802              		.loc 1 385 0 is_stmt 0 discriminator 1
 1803 0796 FB1D     		adds	r3, r7, #7
 1804 0798 1B78     		ldrb	r3, [r3]
 1805 079a 3F2B     		cmp	r3, #63
 1806 079c F2D9     		bls	.L101
 382:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1807              		.loc 1 382 0 is_stmt 1 discriminator 2
 1808 079e BB1D     		adds	r3, r7, #6
 1809 07a0 1A78     		ldrb	r2, [r3]
 1810 07a2 BB1D     		adds	r3, r7, #6
 1811 07a4 0132     		adds	r2, r2, #1
 1812 07a6 1A70     		strb	r2, [r3]
 1813              	.L99:
 382:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1814              		.loc 1 382 0 is_stmt 0 discriminator 1
 1815 07a8 BB1D     		adds	r3, r7, #6
 1816 07aa 1B78     		ldrb	r3, [r3]
 1817 07ac 072B     		cmp	r3, #7
 1818 07ae D7D9     		bls	.L102
 387:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 388:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 389:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 1819              		.loc 1 389 0 is_stmt 1
 1820 07b0 C046     		nop
 1821 07b2 BD46     		mov	sp, r7
 1822 07b4 02B0     		add	sp, sp, #8
 1823              		@ sp needed
 1824 07b6 80BD     		pop	{r7, pc}
 1825              		.cfi_endproc
 1826              	.LFE24:
 1828              		.align	1
 1829              		.global	pixel
 1830              		.syntax unified
 1831              		.code	16
 1832              		.thumb_func
 1833              		.fpu softvfp
 1835              	pixel:
 1836              	.LFB25:
 390:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** void pixel(int x, int y, int set) {
 1837              		.loc 1 390 0
 1838              		.cfi_startproc
 1839              		@ args = 0, pretend = 0, frame = 32
 1840              		@ frame_needed = 1, uses_anonymous_args = 0
 1841 07b8 90B5     		push	{r4, r7, lr}
 1842              		.cfi_def_cfa_offset 12
 1843              		.cfi_offset 4, -12
 1844              		.cfi_offset 7, -8
 1845              		.cfi_offset 14, -4
 1846 07ba 89B0     		sub	sp, sp, #36
 1847              		.cfi_def_cfa_offset 48
 1848 07bc 00AF     		add	r7, sp, #0
 1849              		.cfi_def_cfa_register 7
 1850 07be F860     		str	r0, [r7, #12]
 1851 07c0 B960     		str	r1, [r7, #8]
 1852 07c2 7A60     		str	r2, [r7, #4]
 391:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** uint8_t mask, c, controller;
 392:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** int index;
 393:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1853              		.loc 1 393 0
 1854 07c4 FB68     		ldr	r3, [r7, #12]
 1855 07c6 002B     		cmp	r3, #0
 1856 07c8 00DC     		bgt	.LCB1466
 1857 07ca BCE0     		b	.L124	@long jump
 1858              	.LCB1466:
 1859              		.loc 1 393 0 is_stmt 0 discriminator 1
 1860 07cc BB68     		ldr	r3, [r7, #8]
 1861 07ce 002B     		cmp	r3, #0
 1862 07d0 00DC     		bgt	.LCB1469
 1863 07d2 B8E0     		b	.L124	@long jump
 1864              	.LCB1469:
 1865              		.loc 1 393 0 discriminator 2
 1866 07d4 FB68     		ldr	r3, [r7, #12]
 1867 07d6 802B     		cmp	r3, #128
 1868 07d8 00DD     		ble	.LCB1472
 1869 07da B4E0     		b	.L124	@long jump
 1870              	.LCB1472:
 1871              		.loc 1 393 0 discriminator 3
 1872 07dc BB68     		ldr	r3, [r7, #8]
 1873 07de 402B     		cmp	r3, #64
 1874 07e0 00DD     		ble	.LCB1475
 1875 07e2 B0E0     		b	.L124	@long jump
 1876              	.LCB1475:
 394:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** index = (y-1)/8;
 1877              		.loc 1 394 0 is_stmt 1
 1878 07e4 BB68     		ldr	r3, [r7, #8]
 1879 07e6 013B     		subs	r3, r3, #1
 1880 07e8 002B     		cmp	r3, #0
 1881 07ea 00DA     		bge	.L107
 1882 07ec 0733     		adds	r3, r3, #7
 1883              	.L107:
 1884 07ee DB10     		asrs	r3, r3, #3
 1885 07f0 BB61     		str	r3, [r7, #24]
 395:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** switch( (y-1)%8 ) {
 1886              		.loc 1 395 0
 1887 07f2 BB68     		ldr	r3, [r7, #8]
 1888 07f4 013B     		subs	r3, r3, #1
 1889 07f6 564A     		ldr	r2, .L125
 1890 07f8 1340     		ands	r3, r2
 1891 07fa 04D5     		bpl	.L108
 1892 07fc 013B     		subs	r3, r3, #1
 1893 07fe 0822     		movs	r2, #8
 1894 0800 5242     		rsbs	r2, r2, #0
 1895 0802 1343     		orrs	r3, r2
 1896 0804 0133     		adds	r3, r3, #1
 1897              	.L108:
 1898 0806 072B     		cmp	r3, #7
 1899 0808 2CD8     		bhi	.L109
 1900 080a 9A00     		lsls	r2, r3, #2
 1901 080c 514B     		ldr	r3, .L125+4
 1902 080e D318     		adds	r3, r2, r3
 1903 0810 1B68     		ldr	r3, [r3]
 1904 0812 9F46     		mov	pc, r3
 1905              		.section	.rodata
 1906              		.align	2
 1907              	.L111:
 1908 0024 14080000 		.word	.L110
 1909 0028 1E080000 		.word	.L112
 1910 002c 28080000 		.word	.L113
 1911 0030 32080000 		.word	.L114
 1912 0034 3C080000 		.word	.L115
 1913 0038 46080000 		.word	.L116
 1914 003c 50080000 		.word	.L117
 1915 0040 5A080000 		.word	.L118
 1916              		.text
 1917              	.L110:
 396:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 0: mask = 1; break;
 1918              		.loc 1 396 0
 1919 0814 1F23     		movs	r3, #31
 1920 0816 FB18     		adds	r3, r7, r3
 1921 0818 0122     		movs	r2, #1
 1922 081a 1A70     		strb	r2, [r3]
 1923 081c 22E0     		b	.L109
 1924              	.L112:
 397:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 1: mask = 2; break;
 1925              		.loc 1 397 0
 1926 081e 1F23     		movs	r3, #31
 1927 0820 FB18     		adds	r3, r7, r3
 1928 0822 0222     		movs	r2, #2
 1929 0824 1A70     		strb	r2, [r3]
 1930 0826 1DE0     		b	.L109
 1931              	.L113:
 398:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 2: mask = 4; break;
 1932              		.loc 1 398 0
 1933 0828 1F23     		movs	r3, #31
 1934 082a FB18     		adds	r3, r7, r3
 1935 082c 0422     		movs	r2, #4
 1936 082e 1A70     		strb	r2, [r3]
 1937 0830 18E0     		b	.L109
 1938              	.L114:
 399:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 3: mask = 8; break;
 1939              		.loc 1 399 0
 1940 0832 1F23     		movs	r3, #31
 1941 0834 FB18     		adds	r3, r7, r3
 1942 0836 0822     		movs	r2, #8
 1943 0838 1A70     		strb	r2, [r3]
 1944 083a 13E0     		b	.L109
 1945              	.L115:
 400:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 4: mask = 0x10; break;
 1946              		.loc 1 400 0
 1947 083c 1F23     		movs	r3, #31
 1948 083e FB18     		adds	r3, r7, r3
 1949 0840 1022     		movs	r2, #16
 1950 0842 1A70     		strb	r2, [r3]
 1951 0844 0EE0     		b	.L109
 1952              	.L116:
 401:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 5: mask = 0x20; break;
 1953              		.loc 1 401 0
 1954 0846 1F23     		movs	r3, #31
 1955 0848 FB18     		adds	r3, r7, r3
 1956 084a 2022     		movs	r2, #32
 1957 084c 1A70     		strb	r2, [r3]
 1958 084e 09E0     		b	.L109
 1959              	.L117:
 402:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 6: mask = 0x40; break;
 1960              		.loc 1 402 0
 1961 0850 1F23     		movs	r3, #31
 1962 0852 FB18     		adds	r3, r7, r3
 1963 0854 4022     		movs	r2, #64
 1964 0856 1A70     		strb	r2, [r3]
 1965 0858 04E0     		b	.L109
 1966              	.L118:
 403:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** case 7: mask = 0x80; break;
 1967              		.loc 1 403 0
 1968 085a 1F23     		movs	r3, #31
 1969 085c FB18     		adds	r3, r7, r3
 1970 085e 8022     		movs	r2, #128
 1971 0860 1A70     		strb	r2, [r3]
 1972 0862 C046     		nop
 1973              	.L109:
 404:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 405:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if(set == 0)
 1974              		.loc 1 405 0
 1975 0864 7B68     		ldr	r3, [r7, #4]
 1976 0866 002B     		cmp	r3, #0
 1977 0868 06D1     		bne	.L119
 406:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** mask = ~mask;
 1978              		.loc 1 406 0
 1979 086a 1F23     		movs	r3, #31
 1980 086c FB18     		adds	r3, r7, r3
 1981 086e 1F22     		movs	r2, #31
 1982 0870 BA18     		adds	r2, r7, r2
 1983 0872 1278     		ldrb	r2, [r2]
 1984 0874 D243     		mvns	r2, r2
 1985 0876 1A70     		strb	r2, [r3]
 1986              	.L119:
 407:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if(x > 64){
 1987              		.loc 1 407 0
 1988 0878 FB68     		ldr	r3, [r7, #12]
 1989 087a 402B     		cmp	r3, #64
 1990 087c 07DD     		ble	.L120
 408:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** controller = B_CS2;
 1991              		.loc 1 408 0
 1992 087e 1E23     		movs	r3, #30
 1993 0880 FB18     		adds	r3, r7, r3
 1994 0882 1022     		movs	r2, #16
 1995 0884 1A70     		strb	r2, [r3]
 409:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** x = x - 65;
 1996              		.loc 1 409 0
 1997 0886 FB68     		ldr	r3, [r7, #12]
 1998 0888 413B     		subs	r3, r3, #65
 1999 088a FB60     		str	r3, [r7, #12]
 2000 088c 06E0     		b	.L121
 2001              	.L120:
 410:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** } else {
 411:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** controller = B_CS1;
 2002              		.loc 1 411 0
 2003 088e 1E23     		movs	r3, #30
 2004 0890 FB18     		adds	r3, r7, r3
 2005 0892 0822     		movs	r2, #8
 2006 0894 1A70     		strb	r2, [r3]
 412:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** x = x-1;
 2007              		.loc 1 412 0
 2008 0896 FB68     		ldr	r3, [r7, #12]
 2009 0898 013B     		subs	r3, r3, #1
 2010 089a FB60     		str	r3, [r7, #12]
 2011              	.L121:
 413:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 414:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller );
 2012              		.loc 1 414 0
 2013 089c FB68     		ldr	r3, [r7, #12]
 2014 089e 5BB2     		sxtb	r3, r3
 2015 08a0 4022     		movs	r2, #64
 2016 08a2 1343     		orrs	r3, r2
 2017 08a4 5BB2     		sxtb	r3, r3
 2018 08a6 DAB2     		uxtb	r2, r3
 2019 08a8 1E23     		movs	r3, #30
 2020 08aa FB18     		adds	r3, r7, r3
 2021 08ac 1B78     		ldrb	r3, [r3]
 2022 08ae 1900     		movs	r1, r3
 2023 08b0 1000     		movs	r0, r2
 2024 08b2 FFF7FEFF 		bl	graphic_write_command
 415:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_PAGE | index, controller );
 2025              		.loc 1 415 0
 2026 08b6 BB69     		ldr	r3, [r7, #24]
 2027 08b8 5BB2     		sxtb	r3, r3
 2028 08ba 4822     		movs	r2, #72
 2029 08bc 5242     		rsbs	r2, r2, #0
 2030 08be 1343     		orrs	r3, r2
 2031 08c0 5BB2     		sxtb	r3, r3
 2032 08c2 DAB2     		uxtb	r2, r3
 2033 08c4 1E23     		movs	r3, #30
 2034 08c6 FB18     		adds	r3, r7, r3
 2035 08c8 1B78     		ldrb	r3, [r3]
 2036 08ca 1900     		movs	r1, r3
 2037 08cc 1000     		movs	r0, r2
 2038 08ce FFF7FEFF 		bl	graphic_write_command
 416:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** c = graphic_read_data(controller);
 2039              		.loc 1 416 0
 2040 08d2 1723     		movs	r3, #23
 2041 08d4 FC18     		adds	r4, r7, r3
 2042 08d6 1E23     		movs	r3, #30
 2043 08d8 FB18     		adds	r3, r7, r3
 2044 08da 1B78     		ldrb	r3, [r3]
 2045 08dc 1800     		movs	r0, r3
 2046 08de FFF7A9FE 		bl	graphic_read_data
 2047 08e2 0300     		movs	r3, r0
 2048 08e4 2370     		strb	r3, [r4]
 417:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller);
 2049              		.loc 1 417 0
 2050 08e6 FB68     		ldr	r3, [r7, #12]
 2051 08e8 5BB2     		sxtb	r3, r3
 2052 08ea 4022     		movs	r2, #64
 2053 08ec 1343     		orrs	r3, r2
 2054 08ee 5BB2     		sxtb	r3, r3
 2055 08f0 DAB2     		uxtb	r2, r3
 2056 08f2 1E23     		movs	r3, #30
 2057 08f4 FB18     		adds	r3, r7, r3
 2058 08f6 1B78     		ldrb	r3, [r3]
 2059 08f8 1900     		movs	r1, r3
 2060 08fa 1000     		movs	r0, r2
 2061 08fc FFF7FEFF 		bl	graphic_write_command
 418:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** if(set)
 2062              		.loc 1 418 0
 2063 0900 7B68     		ldr	r3, [r7, #4]
 2064 0902 002B     		cmp	r3, #0
 2065 0904 0AD0     		beq	.L122
 419:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** mask = mask | c;
 2066              		.loc 1 419 0
 2067 0906 1F23     		movs	r3, #31
 2068 0908 FB18     		adds	r3, r7, r3
 2069 090a 1F22     		movs	r2, #31
 2070 090c B918     		adds	r1, r7, r2
 2071 090e 1722     		movs	r2, #23
 2072 0910 BA18     		adds	r2, r7, r2
 2073 0912 0978     		ldrb	r1, [r1]
 2074 0914 1278     		ldrb	r2, [r2]
 2075 0916 0A43     		orrs	r2, r1
 2076 0918 1A70     		strb	r2, [r3]
 2077 091a 09E0     		b	.L123
 2078              	.L122:
 420:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** else
 421:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** mask = mask & c;
 2079              		.loc 1 421 0
 2080 091c 1F23     		movs	r3, #31
 2081 091e FB18     		adds	r3, r7, r3
 2082 0920 1F22     		movs	r2, #31
 2083 0922 BA18     		adds	r2, r7, r2
 2084 0924 1721     		movs	r1, #23
 2085 0926 7918     		adds	r1, r7, r1
 2086 0928 1278     		ldrb	r2, [r2]
 2087 092a 0978     		ldrb	r1, [r1]
 2088 092c 0A40     		ands	r2, r1
 2089 092e 1A70     		strb	r2, [r3]
 2090              	.L123:
 422:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** graphic_write_data(mask, controller);
 2091              		.loc 1 422 0
 2092 0930 1E23     		movs	r3, #30
 2093 0932 FB18     		adds	r3, r7, r3
 2094 0934 1A78     		ldrb	r2, [r3]
 2095 0936 1F23     		movs	r3, #31
 2096 0938 FB18     		adds	r3, r7, r3
 2097 093a 1B78     		ldrb	r3, [r3]
 2098 093c 1100     		movs	r1, r2
 2099 093e 1800     		movs	r0, r3
 2100 0940 FFF7FEFF 		bl	graphic_write_data
 2101 0944 00E0     		b	.L103
 2102              	.L124:
 393:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** index = (y-1)/8;
 2103              		.loc 1 393 0
 2104 0946 C046     		nop
 2105              	.L103:
 423:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong\startup.c **** }
 2106              		.loc 1 423 0
 2107 0948 BD46     		mov	sp, r7
 2108 094a 09B0     		add	sp, sp, #36
 2109              		@ sp needed
 2110 094c 90BD     		pop	{r4, r7, pc}
 2111              	.L126:
 2112 094e C046     		.align	2
 2113              	.L125:
 2114 0950 07000080 		.word	-2147483641
 2115 0954 24000000 		.word	.L111
 2116              		.cfi_endproc
 2117              	.LFE25:
 2119              	.Letext0:
