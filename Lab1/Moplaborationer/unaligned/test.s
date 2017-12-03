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
  25              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** /*
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****  * 	startup.c
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****  *
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****  */
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** 
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** void startup ( void )
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** 	) ;
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	usage_fault_handler
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	usage_fault_handler:
  56              	.LFB1:
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** void usage_fault_handler(int num){
  57              		.loc 1 16 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 8
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 82B0     		sub	sp, sp, #8
  66              		.cfi_def_cfa_offset 16
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 7860     		str	r0, [r7, #4]
  70              	.L3:
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****     while(1);
  71              		.loc 1 17 0 discriminator 1
  72 0008 FEE7     		b	.L3
  73              		.cfi_endproc
  74              	.LFE1:
  76              		.align	1
  77              		.global	main
  78              		.syntax unified
  79              		.code	16
  80              		.thumb_func
  81              		.fpu softvfp
  83              	main:
  84              	.LFB2:
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****     }
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** void main(void)
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c **** {
  85              		.loc 1 20 0
  86              		.cfi_startproc
  87              		@ args = 0, pretend = 0, frame = 8
  88              		@ frame_needed = 1, uses_anonymous_args = 0
  89 000a 80B5     		push	{r7, lr}
  90              		.cfi_def_cfa_offset 8
  91              		.cfi_offset 7, -8
  92              		.cfi_offset 14, -4
  93 000c 82B0     		sub	sp, sp, #8
  94              		.cfi_def_cfa_offset 16
  95 000e 00AF     		add	r7, sp, #0
  96              		.cfi_def_cfa_register 7
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****     int *ip, i;
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****     *((void (**)(void) ) 0x2001c018) = usage_fault_handler;
  97              		.loc 1 22 0
  98 0010 024B     		ldr	r3, .L6
  99 0012 034A     		ldr	r2, .L6+4
 100 0014 1A60     		str	r2, [r3]
 101              	.L5:
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****     while(1){
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/unaligned\startup.c ****         ip = (int *) 0x20001001;
 102              		.loc 1 24 0 discriminator 1
 103 0016 034B     		ldr	r3, .L6+8
 104 0018 7B60     		str	r3, [r7, #4]
 105 001a FCE7     		b	.L5
 106              	.L7:
 107              		.align	2
 108              	.L6:
 109 001c 18C00120 		.word	536985624
 110 0020 00000000 		.word	usage_fault_handler
 111 0024 01100020 		.word	536875009
 112              		.cfi_endproc
 113              	.LFE2:
 115              	.Letext0:
