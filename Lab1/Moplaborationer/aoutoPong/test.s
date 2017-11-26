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
  59              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  typedef unsigned char uint8_t;
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018)) 
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define	GPIO_D			0x40020C00
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define	GPIOD_MODER		((volatile unsigned int *)		(GPIO_D)) /*int pga att 4 bytes Šr 32 bitar*/
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define	GPIOD_OTYPER	((volatile unsigned short *)	(GPIO_D+0x4)) /*short oga att otyper anŠnder 2 by
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOD_PUPDR		((volatile unsigned int *)		(GPIO_D+0xC)) /*0xC sŠger vilken offset GPIO behšv
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOD_OSPEDER   ((volatile unsigned int *)      (GPIO_D+0x08))
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOD_IDR_LOW	((volatile unsigned char *)		(GPIO_D+0x10))
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOD_IDR_HIGH	((volatile unsigned char *)		(GPIO_D+0x11)) /*om man vill kolla high mŒste m
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOD_ODR_LOW	((volatile unsigned char *)		(GPIO_D+0x14))
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOD_ODR_HIGH	((volatile unsigned char *)		(GPIO_D+0x15)) /*om man vill kolla high mŒste m
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define	GPIO_E			0x40021000
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define	GPIOE_MODER		((volatile unsigned int *)		(GPIO_E)) /*int pga att 4 bytes Šr 32 bitar*/
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define	GPIOE_OTYPER	((volatile unsigned short *)	(GPIO_E+0x4)) /*short oga att otyper anŠnder 2 by
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOE_PUPDR		((volatile unsigned int *)		(GPIO_E+0xC)) /*0xC sŠger vilken offset GPIO behšv
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOE_OSPEDER   ((volatile unsigned int *)      (GPIO_E+0x08))
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOE_IDR_LOW	((volatile unsigned char *)		(GPIO_E+0x10))
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOE_IDR_HIGH	((volatile unsigned char *)		(GPIO_E+0x11)) /*om man vill kolla high mŒste m
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOE_ODR_LOW	((volatile unsigned char *)		(GPIO_E+0x14))
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define GPIOE_ODR_HIGH	((volatile unsigned char *)		(GPIO_E+0x15)) /*om man vill kolla high mŒste m
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define B_E 0x40 // Enable
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define B_RST 0x20 // Reset
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define B_CS2 0x10 // Controller Select 2
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define B_CS1 8 // Controller Select 1
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define B_SELECT 4 // 0 Graphics, 1 ASCII
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define B_RW 2 // 0 Write, 1 Read
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define B_RS 1 // 0 Command, 1 Data
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define LCD_ON 0x3F // Display on
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define LCD_OFF 0x3E // Display off
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define LCD_SET_ADD 0x40 // Set horizontal coordinate
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define LCD_SET_PAGE 0xB8 // Set vertical coordinate
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define LCD_DISP_START 0xC0 // Start address
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define LCD_BUSY 0x80 // Read busy status
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #define MAX_POINTS 20
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** typedef struct tPoint{
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     unsigned char x;
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     unsigned char y;
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }POINT;
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** typedef struct tGeometry{
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      int numpoints;
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      int sizex;
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      int sizey;
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      POINT px[MAX_POINTS];
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }GEOMETRY, *PGEOMETRY;
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** typedef struct tObj{
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     PGEOMETRY geo;
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     int dirx,diry;
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     int posx,posy;
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     void (* draw)(struct tObj *);
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     void (* clear)(struct tObj *);
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     void (* move)(struct tObj *);
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     void (* set_speed)(struct tObj * , int, int);
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }OBJECT, *POBJECT;
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** GEOMETRY ball_geometry = {
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     12,
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     4,4,
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     {
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         {0,1}, {0,2}, {1,0},{1,1},{1,2},
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         {1,3},{2,0},{2,1},{2,2},{2,3},
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         {3,1},
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         {3,2}
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     };
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void set_object_speed(POBJECT p, int x, int y){
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
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     p->dirx = x;
  75              		.loc 1 76 0
  76 000c FB68     		ldr	r3, [r7, #12]
  77 000e BA68     		ldr	r2, [r7, #8]
  78 0010 5A60     		str	r2, [r3, #4]
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     p->diry = y;
  79              		.loc 1 77 0
  80 0012 FB68     		ldr	r3, [r7, #12]
  81 0014 7A68     		ldr	r2, [r7, #4]
  82 0016 9A60     		str	r2, [r3, #8]
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
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
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void draw_object(POBJECT p){
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
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      POINT *ptr = p->geo->px;
 114              		.loc 1 80 0
 115 0028 7B68     		ldr	r3, [r7, #4]
 116 002a 1B68     		ldr	r3, [r3]
 117 002c 0C33     		adds	r3, r3, #12
 118 002e 7B61     		str	r3, [r7, #20]
 119              	.LBB2:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     for(int i = 0; i < p->geo->numpoints; i++){
 120              		.loc 1 81 0
 121 0030 0023     		movs	r3, #0
 122 0032 3B61     		str	r3, [r7, #16]
 123 0034 17E0     		b	.L3
 124              	.L4:
 125              	.LBB3:
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         //unsigned int x = p->posx + (p->geo->px->x + i);
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         //unsigned int y = p->posy + (p->geo->px->y+ i);
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****        
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         unsigned int x = p->posx + ptr->x;
 126              		.loc 1 86 0 discriminator 3
 127 0036 7B68     		ldr	r3, [r7, #4]
 128 0038 DB68     		ldr	r3, [r3, #12]
 129 003a 7A69     		ldr	r2, [r7, #20]
 130 003c 1278     		ldrb	r2, [r2]
 131 003e 9B18     		adds	r3, r3, r2
 132 0040 FB60     		str	r3, [r7, #12]
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         unsigned int y = p->posy + ptr->y;
 133              		.loc 1 87 0 discriminator 3
 134 0042 7B68     		ldr	r3, [r7, #4]
 135 0044 1B69     		ldr	r3, [r3, #16]
 136 0046 7A69     		ldr	r2, [r7, #20]
 137 0048 5278     		ldrb	r2, [r2, #1]
 138 004a 9B18     		adds	r3, r3, r2
 139 004c BB60     		str	r3, [r7, #8]
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         pixel(x,y, 1);
 140              		.loc 1 89 0 discriminator 3
 141 004e B968     		ldr	r1, [r7, #8]
 142 0050 FB68     		ldr	r3, [r7, #12]
 143 0052 0122     		movs	r2, #1
 144 0054 1800     		movs	r0, r3
 145 0056 FFF7FEFF 		bl	pixel
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         ptr++;
 146              		.loc 1 90 0 discriminator 3
 147 005a 7B69     		ldr	r3, [r7, #20]
 148 005c 0233     		adds	r3, r3, #2
 149 005e 7B61     		str	r3, [r7, #20]
 150              	.LBE3:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         
 151              		.loc 1 81 0 discriminator 3
 152 0060 3B69     		ldr	r3, [r7, #16]
 153 0062 0133     		adds	r3, r3, #1
 154 0064 3B61     		str	r3, [r7, #16]
 155              	.L3:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         
 156              		.loc 1 81 0 is_stmt 0 discriminator 1
 157 0066 7B68     		ldr	r3, [r7, #4]
 158 0068 1B68     		ldr	r3, [r3]
 159 006a 1A68     		ldr	r2, [r3]
 160 006c 3B69     		ldr	r3, [r7, #16]
 161 006e 9A42     		cmp	r2, r3
 162 0070 E1DC     		bgt	.L4
 163              	.LBE2:
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         }
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
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
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void clear_object(POBJECT p){
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
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      POINT *ptr = p->geo->px;
 195              		.loc 1 94 0
 196 0082 7B68     		ldr	r3, [r7, #4]
 197 0084 1B68     		ldr	r3, [r3]
 198 0086 0C33     		adds	r3, r3, #12
 199 0088 7B61     		str	r3, [r7, #20]
 200              	.LBB4:
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     for(int i = 0; i < p->geo->numpoints; i++){
 201              		.loc 1 95 0
 202 008a 0023     		movs	r3, #0
 203 008c 3B61     		str	r3, [r7, #16]
 204 008e 17E0     		b	.L6
 205              	.L7:
 206              	.LBB5:
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         unsigned int x = p->posx + ptr->x;
 207              		.loc 1 96 0 discriminator 3
 208 0090 7B68     		ldr	r3, [r7, #4]
 209 0092 DB68     		ldr	r3, [r3, #12]
 210 0094 7A69     		ldr	r2, [r7, #20]
 211 0096 1278     		ldrb	r2, [r2]
 212 0098 9B18     		adds	r3, r3, r2
 213 009a FB60     		str	r3, [r7, #12]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         unsigned int y = p->posy + ptr->y;
 214              		.loc 1 97 0 discriminator 3
 215 009c 7B68     		ldr	r3, [r7, #4]
 216 009e 1B69     		ldr	r3, [r3, #16]
 217 00a0 7A69     		ldr	r2, [r7, #20]
 218 00a2 5278     		ldrb	r2, [r2, #1]
 219 00a4 9B18     		adds	r3, r3, r2
 220 00a6 BB60     		str	r3, [r7, #8]
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         pixel(x,y, 0);
 221              		.loc 1 99 0 discriminator 3
 222 00a8 B968     		ldr	r1, [r7, #8]
 223 00aa FB68     		ldr	r3, [r7, #12]
 224 00ac 0022     		movs	r2, #0
 225 00ae 1800     		movs	r0, r3
 226 00b0 FFF7FEFF 		bl	pixel
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         ptr++;
 227              		.loc 1 100 0 discriminator 3
 228 00b4 7B69     		ldr	r3, [r7, #20]
 229 00b6 0233     		adds	r3, r3, #2
 230 00b8 7B61     		str	r3, [r7, #20]
 231              	.LBE5:
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         unsigned int x = p->posx + ptr->x;
 232              		.loc 1 95 0 discriminator 3
 233 00ba 3B69     		ldr	r3, [r7, #16]
 234 00bc 0133     		adds	r3, r3, #1
 235 00be 3B61     		str	r3, [r7, #16]
 236              	.L6:
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         unsigned int x = p->posx + ptr->x;
 237              		.loc 1 95 0 is_stmt 0 discriminator 1
 238 00c0 7B68     		ldr	r3, [r7, #4]
 239 00c2 1B68     		ldr	r3, [r3]
 240 00c4 1A68     		ldr	r2, [r3]
 241 00c6 3B69     		ldr	r3, [r7, #16]
 242 00c8 9A42     		cmp	r2, r3
 243 00ca E1DC     		bgt	.L7
 244              	.LBE4:
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         }
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
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
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void move_object(POBJECT p){
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
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     clear_object(p);
 276              		.loc 1 106 0
 277 00dc 7B68     		ldr	r3, [r7, #4]
 278 00de 1800     		movs	r0, r3
 279 00e0 FFF7FEFF 		bl	clear_object
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     p->posx = p->posx + p->dirx;
 280              		.loc 1 108 0
 281 00e4 7B68     		ldr	r3, [r7, #4]
 282 00e6 DA68     		ldr	r2, [r3, #12]
 283 00e8 7B68     		ldr	r3, [r7, #4]
 284 00ea 5B68     		ldr	r3, [r3, #4]
 285 00ec D218     		adds	r2, r2, r3
 286 00ee 7B68     		ldr	r3, [r7, #4]
 287 00f0 DA60     		str	r2, [r3, #12]
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     p->posy = p->posy + p->diry;
 288              		.loc 1 109 0
 289 00f2 7B68     		ldr	r3, [r7, #4]
 290 00f4 1A69     		ldr	r2, [r3, #16]
 291 00f6 7B68     		ldr	r3, [r7, #4]
 292 00f8 9B68     		ldr	r3, [r3, #8]
 293 00fa D218     		adds	r2, r2, r3
 294 00fc 7B68     		ldr	r3, [r7, #4]
 295 00fe 1A61     		str	r2, [r3, #16]
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     int px = p->posx;
 296              		.loc 1 110 0
 297 0100 7B68     		ldr	r3, [r7, #4]
 298 0102 DB68     		ldr	r3, [r3, #12]
 299 0104 FB60     		str	r3, [r7, #12]
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     int py = p->posy;
 300              		.loc 1 111 0
 301 0106 7B68     		ldr	r3, [r7, #4]
 302 0108 1B69     		ldr	r3, [r3, #16]
 303 010a BB60     		str	r3, [r7, #8]
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     draw_object(p);
 304              		.loc 1 113 0
 305 010c 7B68     		ldr	r3, [r7, #4]
 306 010e 1800     		movs	r0, r3
 307 0110 FFF7FEFF 		bl	draw_object
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
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
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     static OBJECT ball = {
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     &ball_geometry,
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     0,0,
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     1,1,
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     draw_object,
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     clear_object,
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     move_object,
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     set_object_speed
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     };
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void startup ( void )
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** {
 341              		.loc 1 128 0
 342              		.cfi_startproc
 343              		@ Naked Function: prologue and epilogue provided by programmer.
 344              		@ args = 0, pretend = 0, frame = 0
 345              		@ frame_needed = 1, uses_anonymous_args = 0
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** __asm volatile(
 346              		.loc 1 129 0
 347              		.syntax divided
 348              	@ 129 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong/startup.c" 1
 349 0000 0248     		 LDR R0,=0x2001C000
 350 0002 8546     	 MOV SP,R0
 351 0004 FFF7FEFF 	 BL main
 352 0008 FEE7     	_exit: B .
 353              	
 354              	@ 0 "" 2
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	" MOV SP,R0\n"
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	" BL main\n"				/* call main */
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	"_exit: B .\n"				/* never return */
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	) ;
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
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
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void init_app(void){
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
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     *GPIOE_MODER = 0x55555555;
 382              		.loc 1 137 0
 383 0120 084B     		ldr	r3, .L11
 384 0122 094A     		ldr	r2, .L11+4
 385 0124 1A60     		str	r2, [r3]
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	/*sŠtter vŒra in och ut portar*/
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	*GPIOE_OTYPER = 0x70;
 386              		.loc 1 139 0
 387 0126 094B     		ldr	r3, .L11+8
 388 0128 7022     		movs	r2, #112
 389 012a 1A80     		strh	r2, [r3]
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	*GPIOE_PUPDR = 0x0AA;
 390              		.loc 1 140 0
 391 012c 084B     		ldr	r3, .L11+12
 392 012e AA22     		movs	r2, #170
 393 0130 1A60     		str	r2, [r3]
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 	*GPIOE_ODR_HIGH = *GPIOE_ODR_HIGH & 0x00FF;
 394              		.loc 1 141 0
 395 0132 084B     		ldr	r3, .L11+16
 396 0134 074A     		ldr	r2, .L11+16
 397 0136 1278     		ldrb	r2, [r2]
 398 0138 D2B2     		uxtb	r2, r2
 399 013a 1A70     		strb	r2, [r3]
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
 400              		.loc 1 142 0
 401 013c C046     		nop
 402 013e BD46     		mov	sp, r7
 403              		@ sp needed
 404 0140 80BD     		pop	{r7, pc}
 405              	.L12:
 406 0142 C046     		.align	2
 407              	.L11:
 408 0144 00100240 		.word	1073876992
 409 0148 55555555 		.word	1431655765
 410 014c 04100240 		.word	1073876996
 411 0150 0C100240 		.word	1073877004
 412 0154 15100240 		.word	1073877013
 413              		.cfi_endproc
 414              	.LFE5:
 416              		.align	1
 417              		.global	main
 418              		.syntax unified
 419              		.code	16
 420              		.thumb_func
 421              		.fpu softvfp
 423              	main:
 424              	.LFB6:
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void main(void)
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** {
 425              		.loc 1 144 0
 426              		.cfi_startproc
 427              		@ args = 0, pretend = 0, frame = 8
 428              		@ frame_needed = 1, uses_anonymous_args = 0
 429 0158 80B5     		push	{r7, lr}
 430              		.cfi_def_cfa_offset 8
 431              		.cfi_offset 7, -8
 432              		.cfi_offset 14, -4
 433 015a 82B0     		sub	sp, sp, #8
 434              		.cfi_def_cfa_offset 16
 435 015c 00AF     		add	r7, sp, #0
 436              		.cfi_def_cfa_register 7
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     init_app();
 437              		.loc 1 145 0
 438 015e FFF7FEFF 		bl	init_app
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_initialize();
 439              		.loc 1 146 0
 440 0162 FFF7FEFF 		bl	graphic_initialize
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_clear_screen();// simulator onely
 441              		.loc 1 147 0
 442 0166 FFF7FEFF 		bl	graphic_clear_screen
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  POBJECT p = &ball;
 443              		.loc 1 148 0
 444 016a 084B     		ldr	r3, .L15
 445 016c 7B60     		str	r3, [r7, #4]
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  p->set_speed(p, 4, 1);
 446              		.loc 1 149 0
 447 016e 7B68     		ldr	r3, [r7, #4]
 448 0170 1B6A     		ldr	r3, [r3, #32]
 449 0172 7868     		ldr	r0, [r7, #4]
 450 0174 0122     		movs	r2, #1
 451 0176 0421     		movs	r1, #4
 452 0178 9847     		blx	r3
 453              	.LVL0:
 454              	.L14:
 455              	.LBB6:
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  while(1){
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     p->move(p);
 456              		.loc 1 151 0 discriminator 1
 457 017a 7B68     		ldr	r3, [r7, #4]
 458 017c DB69     		ldr	r3, [r3, #28]
 459 017e 7A68     		ldr	r2, [r7, #4]
 460 0180 1000     		movs	r0, r2
 461 0182 9847     		blx	r3
 462              	.LVL1:
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      delay_milli(40);
 463              		.loc 1 152 0 discriminator 1
 464 0184 2820     		movs	r0, #40
 465 0186 FFF7FEFF 		bl	delay_milli
 466              	.LBE6:
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****  while(1){
 467              		.loc 1 150 0 discriminator 1
 468 018a F6E7     		b	.L14
 469              	.L16:
 470              		.align	2
 471              	.L15:
 472 018c 34000000 		.word	ball
 473              		.cfi_endproc
 474              	.LFE6:
 476              		.align	1
 477              		.global	delay_250ns
 478              		.syntax unified
 479              		.code	16
 480              		.thumb_func
 481              		.fpu softvfp
 483              	delay_250ns:
 484              	.LFB7:
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****      }
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void delay_250ns(void)
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** {
 485              		.loc 1 158 0
 486              		.cfi_startproc
 487              		@ args = 0, pretend = 0, frame = 0
 488              		@ frame_needed = 1, uses_anonymous_args = 0
 489 0190 80B5     		push	{r7, lr}
 490              		.cfi_def_cfa_offset 8
 491              		.cfi_offset 7, -8
 492              		.cfi_offset 14, -4
 493 0192 00AF     		add	r7, sp, #0
 494              		.cfi_def_cfa_register 7
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     *STK_CTRL = 0;
 495              		.loc 1 159 0
 496 0194 0C4B     		ldr	r3, .L19
 497 0196 0022     		movs	r2, #0
 498 0198 1A60     		str	r2, [r3]
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     *STK_LOAD = (168/4)-1;   // minst 500 ns
 499              		.loc 1 160 0
 500 019a 0C4B     		ldr	r3, .L19+4
 501 019c 2922     		movs	r2, #41
 502 019e 1A60     		str	r2, [r3]
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     *STK_VAL = 0;
 503              		.loc 1 161 0
 504 01a0 0B4B     		ldr	r3, .L19+8
 505 01a2 0022     		movs	r2, #0
 506 01a4 1A60     		str	r2, [r3]
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     *STK_CTRL = 5;
 507              		.loc 1 162 0
 508 01a6 084B     		ldr	r3, .L19
 509 01a8 0522     		movs	r2, #5
 510 01aa 1A60     		str	r2, [r3]
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     while((* STK_CTRL & 0x10000) == 0) ;
 511              		.loc 1 163 0
 512 01ac C046     		nop
 513              	.L18:
 514              		.loc 1 163 0 is_stmt 0 discriminator 1
 515 01ae 064B     		ldr	r3, .L19
 516 01b0 1A68     		ldr	r2, [r3]
 517 01b2 8023     		movs	r3, #128
 518 01b4 5B02     		lsls	r3, r3, #9
 519 01b6 1340     		ands	r3, r2
 520 01b8 F9D0     		beq	.L18
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     *STK_CTRL = 0;
 521              		.loc 1 164 0 is_stmt 1
 522 01ba 034B     		ldr	r3, .L19
 523 01bc 0022     		movs	r2, #0
 524 01be 1A60     		str	r2, [r3]
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 525              		.loc 1 165 0
 526 01c0 C046     		nop
 527 01c2 BD46     		mov	sp, r7
 528              		@ sp needed
 529 01c4 80BD     		pop	{r7, pc}
 530              	.L20:
 531 01c6 C046     		.align	2
 532              	.L19:
 533 01c8 10E000E0 		.word	-536813552
 534 01cc 14E000E0 		.word	-536813548
 535 01d0 18E000E0 		.word	-536813544
 536              		.cfi_endproc
 537              	.LFE7:
 539              		.align	1
 540              		.global	delay_mikro
 541              		.syntax unified
 542              		.code	16
 543              		.thumb_func
 544              		.fpu softvfp
 546              	delay_mikro:
 547              	.LFB8:
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void delay_mikro(unsigned int us)
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** {
 548              		.loc 1 169 0
 549              		.cfi_startproc
 550              		@ args = 0, pretend = 0, frame = 8
 551              		@ frame_needed = 1, uses_anonymous_args = 0
 552 01d4 80B5     		push	{r7, lr}
 553              		.cfi_def_cfa_offset 8
 554              		.cfi_offset 7, -8
 555              		.cfi_offset 14, -4
 556 01d6 82B0     		sub	sp, sp, #8
 557              		.cfi_def_cfa_offset 16
 558 01d8 00AF     		add	r7, sp, #0
 559              		.cfi_def_cfa_register 7
 560 01da 7860     		str	r0, [r7, #4]
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #ifdef   SIMULATOR
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     us = us / 1000;
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     us++;
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** #endif
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     while(us < 0){
 561              		.loc 1 174 0
 562 01dc C046     		nop
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         {
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             delay_250ns();
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             delay_250ns();
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             delay_250ns();
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             delay_250ns();
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             us--;
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         }
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 563              		.loc 1 183 0
 564 01de C046     		nop
 565 01e0 BD46     		mov	sp, r7
 566 01e2 02B0     		add	sp, sp, #8
 567              		@ sp needed
 568 01e4 80BD     		pop	{r7, pc}
 569              		.cfi_endproc
 570              	.LFE8:
 572              		.global	__aeabi_uidiv
 573              		.align	1
 574              		.global	delay_milli
 575              		.syntax unified
 576              		.code	16
 577              		.thumb_func
 578              		.fpu softvfp
 580              	delay_milli:
 581              	.LFB9:
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void delay_milli(unsigned ms)
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** {
 582              		.loc 1 186 0
 583              		.cfi_startproc
 584              		@ args = 0, pretend = 0, frame = 8
 585              		@ frame_needed = 1, uses_anonymous_args = 0
 586 01e6 80B5     		push	{r7, lr}
 587              		.cfi_def_cfa_offset 8
 588              		.cfi_offset 7, -8
 589              		.cfi_offset 14, -4
 590 01e8 82B0     		sub	sp, sp, #8
 591              		.cfi_def_cfa_offset 16
 592 01ea 00AF     		add	r7, sp, #0
 593              		.cfi_def_cfa_register 7
 594 01ec 7860     		str	r0, [r7, #4]
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     ms = ms/1000;// simulator onely
 595              		.loc 1 188 0
 596 01ee 7A68     		ldr	r2, [r7, #4]
 597 01f0 FA23     		movs	r3, #250
 598 01f2 9900     		lsls	r1, r3, #2
 599 01f4 1000     		movs	r0, r2
 600 01f6 FFF7FEFF 		bl	__aeabi_uidiv
 601              	.LVL2:
 602 01fa 0300     		movs	r3, r0
 603 01fc 7B60     		str	r3, [r7, #4]
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     ms++;//simulator
 604              		.loc 1 189 0
 605 01fe 7B68     		ldr	r3, [r7, #4]
 606 0200 0133     		adds	r3, r3, #1
 607 0202 7B60     		str	r3, [r7, #4]
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** 
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     while(ms > 0){
 608              		.loc 1 191 0
 609 0204 07E0     		b	.L23
 610              	.L24:
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         {
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             delay_mikro(1000);
 611              		.loc 1 193 0
 612 0206 FA23     		movs	r3, #250
 613 0208 9B00     		lsls	r3, r3, #2
 614 020a 1800     		movs	r0, r3
 615 020c FFF7FEFF 		bl	delay_mikro
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             ms--;
 616              		.loc 1 194 0
 617 0210 7B68     		ldr	r3, [r7, #4]
 618 0212 013B     		subs	r3, r3, #1
 619 0214 7B60     		str	r3, [r7, #4]
 620              	.L23:
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         {
 621              		.loc 1 191 0
 622 0216 7B68     		ldr	r3, [r7, #4]
 623 0218 002B     		cmp	r3, #0
 624 021a F4D1     		bne	.L24
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****             
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****         }
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 625              		.loc 1 198 0
 626 021c C046     		nop
 627 021e BD46     		mov	sp, r7
 628 0220 02B0     		add	sp, sp, #8
 629              		@ sp needed
 630 0222 80BD     		pop	{r7, pc}
 631              		.cfi_endproc
 632              	.LFE9:
 634              		.align	1
 635              		.global	delay_500ns
 636              		.syntax unified
 637              		.code	16
 638              		.thumb_func
 639              		.fpu softvfp
 641              	delay_500ns:
 642              	.LFB10:
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void delay_500ns(void){
 643              		.loc 1 199 0
 644              		.cfi_startproc
 645              		@ args = 0, pretend = 0, frame = 0
 646              		@ frame_needed = 1, uses_anonymous_args = 0
 647 0224 80B5     		push	{r7, lr}
 648              		.cfi_def_cfa_offset 8
 649              		.cfi_offset 7, -8
 650              		.cfi_offset 14, -4
 651 0226 00AF     		add	r7, sp, #0
 652              		.cfi_def_cfa_register 7
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     delay_250ns();
 653              		.loc 1 200 0
 654 0228 FFF7FEFF 		bl	delay_250ns
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     delay_250ns();
 655              		.loc 1 201 0
 656 022c FFF7FEFF 		bl	delay_250ns
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     }
 657              		.loc 1 202 0
 658 0230 C046     		nop
 659 0232 BD46     		mov	sp, r7
 660              		@ sp needed
 661 0234 80BD     		pop	{r7, pc}
 662              		.cfi_endproc
 663              	.LFE10:
 665              		.align	1
 666              		.syntax unified
 667              		.code	16
 668              		.thumb_func
 669              		.fpu softvfp
 671              	graphic_ctrl_bit_set:
 672              	.LFB11:
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** static void graphic_ctrl_bit_set(uint8_t x) {
 673              		.loc 1 203 0
 674              		.cfi_startproc
 675              		@ args = 0, pretend = 0, frame = 16
 676              		@ frame_needed = 1, uses_anonymous_args = 0
 677 0236 80B5     		push	{r7, lr}
 678              		.cfi_def_cfa_offset 8
 679              		.cfi_offset 7, -8
 680              		.cfi_offset 14, -4
 681 0238 84B0     		sub	sp, sp, #16
 682              		.cfi_def_cfa_offset 24
 683 023a 00AF     		add	r7, sp, #0
 684              		.cfi_def_cfa_register 7
 685 023c 0200     		movs	r2, r0
 686 023e FB1D     		adds	r3, r7, #7
 687 0240 1A70     		strb	r2, [r3]
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** uint8_t c;
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c = *GPIOE_ODR_LOW;
 688              		.loc 1 205 0
 689 0242 124A     		ldr	r2, .L27
 690 0244 0F23     		movs	r3, #15
 691 0246 FB18     		adds	r3, r7, r3
 692 0248 1278     		ldrb	r2, [r2]
 693 024a 1A70     		strb	r2, [r3]
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c &= ~B_SELECT;
 694              		.loc 1 206 0
 695 024c 0F23     		movs	r3, #15
 696 024e FB18     		adds	r3, r7, r3
 697 0250 0F22     		movs	r2, #15
 698 0252 BA18     		adds	r2, r7, r2
 699 0254 1278     		ldrb	r2, [r2]
 700 0256 0421     		movs	r1, #4
 701 0258 8A43     		bics	r2, r1
 702 025a 1A70     		strb	r2, [r3]
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c |= (~B_SELECT & x);
 703              		.loc 1 207 0
 704 025c FB1D     		adds	r3, r7, #7
 705 025e 1B78     		ldrb	r3, [r3]
 706 0260 5BB2     		sxtb	r3, r3
 707 0262 0422     		movs	r2, #4
 708 0264 9343     		bics	r3, r2
 709 0266 5AB2     		sxtb	r2, r3
 710 0268 0F23     		movs	r3, #15
 711 026a FB18     		adds	r3, r7, r3
 712 026c 1B78     		ldrb	r3, [r3]
 713 026e 5BB2     		sxtb	r3, r3
 714 0270 1343     		orrs	r3, r2
 715 0272 5AB2     		sxtb	r2, r3
 716 0274 0F23     		movs	r3, #15
 717 0276 FB18     		adds	r3, r7, r3
 718 0278 1A70     		strb	r2, [r3]
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** *GPIOE_ODR_LOW = c;
 719              		.loc 1 208 0
 720 027a 044A     		ldr	r2, .L27
 721 027c 0F23     		movs	r3, #15
 722 027e FB18     		adds	r3, r7, r3
 723 0280 1B78     		ldrb	r3, [r3]
 724 0282 1370     		strb	r3, [r2]
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 725              		.loc 1 209 0
 726 0284 C046     		nop
 727 0286 BD46     		mov	sp, r7
 728 0288 04B0     		add	sp, sp, #16
 729              		@ sp needed
 730 028a 80BD     		pop	{r7, pc}
 731              	.L28:
 732              		.align	2
 733              	.L27:
 734 028c 14100240 		.word	1073877012
 735              		.cfi_endproc
 736              	.LFE11:
 738              		.align	1
 739              		.syntax unified
 740              		.code	16
 741              		.thumb_func
 742              		.fpu softvfp
 744              	graphic_ctrl_bit_clear:
 745              	.LFB12:
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** static void graphic_ctrl_bit_clear(uint8_t x) {
 746              		.loc 1 210 0
 747              		.cfi_startproc
 748              		@ args = 0, pretend = 0, frame = 16
 749              		@ frame_needed = 1, uses_anonymous_args = 0
 750 0290 80B5     		push	{r7, lr}
 751              		.cfi_def_cfa_offset 8
 752              		.cfi_offset 7, -8
 753              		.cfi_offset 14, -4
 754 0292 84B0     		sub	sp, sp, #16
 755              		.cfi_def_cfa_offset 24
 756 0294 00AF     		add	r7, sp, #0
 757              		.cfi_def_cfa_register 7
 758 0296 0200     		movs	r2, r0
 759 0298 FB1D     		adds	r3, r7, #7
 760 029a 1A70     		strb	r2, [r3]
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** uint8_t c;
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c = *GPIOE_ODR_LOW;
 761              		.loc 1 212 0
 762 029c 114A     		ldr	r2, .L30
 763 029e 0F23     		movs	r3, #15
 764 02a0 FB18     		adds	r3, r7, r3
 765 02a2 1278     		ldrb	r2, [r2]
 766 02a4 1A70     		strb	r2, [r3]
 213:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c &= ~B_SELECT;
 767              		.loc 1 213 0
 768 02a6 0F23     		movs	r3, #15
 769 02a8 FB18     		adds	r3, r7, r3
 770 02aa 0F22     		movs	r2, #15
 771 02ac BA18     		adds	r2, r7, r2
 772 02ae 1278     		ldrb	r2, [r2]
 773 02b0 0421     		movs	r1, #4
 774 02b2 8A43     		bics	r2, r1
 775 02b4 1A70     		strb	r2, [r3]
 214:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c &= ~x;
 776              		.loc 1 214 0
 777 02b6 FB1D     		adds	r3, r7, #7
 778 02b8 1B78     		ldrb	r3, [r3]
 779 02ba 5BB2     		sxtb	r3, r3
 780 02bc DB43     		mvns	r3, r3
 781 02be 5BB2     		sxtb	r3, r3
 782 02c0 0F22     		movs	r2, #15
 783 02c2 BA18     		adds	r2, r7, r2
 784 02c4 1278     		ldrb	r2, [r2]
 785 02c6 52B2     		sxtb	r2, r2
 786 02c8 1340     		ands	r3, r2
 787 02ca 5AB2     		sxtb	r2, r3
 788 02cc 0F23     		movs	r3, #15
 789 02ce FB18     		adds	r3, r7, r3
 790 02d0 1A70     		strb	r2, [r3]
 215:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** *GPIOE_ODR_LOW = c;
 791              		.loc 1 215 0
 792 02d2 044A     		ldr	r2, .L30
 793 02d4 0F23     		movs	r3, #15
 794 02d6 FB18     		adds	r3, r7, r3
 795 02d8 1B78     		ldrb	r3, [r3]
 796 02da 1370     		strb	r3, [r2]
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 797              		.loc 1 216 0
 798 02dc C046     		nop
 799 02de BD46     		mov	sp, r7
 800 02e0 04B0     		add	sp, sp, #16
 801              		@ sp needed
 802 02e2 80BD     		pop	{r7, pc}
 803              	.L31:
 804              		.align	2
 805              	.L30:
 806 02e4 14100240 		.word	1073877012
 807              		.cfi_endproc
 808              	.LFE12:
 810              		.align	1
 811              		.syntax unified
 812              		.code	16
 813              		.thumb_func
 814              		.fpu softvfp
 816              	select_controller:
 817              	.LFB13:
 217:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** static void select_controller(uint8_t controller){
 818              		.loc 1 217 0
 819              		.cfi_startproc
 820              		@ args = 0, pretend = 0, frame = 8
 821              		@ frame_needed = 1, uses_anonymous_args = 0
 822 02e8 80B5     		push	{r7, lr}
 823              		.cfi_def_cfa_offset 8
 824              		.cfi_offset 7, -8
 825              		.cfi_offset 14, -4
 826 02ea 82B0     		sub	sp, sp, #8
 827              		.cfi_def_cfa_offset 16
 828 02ec 00AF     		add	r7, sp, #0
 829              		.cfi_def_cfa_register 7
 830 02ee 0200     		movs	r2, r0
 831 02f0 FB1D     		adds	r3, r7, #7
 832 02f2 1A70     		strb	r2, [r3]
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     switch(controller){
 833              		.loc 1 218 0
 834 02f4 FB1D     		adds	r3, r7, #7
 835 02f6 1B78     		ldrb	r3, [r3]
 836 02f8 082B     		cmp	r3, #8
 837 02fa 0CD0     		beq	.L34
 838 02fc 02DC     		bgt	.L35
 839 02fe 002B     		cmp	r3, #0
 840 0300 05D0     		beq	.L36
 219:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     case 0:
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_clear(B_CS1|B_CS2);
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 222:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     case B_CS1 :
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_set(B_CS1);
 224:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_clear(B_CS2);
 225:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 226:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     case B_CS2 :
 227:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_set(B_CS2);
 228:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_clear(B_CS1);
 229:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 230:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     case B_CS1|B_CS2 :
 231:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_set(B_CS1|B_CS2);
 232:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 233:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 234:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 841              		.loc 1 234 0
 842 0302 1AE0     		b	.L39
 843              	.L35:
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     switch(controller){
 844              		.loc 1 218 0
 845 0304 102B     		cmp	r3, #16
 846 0306 0DD0     		beq	.L37
 847 0308 182B     		cmp	r3, #24
 848 030a 12D0     		beq	.L38
 849              		.loc 1 234 0
 850 030c 15E0     		b	.L39
 851              	.L36:
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 852              		.loc 1 220 0
 853 030e 1820     		movs	r0, #24
 854 0310 FFF7BEFF 		bl	graphic_ctrl_bit_clear
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     case B_CS1 :
 855              		.loc 1 221 0
 856 0314 11E0     		b	.L33
 857              	.L34:
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_clear(B_CS2);
 858              		.loc 1 223 0
 859 0316 0820     		movs	r0, #8
 860 0318 FFF78DFF 		bl	graphic_ctrl_bit_set
 224:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 861              		.loc 1 224 0
 862 031c 1020     		movs	r0, #16
 863 031e FFF7B7FF 		bl	graphic_ctrl_bit_clear
 225:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     case B_CS2 :
 864              		.loc 1 225 0
 865 0322 0AE0     		b	.L33
 866              	.L37:
 227:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     graphic_ctrl_bit_clear(B_CS1);
 867              		.loc 1 227 0
 868 0324 1020     		movs	r0, #16
 869 0326 FFF786FF 		bl	graphic_ctrl_bit_set
 228:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 870              		.loc 1 228 0
 871 032a 0820     		movs	r0, #8
 872 032c FFF7B0FF 		bl	graphic_ctrl_bit_clear
 229:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     case B_CS1|B_CS2 :
 873              		.loc 1 229 0
 874 0330 03E0     		b	.L33
 875              	.L38:
 231:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c ****     break;
 876              		.loc 1 231 0
 877 0332 1820     		movs	r0, #24
 878 0334 FFF77FFF 		bl	graphic_ctrl_bit_set
 232:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 879              		.loc 1 232 0
 880 0338 C046     		nop
 881              	.L33:
 882              	.L39:
 883              		.loc 1 234 0
 884 033a C046     		nop
 885 033c BD46     		mov	sp, r7
 886 033e 02B0     		add	sp, sp, #8
 887              		@ sp needed
 888 0340 80BD     		pop	{r7, pc}
 889              		.cfi_endproc
 890              	.LFE13:
 892              		.align	1
 893              		.global	graphic_initialize
 894              		.syntax unified
 895              		.code	16
 896              		.thumb_func
 897              		.fpu softvfp
 899              	graphic_initialize:
 900              	.LFB14:
 235:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void graphic_initialize(void) {
 901              		.loc 1 235 0
 902              		.cfi_startproc
 903              		@ args = 0, pretend = 0, frame = 0
 904              		@ frame_needed = 1, uses_anonymous_args = 0
 905 0342 80B5     		push	{r7, lr}
 906              		.cfi_def_cfa_offset 8
 907              		.cfi_offset 7, -8
 908              		.cfi_offset 14, -4
 909 0344 00AF     		add	r7, sp, #0
 910              		.cfi_def_cfa_register 7
 236:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_E);
 911              		.loc 1 236 0
 912 0346 4020     		movs	r0, #64
 913 0348 FFF775FF 		bl	graphic_ctrl_bit_set
 237:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_mikro(10);
 914              		.loc 1 237 0
 915 034c 0A20     		movs	r0, #10
 916 034e FFF7FEFF 		bl	delay_mikro
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 917              		.loc 1 238 0
 918 0352 7820     		movs	r0, #120
 919 0354 FFF79CFF 		bl	graphic_ctrl_bit_clear
 239:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_milli(30);
 920              		.loc 1 239 0
 921 0358 1E20     		movs	r0, #30
 922 035a FFF7FEFF 		bl	delay_milli
 240:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_RST);
 923              		.loc 1 240 0
 924 035e 2020     		movs	r0, #32
 925 0360 FFF769FF 		bl	graphic_ctrl_bit_set
 241:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_milli(100);
 926              		.loc 1 241 0
 927 0364 6420     		movs	r0, #100
 928 0366 FFF7FEFF 		bl	delay_milli
 242:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 929              		.loc 1 242 0
 930 036a 1821     		movs	r1, #24
 931 036c 3E20     		movs	r0, #62
 932 036e FFF7FEFF 		bl	graphic_write_command
 243:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_ON, B_CS1|B_CS2);
 933              		.loc 1 243 0
 934 0372 1821     		movs	r1, #24
 935 0374 3F20     		movs	r0, #63
 936 0376 FFF7FEFF 		bl	graphic_write_command
 244:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 937              		.loc 1 244 0
 938 037a 1821     		movs	r1, #24
 939 037c C020     		movs	r0, #192
 940 037e FFF7FEFF 		bl	graphic_write_command
 245:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 941              		.loc 1 245 0
 942 0382 1821     		movs	r1, #24
 943 0384 4020     		movs	r0, #64
 944 0386 FFF7FEFF 		bl	graphic_write_command
 246:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 945              		.loc 1 246 0
 946 038a 1821     		movs	r1, #24
 947 038c B820     		movs	r0, #184
 948 038e FFF7FEFF 		bl	graphic_write_command
 247:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller(0);
 949              		.loc 1 247 0
 950 0392 0020     		movs	r0, #0
 951 0394 FFF7A8FF 		bl	select_controller
 248:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 952              		.loc 1 248 0
 953 0398 C046     		nop
 954 039a BD46     		mov	sp, r7
 955              		@ sp needed
 956 039c 80BD     		pop	{r7, pc}
 957              		.cfi_endproc
 958              	.LFE14:
 960              		.align	1
 961              		.syntax unified
 962              		.code	16
 963              		.thumb_func
 964              		.fpu softvfp
 966              	graphic_wait_ready:
 967              	.LFB15:
 249:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** static void graphic_wait_ready(void) {
 968              		.loc 1 249 0
 969              		.cfi_startproc
 970              		@ args = 0, pretend = 0, frame = 8
 971              		@ frame_needed = 1, uses_anonymous_args = 0
 972 039e 80B5     		push	{r7, lr}
 973              		.cfi_def_cfa_offset 8
 974              		.cfi_offset 7, -8
 975              		.cfi_offset 14, -4
 976 03a0 82B0     		sub	sp, sp, #8
 977              		.cfi_def_cfa_offset 16
 978 03a2 00AF     		add	r7, sp, #0
 979              		.cfi_def_cfa_register 7
 250:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** uint8_t c;
 251:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_E);
 980              		.loc 1 251 0
 981 03a4 4020     		movs	r0, #64
 982 03a6 FFF773FF 		bl	graphic_ctrl_bit_clear
 252:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** // 15-8 inputs, 7-0 outputs
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** *GPIOE_MODER = 0x00005555;
 983              		.loc 1 253 0
 984 03aa 144B     		ldr	r3, .L47
 985 03ac 144A     		ldr	r2, .L47+4
 986 03ae 1A60     		str	r2, [r3]
 254:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_RS);
 987              		.loc 1 254 0
 988 03b0 0120     		movs	r0, #1
 989 03b2 FFF76DFF 		bl	graphic_ctrl_bit_clear
 255:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_RW);
 990              		.loc 1 255 0
 991 03b6 0220     		movs	r0, #2
 992 03b8 FFF73DFF 		bl	graphic_ctrl_bit_set
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 993              		.loc 1 256 0
 994 03bc FFF7FEFF 		bl	delay_500ns
 995              	.L44:
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** while(1) {
 258:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_E);
 996              		.loc 1 258 0
 997 03c0 4020     		movs	r0, #64
 998 03c2 FFF738FF 		bl	graphic_ctrl_bit_set
 259:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 999              		.loc 1 259 0
 1000 03c6 FFF7FEFF 		bl	delay_500ns
 260:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c = *GPIOE_IDR_HIGH & LCD_BUSY;
 1001              		.loc 1 260 0
 1002 03ca 0E4B     		ldr	r3, .L47+8
 1003 03cc 1B78     		ldrb	r3, [r3]
 1004 03ce DAB2     		uxtb	r2, r3
 1005 03d0 FB1D     		adds	r3, r7, #7
 1006 03d2 7F21     		movs	r1, #127
 1007 03d4 8A43     		bics	r2, r1
 1008 03d6 1A70     		strb	r2, [r3]
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1009              		.loc 1 261 0
 1010 03d8 4020     		movs	r0, #64
 1011 03da FFF759FF 		bl	graphic_ctrl_bit_clear
 262:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 1012              		.loc 1 262 0
 1013 03de FFF7FEFF 		bl	delay_500ns
 263:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if( c == 0 ) break;
 1014              		.loc 1 263 0
 1015 03e2 FB1D     		adds	r3, r7, #7
 1016 03e4 1B78     		ldrb	r3, [r3]
 1017 03e6 002B     		cmp	r3, #0
 1018 03e8 00D0     		beq	.L46
 258:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 1019              		.loc 1 258 0
 1020 03ea E9E7     		b	.L44
 1021              	.L46:
 1022              		.loc 1 263 0
 1023 03ec C046     		nop
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 265:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 1024              		.loc 1 265 0
 1025 03ee 034B     		ldr	r3, .L47
 1026 03f0 054A     		ldr	r2, .L47+12
 1027 03f2 1A60     		str	r2, [r3]
 266:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1028              		.loc 1 266 0
 1029 03f4 C046     		nop
 1030 03f6 BD46     		mov	sp, r7
 1031 03f8 02B0     		add	sp, sp, #8
 1032              		@ sp needed
 1033 03fa 80BD     		pop	{r7, pc}
 1034              	.L48:
 1035              		.align	2
 1036              	.L47:
 1037 03fc 00100240 		.word	1073876992
 1038 0400 55550000 		.word	21845
 1039 0404 11100240 		.word	1073877009
 1040 0408 55555555 		.word	1431655765
 1041              		.cfi_endproc
 1042              	.LFE15:
 1044              		.align	1
 1045              		.syntax unified
 1046              		.code	16
 1047              		.thumb_func
 1048              		.fpu softvfp
 1050              	graphic_read:
 1051              	.LFB16:
 267:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** static uint8_t graphic_read(uint8_t controller) {
 1052              		.loc 1 267 0
 1053              		.cfi_startproc
 1054              		@ args = 0, pretend = 0, frame = 16
 1055              		@ frame_needed = 1, uses_anonymous_args = 0
 1056 040c 80B5     		push	{r7, lr}
 1057              		.cfi_def_cfa_offset 8
 1058              		.cfi_offset 7, -8
 1059              		.cfi_offset 14, -4
 1060 040e 84B0     		sub	sp, sp, #16
 1061              		.cfi_def_cfa_offset 24
 1062 0410 00AF     		add	r7, sp, #0
 1063              		.cfi_def_cfa_register 7
 1064 0412 0200     		movs	r2, r0
 1065 0414 FB1D     		adds	r3, r7, #7
 1066 0416 1A70     		strb	r2, [r3]
 268:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** uint8_t c;
 269:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1067              		.loc 1 269 0
 1068 0418 4020     		movs	r0, #64
 1069 041a FFF739FF 		bl	graphic_ctrl_bit_clear
 270:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** *GPIOE_MODER = 0x00005555; // 15-8 inputs, 7-0 outputs
 1070              		.loc 1 270 0
 1071 041e 1C4B     		ldr	r3, .L53
 1072 0420 1C4A     		ldr	r2, .L53+4
 1073 0422 1A60     		str	r2, [r3]
 271:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_RS|B_RW);
 1074              		.loc 1 271 0
 1075 0424 0320     		movs	r0, #3
 1076 0426 FFF706FF 		bl	graphic_ctrl_bit_set
 272:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller(controller);
 1077              		.loc 1 272 0
 1078 042a FB1D     		adds	r3, r7, #7
 1079 042c 1B78     		ldrb	r3, [r3]
 1080 042e 1800     		movs	r0, r3
 1081 0430 FFF75AFF 		bl	select_controller
 273:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 1082              		.loc 1 273 0
 1083 0434 FFF7FEFF 		bl	delay_500ns
 274:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_E);
 1084              		.loc 1 274 0
 1085 0438 4020     		movs	r0, #64
 1086 043a FFF7FCFE 		bl	graphic_ctrl_bit_set
 275:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 1087              		.loc 1 275 0
 1088 043e FFF7FEFF 		bl	delay_500ns
 276:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c = *GPIOE_IDR_HIGH;
 1089              		.loc 1 276 0
 1090 0442 154A     		ldr	r2, .L53+8
 1091 0444 0F23     		movs	r3, #15
 1092 0446 FB18     		adds	r3, r7, r3
 1093 0448 1278     		ldrb	r2, [r2]
 1094 044a 1A70     		strb	r2, [r3]
 277:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1095              		.loc 1 277 0
 1096 044c 4020     		movs	r0, #64
 1097 044e FFF71FFF 		bl	graphic_ctrl_bit_clear
 278:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** *GPIOE_MODER = 0x55555555; // 15-0 outputs
 1098              		.loc 1 278 0
 1099 0452 0F4B     		ldr	r3, .L53
 1100 0454 114A     		ldr	r2, .L53+12
 1101 0456 1A60     		str	r2, [r3]
 279:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if( controller & B_CS1 ) {
 1102              		.loc 1 279 0
 1103 0458 FB1D     		adds	r3, r7, #7
 1104 045a 1B78     		ldrb	r3, [r3]
 1105 045c 0822     		movs	r2, #8
 1106 045e 1340     		ands	r3, r2
 1107 0460 04D0     		beq	.L50
 280:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller(B_CS1);
 1108              		.loc 1 280 0
 1109 0462 0820     		movs	r0, #8
 1110 0464 FFF740FF 		bl	select_controller
 281:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_wait_ready();
 1111              		.loc 1 281 0
 1112 0468 FFF799FF 		bl	graphic_wait_ready
 1113              	.L50:
 282:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 283:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if( controller & B_CS2 ) {
 1114              		.loc 1 283 0
 1115 046c FB1D     		adds	r3, r7, #7
 1116 046e 1B78     		ldrb	r3, [r3]
 1117 0470 1022     		movs	r2, #16
 1118 0472 1340     		ands	r3, r2
 1119 0474 04D0     		beq	.L51
 284:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller(B_CS2);
 1120              		.loc 1 284 0
 1121 0476 1020     		movs	r0, #16
 1122 0478 FFF736FF 		bl	select_controller
 285:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_wait_ready();
 1123              		.loc 1 285 0
 1124 047c FFF78FFF 		bl	graphic_wait_ready
 1125              	.L51:
 286:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 287:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** return c;
 1126              		.loc 1 287 0
 1127 0480 0F23     		movs	r3, #15
 1128 0482 FB18     		adds	r3, r7, r3
 1129 0484 1B78     		ldrb	r3, [r3]
 288:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1130              		.loc 1 288 0
 1131 0486 1800     		movs	r0, r3
 1132 0488 BD46     		mov	sp, r7
 1133 048a 04B0     		add	sp, sp, #16
 1134              		@ sp needed
 1135 048c 80BD     		pop	{r7, pc}
 1136              	.L54:
 1137 048e C046     		.align	2
 1138              	.L53:
 1139 0490 00100240 		.word	1073876992
 1140 0494 55550000 		.word	21845
 1141 0498 11100240 		.word	1073877009
 1142 049c 55555555 		.word	1431655765
 1143              		.cfi_endproc
 1144              	.LFE16:
 1146              		.align	1
 1147              		.syntax unified
 1148              		.code	16
 1149              		.thumb_func
 1150              		.fpu softvfp
 1152              	graphic_read_data:
 1153              	.LFB17:
 289:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** static uint8_t graphic_read_data(uint8_t controller) {
 1154              		.loc 1 289 0
 1155              		.cfi_startproc
 1156              		@ args = 0, pretend = 0, frame = 8
 1157              		@ frame_needed = 1, uses_anonymous_args = 0
 1158 04a0 80B5     		push	{r7, lr}
 1159              		.cfi_def_cfa_offset 8
 1160              		.cfi_offset 7, -8
 1161              		.cfi_offset 14, -4
 1162 04a2 82B0     		sub	sp, sp, #8
 1163              		.cfi_def_cfa_offset 16
 1164 04a4 00AF     		add	r7, sp, #0
 1165              		.cfi_def_cfa_register 7
 1166 04a6 0200     		movs	r2, r0
 1167 04a8 FB1D     		adds	r3, r7, #7
 1168 04aa 1A70     		strb	r2, [r3]
 290:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_read(controller);
 1169              		.loc 1 290 0
 1170 04ac FB1D     		adds	r3, r7, #7
 1171 04ae 1B78     		ldrb	r3, [r3]
 1172 04b0 1800     		movs	r0, r3
 1173 04b2 FFF7ABFF 		bl	graphic_read
 291:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** return graphic_read(controller);
 1174              		.loc 1 291 0
 1175 04b6 FB1D     		adds	r3, r7, #7
 1176 04b8 1B78     		ldrb	r3, [r3]
 1177 04ba 1800     		movs	r0, r3
 1178 04bc FFF7A6FF 		bl	graphic_read
 1179 04c0 0300     		movs	r3, r0
 292:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1180              		.loc 1 292 0
 1181 04c2 1800     		movs	r0, r3
 1182 04c4 BD46     		mov	sp, r7
 1183 04c6 02B0     		add	sp, sp, #8
 1184              		@ sp needed
 1185 04c8 80BD     		pop	{r7, pc}
 1186              		.cfi_endproc
 1187              	.LFE17:
 1189              		.align	1
 1190              		.syntax unified
 1191              		.code	16
 1192              		.thumb_func
 1193              		.fpu softvfp
 1195              	graphic_write:
 1196              	.LFB18:
 293:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** static void graphic_write(uint8_t value, uint8_t controller) {
 1197              		.loc 1 293 0
 1198              		.cfi_startproc
 1199              		@ args = 0, pretend = 0, frame = 8
 1200              		@ frame_needed = 1, uses_anonymous_args = 0
 1201 04ca 80B5     		push	{r7, lr}
 1202              		.cfi_def_cfa_offset 8
 1203              		.cfi_offset 7, -8
 1204              		.cfi_offset 14, -4
 1205 04cc 82B0     		sub	sp, sp, #8
 1206              		.cfi_def_cfa_offset 16
 1207 04ce 00AF     		add	r7, sp, #0
 1208              		.cfi_def_cfa_register 7
 1209 04d0 0200     		movs	r2, r0
 1210 04d2 FB1D     		adds	r3, r7, #7
 1211 04d4 1A70     		strb	r2, [r3]
 1212 04d6 BB1D     		adds	r3, r7, #6
 1213 04d8 0A1C     		adds	r2, r1, #0
 1214 04da 1A70     		strb	r2, [r3]
 294:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** *GPIOE_ODR_HIGH = value;
 1215              		.loc 1 294 0
 1216 04dc 154A     		ldr	r2, .L61
 1217 04de FB1D     		adds	r3, r7, #7
 1218 04e0 1B78     		ldrb	r3, [r3]
 1219 04e2 1370     		strb	r3, [r2]
 295:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller(controller);
 1220              		.loc 1 295 0
 1221 04e4 BB1D     		adds	r3, r7, #6
 1222 04e6 1B78     		ldrb	r3, [r3]
 1223 04e8 1800     		movs	r0, r3
 1224 04ea FFF7FDFE 		bl	select_controller
 296:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 1225              		.loc 1 296 0
 1226 04ee FFF7FEFF 		bl	delay_500ns
 297:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_E);
 1227              		.loc 1 297 0
 1228 04f2 4020     		movs	r0, #64
 1229 04f4 FFF79FFE 		bl	graphic_ctrl_bit_set
 298:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** delay_500ns();
 1230              		.loc 1 298 0
 1231 04f8 FFF7FEFF 		bl	delay_500ns
 299:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear( B_E );
 1232              		.loc 1 299 0
 1233 04fc 4020     		movs	r0, #64
 1234 04fe FFF7C7FE 		bl	graphic_ctrl_bit_clear
 300:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if(controller & B_CS1) {
 1235              		.loc 1 300 0
 1236 0502 BB1D     		adds	r3, r7, #6
 1237 0504 1B78     		ldrb	r3, [r3]
 1238 0506 0822     		movs	r2, #8
 1239 0508 1340     		ands	r3, r2
 1240 050a 04D0     		beq	.L58
 301:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller( B_CS1);
 1241              		.loc 1 301 0
 1242 050c 0820     		movs	r0, #8
 1243 050e FFF7EBFE 		bl	select_controller
 302:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_wait_ready();
 1244              		.loc 1 302 0
 1245 0512 FFF744FF 		bl	graphic_wait_ready
 1246              	.L58:
 303:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 304:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if(controller & B_CS2) {
 1247              		.loc 1 304 0
 1248 0516 BB1D     		adds	r3, r7, #6
 1249 0518 1B78     		ldrb	r3, [r3]
 1250 051a 1022     		movs	r2, #16
 1251 051c 1340     		ands	r3, r2
 1252 051e 04D0     		beq	.L60
 305:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller( B_CS2);
 1253              		.loc 1 305 0
 1254 0520 1020     		movs	r0, #16
 1255 0522 FFF7E1FE 		bl	select_controller
 306:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_wait_ready();
 1256              		.loc 1 306 0
 1257 0526 FFF73AFF 		bl	graphic_wait_ready
 1258              	.L60:
 307:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 308:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1259              		.loc 1 308 0
 1260 052a C046     		nop
 1261 052c BD46     		mov	sp, r7
 1262 052e 02B0     		add	sp, sp, #8
 1263              		@ sp needed
 1264 0530 80BD     		pop	{r7, pc}
 1265              	.L62:
 1266 0532 C046     		.align	2
 1267              	.L61:
 1268 0534 15100240 		.word	1073877013
 1269              		.cfi_endproc
 1270              	.LFE18:
 1272              		.align	1
 1273              		.global	graphic_write_command
 1274              		.syntax unified
 1275              		.code	16
 1276              		.thumb_func
 1277              		.fpu softvfp
 1279              	graphic_write_command:
 1280              	.LFB19:
 309:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller) {
 1281              		.loc 1 309 0
 1282              		.cfi_startproc
 1283              		@ args = 0, pretend = 0, frame = 8
 1284              		@ frame_needed = 1, uses_anonymous_args = 0
 1285 0538 80B5     		push	{r7, lr}
 1286              		.cfi_def_cfa_offset 8
 1287              		.cfi_offset 7, -8
 1288              		.cfi_offset 14, -4
 1289 053a 82B0     		sub	sp, sp, #8
 1290              		.cfi_def_cfa_offset 16
 1291 053c 00AF     		add	r7, sp, #0
 1292              		.cfi_def_cfa_register 7
 1293 053e 0200     		movs	r2, r0
 1294 0540 FB1D     		adds	r3, r7, #7
 1295 0542 1A70     		strb	r2, [r3]
 1296 0544 BB1D     		adds	r3, r7, #6
 1297 0546 0A1C     		adds	r2, r1, #0
 1298 0548 1A70     		strb	r2, [r3]
 310:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1299              		.loc 1 310 0
 1300 054a 4020     		movs	r0, #64
 1301 054c FFF7A0FE 		bl	graphic_ctrl_bit_clear
 311:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller(controller);
 1302              		.loc 1 311 0
 1303 0550 BB1D     		adds	r3, r7, #6
 1304 0552 1B78     		ldrb	r3, [r3]
 1305 0554 1800     		movs	r0, r3
 1306 0556 FFF7C7FE 		bl	select_controller
 312:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_RS|B_RW);
 1307              		.loc 1 312 0
 1308 055a 0320     		movs	r0, #3
 1309 055c FFF798FE 		bl	graphic_ctrl_bit_clear
 313:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write(command, controller);
 1310              		.loc 1 313 0
 1311 0560 BB1D     		adds	r3, r7, #6
 1312 0562 1A78     		ldrb	r2, [r3]
 1313 0564 FB1D     		adds	r3, r7, #7
 1314 0566 1B78     		ldrb	r3, [r3]
 1315 0568 1100     		movs	r1, r2
 1316 056a 1800     		movs	r0, r3
 1317 056c FFF7ADFF 		bl	graphic_write
 314:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1318              		.loc 1 314 0
 1319 0570 C046     		nop
 1320 0572 BD46     		mov	sp, r7
 1321 0574 02B0     		add	sp, sp, #8
 1322              		@ sp needed
 1323 0576 80BD     		pop	{r7, pc}
 1324              		.cfi_endproc
 1325              	.LFE19:
 1327              		.align	1
 1328              		.global	graphic_write_data
 1329              		.syntax unified
 1330              		.code	16
 1331              		.thumb_func
 1332              		.fpu softvfp
 1334              	graphic_write_data:
 1335              	.LFB20:
 315:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller) {
 1336              		.loc 1 315 0
 1337              		.cfi_startproc
 1338              		@ args = 0, pretend = 0, frame = 8
 1339              		@ frame_needed = 1, uses_anonymous_args = 0
 1340 0578 80B5     		push	{r7, lr}
 1341              		.cfi_def_cfa_offset 8
 1342              		.cfi_offset 7, -8
 1343              		.cfi_offset 14, -4
 1344 057a 82B0     		sub	sp, sp, #8
 1345              		.cfi_def_cfa_offset 16
 1346 057c 00AF     		add	r7, sp, #0
 1347              		.cfi_def_cfa_register 7
 1348 057e 0200     		movs	r2, r0
 1349 0580 FB1D     		adds	r3, r7, #7
 1350 0582 1A70     		strb	r2, [r3]
 1351 0584 BB1D     		adds	r3, r7, #6
 1352 0586 0A1C     		adds	r2, r1, #0
 1353 0588 1A70     		strb	r2, [r3]
 316:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_E);
 1354              		.loc 1 316 0
 1355 058a 4020     		movs	r0, #64
 1356 058c FFF780FE 		bl	graphic_ctrl_bit_clear
 317:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** select_controller(controller);
 1357              		.loc 1 317 0
 1358 0590 BB1D     		adds	r3, r7, #6
 1359 0592 1B78     		ldrb	r3, [r3]
 1360 0594 1800     		movs	r0, r3
 1361 0596 FFF7A7FE 		bl	select_controller
 318:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_set(B_RS);
 1362              		.loc 1 318 0
 1363 059a 0120     		movs	r0, #1
 1364 059c FFF74BFE 		bl	graphic_ctrl_bit_set
 319:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_ctrl_bit_clear(B_RW);
 1365              		.loc 1 319 0
 1366 05a0 0220     		movs	r0, #2
 1367 05a2 FFF775FE 		bl	graphic_ctrl_bit_clear
 320:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write(data, controller);
 1368              		.loc 1 320 0
 1369 05a6 BB1D     		adds	r3, r7, #6
 1370 05a8 1A78     		ldrb	r2, [r3]
 1371 05aa FB1D     		adds	r3, r7, #7
 1372 05ac 1B78     		ldrb	r3, [r3]
 1373 05ae 1100     		movs	r1, r2
 1374 05b0 1800     		movs	r0, r3
 1375 05b2 FFF78AFF 		bl	graphic_write
 321:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1376              		.loc 1 321 0
 1377 05b6 C046     		nop
 1378 05b8 BD46     		mov	sp, r7
 1379 05ba 02B0     		add	sp, sp, #8
 1380              		@ sp needed
 1381 05bc 80BD     		pop	{r7, pc}
 1382              		.cfi_endproc
 1383              	.LFE20:
 1385              		.align	1
 1386              		.global	graphic_clear_screen
 1387              		.syntax unified
 1388              		.code	16
 1389              		.thumb_func
 1390              		.fpu softvfp
 1392              	graphic_clear_screen:
 1393              	.LFB21:
 322:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void graphic_clear_screen(void) {
 1394              		.loc 1 322 0
 1395              		.cfi_startproc
 1396              		@ args = 0, pretend = 0, frame = 8
 1397              		@ frame_needed = 1, uses_anonymous_args = 0
 1398 05be 80B5     		push	{r7, lr}
 1399              		.cfi_def_cfa_offset 8
 1400              		.cfi_offset 7, -8
 1401              		.cfi_offset 14, -4
 1402 05c0 82B0     		sub	sp, sp, #8
 1403              		.cfi_def_cfa_offset 16
 1404 05c2 00AF     		add	r7, sp, #0
 1405              		.cfi_def_cfa_register 7
 323:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** uint8_t i, j;
 324:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** for(j = 0; j < 8; j++) {
 1406              		.loc 1 324 0
 1407 05c4 BB1D     		adds	r3, r7, #6
 1408 05c6 0022     		movs	r2, #0
 1409 05c8 1A70     		strb	r2, [r3]
 1410 05ca 23E0     		b	.L66
 1411              	.L69:
 325:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1412              		.loc 1 325 0
 1413 05cc BB1D     		adds	r3, r7, #6
 1414 05ce 1B78     		ldrb	r3, [r3]
 1415 05d0 4822     		movs	r2, #72
 1416 05d2 5242     		rsbs	r2, r2, #0
 1417 05d4 1343     		orrs	r3, r2
 1418 05d6 DBB2     		uxtb	r3, r3
 1419 05d8 1821     		movs	r1, #24
 1420 05da 1800     		movs	r0, r3
 1421 05dc FFF7FEFF 		bl	graphic_write_command
 326:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 1422              		.loc 1 326 0
 1423 05e0 1821     		movs	r1, #24
 1424 05e2 4020     		movs	r0, #64
 1425 05e4 FFF7FEFF 		bl	graphic_write_command
 327:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** for(i = 0; i <= 63; i++){
 1426              		.loc 1 327 0
 1427 05e8 FB1D     		adds	r3, r7, #7
 1428 05ea 0022     		movs	r2, #0
 1429 05ec 1A70     		strb	r2, [r3]
 1430 05ee 08E0     		b	.L67
 1431              	.L68:
 328:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_data(0, B_CS1|B_CS2);
 1432              		.loc 1 328 0 discriminator 3
 1433 05f0 1821     		movs	r1, #24
 1434 05f2 0020     		movs	r0, #0
 1435 05f4 FFF7FEFF 		bl	graphic_write_data
 327:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** for(i = 0; i <= 63; i++){
 1436              		.loc 1 327 0 discriminator 3
 1437 05f8 FB1D     		adds	r3, r7, #7
 1438 05fa 1A78     		ldrb	r2, [r3]
 1439 05fc FB1D     		adds	r3, r7, #7
 1440 05fe 0132     		adds	r2, r2, #1
 1441 0600 1A70     		strb	r2, [r3]
 1442              	.L67:
 327:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** for(i = 0; i <= 63; i++){
 1443              		.loc 1 327 0 is_stmt 0 discriminator 1
 1444 0602 FB1D     		adds	r3, r7, #7
 1445 0604 1B78     		ldrb	r3, [r3]
 1446 0606 3F2B     		cmp	r3, #63
 1447 0608 F2D9     		bls	.L68
 324:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1448              		.loc 1 324 0 is_stmt 1 discriminator 2
 1449 060a BB1D     		adds	r3, r7, #6
 1450 060c 1A78     		ldrb	r2, [r3]
 1451 060e BB1D     		adds	r3, r7, #6
 1452 0610 0132     		adds	r2, r2, #1
 1453 0612 1A70     		strb	r2, [r3]
 1454              	.L66:
 324:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 1455              		.loc 1 324 0 is_stmt 0 discriminator 1
 1456 0614 BB1D     		adds	r3, r7, #6
 1457 0616 1B78     		ldrb	r3, [r3]
 1458 0618 072B     		cmp	r3, #7
 1459 061a D7D9     		bls	.L69
 329:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 330:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 331:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1460              		.loc 1 331 0 is_stmt 1
 1461 061c C046     		nop
 1462 061e BD46     		mov	sp, r7
 1463 0620 02B0     		add	sp, sp, #8
 1464              		@ sp needed
 1465 0622 80BD     		pop	{r7, pc}
 1466              		.cfi_endproc
 1467              	.LFE21:
 1469              		.align	1
 1470              		.global	pixel
 1471              		.syntax unified
 1472              		.code	16
 1473              		.thumb_func
 1474              		.fpu softvfp
 1476              	pixel:
 1477              	.LFB22:
 332:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** void pixel(int x, int y, int set) {
 1478              		.loc 1 332 0
 1479              		.cfi_startproc
 1480              		@ args = 0, pretend = 0, frame = 32
 1481              		@ frame_needed = 1, uses_anonymous_args = 0
 1482 0624 90B5     		push	{r4, r7, lr}
 1483              		.cfi_def_cfa_offset 12
 1484              		.cfi_offset 4, -12
 1485              		.cfi_offset 7, -8
 1486              		.cfi_offset 14, -4
 1487 0626 89B0     		sub	sp, sp, #36
 1488              		.cfi_def_cfa_offset 48
 1489 0628 00AF     		add	r7, sp, #0
 1490              		.cfi_def_cfa_register 7
 1491 062a F860     		str	r0, [r7, #12]
 1492 062c B960     		str	r1, [r7, #8]
 1493 062e 7A60     		str	r2, [r7, #4]
 333:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** uint8_t mask, c, controller;
 334:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** int index;
 335:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1494              		.loc 1 335 0
 1495 0630 FB68     		ldr	r3, [r7, #12]
 1496 0632 002B     		cmp	r3, #0
 1497 0634 00DC     		bgt	.LCB1146
 1498 0636 BCE0     		b	.L91	@long jump
 1499              	.LCB1146:
 1500              		.loc 1 335 0 is_stmt 0 discriminator 1
 1501 0638 BB68     		ldr	r3, [r7, #8]
 1502 063a 002B     		cmp	r3, #0
 1503 063c 00DC     		bgt	.LCB1149
 1504 063e B8E0     		b	.L91	@long jump
 1505              	.LCB1149:
 1506              		.loc 1 335 0 discriminator 2
 1507 0640 FB68     		ldr	r3, [r7, #12]
 1508 0642 802B     		cmp	r3, #128
 1509 0644 00DD     		ble	.LCB1152
 1510 0646 B4E0     		b	.L91	@long jump
 1511              	.LCB1152:
 1512              		.loc 1 335 0 discriminator 3
 1513 0648 BB68     		ldr	r3, [r7, #8]
 1514 064a 402B     		cmp	r3, #64
 1515 064c 00DD     		ble	.LCB1155
 1516 064e B0E0     		b	.L91	@long jump
 1517              	.LCB1155:
 336:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** index = (y-1)/8;
 1518              		.loc 1 336 0 is_stmt 1
 1519 0650 BB68     		ldr	r3, [r7, #8]
 1520 0652 013B     		subs	r3, r3, #1
 1521 0654 002B     		cmp	r3, #0
 1522 0656 00DA     		bge	.L74
 1523 0658 0733     		adds	r3, r3, #7
 1524              	.L74:
 1525 065a DB10     		asrs	r3, r3, #3
 1526 065c BB61     		str	r3, [r7, #24]
 337:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** switch( (y-1)%8 ) {
 1527              		.loc 1 337 0
 1528 065e BB68     		ldr	r3, [r7, #8]
 1529 0660 013B     		subs	r3, r3, #1
 1530 0662 564A     		ldr	r2, .L92
 1531 0664 1340     		ands	r3, r2
 1532 0666 04D5     		bpl	.L75
 1533 0668 013B     		subs	r3, r3, #1
 1534 066a 0822     		movs	r2, #8
 1535 066c 5242     		rsbs	r2, r2, #0
 1536 066e 1343     		orrs	r3, r2
 1537 0670 0133     		adds	r3, r3, #1
 1538              	.L75:
 1539 0672 072B     		cmp	r3, #7
 1540 0674 2CD8     		bhi	.L76
 1541 0676 9A00     		lsls	r2, r3, #2
 1542 0678 514B     		ldr	r3, .L92+4
 1543 067a D318     		adds	r3, r2, r3
 1544 067c 1B68     		ldr	r3, [r3]
 1545 067e 9F46     		mov	pc, r3
 1546              		.section	.rodata
 1547              		.align	2
 1548              	.L78:
 1549 0000 80060000 		.word	.L77
 1550 0004 8A060000 		.word	.L79
 1551 0008 94060000 		.word	.L80
 1552 000c 9E060000 		.word	.L81
 1553 0010 A8060000 		.word	.L82
 1554 0014 B2060000 		.word	.L83
 1555 0018 BC060000 		.word	.L84
 1556 001c C6060000 		.word	.L85
 1557              		.text
 1558              	.L77:
 338:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 0: mask = 1; break;
 1559              		.loc 1 338 0
 1560 0680 1F23     		movs	r3, #31
 1561 0682 FB18     		adds	r3, r7, r3
 1562 0684 0122     		movs	r2, #1
 1563 0686 1A70     		strb	r2, [r3]
 1564 0688 22E0     		b	.L76
 1565              	.L79:
 339:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 1: mask = 2; break;
 1566              		.loc 1 339 0
 1567 068a 1F23     		movs	r3, #31
 1568 068c FB18     		adds	r3, r7, r3
 1569 068e 0222     		movs	r2, #2
 1570 0690 1A70     		strb	r2, [r3]
 1571 0692 1DE0     		b	.L76
 1572              	.L80:
 340:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 2: mask = 4; break;
 1573              		.loc 1 340 0
 1574 0694 1F23     		movs	r3, #31
 1575 0696 FB18     		adds	r3, r7, r3
 1576 0698 0422     		movs	r2, #4
 1577 069a 1A70     		strb	r2, [r3]
 1578 069c 18E0     		b	.L76
 1579              	.L81:
 341:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 3: mask = 8; break;
 1580              		.loc 1 341 0
 1581 069e 1F23     		movs	r3, #31
 1582 06a0 FB18     		adds	r3, r7, r3
 1583 06a2 0822     		movs	r2, #8
 1584 06a4 1A70     		strb	r2, [r3]
 1585 06a6 13E0     		b	.L76
 1586              	.L82:
 342:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 4: mask = 0x10; break;
 1587              		.loc 1 342 0
 1588 06a8 1F23     		movs	r3, #31
 1589 06aa FB18     		adds	r3, r7, r3
 1590 06ac 1022     		movs	r2, #16
 1591 06ae 1A70     		strb	r2, [r3]
 1592 06b0 0EE0     		b	.L76
 1593              	.L83:
 343:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 5: mask = 0x20; break;
 1594              		.loc 1 343 0
 1595 06b2 1F23     		movs	r3, #31
 1596 06b4 FB18     		adds	r3, r7, r3
 1597 06b6 2022     		movs	r2, #32
 1598 06b8 1A70     		strb	r2, [r3]
 1599 06ba 09E0     		b	.L76
 1600              	.L84:
 344:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 6: mask = 0x40; break;
 1601              		.loc 1 344 0
 1602 06bc 1F23     		movs	r3, #31
 1603 06be FB18     		adds	r3, r7, r3
 1604 06c0 4022     		movs	r2, #64
 1605 06c2 1A70     		strb	r2, [r3]
 1606 06c4 04E0     		b	.L76
 1607              	.L85:
 345:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** case 7: mask = 0x80; break;
 1608              		.loc 1 345 0
 1609 06c6 1F23     		movs	r3, #31
 1610 06c8 FB18     		adds	r3, r7, r3
 1611 06ca 8022     		movs	r2, #128
 1612 06cc 1A70     		strb	r2, [r3]
 1613 06ce C046     		nop
 1614              	.L76:
 346:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 347:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if(set == 0)
 1615              		.loc 1 347 0
 1616 06d0 7B68     		ldr	r3, [r7, #4]
 1617 06d2 002B     		cmp	r3, #0
 1618 06d4 06D1     		bne	.L86
 348:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** mask = ~mask;
 1619              		.loc 1 348 0
 1620 06d6 1F23     		movs	r3, #31
 1621 06d8 FB18     		adds	r3, r7, r3
 1622 06da 1F22     		movs	r2, #31
 1623 06dc BA18     		adds	r2, r7, r2
 1624 06de 1278     		ldrb	r2, [r2]
 1625 06e0 D243     		mvns	r2, r2
 1626 06e2 1A70     		strb	r2, [r3]
 1627              	.L86:
 349:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if(x > 64){
 1628              		.loc 1 349 0
 1629 06e4 FB68     		ldr	r3, [r7, #12]
 1630 06e6 402B     		cmp	r3, #64
 1631 06e8 07DD     		ble	.L87
 350:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** controller = B_CS2;
 1632              		.loc 1 350 0
 1633 06ea 1E23     		movs	r3, #30
 1634 06ec FB18     		adds	r3, r7, r3
 1635 06ee 1022     		movs	r2, #16
 1636 06f0 1A70     		strb	r2, [r3]
 351:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** x = x - 65;
 1637              		.loc 1 351 0
 1638 06f2 FB68     		ldr	r3, [r7, #12]
 1639 06f4 413B     		subs	r3, r3, #65
 1640 06f6 FB60     		str	r3, [r7, #12]
 1641 06f8 06E0     		b	.L88
 1642              	.L87:
 352:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** } else {
 353:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** controller = B_CS1;
 1643              		.loc 1 353 0
 1644 06fa 1E23     		movs	r3, #30
 1645 06fc FB18     		adds	r3, r7, r3
 1646 06fe 0822     		movs	r2, #8
 1647 0700 1A70     		strb	r2, [r3]
 354:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** x = x-1;
 1648              		.loc 1 354 0
 1649 0702 FB68     		ldr	r3, [r7, #12]
 1650 0704 013B     		subs	r3, r3, #1
 1651 0706 FB60     		str	r3, [r7, #12]
 1652              	.L88:
 355:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 356:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller );
 1653              		.loc 1 356 0
 1654 0708 FB68     		ldr	r3, [r7, #12]
 1655 070a 5BB2     		sxtb	r3, r3
 1656 070c 4022     		movs	r2, #64
 1657 070e 1343     		orrs	r3, r2
 1658 0710 5BB2     		sxtb	r3, r3
 1659 0712 DAB2     		uxtb	r2, r3
 1660 0714 1E23     		movs	r3, #30
 1661 0716 FB18     		adds	r3, r7, r3
 1662 0718 1B78     		ldrb	r3, [r3]
 1663 071a 1900     		movs	r1, r3
 1664 071c 1000     		movs	r0, r2
 1665 071e FFF7FEFF 		bl	graphic_write_command
 357:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_PAGE | index, controller );
 1666              		.loc 1 357 0
 1667 0722 BB69     		ldr	r3, [r7, #24]
 1668 0724 5BB2     		sxtb	r3, r3
 1669 0726 4822     		movs	r2, #72
 1670 0728 5242     		rsbs	r2, r2, #0
 1671 072a 1343     		orrs	r3, r2
 1672 072c 5BB2     		sxtb	r3, r3
 1673 072e DAB2     		uxtb	r2, r3
 1674 0730 1E23     		movs	r3, #30
 1675 0732 FB18     		adds	r3, r7, r3
 1676 0734 1B78     		ldrb	r3, [r3]
 1677 0736 1900     		movs	r1, r3
 1678 0738 1000     		movs	r0, r2
 1679 073a FFF7FEFF 		bl	graphic_write_command
 358:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** c = graphic_read_data(controller);
 1680              		.loc 1 358 0
 1681 073e 1723     		movs	r3, #23
 1682 0740 FC18     		adds	r4, r7, r3
 1683 0742 1E23     		movs	r3, #30
 1684 0744 FB18     		adds	r3, r7, r3
 1685 0746 1B78     		ldrb	r3, [r3]
 1686 0748 1800     		movs	r0, r3
 1687 074a FFF7A9FE 		bl	graphic_read_data
 1688 074e 0300     		movs	r3, r0
 1689 0750 2370     		strb	r3, [r4]
 359:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_command(LCD_SET_ADD | x, controller);
 1690              		.loc 1 359 0
 1691 0752 FB68     		ldr	r3, [r7, #12]
 1692 0754 5BB2     		sxtb	r3, r3
 1693 0756 4022     		movs	r2, #64
 1694 0758 1343     		orrs	r3, r2
 1695 075a 5BB2     		sxtb	r3, r3
 1696 075c DAB2     		uxtb	r2, r3
 1697 075e 1E23     		movs	r3, #30
 1698 0760 FB18     		adds	r3, r7, r3
 1699 0762 1B78     		ldrb	r3, [r3]
 1700 0764 1900     		movs	r1, r3
 1701 0766 1000     		movs	r0, r2
 1702 0768 FFF7FEFF 		bl	graphic_write_command
 360:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** if(set)
 1703              		.loc 1 360 0
 1704 076c 7B68     		ldr	r3, [r7, #4]
 1705 076e 002B     		cmp	r3, #0
 1706 0770 0AD0     		beq	.L89
 361:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** mask = mask | c;
 1707              		.loc 1 361 0
 1708 0772 1F23     		movs	r3, #31
 1709 0774 FB18     		adds	r3, r7, r3
 1710 0776 1F22     		movs	r2, #31
 1711 0778 B918     		adds	r1, r7, r2
 1712 077a 1722     		movs	r2, #23
 1713 077c BA18     		adds	r2, r7, r2
 1714 077e 0978     		ldrb	r1, [r1]
 1715 0780 1278     		ldrb	r2, [r2]
 1716 0782 0A43     		orrs	r2, r1
 1717 0784 1A70     		strb	r2, [r3]
 1718 0786 09E0     		b	.L90
 1719              	.L89:
 362:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** else
 363:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** mask = mask & c;
 1720              		.loc 1 363 0
 1721 0788 1F23     		movs	r3, #31
 1722 078a FB18     		adds	r3, r7, r3
 1723 078c 1F22     		movs	r2, #31
 1724 078e BA18     		adds	r2, r7, r2
 1725 0790 1721     		movs	r1, #23
 1726 0792 7918     		adds	r1, r7, r1
 1727 0794 1278     		ldrb	r2, [r2]
 1728 0796 0978     		ldrb	r1, [r1]
 1729 0798 0A40     		ands	r2, r1
 1730 079a 1A70     		strb	r2, [r3]
 1731              	.L90:
 364:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** graphic_write_data(mask, controller);
 1732              		.loc 1 364 0
 1733 079c 1E23     		movs	r3, #30
 1734 079e FB18     		adds	r3, r7, r3
 1735 07a0 1A78     		ldrb	r2, [r3]
 1736 07a2 1F23     		movs	r3, #31
 1737 07a4 FB18     		adds	r3, r7, r3
 1738 07a6 1B78     		ldrb	r3, [r3]
 1739 07a8 1100     		movs	r1, r2
 1740 07aa 1800     		movs	r0, r3
 1741 07ac FFF7FEFF 		bl	graphic_write_data
 1742 07b0 00E0     		b	.L70
 1743              	.L91:
 335:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** index = (y-1)/8;
 1744              		.loc 1 335 0
 1745 07b2 C046     		nop
 1746              	.L70:
 365:C:/Users/nicla/DAT017/Lab1/Moplaborationer/aoutoPong\startup.c **** }
 1747              		.loc 1 365 0
 1748 07b4 BD46     		mov	sp, r7
 1749 07b6 09B0     		add	sp, sp, #36
 1750              		@ sp needed
 1751 07b8 90BD     		pop	{r4, r7, pc}
 1752              	.L93:
 1753 07ba C046     		.align	2
 1754              	.L92:
 1755 07bc 07000080 		.word	-2147483641
 1756 07c0 00000000 		.word	.L78
 1757              		.cfi_endproc
 1758              	.LFE22:
 1760              	.Letext0:
