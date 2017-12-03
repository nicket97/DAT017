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
  15              		.comm	count,1,1
  16              		.comm	systick_flag,1,1
  17              		.global	isOn
  18              		.bss
  21              	isOn:
  22 0000 00       		.space	1
  23              		.section	.start_section,"ax",%progbits
  24              		.align	1
  25              		.global	startup
  26              		.syntax unified
  27              		.code	16
  28              		.thumb_func
  29              		.fpu softvfp
  31              	startup:
  32              	.LFB0:
  33              		.file 1 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2/startup.c"
   1:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
   2:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** /*
   3:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  * 	startup.c
   4:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  *
   5:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  */
   6:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
   7:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_D		0x40020C00
   8:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_D_ODR ((volatile unsigned char *)  0x40020C14)
   9:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define    HexDisplay	((volatile unsigned char*) GPIO_D+0x14)
  10:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define    portModer	((volatile unsigned int *) GPIO_D)
  11:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  
  12:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_E			0x40021000
  13:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_E_MODER	0x40021000
  14:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_E_OTYPER	0x40021004
  15:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_E_OSPEEDR	0x40021008
  16:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_E_PUPDR	0x4002100C
  17:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_E_INPUT	0x40021010
  18:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	GPIO_E_OUTPUT	0x40021014
  19:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define    FLIPFLOP	((volatile unsigned char*) GPIO_E+0x10)
  20:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  
  21:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	EXTI3_IRQ_BPOS 8
  22:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	EXTICR_BASE	0x40013800
  23:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	SYSCFG_EXTICR1	((volatile unsigned int *) (EXTICR_BASE + 8))
  24:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	EXTI_PR		((volatile unsigned int *) 0x40013C14)
  25:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	RCC			((volatile unsigned int *) 0x40023844)
  26:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  
  27:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	SYS_TICK	0xE000E010
  28:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	STK_CTRL	((volatile unsigned int *)SYS_TICK)
  29:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	STK_LOAD    ((volatile unsigned int *)(0xE000E014))
  30:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	STK_VAL     ((volatile unsigned int *)(0xE000E018))
  31:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  
  32:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  #define	DELAY_COUNT	1000000
  33:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  
  34:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  unsigned char count;
  35:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  char systick_flag;
  36:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  char isOn = 0;
  37:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****  
  38:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  39:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
  40:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void startup ( void )
  41:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** {
  34              		.loc 1 41 0
  35              		.cfi_startproc
  36              		@ Naked Function: prologue and epilogue provided by programmer.
  37              		@ args = 0, pretend = 0, frame = 0
  38              		@ frame_needed = 1, uses_anonymous_args = 0
  42:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** __asm volatile(
  39              		.loc 1 42 0
  40              		.syntax divided
  41              	@ 42 "C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2/startup.c" 1
  42 0000 0248     		 LDR R0,=0x2001C000
  43 0002 8546     	 MOV SP,R0
  44 0004 FFF7FEFF 	 BL main
  45 0008 FEE7     	.L1: B .L1
  46              	
  47              	@ 0 "" 2
  43:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  44:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	" MOV SP,R0\n"
  45:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	" BL main\n"				/* call main */
  46:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	".L1: B .L1\n"				/* never return */
  47:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	) ;
  48:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** }
  48              		.loc 1 48 0
  49              		.thumb
  50              		.syntax unified
  51 000a C046     		nop
  52              		.cfi_endproc
  53              	.LFE0:
  55              		.text
  56              		.align	1
  57              		.global	irq_handler
  58              		.syntax unified
  59              		.code	16
  60              		.thumb_func
  61              		.fpu softvfp
  63              	irq_handler:
  64              	.LFB1:
  49:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
  50:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void irq_handler(void){
  65              		.loc 1 50 0
  66              		.cfi_startproc
  67              		@ args = 0, pretend = 0, frame = 0
  68              		@ frame_needed = 1, uses_anonymous_args = 0
  69 0000 80B5     		push	{r7, lr}
  70              		.cfi_def_cfa_offset 8
  71              		.cfi_offset 7, -8
  72              		.cfi_offset 14, -4
  73 0002 00AF     		add	r7, sp, #0
  74              		.cfi_def_cfa_register 7
  51:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*GPIO_D_ODR = 0xFF;
  75              		.loc 1 51 0
  76 0004 1C4B     		ldr	r3, .L8
  77 0006 FF22     		movs	r2, #255
  78 0008 1A70     		strb	r2, [r3]
  52:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     if ((*EXTI_PR & EXTI3_IRQ_BPOS ) != 0)
  79              		.loc 1 52 0
  80 000a 1C4B     		ldr	r3, .L8+4
  81 000c 1B68     		ldr	r3, [r3]
  82 000e 0822     		movs	r2, #8
  83 0010 1340     		ands	r3, r2
  84 0012 2ED0     		beq	.L7
  53:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     {
  54:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		if((*FLIPFLOP & 1) != 0){
  85              		.loc 1 54 0
  86 0014 1A4B     		ldr	r3, .L8+8
  87 0016 1B78     		ldrb	r3, [r3]
  88 0018 DBB2     		uxtb	r3, r3
  89 001a 1A00     		movs	r2, r3
  90 001c 0123     		movs	r3, #1
  91 001e 1340     		ands	r3, r2
  92 0020 05D0     		beq	.L4
  55:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 			count++;
  93              		.loc 1 55 0
  94 0022 184B     		ldr	r3, .L8+12
  95 0024 1B78     		ldrb	r3, [r3]
  96 0026 0133     		adds	r3, r3, #1
  97 0028 DAB2     		uxtb	r2, r3
  98 002a 164B     		ldr	r3, .L8+12
  99 002c 1A70     		strb	r2, [r3]
 100              	.L4:
  56:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		}
  57:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		
  58:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		if((*FLIPFLOP & 2) != 0){
 101              		.loc 1 58 0
 102 002e 144B     		ldr	r3, .L8+8
 103 0030 1B78     		ldrb	r3, [r3]
 104 0032 DBB2     		uxtb	r3, r3
 105 0034 1A00     		movs	r2, r3
 106 0036 0223     		movs	r3, #2
 107 0038 1340     		ands	r3, r2
 108 003a 02D0     		beq	.L5
  59:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 			count = 0;
 109              		.loc 1 59 0
 110 003c 114B     		ldr	r3, .L8+12
 111 003e 0022     		movs	r2, #0
 112 0040 1A70     		strb	r2, [r3]
 113              	.L5:
  60:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		}
  61:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		
  62:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		if((*FLIPFLOP & 4) != 0){
 114              		.loc 1 62 0
 115 0042 0F4B     		ldr	r3, .L8+8
 116 0044 1B78     		ldrb	r3, [r3]
 117 0046 DBB2     		uxtb	r3, r3
 118 0048 1A00     		movs	r2, r3
 119 004a 0423     		movs	r3, #4
 120 004c 1340     		ands	r3, r2
 121 004e 01D0     		beq	.L6
 122              	.LBB2:
  63:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 			lightUp();
 123              		.loc 1 63 0
 124 0050 FFF7FEFF 		bl	lightUp
 125              	.L6:
 126              	.LBE2:
  64:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		}
  65:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		
  66:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_BPOS;
 127              		.loc 1 66 0
 128 0054 094B     		ldr	r3, .L8+4
 129 0056 094A     		ldr	r2, .L8+4
 130 0058 1268     		ldr	r2, [r2]
 131 005a 0821     		movs	r1, #8
 132 005c 0A43     		orrs	r2, r1
 133 005e 1A60     		str	r2, [r3]
  67:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT )= 0x70;
 134              		.loc 1 67 0
 135 0060 094B     		ldr	r3, .L8+16
 136 0062 7022     		movs	r2, #112
 137 0064 1A60     		str	r2, [r3]
  68:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		*((volatile unsigned int*) GPIO_E_OUTPUT) &= ~0x70; 
 138              		.loc 1 68 0
 139 0066 084B     		ldr	r3, .L8+16
 140 0068 074A     		ldr	r2, .L8+16
 141 006a 1268     		ldr	r2, [r2]
 142 006c 7021     		movs	r1, #112
 143 006e 8A43     		bics	r2, r1
 144 0070 1A60     		str	r2, [r3]
 145              	.L7:
  69:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     }
  70:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** }
 146              		.loc 1 70 0
 147 0072 C046     		nop
 148 0074 BD46     		mov	sp, r7
 149              		@ sp needed
 150 0076 80BD     		pop	{r7, pc}
 151              	.L9:
 152              		.align	2
 153              	.L8:
 154 0078 140C0240 		.word	1073875988
 155 007c 143C0140 		.word	1073822740
 156 0080 10100240 		.word	1073877008
 157 0084 00000000 		.word	count
 158 0088 14100240 		.word	1073877012
 159              		.cfi_endproc
 160              	.LFE1:
 162              		.align	1
 163              		.global	systick_irq_handler
 164              		.syntax unified
 165              		.code	16
 166              		.thumb_func
 167              		.fpu softvfp
 169              	systick_irq_handler:
 170              	.LFB2:
  71:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
  72:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void systick_irq_handler(void){
 171              		.loc 1 72 0
 172              		.cfi_startproc
 173              		@ args = 0, pretend = 0, frame = 0
 174              		@ frame_needed = 1, uses_anonymous_args = 0
 175 008c 80B5     		push	{r7, lr}
 176              		.cfi_def_cfa_offset 8
 177              		.cfi_offset 7, -8
 178              		.cfi_offset 14, -4
 179 008e 00AF     		add	r7, sp, #0
 180              		.cfi_def_cfa_register 7
  73:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*STK_CTRL = 0;
 181              		.loc 1 73 0
 182 0090 044B     		ldr	r3, .L11
 183 0092 0022     		movs	r2, #0
 184 0094 1A60     		str	r2, [r3]
  74:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	systick_flag = 1;
 185              		.loc 1 74 0
 186 0096 044B     		ldr	r3, .L11+4
 187 0098 0122     		movs	r2, #1
 188 009a 1A70     		strb	r2, [r3]
  75:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** }
 189              		.loc 1 75 0
 190 009c C046     		nop
 191 009e BD46     		mov	sp, r7
 192              		@ sp needed
 193 00a0 80BD     		pop	{r7, pc}
 194              	.L12:
 195 00a2 C046     		.align	2
 196              	.L11:
 197 00a4 10E000E0 		.word	-536813552
 198 00a8 00000000 		.word	systick_flag
 199              		.cfi_endproc
 200              	.LFE2:
 202              		.align	1
 203              		.global	init_app
 204              		.syntax unified
 205              		.code	16
 206              		.thumb_func
 207              		.fpu softvfp
 209              	init_app:
 210              	.LFB3:
  76:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
  77:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void init_app(void){
 211              		.loc 1 77 0
 212              		.cfi_startproc
 213              		@ args = 0, pretend = 0, frame = 0
 214              		@ frame_needed = 1, uses_anonymous_args = 0
 215 00ac 80B5     		push	{r7, lr}
 216              		.cfi_def_cfa_offset 8
 217              		.cfi_offset 7, -8
 218              		.cfi_offset 14, -4
 219 00ae 00AF     		add	r7, sp, #0
 220              		.cfi_def_cfa_register 7
  78:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//Output to 0-7 GPIO_D
  79:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*portModer = 0x00005555;
 221              		.loc 1 79 0
 222 00b0 1F4B     		ldr	r3, .L14
 223 00b2 204A     		ldr	r2, .L14+4
 224 00b4 1A60     		str	r2, [r3]
  80:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
  81:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	// port 0-7 -> Keypad
  82:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     *( (unsigned long *) GPIO_E_MODER) = 0x00005500;
 225              		.loc 1 82 0
 226 00b6 204B     		ldr	r3, .L14+8
 227 00b8 AA22     		movs	r2, #170
 228 00ba D201     		lsls	r2, r2, #7
 229 00bc 1A60     		str	r2, [r3]
  83:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
  84:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     //OTYPER bits 15-8 to push-pull
  85:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     *( (unsigned short *) GPIO_E_OTYPER) = 0x0000; //00000000
 230              		.loc 1 85 0
 231 00be 1F4B     		ldr	r3, .L14+12
 232 00c0 0022     		movs	r2, #0
 233 00c2 1A80     		strh	r2, [r3]
  86:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
  87:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//OSPEEDR high
  88:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*( (unsigned short *) GPIO_E_OSPEEDR) = 0x55555555; //00000000
 234              		.loc 1 88 0
 235 00c4 1E4B     		ldr	r3, .L14+16
 236 00c6 1B4A     		ldr	r2, .L14+4
 237 00c8 1A80     		strh	r2, [r3]
  89:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
  90:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     //PUPDR bits 23-16 to pull-down, rest to zero
  91:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     *( (unsigned long *) GPIO_E_PUPDR) = 0x00000000; //10101010 000000000 000000000
 238              		.loc 1 91 0
 239 00ca 1E4B     		ldr	r3, .L14+20
 240 00cc 0022     		movs	r2, #0
 241 00ce 1A60     		str	r2, [r3]
  92:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
  93:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//Activate clock for SYSCFG
  94:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*RCC |= 0x4000;
 242              		.loc 1 94 0
 243 00d0 1D4B     		ldr	r3, .L14+24
 244 00d2 1D4A     		ldr	r2, .L14+24
 245 00d4 1268     		ldr	r2, [r2]
 246 00d6 8021     		movs	r1, #128
 247 00d8 C901     		lsls	r1, r1, #7
 248 00da 0A43     		orrs	r2, r1
 249 00dc 1A60     		str	r2, [r3]
  95:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
  96:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//koppla PE3 till avbrottslina EXTI3
  97:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xFFF;
 250              		.loc 1 97 0
 251 00de 1B4B     		ldr	r3, .L14+28
 252 00e0 1A4A     		ldr	r2, .L14+28
 253 00e2 1268     		ldr	r2, [r2]
 254 00e4 120B     		lsrs	r2, r2, #12
 255 00e6 1203     		lsls	r2, r2, #12
 256 00e8 1A60     		str	r2, [r3]
  98:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
 257              		.loc 1 98 0
 258 00ea 184B     		ldr	r3, .L14+28
 259 00ec 174A     		ldr	r2, .L14+28
 260 00ee 1268     		ldr	r2, [r2]
 261 00f0 8021     		movs	r1, #128
 262 00f2 C901     		lsls	r1, r1, #7
 263 00f4 0A43     		orrs	r2, r1
 264 00f6 1A60     		str	r2, [r3]
  99:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
 100:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//konfigurera EXTI3 för att generera avbrott
 101:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//konfigurera för avbrott på negative flank
 102:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*((unsigned int *) 0x40013C00) |= 8;
 265              		.loc 1 102 0
 266 00f8 154B     		ldr	r3, .L14+32
 267 00fa 154A     		ldr	r2, .L14+32
 268 00fc 1268     		ldr	r2, [r2]
 269 00fe 0821     		movs	r1, #8
 270 0100 0A43     		orrs	r2, r1
 271 0102 1A60     		str	r2, [r3]
 103:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*((unsigned int *) 0x40013C0C) |= 8;
 272              		.loc 1 103 0
 273 0104 134B     		ldr	r3, .L14+36
 274 0106 134A     		ldr	r2, .L14+36
 275 0108 1268     		ldr	r2, [r2]
 276 010a 0821     		movs	r1, #8
 277 010c 0A43     		orrs	r2, r1
 278 010e 1A60     		str	r2, [r3]
 104:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
 105:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//sätt upp avbrottsvektor
 106:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*((void (**) (void) ) 0x2001C064 ) = irq_handler;
 279              		.loc 1 106 0
 280 0110 114B     		ldr	r3, .L14+40
 281 0112 124A     		ldr	r2, .L14+44
 282 0114 1A60     		str	r2, [r3]
 107:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//*((void (**) (void) ) 0x2001C03C ) = systick_irq_handler;
 108:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
 109:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//konfigurera de bitar i NVIC som kontrollerar den avbrottslina som EXTI3 kopplas till
 110:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//enable_interrupt();
 111:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 283              		.loc 1 111 0
 284 0116 124B     		ldr	r3, .L14+48
 285 0118 114A     		ldr	r2, .L14+48
 286 011a 1268     		ldr	r2, [r2]
 287 011c 8021     		movs	r1, #128
 288 011e 8900     		lsls	r1, r1, #2
 289 0120 0A43     		orrs	r2, r1
 290 0122 1A60     		str	r2, [r3]
 112:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
 113:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	count = 0;
 291              		.loc 1 113 0
 292 0124 0F4B     		ldr	r3, .L14+52
 293 0126 0022     		movs	r2, #0
 294 0128 1A70     		strb	r2, [r3]
 114:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** }
 295              		.loc 1 114 0
 296 012a C046     		nop
 297 012c BD46     		mov	sp, r7
 298              		@ sp needed
 299 012e 80BD     		pop	{r7, pc}
 300              	.L15:
 301              		.align	2
 302              	.L14:
 303 0130 000C0240 		.word	1073875968
 304 0134 55550000 		.word	21845
 305 0138 00100240 		.word	1073876992
 306 013c 04100240 		.word	1073876996
 307 0140 08100240 		.word	1073877000
 308 0144 0C100240 		.word	1073877004
 309 0148 44380240 		.word	1073887300
 310 014c 08380140 		.word	1073821704
 311 0150 003C0140 		.word	1073822720
 312 0154 0C3C0140 		.word	1073822732
 313 0158 64C00120 		.word	536985700
 314 015c 00000000 		.word	irq_handler
 315 0160 00E100E0 		.word	-536813312
 316 0164 00000000 		.word	count
 317              		.cfi_endproc
 318              	.LFE3:
 320              		.align	1
 321              		.global	delay_250ns
 322              		.syntax unified
 323              		.code	16
 324              		.thumb_func
 325              		.fpu softvfp
 327              	delay_250ns:
 328              	.LFB4:
 115:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
 116:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void delay_250ns(void){
 329              		.loc 1 116 0
 330              		.cfi_startproc
 331              		@ args = 0, pretend = 0, frame = 0
 332              		@ frame_needed = 1, uses_anonymous_args = 0
 333 0168 80B5     		push	{r7, lr}
 334              		.cfi_def_cfa_offset 8
 335              		.cfi_offset 7, -8
 336              		.cfi_offset 14, -4
 337 016a 00AF     		add	r7, sp, #0
 338              		.cfi_def_cfa_register 7
 117:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	//*((void (**)(void)) 0x2001C03C) = systick_irq_handler;
 118:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     systick_flag = 0;
 339              		.loc 1 118 0
 340 016c 084B     		ldr	r3, .L17
 341 016e 0022     		movs	r2, #0
 342 0170 1A70     		strb	r2, [r3]
 119:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     *STK_CTRL = 0;
 343              		.loc 1 119 0
 344 0172 084B     		ldr	r3, .L17+4
 345 0174 0022     		movs	r2, #0
 346 0176 1A60     		str	r2, [r3]
 120:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     *STK_LOAD = (168/4)-1;
 347              		.loc 1 120 0
 348 0178 074B     		ldr	r3, .L17+8
 349 017a 2922     		movs	r2, #41
 350 017c 1A60     		str	r2, [r3]
 121:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     *STK_VAL = 0;
 351              		.loc 1 121 0
 352 017e 074B     		ldr	r3, .L17+12
 353 0180 0022     		movs	r2, #0
 354 0182 1A60     		str	r2, [r3]
 122:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c ****     *STK_CTRL = 7;
 355              		.loc 1 122 0
 356 0184 034B     		ldr	r3, .L17+4
 357 0186 0722     		movs	r2, #7
 358 0188 1A60     		str	r2, [r3]
 123:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** }
 359              		.loc 1 123 0
 360 018a C046     		nop
 361 018c BD46     		mov	sp, r7
 362              		@ sp needed
 363 018e 80BD     		pop	{r7, pc}
 364              	.L18:
 365              		.align	2
 366              	.L17:
 367 0190 00000000 		.word	systick_flag
 368 0194 10E000E0 		.word	-536813552
 369 0198 14E000E0 		.word	-536813548
 370 019c 18E000E0 		.word	-536813544
 371              		.cfi_endproc
 372              	.LFE4:
 374              		.align	1
 375              		.global	delay
 376              		.syntax unified
 377              		.code	16
 378              		.thumb_func
 379              		.fpu softvfp
 381              	delay:
 382              	.LFB5:
 124:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
 125:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void delay(unsigned int count){
 383              		.loc 1 125 0
 384              		.cfi_startproc
 385              		@ args = 0, pretend = 0, frame = 16
 386              		@ frame_needed = 1, uses_anonymous_args = 0
 387 01a0 80B5     		push	{r7, lr}
 388              		.cfi_def_cfa_offset 8
 389              		.cfi_offset 7, -8
 390              		.cfi_offset 14, -4
 391 01a2 84B0     		sub	sp, sp, #16
 392              		.cfi_def_cfa_offset 24
 393 01a4 00AF     		add	r7, sp, #0
 394              		.cfi_def_cfa_register 7
 395 01a6 7860     		str	r0, [r7, #4]
 396              	.LBB3:
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	for(int i = 0; i < count; i++){
 397              		.loc 1 126 0
 398 01a8 0023     		movs	r3, #0
 399 01aa FB60     		str	r3, [r7, #12]
 400 01ac 09E0     		b	.L20
 401              	.L22:
 127:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		delay_250ns();
 402              		.loc 1 127 0
 403 01ae FFF7FEFF 		bl	delay_250ns
 128:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		while(systick_flag == 0);
 404              		.loc 1 128 0
 405 01b2 C046     		nop
 406              	.L21:
 407              		.loc 1 128 0 is_stmt 0 discriminator 1
 408 01b4 074B     		ldr	r3, .L23
 409 01b6 1B78     		ldrb	r3, [r3]
 410 01b8 002B     		cmp	r3, #0
 411 01ba FBD0     		beq	.L21
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	for(int i = 0; i < count; i++){
 412              		.loc 1 126 0 is_stmt 1 discriminator 2
 413 01bc FB68     		ldr	r3, [r7, #12]
 414 01be 0133     		adds	r3, r3, #1
 415 01c0 FB60     		str	r3, [r7, #12]
 416              	.L20:
 126:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	for(int i = 0; i < count; i++){
 417              		.loc 1 126 0 is_stmt 0 discriminator 1
 418 01c2 FA68     		ldr	r2, [r7, #12]
 419 01c4 7B68     		ldr	r3, [r7, #4]
 420 01c6 9A42     		cmp	r2, r3
 421 01c8 F1D3     		bcc	.L22
 422              	.LBE3:
 129:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	}
 130:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** }
 423              		.loc 1 130 0 is_stmt 1
 424 01ca C046     		nop
 425 01cc BD46     		mov	sp, r7
 426 01ce 04B0     		add	sp, sp, #16
 427              		@ sp needed
 428 01d0 80BD     		pop	{r7, pc}
 429              	.L24:
 430 01d2 C046     		.align	2
 431              	.L23:
 432 01d4 00000000 		.word	systick_flag
 433              		.cfi_endproc
 434              	.LFE5:
 436              		.align	1
 437              		.global	lightUp
 438              		.syntax unified
 439              		.code	16
 440              		.thumb_func
 441              		.fpu softvfp
 443              	lightUp:
 444              	.LFB6:
 131:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
 132:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void lightUp(void){
 445              		.loc 1 132 0
 446              		.cfi_startproc
 447              		@ args = 0, pretend = 0, frame = 0
 448              		@ frame_needed = 1, uses_anonymous_args = 0
 449 01d8 80B5     		push	{r7, lr}
 450              		.cfi_def_cfa_offset 8
 451              		.cfi_offset 7, -8
 452              		.cfi_offset 14, -4
 453 01da 00AF     		add	r7, sp, #0
 454              		.cfi_def_cfa_register 7
 133:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	if (isOn == 0){
 455              		.loc 1 133 0
 456 01dc 094B     		ldr	r3, .L29
 457 01de 1B78     		ldrb	r3, [r3]
 458 01e0 002B     		cmp	r3, #0
 459 01e2 06D1     		bne	.L26
 134:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		count = 0xFF;
 460              		.loc 1 134 0
 461 01e4 084B     		ldr	r3, .L29+4
 462 01e6 FF22     		movs	r2, #255
 463 01e8 1A70     		strb	r2, [r3]
 135:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		isOn = 1;
 464              		.loc 1 135 0
 465 01ea 064B     		ldr	r3, .L29
 466 01ec 0122     		movs	r2, #1
 467 01ee 1A70     		strb	r2, [r3]
 136:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	} else{
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		count = 0;
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		isOn = 0;
 139:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	}
 140:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** }
 468              		.loc 1 140 0
 469 01f0 05E0     		b	.L28
 470              	.L26:
 137:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		isOn = 0;
 471              		.loc 1 137 0
 472 01f2 054B     		ldr	r3, .L29+4
 473 01f4 0022     		movs	r2, #0
 474 01f6 1A70     		strb	r2, [r3]
 138:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	}
 475              		.loc 1 138 0
 476 01f8 024B     		ldr	r3, .L29
 477 01fa 0022     		movs	r2, #0
 478 01fc 1A70     		strb	r2, [r3]
 479              	.L28:
 480              		.loc 1 140 0
 481 01fe C046     		nop
 482 0200 BD46     		mov	sp, r7
 483              		@ sp needed
 484 0202 80BD     		pop	{r7, pc}
 485              	.L30:
 486              		.align	2
 487              	.L29:
 488 0204 00000000 		.word	isOn
 489 0208 00000000 		.word	count
 490              		.cfi_endproc
 491              	.LFE6:
 493              		.align	1
 494              		.global	main
 495              		.syntax unified
 496              		.code	16
 497              		.thumb_func
 498              		.fpu softvfp
 500              	main:
 501              	.LFB7:
 141:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 
 142:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** void main(void)
 143:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** {
 502              		.loc 1 143 0
 503              		.cfi_startproc
 504              		@ args = 0, pretend = 0, frame = 0
 505              		@ frame_needed = 1, uses_anonymous_args = 0
 506 020c 80B5     		push	{r7, lr}
 507              		.cfi_def_cfa_offset 8
 508              		.cfi_offset 7, -8
 509              		.cfi_offset 14, -4
 510 020e 00AF     		add	r7, sp, #0
 511              		.cfi_def_cfa_register 7
 144:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	init_app();
 512              		.loc 1 144 0
 513 0210 FFF7FEFF 		bl	init_app
 514              	.L32:
 145:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	
 146:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 	while(1){
 147:C:/Users/nicla/DAT017/Lab1/Moplaborationer/flipflop_irq_ack_2\startup.c **** 		*HexDisplay = count;
 515              		.loc 1 147 0 discriminator 1
 516 0214 024A     		ldr	r2, .L33
 517 0216 034B     		ldr	r3, .L33+4
 518 0218 1B78     		ldrb	r3, [r3]
 519 021a 1370     		strb	r3, [r2]
 520 021c FAE7     		b	.L32
 521              	.L34:
 522 021e C046     		.align	2
 523              	.L33:
 524 0220 140C0240 		.word	1073875988
 525 0224 00000000 		.word	count
 526              		.cfi_endproc
 527              	.LFE7:
 529              	.Letext0:
