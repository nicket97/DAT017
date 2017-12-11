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
  16              		.global	set_racket_speed
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	set_racket_speed:
  23              	.LFB0:
  24              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working/racket.h"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** typedef struct tRacket{
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     PGEOMETRY geo;
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     int dirx, diry;
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     int posx, posy;
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     void (* draw) (struct tRacket *);
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     void (* clear) (struct tRacket *);
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     void (* move) (struct tRacket *);
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     void (* set_speed) (struct tRacket *, int);
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	int (* pos_x_inbounds) (struct tRacket *, int);
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	int (* pos_y_inbounds) (struct tRacket *, int);
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** } RACKET, *PRACKET;
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** void pixel( int x, int y, int set );
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** void set_racket_speed(PRACKET o, int speedy) {
  25              		.loc 1 15 0
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
  37 0006 7860     		str	r0, [r7, #4]
  38 0008 3960     		str	r1, [r7]
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     o->diry = speedy;
  39              		.loc 1 16 0
  40 000a 7B68     		ldr	r3, [r7, #4]
  41 000c 3A68     		ldr	r2, [r7]
  42 000e 9A60     		str	r2, [r3, #8]
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** }
  43              		.loc 1 17 0
  44 0010 C046     		nop
  45 0012 BD46     		mov	sp, r7
  46 0014 02B0     		add	sp, sp, #8
  47              		@ sp needed
  48 0016 80BD     		pop	{r7, pc}
  49              		.cfi_endproc
  50              	.LFE0:
  52              		.align	1
  53              		.global	draw_racket
  54              		.syntax unified
  55              		.code	16
  56              		.thumb_func
  57              		.fpu softvfp
  59              	draw_racket:
  60              	.LFB1:
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** void draw_racket(PRACKET o) {
  61              		.loc 1 19 0
  62              		.cfi_startproc
  63              		@ args = 0, pretend = 0, frame = 16
  64              		@ frame_needed = 1, uses_anonymous_args = 0
  65 0018 80B5     		push	{r7, lr}
  66              		.cfi_def_cfa_offset 8
  67              		.cfi_offset 7, -8
  68              		.cfi_offset 14, -4
  69 001a 84B0     		sub	sp, sp, #16
  70              		.cfi_def_cfa_offset 24
  71 001c 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  73 001e 7860     		str	r0, [r7, #4]
  74              	.LBB2:
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
  75              		.loc 1 20 0
  76 0020 0023     		movs	r3, #0
  77 0022 FB60     		str	r3, [r7, #12]
  78 0024 1EE0     		b	.L3
  79              	.L4:
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 1);
  80              		.loc 1 21 0 discriminator 3
  81 0026 7B68     		ldr	r3, [r7, #4]
  82 0028 1A68     		ldr	r2, [r3]
  83 002a FB68     		ldr	r3, [r7, #12]
  84 002c 0433     		adds	r3, r3, #4
  85 002e 5B00     		lsls	r3, r3, #1
  86 0030 D318     		adds	r3, r2, r3
  87 0032 0433     		adds	r3, r3, #4
  88 0034 1B78     		ldrb	r3, [r3]
  89 0036 1A00     		movs	r2, r3
  90 0038 7B68     		ldr	r3, [r7, #4]
  91 003a DB68     		ldr	r3, [r3, #12]
  92 003c D018     		adds	r0, r2, r3
  93 003e 7B68     		ldr	r3, [r7, #4]
  94 0040 1A68     		ldr	r2, [r3]
  95 0042 FB68     		ldr	r3, [r7, #12]
  96 0044 0433     		adds	r3, r3, #4
  97 0046 5B00     		lsls	r3, r3, #1
  98 0048 D318     		adds	r3, r2, r3
  99 004a 0533     		adds	r3, r3, #5
 100 004c 1B78     		ldrb	r3, [r3]
 101 004e 1A00     		movs	r2, r3
 102 0050 7B68     		ldr	r3, [r7, #4]
 103 0052 1B69     		ldr	r3, [r3, #16]
 104 0054 D318     		adds	r3, r2, r3
 105 0056 0122     		movs	r2, #1
 106 0058 1900     		movs	r1, r3
 107 005a FFF7FEFF 		bl	pixel
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 108              		.loc 1 20 0 discriminator 3
 109 005e FB68     		ldr	r3, [r7, #12]
 110 0060 0133     		adds	r3, r3, #1
 111 0062 FB60     		str	r3, [r7, #12]
 112              	.L3:
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 113              		.loc 1 20 0 is_stmt 0 discriminator 1
 114 0064 7B68     		ldr	r3, [r7, #4]
 115 0066 1B68     		ldr	r3, [r3]
 116 0068 1A68     		ldr	r2, [r3]
 117 006a FB68     		ldr	r3, [r7, #12]
 118 006c 9A42     		cmp	r2, r3
 119 006e DADC     		bgt	.L4
 120              	.LBE2:
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     }
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** }
 121              		.loc 1 23 0 is_stmt 1
 122 0070 C046     		nop
 123 0072 BD46     		mov	sp, r7
 124 0074 04B0     		add	sp, sp, #16
 125              		@ sp needed
 126 0076 80BD     		pop	{r7, pc}
 127              		.cfi_endproc
 128              	.LFE1:
 130              		.align	1
 131              		.global	clear_racket
 132              		.syntax unified
 133              		.code	16
 134              		.thumb_func
 135              		.fpu softvfp
 137              	clear_racket:
 138              	.LFB2:
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** void clear_racket(PRACKET o) {
 139              		.loc 1 25 0
 140              		.cfi_startproc
 141              		@ args = 0, pretend = 0, frame = 16
 142              		@ frame_needed = 1, uses_anonymous_args = 0
 143 0078 80B5     		push	{r7, lr}
 144              		.cfi_def_cfa_offset 8
 145              		.cfi_offset 7, -8
 146              		.cfi_offset 14, -4
 147 007a 84B0     		sub	sp, sp, #16
 148              		.cfi_def_cfa_offset 24
 149 007c 00AF     		add	r7, sp, #0
 150              		.cfi_def_cfa_register 7
 151 007e 7860     		str	r0, [r7, #4]
 152              	.LBB3:
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 153              		.loc 1 26 0
 154 0080 0023     		movs	r3, #0
 155 0082 FB60     		str	r3, [r7, #12]
 156 0084 1EE0     		b	.L6
 157              	.L7:
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 0);
 158              		.loc 1 27 0 discriminator 3
 159 0086 7B68     		ldr	r3, [r7, #4]
 160 0088 1A68     		ldr	r2, [r3]
 161 008a FB68     		ldr	r3, [r7, #12]
 162 008c 0433     		adds	r3, r3, #4
 163 008e 5B00     		lsls	r3, r3, #1
 164 0090 D318     		adds	r3, r2, r3
 165 0092 0433     		adds	r3, r3, #4
 166 0094 1B78     		ldrb	r3, [r3]
 167 0096 1A00     		movs	r2, r3
 168 0098 7B68     		ldr	r3, [r7, #4]
 169 009a DB68     		ldr	r3, [r3, #12]
 170 009c D018     		adds	r0, r2, r3
 171 009e 7B68     		ldr	r3, [r7, #4]
 172 00a0 1A68     		ldr	r2, [r3]
 173 00a2 FB68     		ldr	r3, [r7, #12]
 174 00a4 0433     		adds	r3, r3, #4
 175 00a6 5B00     		lsls	r3, r3, #1
 176 00a8 D318     		adds	r3, r2, r3
 177 00aa 0533     		adds	r3, r3, #5
 178 00ac 1B78     		ldrb	r3, [r3]
 179 00ae 1A00     		movs	r2, r3
 180 00b0 7B68     		ldr	r3, [r7, #4]
 181 00b2 1B69     		ldr	r3, [r3, #16]
 182 00b4 D318     		adds	r3, r2, r3
 183 00b6 0022     		movs	r2, #0
 184 00b8 1900     		movs	r1, r3
 185 00ba FFF7FEFF 		bl	pixel
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 186              		.loc 1 26 0 discriminator 3
 187 00be FB68     		ldr	r3, [r7, #12]
 188 00c0 0133     		adds	r3, r3, #1
 189 00c2 FB60     		str	r3, [r7, #12]
 190              	.L6:
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 191              		.loc 1 26 0 is_stmt 0 discriminator 1
 192 00c4 7B68     		ldr	r3, [r7, #4]
 193 00c6 1B68     		ldr	r3, [r3]
 194 00c8 1A68     		ldr	r2, [r3]
 195 00ca FB68     		ldr	r3, [r7, #12]
 196 00cc 9A42     		cmp	r2, r3
 197 00ce DADC     		bgt	.L7
 198              	.LBE3:
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     }
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** }
 199              		.loc 1 29 0 is_stmt 1
 200 00d0 C046     		nop
 201 00d2 BD46     		mov	sp, r7
 202 00d4 04B0     		add	sp, sp, #16
 203              		@ sp needed
 204 00d6 80BD     		pop	{r7, pc}
 205              		.cfi_endproc
 206              	.LFE2:
 208              		.align	1
 209              		.global	move_racket
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	move_racket:
 216              	.LFB3:
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** void move_racket(PRACKET o) 
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** {
 217              		.loc 1 32 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 8
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 00d8 80B5     		push	{r7, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 00da 82B0     		sub	sp, sp, #8
 226              		.cfi_def_cfa_offset 16
 227 00dc 00AF     		add	r7, sp, #0
 228              		.cfi_def_cfa_register 7
 229 00de 7860     		str	r0, [r7, #4]
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     clear_racket(o);
 230              		.loc 1 33 0
 231 00e0 7B68     		ldr	r3, [r7, #4]
 232 00e2 1800     		movs	r0, r3
 233 00e4 FFF7FEFF 		bl	clear_racket
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     o->posx += o->dirx;
 234              		.loc 1 34 0
 235 00e8 7B68     		ldr	r3, [r7, #4]
 236 00ea DA68     		ldr	r2, [r3, #12]
 237 00ec 7B68     		ldr	r3, [r7, #4]
 238 00ee 5B68     		ldr	r3, [r3, #4]
 239 00f0 D218     		adds	r2, r2, r3
 240 00f2 7B68     		ldr	r3, [r7, #4]
 241 00f4 DA60     		str	r2, [r3, #12]
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     o->posy += o->diry;
 242              		.loc 1 35 0
 243 00f6 7B68     		ldr	r3, [r7, #4]
 244 00f8 1A69     		ldr	r2, [r3, #16]
 245 00fa 7B68     		ldr	r3, [r7, #4]
 246 00fc 9B68     		ldr	r3, [r3, #8]
 247 00fe D218     		adds	r2, r2, r3
 248 0100 7B68     		ldr	r3, [r7, #4]
 249 0102 1A61     		str	r2, [r3, #16]
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     if (o->posx < 1) {
 250              		.loc 1 37 0
 251 0104 7B68     		ldr	r3, [r7, #4]
 252 0106 DB68     		ldr	r3, [r3, #12]
 253 0108 002B     		cmp	r3, #0
 254 010a 0CDC     		bgt	.L9
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->dirx = o->dirx * -1;
 255              		.loc 1 38 0
 256 010c 7B68     		ldr	r3, [r7, #4]
 257 010e 5B68     		ldr	r3, [r3, #4]
 258 0110 5A42     		rsbs	r2, r3, #0
 259 0112 7B68     		ldr	r3, [r7, #4]
 260 0114 5A60     		str	r2, [r3, #4]
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->posx += o->dirx;
 261              		.loc 1 39 0
 262 0116 7B68     		ldr	r3, [r7, #4]
 263 0118 DA68     		ldr	r2, [r3, #12]
 264 011a 7B68     		ldr	r3, [r7, #4]
 265 011c 5B68     		ldr	r3, [r3, #4]
 266 011e D218     		adds	r2, r2, r3
 267 0120 7B68     		ldr	r3, [r7, #4]
 268 0122 DA60     		str	r2, [r3, #12]
 269 0124 13E0     		b	.L10
 270              	.L9:
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     }
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     else if (o->posx + o->geo->sizex > 128) {
 271              		.loc 1 42 0
 272 0126 7B68     		ldr	r3, [r7, #4]
 273 0128 DA68     		ldr	r2, [r3, #12]
 274 012a 7B68     		ldr	r3, [r7, #4]
 275 012c 1B68     		ldr	r3, [r3]
 276 012e 5B68     		ldr	r3, [r3, #4]
 277 0130 D318     		adds	r3, r2, r3
 278 0132 802B     		cmp	r3, #128
 279 0134 0BDD     		ble	.L10
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->dirx = o->dirx * -1;
 280              		.loc 1 43 0
 281 0136 7B68     		ldr	r3, [r7, #4]
 282 0138 5B68     		ldr	r3, [r3, #4]
 283 013a 5A42     		rsbs	r2, r3, #0
 284 013c 7B68     		ldr	r3, [r7, #4]
 285 013e 5A60     		str	r2, [r3, #4]
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->posx += o->dirx;
 286              		.loc 1 44 0
 287 0140 7B68     		ldr	r3, [r7, #4]
 288 0142 DA68     		ldr	r2, [r3, #12]
 289 0144 7B68     		ldr	r3, [r7, #4]
 290 0146 5B68     		ldr	r3, [r3, #4]
 291 0148 D218     		adds	r2, r2, r3
 292 014a 7B68     		ldr	r3, [r7, #4]
 293 014c DA60     		str	r2, [r3, #12]
 294              	.L10:
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     }
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     if (o->posy < 1) {
 295              		.loc 1 47 0
 296 014e 7B68     		ldr	r3, [r7, #4]
 297 0150 1B69     		ldr	r3, [r3, #16]
 298 0152 002B     		cmp	r3, #0
 299 0154 0CDC     		bgt	.L11
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->diry = o->diry * -1;
 300              		.loc 1 48 0
 301 0156 7B68     		ldr	r3, [r7, #4]
 302 0158 9B68     		ldr	r3, [r3, #8]
 303 015a 5A42     		rsbs	r2, r3, #0
 304 015c 7B68     		ldr	r3, [r7, #4]
 305 015e 9A60     		str	r2, [r3, #8]
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->posy += o->diry;
 306              		.loc 1 49 0
 307 0160 7B68     		ldr	r3, [r7, #4]
 308 0162 1A69     		ldr	r2, [r3, #16]
 309 0164 7B68     		ldr	r3, [r7, #4]
 310 0166 9B68     		ldr	r3, [r3, #8]
 311 0168 D218     		adds	r2, r2, r3
 312 016a 7B68     		ldr	r3, [r7, #4]
 313 016c 1A61     		str	r2, [r3, #16]
 314 016e 13E0     		b	.L12
 315              	.L11:
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     }
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     else if (o->posy + o->geo->sizey > 64) {
 316              		.loc 1 52 0
 317 0170 7B68     		ldr	r3, [r7, #4]
 318 0172 1A69     		ldr	r2, [r3, #16]
 319 0174 7B68     		ldr	r3, [r7, #4]
 320 0176 1B68     		ldr	r3, [r3]
 321 0178 9B68     		ldr	r3, [r3, #8]
 322 017a D318     		adds	r3, r2, r3
 323 017c 402B     		cmp	r3, #64
 324 017e 0BDD     		ble	.L12
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->diry = o->diry * -1;
 325              		.loc 1 53 0
 326 0180 7B68     		ldr	r3, [r7, #4]
 327 0182 9B68     		ldr	r3, [r3, #8]
 328 0184 5A42     		rsbs	r2, r3, #0
 329 0186 7B68     		ldr	r3, [r7, #4]
 330 0188 9A60     		str	r2, [r3, #8]
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****         o->posy += o->diry;
 331              		.loc 1 54 0
 332 018a 7B68     		ldr	r3, [r7, #4]
 333 018c 1A69     		ldr	r2, [r3, #16]
 334 018e 7B68     		ldr	r3, [r7, #4]
 335 0190 9B68     		ldr	r3, [r3, #8]
 336 0192 D218     		adds	r2, r2, r3
 337 0194 7B68     		ldr	r3, [r7, #4]
 338 0196 1A61     		str	r2, [r3, #16]
 339              	.L12:
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     }
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h ****     draw_racket(o);
 340              		.loc 1 56 0
 341 0198 7B68     		ldr	r3, [r7, #4]
 342 019a 1800     		movs	r0, r3
 343 019c FFF7FEFF 		bl	draw_racket
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** }
 344              		.loc 1 57 0
 345 01a0 C046     		nop
 346 01a2 BD46     		mov	sp, r7
 347 01a4 02B0     		add	sp, sp, #8
 348              		@ sp needed
 349 01a6 80BD     		pop	{r7, pc}
 350              		.cfi_endproc
 351              	.LFE3:
 353              		.align	1
 354              		.global	pos_x_racket_inbounds
 355              		.syntax unified
 356              		.code	16
 357              		.thumb_func
 358              		.fpu softvfp
 360              	pos_x_racket_inbounds:
 361              	.LFB4:
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** int pos_x_racket_inbounds(PRACKET o, int positionx){
 362              		.loc 1 59 0
 363              		.cfi_startproc
 364              		@ args = 0, pretend = 0, frame = 16
 365              		@ frame_needed = 1, uses_anonymous_args = 0
 366 01a8 80B5     		push	{r7, lr}
 367              		.cfi_def_cfa_offset 8
 368              		.cfi_offset 7, -8
 369              		.cfi_offset 14, -4
 370 01aa 84B0     		sub	sp, sp, #16
 371              		.cfi_def_cfa_offset 24
 372 01ac 00AF     		add	r7, sp, #0
 373              		.cfi_def_cfa_register 7
 374 01ae 7860     		str	r0, [r7, #4]
 375 01b0 3960     		str	r1, [r7]
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	int tmp = o->posx - positionx;
 376              		.loc 1 60 0
 377 01b2 7B68     		ldr	r3, [r7, #4]
 378 01b4 DA68     		ldr	r2, [r3, #12]
 379 01b6 3B68     		ldr	r3, [r7]
 380 01b8 D31A     		subs	r3, r2, r3
 381 01ba FB60     		str	r3, [r7, #12]
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	if ((tmp > o->geo->sizex) || (tmp < 0)) return 0;
 382              		.loc 1 61 0
 383 01bc 7B68     		ldr	r3, [r7, #4]
 384 01be 1B68     		ldr	r3, [r3]
 385 01c0 5A68     		ldr	r2, [r3, #4]
 386 01c2 FB68     		ldr	r3, [r7, #12]
 387 01c4 9A42     		cmp	r2, r3
 388 01c6 02DB     		blt	.L14
 389              		.loc 1 61 0 is_stmt 0 discriminator 2
 390 01c8 FB68     		ldr	r3, [r7, #12]
 391 01ca 002B     		cmp	r3, #0
 392 01cc 01DA     		bge	.L15
 393              	.L14:
 394              		.loc 1 61 0 discriminator 3
 395 01ce 0023     		movs	r3, #0
 396 01d0 00E0     		b	.L16
 397              	.L15:
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	else return 1;
 398              		.loc 1 62 0 is_stmt 1
 399 01d2 0123     		movs	r3, #1
 400              	.L16:
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** }
 401              		.loc 1 63 0
 402 01d4 1800     		movs	r0, r3
 403 01d6 BD46     		mov	sp, r7
 404 01d8 04B0     		add	sp, sp, #16
 405              		@ sp needed
 406 01da 80BD     		pop	{r7, pc}
 407              		.cfi_endproc
 408              	.LFE4:
 410              		.align	1
 411              		.global	pos_y_racket_inbounds
 412              		.syntax unified
 413              		.code	16
 414              		.thumb_func
 415              		.fpu softvfp
 417              	pos_y_racket_inbounds:
 418              	.LFB5:
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** int pos_y_racket_inbounds(PRACKET o, int positiony){
 419              		.loc 1 65 0
 420              		.cfi_startproc
 421              		@ args = 0, pretend = 0, frame = 16
 422              		@ frame_needed = 1, uses_anonymous_args = 0
 423 01dc 80B5     		push	{r7, lr}
 424              		.cfi_def_cfa_offset 8
 425              		.cfi_offset 7, -8
 426              		.cfi_offset 14, -4
 427 01de 84B0     		sub	sp, sp, #16
 428              		.cfi_def_cfa_offset 24
 429 01e0 00AF     		add	r7, sp, #0
 430              		.cfi_def_cfa_register 7
 431 01e2 7860     		str	r0, [r7, #4]
 432 01e4 3960     		str	r1, [r7]
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	int tmp = o->posy - positiony;
 433              		.loc 1 66 0
 434 01e6 7B68     		ldr	r3, [r7, #4]
 435 01e8 1A69     		ldr	r2, [r3, #16]
 436 01ea 3B68     		ldr	r3, [r7]
 437 01ec D31A     		subs	r3, r2, r3
 438 01ee FB60     		str	r3, [r7, #12]
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	if ((tmp > o->geo->sizey) || (tmp < 0)) return 0;
 439              		.loc 1 67 0
 440 01f0 7B68     		ldr	r3, [r7, #4]
 441 01f2 1B68     		ldr	r3, [r3]
 442 01f4 9A68     		ldr	r2, [r3, #8]
 443 01f6 FB68     		ldr	r3, [r7, #12]
 444 01f8 9A42     		cmp	r2, r3
 445 01fa 02DB     		blt	.L18
 446              		.loc 1 67 0 is_stmt 0 discriminator 2
 447 01fc FB68     		ldr	r3, [r7, #12]
 448 01fe 002B     		cmp	r3, #0
 449 0200 01DA     		bge	.L19
 450              	.L18:
 451              		.loc 1 67 0 discriminator 3
 452 0202 0023     		movs	r3, #0
 453 0204 00E0     		b	.L20
 454              	.L19:
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** 	else return 1;
 455              		.loc 1 68 0 is_stmt 1
 456 0206 0123     		movs	r3, #1
 457              	.L20:
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\racket.h **** }...
 458              		.loc 1 69 0
 459 0208 1800     		movs	r0, r3
 460 020a BD46     		mov	sp, r7
 461 020c 04B0     		add	sp, sp, #16
 462              		@ sp needed
 463 020e 80BD     		pop	{r7, pc}
 464              		.cfi_endproc
 465              	.LFE5:
 467              		.align	1
 468              		.global	set_object_speed_x
 469              		.syntax unified
 470              		.code	16
 471              		.thumb_func
 472              		.fpu softvfp
 474              	set_object_speed_x:
 475              	.LFB6:
 476              		.file 2 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working/pongball.h"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** #include "racket.h"
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** typedef struct tPongBall{
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     PGEOMETRY geo;
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     int dirx, diry;
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     int posx, posy;
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     void (* draw) (struct tPongBall *);
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     void (* clear) (struct tPongBall *);
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     void (* move) (struct tPongBall *, struct tRacket *, struct tRacket *);
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     void (* set_speed_x) (struct tPongBall *, int);
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     void (* set_speed_y) (struct tPongBall *, int);
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	int (* pos_x_inbounds) (struct tPongBall *, int);
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	int (* pos_y_inbounds) (struct tPongBall *, int);
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** } PONGBALL, *PPONGBALL;
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** void pixel( int x, int y, int set );
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** void set_object_speed_x(PPONGBALL o, int speedx){
 477              		.loc 2 18 0
 478              		.cfi_startproc
 479              		@ args = 0, pretend = 0, frame = 8
 480              		@ frame_needed = 1, uses_anonymous_args = 0
 481 0210 80B5     		push	{r7, lr}
 482              		.cfi_def_cfa_offset 8
 483              		.cfi_offset 7, -8
 484              		.cfi_offset 14, -4
 485 0212 82B0     		sub	sp, sp, #8
 486              		.cfi_def_cfa_offset 16
 487 0214 00AF     		add	r7, sp, #0
 488              		.cfi_def_cfa_register 7
 489 0216 7860     		str	r0, [r7, #4]
 490 0218 3960     		str	r1, [r7]
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	o->dirx = speedx;
 491              		.loc 2 19 0
 492 021a 7B68     		ldr	r3, [r7, #4]
 493 021c 3A68     		ldr	r2, [r7]
 494 021e 5A60     		str	r2, [r3, #4]
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }
 495              		.loc 2 20 0
 496 0220 C046     		nop
 497 0222 BD46     		mov	sp, r7
 498 0224 02B0     		add	sp, sp, #8
 499              		@ sp needed
 500 0226 80BD     		pop	{r7, pc}
 501              		.cfi_endproc
 502              	.LFE6:
 504              		.align	1
 505              		.global	set_object_speed_y
 506              		.syntax unified
 507              		.code	16
 508              		.thumb_func
 509              		.fpu softvfp
 511              	set_object_speed_y:
 512              	.LFB7:
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** void set_object_speed_y(PPONGBALL o, int speedy){
 513              		.loc 2 22 0
 514              		.cfi_startproc
 515              		@ args = 0, pretend = 0, frame = 8
 516              		@ frame_needed = 1, uses_anonymous_args = 0
 517 0228 80B5     		push	{r7, lr}
 518              		.cfi_def_cfa_offset 8
 519              		.cfi_offset 7, -8
 520              		.cfi_offset 14, -4
 521 022a 82B0     		sub	sp, sp, #8
 522              		.cfi_def_cfa_offset 16
 523 022c 00AF     		add	r7, sp, #0
 524              		.cfi_def_cfa_register 7
 525 022e 7860     		str	r0, [r7, #4]
 526 0230 3960     		str	r1, [r7]
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	o->diry = speedy;
 527              		.loc 2 23 0
 528 0232 7B68     		ldr	r3, [r7, #4]
 529 0234 3A68     		ldr	r2, [r7]
 530 0236 9A60     		str	r2, [r3, #8]
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }
 531              		.loc 2 24 0
 532 0238 C046     		nop
 533 023a BD46     		mov	sp, r7
 534 023c 02B0     		add	sp, sp, #8
 535              		@ sp needed
 536 023e 80BD     		pop	{r7, pc}
 537              		.cfi_endproc
 538              	.LFE7:
 540              		.align	1
 541              		.global	draw_object
 542              		.syntax unified
 543              		.code	16
 544              		.thumb_func
 545              		.fpu softvfp
 547              	draw_object:
 548              	.LFB8:
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** void draw_object(PPONGBALL o) {
 549              		.loc 2 26 0
 550              		.cfi_startproc
 551              		@ args = 0, pretend = 0, frame = 16
 552              		@ frame_needed = 1, uses_anonymous_args = 0
 553 0240 80B5     		push	{r7, lr}
 554              		.cfi_def_cfa_offset 8
 555              		.cfi_offset 7, -8
 556              		.cfi_offset 14, -4
 557 0242 84B0     		sub	sp, sp, #16
 558              		.cfi_def_cfa_offset 24
 559 0244 00AF     		add	r7, sp, #0
 560              		.cfi_def_cfa_register 7
 561 0246 7860     		str	r0, [r7, #4]
 562              	.LBB4:
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 563              		.loc 2 27 0
 564 0248 0023     		movs	r3, #0
 565 024a FB60     		str	r3, [r7, #12]
 566 024c 1EE0     		b	.L24
 567              	.L25:
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****         pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 1);
 568              		.loc 2 28 0 discriminator 3
 569 024e 7B68     		ldr	r3, [r7, #4]
 570 0250 1A68     		ldr	r2, [r3]
 571 0252 FB68     		ldr	r3, [r7, #12]
 572 0254 0433     		adds	r3, r3, #4
 573 0256 5B00     		lsls	r3, r3, #1
 574 0258 D318     		adds	r3, r2, r3
 575 025a 0433     		adds	r3, r3, #4
 576 025c 1B78     		ldrb	r3, [r3]
 577 025e 1A00     		movs	r2, r3
 578 0260 7B68     		ldr	r3, [r7, #4]
 579 0262 DB68     		ldr	r3, [r3, #12]
 580 0264 D018     		adds	r0, r2, r3
 581 0266 7B68     		ldr	r3, [r7, #4]
 582 0268 1A68     		ldr	r2, [r3]
 583 026a FB68     		ldr	r3, [r7, #12]
 584 026c 0433     		adds	r3, r3, #4
 585 026e 5B00     		lsls	r3, r3, #1
 586 0270 D318     		adds	r3, r2, r3
 587 0272 0533     		adds	r3, r3, #5
 588 0274 1B78     		ldrb	r3, [r3]
 589 0276 1A00     		movs	r2, r3
 590 0278 7B68     		ldr	r3, [r7, #4]
 591 027a 1B69     		ldr	r3, [r3, #16]
 592 027c D318     		adds	r3, r2, r3
 593 027e 0122     		movs	r2, #1
 594 0280 1900     		movs	r1, r3
 595 0282 FFF7FEFF 		bl	pixel
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 596              		.loc 2 27 0 discriminator 3
 597 0286 FB68     		ldr	r3, [r7, #12]
 598 0288 0133     		adds	r3, r3, #1
 599 028a FB60     		str	r3, [r7, #12]
 600              	.L24:
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 601              		.loc 2 27 0 is_stmt 0 discriminator 1
 602 028c 7B68     		ldr	r3, [r7, #4]
 603 028e 1B68     		ldr	r3, [r3]
 604 0290 1A68     		ldr	r2, [r3]
 605 0292 FB68     		ldr	r3, [r7, #12]
 606 0294 9A42     		cmp	r2, r3
 607 0296 DADC     		bgt	.L25
 608              	.LBE4:
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     }
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }
 609              		.loc 2 30 0 is_stmt 1
 610 0298 C046     		nop
 611 029a BD46     		mov	sp, r7
 612 029c 04B0     		add	sp, sp, #16
 613              		@ sp needed
 614 029e 80BD     		pop	{r7, pc}
 615              		.cfi_endproc
 616              	.LFE8:
 618              		.align	1
 619              		.global	clear_object
 620              		.syntax unified
 621              		.code	16
 622              		.thumb_func
 623              		.fpu softvfp
 625              	clear_object:
 626              	.LFB9:
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** void clear_object(PPONGBALL o) {
 627              		.loc 2 32 0
 628              		.cfi_startproc
 629              		@ args = 0, pretend = 0, frame = 16
 630              		@ frame_needed = 1, uses_anonymous_args = 0
 631 02a0 80B5     		push	{r7, lr}
 632              		.cfi_def_cfa_offset 8
 633              		.cfi_offset 7, -8
 634              		.cfi_offset 14, -4
 635 02a2 84B0     		sub	sp, sp, #16
 636              		.cfi_def_cfa_offset 24
 637 02a4 00AF     		add	r7, sp, #0
 638              		.cfi_def_cfa_register 7
 639 02a6 7860     		str	r0, [r7, #4]
 640              	.LBB5:
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 641              		.loc 2 33 0
 642 02a8 0023     		movs	r3, #0
 643 02aa FB60     		str	r3, [r7, #12]
 644 02ac 1EE0     		b	.L27
 645              	.L28:
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****         pixel((o->geo->px[i].x) + o->posx, (o->geo->px[i].y) + o->posy, 0);
 646              		.loc 2 34 0 discriminator 3
 647 02ae 7B68     		ldr	r3, [r7, #4]
 648 02b0 1A68     		ldr	r2, [r3]
 649 02b2 FB68     		ldr	r3, [r7, #12]
 650 02b4 0433     		adds	r3, r3, #4
 651 02b6 5B00     		lsls	r3, r3, #1
 652 02b8 D318     		adds	r3, r2, r3
 653 02ba 0433     		adds	r3, r3, #4
 654 02bc 1B78     		ldrb	r3, [r3]
 655 02be 1A00     		movs	r2, r3
 656 02c0 7B68     		ldr	r3, [r7, #4]
 657 02c2 DB68     		ldr	r3, [r3, #12]
 658 02c4 D018     		adds	r0, r2, r3
 659 02c6 7B68     		ldr	r3, [r7, #4]
 660 02c8 1A68     		ldr	r2, [r3]
 661 02ca FB68     		ldr	r3, [r7, #12]
 662 02cc 0433     		adds	r3, r3, #4
 663 02ce 5B00     		lsls	r3, r3, #1
 664 02d0 D318     		adds	r3, r2, r3
 665 02d2 0533     		adds	r3, r3, #5
 666 02d4 1B78     		ldrb	r3, [r3]
 667 02d6 1A00     		movs	r2, r3
 668 02d8 7B68     		ldr	r3, [r7, #4]
 669 02da 1B69     		ldr	r3, [r3, #16]
 670 02dc D318     		adds	r3, r2, r3
 671 02de 0022     		movs	r2, #0
 672 02e0 1900     		movs	r1, r3
 673 02e2 FFF7FEFF 		bl	pixel
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 674              		.loc 2 33 0 discriminator 3
 675 02e6 FB68     		ldr	r3, [r7, #12]
 676 02e8 0133     		adds	r3, r3, #1
 677 02ea FB60     		str	r3, [r7, #12]
 678              	.L27:
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     for (int i = 0; i < o->geo->numpoints; i++) {
 679              		.loc 2 33 0 is_stmt 0 discriminator 1
 680 02ec 7B68     		ldr	r3, [r7, #4]
 681 02ee 1B68     		ldr	r3, [r3]
 682 02f0 1A68     		ldr	r2, [r3]
 683 02f2 FB68     		ldr	r3, [r7, #12]
 684 02f4 9A42     		cmp	r2, r3
 685 02f6 DADC     		bgt	.L28
 686              	.LBE5:
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     }
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }
 687              		.loc 2 36 0 is_stmt 1
 688 02f8 C046     		nop
 689 02fa BD46     		mov	sp, r7
 690 02fc 04B0     		add	sp, sp, #16
 691              		@ sp needed
 692 02fe 80BD     		pop	{r7, pc}
 693              		.cfi_endproc
 694              	.LFE9:
 696              		.align	1
 697              		.global	move_object
 698              		.syntax unified
 699              		.code	16
 700              		.thumb_func
 701              		.fpu softvfp
 703              	move_object:
 704              	.LFB10:
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** void move_object(PPONGBALL o, PRACKET leftR, PRACKET rightR) 
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** {
 705              		.loc 2 39 0
 706              		.cfi_startproc
 707              		@ args = 0, pretend = 0, frame = 16
 708              		@ frame_needed = 1, uses_anonymous_args = 0
 709 0300 80B5     		push	{r7, lr}
 710              		.cfi_def_cfa_offset 8
 711              		.cfi_offset 7, -8
 712              		.cfi_offset 14, -4
 713 0302 84B0     		sub	sp, sp, #16
 714              		.cfi_def_cfa_offset 24
 715 0304 00AF     		add	r7, sp, #0
 716              		.cfi_def_cfa_register 7
 717 0306 F860     		str	r0, [r7, #12]
 718 0308 B960     		str	r1, [r7, #8]
 719 030a 7A60     		str	r2, [r7, #4]
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     clear_object(o);
 720              		.loc 2 40 0
 721 030c FB68     		ldr	r3, [r7, #12]
 722 030e 1800     		movs	r0, r3
 723 0310 FFF7FEFF 		bl	clear_object
 724              	.LBB6:
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	if ((collide(leftR, o) == 1) || (collide(rightR, o) == 1)){
 725              		.loc 2 43 0
 726 0314 FA68     		ldr	r2, [r7, #12]
 727 0316 BB68     		ldr	r3, [r7, #8]
 728 0318 1100     		movs	r1, r2
 729 031a 1800     		movs	r0, r3
 730 031c FFF7FEFF 		bl	collide
 731 0320 0300     		movs	r3, r0
 732 0322 012B     		cmp	r3, #1
 733 0324 08D0     		beq	.L30
 734              		.loc 2 43 0 is_stmt 0 discriminator 1
 735 0326 FA68     		ldr	r2, [r7, #12]
 736 0328 7B68     		ldr	r3, [r7, #4]
 737 032a 1100     		movs	r1, r2
 738 032c 1800     		movs	r0, r3
 739 032e FFF7FEFF 		bl	collide
 740 0332 0300     		movs	r3, r0
 741 0334 012B     		cmp	r3, #1
 742 0336 04D1     		bne	.L31
 743              	.L30:
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		o->dirx = o->dirx * -1;
 744              		.loc 2 44 0 is_stmt 1
 745 0338 FB68     		ldr	r3, [r7, #12]
 746 033a 5B68     		ldr	r3, [r3, #4]
 747 033c 5A42     		rsbs	r2, r3, #0
 748 033e FB68     		ldr	r3, [r7, #12]
 749 0340 5A60     		str	r2, [r3, #4]
 750              	.L31:
 751              	.LBE6:
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	}
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	//collide with rackets
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	/*
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	unsigned int new_x = o->posx + o->dirx;
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	unsigned int new_y = o->posy + o->diry;
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	 * if (leftR->pos_x_inbounds(leftR, new_x) == 1){
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		if ((leftR->pos_y_inbounds(leftR, new_y) == 1) || (leftR->pos_y_inbounds(leftR, new_y + o->geo->s
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			o->dirx = o->dirx * -1;
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		}
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	}
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	if (rightR->pos_x_inbounds(rightR, new_x - o->geo->sizex) == 1){
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		if ((rightR->pos_y_inbounds(rightR, new_y) == 1) || (rightR->pos_y_inbounds(rightR, new_y + o->ge
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			o->dirx = o->dirx * -1;
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		}
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	}*/
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	o->posx += o->dirx;
 752              		.loc 2 64 0
 753 0342 FB68     		ldr	r3, [r7, #12]
 754 0344 DA68     		ldr	r2, [r3, #12]
 755 0346 FB68     		ldr	r3, [r7, #12]
 756 0348 5B68     		ldr	r3, [r3, #4]
 757 034a D218     		adds	r2, r2, r3
 758 034c FB68     		ldr	r3, [r7, #12]
 759 034e DA60     		str	r2, [r3, #12]
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     o->posy += o->diry;
 760              		.loc 2 65 0
 761 0350 FB68     		ldr	r3, [r7, #12]
 762 0352 1A69     		ldr	r2, [r3, #16]
 763 0354 FB68     		ldr	r3, [r7, #12]
 764 0356 9B68     		ldr	r3, [r3, #8]
 765 0358 D218     		adds	r2, r2, r3
 766 035a FB68     		ldr	r3, [r7, #12]
 767 035c 1A61     		str	r2, [r3, #16]
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     if (o->posy < 1) {
 768              		.loc 2 67 0
 769 035e FB68     		ldr	r3, [r7, #12]
 770 0360 1B69     		ldr	r3, [r3, #16]
 771 0362 002B     		cmp	r3, #0
 772 0364 05DC     		bgt	.L32
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****         o->diry = o->diry * -1;
 773              		.loc 2 68 0
 774 0366 FB68     		ldr	r3, [r7, #12]
 775 0368 9B68     		ldr	r3, [r3, #8]
 776 036a 5A42     		rsbs	r2, r3, #0
 777 036c FB68     		ldr	r3, [r7, #12]
 778 036e 9A60     		str	r2, [r3, #8]
 779 0370 0CE0     		b	.L33
 780              	.L32:
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     } else if (o->posy + o->geo->sizey > 64) {
 781              		.loc 2 69 0
 782 0372 FB68     		ldr	r3, [r7, #12]
 783 0374 1A69     		ldr	r2, [r3, #16]
 784 0376 FB68     		ldr	r3, [r7, #12]
 785 0378 1B68     		ldr	r3, [r3]
 786 037a 9B68     		ldr	r3, [r3, #8]
 787 037c D318     		adds	r3, r2, r3
 788 037e 402B     		cmp	r3, #64
 789 0380 04DD     		ble	.L33
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****         o->diry = o->diry * -1;
 790              		.loc 2 70 0
 791 0382 FB68     		ldr	r3, [r7, #12]
 792 0384 9B68     		ldr	r3, [r3, #8]
 793 0386 5A42     		rsbs	r2, r3, #0
 794 0388 FB68     		ldr	r3, [r7, #12]
 795 038a 9A60     		str	r2, [r3, #8]
 796              	.L33:
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     }
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h ****     draw_object(o);
 797              		.loc 2 73 0
 798 038c FB68     		ldr	r3, [r7, #12]
 799 038e 1800     		movs	r0, r3
 800 0390 FFF7FEFF 		bl	draw_object
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }
 801              		.loc 2 74 0
 802 0394 C046     		nop
 803 0396 BD46     		mov	sp, r7
 804 0398 04B0     		add	sp, sp, #16
 805              		@ sp needed
 806 039a 80BD     		pop	{r7, pc}
 807              		.cfi_endproc
 808              	.LFE10:
 810              		.align	1
 811              		.global	pos_x_pongball_inbounds
 812              		.syntax unified
 813              		.code	16
 814              		.thumb_func
 815              		.fpu softvfp
 817              	pos_x_pongball_inbounds:
 818              	.LFB11:
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** int pos_x_pongball_inbounds(PPONGBALL o, int positionx){
 819              		.loc 2 76 0
 820              		.cfi_startproc
 821              		@ args = 0, pretend = 0, frame = 16
 822              		@ frame_needed = 1, uses_anonymous_args = 0
 823 039c 80B5     		push	{r7, lr}
 824              		.cfi_def_cfa_offset 8
 825              		.cfi_offset 7, -8
 826              		.cfi_offset 14, -4
 827 039e 84B0     		sub	sp, sp, #16
 828              		.cfi_def_cfa_offset 24
 829 03a0 00AF     		add	r7, sp, #0
 830              		.cfi_def_cfa_register 7
 831 03a2 7860     		str	r0, [r7, #4]
 832 03a4 3960     		str	r1, [r7]
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	int tmp = o->posx - positionx;
 833              		.loc 2 77 0
 834 03a6 7B68     		ldr	r3, [r7, #4]
 835 03a8 DA68     		ldr	r2, [r3, #12]
 836 03aa 3B68     		ldr	r3, [r7]
 837 03ac D31A     		subs	r3, r2, r3
 838 03ae FB60     		str	r3, [r7, #12]
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	if ((tmp > o->geo->sizex) || (tmp < 0)) return 0;
 839              		.loc 2 78 0
 840 03b0 7B68     		ldr	r3, [r7, #4]
 841 03b2 1B68     		ldr	r3, [r3]
 842 03b4 5A68     		ldr	r2, [r3, #4]
 843 03b6 FB68     		ldr	r3, [r7, #12]
 844 03b8 9A42     		cmp	r2, r3
 845 03ba 02DB     		blt	.L35
 846              		.loc 2 78 0 is_stmt 0 discriminator 2
 847 03bc FB68     		ldr	r3, [r7, #12]
 848 03be 002B     		cmp	r3, #0
 849 03c0 01DA     		bge	.L36
 850              	.L35:
 851              		.loc 2 78 0 discriminator 3
 852 03c2 0023     		movs	r3, #0
 853 03c4 00E0     		b	.L37
 854              	.L36:
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	else return 1;
 855              		.loc 2 79 0 is_stmt 1
 856 03c6 0123     		movs	r3, #1
 857              	.L37:
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }
 858              		.loc 2 80 0
 859 03c8 1800     		movs	r0, r3
 860 03ca BD46     		mov	sp, r7
 861 03cc 04B0     		add	sp, sp, #16
 862              		@ sp needed
 863 03ce 80BD     		pop	{r7, pc}
 864              		.cfi_endproc
 865              	.LFE11:
 867              		.align	1
 868              		.global	pos_y_pongball_inbounds
 869              		.syntax unified
 870              		.code	16
 871              		.thumb_func
 872              		.fpu softvfp
 874              	pos_y_pongball_inbounds:
 875              	.LFB12:
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** int pos_y_pongball_inbounds(PPONGBALL o, int positiony){
 876              		.loc 2 82 0
 877              		.cfi_startproc
 878              		@ args = 0, pretend = 0, frame = 16
 879              		@ frame_needed = 1, uses_anonymous_args = 0
 880 03d0 80B5     		push	{r7, lr}
 881              		.cfi_def_cfa_offset 8
 882              		.cfi_offset 7, -8
 883              		.cfi_offset 14, -4
 884 03d2 84B0     		sub	sp, sp, #16
 885              		.cfi_def_cfa_offset 24
 886 03d4 00AF     		add	r7, sp, #0
 887              		.cfi_def_cfa_register 7
 888 03d6 7860     		str	r0, [r7, #4]
 889 03d8 3960     		str	r1, [r7]
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	int tmp = o->posy - positiony;
 890              		.loc 2 83 0
 891 03da 7B68     		ldr	r3, [r7, #4]
 892 03dc 1A69     		ldr	r2, [r3, #16]
 893 03de 3B68     		ldr	r3, [r7]
 894 03e0 D31A     		subs	r3, r2, r3
 895 03e2 FB60     		str	r3, [r7, #12]
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	if ((tmp > o->geo->sizey) || (tmp < 0)) return 0;
 896              		.loc 2 84 0
 897 03e4 7B68     		ldr	r3, [r7, #4]
 898 03e6 1B68     		ldr	r3, [r3]
 899 03e8 9A68     		ldr	r2, [r3, #8]
 900 03ea FB68     		ldr	r3, [r7, #12]
 901 03ec 9A42     		cmp	r2, r3
 902 03ee 02DB     		blt	.L39
 903              		.loc 2 84 0 is_stmt 0 discriminator 2
 904 03f0 FB68     		ldr	r3, [r7, #12]
 905 03f2 002B     		cmp	r3, #0
 906 03f4 01DA     		bge	.L40
 907              	.L39:
 908              		.loc 2 84 0 discriminator 3
 909 03f6 0023     		movs	r3, #0
 910 03f8 00E0     		b	.L41
 911              	.L40:
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	else return 1;
 912              		.loc 2 85 0 is_stmt 1
 913 03fa 0123     		movs	r3, #1
 914              	.L41:
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }
 915              		.loc 2 86 0
 916 03fc 1800     		movs	r0, r3
 917 03fe BD46     		mov	sp, r7
 918 0400 04B0     		add	sp, sp, #16
 919              		@ sp needed
 920 0402 80BD     		pop	{r7, pc}
 921              		.cfi_endproc
 922              	.LFE12:
 924              		.align	1
 925              		.global	collide
 926              		.syntax unified
 927              		.code	16
 928              		.thumb_func
 929              		.fpu softvfp
 931              	collide:
 932              	.LFB13:
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** int collide(PRACKET o, PPONGBALL p){
 933              		.loc 2 89 0
 934              		.cfi_startproc
 935              		@ args = 0, pretend = 0, frame = 32
 936              		@ frame_needed = 1, uses_anonymous_args = 0
 937 0404 80B5     		push	{r7, lr}
 938              		.cfi_def_cfa_offset 8
 939              		.cfi_offset 7, -8
 940              		.cfi_offset 14, -4
 941 0406 88B0     		sub	sp, sp, #32
 942              		.cfi_def_cfa_offset 40
 943 0408 00AF     		add	r7, sp, #0
 944              		.cfi_def_cfa_register 7
 945 040a 7860     		str	r0, [r7, #4]
 946 040c 3960     		str	r1, [r7]
 947              	.LBB7:
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	for (int i = 0; i < o->geo->numpoints; i++){
 948              		.loc 2 90 0
 949 040e 0023     		movs	r3, #0
 950 0410 FB61     		str	r3, [r7, #28]
 951 0412 4CE0     		b	.L43
 952              	.L48:
 953              	.LBB8:
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		for (int j = 0; j < p->geo->numpoints; j++){
 954              		.loc 2 91 0
 955 0414 0023     		movs	r3, #0
 956 0416 BB61     		str	r3, [r7, #24]
 957 0418 40E0     		b	.L44
 958              	.L47:
 959              	.LBB9:
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			int o_x = o->geo->px[i].x + o->posx;
 960              		.loc 2 92 0
 961 041a 7B68     		ldr	r3, [r7, #4]
 962 041c 1A68     		ldr	r2, [r3]
 963 041e FB69     		ldr	r3, [r7, #28]
 964 0420 0433     		adds	r3, r3, #4
 965 0422 5B00     		lsls	r3, r3, #1
 966 0424 D318     		adds	r3, r2, r3
 967 0426 0433     		adds	r3, r3, #4
 968 0428 1B78     		ldrb	r3, [r3]
 969 042a 1A00     		movs	r2, r3
 970 042c 7B68     		ldr	r3, [r7, #4]
 971 042e DB68     		ldr	r3, [r3, #12]
 972 0430 D318     		adds	r3, r2, r3
 973 0432 7B61     		str	r3, [r7, #20]
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			int o_y = o->geo->px[i].y + o->posy;
 974              		.loc 2 93 0
 975 0434 7B68     		ldr	r3, [r7, #4]
 976 0436 1A68     		ldr	r2, [r3]
 977 0438 FB69     		ldr	r3, [r7, #28]
 978 043a 0433     		adds	r3, r3, #4
 979 043c 5B00     		lsls	r3, r3, #1
 980 043e D318     		adds	r3, r2, r3
 981 0440 0533     		adds	r3, r3, #5
 982 0442 1B78     		ldrb	r3, [r3]
 983 0444 1A00     		movs	r2, r3
 984 0446 7B68     		ldr	r3, [r7, #4]
 985 0448 1B69     		ldr	r3, [r3, #16]
 986 044a D318     		adds	r3, r2, r3
 987 044c 3B61     		str	r3, [r7, #16]
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			int p_x = p->geo->px[j].x + p->posx;
 988              		.loc 2 95 0
 989 044e 3B68     		ldr	r3, [r7]
 990 0450 1A68     		ldr	r2, [r3]
 991 0452 BB69     		ldr	r3, [r7, #24]
 992 0454 0433     		adds	r3, r3, #4
 993 0456 5B00     		lsls	r3, r3, #1
 994 0458 D318     		adds	r3, r2, r3
 995 045a 0433     		adds	r3, r3, #4
 996 045c 1B78     		ldrb	r3, [r3]
 997 045e 1A00     		movs	r2, r3
 998 0460 3B68     		ldr	r3, [r7]
 999 0462 DB68     		ldr	r3, [r3, #12]
 1000 0464 D318     		adds	r3, r2, r3
 1001 0466 FB60     		str	r3, [r7, #12]
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			int p_y = p->geo->px[j].y + p->posy;
 1002              		.loc 2 96 0
 1003 0468 3B68     		ldr	r3, [r7]
 1004 046a 1A68     		ldr	r2, [r3]
 1005 046c BB69     		ldr	r3, [r7, #24]
 1006 046e 0433     		adds	r3, r3, #4
 1007 0470 5B00     		lsls	r3, r3, #1
 1008 0472 D318     		adds	r3, r2, r3
 1009 0474 0533     		adds	r3, r3, #5
 1010 0476 1B78     		ldrb	r3, [r3]
 1011 0478 1A00     		movs	r2, r3
 1012 047a 3B68     		ldr	r3, [r7]
 1013 047c 1B69     		ldr	r3, [r3, #16]
 1014 047e D318     		adds	r3, r2, r3
 1015 0480 BB60     		str	r3, [r7, #8]
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			if ((o_x == p_x) && (o_y == p_y)) return 1;
 1016              		.loc 2 98 0
 1017 0482 7A69     		ldr	r2, [r7, #20]
 1018 0484 FB68     		ldr	r3, [r7, #12]
 1019 0486 9A42     		cmp	r2, r3
 1020 0488 05D1     		bne	.L45
 1021              		.loc 2 98 0 is_stmt 0 discriminator 1
 1022 048a 3A69     		ldr	r2, [r7, #16]
 1023 048c BB68     		ldr	r3, [r7, #8]
 1024 048e 9A42     		cmp	r2, r3
 1025 0490 01D1     		bne	.L45
 1026              		.loc 2 98 0 discriminator 2
 1027 0492 0123     		movs	r3, #1
 1028 0494 12E0     		b	.L46
 1029              	.L45:
 1030              	.LBE9:
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			int o_x = o->geo->px[i].x + o->posx;
 1031              		.loc 2 91 0 is_stmt 1 discriminator 2
 1032 0496 BB69     		ldr	r3, [r7, #24]
 1033 0498 0133     		adds	r3, r3, #1
 1034 049a BB61     		str	r3, [r7, #24]
 1035              	.L44:
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 			int o_x = o->geo->px[i].x + o->posx;
 1036              		.loc 2 91 0 is_stmt 0 discriminator 1
 1037 049c 3B68     		ldr	r3, [r7]
 1038 049e 1B68     		ldr	r3, [r3]
 1039 04a0 1A68     		ldr	r2, [r3]
 1040 04a2 BB69     		ldr	r3, [r7, #24]
 1041 04a4 9A42     		cmp	r2, r3
 1042 04a6 B8DC     		bgt	.L47
 1043              	.LBE8:
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		for (int j = 0; j < p->geo->numpoints; j++){
 1044              		.loc 2 90 0 is_stmt 1 discriminator 2
 1045 04a8 FB69     		ldr	r3, [r7, #28]
 1046 04aa 0133     		adds	r3, r3, #1
 1047 04ac FB61     		str	r3, [r7, #28]
 1048              	.L43:
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		for (int j = 0; j < p->geo->numpoints; j++){
 1049              		.loc 2 90 0 is_stmt 0 discriminator 1
 1050 04ae 7B68     		ldr	r3, [r7, #4]
 1051 04b0 1B68     		ldr	r3, [r3]
 1052 04b2 1A68     		ldr	r2, [r3]
 1053 04b4 FB69     		ldr	r3, [r7, #28]
 1054 04b6 9A42     		cmp	r2, r3
 1055 04b8 ACDC     		bgt	.L48
 1056              	.LBE7:
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 		}
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	}
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** 	return 0;
 1057              		.loc 2 102 0 is_stmt 1
 1058 04ba 0023     		movs	r3, #0
 1059              	.L46:
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\pongball.h **** }...
 1060              		.loc 2 103 0
 1061 04bc 1800     		movs	r0, r3
 1062 04be BD46     		mov	sp, r7
 1063 04c0 08B0     		add	sp, sp, #32
 1064              		@ sp needed
 1065 04c2 80BD     		pop	{r7, pc}
 1066              		.cfi_endproc
 1067              	.LFE13:
 1069              		.global	p1_score
 1070              		.bss
 1073              	p1_score:
 1074 0000 00       		.space	1
 1075              		.global	p2_score
 1078              	p2_score:
 1079 0001 00       		.space	1
 1080              		.global	offset
 1081              		.data
 1084              	offset:
 1085 0000 30       		.byte	48
 1086              		.section	.start_section,"ax",%progbits
 1087              		.align	1
 1088              		.global	startup
 1089              		.syntax unified
 1090              		.code	16
 1091              		.thumb_func
 1092              		.fpu softvfp
 1094              	startup:
 1095              	.LFB14:
 1096              		.file 3 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #include "geometry.h"
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //#include "object.h"
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //#include "racket.h"
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #include "pongball.h"
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     B_E                 0x40    /* Enable */ 
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     B_RST               0x20    /* Reset  */ 
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     B_CS2               0x10    /* Controller Select 2 */ 
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     B_CS1               8          /* Controller Select 1 */ 
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     B_SELECT            4          /* ASCII or Graphics select */ 
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     B_RW                2          /* Read/Write */ 
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     B_DI                1          /* Data or Instruction : 1 data, 0 Instr */
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     LCD_ON              0x3F       /* Display på */       
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     LCD_OFF             0x3E       /* Av */ 
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     LCD_SET_ADD         0x40       /* Set X adress  (0 –63) */ 
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     LCD_SET_PAGE        0xB8      /* Set Y adress (0 –7) */ 
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     LCD_DISP_START      0xC0      /* Start adress i display minne */ 
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     LCD_BUSY            0x80      /* läsa ut busystatus. R/W skall vara hög */
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****  
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     PORT_DISPLAY_BASE   0x40021000/* MD407 port E */ 
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portModer           ((volatile unsigned int*)(PORT_DISPLAY_BASE))  
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portOtyper          ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x4))  
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portOspeedr         ((volatile unsigned int*)(PORT_DISPLAY_BASE+0x8))  
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portPupdr           ((volatile unsigned int*)(PORT_DISPLAY_BASE+0xC))  
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portIdr             ((volatile unsigned short *) (PORT_DISPLAY_BASE+0x10))  
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portIdrHigh         ((volatile unsigned char *)  (PORT_DISPLAY_BASE+0x11))  
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portOdrLow          ((volatile unsigned char *)(PORT_DISPLAY_BASE+0x14))  
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define     portOdrHigh         ((volatile unsigned char *)(PORT_DISPLAY_BASE+0x14+1)) 
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define		STK_CTRL            ((volatile unsigned int*) (0xE000E010))
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define		STK_LOAD            ((volatile unsigned int*) (0xE000E014))
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define		STK_VAL             ((volatile unsigned int*) (0xE000E018))
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //for keypad
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define GPIO_D_MODER    0x40020C00
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define GPIO_D_OTYPER   0x40020C04
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define GPIO_D_PUPDR    0x40020C0C
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define GPIO_D_INPUT    0x40020C10
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** #define GPIO_D_OUTPUT   0x40020C14
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //#define SIMULATOR
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** char p1_score = 0;
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** char p2_score = 0;
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** char offset = 48;
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void startup ( void )
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 1097              		.loc 3 53 0
 1098              		.cfi_startproc
 1099              		@ Naked Function: prologue and epilogue provided by programmer.
 1100              		@ args = 0, pretend = 0, frame = 0
 1101              		@ frame_needed = 1, uses_anonymous_args = 0
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** __asm volatile(
 1102              		.loc 3 54 0
 1103              		.syntax divided
 1104              	@ 54 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working/startup.c" 1
 1105 0000 0248     		 LDR R0,=0x2001C000
 1106 0002 8546     	 MOV SP,R0
 1107 0004 FFF7FEFF 	 BL main
 1108 0008 FEE7     	.L1: B .L1
 1109              	
 1110              	@ 0 "" 2
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	" MOV SP,R0\n"
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	" BL main\n"				/* call main */
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	".L1: B .L1\n"				/* never return */
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	) ;
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1111              		.loc 3 60 0
 1112              		.thumb
 1113              		.syntax unified
 1114 000a C046     		nop
 1115              		.cfi_endproc
 1116              	.LFE14:
 1118              		.text
 1119              		.align	1
 1120              		.global	init_app
 1121              		.syntax unified
 1122              		.code	16
 1123              		.thumb_func
 1124              		.fpu softvfp
 1126              	init_app:
 1127              	.LFB15:
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void init_app(void) 
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 1128              		.loc 3 62 0
 1129              		.cfi_startproc
 1130              		@ args = 0, pretend = 0, frame = 0
 1131              		@ frame_needed = 1, uses_anonymous_args = 0
 1132 04c4 80B5     		push	{r7, lr}
 1133              		.cfi_def_cfa_offset 8
 1134              		.cfi_offset 7, -8
 1135              		.cfi_offset 14, -4
 1136 04c6 00AF     		add	r7, sp, #0
 1137              		.cfi_def_cfa_register 7
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	*( (unsigned long *) 0x40023830) = 0x18;
 1138              		.loc 3 63 0
 1139 04c8 0E4B     		ldr	r3, .L51
 1140 04ca 1822     		movs	r2, #24
 1141 04cc 1A60     		str	r2, [r3]
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     /* PORT E */ 
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portModer =     0x55555555;  /* all bits outputs */ 
 1142              		.loc 3 66 0
 1143 04ce 0E4B     		ldr	r3, .L51+4
 1144 04d0 0E4A     		ldr	r2, .L51+8
 1145 04d2 1A60     		str	r2, [r3]
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOtyper =    0x00000000;/* outputs arepush/pull*/ 
 1146              		.loc 3 67 0
 1147 04d4 0E4B     		ldr	r3, .L51+12
 1148 04d6 0022     		movs	r2, #0
 1149 04d8 1A80     		strh	r2, [r3]
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOspeedr =   0x55555555;/* medium speed */ 
 1150              		.loc 3 68 0
 1151 04da 0E4B     		ldr	r3, .L51+16
 1152 04dc 0B4A     		ldr	r2, .L51+8
 1153 04de 1A60     		str	r2, [r3]
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portPupdr =     0x55550000;/* inputs arepullup*/
 1154              		.loc 3 69 0
 1155 04e0 0D4B     		ldr	r3, .L51+20
 1156 04e2 0E4A     		ldr	r2, .L51+24
 1157 04e4 1A60     		str	r2, [r3]
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     // port 15-8 -> Keypad
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *( (unsigned long *) GPIO_D_MODER) = 0x55000000;
 1158              		.loc 3 72 0
 1159 04e6 0E4B     		ldr	r3, .L51+28
 1160 04e8 AA22     		movs	r2, #170
 1161 04ea D205     		lsls	r2, r2, #23
 1162 04ec 1A60     		str	r2, [r3]
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //OTYPER bits 15-8 to push-pull
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *( (unsigned short *) GPIO_D_OTYPER) = 0x0000; //00000000
 1163              		.loc 3 75 0
 1164 04ee 0D4B     		ldr	r3, .L51+32
 1165 04f0 0022     		movs	r2, #0
 1166 04f2 1A80     		strh	r2, [r3]
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //PUPDR bits 23-16 to pull-down, rest to zero
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *( (unsigned long *) GPIO_D_PUPDR) = 0x00AA0000; //10101010 000000000 000000000
 1167              		.loc 3 78 0
 1168 04f4 0C4B     		ldr	r3, .L51+36
 1169 04f6 AA22     		movs	r2, #170
 1170 04f8 1204     		lsls	r2, r2, #16
 1171 04fa 1A60     		str	r2, [r3]
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1172              		.loc 3 79 0
 1173 04fc C046     		nop
 1174 04fe BD46     		mov	sp, r7
 1175              		@ sp needed
 1176 0500 80BD     		pop	{r7, pc}
 1177              	.L52:
 1178 0502 C046     		.align	2
 1179              	.L51:
 1180 0504 30380240 		.word	1073887280
 1181 0508 00100240 		.word	1073876992
 1182 050c 55555555 		.word	1431655765
 1183 0510 04100240 		.word	1073876996
 1184 0514 08100240 		.word	1073877000
 1185 0518 0C100240 		.word	1073877004
 1186 051c 00005555 		.word	1431633920
 1187 0520 000C0240 		.word	1073875968
 1188 0524 040C0240 		.word	1073875972
 1189 0528 0C0C0240 		.word	1073875980
 1190              		.cfi_endproc
 1191              	.LFE15:
 1193              		.align	1
 1194              		.global	delay250ns
 1195              		.syntax unified
 1196              		.code	16
 1197              		.thumb_func
 1198              		.fpu softvfp
 1200              	delay250ns:
 1201              	.LFB16:
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void delay250ns(void)
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 1202              		.loc 3 82 0
 1203              		.cfi_startproc
 1204              		@ args = 0, pretend = 0, frame = 0
 1205              		@ frame_needed = 1, uses_anonymous_args = 0
 1206 052c 80B5     		push	{r7, lr}
 1207              		.cfi_def_cfa_offset 8
 1208              		.cfi_offset 7, -8
 1209              		.cfi_offset 14, -4
 1210 052e 00AF     		add	r7, sp, #0
 1211              		.cfi_def_cfa_register 7
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *STK_CTRL   = 0;
 1212              		.loc 3 83 0
 1213 0530 0C4B     		ldr	r3, .L55
 1214 0532 0022     		movs	r2, #0
 1215 0534 1A60     		str	r2, [r3]
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *STK_LOAD   = (168/4)-1;   // minst 500 ns
 1216              		.loc 3 84 0
 1217 0536 0C4B     		ldr	r3, .L55+4
 1218 0538 2922     		movs	r2, #41
 1219 053a 1A60     		str	r2, [r3]
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *STK_VAL    = 0;
 1220              		.loc 3 85 0
 1221 053c 0B4B     		ldr	r3, .L55+8
 1222 053e 0022     		movs	r2, #0
 1223 0540 1A60     		str	r2, [r3]
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *STK_CTRL   = 5;
 1224              		.loc 3 86 0
 1225 0542 084B     		ldr	r3, .L55
 1226 0544 0522     		movs	r2, #5
 1227 0546 1A60     		str	r2, [r3]
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     while((* STK_CTRL & 0x10000) == 0) ;
 1228              		.loc 3 87 0
 1229 0548 C046     		nop
 1230              	.L54:
 1231              		.loc 3 87 0 is_stmt 0 discriminator 1
 1232 054a 064B     		ldr	r3, .L55
 1233 054c 1A68     		ldr	r2, [r3]
 1234 054e 8023     		movs	r3, #128
 1235 0550 5B02     		lsls	r3, r3, #9
 1236 0552 1340     		ands	r3, r2
 1237 0554 F9D0     		beq	.L54
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *STK_CTRL   = 0;
 1238              		.loc 3 88 0 is_stmt 1
 1239 0556 034B     		ldr	r3, .L55
 1240 0558 0022     		movs	r2, #0
 1241 055a 1A60     		str	r2, [r3]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1242              		.loc 3 89 0
 1243 055c C046     		nop
 1244 055e BD46     		mov	sp, r7
 1245              		@ sp needed
 1246 0560 80BD     		pop	{r7, pc}
 1247              	.L56:
 1248 0562 C046     		.align	2
 1249              	.L55:
 1250 0564 10E000E0 		.word	-536813552
 1251 0568 14E000E0 		.word	-536813548
 1252 056c 18E000E0 		.word	-536813544
 1253              		.cfi_endproc
 1254              	.LFE16:
 1256              		.align	1
 1257              		.global	delay_500ns
 1258              		.syntax unified
 1259              		.code	16
 1260              		.thumb_func
 1261              		.fpu softvfp
 1263              	delay_500ns:
 1264              	.LFB17:
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void delay_500ns(void)
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 1265              		.loc 3 92 0
 1266              		.cfi_startproc
 1267              		@ args = 0, pretend = 0, frame = 0
 1268              		@ frame_needed = 1, uses_anonymous_args = 0
 1269 0570 80B5     		push	{r7, lr}
 1270              		.cfi_def_cfa_offset 8
 1271              		.cfi_offset 7, -8
 1272              		.cfi_offset 14, -4
 1273 0572 00AF     		add	r7, sp, #0
 1274              		.cfi_def_cfa_register 7
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay250ns();
 1275              		.loc 3 93 0
 1276 0574 FFF7FEFF 		bl	delay250ns
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay250ns();
 1277              		.loc 3 94 0
 1278 0578 FFF7FEFF 		bl	delay250ns
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1279              		.loc 3 95 0
 1280 057c C046     		nop
 1281 057e BD46     		mov	sp, r7
 1282              		@ sp needed
 1283 0580 80BD     		pop	{r7, pc}
 1284              		.cfi_endproc
 1285              	.LFE17:
 1287              		.align	1
 1288              		.global	delay_mikro
 1289              		.syntax unified
 1290              		.code	16
 1291              		.thumb_func
 1292              		.fpu softvfp
 1294              	delay_mikro:
 1295              	.LFB18:
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void delay_mikro(unsigned int us)
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 1296              		.loc 3 98 0
 1297              		.cfi_startproc
 1298              		@ args = 0, pretend = 0, frame = 8
 1299              		@ frame_needed = 1, uses_anonymous_args = 0
 1300 0582 80B5     		push	{r7, lr}
 1301              		.cfi_def_cfa_offset 8
 1302              		.cfi_offset 7, -8
 1303              		.cfi_offset 14, -4
 1304 0584 82B0     		sub	sp, sp, #8
 1305              		.cfi_def_cfa_offset 16
 1306 0586 00AF     		add	r7, sp, #0
 1307              		.cfi_def_cfa_register 7
 1308 0588 7860     		str	r0, [r7, #4]
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //#ifdef   SIMULATOR
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //us = us / 1000;
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //us++;
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //#endif
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     while(us < 0){
 1309              		.loc 3 103 0
 1310 058a C046     		nop
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             delay250ns();
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             delay250ns();
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             delay250ns();
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             delay250ns();
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             us--;
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         }
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1311              		.loc 3 112 0
 1312 058c C046     		nop
 1313 058e BD46     		mov	sp, r7
 1314 0590 02B0     		add	sp, sp, #8
 1315              		@ sp needed
 1316 0592 80BD     		pop	{r7, pc}
 1317              		.cfi_endproc
 1318              	.LFE18:
 1320              		.align	1
 1321              		.global	delay_milli
 1322              		.syntax unified
 1323              		.code	16
 1324              		.thumb_func
 1325              		.fpu softvfp
 1327              	delay_milli:
 1328              	.LFB19:
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void delay_milli(unsigned ms)
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 1329              		.loc 3 115 0
 1330              		.cfi_startproc
 1331              		@ args = 0, pretend = 0, frame = 8
 1332              		@ frame_needed = 1, uses_anonymous_args = 0
 1333 0594 80B5     		push	{r7, lr}
 1334              		.cfi_def_cfa_offset 8
 1335              		.cfi_offset 7, -8
 1336              		.cfi_offset 14, -4
 1337 0596 82B0     		sub	sp, sp, #8
 1338              		.cfi_def_cfa_offset 16
 1339 0598 00AF     		add	r7, sp, #0
 1340              		.cfi_def_cfa_register 7
 1341 059a 7860     		str	r0, [r7, #4]
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //#ifdef  SIMULATOR
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //ms = ms/1000;
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //ms++;
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** //#endif
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     while(ms > 0){
 1342              		.loc 3 120 0
 1343 059c 0AE0     		b	.L60
 1344              	.L61:
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             delay_mikro(1);
 1345              		.loc 3 122 0
 1346 059e 0120     		movs	r0, #1
 1347 05a0 FFF7FEFF 		bl	delay_mikro
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             delay_mikro(1000);
 1348              		.loc 3 123 0
 1349 05a4 FA23     		movs	r3, #250
 1350 05a6 9B00     		lsls	r3, r3, #2
 1351 05a8 1800     		movs	r0, r3
 1352 05aa FFF7FEFF 		bl	delay_mikro
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             ms--;
 1353              		.loc 3 124 0
 1354 05ae 7B68     		ldr	r3, [r7, #4]
 1355 05b0 013B     		subs	r3, r3, #1
 1356 05b2 7B60     		str	r3, [r7, #4]
 1357              	.L60:
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {
 1358              		.loc 3 120 0
 1359 05b4 7B68     		ldr	r3, [r7, #4]
 1360 05b6 002B     		cmp	r3, #0
 1361 05b8 F1D1     		bne	.L61
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         }
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1362              		.loc 3 128 0
 1363 05ba C046     		nop
 1364 05bc BD46     		mov	sp, r7
 1365 05be 02B0     		add	sp, sp, #8
 1366              		@ sp needed
 1367 05c0 80BD     		pop	{r7, pc}
 1368              		.cfi_endproc
 1369              	.LFE19:
 1371              		.align	1
 1372              		.syntax unified
 1373              		.code	16
 1374              		.thumb_func
 1375              		.fpu softvfp
 1377              	graphic_ctrl_bit_set:
 1378              	.LFB20:
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static void graphic_ctrl_bit_set( unsigned char x ) 
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1379              		.loc 3 132 0
 1380              		.cfi_startproc
 1381              		@ args = 0, pretend = 0, frame = 8
 1382              		@ frame_needed = 1, uses_anonymous_args = 0
 1383 05c2 80B5     		push	{r7, lr}
 1384              		.cfi_def_cfa_offset 8
 1385              		.cfi_offset 7, -8
 1386              		.cfi_offset 14, -4
 1387 05c4 82B0     		sub	sp, sp, #8
 1388              		.cfi_def_cfa_offset 16
 1389 05c6 00AF     		add	r7, sp, #0
 1390              		.cfi_def_cfa_register 7
 1391 05c8 0200     		movs	r2, r0
 1392 05ca FB1D     		adds	r3, r7, #7
 1393 05cc 1A70     		strb	r2, [r3]
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOdrLow |= ( ~B_SELECT & x );
 1394              		.loc 3 133 0
 1395 05ce 0949     		ldr	r1, .L63
 1396 05d0 084B     		ldr	r3, .L63
 1397 05d2 1B78     		ldrb	r3, [r3]
 1398 05d4 DBB2     		uxtb	r3, r3
 1399 05d6 5AB2     		sxtb	r2, r3
 1400 05d8 FB1D     		adds	r3, r7, #7
 1401 05da 1B78     		ldrb	r3, [r3]
 1402 05dc 5BB2     		sxtb	r3, r3
 1403 05de 0420     		movs	r0, #4
 1404 05e0 8343     		bics	r3, r0
 1405 05e2 5BB2     		sxtb	r3, r3
 1406 05e4 1343     		orrs	r3, r2
 1407 05e6 5BB2     		sxtb	r3, r3
 1408 05e8 DBB2     		uxtb	r3, r3
 1409 05ea 0B70     		strb	r3, [r1]
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****  } 
 1410              		.loc 3 134 0
 1411 05ec C046     		nop
 1412 05ee BD46     		mov	sp, r7
 1413 05f0 02B0     		add	sp, sp, #8
 1414              		@ sp needed
 1415 05f2 80BD     		pop	{r7, pc}
 1416              	.L64:
 1417              		.align	2
 1418              	.L63:
 1419 05f4 14100240 		.word	1073877012
 1420              		.cfi_endproc
 1421              	.LFE20:
 1423              		.align	1
 1424              		.syntax unified
 1425              		.code	16
 1426              		.thumb_func
 1427              		.fpu softvfp
 1429              	graphic_ctrl_bit_clear:
 1430              	.LFB21:
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static void graphic_ctrl_bit_clear( unsigned char x ) 
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1431              		.loc 3 136 0
 1432              		.cfi_startproc
 1433              		@ args = 0, pretend = 0, frame = 8
 1434              		@ frame_needed = 1, uses_anonymous_args = 0
 1435 05f8 80B5     		push	{r7, lr}
 1436              		.cfi_def_cfa_offset 8
 1437              		.cfi_offset 7, -8
 1438              		.cfi_offset 14, -4
 1439 05fa 82B0     		sub	sp, sp, #8
 1440              		.cfi_def_cfa_offset 16
 1441 05fc 00AF     		add	r7, sp, #0
 1442              		.cfi_def_cfa_register 7
 1443 05fe 0200     		movs	r2, r0
 1444 0600 FB1D     		adds	r3, r7, #7
 1445 0602 1A70     		strb	r2, [r3]
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOdrLow &= ( ~B_SELECT & ~x ); 
 1446              		.loc 3 137 0
 1447 0604 0849     		ldr	r1, .L66
 1448 0606 084B     		ldr	r3, .L66
 1449 0608 1B78     		ldrb	r3, [r3]
 1450 060a DBB2     		uxtb	r3, r3
 1451 060c FA1D     		adds	r2, r7, #7
 1452 060e 1278     		ldrb	r2, [r2]
 1453 0610 D243     		mvns	r2, r2
 1454 0612 D2B2     		uxtb	r2, r2
 1455 0614 1340     		ands	r3, r2
 1456 0616 DBB2     		uxtb	r3, r3
 1457 0618 0422     		movs	r2, #4
 1458 061a 9343     		bics	r3, r2
 1459 061c DBB2     		uxtb	r3, r3
 1460 061e 0B70     		strb	r3, [r1]
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1461              		.loc 3 138 0
 1462 0620 C046     		nop
 1463 0622 BD46     		mov	sp, r7
 1464 0624 02B0     		add	sp, sp, #8
 1465              		@ sp needed
 1466 0626 80BD     		pop	{r7, pc}
 1467              	.L67:
 1468              		.align	2
 1469              	.L66:
 1470 0628 14100240 		.word	1073877012
 1471              		.cfi_endproc
 1472              	.LFE21:
 1474              		.align	1
 1475              		.syntax unified
 1476              		.code	16
 1477              		.thumb_func
 1478              		.fpu softvfp
 1480              	select_controller:
 1481              	.LFB22:
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static void select_controller(unsigned char controller) 
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1482              		.loc 3 141 0
 1483              		.cfi_startproc
 1484              		@ args = 0, pretend = 0, frame = 8
 1485              		@ frame_needed = 1, uses_anonymous_args = 0
 1486 062c 80B5     		push	{r7, lr}
 1487              		.cfi_def_cfa_offset 8
 1488              		.cfi_offset 7, -8
 1489              		.cfi_offset 14, -4
 1490 062e 82B0     		sub	sp, sp, #8
 1491              		.cfi_def_cfa_offset 16
 1492 0630 00AF     		add	r7, sp, #0
 1493              		.cfi_def_cfa_register 7
 1494 0632 0200     		movs	r2, r0
 1495 0634 FB1D     		adds	r3, r7, #7
 1496 0636 1A70     		strb	r2, [r3]
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     switch(controller){
 1497              		.loc 3 142 0
 1498 0638 FB1D     		adds	r3, r7, #7
 1499 063a 1B78     		ldrb	r3, [r3]
 1500 063c 082B     		cmp	r3, #8
 1501 063e 0CD0     		beq	.L70
 1502 0640 02DC     		bgt	.L71
 1503 0642 002B     		cmp	r3, #0
 1504 0644 05D0     		beq	.L72
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         case 0: graphic_ctrl_bit_clear(B_CS1|B_CS2);  break; 
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         case B_CS1 : graphic_ctrl_bit_set(B_CS1); graphic_ctrl_bit_clear(B_CS2); break; 
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         case B_CS2 : graphic_ctrl_bit_set(B_CS2); graphic_ctrl_bit_clear(B_CS1);  break; 
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         case B_CS1|B_CS2 : graphic_ctrl_bit_set(B_CS1|B_CS2);  break; 
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 148:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** } 
 1505              		.loc 3 148 0
 1506 0646 1AE0     		b	.L75
 1507              	.L71:
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     switch(controller){
 1508              		.loc 3 142 0
 1509 0648 102B     		cmp	r3, #16
 1510 064a 0DD0     		beq	.L73
 1511 064c 182B     		cmp	r3, #24
 1512 064e 12D0     		beq	.L74
 1513              		.loc 3 148 0
 1514 0650 15E0     		b	.L75
 1515              	.L72:
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         case 0: graphic_ctrl_bit_clear(B_CS1|B_CS2);  break; 
 1516              		.loc 3 143 0
 1517 0652 1820     		movs	r0, #24
 1518 0654 FFF7D0FF 		bl	graphic_ctrl_bit_clear
 1519 0658 11E0     		b	.L69
 1520              	.L70:
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         case B_CS2 : graphic_ctrl_bit_set(B_CS2); graphic_ctrl_bit_clear(B_CS1);  break; 
 1521              		.loc 3 144 0
 1522 065a 0820     		movs	r0, #8
 1523 065c FFF7B1FF 		bl	graphic_ctrl_bit_set
 1524 0660 1020     		movs	r0, #16
 1525 0662 FFF7C9FF 		bl	graphic_ctrl_bit_clear
 1526 0666 0AE0     		b	.L69
 1527              	.L73:
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         case B_CS1|B_CS2 : graphic_ctrl_bit_set(B_CS1|B_CS2);  break; 
 1528              		.loc 3 145 0
 1529 0668 1020     		movs	r0, #16
 1530 066a FFF7AAFF 		bl	graphic_ctrl_bit_set
 1531 066e 0820     		movs	r0, #8
 1532 0670 FFF7C2FF 		bl	graphic_ctrl_bit_clear
 1533 0674 03E0     		b	.L69
 1534              	.L74:
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 1535              		.loc 3 146 0
 1536 0676 1820     		movs	r0, #24
 1537 0678 FFF7A3FF 		bl	graphic_ctrl_bit_set
 1538 067c C046     		nop
 1539              	.L69:
 1540              	.L75:
 1541              		.loc 3 148 0
 1542 067e C046     		nop
 1543 0680 BD46     		mov	sp, r7
 1544 0682 02B0     		add	sp, sp, #8
 1545              		@ sp needed
 1546 0684 80BD     		pop	{r7, pc}
 1547              		.cfi_endproc
 1548              	.LFE22:
 1550              		.align	1
 1551              		.syntax unified
 1552              		.code	16
 1553              		.thumb_func
 1554              		.fpu softvfp
 1556              	graphic_wait_ready:
 1557              	.LFB23:
 149:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 150:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static void graphic_wait_ready(void) 
 151:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1558              		.loc 3 151 0
 1559              		.cfi_startproc
 1560              		@ args = 0, pretend = 0, frame = 8
 1561              		@ frame_needed = 1, uses_anonymous_args = 0
 1562 0686 80B5     		push	{r7, lr}
 1563              		.cfi_def_cfa_offset 8
 1564              		.cfi_offset 7, -8
 1565              		.cfi_offset 14, -4
 1566 0688 82B0     		sub	sp, sp, #8
 1567              		.cfi_def_cfa_offset 16
 1568 068a 00AF     		add	r7, sp, #0
 1569              		.cfi_def_cfa_register 7
 152:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char c;
 153:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     
 154:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_E ); 
 1570              		.loc 3 154 0
 1571 068c 4020     		movs	r0, #64
 1572 068e FFF7B3FF 		bl	graphic_ctrl_bit_clear
 155:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portModer= 0x00005555; /* b15-8 are inputs, b7-0 are outputs */ 
 1573              		.loc 3 155 0
 1574 0692 164B     		ldr	r3, .L82
 1575 0694 164A     		ldr	r2, .L82+4
 1576 0696 1A60     		str	r2, [r3]
 156:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_DI ); 
 1577              		.loc 3 156 0
 1578 0698 0120     		movs	r0, #1
 1579 069a FFF7ADFF 		bl	graphic_ctrl_bit_clear
 157:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_RW ); 
 1580              		.loc 3 157 0
 1581 069e 0220     		movs	r0, #2
 1582 06a0 FFF78FFF 		bl	graphic_ctrl_bit_set
 158:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_500ns();
 1583              		.loc 3 158 0
 1584 06a4 FFF7FEFF 		bl	delay_500ns
 1585              	.L79:
 159:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     
 160:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     while( 1 ) 
 161:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     { 
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_ctrl_bit_set( B_E ); 
 1586              		.loc 3 162 0
 1587 06a8 4020     		movs	r0, #64
 1588 06aa FFF78AFF 		bl	graphic_ctrl_bit_set
 163:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         delay_500ns(); 
 1589              		.loc 3 163 0
 1590 06ae FFF7FEFF 		bl	delay_500ns
 164:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         c = *portIdrHigh & 0x80; 
 1591              		.loc 3 164 0
 1592 06b2 104B     		ldr	r3, .L82+8
 1593 06b4 1B78     		ldrb	r3, [r3]
 1594 06b6 DAB2     		uxtb	r2, r3
 1595 06b8 FB1D     		adds	r3, r7, #7
 1596 06ba 7F21     		movs	r1, #127
 1597 06bc 8A43     		bics	r2, r1
 1598 06be 1A70     		strb	r2, [r3]
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         if( c == 0 )break; 
 1599              		.loc 3 165 0
 1600 06c0 FB1D     		adds	r3, r7, #7
 1601 06c2 1B78     		ldrb	r3, [r3]
 1602 06c4 002B     		cmp	r3, #0
 1603 06c6 05D0     		beq	.L81
 166:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_ctrl_bit_clear( B_E ); 
 1604              		.loc 3 166 0
 1605 06c8 4020     		movs	r0, #64
 1606 06ca FFF795FF 		bl	graphic_ctrl_bit_clear
 167:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         delay_500ns(); 
 1607              		.loc 3 167 0
 1608 06ce FFF7FEFF 		bl	delay_500ns
 162:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         delay_500ns(); 
 1609              		.loc 3 162 0
 1610 06d2 E9E7     		b	.L79
 1611              	.L81:
 165:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_ctrl_bit_clear( B_E ); 
 1612              		.loc 3 165 0
 1613 06d4 C046     		nop
 168:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     } 
 169:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portModer= 0x55555555; /* all bits outputs */ 
 1614              		.loc 3 169 0
 1615 06d6 054B     		ldr	r3, .L82
 1616 06d8 074A     		ldr	r2, .L82+12
 1617 06da 1A60     		str	r2, [r3]
 170:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_E );
 1618              		.loc 3 170 0
 1619 06dc 4020     		movs	r0, #64
 1620 06de FFF770FF 		bl	graphic_ctrl_bit_set
 171:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1621              		.loc 3 171 0
 1622 06e2 C046     		nop
 1623 06e4 BD46     		mov	sp, r7
 1624 06e6 02B0     		add	sp, sp, #8
 1625              		@ sp needed
 1626 06e8 80BD     		pop	{r7, pc}
 1627              	.L83:
 1628 06ea C046     		.align	2
 1629              	.L82:
 1630 06ec 00100240 		.word	1073876992
 1631 06f0 55550000 		.word	21845
 1632 06f4 11100240 		.word	1073877009
 1633 06f8 55555555 		.word	1431655765
 1634              		.cfi_endproc
 1635              	.LFE23:
 1637              		.align	1
 1638              		.syntax unified
 1639              		.code	16
 1640              		.thumb_func
 1641              		.fpu softvfp
 1643              	display_read:
 1644              	.LFB24:
 172:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 173:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static unsigned char  display_read(unsigned char controller) 
 174:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1645              		.loc 3 174 0
 1646              		.cfi_startproc
 1647              		@ args = 0, pretend = 0, frame = 16
 1648              		@ frame_needed = 1, uses_anonymous_args = 0
 1649 06fc 80B5     		push	{r7, lr}
 1650              		.cfi_def_cfa_offset 8
 1651              		.cfi_offset 7, -8
 1652              		.cfi_offset 14, -4
 1653 06fe 84B0     		sub	sp, sp, #16
 1654              		.cfi_def_cfa_offset 24
 1655 0700 00AF     		add	r7, sp, #0
 1656              		.cfi_def_cfa_register 7
 1657 0702 0200     		movs	r2, r0
 1658 0704 FB1D     		adds	r3, r7, #7
 1659 0706 1A70     		strb	r2, [r3]
 175:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char c; 
 176:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portModer= 0x00005555; /* b15-8 are inputs, 7-0 are outputs */ 
 1660              		.loc 3 176 0
 1661 0708 1D4B     		ldr	r3, .L88
 1662 070a 1E4A     		ldr	r2, .L88+4
 1663 070c 1A60     		str	r2, [r3]
 177:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     select_controller( controller );
 1664              		.loc 3 177 0
 1665 070e FB1D     		adds	r3, r7, #7
 1666 0710 1B78     		ldrb	r3, [r3]
 1667 0712 1800     		movs	r0, r3
 1668 0714 FFF78AFF 		bl	select_controller
 178:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 179:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_E ); 
 1669              		.loc 3 179 0
 1670 0718 4020     		movs	r0, #64
 1671 071a FFF76DFF 		bl	graphic_ctrl_bit_clear
 180:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_DI | B_RW ); 
 1672              		.loc 3 180 0
 1673 071e 0320     		movs	r0, #3
 1674 0720 FFF74FFF 		bl	graphic_ctrl_bit_set
 181:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_500ns(); 
 1675              		.loc 3 181 0
 1676 0724 FFF7FEFF 		bl	delay_500ns
 182:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_E ); 
 1677              		.loc 3 182 0
 1678 0728 4020     		movs	r0, #64
 1679 072a FFF74AFF 		bl	graphic_ctrl_bit_set
 183:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_500ns(); 
 1680              		.loc 3 183 0
 1681 072e FFF7FEFF 		bl	delay_500ns
 184:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c = *portIdrHigh;
 1682              		.loc 3 184 0
 1683 0732 154A     		ldr	r2, .L88+8
 1684 0734 0F23     		movs	r3, #15
 1685 0736 FB18     		adds	r3, r7, r3
 1686 0738 1278     		ldrb	r2, [r2]
 1687 073a 1A70     		strb	r2, [r3]
 185:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_E ); 
 1688              		.loc 3 185 0
 1689 073c 4020     		movs	r0, #64
 1690 073e FFF75BFF 		bl	graphic_ctrl_bit_clear
 186:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portModer= 0x55555555; /* all bits outputs */
 1691              		.loc 3 186 0
 1692 0742 0F4B     		ldr	r3, .L88
 1693 0744 114A     		ldr	r2, .L88+12
 1694 0746 1A60     		str	r2, [r3]
 187:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     
 188:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     if( controller & B_CS1 ) 
 1695              		.loc 3 188 0
 1696 0748 FB1D     		adds	r3, r7, #7
 1697 074a 1B78     		ldrb	r3, [r3]
 1698 074c 0822     		movs	r2, #8
 1699 074e 1340     		ands	r3, r2
 1700 0750 04D0     		beq	.L85
 189:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     { 
 190:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         select_controller( B_CS1); 
 1701              		.loc 3 190 0
 1702 0752 0820     		movs	r0, #8
 1703 0754 FFF76AFF 		bl	select_controller
 191:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_wait_ready(); 
 1704              		.loc 3 191 0
 1705 0758 FFF795FF 		bl	graphic_wait_ready
 1706              	.L85:
 192:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     } 
 193:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     if( controller & B_CS2 ) 
 1707              		.loc 3 193 0
 1708 075c FB1D     		adds	r3, r7, #7
 1709 075e 1B78     		ldrb	r3, [r3]
 1710 0760 1022     		movs	r2, #16
 1711 0762 1340     		ands	r3, r2
 1712 0764 04D0     		beq	.L86
 194:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     { 
 195:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         select_controller( B_CS2); 
 1713              		.loc 3 195 0
 1714 0766 1020     		movs	r0, #16
 1715 0768 FFF760FF 		bl	select_controller
 196:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_wait_ready(); 
 1716              		.loc 3 196 0
 1717 076c FFF78BFF 		bl	graphic_wait_ready
 1718              	.L86:
 197:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     } 
 198:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     return c; 
 1719              		.loc 3 198 0
 1720 0770 0F23     		movs	r3, #15
 1721 0772 FB18     		adds	r3, r7, r3
 1722 0774 1B78     		ldrb	r3, [r3]
 199:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1723              		.loc 3 199 0
 1724 0776 1800     		movs	r0, r3
 1725 0778 BD46     		mov	sp, r7
 1726 077a 04B0     		add	sp, sp, #16
 1727              		@ sp needed
 1728 077c 80BD     		pop	{r7, pc}
 1729              	.L89:
 1730 077e C046     		.align	2
 1731              	.L88:
 1732 0780 00100240 		.word	1073876992
 1733 0784 55550000 		.word	21845
 1734 0788 11100240 		.word	1073877009
 1735 078c 55555555 		.word	1431655765
 1736              		.cfi_endproc
 1737              	.LFE24:
 1739              		.align	1
 1740              		.syntax unified
 1741              		.code	16
 1742              		.thumb_func
 1743              		.fpu softvfp
 1745              	graphic_write:
 1746              	.LFB25:
 200:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 201:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static void graphic_write(unsigned char val, unsigned char controller) 
 202:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1747              		.loc 3 202 0
 1748              		.cfi_startproc
 1749              		@ args = 0, pretend = 0, frame = 8
 1750              		@ frame_needed = 1, uses_anonymous_args = 0
 1751 0790 80B5     		push	{r7, lr}
 1752              		.cfi_def_cfa_offset 8
 1753              		.cfi_offset 7, -8
 1754              		.cfi_offset 14, -4
 1755 0792 82B0     		sub	sp, sp, #8
 1756              		.cfi_def_cfa_offset 16
 1757 0794 00AF     		add	r7, sp, #0
 1758              		.cfi_def_cfa_register 7
 1759 0796 0200     		movs	r2, r0
 1760 0798 FB1D     		adds	r3, r7, #7
 1761 079a 1A70     		strb	r2, [r3]
 1762 079c BB1D     		adds	r3, r7, #6
 1763 079e 0A1C     		adds	r2, r1, #0
 1764 07a0 1A70     		strb	r2, [r3]
 203:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOdrHigh= val; 
 1765              		.loc 3 203 0
 1766 07a2 1A4A     		ldr	r2, .L93
 1767 07a4 FB1D     		adds	r3, r7, #7
 1768 07a6 1B78     		ldrb	r3, [r3]
 1769 07a8 1370     		strb	r3, [r2]
 204:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     select_controller( controller ); 
 1770              		.loc 3 204 0
 1771 07aa BB1D     		adds	r3, r7, #6
 1772 07ac 1B78     		ldrb	r3, [r3]
 1773 07ae 1800     		movs	r0, r3
 1774 07b0 FFF73CFF 		bl	select_controller
 205:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_500ns(); 
 1775              		.loc 3 205 0
 1776 07b4 FFF7FEFF 		bl	delay_500ns
 206:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_E ); 
 1777              		.loc 3 206 0
 1778 07b8 4020     		movs	r0, #64
 1779 07ba FFF702FF 		bl	graphic_ctrl_bit_set
 207:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_500ns(); 
 1780              		.loc 3 207 0
 1781 07be FFF7FEFF 		bl	delay_500ns
 208:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_E ); 
 1782              		.loc 3 208 0
 1783 07c2 4020     		movs	r0, #64
 1784 07c4 FFF718FF 		bl	graphic_ctrl_bit_clear
 209:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     if( controller & B_CS1 ) 
 1785              		.loc 3 209 0
 1786 07c8 BB1D     		adds	r3, r7, #6
 1787 07ca 1B78     		ldrb	r3, [r3]
 1788 07cc 0822     		movs	r2, #8
 1789 07ce 1340     		ands	r3, r2
 1790 07d0 04D0     		beq	.L91
 210:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         { 
 211:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             select_controller( B_CS1); 
 1791              		.loc 3 211 0
 1792 07d2 0820     		movs	r0, #8
 1793 07d4 FFF72AFF 		bl	select_controller
 212:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             graphic_wait_ready(); 
 1794              		.loc 3 212 0
 1795 07d8 FFF755FF 		bl	graphic_wait_ready
 1796              	.L91:
 213:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         } 
 214:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     if( controller & B_CS2 ) 
 1797              		.loc 3 214 0
 1798 07dc BB1D     		adds	r3, r7, #6
 1799 07de 1B78     		ldrb	r3, [r3]
 1800 07e0 1022     		movs	r2, #16
 1801 07e2 1340     		ands	r3, r2
 1802 07e4 04D0     		beq	.L92
 215:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         { 
 216:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             select_controller( B_CS2); 
 1803              		.loc 3 216 0
 1804 07e6 1020     		movs	r0, #16
 1805 07e8 FFF720FF 		bl	select_controller
 217:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             graphic_wait_ready(); 
 1806              		.loc 3 217 0
 1807 07ec FFF74BFF 		bl	graphic_wait_ready
 1808              	.L92:
 218:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         }
 219:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 220:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOdrHigh = 0; 
 1809              		.loc 3 220 0
 1810 07f0 064B     		ldr	r3, .L93
 1811 07f2 0022     		movs	r2, #0
 1812 07f4 1A70     		strb	r2, [r3]
 221:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_E ); 
 1813              		.loc 3 221 0
 1814 07f6 4020     		movs	r0, #64
 1815 07f8 FFF7E3FE 		bl	graphic_ctrl_bit_set
 222:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     select_controller( 0 );
 1816              		.loc 3 222 0
 1817 07fc 0020     		movs	r0, #0
 1818 07fe FFF715FF 		bl	select_controller
 223:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1819              		.loc 3 223 0
 1820 0802 C046     		nop
 1821 0804 BD46     		mov	sp, r7
 1822 0806 02B0     		add	sp, sp, #8
 1823              		@ sp needed
 1824 0808 80BD     		pop	{r7, pc}
 1825              	.L94:
 1826 080a C046     		.align	2
 1827              	.L93:
 1828 080c 15100240 		.word	1073877013
 1829              		.cfi_endproc
 1830              	.LFE25:
 1832              		.align	1
 1833              		.syntax unified
 1834              		.code	16
 1835              		.thumb_func
 1836              		.fpu softvfp
 1838              	graphic_writeCommand:
 1839              	.LFB26:
 224:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 225:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static void graphic_writeCommand(unsigned char commandToWrite, unsigned char controller) 
 226:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1840              		.loc 3 226 0
 1841              		.cfi_startproc
 1842              		@ args = 0, pretend = 0, frame = 8
 1843              		@ frame_needed = 1, uses_anonymous_args = 0
 1844 0810 80B5     		push	{r7, lr}
 1845              		.cfi_def_cfa_offset 8
 1846              		.cfi_offset 7, -8
 1847              		.cfi_offset 14, -4
 1848 0812 82B0     		sub	sp, sp, #8
 1849              		.cfi_def_cfa_offset 16
 1850 0814 00AF     		add	r7, sp, #0
 1851              		.cfi_def_cfa_register 7
 1852 0816 0200     		movs	r2, r0
 1853 0818 FB1D     		adds	r3, r7, #7
 1854 081a 1A70     		strb	r2, [r3]
 1855 081c BB1D     		adds	r3, r7, #6
 1856 081e 0A1C     		adds	r2, r1, #0
 1857 0820 1A70     		strb	r2, [r3]
 227:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_E ); 
 1858              		.loc 3 227 0
 1859 0822 4020     		movs	r0, #64
 1860 0824 FFF7E8FE 		bl	graphic_ctrl_bit_clear
 228:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_DI | B_RW ); 
 1861              		.loc 3 228 0
 1862 0828 0320     		movs	r0, #3
 1863 082a FFF7E5FE 		bl	graphic_ctrl_bit_clear
 229:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_write(commandToWrite, controller); 
 1864              		.loc 3 229 0
 1865 082e BB1D     		adds	r3, r7, #6
 1866 0830 1A78     		ldrb	r2, [r3]
 1867 0832 FB1D     		adds	r3, r7, #7
 1868 0834 1B78     		ldrb	r3, [r3]
 1869 0836 1100     		movs	r1, r2
 1870 0838 1800     		movs	r0, r3
 1871 083a FFF7A9FF 		bl	graphic_write
 230:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1872              		.loc 3 230 0
 1873 083e C046     		nop
 1874 0840 BD46     		mov	sp, r7
 1875 0842 02B0     		add	sp, sp, #8
 1876              		@ sp needed
 1877 0844 80BD     		pop	{r7, pc}
 1878              		.cfi_endproc
 1879              	.LFE26:
 1881              		.align	1
 1882              		.syntax unified
 1883              		.code	16
 1884              		.thumb_func
 1885              		.fpu softvfp
 1887              	graphic_writeData:
 1888              	.LFB27:
 231:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static void graphic_writeData(unsigned char data, unsigned char controller) 
 232:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1889              		.loc 3 232 0
 1890              		.cfi_startproc
 1891              		@ args = 0, pretend = 0, frame = 8
 1892              		@ frame_needed = 1, uses_anonymous_args = 0
 1893 0846 80B5     		push	{r7, lr}
 1894              		.cfi_def_cfa_offset 8
 1895              		.cfi_offset 7, -8
 1896              		.cfi_offset 14, -4
 1897 0848 82B0     		sub	sp, sp, #8
 1898              		.cfi_def_cfa_offset 16
 1899 084a 00AF     		add	r7, sp, #0
 1900              		.cfi_def_cfa_register 7
 1901 084c 0200     		movs	r2, r0
 1902 084e FB1D     		adds	r3, r7, #7
 1903 0850 1A70     		strb	r2, [r3]
 1904 0852 BB1D     		adds	r3, r7, #6
 1905 0854 0A1C     		adds	r2, r1, #0
 1906 0856 1A70     		strb	r2, [r3]
 233:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_E ); 
 1907              		.loc 3 233 0
 1908 0858 4020     		movs	r0, #64
 1909 085a FFF7CDFE 		bl	graphic_ctrl_bit_clear
 234:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_DI ); 
 1910              		.loc 3 234 0
 1911 085e 0120     		movs	r0, #1
 1912 0860 FFF7AFFE 		bl	graphic_ctrl_bit_set
 235:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear( B_RW ); 
 1913              		.loc 3 235 0
 1914 0864 0220     		movs	r0, #2
 1915 0866 FFF7C7FE 		bl	graphic_ctrl_bit_clear
 236:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_write(data, controller); 
 1916              		.loc 3 236 0
 1917 086a BB1D     		adds	r3, r7, #6
 1918 086c 1A78     		ldrb	r2, [r3]
 1919 086e FB1D     		adds	r3, r7, #7
 1920 0870 1B78     		ldrb	r3, [r3]
 1921 0872 1100     		movs	r1, r2
 1922 0874 1800     		movs	r0, r3
 1923 0876 FFF78BFF 		bl	graphic_write
 237:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1924              		.loc 3 237 0
 1925 087a C046     		nop
 1926 087c BD46     		mov	sp, r7
 1927 087e 02B0     		add	sp, sp, #8
 1928              		@ sp needed
 1929 0880 80BD     		pop	{r7, pc}
 1930              		.cfi_endproc
 1931              	.LFE27:
 1933              		.align	1
 1934              		.global	graphic_initalize
 1935              		.syntax unified
 1936              		.code	16
 1937              		.thumb_func
 1938              		.fpu softvfp
 1940              	graphic_initalize:
 1941              	.LFB28:
 238:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 239:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void graphic_initalize(void) 
 240:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 1942              		.loc 3 240 0
 1943              		.cfi_startproc
 1944              		@ args = 0, pretend = 0, frame = 0
 1945              		@ frame_needed = 1, uses_anonymous_args = 0
 1946 0882 80B5     		push	{r7, lr}
 1947              		.cfi_def_cfa_offset 8
 1948              		.cfi_offset 7, -8
 1949              		.cfi_offset 14, -4
 1950 0884 00AF     		add	r7, sp, #0
 1951              		.cfi_def_cfa_register 7
 241:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set( B_E ); 
 1952              		.loc 3 241 0
 1953 0886 4020     		movs	r0, #64
 1954 0888 FFF79BFE 		bl	graphic_ctrl_bit_set
 242:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_mikro(10);
 1955              		.loc 3 242 0
 1956 088c 0A20     		movs	r0, #10
 1957 088e FFF7FEFF 		bl	delay_mikro
 243:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);  
 1958              		.loc 3 243 0
 1959 0892 7820     		movs	r0, #120
 1960 0894 FFF7B0FE 		bl	graphic_ctrl_bit_clear
 244:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_milli( 30 ); 
 1961              		.loc 3 244 0
 1962 0898 1E20     		movs	r0, #30
 1963 089a FFF7FEFF 		bl	delay_milli
 245:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_ctrl_bit_set(B_RST); 
 1964              		.loc 3 245 0
 1965 089e 2020     		movs	r0, #32
 1966 08a0 FFF78FFE 		bl	graphic_ctrl_bit_set
 246:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_OFF, B_CS1|B_CS2); 
 1967              		.loc 3 246 0
 1968 08a4 1821     		movs	r1, #24
 1969 08a6 3E20     		movs	r0, #62
 1970 08a8 FFF7B2FF 		bl	graphic_writeCommand
 247:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_ON, B_CS1|B_CS2); 
 1971              		.loc 3 247 0
 1972 08ac 1821     		movs	r1, #24
 1973 08ae 3F20     		movs	r0, #63
 1974 08b0 FFF7AEFF 		bl	graphic_writeCommand
 248:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_DISP_START, B_CS1|B_CS2); 
 1975              		.loc 3 248 0
 1976 08b4 1821     		movs	r1, #24
 1977 08b6 C020     		movs	r0, #192
 1978 08b8 FFF7AAFF 		bl	graphic_writeCommand
 249:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_SET_ADD, B_CS1|B_CS2); 
 1979              		.loc 3 249 0
 1980 08bc 1821     		movs	r1, #24
 1981 08be 4020     		movs	r0, #64
 1982 08c0 FFF7A6FF 		bl	graphic_writeCommand
 250:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_SET_PAGE, B_CS1|B_CS2); 
 1983              		.loc 3 250 0
 1984 08c4 1821     		movs	r1, #24
 1985 08c6 B820     		movs	r0, #184
 1986 08c8 FFF7A2FF 		bl	graphic_writeCommand
 251:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     select_controller(0);
 1987              		.loc 3 251 0
 1988 08cc 0020     		movs	r0, #0
 1989 08ce FFF7ADFE 		bl	select_controller
 252:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 1990              		.loc 3 252 0
 1991 08d2 C046     		nop
 1992 08d4 BD46     		mov	sp, r7
 1993              		@ sp needed
 1994 08d6 80BD     		pop	{r7, pc}
 1995              		.cfi_endproc
 1996              	.LFE28:
 1998              		.align	1
 1999              		.global	graphic_clearScreen
 2000              		.syntax unified
 2001              		.code	16
 2002              		.thumb_func
 2003              		.fpu softvfp
 2005              	graphic_clearScreen:
 2006              	.LFB29:
 253:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 254:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void graphic_clearScreen(void) 
 255:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 2007              		.loc 3 255 0
 2008              		.cfi_startproc
 2009              		@ args = 0, pretend = 0, frame = 8
 2010              		@ frame_needed = 1, uses_anonymous_args = 0
 2011 08d8 80B5     		push	{r7, lr}
 2012              		.cfi_def_cfa_offset 8
 2013              		.cfi_offset 7, -8
 2014              		.cfi_offset 14, -4
 2015 08da 82B0     		sub	sp, sp, #8
 2016              		.cfi_def_cfa_offset 16
 2017 08dc 00AF     		add	r7, sp, #0
 2018              		.cfi_def_cfa_register 7
 256:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char i, j; 
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     for(j = 0; j < 8; j++) 
 2019              		.loc 3 257 0
 2020 08de BB1D     		adds	r3, r7, #6
 2021 08e0 0022     		movs	r2, #0
 2022 08e2 1A70     		strb	r2, [r3]
 2023 08e4 23E0     		b	.L99
 2024              	.L102:
 258:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     { 
 259:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_writeCommand(LCD_SET_PAGE | j, B_CS1|B_CS2 ); 
 2025              		.loc 3 259 0
 2026 08e6 BB1D     		adds	r3, r7, #6
 2027 08e8 1B78     		ldrb	r3, [r3]
 2028 08ea 4822     		movs	r2, #72
 2029 08ec 5242     		rsbs	r2, r2, #0
 2030 08ee 1343     		orrs	r3, r2
 2031 08f0 DBB2     		uxtb	r3, r3
 2032 08f2 1821     		movs	r1, #24
 2033 08f4 1800     		movs	r0, r3
 2034 08f6 FFF78BFF 		bl	graphic_writeCommand
 260:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_writeCommand(LCD_SET_ADD | 0, B_CS1|B_CS2 ); 
 2035              		.loc 3 260 0
 2036 08fa 1821     		movs	r1, #24
 2037 08fc 4020     		movs	r0, #64
 2038 08fe FFF787FF 		bl	graphic_writeCommand
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         for(i = 0; i <= 63; i++)
 2039              		.loc 3 261 0
 2040 0902 FB1D     		adds	r3, r7, #7
 2041 0904 0022     		movs	r2, #0
 2042 0906 1A70     		strb	r2, [r3]
 2043 0908 08E0     		b	.L100
 2044              	.L101:
 262:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {
 263:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             graphic_writeData(0,  B_CS1|B_CS2); 
 2045              		.loc 3 263 0 discriminator 3
 2046 090a 1821     		movs	r1, #24
 2047 090c 0020     		movs	r0, #0
 2048 090e FFF79AFF 		bl	graphic_writeData
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         for(i = 0; i <= 63; i++)
 2049              		.loc 3 261 0 discriminator 3
 2050 0912 FB1D     		adds	r3, r7, #7
 2051 0914 1A78     		ldrb	r2, [r3]
 2052 0916 FB1D     		adds	r3, r7, #7
 2053 0918 0132     		adds	r2, r2, #1
 2054 091a 1A70     		strb	r2, [r3]
 2055              	.L100:
 261:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         for(i = 0; i <= 63; i++)
 2056              		.loc 3 261 0 is_stmt 0 discriminator 1
 2057 091c FB1D     		adds	r3, r7, #7
 2058 091e 1B78     		ldrb	r3, [r3]
 2059 0920 3F2B     		cmp	r3, #63
 2060 0922 F2D9     		bls	.L101
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     { 
 2061              		.loc 3 257 0 is_stmt 1 discriminator 2
 2062 0924 BB1D     		adds	r3, r7, #6
 2063 0926 1A78     		ldrb	r2, [r3]
 2064 0928 BB1D     		adds	r3, r7, #6
 2065 092a 0132     		adds	r2, r2, #1
 2066 092c 1A70     		strb	r2, [r3]
 2067              	.L99:
 257:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     { 
 2068              		.loc 3 257 0 is_stmt 0 discriminator 1
 2069 092e BB1D     		adds	r3, r7, #6
 2070 0930 1B78     		ldrb	r3, [r3]
 2071 0932 072B     		cmp	r3, #7
 2072 0934 D7D9     		bls	.L102
 264:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         } 
 265:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     } 
 266:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2073              		.loc 3 266 0 is_stmt 1
 2074 0936 C046     		nop
 2075 0938 BD46     		mov	sp, r7
 2076 093a 02B0     		add	sp, sp, #8
 2077              		@ sp needed
 2078 093c 80BD     		pop	{r7, pc}
 2079              		.cfi_endproc
 2080              	.LFE29:
 2082              		.align	1
 2083              		.syntax unified
 2084              		.code	16
 2085              		.thumb_func
 2086              		.fpu softvfp
 2088              	graphic_read:
 2089              	.LFB30:
 267:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 268:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static unsigned char graphic_read(unsigned char controller)
 269:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 2090              		.loc 3 269 0
 2091              		.cfi_startproc
 2092              		@ args = 0, pretend = 0, frame = 8
 2093              		@ frame_needed = 1, uses_anonymous_args = 0
 2094 093e 80B5     		push	{r7, lr}
 2095              		.cfi_def_cfa_offset 8
 2096              		.cfi_offset 7, -8
 2097              		.cfi_offset 14, -4
 2098 0940 82B0     		sub	sp, sp, #8
 2099              		.cfi_def_cfa_offset 16
 2100 0942 00AF     		add	r7, sp, #0
 2101              		.cfi_def_cfa_register 7
 2102 0944 0200     		movs	r2, r0
 2103 0946 FB1D     		adds	r3, r7, #7
 2104 0948 1A70     		strb	r2, [r3]
 270:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     display_read(controller);
 2105              		.loc 3 270 0
 2106 094a FB1D     		adds	r3, r7, #7
 2107 094c 1B78     		ldrb	r3, [r3]
 2108 094e 1800     		movs	r0, r3
 2109 0950 FFF7D4FE 		bl	display_read
 271:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     return display_read(controller);
 2110              		.loc 3 271 0
 2111 0954 FB1D     		adds	r3, r7, #7
 2112 0956 1B78     		ldrb	r3, [r3]
 2113 0958 1800     		movs	r0, r3
 2114 095a FFF7CFFE 		bl	display_read
 2115 095e 0300     		movs	r3, r0
 272:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2116              		.loc 3 272 0
 2117 0960 1800     		movs	r0, r3
 2118 0962 BD46     		mov	sp, r7
 2119 0964 02B0     		add	sp, sp, #8
 2120              		@ sp needed
 2121 0966 80BD     		pop	{r7, pc}
 2122              		.cfi_endproc
 2123              	.LFE30:
 2125              		.align	1
 2126              		.global	pixel
 2127              		.syntax unified
 2128              		.code	16
 2129              		.thumb_func
 2130              		.fpu softvfp
 2132              	pixel:
 2133              	.LFB31:
 273:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 274:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void pixel( int x, int y, int set ) 
 275:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** { 
 2134              		.loc 3 275 0
 2135              		.cfi_startproc
 2136              		@ args = 0, pretend = 0, frame = 32
 2137              		@ frame_needed = 1, uses_anonymous_args = 0
 2138 0968 90B5     		push	{r4, r7, lr}
 2139              		.cfi_def_cfa_offset 12
 2140              		.cfi_offset 4, -12
 2141              		.cfi_offset 7, -8
 2142              		.cfi_offset 14, -4
 2143 096a 89B0     		sub	sp, sp, #36
 2144              		.cfi_def_cfa_offset 48
 2145 096c 00AF     		add	r7, sp, #0
 2146              		.cfi_def_cfa_register 7
 2147 096e F860     		str	r0, [r7, #12]
 2148 0970 B960     		str	r1, [r7, #8]
 2149 0972 7A60     		str	r2, [r7, #4]
 276:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char mask,c, controller; 
 277:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     int index;
 278:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 279:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     if( (x > 128 ) || (y > 64) ) 
 2150              		.loc 3 279 0
 2151 0974 FB68     		ldr	r3, [r7, #12]
 2152 0976 802B     		cmp	r3, #128
 2153 0978 00DD     		ble	.LCB1774
 2154 097a B8E0     		b	.L126	@long jump
 2155              	.LCB1774:
 2156              		.loc 3 279 0 is_stmt 0 discriminator 1
 2157 097c BB68     		ldr	r3, [r7, #8]
 2158 097e 402B     		cmp	r3, #64
 2159 0980 00DD     		ble	.LCB1777
 2160 0982 B4E0     		b	.L126	@long jump
 2161              	.LCB1777:
 280:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         return;
 281:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 282:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	index = (y-1)/8;
 2162              		.loc 3 282 0 is_stmt 1
 2163 0984 BB68     		ldr	r3, [r7, #8]
 2164 0986 013B     		subs	r3, r3, #1
 2165 0988 002B     		cmp	r3, #0
 2166 098a 00DA     		bge	.L109
 2167 098c 0733     		adds	r3, r3, #7
 2168              	.L109:
 2169 098e DB10     		asrs	r3, r3, #3
 2170 0990 BB61     		str	r3, [r7, #24]
 283:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	switch((y-1)%8) {
 2171              		.loc 3 283 0
 2172 0992 BB68     		ldr	r3, [r7, #8]
 2173 0994 013B     		subs	r3, r3, #1
 2174 0996 584A     		ldr	r2, .L127
 2175 0998 1340     		ands	r3, r2
 2176 099a 04D5     		bpl	.L110
 2177 099c 013B     		subs	r3, r3, #1
 2178 099e 0822     		movs	r2, #8
 2179 09a0 5242     		rsbs	r2, r2, #0
 2180 09a2 1343     		orrs	r3, r2
 2181 09a4 0133     		adds	r3, r3, #1
 2182              	.L110:
 2183 09a6 072B     		cmp	r3, #7
 2184 09a8 2CD8     		bhi	.L111
 2185 09aa 9A00     		lsls	r2, r3, #2
 2186 09ac 534B     		ldr	r3, .L127+4
 2187 09ae D318     		adds	r3, r2, r3
 2188 09b0 1B68     		ldr	r3, [r3]
 2189 09b2 9F46     		mov	pc, r3
 2190              		.section	.rodata
 2191              		.align	2
 2192              	.L113:
 2193 0000 B4090000 		.word	.L112
 2194 0004 BE090000 		.word	.L114
 2195 0008 C8090000 		.word	.L115
 2196 000c D2090000 		.word	.L116
 2197 0010 DC090000 		.word	.L117
 2198 0014 E6090000 		.word	.L118
 2199 0018 F0090000 		.word	.L119
 2200 001c FA090000 		.word	.L120
 2201              		.text
 2202              	.L112:
 284:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 0: mask = 0x01; break;
 2203              		.loc 3 284 0
 2204 09b4 1F23     		movs	r3, #31
 2205 09b6 FB18     		adds	r3, r7, r3
 2206 09b8 0122     		movs	r2, #1
 2207 09ba 1A70     		strb	r2, [r3]
 2208 09bc 22E0     		b	.L111
 2209              	.L114:
 285:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 1: mask = 0x02; break;
 2210              		.loc 3 285 0
 2211 09be 1F23     		movs	r3, #31
 2212 09c0 FB18     		adds	r3, r7, r3
 2213 09c2 0222     		movs	r2, #2
 2214 09c4 1A70     		strb	r2, [r3]
 2215 09c6 1DE0     		b	.L111
 2216              	.L115:
 286:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 2: mask = 0x04; break;
 2217              		.loc 3 286 0
 2218 09c8 1F23     		movs	r3, #31
 2219 09ca FB18     		adds	r3, r7, r3
 2220 09cc 0422     		movs	r2, #4
 2221 09ce 1A70     		strb	r2, [r3]
 2222 09d0 18E0     		b	.L111
 2223              	.L116:
 287:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 3: mask = 0x08; break;
 2224              		.loc 3 287 0
 2225 09d2 1F23     		movs	r3, #31
 2226 09d4 FB18     		adds	r3, r7, r3
 2227 09d6 0822     		movs	r2, #8
 2228 09d8 1A70     		strb	r2, [r3]
 2229 09da 13E0     		b	.L111
 2230              	.L117:
 288:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 4: mask = 0x10; break;
 2231              		.loc 3 288 0
 2232 09dc 1F23     		movs	r3, #31
 2233 09de FB18     		adds	r3, r7, r3
 2234 09e0 1022     		movs	r2, #16
 2235 09e2 1A70     		strb	r2, [r3]
 2236 09e4 0EE0     		b	.L111
 2237              	.L118:
 289:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 5: mask = 0x20; break;
 2238              		.loc 3 289 0
 2239 09e6 1F23     		movs	r3, #31
 2240 09e8 FB18     		adds	r3, r7, r3
 2241 09ea 2022     		movs	r2, #32
 2242 09ec 1A70     		strb	r2, [r3]
 2243 09ee 09E0     		b	.L111
 2244              	.L119:
 290:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 6: mask = 0x40; break;
 2245              		.loc 3 290 0
 2246 09f0 1F23     		movs	r3, #31
 2247 09f2 FB18     		adds	r3, r7, r3
 2248 09f4 4022     		movs	r2, #64
 2249 09f6 1A70     		strb	r2, [r3]
 2250 09f8 04E0     		b	.L111
 2251              	.L120:
 291:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		case 7: mask = 0x80; break;
 2252              		.loc 3 291 0
 2253 09fa 1F23     		movs	r3, #31
 2254 09fc FB18     		adds	r3, r7, r3
 2255 09fe 8022     		movs	r2, #128
 2256 0a00 1A70     		strb	r2, [r3]
 2257 0a02 C046     		nop
 2258              	.L111:
 292:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	}
 293:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
 294:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	if(set==0){
 2259              		.loc 3 294 0
 2260 0a04 7B68     		ldr	r3, [r7, #4]
 2261 0a06 002B     		cmp	r3, #0
 2262 0a08 06D1     		bne	.L121
 295:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		mask = ~mask;
 2263              		.loc 3 295 0
 2264 0a0a 1F23     		movs	r3, #31
 2265 0a0c FB18     		adds	r3, r7, r3
 2266 0a0e 1F22     		movs	r2, #31
 2267 0a10 BA18     		adds	r2, r7, r2
 2268 0a12 1278     		ldrb	r2, [r2]
 2269 0a14 D243     		mvns	r2, r2
 2270 0a16 1A70     		strb	r2, [r3]
 2271              	.L121:
 296:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	}
 297:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     
 298:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	if(x > 64){ 
 2272              		.loc 3 298 0
 2273 0a18 FB68     		ldr	r3, [r7, #12]
 2274 0a1a 402B     		cmp	r3, #64
 2275 0a1c 07DD     		ble	.L122
 299:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         controller = B_CS2; 
 2276              		.loc 3 299 0
 2277 0a1e 1E23     		movs	r3, #30
 2278 0a20 FB18     		adds	r3, r7, r3
 2279 0a22 1022     		movs	r2, #16
 2280 0a24 1A70     		strb	r2, [r3]
 300:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         x = x -65; 
 2281              		.loc 3 300 0
 2282 0a26 FB68     		ldr	r3, [r7, #12]
 2283 0a28 413B     		subs	r3, r3, #65
 2284 0a2a FB60     		str	r3, [r7, #12]
 2285 0a2c 06E0     		b	.L123
 2286              	.L122:
 301:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     } else{
 302:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         controller = B_CS1; x = x-1; 
 2287              		.loc 3 302 0
 2288 0a2e 1E23     		movs	r3, #30
 2289 0a30 FB18     		adds	r3, r7, r3
 2290 0a32 0822     		movs	r2, #8
 2291 0a34 1A70     		strb	r2, [r3]
 2292 0a36 FB68     		ldr	r3, [r7, #12]
 2293 0a38 013B     		subs	r3, r3, #1
 2294 0a3a FB60     		str	r3, [r7, #12]
 2295              	.L123:
 303:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 304:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_SET_ADD | x, controller ); 
 2296              		.loc 3 304 0
 2297 0a3c FB68     		ldr	r3, [r7, #12]
 2298 0a3e 5BB2     		sxtb	r3, r3
 2299 0a40 4022     		movs	r2, #64
 2300 0a42 1343     		orrs	r3, r2
 2301 0a44 5BB2     		sxtb	r3, r3
 2302 0a46 DAB2     		uxtb	r2, r3
 2303 0a48 1E23     		movs	r3, #30
 2304 0a4a FB18     		adds	r3, r7, r3
 2305 0a4c 1B78     		ldrb	r3, [r3]
 2306 0a4e 1900     		movs	r1, r3
 2307 0a50 1000     		movs	r0, r2
 2308 0a52 FFF7DDFE 		bl	graphic_writeCommand
 305:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_SET_PAGE | index, controller ); 
 2309              		.loc 3 305 0
 2310 0a56 BB69     		ldr	r3, [r7, #24]
 2311 0a58 5BB2     		sxtb	r3, r3
 2312 0a5a 4822     		movs	r2, #72
 2313 0a5c 5242     		rsbs	r2, r2, #0
 2314 0a5e 1343     		orrs	r3, r2
 2315 0a60 5BB2     		sxtb	r3, r3
 2316 0a62 DAB2     		uxtb	r2, r3
 2317 0a64 1E23     		movs	r3, #30
 2318 0a66 FB18     		adds	r3, r7, r3
 2319 0a68 1B78     		ldrb	r3, [r3]
 2320 0a6a 1900     		movs	r1, r3
 2321 0a6c 1000     		movs	r0, r2
 2322 0a6e FFF7CFFE 		bl	graphic_writeCommand
 306:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c = graphic_read( controller ); 
 2323              		.loc 3 306 0
 2324 0a72 1723     		movs	r3, #23
 2325 0a74 FC18     		adds	r4, r7, r3
 2326 0a76 1E23     		movs	r3, #30
 2327 0a78 FB18     		adds	r3, r7, r3
 2328 0a7a 1B78     		ldrb	r3, [r3]
 2329 0a7c 1800     		movs	r0, r3
 2330 0a7e FFF75EFF 		bl	graphic_read
 2331 0a82 0300     		movs	r3, r0
 2332 0a84 2370     		strb	r3, [r4]
 307:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_SET_ADD | x, controller ); 
 2333              		.loc 3 307 0
 2334 0a86 FB68     		ldr	r3, [r7, #12]
 2335 0a88 5BB2     		sxtb	r3, r3
 2336 0a8a 4022     		movs	r2, #64
 2337 0a8c 1343     		orrs	r3, r2
 2338 0a8e 5BB2     		sxtb	r3, r3
 2339 0a90 DAB2     		uxtb	r2, r3
 2340 0a92 1E23     		movs	r3, #30
 2341 0a94 FB18     		adds	r3, r7, r3
 2342 0a96 1B78     		ldrb	r3, [r3]
 2343 0a98 1900     		movs	r1, r3
 2344 0a9a 1000     		movs	r0, r2
 2345 0a9c FFF7B8FE 		bl	graphic_writeCommand
 308:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     if( set ) mask = mask | c; 
 2346              		.loc 3 308 0
 2347 0aa0 7B68     		ldr	r3, [r7, #4]
 2348 0aa2 002B     		cmp	r3, #0
 2349 0aa4 0AD0     		beq	.L124
 2350              		.loc 3 308 0 is_stmt 0 discriminator 1
 2351 0aa6 1F23     		movs	r3, #31
 2352 0aa8 FB18     		adds	r3, r7, r3
 2353 0aaa 1F22     		movs	r2, #31
 2354 0aac B918     		adds	r1, r7, r2
 2355 0aae 1722     		movs	r2, #23
 2356 0ab0 BA18     		adds	r2, r7, r2
 2357 0ab2 0978     		ldrb	r1, [r1]
 2358 0ab4 1278     		ldrb	r2, [r2]
 2359 0ab6 0A43     		orrs	r2, r1
 2360 0ab8 1A70     		strb	r2, [r3]
 2361 0aba 09E0     		b	.L125
 2362              	.L124:
 309:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     else mask = mask & c; 
 2363              		.loc 3 309 0 is_stmt 1
 2364 0abc 1F23     		movs	r3, #31
 2365 0abe FB18     		adds	r3, r7, r3
 2366 0ac0 1F22     		movs	r2, #31
 2367 0ac2 BA18     		adds	r2, r7, r2
 2368 0ac4 1721     		movs	r1, #23
 2369 0ac6 7918     		adds	r1, r7, r1
 2370 0ac8 1278     		ldrb	r2, [r2]
 2371 0aca 0978     		ldrb	r1, [r1]
 2372 0acc 0A40     		ands	r2, r1
 2373 0ace 1A70     		strb	r2, [r3]
 2374              	.L125:
 310:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeData( mask, controller); 
 2375              		.loc 3 310 0
 2376 0ad0 1E23     		movs	r3, #30
 2377 0ad2 FB18     		adds	r3, r7, r3
 2378 0ad4 1A78     		ldrb	r2, [r3]
 2379 0ad6 1F23     		movs	r3, #31
 2380 0ad8 FB18     		adds	r3, r7, r3
 2381 0ada 1B78     		ldrb	r3, [r3]
 2382 0adc 1100     		movs	r1, r2
 2383 0ade 1800     		movs	r0, r3
 2384 0ae0 FFF7B1FE 		bl	graphic_writeData
 311:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
 312:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_writeCommand(LCD_ON, B_CS1|B_CS2);
 2385              		.loc 3 312 0
 2386 0ae4 1821     		movs	r1, #24
 2387 0ae6 3F20     		movs	r0, #63
 2388 0ae8 FFF792FE 		bl	graphic_writeCommand
 2389 0aec 00E0     		b	.L105
 2390              	.L126:
 280:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 2391              		.loc 3 280 0
 2392 0aee C046     		nop
 2393              	.L105:
 313:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2394              		.loc 3 313 0
 2395 0af0 BD46     		mov	sp, r7
 2396 0af2 09B0     		add	sp, sp, #36
 2397              		@ sp needed
 2398 0af4 90BD     		pop	{r4, r7, pc}
 2399              	.L128:
 2400 0af6 C046     		.align	2
 2401              	.L127:
 2402 0af8 07000080 		.word	-2147483641
 2403 0afc 00000000 		.word	.L113
 2404              		.cfi_endproc
 2405              	.LFE31:
 2407              		.align	1
 2408              		.global	ascii_ctrl_bit_set
 2409              		.syntax unified
 2410              		.code	16
 2411              		.thumb_func
 2412              		.fpu softvfp
 2414              	ascii_ctrl_bit_set:
 2415              	.LFB32:
 314:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 315:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** /*ASCII SHIT*/
 316:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_ctrl_bit_set( unsigned char x )
 317:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2416              		.loc 3 317 0
 2417              		.cfi_startproc
 2418              		@ args = 0, pretend = 0, frame = 16
 2419              		@ frame_needed = 1, uses_anonymous_args = 0
 2420 0b00 80B5     		push	{r7, lr}
 2421              		.cfi_def_cfa_offset 8
 2422              		.cfi_offset 7, -8
 2423              		.cfi_offset 14, -4
 2424 0b02 84B0     		sub	sp, sp, #16
 2425              		.cfi_def_cfa_offset 24
 2426 0b04 00AF     		add	r7, sp, #0
 2427              		.cfi_def_cfa_register 7
 2428 0b06 0200     		movs	r2, r0
 2429 0b08 FB1D     		adds	r3, r7, #7
 2430 0b0a 1A70     		strb	r2, [r3]
 318:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char c;
 319:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c = *portOdrLow;
 2431              		.loc 3 319 0
 2432 0b0c 0C4A     		ldr	r2, .L130
 2433 0b0e 0F23     		movs	r3, #15
 2434 0b10 FB18     		adds	r3, r7, r3
 2435 0b12 1278     		ldrb	r2, [r2]
 2436 0b14 1A70     		strb	r2, [r3]
 320:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c |=  (B_SELECT | x);
 2437              		.loc 3 320 0
 2438 0b16 FA1D     		adds	r2, r7, #7
 2439 0b18 0F23     		movs	r3, #15
 2440 0b1a FB18     		adds	r3, r7, r3
 2441 0b1c 1278     		ldrb	r2, [r2]
 2442 0b1e 1B78     		ldrb	r3, [r3]
 2443 0b20 1343     		orrs	r3, r2
 2444 0b22 DAB2     		uxtb	r2, r3
 2445 0b24 0F23     		movs	r3, #15
 2446 0b26 FB18     		adds	r3, r7, r3
 2447 0b28 0421     		movs	r1, #4
 2448 0b2a 0A43     		orrs	r2, r1
 2449 0b2c 1A70     		strb	r2, [r3]
 321:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOdrLow = c;
 2450              		.loc 3 321 0
 2451 0b2e 044A     		ldr	r2, .L130
 2452 0b30 0F23     		movs	r3, #15
 2453 0b32 FB18     		adds	r3, r7, r3
 2454 0b34 1B78     		ldrb	r3, [r3]
 2455 0b36 1370     		strb	r3, [r2]
 322:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2456              		.loc 3 322 0
 2457 0b38 C046     		nop
 2458 0b3a BD46     		mov	sp, r7
 2459 0b3c 04B0     		add	sp, sp, #16
 2460              		@ sp needed
 2461 0b3e 80BD     		pop	{r7, pc}
 2462              	.L131:
 2463              		.align	2
 2464              	.L130:
 2465 0b40 14100240 		.word	1073877012
 2466              		.cfi_endproc
 2467              	.LFE32:
 2469              		.align	1
 2470              		.global	ascii_ctrl_bit_clear
 2471              		.syntax unified
 2472              		.code	16
 2473              		.thumb_func
 2474              		.fpu softvfp
 2476              	ascii_ctrl_bit_clear:
 2477              	.LFB33:
 323:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 324:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_ctrl_bit_clear(unsigned char x)
 325:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2478              		.loc 3 325 0
 2479              		.cfi_startproc
 2480              		@ args = 0, pretend = 0, frame = 16
 2481              		@ frame_needed = 1, uses_anonymous_args = 0
 2482 0b44 80B5     		push	{r7, lr}
 2483              		.cfi_def_cfa_offset 8
 2484              		.cfi_offset 7, -8
 2485              		.cfi_offset 14, -4
 2486 0b46 84B0     		sub	sp, sp, #16
 2487              		.cfi_def_cfa_offset 24
 2488 0b48 00AF     		add	r7, sp, #0
 2489              		.cfi_def_cfa_register 7
 2490 0b4a 0200     		movs	r2, r0
 2491 0b4c FB1D     		adds	r3, r7, #7
 2492 0b4e 1A70     		strb	r2, [r3]
 326:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char  c;
 327:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c = *portOdrLow;
 2493              		.loc 3 327 0
 2494 0b50 0F4A     		ldr	r2, .L133
 2495 0b52 0F23     		movs	r3, #15
 2496 0b54 FB18     		adds	r3, r7, r3
 2497 0b56 1278     		ldrb	r2, [r2]
 2498 0b58 1A70     		strb	r2, [r3]
 328:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c &= (B_SELECT | ~x);
 2499              		.loc 3 328 0
 2500 0b5a FB1D     		adds	r3, r7, #7
 2501 0b5c 1B78     		ldrb	r3, [r3]
 2502 0b5e 5BB2     		sxtb	r3, r3
 2503 0b60 DB43     		mvns	r3, r3
 2504 0b62 5BB2     		sxtb	r3, r3
 2505 0b64 0422     		movs	r2, #4
 2506 0b66 1343     		orrs	r3, r2
 2507 0b68 5BB2     		sxtb	r3, r3
 2508 0b6a 0F22     		movs	r2, #15
 2509 0b6c BA18     		adds	r2, r7, r2
 2510 0b6e 1278     		ldrb	r2, [r2]
 2511 0b70 52B2     		sxtb	r2, r2
 2512 0b72 1340     		ands	r3, r2
 2513 0b74 5AB2     		sxtb	r2, r3
 2514 0b76 0F23     		movs	r3, #15
 2515 0b78 FB18     		adds	r3, r7, r3
 2516 0b7a 1A70     		strb	r2, [r3]
 329:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOdrLow = c;
 2517              		.loc 3 329 0
 2518 0b7c 044A     		ldr	r2, .L133
 2519 0b7e 0F23     		movs	r3, #15
 2520 0b80 FB18     		adds	r3, r7, r3
 2521 0b82 1B78     		ldrb	r3, [r3]
 2522 0b84 1370     		strb	r3, [r2]
 330:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2523              		.loc 3 330 0
 2524 0b86 C046     		nop
 2525 0b88 BD46     		mov	sp, r7
 2526 0b8a 04B0     		add	sp, sp, #16
 2527              		@ sp needed
 2528 0b8c 80BD     		pop	{r7, pc}
 2529              	.L134:
 2530 0b8e C046     		.align	2
 2531              	.L133:
 2532 0b90 14100240 		.word	1073877012
 2533              		.cfi_endproc
 2534              	.LFE33:
 2536              		.align	1
 2537              		.global	ascii_write_controller
 2538              		.syntax unified
 2539              		.code	16
 2540              		.thumb_func
 2541              		.fpu softvfp
 2543              	ascii_write_controller:
 2544              	.LFB34:
 331:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 332:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_write_controller( unsigned char c)
 333:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2545              		.loc 3 333 0
 2546              		.cfi_startproc
 2547              		@ args = 0, pretend = 0, frame = 8
 2548              		@ frame_needed = 1, uses_anonymous_args = 0
 2549 0b94 80B5     		push	{r7, lr}
 2550              		.cfi_def_cfa_offset 8
 2551              		.cfi_offset 7, -8
 2552              		.cfi_offset 14, -4
 2553 0b96 82B0     		sub	sp, sp, #8
 2554              		.cfi_def_cfa_offset 16
 2555 0b98 00AF     		add	r7, sp, #0
 2556              		.cfi_def_cfa_register 7
 2557 0b9a 0200     		movs	r2, r0
 2558 0b9c FB1D     		adds	r3, r7, #7
 2559 0b9e 1A70     		strb	r2, [r3]
 334:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_set(B_E);      // E = 1
 2560              		.loc 3 334 0
 2561 0ba0 4020     		movs	r0, #64
 2562 0ba2 FFF7FEFF 		bl	ascii_ctrl_bit_set
 335:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portOdrHigh = c;
 2563              		.loc 3 335 0
 2564 0ba6 064A     		ldr	r2, .L136
 2565 0ba8 FB1D     		adds	r3, r7, #7
 2566 0baa 1B78     		ldrb	r3, [r3]
 2567 0bac 1370     		strb	r3, [r2]
 336:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_clear(B_E);    // E = 0
 2568              		.loc 3 336 0
 2569 0bae 4020     		movs	r0, #64
 2570 0bb0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 337:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay250ns();
 2571              		.loc 3 337 0
 2572 0bb4 FFF7FEFF 		bl	delay250ns
 338:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2573              		.loc 3 338 0
 2574 0bb8 C046     		nop
 2575 0bba BD46     		mov	sp, r7
 2576 0bbc 02B0     		add	sp, sp, #8
 2577              		@ sp needed
 2578 0bbe 80BD     		pop	{r7, pc}
 2579              	.L137:
 2580              		.align	2
 2581              	.L136:
 2582 0bc0 15100240 		.word	1073877013
 2583              		.cfi_endproc
 2584              	.LFE34:
 2586              		.align	1
 2587              		.global	ascii_write_cmd
 2588              		.syntax unified
 2589              		.code	16
 2590              		.thumb_func
 2591              		.fpu softvfp
 2593              	ascii_write_cmd:
 2594              	.LFB35:
 339:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 340:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_write_cmd(unsigned char c)
 341:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2595              		.loc 3 341 0
 2596              		.cfi_startproc
 2597              		@ args = 0, pretend = 0, frame = 8
 2598              		@ frame_needed = 1, uses_anonymous_args = 0
 2599 0bc4 80B5     		push	{r7, lr}
 2600              		.cfi_def_cfa_offset 8
 2601              		.cfi_offset 7, -8
 2602              		.cfi_offset 14, -4
 2603 0bc6 82B0     		sub	sp, sp, #8
 2604              		.cfi_def_cfa_offset 16
 2605 0bc8 00AF     		add	r7, sp, #0
 2606              		.cfi_def_cfa_register 7
 2607 0bca 0200     		movs	r2, r0
 2608 0bcc FB1D     		adds	r3, r7, #7
 2609 0bce 1A70     		strb	r2, [r3]
 342:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_clear(B_DI | B_RW);    // "|" = bitvis eller
 2610              		.loc 3 342 0
 2611 0bd0 0320     		movs	r0, #3
 2612 0bd2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 343:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_controller(c);
 2613              		.loc 3 343 0
 2614 0bd6 FB1D     		adds	r3, r7, #7
 2615 0bd8 1B78     		ldrb	r3, [r3]
 2616 0bda 1800     		movs	r0, r3
 2617 0bdc FFF7FEFF 		bl	ascii_write_controller
 344:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2618              		.loc 3 344 0
 2619 0be0 C046     		nop
 2620 0be2 BD46     		mov	sp, r7
 2621 0be4 02B0     		add	sp, sp, #8
 2622              		@ sp needed
 2623 0be6 80BD     		pop	{r7, pc}
 2624              		.cfi_endproc
 2625              	.LFE35:
 2627              		.align	1
 2628              		.global	ascii_write_data
 2629              		.syntax unified
 2630              		.code	16
 2631              		.thumb_func
 2632              		.fpu softvfp
 2634              	ascii_write_data:
 2635              	.LFB36:
 345:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 346:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 347:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_write_data(unsigned char c)
 348:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2636              		.loc 3 348 0
 2637              		.cfi_startproc
 2638              		@ args = 0, pretend = 0, frame = 8
 2639              		@ frame_needed = 1, uses_anonymous_args = 0
 2640 0be8 80B5     		push	{r7, lr}
 2641              		.cfi_def_cfa_offset 8
 2642              		.cfi_offset 7, -8
 2643              		.cfi_offset 14, -4
 2644 0bea 82B0     		sub	sp, sp, #8
 2645              		.cfi_def_cfa_offset 16
 2646 0bec 00AF     		add	r7, sp, #0
 2647              		.cfi_def_cfa_register 7
 2648 0bee 0200     		movs	r2, r0
 2649 0bf0 FB1D     		adds	r3, r7, #7
 2650 0bf2 1A70     		strb	r2, [r3]
 349:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_clear(B_RW);
 2651              		.loc 3 349 0
 2652 0bf4 0220     		movs	r0, #2
 2653 0bf6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 350:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_set(B_DI);
 2654              		.loc 3 350 0
 2655 0bfa 0120     		movs	r0, #1
 2656 0bfc FFF7FEFF 		bl	ascii_ctrl_bit_set
 351:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_controller(c);
 2657              		.loc 3 351 0
 2658 0c00 FB1D     		adds	r3, r7, #7
 2659 0c02 1B78     		ldrb	r3, [r3]
 2660 0c04 1800     		movs	r0, r3
 2661 0c06 FFF7FEFF 		bl	ascii_write_controller
 352:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2662              		.loc 3 352 0
 2663 0c0a C046     		nop
 2664 0c0c BD46     		mov	sp, r7
 2665 0c0e 02B0     		add	sp, sp, #8
 2666              		@ sp needed
 2667 0c10 80BD     		pop	{r7, pc}
 2668              		.cfi_endproc
 2669              	.LFE36:
 2671              		.align	1
 2672              		.global	ascii_read_controller
 2673              		.syntax unified
 2674              		.code	16
 2675              		.thumb_func
 2676              		.fpu softvfp
 2678              	ascii_read_controller:
 2679              	.LFB37:
 353:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 354:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** unsigned char ascii_read_controller(void)
 355:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2680              		.loc 3 355 0
 2681              		.cfi_startproc
 2682              		@ args = 0, pretend = 0, frame = 8
 2683              		@ frame_needed = 1, uses_anonymous_args = 0
 2684 0c12 80B5     		push	{r7, lr}
 2685              		.cfi_def_cfa_offset 8
 2686              		.cfi_offset 7, -8
 2687              		.cfi_offset 14, -4
 2688 0c14 82B0     		sub	sp, sp, #8
 2689              		.cfi_def_cfa_offset 16
 2690 0c16 00AF     		add	r7, sp, #0
 2691              		.cfi_def_cfa_register 7
 356:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char c;
 357:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_set(B_E);
 2692              		.loc 3 357 0
 2693 0c18 4020     		movs	r0, #64
 2694 0c1a FFF7FEFF 		bl	ascii_ctrl_bit_set
 358:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay250ns();
 2695              		.loc 3 358 0
 2696 0c1e FFF7FEFF 		bl	delay250ns
 359:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay250ns();
 2697              		.loc 3 359 0
 2698 0c22 FFF7FEFF 		bl	delay250ns
 360:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c = *portIdrHigh;
 2699              		.loc 3 360 0
 2700 0c26 064A     		ldr	r2, .L142
 2701 0c28 FB1D     		adds	r3, r7, #7
 2702 0c2a 1278     		ldrb	r2, [r2]
 2703 0c2c 1A70     		strb	r2, [r3]
 361:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_clear(B_E);
 2704              		.loc 3 361 0
 2705 0c2e 4020     		movs	r0, #64
 2706 0c30 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 362:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     return c;
 2707              		.loc 3 362 0
 2708 0c34 FB1D     		adds	r3, r7, #7
 2709 0c36 1B78     		ldrb	r3, [r3]
 363:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2710              		.loc 3 363 0
 2711 0c38 1800     		movs	r0, r3
 2712 0c3a BD46     		mov	sp, r7
 2713 0c3c 02B0     		add	sp, sp, #8
 2714              		@ sp needed
 2715 0c3e 80BD     		pop	{r7, pc}
 2716              	.L143:
 2717              		.align	2
 2718              	.L142:
 2719 0c40 11100240 		.word	1073877009
 2720              		.cfi_endproc
 2721              	.LFE37:
 2723              		.align	1
 2724              		.global	ascii_read_status
 2725              		.syntax unified
 2726              		.code	16
 2727              		.thumb_func
 2728              		.fpu softvfp
 2730              	ascii_read_status:
 2731              	.LFB38:
 364:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 365:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** unsigned char ascii_read_status(void)
 366:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2732              		.loc 3 366 0
 2733              		.cfi_startproc
 2734              		@ args = 0, pretend = 0, frame = 8
 2735              		@ frame_needed = 1, uses_anonymous_args = 0
 2736 0c44 90B5     		push	{r4, r7, lr}
 2737              		.cfi_def_cfa_offset 12
 2738              		.cfi_offset 4, -12
 2739              		.cfi_offset 7, -8
 2740              		.cfi_offset 14, -4
 2741 0c46 83B0     		sub	sp, sp, #12
 2742              		.cfi_def_cfa_offset 24
 2743 0c48 00AF     		add	r7, sp, #0
 2744              		.cfi_def_cfa_register 7
 367:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char c;
 368:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portModer = 0x00005555;
 2745              		.loc 3 368 0
 2746 0c4a 0B4B     		ldr	r3, .L146
 2747 0c4c 0B4A     		ldr	r2, .L146+4
 2748 0c4e 1A60     		str	r2, [r3]
 369:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_set(B_RW);
 2749              		.loc 3 369 0
 2750 0c50 0220     		movs	r0, #2
 2751 0c52 FFF7FEFF 		bl	ascii_ctrl_bit_set
 370:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_ctrl_bit_clear(B_DI);
 2752              		.loc 3 370 0
 2753 0c56 0120     		movs	r0, #1
 2754 0c58 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 371:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     c = ascii_read_controller();
 2755              		.loc 3 371 0
 2756 0c5c FC1D     		adds	r4, r7, #7
 2757 0c5e FFF7FEFF 		bl	ascii_read_controller
 2758 0c62 0300     		movs	r3, r0
 2759 0c64 2370     		strb	r3, [r4]
 372:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     *portModer = 0x55555555;
 2760              		.loc 3 372 0
 2761 0c66 044B     		ldr	r3, .L146
 2762 0c68 054A     		ldr	r2, .L146+8
 2763 0c6a 1A60     		str	r2, [r3]
 373:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     return c;
 2764              		.loc 3 373 0
 2765 0c6c FB1D     		adds	r3, r7, #7
 2766 0c6e 1B78     		ldrb	r3, [r3]
 374:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2767              		.loc 3 374 0
 2768 0c70 1800     		movs	r0, r3
 2769 0c72 BD46     		mov	sp, r7
 2770 0c74 03B0     		add	sp, sp, #12
 2771              		@ sp needed
 2772 0c76 90BD     		pop	{r4, r7, pc}
 2773              	.L147:
 2774              		.align	2
 2775              	.L146:
 2776 0c78 00100240 		.word	1073876992
 2777 0c7c 55550000 		.word	21845
 2778 0c80 55555555 		.word	1431655765
 2779              		.cfi_endproc
 2780              	.LFE38:
 2782              		.align	1
 2783              		.global	ascii_wait_ready
 2784              		.syntax unified
 2785              		.code	16
 2786              		.thumb_func
 2787              		.fpu softvfp
 2789              	ascii_wait_ready:
 2790              	.LFB39:
 375:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 376:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_wait_ready( void )
 377:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2791              		.loc 3 377 0
 2792              		.cfi_startproc
 2793              		@ args = 0, pretend = 0, frame = 0
 2794              		@ frame_needed = 1, uses_anonymous_args = 0
 2795 0c84 80B5     		push	{r7, lr}
 2796              		.cfi_def_cfa_offset 8
 2797              		.cfi_offset 7, -8
 2798              		.cfi_offset 14, -4
 2799 0c86 00AF     		add	r7, sp, #0
 2800              		.cfi_def_cfa_register 7
 378:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     while( ( ascii_read_status() & 0x80) == 0x80) ;
 2801              		.loc 3 378 0
 2802 0c88 C046     		nop
 2803              	.L149:
 2804              		.loc 3 378 0 is_stmt 0 discriminator 1
 2805 0c8a FFF7FEFF 		bl	ascii_read_status
 2806 0c8e 0300     		movs	r3, r0
 2807 0c90 1A00     		movs	r2, r3
 2808 0c92 8023     		movs	r3, #128
 2809 0c94 1340     		ands	r3, r2
 2810 0c96 802B     		cmp	r3, #128
 2811 0c98 F7D0     		beq	.L149
 379:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_mikro(8);
 2812              		.loc 3 379 0 is_stmt 1
 2813 0c9a 0820     		movs	r0, #8
 2814 0c9c FFF7FEFF 		bl	delay_mikro
 380:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2815              		.loc 3 380 0
 2816 0ca0 C046     		nop
 2817 0ca2 BD46     		mov	sp, r7
 2818              		@ sp needed
 2819 0ca4 80BD     		pop	{r7, pc}
 2820              		.cfi_endproc
 2821              	.LFE39:
 2823              		.align	1
 2824              		.global	ascii_write_char
 2825              		.syntax unified
 2826              		.code	16
 2827              		.thumb_func
 2828              		.fpu softvfp
 2830              	ascii_write_char:
 2831              	.LFB40:
 381:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 382:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_write_char(unsigned char c)
 383:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2832              		.loc 3 383 0
 2833              		.cfi_startproc
 2834              		@ args = 0, pretend = 0, frame = 8
 2835              		@ frame_needed = 1, uses_anonymous_args = 0
 2836 0ca6 80B5     		push	{r7, lr}
 2837              		.cfi_def_cfa_offset 8
 2838              		.cfi_offset 7, -8
 2839              		.cfi_offset 14, -4
 2840 0ca8 82B0     		sub	sp, sp, #8
 2841              		.cfi_def_cfa_offset 16
 2842 0caa 00AF     		add	r7, sp, #0
 2843              		.cfi_def_cfa_register 7
 2844 0cac 0200     		movs	r2, r0
 2845 0cae FB1D     		adds	r3, r7, #7
 2846 0cb0 1A70     		strb	r2, [r3]
 384:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_wait_ready();
 2847              		.loc 3 384 0
 2848 0cb2 FFF7FEFF 		bl	ascii_wait_ready
 385:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_data(c);
 2849              		.loc 3 385 0
 2850 0cb6 FB1D     		adds	r3, r7, #7
 2851 0cb8 1B78     		ldrb	r3, [r3]
 2852 0cba 1800     		movs	r0, r3
 2853 0cbc FFF7FEFF 		bl	ascii_write_data
 386:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_mikro(39);
 2854              		.loc 3 386 0
 2855 0cc0 2720     		movs	r0, #39
 2856 0cc2 FFF7FEFF 		bl	delay_mikro
 387:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     
 388:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2857              		.loc 3 388 0
 2858 0cc6 C046     		nop
 2859 0cc8 BD46     		mov	sp, r7
 2860 0cca 02B0     		add	sp, sp, #8
 2861              		@ sp needed
 2862 0ccc 80BD     		pop	{r7, pc}
 2863              		.cfi_endproc
 2864              	.LFE40:
 2866              		.align	1
 2867              		.global	ascii_init
 2868              		.syntax unified
 2869              		.code	16
 2870              		.thumb_func
 2871              		.fpu softvfp
 2873              	ascii_init:
 2874              	.LFB41:
 389:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 390:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_init(void)
 391:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2875              		.loc 3 391 0
 2876              		.cfi_startproc
 2877              		@ args = 0, pretend = 0, frame = 0
 2878              		@ frame_needed = 1, uses_anonymous_args = 0
 2879 0cce 80B5     		push	{r7, lr}
 2880              		.cfi_def_cfa_offset 8
 2881              		.cfi_offset 7, -8
 2882              		.cfi_offset 14, -4
 2883 0cd0 00AF     		add	r7, sp, #0
 2884              		.cfi_def_cfa_register 7
 392:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_wait_ready();
 2885              		.loc 3 392 0
 2886 0cd2 FFF7FEFF 		bl	ascii_wait_ready
 393:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_cmd( 0x0C);    /*display on*/
 2887              		.loc 3 393 0
 2888 0cd6 0C20     		movs	r0, #12
 2889 0cd8 FFF7FEFF 		bl	ascii_write_cmd
 394:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_mikro(39);
 2890              		.loc 3 394 0
 2891 0cdc 2720     		movs	r0, #39
 2892 0cde FFF7FEFF 		bl	delay_mikro
 395:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_wait_ready();
 2893              		.loc 3 395 0
 2894 0ce2 FFF7FEFF 		bl	ascii_wait_ready
 396:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_cmd( 0x38);    /*function set*/
 2895              		.loc 3 396 0
 2896 0ce6 3820     		movs	r0, #56
 2897 0ce8 FFF7FEFF 		bl	ascii_write_cmd
 397:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_mikro(39);
 2898              		.loc 3 397 0
 2899 0cec 2720     		movs	r0, #39
 2900 0cee FFF7FEFF 		bl	delay_mikro
 398:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_wait_ready();
 2901              		.loc 3 398 0
 2902 0cf2 FFF7FEFF 		bl	ascii_wait_ready
 399:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_cmd( 1 );    /*clear display*/
 2903              		.loc 3 399 0
 2904 0cf6 0120     		movs	r0, #1
 2905 0cf8 FFF7FEFF 		bl	ascii_write_cmd
 400:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_milli(2);
 2906              		.loc 3 400 0
 2907 0cfc 0220     		movs	r0, #2
 2908 0cfe FFF7FEFF 		bl	delay_milli
 401:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_wait_ready();
 2909              		.loc 3 401 0
 2910 0d02 FFF7FEFF 		bl	ascii_wait_ready
 402:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_cmd( 6 );    /*entry mode set*/
 2911              		.loc 3 402 0
 2912 0d06 0620     		movs	r0, #6
 2913 0d08 FFF7FEFF 		bl	ascii_write_cmd
 403:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     delay_mikro(39);
 2914              		.loc 3 403 0
 2915 0d0c 2720     		movs	r0, #39
 2916 0d0e FFF7FEFF 		bl	delay_mikro
 404:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2917              		.loc 3 404 0
 2918 0d12 C046     		nop
 2919 0d14 BD46     		mov	sp, r7
 2920              		@ sp needed
 2921 0d16 80BD     		pop	{r7, pc}
 2922              		.cfi_endproc
 2923              	.LFE41:
 2925              		.align	1
 2926              		.global	ascii_gotoxy
 2927              		.syntax unified
 2928              		.code	16
 2929              		.thumb_func
 2930              		.fpu softvfp
 2932              	ascii_gotoxy:
 2933              	.LFB42:
 405:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 406:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void ascii_gotoxy( unsigned char x, unsigned char y)
 407:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 2934              		.loc 3 407 0
 2935              		.cfi_startproc
 2936              		@ args = 0, pretend = 0, frame = 16
 2937              		@ frame_needed = 1, uses_anonymous_args = 0
 2938 0d18 80B5     		push	{r7, lr}
 2939              		.cfi_def_cfa_offset 8
 2940              		.cfi_offset 7, -8
 2941              		.cfi_offset 14, -4
 2942 0d1a 84B0     		sub	sp, sp, #16
 2943              		.cfi_def_cfa_offset 24
 2944 0d1c 00AF     		add	r7, sp, #0
 2945              		.cfi_def_cfa_register 7
 2946 0d1e 0200     		movs	r2, r0
 2947 0d20 FB1D     		adds	r3, r7, #7
 2948 0d22 1A70     		strb	r2, [r3]
 2949 0d24 BB1D     		adds	r3, r7, #6
 2950 0d26 0A1C     		adds	r2, r1, #0
 2951 0d28 1A70     		strb	r2, [r3]
 408:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_wait_ready();
 2952              		.loc 3 408 0
 2953 0d2a FFF7FEFF 		bl	ascii_wait_ready
 409:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     unsigned char address;
 410:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     if(y != 1){
 2954              		.loc 3 410 0
 2955 0d2e BB1D     		adds	r3, r7, #6
 2956 0d30 1B78     		ldrb	r3, [r3]
 2957 0d32 012B     		cmp	r3, #1
 2958 0d34 0BD0     		beq	.L153
 411:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         address = 0x40 | (x-1);
 2959              		.loc 3 411 0
 2960 0d36 FB1D     		adds	r3, r7, #7
 2961 0d38 1B78     		ldrb	r3, [r3]
 2962 0d3a 013B     		subs	r3, r3, #1
 2963 0d3c DBB2     		uxtb	r3, r3
 2964 0d3e 5BB2     		sxtb	r3, r3
 2965 0d40 4022     		movs	r2, #64
 2966 0d42 1343     		orrs	r3, r2
 2967 0d44 5AB2     		sxtb	r2, r3
 2968 0d46 0F23     		movs	r3, #15
 2969 0d48 FB18     		adds	r3, r7, r3
 2970 0d4a 1A70     		strb	r2, [r3]
 2971 0d4c 05E0     		b	.L154
 2972              	.L153:
 412:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 413:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     else{
 414:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         address = x-1;
 2973              		.loc 3 414 0
 2974 0d4e 0F23     		movs	r3, #15
 2975 0d50 FB18     		adds	r3, r7, r3
 2976 0d52 FA1D     		adds	r2, r7, #7
 2977 0d54 1278     		ldrb	r2, [r2]
 2978 0d56 013A     		subs	r2, r2, #1
 2979 0d58 1A70     		strb	r2, [r3]
 2980              	.L154:
 415:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 416:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     
 417:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_write_cmd ( 0x80 | address);
 2981              		.loc 3 417 0
 2982 0d5a 0F23     		movs	r3, #15
 2983 0d5c FB18     		adds	r3, r7, r3
 2984 0d5e 1B78     		ldrb	r3, [r3]
 2985 0d60 8022     		movs	r2, #128
 2986 0d62 5242     		rsbs	r2, r2, #0
 2987 0d64 1343     		orrs	r3, r2
 2988 0d66 DBB2     		uxtb	r3, r3
 2989 0d68 1800     		movs	r0, r3
 2990 0d6a FFF7FEFF 		bl	ascii_write_cmd
 418:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 2991              		.loc 3 418 0
 2992 0d6e C046     		nop
 2993 0d70 BD46     		mov	sp, r7
 2994 0d72 04B0     		add	sp, sp, #16
 2995              		@ sp needed
 2996 0d74 80BD     		pop	{r7, pc}
 2997              		.cfi_endproc
 2998              	.LFE42:
 3000              		.align	1
 3001              		.global	activateRow
 3002              		.syntax unified
 3003              		.code	16
 3004              		.thumb_func
 3005              		.fpu softvfp
 3007              	activateRow:
 3008              	.LFB43:
 419:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 420:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** /*Eventuella hjälprutiner*/
 421:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void activateRow ( unsigned int adress, unsigned int row )
 422:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 3009              		.loc 3 422 0
 3010              		.cfi_startproc
 3011              		@ args = 0, pretend = 0, frame = 16
 3012              		@ frame_needed = 1, uses_anonymous_args = 0
 3013 0d76 80B5     		push	{r7, lr}
 3014              		.cfi_def_cfa_offset 8
 3015              		.cfi_offset 7, -8
 3016              		.cfi_offset 14, -4
 3017 0d78 84B0     		sub	sp, sp, #16
 3018              		.cfi_def_cfa_offset 24
 3019 0d7a 00AF     		add	r7, sp, #0
 3020              		.cfi_def_cfa_register 7
 3021 0d7c 7860     		str	r0, [r7, #4]
 3022 0d7e 3960     		str	r1, [r7]
 423:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	unsigned char bitmask = (0x10 << row);
 3023              		.loc 3 423 0
 3024 0d80 1022     		movs	r2, #16
 3025 0d82 3B68     		ldr	r3, [r7]
 3026 0d84 9A40     		lsls	r2, r2, r3
 3027 0d86 0F23     		movs	r3, #15
 3028 0d88 FB18     		adds	r3, r7, r3
 3029 0d8a 1A70     		strb	r2, [r3]
 424:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	*( (unsigned char *) adress) = bitmask;
 3030              		.loc 3 424 0
 3031 0d8c 7B68     		ldr	r3, [r7, #4]
 3032 0d8e 0F22     		movs	r2, #15
 3033 0d90 BA18     		adds	r2, r7, r2
 3034 0d92 1278     		ldrb	r2, [r2]
 3035 0d94 1A70     		strb	r2, [r3]
 425:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 3036              		.loc 3 425 0
 3037 0d96 C046     		nop
 3038 0d98 BD46     		mov	sp, r7
 3039 0d9a 04B0     		add	sp, sp, #16
 3040              		@ sp needed
 3041 0d9c 80BD     		pop	{r7, pc}
 3042              		.cfi_endproc
 3043              	.LFE43:
 3045              		.align	1
 3046              		.global	checkValues
 3047              		.syntax unified
 3048              		.code	16
 3049              		.thumb_func
 3050              		.fpu softvfp
 3052              	checkValues:
 3053              	.LFB44:
 426:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 427:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** int checkValues(unsigned int adress)
 428:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 3054              		.loc 3 428 0
 3055              		.cfi_startproc
 3056              		@ args = 0, pretend = 0, frame = 16
 3057              		@ frame_needed = 1, uses_anonymous_args = 0
 3058 0d9e 80B5     		push	{r7, lr}
 3059              		.cfi_def_cfa_offset 8
 3060              		.cfi_offset 7, -8
 3061              		.cfi_offset 14, -4
 3062 0da0 84B0     		sub	sp, sp, #16
 3063              		.cfi_def_cfa_offset 24
 3064 0da2 00AF     		add	r7, sp, #0
 3065              		.cfi_def_cfa_register 7
 3066 0da4 7860     		str	r0, [r7, #4]
 429:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	 unsigned char colsValue = *((unsigned char *) adress);
 3067              		.loc 3 429 0
 3068 0da6 7A68     		ldr	r2, [r7, #4]
 3069 0da8 0F23     		movs	r3, #15
 3070 0daa FB18     		adds	r3, r7, r3
 3071 0dac 1278     		ldrb	r2, [r2]
 3072 0dae 1A70     		strb	r2, [r3]
 430:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	 colsValue &= 0x0F;
 3073              		.loc 3 430 0
 3074 0db0 0F23     		movs	r3, #15
 3075 0db2 FB18     		adds	r3, r7, r3
 3076 0db4 0F22     		movs	r2, #15
 3077 0db6 BA18     		adds	r2, r7, r2
 3078 0db8 1278     		ldrb	r2, [r2]
 3079 0dba 0F21     		movs	r1, #15
 3080 0dbc 0A40     		ands	r2, r1
 3081 0dbe 1A70     		strb	r2, [r3]
 431:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	 switch(colsValue) {
 3082              		.loc 3 431 0
 3083 0dc0 0F23     		movs	r3, #15
 3084 0dc2 FB18     		adds	r3, r7, r3
 3085 0dc4 1B78     		ldrb	r3, [r3]
 3086 0dc6 022B     		cmp	r3, #2
 3087 0dc8 0AD0     		beq	.L158
 3088 0dca 02DC     		bgt	.L159
 3089 0dcc 012B     		cmp	r3, #1
 3090 0dce 05D0     		beq	.L160
 3091 0dd0 0CE0     		b	.L157
 3092              	.L159:
 3093 0dd2 042B     		cmp	r3, #4
 3094 0dd4 06D0     		beq	.L161
 3095 0dd6 082B     		cmp	r3, #8
 3096 0dd8 06D0     		beq	.L162
 3097 0dda 07E0     		b	.L157
 3098              	.L160:
 432:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		 case 1: return 1;
 3099              		.loc 3 432 0
 3100 0ddc 0123     		movs	r3, #1
 3101 0dde 06E0     		b	.L163
 3102              	.L158:
 433:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		 case 2: return 2;
 3103              		.loc 3 433 0
 3104 0de0 0223     		movs	r3, #2
 3105 0de2 04E0     		b	.L163
 3106              	.L161:
 434:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		 case 4: return 3;
 3107              		.loc 3 434 0
 3108 0de4 0323     		movs	r3, #3
 3109 0de6 02E0     		b	.L163
 3110              	.L162:
 435:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		 case 8: return 4;
 3111              		.loc 3 435 0
 3112 0de8 0423     		movs	r3, #4
 3113 0dea 00E0     		b	.L163
 3114              	.L157:
 436:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		 default: return 0;
 3115              		.loc 3 436 0
 3116 0dec 0023     		movs	r3, #0
 3117              	.L163:
 437:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	 }
 438:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 3118              		.loc 3 438 0
 3119 0dee 1800     		movs	r0, r3
 3120 0df0 BD46     		mov	sp, r7
 3121 0df2 04B0     		add	sp, sp, #16
 3122              		@ sp needed
 3123 0df4 80BD     		pop	{r7, pc}
 3124              		.cfi_endproc
 3125              	.LFE44:
 3127              		.section	.rodata
 3128              		.align	2
 3129              	.LC0:
 3130 0020 01       		.byte	1
 3131 0021 02       		.byte	2
 3132 0022 03       		.byte	3
 3133 0023 0A       		.byte	10
 3134 0024 04       		.byte	4
 3135 0025 05       		.byte	5
 3136 0026 06       		.byte	6
 3137 0027 0B       		.byte	11
 3138 0028 07       		.byte	7
 3139 0029 08       		.byte	8
 3140 002a 09       		.byte	9
 3141 002b 0C       		.byte	12
 3142 002c 00       		.byte	0
 3143 002d 00       		.byte	0
 3144 002e 00       		.byte	0
 3145 002f 0D       		.byte	13
 3146              		.text
 3147              		.align	1
 3148              		.global	keyb
 3149              		.syntax unified
 3150              		.code	16
 3151              		.thumb_func
 3152              		.fpu softvfp
 3154              	keyb:
 3155              	.LFB45:
 439:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 440:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** unsigned char keyb ( unsigned int inadress, unsigned int outadress )
 441:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 3156              		.loc 3 441 0
 3157              		.cfi_startproc
 3158              		@ args = 0, pretend = 0, frame = 32
 3159              		@ frame_needed = 1, uses_anonymous_args = 0
 3160 0df6 90B5     		push	{r4, r7, lr}
 3161              		.cfi_def_cfa_offset 12
 3162              		.cfi_offset 4, -12
 3163              		.cfi_offset 7, -8
 3164              		.cfi_offset 14, -4
 3165 0df8 89B0     		sub	sp, sp, #36
 3166              		.cfi_def_cfa_offset 48
 3167 0dfa 00AF     		add	r7, sp, #0
 3168              		.cfi_def_cfa_register 7
 3169 0dfc 7860     		str	r0, [r7, #4]
 3170 0dfe 3960     		str	r1, [r7]
 442:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	unsigned char keys[] = {1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0,0,0,0xD};
 3171              		.loc 3 442 0
 3172 0e00 0823     		movs	r3, #8
 3173 0e02 FB18     		adds	r3, r7, r3
 3174 0e04 154A     		ldr	r2, .L170
 3175 0e06 13CA     		ldmia	r2!, {r0, r1, r4}
 3176 0e08 13C3     		stmia	r3!, {r0, r1, r4}
 3177 0e0a 1268     		ldr	r2, [r2]
 3178 0e0c 1A60     		str	r2, [r3]
 3179              	.LBB10:
 443:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     for (int row = 0; row <= 3; row++)
 3180              		.loc 3 443 0
 3181 0e0e 0023     		movs	r3, #0
 3182 0e10 FB61     		str	r3, [r7, #28]
 3183 0e12 1AE0     		b	.L165
 3184              	.L168:
 3185              	.LBB11:
 444:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     {
 445:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         activateRow(outadress, row);
 3186              		.loc 3 445 0
 3187 0e14 FA69     		ldr	r2, [r7, #28]
 3188 0e16 3B68     		ldr	r3, [r7]
 3189 0e18 1100     		movs	r1, r2
 3190 0e1a 1800     		movs	r0, r3
 3191 0e1c FFF7FEFF 		bl	activateRow
 446:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         int col = checkValues(inadress);
 3192              		.loc 3 446 0
 3193 0e20 7B68     		ldr	r3, [r7, #4]
 3194 0e22 1800     		movs	r0, r3
 3195 0e24 FFF7FEFF 		bl	checkValues
 3196 0e28 0300     		movs	r3, r0
 3197 0e2a BB61     		str	r3, [r7, #24]
 447:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         if(col != 0)
 3198              		.loc 3 447 0
 3199 0e2c BB69     		ldr	r3, [r7, #24]
 3200 0e2e 002B     		cmp	r3, #0
 3201 0e30 08D0     		beq	.L166
 448:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {
 449:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****             return keys[(col + (row * 4) - 1)];
 3202              		.loc 3 449 0
 3203 0e32 FB69     		ldr	r3, [r7, #28]
 3204 0e34 9A00     		lsls	r2, r3, #2
 3205 0e36 BB69     		ldr	r3, [r7, #24]
 3206 0e38 D318     		adds	r3, r2, r3
 3207 0e3a 013B     		subs	r3, r3, #1
 3208 0e3c 0822     		movs	r2, #8
 3209 0e3e BA18     		adds	r2, r7, r2
 3210 0e40 D35C     		ldrb	r3, [r2, r3]
 3211 0e42 06E0     		b	.L169
 3212              	.L166:
 3213              	.LBE11:
 443:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     {
 3214              		.loc 3 443 0 discriminator 2
 3215 0e44 FB69     		ldr	r3, [r7, #28]
 3216 0e46 0133     		adds	r3, r3, #1
 3217 0e48 FB61     		str	r3, [r7, #28]
 3218              	.L165:
 443:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     {
 3219              		.loc 3 443 0 is_stmt 0 discriminator 1
 3220 0e4a FB69     		ldr	r3, [r7, #28]
 3221 0e4c 032B     		cmp	r3, #3
 3222 0e4e E1DD     		ble	.L168
 3223              	.LBE10:
 450:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         }
 451:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 452:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     return 0xFF;
 3224              		.loc 3 452 0 is_stmt 1
 3225 0e50 FF23     		movs	r3, #255
 3226              	.L169:
 453:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 3227              		.loc 3 453 0 discriminator 1
 3228 0e52 1800     		movs	r0, r3
 3229 0e54 BD46     		mov	sp, r7
 3230 0e56 09B0     		add	sp, sp, #36
 3231              		@ sp needed
 3232 0e58 90BD     		pop	{r4, r7, pc}
 3233              	.L171:
 3234 0e5a C046     		.align	2
 3235              	.L170:
 3236 0e5c 20000000 		.word	.LC0
 3237              		.cfi_endproc
 3238              	.LFE45:
 3240              		.align	1
 3241              		.global	checkForGoals
 3242              		.syntax unified
 3243              		.code	16
 3244              		.thumb_func
 3245              		.fpu softvfp
 3247              	checkForGoals:
 3248              	.LFB46:
 454:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 455:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void checkForGoals(PPONGBALL o){
 3249              		.loc 3 455 0
 3250              		.cfi_startproc
 3251              		@ args = 0, pretend = 0, frame = 8
 3252              		@ frame_needed = 1, uses_anonymous_args = 0
 3253 0e60 80B5     		push	{r7, lr}
 3254              		.cfi_def_cfa_offset 8
 3255              		.cfi_offset 7, -8
 3256              		.cfi_offset 14, -4
 3257 0e62 82B0     		sub	sp, sp, #8
 3258              		.cfi_def_cfa_offset 16
 3259 0e64 00AF     		add	r7, sp, #0
 3260              		.cfi_def_cfa_register 7
 3261 0e66 7860     		str	r0, [r7, #4]
 456:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	if ((o->pos_x_inbounds(o, 0) == 1)){
 3262              		.loc 3 456 0
 3263 0e68 7B68     		ldr	r3, [r7, #4]
 3264 0e6a 9B6A     		ldr	r3, [r3, #40]
 3265 0e6c 7A68     		ldr	r2, [r7, #4]
 3266 0e6e 0021     		movs	r1, #0
 3267 0e70 1000     		movs	r0, r2
 3268 0e72 9847     		blx	r3
 3269              	.LVL0:
 3270 0e74 0300     		movs	r3, r0
 3271 0e76 012B     		cmp	r3, #1
 3272 0e78 0CD1     		bne	.L173
 3273              	.LBB12:
 457:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		p2_score++;
 3274              		.loc 3 457 0
 3275 0e7a 134B     		ldr	r3, .L176
 3276 0e7c 1B78     		ldrb	r3, [r3]
 3277 0e7e 0133     		adds	r3, r3, #1
 3278 0e80 DAB2     		uxtb	r2, r3
 3279 0e82 114B     		ldr	r3, .L176
 3280 0e84 1A70     		strb	r2, [r3]
 458:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		resetBallPosition(o);
 3281              		.loc 3 458 0
 3282 0e86 7B68     		ldr	r3, [r7, #4]
 3283 0e88 1800     		movs	r0, r3
 3284 0e8a FFF7FEFF 		bl	resetBallPosition
 459:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		writeScore();
 3285              		.loc 3 459 0
 3286 0e8e FFF7FEFF 		bl	writeScore
 3287              	.LBE12:
 460:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	} else if ((o->pos_x_inbounds(o, 128) == 1)){
 461:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		p1_score++;
 462:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		resetBallPosition(o);
 463:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		writeScore();
 464:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	}
 465:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 3288              		.loc 3 465 0
 3289 0e92 14E0     		b	.L175
 3290              	.L173:
 460:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	} else if ((o->pos_x_inbounds(o, 128) == 1)){
 3291              		.loc 3 460 0
 3292 0e94 7B68     		ldr	r3, [r7, #4]
 3293 0e96 9B6A     		ldr	r3, [r3, #40]
 3294 0e98 7A68     		ldr	r2, [r7, #4]
 3295 0e9a 8021     		movs	r1, #128
 3296 0e9c 1000     		movs	r0, r2
 3297 0e9e 9847     		blx	r3
 3298              	.LVL1:
 3299 0ea0 0300     		movs	r3, r0
 3300 0ea2 012B     		cmp	r3, #1
 3301 0ea4 0BD1     		bne	.L175
 3302              	.LBB13:
 461:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		resetBallPosition(o);
 3303              		.loc 3 461 0
 3304 0ea6 094B     		ldr	r3, .L176+4
 3305 0ea8 1B78     		ldrb	r3, [r3]
 3306 0eaa 0133     		adds	r3, r3, #1
 3307 0eac DAB2     		uxtb	r2, r3
 3308 0eae 074B     		ldr	r3, .L176+4
 3309 0eb0 1A70     		strb	r2, [r3]
 462:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		writeScore();
 3310              		.loc 3 462 0
 3311 0eb2 7B68     		ldr	r3, [r7, #4]
 3312 0eb4 1800     		movs	r0, r3
 3313 0eb6 FFF7FEFF 		bl	resetBallPosition
 463:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	}
 3314              		.loc 3 463 0
 3315 0eba FFF7FEFF 		bl	writeScore
 3316              	.L175:
 3317              	.LBE13:
 3318              		.loc 3 465 0
 3319 0ebe C046     		nop
 3320 0ec0 BD46     		mov	sp, r7
 3321 0ec2 02B0     		add	sp, sp, #8
 3322              		@ sp needed
 3323 0ec4 80BD     		pop	{r7, pc}
 3324              	.L177:
 3325 0ec6 C046     		.align	2
 3326              	.L176:
 3327 0ec8 00000000 		.word	p2_score
 3328 0ecc 00000000 		.word	p1_score
 3329              		.cfi_endproc
 3330              	.LFE46:
 3332              		.align	1
 3333              		.global	resetBallPosition
 3334              		.syntax unified
 3335              		.code	16
 3336              		.thumb_func
 3337              		.fpu softvfp
 3339              	resetBallPosition:
 3340              	.LFB47:
 466:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 467:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void resetBallPosition(PPONGBALL o){
 3341              		.loc 3 467 0
 3342              		.cfi_startproc
 3343              		@ args = 0, pretend = 0, frame = 8
 3344              		@ frame_needed = 1, uses_anonymous_args = 0
 3345 0ed0 80B5     		push	{r7, lr}
 3346              		.cfi_def_cfa_offset 8
 3347              		.cfi_offset 7, -8
 3348              		.cfi_offset 14, -4
 3349 0ed2 82B0     		sub	sp, sp, #8
 3350              		.cfi_def_cfa_offset 16
 3351 0ed4 00AF     		add	r7, sp, #0
 3352              		.cfi_def_cfa_register 7
 3353 0ed6 7860     		str	r0, [r7, #4]
 468:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	o->clear(o);
 3354              		.loc 3 468 0
 3355 0ed8 7B68     		ldr	r3, [r7, #4]
 3356 0eda 9B69     		ldr	r3, [r3, #24]
 3357 0edc 7A68     		ldr	r2, [r7, #4]
 3358 0ede 1000     		movs	r0, r2
 3359 0ee0 9847     		blx	r3
 3360              	.LVL2:
 469:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	o->posx = 64;
 3361              		.loc 3 469 0
 3362 0ee2 7B68     		ldr	r3, [r7, #4]
 3363 0ee4 4022     		movs	r2, #64
 3364 0ee6 DA60     		str	r2, [r3, #12]
 470:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	o->posy = 32;
 3365              		.loc 3 470 0
 3366 0ee8 7B68     		ldr	r3, [r7, #4]
 3367 0eea 2022     		movs	r2, #32
 3368 0eec 1A61     		str	r2, [r3, #16]
 471:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	o->draw(o);
 3369              		.loc 3 471 0
 3370 0eee 7B68     		ldr	r3, [r7, #4]
 3371 0ef0 5B69     		ldr	r3, [r3, #20]
 3372 0ef2 7A68     		ldr	r2, [r7, #4]
 3373 0ef4 1000     		movs	r0, r2
 3374 0ef6 9847     		blx	r3
 3375              	.LVL3:
 472:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 3376              		.loc 3 472 0
 3377 0ef8 C046     		nop
 3378 0efa BD46     		mov	sp, r7
 3379 0efc 02B0     		add	sp, sp, #8
 3380              		@ sp needed
 3381 0efe 80BD     		pop	{r7, pc}
 3382              		.cfi_endproc
 3383              	.LFE47:
 3385              		.align	1
 3386              		.global	writeScore
 3387              		.syntax unified
 3388              		.code	16
 3389              		.thumb_func
 3390              		.fpu softvfp
 3392              	writeScore:
 3393              	.LFB48:
 473:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 474:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** void writeScore(){
 3394              		.loc 3 474 0
 3395              		.cfi_startproc
 3396              		@ args = 0, pretend = 0, frame = 0
 3397              		@ frame_needed = 1, uses_anonymous_args = 0
 3398 0f00 80B5     		push	{r7, lr}
 3399              		.cfi_def_cfa_offset 8
 3400              		.cfi_offset 7, -8
 3401              		.cfi_offset 14, -4
 3402 0f02 00AF     		add	r7, sp, #0
 3403              		.cfi_def_cfa_register 7
 475:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	//char *s;
 476:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //char test1[] = "0 - 0";
 477:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	ascii_gotoxy(9,1);
 3404              		.loc 3 477 0
 3405 0f04 0121     		movs	r1, #1
 3406 0f06 0920     		movs	r0, #9
 3407 0f08 FFF7FEFF 		bl	ascii_gotoxy
 478:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	ascii_write_char( p1_score + offset );
 3408              		.loc 3 478 0
 3409 0f0c 0E4B     		ldr	r3, .L180
 3410 0f0e 1A78     		ldrb	r2, [r3]
 3411 0f10 0E4B     		ldr	r3, .L180+4
 3412 0f12 1B78     		ldrb	r3, [r3]
 3413 0f14 D318     		adds	r3, r2, r3
 3414 0f16 DBB2     		uxtb	r3, r3
 3415 0f18 1800     		movs	r0, r3
 3416 0f1a FFF7FEFF 		bl	ascii_write_char
 479:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	ascii_write_char( 32 );
 3417              		.loc 3 479 0
 3418 0f1e 2020     		movs	r0, #32
 3419 0f20 FFF7FEFF 		bl	ascii_write_char
 480:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	ascii_write_char( 45 );
 3420              		.loc 3 480 0
 3421 0f24 2D20     		movs	r0, #45
 3422 0f26 FFF7FEFF 		bl	ascii_write_char
 481:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	ascii_write_char( 32 );
 3423              		.loc 3 481 0
 3424 0f2a 2020     		movs	r0, #32
 3425 0f2c FFF7FEFF 		bl	ascii_write_char
 482:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	ascii_write_char( p2_score + offset );
 3426              		.loc 3 482 0
 3427 0f30 074B     		ldr	r3, .L180+8
 3428 0f32 1A78     		ldrb	r2, [r3]
 3429 0f34 054B     		ldr	r3, .L180+4
 3430 0f36 1B78     		ldrb	r3, [r3]
 3431 0f38 D318     		adds	r3, r2, r3
 3432 0f3a DBB2     		uxtb	r3, r3
 3433 0f3c 1800     		movs	r0, r3
 3434 0f3e FFF7FEFF 		bl	ascii_write_char
 483:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     /*s = test1;
 484:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     while( *s )
 485:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         ascii_write_char( *s++ );*/
 486:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** }
 3435              		.loc 3 486 0
 3436 0f42 C046     		nop
 3437 0f44 BD46     		mov	sp, r7
 3438              		@ sp needed
 3439 0f46 80BD     		pop	{r7, pc}
 3440              	.L181:
 3441              		.align	2
 3442              	.L180:
 3443 0f48 00000000 		.word	p1_score
 3444 0f4c 00000000 		.word	offset
 3445 0f50 00000000 		.word	p2_score
 3446              		.cfi_endproc
 3447              	.LFE48:
 3449              		.global	ball_geometry
 3450              		.data
 3451 0001 000000   		.align	2
 3454              	ball_geometry:
 3455 0004 0C000000 		.word	12
 3456 0008 04000000 		.word	4
 3457 000c 04000000 		.word	4
 3458 0010 00       		.byte	0
 3459 0011 01       		.byte	1
 3460 0012 00       		.byte	0
 3461 0013 02       		.byte	2
 3462 0014 01       		.byte	1
 3463 0015 00       		.byte	0
 3464 0016 01       		.byte	1
 3465 0017 01       		.byte	1
 3466 0018 01       		.byte	1
 3467 0019 02       		.byte	2
 3468 001a 01       		.byte	1
 3469 001b 03       		.byte	3
 3470 001c 02       		.byte	2
 3471 001d 00       		.byte	0
 3472 001e 02       		.byte	2
 3473 001f 01       		.byte	1
 3474 0020 02       		.byte	2
 3475 0021 02       		.byte	2
 3476 0022 02       		.byte	2
 3477 0023 03       		.byte	3
 3478 0024 03       		.byte	3
 3479 0025 01       		.byte	1
 3480 0026 03       		.byte	3
 3481 0027 02       		.byte	2
 3482 0028 00000000 		.space	36
 3482      00000000 
 3482      00000000 
 3482      00000000 
 3482      00000000 
 3483              		.global	rect_geometry
 3484              		.align	2
 3487              	rect_geometry:
 3488 004c 1A000000 		.word	26
 3489 0050 02000000 		.word	2
 3490 0054 0D000000 		.word	13
 3491 0058 00       		.byte	0
 3492 0059 00       		.byte	0
 3493 005a 01       		.byte	1
 3494 005b 00       		.byte	0
 3495 005c 00       		.byte	0
 3496 005d 01       		.byte	1
 3497 005e 01       		.byte	1
 3498 005f 01       		.byte	1
 3499 0060 00       		.byte	0
 3500 0061 02       		.byte	2
 3501 0062 01       		.byte	1
 3502 0063 02       		.byte	2
 3503 0064 00       		.byte	0
 3504 0065 03       		.byte	3
 3505 0066 01       		.byte	1
 3506 0067 03       		.byte	3
 3507 0068 00       		.byte	0
 3508 0069 04       		.byte	4
 3509 006a 01       		.byte	1
 3510 006b 04       		.byte	4
 3511 006c 00       		.byte	0
 3512 006d 05       		.byte	5
 3513 006e 01       		.byte	1
 3514 006f 05       		.byte	5
 3515 0070 00       		.byte	0
 3516 0071 06       		.byte	6
 3517 0072 01       		.byte	1
 3518 0073 06       		.byte	6
 3519 0074 00       		.byte	0
 3520 0075 07       		.byte	7
 3521 0076 01       		.byte	1
 3522 0077 07       		.byte	7
 3523 0078 00       		.byte	0
 3524 0079 08       		.byte	8
 3525 007a 01       		.byte	1
 3526 007b 08       		.byte	8
 3527 007c 00       		.byte	0
 3528 007d 09       		.byte	9
 3529 007e 01       		.byte	1
 3530 007f 09       		.byte	9
 3531 0080 00       		.byte	0
 3532 0081 0A       		.byte	10
 3533 0082 01       		.byte	1
 3534 0083 0A       		.byte	10
 3535 0084 00       		.byte	0
 3536 0085 0B       		.byte	11
 3537 0086 01       		.byte	1
 3538 0087 0B       		.byte	11
 3539 0088 00       		.byte	0
 3540 0089 0C       		.byte	12
 3541 008a 01       		.byte	1
 3542 008b 0C       		.byte	12
 3543 008c 00000000 		.space	8
 3543      00000000 
 3544              		.align	2
 3547              	ball:
 3548 0094 00000000 		.word	ball_geometry
 3549 0098 01000000 		.word	1
 3550 009c 01000000 		.word	1
 3551 00a0 40000000 		.word	64
 3552 00a4 20000000 		.word	32
 3553 00a8 00000000 		.word	draw_object
 3554 00ac 00000000 		.word	clear_object
 3555 00b0 00000000 		.word	move_object
 3556 00b4 00000000 		.word	set_object_speed_x
 3557 00b8 00000000 		.word	set_object_speed_y
 3558 00bc 00000000 		.word	pos_x_pongball_inbounds
 3559 00c0 00000000 		.word	pos_y_pongball_inbounds
 3560              		.align	2
 3563              	racket_1:
 3564 00c4 00000000 		.word	rect_geometry
 3565 00c8 00000000 		.word	0
 3566 00cc 01000000 		.word	1
 3567 00d0 04000000 		.word	4
 3568 00d4 02000000 		.word	2
 3569 00d8 00000000 		.word	draw_racket
 3570 00dc 00000000 		.word	clear_racket
 3571 00e0 00000000 		.word	move_racket
 3572 00e4 00000000 		.word	set_racket_speed
 3573 00e8 00000000 		.word	pos_x_racket_inbounds
 3574 00ec 00000000 		.word	pos_y_racket_inbounds
 3575              		.align	2
 3578              	racket_2:
 3579 00f0 00000000 		.word	rect_geometry
 3580 00f4 00000000 		.word	0
 3581 00f8 01000000 		.word	1
 3582 00fc 7C000000 		.word	124
 3583 0100 02000000 		.word	2
 3584 0104 00000000 		.word	draw_racket
 3585 0108 00000000 		.word	clear_racket
 3586 010c 00000000 		.word	move_racket
 3587 0110 00000000 		.word	set_racket_speed
 3588 0114 00000000 		.word	pos_x_racket_inbounds
 3589 0118 00000000 		.word	pos_y_racket_inbounds
 3590              		.text
 3591              		.align	1
 3592              		.global	main
 3593              		.syntax unified
 3594              		.code	16
 3595              		.thumb_func
 3596              		.fpu softvfp
 3598              	main:
 3599              	.LFB49:
 487:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 488:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** GEOMETRY ball_geometry = 
 489:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 490:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     12,     /* numpoints*/
 491:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     4, 4,   /* sizex, sizey*/
 492:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     {
 493:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         /* px[0,1,2,3...]*/
 494:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {0,1}, {0,2}, {1,0}, {1,1}, {1,2},
 495:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {1,3}, {2,0}, {2,1}, {2,2}, {2,3},
 496:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         {3,1}, {3,2}
 497:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     }
 498:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** };
 499:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 500:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** GEOMETRY rect_geometry = {
 501:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	26,
 502:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	2, 13,
 503:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	{
 504:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,0},{1,0},
 505:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,1},{1,1},
 506:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,2},{1,2},
 507:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,3},{1,3},
 508:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,4},{1,4},
 509:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,5},{1,5},
 510:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,6},{1,6},
 511:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,7},{1,7},
 512:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,8},{1,8},
 513:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,9},{1,9},
 514:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,10},{1,10},
 515:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,11},{1,11},
 516:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		{0,12},{1,12},
 517:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	}
 518:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** };
 519:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     
 520:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static PONGBALL ball = 
 521:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 522:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     &ball_geometry, /* geometri för en boll */ 
 523:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     1, 1,           /* initiala riktningskoordinater */
 524:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     64, 32,           /* initial startposition */
 525:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     draw_object,
 526:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     clear_object,
 527:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     move_object,
 528:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     set_object_speed_x,
 529:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	set_object_speed_y,
 530:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	pos_x_pongball_inbounds,
 531:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	pos_y_pongball_inbounds
 532:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** };
 533:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 534:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static RACKET racket_1 = {
 535:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	&rect_geometry,
 536:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	0, 1,
 537:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	4, 2,
 538:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	draw_racket,
 539:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	clear_racket,
 540:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	move_racket,
 541:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	set_racket_speed,
 542:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	pos_x_racket_inbounds,
 543:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	pos_y_racket_inbounds
 544:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** };
 545:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 546:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** static RACKET racket_2 = {
 547:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	&rect_geometry,
 548:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	0, 1,
 549:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	124, 2,
 550:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	draw_racket,
 551:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	clear_racket,
 552:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	move_racket,
 553:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	set_racket_speed,
 554:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	pos_x_racket_inbounds,
 555:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	pos_y_racket_inbounds
 556:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** };
 557:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 558:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** int main(void)
 559:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** {
 3600              		.loc 3 559 0
 3601              		.cfi_startproc
 3602              		@ args = 0, pretend = 0, frame = 16
 3603              		@ frame_needed = 1, uses_anonymous_args = 0
 3604 0f54 90B5     		push	{r4, r7, lr}
 3605              		.cfi_def_cfa_offset 12
 3606              		.cfi_offset 4, -12
 3607              		.cfi_offset 7, -8
 3608              		.cfi_offset 14, -4
 3609 0f56 85B0     		sub	sp, sp, #20
 3610              		.cfi_def_cfa_offset 32
 3611 0f58 00AF     		add	r7, sp, #0
 3612              		.cfi_def_cfa_register 7
 560:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	char c;
 561:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
 562:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	init_app();
 3613              		.loc 3 562 0
 3614 0f5a FFF7FEFF 		bl	init_app
 563:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     ascii_init();
 3615              		.loc 3 563 0
 3616 0f5e FFF7FEFF 		bl	ascii_init
 564:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	writeScore();
 3617              		.loc 3 564 0
 3618 0f62 FFF7FEFF 		bl	writeScore
 565:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
 566:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     PPONGBALL p = &ball;
 3619              		.loc 3 566 0
 3620 0f66 294B     		ldr	r3, .L190
 3621 0f68 FB60     		str	r3, [r7, #12]
 567:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	PRACKET r1 = &racket_1;
 3622              		.loc 3 567 0
 3623 0f6a 294B     		ldr	r3, .L190+4
 3624 0f6c BB60     		str	r3, [r7, #8]
 568:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	PRACKET r2 = &racket_2;
 3625              		.loc 3 568 0
 3626 0f6e 294B     		ldr	r3, .L190+8
 3627 0f70 7B60     		str	r3, [r7, #4]
 569:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 	
 570:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     graphic_initalize(); 
 3628              		.loc 3 570 0
 3629 0f72 FFF7FEFF 		bl	graphic_initalize
 571:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //#ifndef SIMULATOR
 572:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         graphic_clearScreen();
 3630              		.loc 3 572 0
 3631 0f76 FFF7FEFF 		bl	graphic_clearScreen
 3632              	.L189:
 573:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     //#endif
 574:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 
 575:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     while( 1 ) 
 576:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****     {
 577:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		checkForGoals(p);
 3633              		.loc 3 577 0
 3634 0f7a FB68     		ldr	r3, [r7, #12]
 3635 0f7c 1800     		movs	r0, r3
 3636 0f7e FFF7FEFF 		bl	checkForGoals
 578:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         p->move(p, r1, r2);
 3637              		.loc 3 578 0
 3638 0f82 FB68     		ldr	r3, [r7, #12]
 3639 0f84 DB69     		ldr	r3, [r3, #28]
 3640 0f86 7A68     		ldr	r2, [r7, #4]
 3641 0f88 B968     		ldr	r1, [r7, #8]
 3642 0f8a F868     		ldr	r0, [r7, #12]
 3643 0f8c 9847     		blx	r3
 3644              	.LVL4:
 579:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		r1->move(r1);
 3645              		.loc 3 579 0
 3646 0f8e BB68     		ldr	r3, [r7, #8]
 3647 0f90 DB69     		ldr	r3, [r3, #28]
 3648 0f92 BA68     		ldr	r2, [r7, #8]
 3649 0f94 1000     		movs	r0, r2
 3650 0f96 9847     		blx	r3
 3651              	.LVL5:
 580:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		r2->move(r2);
 3652              		.loc 3 580 0
 3653 0f98 7B68     		ldr	r3, [r7, #4]
 3654 0f9a DB69     		ldr	r3, [r3, #28]
 3655 0f9c 7A68     		ldr	r2, [r7, #4]
 3656 0f9e 1000     		movs	r0, r2
 3657 0fa0 9847     		blx	r3
 3658              	.LVL6:
 581:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         //delay_milli(100000);/* 25 frames/sec */
 582:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		c = keyb((GPIO_D_INPUT+1), (GPIO_D_OUTPUT+1));
 3659              		.loc 3 582 0
 3660 0fa2 FC1C     		adds	r4, r7, #3
 3661 0fa4 1C4A     		ldr	r2, .L190+12
 3662 0fa6 1D4B     		ldr	r3, .L190+16
 3663 0fa8 1100     		movs	r1, r2
 3664 0faa 1800     		movs	r0, r3
 3665 0fac FFF7FEFF 		bl	keyb
 3666 0fb0 0300     		movs	r3, r0
 3667 0fb2 2370     		strb	r3, [r4]
 583:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 		switch (c){
 3668              		.loc 3 583 0
 3669 0fb4 FB1C     		adds	r3, r7, #3
 3670 0fb6 1B78     		ldrb	r3, [r3]
 3671 0fb8 012B     		cmp	r3, #1
 3672 0fba 08D0     		beq	.L184
 3673 0fbc 02DC     		bgt	.L185
 3674 0fbe 002B     		cmp	r3, #0
 3675 0fc0 1CD0     		beq	.L186
 3676 0fc2 22E0     		b	.L183
 3677              	.L185:
 3678 0fc4 052B     		cmp	r3, #5
 3679 0fc6 11D0     		beq	.L187
 3680 0fc8 072B     		cmp	r3, #7
 3681 0fca 08D0     		beq	.L188
 3682 0fcc 1DE0     		b	.L183
 3683              	.L184:
 584:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 			case 1: r1->set_speed(r1, -2); break;
 3684              		.loc 3 584 0
 3685 0fce BB68     		ldr	r3, [r7, #8]
 3686 0fd0 1B6A     		ldr	r3, [r3, #32]
 3687 0fd2 0222     		movs	r2, #2
 3688 0fd4 5142     		rsbs	r1, r2, #0
 3689 0fd6 BA68     		ldr	r2, [r7, #8]
 3690 0fd8 1000     		movs	r0, r2
 3691 0fda 9847     		blx	r3
 3692              	.LVL7:
 3693 0fdc 15E0     		b	.L183
 3694              	.L188:
 585:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 			case 7: r1->set_speed(r1, 2); break;
 3695              		.loc 3 585 0
 3696 0fde BB68     		ldr	r3, [r7, #8]
 3697 0fe0 1B6A     		ldr	r3, [r3, #32]
 3698 0fe2 BA68     		ldr	r2, [r7, #8]
 3699 0fe4 0221     		movs	r1, #2
 3700 0fe6 1000     		movs	r0, r2
 3701 0fe8 9847     		blx	r3
 3702              	.LVL8:
 3703 0fea 0EE0     		b	.L183
 3704              	.L187:
 586:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 			case 5: r2->set_speed(r2, -2); break;
 3705              		.loc 3 586 0
 3706 0fec 7B68     		ldr	r3, [r7, #4]
 3707 0fee 1B6A     		ldr	r3, [r3, #32]
 3708 0ff0 0222     		movs	r2, #2
 3709 0ff2 5142     		rsbs	r1, r2, #0
 3710 0ff4 7A68     		ldr	r2, [r7, #4]
 3711 0ff6 1000     		movs	r0, r2
 3712 0ff8 9847     		blx	r3
 3713              	.LVL9:
 3714 0ffa 06E0     		b	.L183
 3715              	.L186:
 587:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c **** 			case 0: r2->set_speed(r2, 2); break;
 3716              		.loc 3 587 0
 3717 0ffc 7B68     		ldr	r3, [r7, #4]
 3718 0ffe 1B6A     		ldr	r3, [r3, #32]
 3719 1000 7A68     		ldr	r2, [r7, #4]
 3720 1002 0221     		movs	r1, #2
 3721 1004 1000     		movs	r0, r2
 3722 1006 9847     		blx	r3
 3723              	.LVL10:
 3724 1008 C046     		nop
 3725              	.L183:
 577:C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working\startup.c ****         p->move(p, r1, r2);
 3726              		.loc 3 577 0
 3727 100a B6E7     		b	.L189
 3728              	.L191:
 3729              		.align	2
 3730              	.L190:
 3731 100c 94000000 		.word	ball
 3732 1010 C4000000 		.word	racket_1
 3733 1014 F0000000 		.word	racket_2
 3734 1018 150C0240 		.word	1073875989
 3735 101c 110C0240 		.word	1073875985
 3736              		.cfi_endproc
 3737              	.LFE49:
 3739              	.Letext0:
 3740              		.file 4 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/pong_working/geometry.h"
