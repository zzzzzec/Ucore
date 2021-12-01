
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	e8 70 02 00 00       	call   10027c <__x86.get_pc_thunk.bx>
  10000c:	81 c3 44 09 01 00    	add    $0x10944,%ebx
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100012:	c7 c0 a0 1d 11 00    	mov    $0x111da0,%eax
  100018:	89 c2                	mov    %eax,%edx
  10001a:	c7 c0 50 09 11 00    	mov    $0x110950,%eax
  100020:	29 c2                	sub    %eax,%edx
  100022:	89 d0                	mov    %edx,%eax
  100024:	83 ec 04             	sub    $0x4,%esp
  100027:	50                   	push   %eax
  100028:	6a 00                	push   $0x0
  10002a:	c7 c0 50 09 11 00    	mov    $0x110950,%eax
  100030:	50                   	push   %eax
  100031:	e8 12 31 00 00       	call   103148 <memset>
  100036:	83 c4 10             	add    $0x10,%esp
    cons_init();                // init the console
  100039:	e8 92 18 00 00       	call   1018d0 <cons_init>
    const char *message = "(THU.CST) os is loading ...";
  10003e:	8d 83 20 30 ff ff    	lea    -0xcfe0(%ebx),%eax
  100044:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100047:	83 ec 08             	sub    $0x8,%esp
  10004a:	ff 75 f4             	pushl  -0xc(%ebp)
  10004d:	8d 83 3c 30 ff ff    	lea    -0xcfc4(%ebx),%eax
  100053:	50                   	push   %eax
  100054:	e8 96 02 00 00       	call   1002ef <cprintf>
  100059:	83 c4 10             	add    $0x10,%esp
    print_kerninfo();
  10005c:	e8 ab 09 00 00       	call   100a0c <print_kerninfo>
    //grade_backtrace();
    //地址 0x102d20 回环
    pmm_init();                 // init physical memory management
  100061:	e8 44 2d 00 00       	call   102daa <pmm_init>
    pic_init();                 // init interrupt controller
  100066:	e8 f6 19 00 00       	call   101a61 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10006b:	e8 6b 1b 00 00       	call   101bdb <idt_init>

    clock_init();               // init clock interrupt
  100070:	e8 37 0f 00 00       	call   100fac <clock_init>
    intr_enable();              // enable irq interrupt 
  100075:	e8 3d 1b 00 00       	call   101bb7 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();
    /* do nothing */
    while (1){
  10007a:	eb fe                	jmp    10007a <kern_init+0x7a>

0010007c <grade_backtrace2>:
        
    }
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10007c:	55                   	push   %ebp
  10007d:	89 e5                	mov    %esp,%ebp
  10007f:	53                   	push   %ebx
  100080:	83 ec 04             	sub    $0x4,%esp
  100083:	e8 f0 01 00 00       	call   100278 <__x86.get_pc_thunk.ax>
  100088:	05 c8 08 01 00       	add    $0x108c8,%eax
    mon_backtrace(0, NULL, NULL);
  10008d:	83 ec 04             	sub    $0x4,%esp
  100090:	6a 00                	push   $0x0
  100092:	6a 00                	push   $0x0
  100094:	6a 00                	push   $0x0
  100096:	89 c3                	mov    %eax,%ebx
  100098:	e8 ec 0e 00 00       	call   100f89 <mon_backtrace>
  10009d:	83 c4 10             	add    $0x10,%esp
}
  1000a0:	90                   	nop
  1000a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a4:	c9                   	leave  
  1000a5:	c3                   	ret    

001000a6 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  1000a6:	55                   	push   %ebp
  1000a7:	89 e5                	mov    %esp,%ebp
  1000a9:	53                   	push   %ebx
  1000aa:	83 ec 04             	sub    $0x4,%esp
  1000ad:	e8 c6 01 00 00       	call   100278 <__x86.get_pc_thunk.ax>
  1000b2:	05 9e 08 01 00       	add    $0x1089e,%eax
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000b7:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000ba:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000bd:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1000c3:	51                   	push   %ecx
  1000c4:	52                   	push   %edx
  1000c5:	53                   	push   %ebx
  1000c6:	50                   	push   %eax
  1000c7:	e8 b0 ff ff ff       	call   10007c <grade_backtrace2>
  1000cc:	83 c4 10             	add    $0x10,%esp
}
  1000cf:	90                   	nop
  1000d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000d3:	c9                   	leave  
  1000d4:	c3                   	ret    

001000d5 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000d5:	55                   	push   %ebp
  1000d6:	89 e5                	mov    %esp,%ebp
  1000d8:	83 ec 08             	sub    $0x8,%esp
  1000db:	e8 98 01 00 00       	call   100278 <__x86.get_pc_thunk.ax>
  1000e0:	05 70 08 01 00       	add    $0x10870,%eax
    grade_backtrace1(arg0, arg2);
  1000e5:	83 ec 08             	sub    $0x8,%esp
  1000e8:	ff 75 10             	pushl  0x10(%ebp)
  1000eb:	ff 75 08             	pushl  0x8(%ebp)
  1000ee:	e8 b3 ff ff ff       	call   1000a6 <grade_backtrace1>
  1000f3:	83 c4 10             	add    $0x10,%esp
}
  1000f6:	90                   	nop
  1000f7:	c9                   	leave  
  1000f8:	c3                   	ret    

001000f9 <grade_backtrace>:

void
grade_backtrace(void) {
  1000f9:	55                   	push   %ebp
  1000fa:	89 e5                	mov    %esp,%ebp
  1000fc:	83 ec 08             	sub    $0x8,%esp
  1000ff:	e8 74 01 00 00       	call   100278 <__x86.get_pc_thunk.ax>
  100104:	05 4c 08 01 00       	add    $0x1084c,%eax
    grade_backtrace0(0x11111111,0x22222222,0x33333333);
  100109:	83 ec 04             	sub    $0x4,%esp
  10010c:	68 33 33 33 33       	push   $0x33333333
  100111:	68 22 22 22 22       	push   $0x22222222
  100116:	68 11 11 11 11       	push   $0x11111111
  10011b:	e8 b5 ff ff ff       	call   1000d5 <grade_backtrace0>
  100120:	83 c4 10             	add    $0x10,%esp
}
  100123:	90                   	nop
  100124:	c9                   	leave  
  100125:	c3                   	ret    

00100126 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100126:	55                   	push   %ebp
  100127:	89 e5                	mov    %esp,%ebp
  100129:	53                   	push   %ebx
  10012a:	83 ec 14             	sub    $0x14,%esp
  10012d:	e8 4a 01 00 00       	call   10027c <__x86.get_pc_thunk.bx>
  100132:	81 c3 1e 08 01 00    	add    $0x1081e,%ebx
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100138:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10013b:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10013e:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100141:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100144:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100148:	0f b7 c0             	movzwl %ax,%eax
  10014b:	83 e0 03             	and    $0x3,%eax
  10014e:	89 c2                	mov    %eax,%edx
  100150:	8b 83 30 01 00 00    	mov    0x130(%ebx),%eax
  100156:	83 ec 04             	sub    $0x4,%esp
  100159:	52                   	push   %edx
  10015a:	50                   	push   %eax
  10015b:	8d 83 41 30 ff ff    	lea    -0xcfbf(%ebx),%eax
  100161:	50                   	push   %eax
  100162:	e8 88 01 00 00       	call   1002ef <cprintf>
  100167:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10016a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10016e:	0f b7 d0             	movzwl %ax,%edx
  100171:	8b 83 30 01 00 00    	mov    0x130(%ebx),%eax
  100177:	83 ec 04             	sub    $0x4,%esp
  10017a:	52                   	push   %edx
  10017b:	50                   	push   %eax
  10017c:	8d 83 4f 30 ff ff    	lea    -0xcfb1(%ebx),%eax
  100182:	50                   	push   %eax
  100183:	e8 67 01 00 00       	call   1002ef <cprintf>
  100188:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  10018b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10018f:	0f b7 d0             	movzwl %ax,%edx
  100192:	8b 83 30 01 00 00    	mov    0x130(%ebx),%eax
  100198:	83 ec 04             	sub    $0x4,%esp
  10019b:	52                   	push   %edx
  10019c:	50                   	push   %eax
  10019d:	8d 83 5d 30 ff ff    	lea    -0xcfa3(%ebx),%eax
  1001a3:	50                   	push   %eax
  1001a4:	e8 46 01 00 00       	call   1002ef <cprintf>
  1001a9:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  1001ac:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1001b0:	0f b7 d0             	movzwl %ax,%edx
  1001b3:	8b 83 30 01 00 00    	mov    0x130(%ebx),%eax
  1001b9:	83 ec 04             	sub    $0x4,%esp
  1001bc:	52                   	push   %edx
  1001bd:	50                   	push   %eax
  1001be:	8d 83 6b 30 ff ff    	lea    -0xcf95(%ebx),%eax
  1001c4:	50                   	push   %eax
  1001c5:	e8 25 01 00 00       	call   1002ef <cprintf>
  1001ca:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  1001cd:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001d1:	0f b7 d0             	movzwl %ax,%edx
  1001d4:	8b 83 30 01 00 00    	mov    0x130(%ebx),%eax
  1001da:	83 ec 04             	sub    $0x4,%esp
  1001dd:	52                   	push   %edx
  1001de:	50                   	push   %eax
  1001df:	8d 83 79 30 ff ff    	lea    -0xcf87(%ebx),%eax
  1001e5:	50                   	push   %eax
  1001e6:	e8 04 01 00 00       	call   1002ef <cprintf>
  1001eb:	83 c4 10             	add    $0x10,%esp
    round ++;
  1001ee:	8b 83 30 01 00 00    	mov    0x130(%ebx),%eax
  1001f4:	83 c0 01             	add    $0x1,%eax
  1001f7:	89 83 30 01 00 00    	mov    %eax,0x130(%ebx)
}
  1001fd:	90                   	nop
  1001fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100201:	c9                   	leave  
  100202:	c3                   	ret    

00100203 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  100203:	55                   	push   %ebp
  100204:	89 e5                	mov    %esp,%ebp
  100206:	e8 6d 00 00 00       	call   100278 <__x86.get_pc_thunk.ax>
  10020b:	05 45 07 01 00       	add    $0x10745,%eax
    //LAB1 CHALLENGE 1 : TODO
}
  100210:	90                   	nop
  100211:	5d                   	pop    %ebp
  100212:	c3                   	ret    

00100213 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  100213:	55                   	push   %ebp
  100214:	89 e5                	mov    %esp,%ebp
  100216:	e8 5d 00 00 00       	call   100278 <__x86.get_pc_thunk.ax>
  10021b:	05 35 07 01 00       	add    $0x10735,%eax
    //LAB1 CHALLENGE 1 :  TODO
}
  100220:	90                   	nop
  100221:	5d                   	pop    %ebp
  100222:	c3                   	ret    

00100223 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  100223:	55                   	push   %ebp
  100224:	89 e5                	mov    %esp,%ebp
  100226:	53                   	push   %ebx
  100227:	83 ec 04             	sub    $0x4,%esp
  10022a:	e8 4d 00 00 00       	call   10027c <__x86.get_pc_thunk.bx>
  10022f:	81 c3 21 07 01 00    	add    $0x10721,%ebx
    lab1_print_cur_status();
  100235:	e8 ec fe ff ff       	call   100126 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  10023a:	83 ec 0c             	sub    $0xc,%esp
  10023d:	8d 83 88 30 ff ff    	lea    -0xcf78(%ebx),%eax
  100243:	50                   	push   %eax
  100244:	e8 a6 00 00 00       	call   1002ef <cprintf>
  100249:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  10024c:	e8 b2 ff ff ff       	call   100203 <lab1_switch_to_user>
    lab1_print_cur_status();
  100251:	e8 d0 fe ff ff       	call   100126 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  100256:	83 ec 0c             	sub    $0xc,%esp
  100259:	8d 83 a8 30 ff ff    	lea    -0xcf58(%ebx),%eax
  10025f:	50                   	push   %eax
  100260:	e8 8a 00 00 00       	call   1002ef <cprintf>
  100265:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  100268:	e8 a6 ff ff ff       	call   100213 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  10026d:	e8 b4 fe ff ff       	call   100126 <lab1_print_cur_status>
}
  100272:	90                   	nop
  100273:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100276:	c9                   	leave  
  100277:	c3                   	ret    

00100278 <__x86.get_pc_thunk.ax>:
  100278:	8b 04 24             	mov    (%esp),%eax
  10027b:	c3                   	ret    

0010027c <__x86.get_pc_thunk.bx>:
  10027c:	8b 1c 24             	mov    (%esp),%ebx
  10027f:	c3                   	ret    

00100280 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100280:	55                   	push   %ebp
  100281:	89 e5                	mov    %esp,%ebp
  100283:	53                   	push   %ebx
  100284:	83 ec 04             	sub    $0x4,%esp
  100287:	e8 ec ff ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10028c:	05 c4 06 01 00       	add    $0x106c4,%eax
    cons_putc(c);
  100291:	83 ec 0c             	sub    $0xc,%esp
  100294:	ff 75 08             	pushl  0x8(%ebp)
  100297:	89 c3                	mov    %eax,%ebx
  100299:	e8 75 16 00 00       	call   101913 <cons_putc>
  10029e:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1002a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002a4:	8b 00                	mov    (%eax),%eax
  1002a6:	8d 50 01             	lea    0x1(%eax),%edx
  1002a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ac:	89 10                	mov    %edx,(%eax)
}
  1002ae:	90                   	nop
  1002af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002b2:	c9                   	leave  
  1002b3:	c3                   	ret    

001002b4 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002b4:	55                   	push   %ebp
  1002b5:	89 e5                	mov    %esp,%ebp
  1002b7:	53                   	push   %ebx
  1002b8:	83 ec 14             	sub    $0x14,%esp
  1002bb:	e8 b8 ff ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1002c0:	05 90 06 01 00       	add    $0x10690,%eax
    int cnt = 0;
  1002c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002cc:	ff 75 0c             	pushl  0xc(%ebp)
  1002cf:	ff 75 08             	pushl  0x8(%ebp)
  1002d2:	8d 55 f4             	lea    -0xc(%ebp),%edx
  1002d5:	52                   	push   %edx
  1002d6:	8d 90 30 f9 fe ff    	lea    -0x106d0(%eax),%edx
  1002dc:	52                   	push   %edx
  1002dd:	89 c3                	mov    %eax,%ebx
  1002df:	e8 eb 31 00 00       	call   1034cf <vprintfmt>
  1002e4:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002ed:	c9                   	leave  
  1002ee:	c3                   	ret    

001002ef <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  1002ef:	55                   	push   %ebp
  1002f0:	89 e5                	mov    %esp,%ebp
  1002f2:	83 ec 18             	sub    $0x18,%esp
  1002f5:	e8 7e ff ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1002fa:	05 56 06 01 00       	add    $0x10656,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1002ff:	8d 45 0c             	lea    0xc(%ebp),%eax
  100302:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100305:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100308:	83 ec 08             	sub    $0x8,%esp
  10030b:	50                   	push   %eax
  10030c:	ff 75 08             	pushl  0x8(%ebp)
  10030f:	e8 a0 ff ff ff       	call   1002b4 <vcprintf>
  100314:	83 c4 10             	add    $0x10,%esp
  100317:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10031a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10031d:	c9                   	leave  
  10031e:	c3                   	ret    

0010031f <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10031f:	55                   	push   %ebp
  100320:	89 e5                	mov    %esp,%ebp
  100322:	53                   	push   %ebx
  100323:	83 ec 04             	sub    $0x4,%esp
  100326:	e8 4d ff ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10032b:	05 25 06 01 00       	add    $0x10625,%eax
    cons_putc(c);
  100330:	83 ec 0c             	sub    $0xc,%esp
  100333:	ff 75 08             	pushl  0x8(%ebp)
  100336:	89 c3                	mov    %eax,%ebx
  100338:	e8 d6 15 00 00       	call   101913 <cons_putc>
  10033d:	83 c4 10             	add    $0x10,%esp
}
  100340:	90                   	nop
  100341:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100344:	c9                   	leave  
  100345:	c3                   	ret    

00100346 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100346:	55                   	push   %ebp
  100347:	89 e5                	mov    %esp,%ebp
  100349:	83 ec 18             	sub    $0x18,%esp
  10034c:	e8 27 ff ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  100351:	05 ff 05 01 00       	add    $0x105ff,%eax
    int cnt = 0;
  100356:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10035d:	eb 14                	jmp    100373 <cputs+0x2d>
        cputch(c, &cnt);
  10035f:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100363:	83 ec 08             	sub    $0x8,%esp
  100366:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100369:	52                   	push   %edx
  10036a:	50                   	push   %eax
  10036b:	e8 10 ff ff ff       	call   100280 <cputch>
  100370:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  100373:	8b 45 08             	mov    0x8(%ebp),%eax
  100376:	8d 50 01             	lea    0x1(%eax),%edx
  100379:	89 55 08             	mov    %edx,0x8(%ebp)
  10037c:	0f b6 00             	movzbl (%eax),%eax
  10037f:	88 45 f7             	mov    %al,-0x9(%ebp)
  100382:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100386:	75 d7                	jne    10035f <cputs+0x19>
    }
    cputch('\n', &cnt);
  100388:	83 ec 08             	sub    $0x8,%esp
  10038b:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10038e:	50                   	push   %eax
  10038f:	6a 0a                	push   $0xa
  100391:	e8 ea fe ff ff       	call   100280 <cputch>
  100396:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100399:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  10039c:	c9                   	leave  
  10039d:	c3                   	ret    

0010039e <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039e:	55                   	push   %ebp
  10039f:	89 e5                	mov    %esp,%ebp
  1003a1:	53                   	push   %ebx
  1003a2:	83 ec 14             	sub    $0x14,%esp
  1003a5:	e8 d2 fe ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  1003aa:	81 c3 a6 05 01 00    	add    $0x105a6,%ebx
    int c;
    while ((c = cons_getc()) == 0)
  1003b0:	90                   	nop
  1003b1:	e8 97 15 00 00       	call   10194d <cons_getc>
  1003b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003bd:	74 f2                	je     1003b1 <getchar+0x13>
        /* do nothing */;
    return c;
  1003bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003c2:	83 c4 14             	add    $0x14,%esp
  1003c5:	5b                   	pop    %ebx
  1003c6:	5d                   	pop    %ebp
  1003c7:	c3                   	ret    

001003c8 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1003c8:	55                   	push   %ebp
  1003c9:	89 e5                	mov    %esp,%ebp
  1003cb:	53                   	push   %ebx
  1003cc:	83 ec 14             	sub    $0x14,%esp
  1003cf:	e8 a8 fe ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  1003d4:	81 c3 7c 05 01 00    	add    $0x1057c,%ebx
    if (prompt != NULL) {
  1003da:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1003de:	74 15                	je     1003f5 <readline+0x2d>
        cprintf("%s", prompt);
  1003e0:	83 ec 08             	sub    $0x8,%esp
  1003e3:	ff 75 08             	pushl  0x8(%ebp)
  1003e6:	8d 83 c7 30 ff ff    	lea    -0xcf39(%ebx),%eax
  1003ec:	50                   	push   %eax
  1003ed:	e8 fd fe ff ff       	call   1002ef <cprintf>
  1003f2:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  1003f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  1003fc:	e8 9d ff ff ff       	call   10039e <getchar>
  100401:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100404:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100408:	79 0a                	jns    100414 <readline+0x4c>
            return NULL;
  10040a:	b8 00 00 00 00       	mov    $0x0,%eax
  10040f:	e9 87 00 00 00       	jmp    10049b <readline+0xd3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100414:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100418:	7e 2c                	jle    100446 <readline+0x7e>
  10041a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100421:	7f 23                	jg     100446 <readline+0x7e>
            cputchar(c);
  100423:	83 ec 0c             	sub    $0xc,%esp
  100426:	ff 75 f0             	pushl  -0x10(%ebp)
  100429:	e8 f1 fe ff ff       	call   10031f <cputchar>
  10042e:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100431:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100434:	8d 50 01             	lea    0x1(%eax),%edx
  100437:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10043a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10043d:	88 94 03 50 01 00 00 	mov    %dl,0x150(%ebx,%eax,1)
  100444:	eb 50                	jmp    100496 <readline+0xce>
        }
        else if (c == '\b' && i > 0) {
  100446:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10044a:	75 1a                	jne    100466 <readline+0x9e>
  10044c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100450:	7e 14                	jle    100466 <readline+0x9e>
            cputchar(c);
  100452:	83 ec 0c             	sub    $0xc,%esp
  100455:	ff 75 f0             	pushl  -0x10(%ebp)
  100458:	e8 c2 fe ff ff       	call   10031f <cputchar>
  10045d:	83 c4 10             	add    $0x10,%esp
            i --;
  100460:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100464:	eb 30                	jmp    100496 <readline+0xce>
        }
        else if (c == '\n' || c == '\r') {
  100466:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10046a:	74 06                	je     100472 <readline+0xaa>
  10046c:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100470:	75 8a                	jne    1003fc <readline+0x34>
            cputchar(c);
  100472:	83 ec 0c             	sub    $0xc,%esp
  100475:	ff 75 f0             	pushl  -0x10(%ebp)
  100478:	e8 a2 fe ff ff       	call   10031f <cputchar>
  10047d:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  100480:	8d 93 50 01 00 00    	lea    0x150(%ebx),%edx
  100486:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100489:	01 d0                	add    %edx,%eax
  10048b:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  10048e:	8d 83 50 01 00 00    	lea    0x150(%ebx),%eax
  100494:	eb 05                	jmp    10049b <readline+0xd3>
        c = getchar();
  100496:	e9 61 ff ff ff       	jmp    1003fc <readline+0x34>
        }
    }
}
  10049b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10049e:	c9                   	leave  
  10049f:	c3                   	ret    

001004a0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1004a0:	55                   	push   %ebp
  1004a1:	89 e5                	mov    %esp,%ebp
  1004a3:	53                   	push   %ebx
  1004a4:	83 ec 14             	sub    $0x14,%esp
  1004a7:	e8 d0 fd ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  1004ac:	81 c3 a4 04 01 00    	add    $0x104a4,%ebx
    if (is_panic) {
  1004b2:	8b 83 50 05 00 00    	mov    0x550(%ebx),%eax
  1004b8:	85 c0                	test   %eax,%eax
  1004ba:	75 4e                	jne    10050a <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1004bc:	c7 83 50 05 00 00 01 	movl   $0x1,0x550(%ebx)
  1004c3:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1004c6:	8d 45 14             	lea    0x14(%ebp),%eax
  1004c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1004cc:	83 ec 04             	sub    $0x4,%esp
  1004cf:	ff 75 0c             	pushl  0xc(%ebp)
  1004d2:	ff 75 08             	pushl  0x8(%ebp)
  1004d5:	8d 83 ca 30 ff ff    	lea    -0xcf36(%ebx),%eax
  1004db:	50                   	push   %eax
  1004dc:	e8 0e fe ff ff       	call   1002ef <cprintf>
  1004e1:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1004e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004e7:	83 ec 08             	sub    $0x8,%esp
  1004ea:	50                   	push   %eax
  1004eb:	ff 75 10             	pushl  0x10(%ebp)
  1004ee:	e8 c1 fd ff ff       	call   1002b4 <vcprintf>
  1004f3:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1004f6:	83 ec 0c             	sub    $0xc,%esp
  1004f9:	8d 83 e6 30 ff ff    	lea    -0xcf1a(%ebx),%eax
  1004ff:	50                   	push   %eax
  100500:	e8 ea fd ff ff       	call   1002ef <cprintf>
  100505:	83 c4 10             	add    $0x10,%esp
  100508:	eb 01                	jmp    10050b <__panic+0x6b>
        goto panic_dead;
  10050a:	90                   	nop
    va_end(ap);

panic_dead:
    intr_disable();
  10050b:	e8 b9 16 00 00       	call   101bc9 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100510:	83 ec 0c             	sub    $0xc,%esp
  100513:	6a 00                	push   $0x0
  100515:	e8 55 09 00 00       	call   100e6f <kmonitor>
  10051a:	83 c4 10             	add    $0x10,%esp
  10051d:	eb f1                	jmp    100510 <__panic+0x70>

0010051f <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  10051f:	55                   	push   %ebp
  100520:	89 e5                	mov    %esp,%ebp
  100522:	53                   	push   %ebx
  100523:	83 ec 14             	sub    $0x14,%esp
  100526:	e8 51 fd ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  10052b:	81 c3 25 04 01 00    	add    $0x10425,%ebx
    va_list ap;
    va_start(ap, fmt);
  100531:	8d 45 14             	lea    0x14(%ebp),%eax
  100534:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100537:	83 ec 04             	sub    $0x4,%esp
  10053a:	ff 75 0c             	pushl  0xc(%ebp)
  10053d:	ff 75 08             	pushl  0x8(%ebp)
  100540:	8d 83 e8 30 ff ff    	lea    -0xcf18(%ebx),%eax
  100546:	50                   	push   %eax
  100547:	e8 a3 fd ff ff       	call   1002ef <cprintf>
  10054c:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  10054f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100552:	83 ec 08             	sub    $0x8,%esp
  100555:	50                   	push   %eax
  100556:	ff 75 10             	pushl  0x10(%ebp)
  100559:	e8 56 fd ff ff       	call   1002b4 <vcprintf>
  10055e:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100561:	83 ec 0c             	sub    $0xc,%esp
  100564:	8d 83 e6 30 ff ff    	lea    -0xcf1a(%ebx),%eax
  10056a:	50                   	push   %eax
  10056b:	e8 7f fd ff ff       	call   1002ef <cprintf>
  100570:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100573:	90                   	nop
  100574:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100577:	c9                   	leave  
  100578:	c3                   	ret    

00100579 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100579:	55                   	push   %ebp
  10057a:	89 e5                	mov    %esp,%ebp
  10057c:	e8 f7 fc ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  100581:	05 cf 03 01 00       	add    $0x103cf,%eax
    return is_panic;
  100586:	8b 80 50 05 00 00    	mov    0x550(%eax),%eax
}
  10058c:	5d                   	pop    %ebp
  10058d:	c3                   	ret    

0010058e <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  10058e:	55                   	push   %ebp
  10058f:	89 e5                	mov    %esp,%ebp
  100591:	83 ec 20             	sub    $0x20,%esp
  100594:	e8 df fc ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  100599:	05 b7 03 01 00       	add    $0x103b7,%eax
    int l = *region_left, r = *region_right, any_matches = 0;
  10059e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005a1:	8b 00                	mov    (%eax),%eax
  1005a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1005a6:	8b 45 10             	mov    0x10(%ebp),%eax
  1005a9:	8b 00                	mov    (%eax),%eax
  1005ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1005b5:	e9 d2 00 00 00       	jmp    10068c <stab_binsearch+0xfe>
        int true_m = (l + r) / 2, m = true_m;
  1005ba:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1005c0:	01 d0                	add    %edx,%eax
  1005c2:	89 c2                	mov    %eax,%edx
  1005c4:	c1 ea 1f             	shr    $0x1f,%edx
  1005c7:	01 d0                	add    %edx,%eax
  1005c9:	d1 f8                	sar    %eax
  1005cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1005ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1005d1:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1005d4:	eb 04                	jmp    1005da <stab_binsearch+0x4c>
            m --;
  1005d6:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1005da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005e0:	7c 1f                	jl     100601 <stab_binsearch+0x73>
  1005e2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005e5:	89 d0                	mov    %edx,%eax
  1005e7:	01 c0                	add    %eax,%eax
  1005e9:	01 d0                	add    %edx,%eax
  1005eb:	c1 e0 02             	shl    $0x2,%eax
  1005ee:	89 c2                	mov    %eax,%edx
  1005f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f3:	01 d0                	add    %edx,%eax
  1005f5:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005f9:	0f b6 c0             	movzbl %al,%eax
  1005fc:	39 45 14             	cmp    %eax,0x14(%ebp)
  1005ff:	75 d5                	jne    1005d6 <stab_binsearch+0x48>
        }
        if (m < l) {    // no match in [l, m]
  100601:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100604:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100607:	7d 0b                	jge    100614 <stab_binsearch+0x86>
            l = true_m + 1;
  100609:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10060c:	83 c0 01             	add    $0x1,%eax
  10060f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100612:	eb 78                	jmp    10068c <stab_binsearch+0xfe>
        }

        // actual binary search
        any_matches = 1;
  100614:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10061b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10061e:	89 d0                	mov    %edx,%eax
  100620:	01 c0                	add    %eax,%eax
  100622:	01 d0                	add    %edx,%eax
  100624:	c1 e0 02             	shl    $0x2,%eax
  100627:	89 c2                	mov    %eax,%edx
  100629:	8b 45 08             	mov    0x8(%ebp),%eax
  10062c:	01 d0                	add    %edx,%eax
  10062e:	8b 40 08             	mov    0x8(%eax),%eax
  100631:	39 45 18             	cmp    %eax,0x18(%ebp)
  100634:	76 13                	jbe    100649 <stab_binsearch+0xbb>
            *region_left = m;
  100636:	8b 45 0c             	mov    0xc(%ebp),%eax
  100639:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10063c:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10063e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100641:	83 c0 01             	add    $0x1,%eax
  100644:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100647:	eb 43                	jmp    10068c <stab_binsearch+0xfe>
        } else if (stabs[m].n_value > addr) {
  100649:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10064c:	89 d0                	mov    %edx,%eax
  10064e:	01 c0                	add    %eax,%eax
  100650:	01 d0                	add    %edx,%eax
  100652:	c1 e0 02             	shl    $0x2,%eax
  100655:	89 c2                	mov    %eax,%edx
  100657:	8b 45 08             	mov    0x8(%ebp),%eax
  10065a:	01 d0                	add    %edx,%eax
  10065c:	8b 40 08             	mov    0x8(%eax),%eax
  10065f:	39 45 18             	cmp    %eax,0x18(%ebp)
  100662:	73 16                	jae    10067a <stab_binsearch+0xec>
            *region_right = m - 1;
  100664:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100667:	8d 50 ff             	lea    -0x1(%eax),%edx
  10066a:	8b 45 10             	mov    0x10(%ebp),%eax
  10066d:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10066f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100672:	83 e8 01             	sub    $0x1,%eax
  100675:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100678:	eb 12                	jmp    10068c <stab_binsearch+0xfe>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100680:	89 10                	mov    %edx,(%eax)
            l = m;
  100682:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100685:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100688:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  10068c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10068f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100692:	0f 8e 22 ff ff ff    	jle    1005ba <stab_binsearch+0x2c>
        }
    }

    if (!any_matches) {
  100698:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10069c:	75 0f                	jne    1006ad <stab_binsearch+0x11f>
        *region_right = *region_left - 1;
  10069e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a1:	8b 00                	mov    (%eax),%eax
  1006a3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1006a6:	8b 45 10             	mov    0x10(%ebp),%eax
  1006a9:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1006ab:	eb 3f                	jmp    1006ec <stab_binsearch+0x15e>
        l = *region_right;
  1006ad:	8b 45 10             	mov    0x10(%ebp),%eax
  1006b0:	8b 00                	mov    (%eax),%eax
  1006b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1006b5:	eb 04                	jmp    1006bb <stab_binsearch+0x12d>
  1006b7:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1006bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006be:	8b 00                	mov    (%eax),%eax
  1006c0:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1006c3:	7e 1f                	jle    1006e4 <stab_binsearch+0x156>
  1006c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1006c8:	89 d0                	mov    %edx,%eax
  1006ca:	01 c0                	add    %eax,%eax
  1006cc:	01 d0                	add    %edx,%eax
  1006ce:	c1 e0 02             	shl    $0x2,%eax
  1006d1:	89 c2                	mov    %eax,%edx
  1006d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d6:	01 d0                	add    %edx,%eax
  1006d8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1006dc:	0f b6 c0             	movzbl %al,%eax
  1006df:	39 45 14             	cmp    %eax,0x14(%ebp)
  1006e2:	75 d3                	jne    1006b7 <stab_binsearch+0x129>
        *region_left = l;
  1006e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006e7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1006ea:	89 10                	mov    %edx,(%eax)
}
  1006ec:	90                   	nop
  1006ed:	c9                   	leave  
  1006ee:	c3                   	ret    

001006ef <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1006ef:	55                   	push   %ebp
  1006f0:	89 e5                	mov    %esp,%ebp
  1006f2:	53                   	push   %ebx
  1006f3:	83 ec 34             	sub    $0x34,%esp
  1006f6:	e8 81 fb ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  1006fb:	81 c3 55 02 01 00    	add    $0x10255,%ebx
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100701:	8b 45 0c             	mov    0xc(%ebp),%eax
  100704:	8d 93 08 31 ff ff    	lea    -0xcef8(%ebx),%edx
  10070a:	89 10                	mov    %edx,(%eax)
    info->eip_line = 0;
  10070c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10070f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100716:	8b 45 0c             	mov    0xc(%ebp),%eax
  100719:	8d 93 08 31 ff ff    	lea    -0xcef8(%ebx),%edx
  10071f:	89 50 08             	mov    %edx,0x8(%eax)
    info->eip_fn_namelen = 9;
  100722:	8b 45 0c             	mov    0xc(%ebp),%eax
  100725:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10072c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10072f:	8b 55 08             	mov    0x8(%ebp),%edx
  100732:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100735:	8b 45 0c             	mov    0xc(%ebp),%eax
  100738:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10073f:	c7 c0 d8 42 10 00    	mov    $0x1042d8,%eax
  100745:	89 45 f4             	mov    %eax,-0xc(%ebp)
    stab_end = __STAB_END__;
  100748:	c7 c0 78 cf 10 00    	mov    $0x10cf78,%eax
  10074e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100751:	c7 c0 79 cf 10 00    	mov    $0x10cf79,%eax
  100757:	89 45 ec             	mov    %eax,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10075a:	c7 c0 49 f0 10 00    	mov    $0x10f049,%eax
  100760:	89 45 e8             	mov    %eax,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100763:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100766:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100769:	76 0d                	jbe    100778 <debuginfo_eip+0x89>
  10076b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10076e:	83 e8 01             	sub    $0x1,%eax
  100771:	0f b6 00             	movzbl (%eax),%eax
  100774:	84 c0                	test   %al,%al
  100776:	74 0a                	je     100782 <debuginfo_eip+0x93>
        return -1;
  100778:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10077d:	e9 85 02 00 00       	jmp    100a07 <debuginfo_eip+0x318>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100782:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100789:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10078c:	2b 45 f4             	sub    -0xc(%ebp),%eax
  10078f:	c1 f8 02             	sar    $0x2,%eax
  100792:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100798:	83 e8 01             	sub    $0x1,%eax
  10079b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  10079e:	ff 75 08             	pushl  0x8(%ebp)
  1007a1:	6a 64                	push   $0x64
  1007a3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1007a6:	50                   	push   %eax
  1007a7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1007aa:	50                   	push   %eax
  1007ab:	ff 75 f4             	pushl  -0xc(%ebp)
  1007ae:	e8 db fd ff ff       	call   10058e <stab_binsearch>
  1007b3:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  1007b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007b9:	85 c0                	test   %eax,%eax
  1007bb:	75 0a                	jne    1007c7 <debuginfo_eip+0xd8>
        return -1;
  1007bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007c2:	e9 40 02 00 00       	jmp    100a07 <debuginfo_eip+0x318>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1007c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007ca:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1007cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007d0:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1007d3:	ff 75 08             	pushl  0x8(%ebp)
  1007d6:	6a 24                	push   $0x24
  1007d8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1007db:	50                   	push   %eax
  1007dc:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1007df:	50                   	push   %eax
  1007e0:	ff 75 f4             	pushl  -0xc(%ebp)
  1007e3:	e8 a6 fd ff ff       	call   10058e <stab_binsearch>
  1007e8:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7f 78                	jg     10086d <debuginfo_eip+0x17e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	89 c2                	mov    %eax,%edx
  1007fa:	89 d0                	mov    %edx,%eax
  1007fc:	01 c0                	add    %eax,%eax
  1007fe:	01 d0                	add    %edx,%eax
  100800:	c1 e0 02             	shl    $0x2,%eax
  100803:	89 c2                	mov    %eax,%edx
  100805:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100808:	01 d0                	add    %edx,%eax
  10080a:	8b 10                	mov    (%eax),%edx
  10080c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10080f:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100812:	39 c2                	cmp    %eax,%edx
  100814:	73 22                	jae    100838 <debuginfo_eip+0x149>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100816:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100819:	89 c2                	mov    %eax,%edx
  10081b:	89 d0                	mov    %edx,%eax
  10081d:	01 c0                	add    %eax,%eax
  10081f:	01 d0                	add    %edx,%eax
  100821:	c1 e0 02             	shl    $0x2,%eax
  100824:	89 c2                	mov    %eax,%edx
  100826:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100829:	01 d0                	add    %edx,%eax
  10082b:	8b 10                	mov    (%eax),%edx
  10082d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100830:	01 c2                	add    %eax,%edx
  100832:	8b 45 0c             	mov    0xc(%ebp),%eax
  100835:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100838:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10083b:	89 c2                	mov    %eax,%edx
  10083d:	89 d0                	mov    %edx,%eax
  10083f:	01 c0                	add    %eax,%eax
  100841:	01 d0                	add    %edx,%eax
  100843:	c1 e0 02             	shl    $0x2,%eax
  100846:	89 c2                	mov    %eax,%edx
  100848:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10084b:	01 d0                	add    %edx,%eax
  10084d:	8b 50 08             	mov    0x8(%eax),%edx
  100850:	8b 45 0c             	mov    0xc(%ebp),%eax
  100853:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100856:	8b 45 0c             	mov    0xc(%ebp),%eax
  100859:	8b 40 10             	mov    0x10(%eax),%eax
  10085c:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10085f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100862:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100865:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100868:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10086b:	eb 15                	jmp    100882 <debuginfo_eip+0x193>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10086d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100870:	8b 55 08             	mov    0x8(%ebp),%edx
  100873:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100876:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100879:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10087c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10087f:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100882:	8b 45 0c             	mov    0xc(%ebp),%eax
  100885:	8b 40 08             	mov    0x8(%eax),%eax
  100888:	83 ec 08             	sub    $0x8,%esp
  10088b:	6a 3a                	push   $0x3a
  10088d:	50                   	push   %eax
  10088e:	e8 15 27 00 00       	call   102fa8 <strfind>
  100893:	83 c4 10             	add    $0x10,%esp
  100896:	8b 55 0c             	mov    0xc(%ebp),%edx
  100899:	8b 52 08             	mov    0x8(%edx),%edx
  10089c:	29 d0                	sub    %edx,%eax
  10089e:	89 c2                	mov    %eax,%edx
  1008a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008a3:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1008a6:	83 ec 0c             	sub    $0xc,%esp
  1008a9:	ff 75 08             	pushl  0x8(%ebp)
  1008ac:	6a 44                	push   $0x44
  1008ae:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1008b1:	50                   	push   %eax
  1008b2:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1008b5:	50                   	push   %eax
  1008b6:	ff 75 f4             	pushl  -0xc(%ebp)
  1008b9:	e8 d0 fc ff ff       	call   10058e <stab_binsearch>
  1008be:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  1008c1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008c4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1008c7:	39 c2                	cmp    %eax,%edx
  1008c9:	7f 24                	jg     1008ef <debuginfo_eip+0x200>
        info->eip_line = stabs[rline].n_desc;
  1008cb:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1008ce:	89 c2                	mov    %eax,%edx
  1008d0:	89 d0                	mov    %edx,%eax
  1008d2:	01 c0                	add    %eax,%eax
  1008d4:	01 d0                	add    %edx,%eax
  1008d6:	c1 e0 02             	shl    $0x2,%eax
  1008d9:	89 c2                	mov    %eax,%edx
  1008db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008de:	01 d0                	add    %edx,%eax
  1008e0:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1008e4:	0f b7 d0             	movzwl %ax,%edx
  1008e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ea:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1008ed:	eb 13                	jmp    100902 <debuginfo_eip+0x213>
        return -1;
  1008ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1008f4:	e9 0e 01 00 00       	jmp    100a07 <debuginfo_eip+0x318>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1008f9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008fc:	83 e8 01             	sub    $0x1,%eax
  1008ff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100902:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100905:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100908:	39 c2                	cmp    %eax,%edx
  10090a:	7c 56                	jl     100962 <debuginfo_eip+0x273>
           && stabs[lline].n_type != N_SOL
  10090c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10090f:	89 c2                	mov    %eax,%edx
  100911:	89 d0                	mov    %edx,%eax
  100913:	01 c0                	add    %eax,%eax
  100915:	01 d0                	add    %edx,%eax
  100917:	c1 e0 02             	shl    $0x2,%eax
  10091a:	89 c2                	mov    %eax,%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100925:	3c 84                	cmp    $0x84,%al
  100927:	74 39                	je     100962 <debuginfo_eip+0x273>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100929:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10092c:	89 c2                	mov    %eax,%edx
  10092e:	89 d0                	mov    %edx,%eax
  100930:	01 c0                	add    %eax,%eax
  100932:	01 d0                	add    %edx,%eax
  100934:	c1 e0 02             	shl    $0x2,%eax
  100937:	89 c2                	mov    %eax,%edx
  100939:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10093c:	01 d0                	add    %edx,%eax
  10093e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100942:	3c 64                	cmp    $0x64,%al
  100944:	75 b3                	jne    1008f9 <debuginfo_eip+0x20a>
  100946:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100949:	89 c2                	mov    %eax,%edx
  10094b:	89 d0                	mov    %edx,%eax
  10094d:	01 c0                	add    %eax,%eax
  10094f:	01 d0                	add    %edx,%eax
  100951:	c1 e0 02             	shl    $0x2,%eax
  100954:	89 c2                	mov    %eax,%edx
  100956:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100959:	01 d0                	add    %edx,%eax
  10095b:	8b 40 08             	mov    0x8(%eax),%eax
  10095e:	85 c0                	test   %eax,%eax
  100960:	74 97                	je     1008f9 <debuginfo_eip+0x20a>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100962:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100965:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100968:	39 c2                	cmp    %eax,%edx
  10096a:	7c 42                	jl     1009ae <debuginfo_eip+0x2bf>
  10096c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10096f:	89 c2                	mov    %eax,%edx
  100971:	89 d0                	mov    %edx,%eax
  100973:	01 c0                	add    %eax,%eax
  100975:	01 d0                	add    %edx,%eax
  100977:	c1 e0 02             	shl    $0x2,%eax
  10097a:	89 c2                	mov    %eax,%edx
  10097c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10097f:	01 d0                	add    %edx,%eax
  100981:	8b 10                	mov    (%eax),%edx
  100983:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100986:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100989:	39 c2                	cmp    %eax,%edx
  10098b:	73 21                	jae    1009ae <debuginfo_eip+0x2bf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10098d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100990:	89 c2                	mov    %eax,%edx
  100992:	89 d0                	mov    %edx,%eax
  100994:	01 c0                	add    %eax,%eax
  100996:	01 d0                	add    %edx,%eax
  100998:	c1 e0 02             	shl    $0x2,%eax
  10099b:	89 c2                	mov    %eax,%edx
  10099d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a0:	01 d0                	add    %edx,%eax
  1009a2:	8b 10                	mov    (%eax),%edx
  1009a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009a7:	01 c2                	add    %eax,%edx
  1009a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009ac:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1009ae:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1009b1:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1009b4:	39 c2                	cmp    %eax,%edx
  1009b6:	7d 4a                	jge    100a02 <debuginfo_eip+0x313>
        for (lline = lfun + 1;
  1009b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009bb:	83 c0 01             	add    $0x1,%eax
  1009be:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1009c1:	eb 18                	jmp    1009db <debuginfo_eip+0x2ec>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1009c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009c6:	8b 40 14             	mov    0x14(%eax),%eax
  1009c9:	8d 50 01             	lea    0x1(%eax),%edx
  1009cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009cf:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1009d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009d5:	83 c0 01             	add    $0x1,%eax
  1009d8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1009db:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1009de:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1009e1:	39 c2                	cmp    %eax,%edx
  1009e3:	7d 1d                	jge    100a02 <debuginfo_eip+0x313>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1009e5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009e8:	89 c2                	mov    %eax,%edx
  1009ea:	89 d0                	mov    %edx,%eax
  1009ec:	01 c0                	add    %eax,%eax
  1009ee:	01 d0                	add    %edx,%eax
  1009f0:	c1 e0 02             	shl    $0x2,%eax
  1009f3:	89 c2                	mov    %eax,%edx
  1009f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009f8:	01 d0                	add    %edx,%eax
  1009fa:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1009fe:	3c a0                	cmp    $0xa0,%al
  100a00:	74 c1                	je     1009c3 <debuginfo_eip+0x2d4>
        }
    }
    return 0;
  100a02:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100a07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a0a:	c9                   	leave  
  100a0b:	c3                   	ret    

00100a0c <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100a0c:	55                   	push   %ebp
  100a0d:	89 e5                	mov    %esp,%ebp
  100a0f:	53                   	push   %ebx
  100a10:	83 ec 04             	sub    $0x4,%esp
  100a13:	e8 64 f8 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100a18:	81 c3 38 ff 00 00    	add    $0xff38,%ebx
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100a1e:	83 ec 0c             	sub    $0xc,%esp
  100a21:	8d 83 12 31 ff ff    	lea    -0xceee(%ebx),%eax
  100a27:	50                   	push   %eax
  100a28:	e8 c2 f8 ff ff       	call   1002ef <cprintf>
  100a2d:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100a30:	83 ec 08             	sub    $0x8,%esp
  100a33:	c7 c0 00 00 10 00    	mov    $0x100000,%eax
  100a39:	50                   	push   %eax
  100a3a:	8d 83 2b 31 ff ff    	lea    -0xced5(%ebx),%eax
  100a40:	50                   	push   %eax
  100a41:	e8 a9 f8 ff ff       	call   1002ef <cprintf>
  100a46:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100a49:	83 ec 08             	sub    $0x8,%esp
  100a4c:	c7 c0 6d 39 10 00    	mov    $0x10396d,%eax
  100a52:	50                   	push   %eax
  100a53:	8d 83 43 31 ff ff    	lea    -0xcebd(%ebx),%eax
  100a59:	50                   	push   %eax
  100a5a:	e8 90 f8 ff ff       	call   1002ef <cprintf>
  100a5f:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100a62:	83 ec 08             	sub    $0x8,%esp
  100a65:	c7 c0 50 09 11 00    	mov    $0x110950,%eax
  100a6b:	50                   	push   %eax
  100a6c:	8d 83 5b 31 ff ff    	lea    -0xcea5(%ebx),%eax
  100a72:	50                   	push   %eax
  100a73:	e8 77 f8 ff ff       	call   1002ef <cprintf>
  100a78:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100a7b:	83 ec 08             	sub    $0x8,%esp
  100a7e:	c7 c0 a0 1d 11 00    	mov    $0x111da0,%eax
  100a84:	50                   	push   %eax
  100a85:	8d 83 73 31 ff ff    	lea    -0xce8d(%ebx),%eax
  100a8b:	50                   	push   %eax
  100a8c:	e8 5e f8 ff ff       	call   1002ef <cprintf>
  100a91:	83 c4 10             	add    $0x10,%esp
    cprintf("    __STAB_BEGIN__     0x%08x (phys)\n", __STAB_BEGIN__);
  100a94:	83 ec 08             	sub    $0x8,%esp
  100a97:	c7 c0 d8 42 10 00    	mov    $0x1042d8,%eax
  100a9d:	50                   	push   %eax
  100a9e:	8d 83 8c 31 ff ff    	lea    -0xce74(%ebx),%eax
  100aa4:	50                   	push   %eax
  100aa5:	e8 45 f8 ff ff       	call   1002ef <cprintf>
  100aaa:	83 c4 10             	add    $0x10,%esp
    cprintf("    __STAB_END__       0x%08x (phys)\n", __STAB_END__);
  100aad:	83 ec 08             	sub    $0x8,%esp
  100ab0:	c7 c0 78 cf 10 00    	mov    $0x10cf78,%eax
  100ab6:	50                   	push   %eax
  100ab7:	8d 83 b4 31 ff ff    	lea    -0xce4c(%ebx),%eax
  100abd:	50                   	push   %eax
  100abe:	e8 2c f8 ff ff       	call   1002ef <cprintf>
  100ac3:	83 c4 10             	add    $0x10,%esp
    cprintf("    __STABSTR_BEGIN__  0x%08x (phys)\n", __STABSTR_BEGIN__);
  100ac6:	83 ec 08             	sub    $0x8,%esp
  100ac9:	c7 c0 79 cf 10 00    	mov    $0x10cf79,%eax
  100acf:	50                   	push   %eax
  100ad0:	8d 83 dc 31 ff ff    	lea    -0xce24(%ebx),%eax
  100ad6:	50                   	push   %eax
  100ad7:	e8 13 f8 ff ff       	call   1002ef <cprintf>
  100adc:	83 c4 10             	add    $0x10,%esp
    cprintf("    __STABSTR_END__    0x%08x (phys)\n", __STABSTR_END__);
  100adf:	83 ec 08             	sub    $0x8,%esp
  100ae2:	c7 c0 49 f0 10 00    	mov    $0x10f049,%eax
  100ae8:	50                   	push   %eax
  100ae9:	8d 83 04 32 ff ff    	lea    -0xcdfc(%ebx),%eax
  100aef:	50                   	push   %eax
  100af0:	e8 fa f7 ff ff       	call   1002ef <cprintf>
  100af5:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100af8:	c7 c0 a0 1d 11 00    	mov    $0x111da0,%eax
  100afe:	89 c2                	mov    %eax,%edx
  100b00:	c7 c0 00 00 10 00    	mov    $0x100000,%eax
  100b06:	29 c2                	sub    %eax,%edx
  100b08:	89 d0                	mov    %edx,%eax
  100b0a:	05 ff 03 00 00       	add    $0x3ff,%eax
  100b0f:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100b15:	85 c0                	test   %eax,%eax
  100b17:	0f 48 c2             	cmovs  %edx,%eax
  100b1a:	c1 f8 0a             	sar    $0xa,%eax
  100b1d:	83 ec 08             	sub    $0x8,%esp
  100b20:	50                   	push   %eax
  100b21:	8d 83 2c 32 ff ff    	lea    -0xcdd4(%ebx),%eax
  100b27:	50                   	push   %eax
  100b28:	e8 c2 f7 ff ff       	call   1002ef <cprintf>
  100b2d:	83 c4 10             	add    $0x10,%esp
}
  100b30:	90                   	nop
  100b31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b34:	c9                   	leave  
  100b35:	c3                   	ret    

00100b36 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100b36:	55                   	push   %ebp
  100b37:	89 e5                	mov    %esp,%ebp
  100b39:	53                   	push   %ebx
  100b3a:	81 ec 24 01 00 00    	sub    $0x124,%esp
  100b40:	e8 37 f7 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100b45:	81 c3 0b fe 00 00    	add    $0xfe0b,%ebx
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100b4b:	83 ec 08             	sub    $0x8,%esp
  100b4e:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100b51:	50                   	push   %eax
  100b52:	ff 75 08             	pushl  0x8(%ebp)
  100b55:	e8 95 fb ff ff       	call   1006ef <debuginfo_eip>
  100b5a:	83 c4 10             	add    $0x10,%esp
  100b5d:	85 c0                	test   %eax,%eax
  100b5f:	74 17                	je     100b78 <print_debuginfo+0x42>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100b61:	83 ec 08             	sub    $0x8,%esp
  100b64:	ff 75 08             	pushl  0x8(%ebp)
  100b67:	8d 83 56 32 ff ff    	lea    -0xcdaa(%ebx),%eax
  100b6d:	50                   	push   %eax
  100b6e:	e8 7c f7 ff ff       	call   1002ef <cprintf>
  100b73:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100b76:	eb 67                	jmp    100bdf <print_debuginfo+0xa9>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100b78:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b7f:	eb 1c                	jmp    100b9d <print_debuginfo+0x67>
            fnname[j] = info.eip_fn_name[j];
  100b81:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100b84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b87:	01 d0                	add    %edx,%eax
  100b89:	0f b6 00             	movzbl (%eax),%eax
  100b8c:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100b92:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b95:	01 ca                	add    %ecx,%edx
  100b97:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100b99:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ba0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100ba3:	7c dc                	jl     100b81 <print_debuginfo+0x4b>
        fnname[j] = '\0';
  100ba5:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100bab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bae:	01 d0                	add    %edx,%eax
  100bb0:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100bb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100bb6:	8b 55 08             	mov    0x8(%ebp),%edx
  100bb9:	89 d1                	mov    %edx,%ecx
  100bbb:	29 c1                	sub    %eax,%ecx
  100bbd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100bc0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100bc3:	83 ec 0c             	sub    $0xc,%esp
  100bc6:	51                   	push   %ecx
  100bc7:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100bcd:	51                   	push   %ecx
  100bce:	52                   	push   %edx
  100bcf:	50                   	push   %eax
  100bd0:	8d 83 72 32 ff ff    	lea    -0xcd8e(%ebx),%eax
  100bd6:	50                   	push   %eax
  100bd7:	e8 13 f7 ff ff       	call   1002ef <cprintf>
  100bdc:	83 c4 20             	add    $0x20,%esp
}
  100bdf:	90                   	nop
  100be0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100be3:	c9                   	leave  
  100be4:	c3                   	ret    

00100be5 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100be5:	55                   	push   %ebp
  100be6:	89 e5                	mov    %esp,%ebp
  100be8:	83 ec 10             	sub    $0x10,%esp
  100beb:	e8 88 f6 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  100bf0:	05 60 fd 00 00       	add    $0xfd60,%eax
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100bf5:	8b 45 04             	mov    0x4(%ebp),%eax
  100bf8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100bfb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100bfe:	c9                   	leave  
  100bff:	c3                   	ret    

00100c00 <print_stackframe>:
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
void
print_stackframe(void) {
  100c00:	55                   	push   %ebp
  100c01:	89 e5                	mov    %esp,%ebp
  100c03:	56                   	push   %esi
  100c04:	53                   	push   %ebx
  100c05:	83 ec 10             	sub    $0x10,%esp
  100c08:	e8 6f f6 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100c0d:	81 c3 43 fd 00 00    	add    $0xfd43,%ebx

static inline uint32_t
read_ebp(void)
{
    uint32_t ebp;
    asm volatile("movl %%ebp, %0"
  100c13:	89 e8                	mov    %ebp,%eax
  100c15:	89 45 ec             	mov    %eax,-0x14(%ebp)
                 : "=r"(ebp));
    return ebp;
  100c18:	8b 45 ec             	mov    -0x14(%ebp),%eax
    uint32_t ebp = read_ebp();
  100c1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t deepth = 0;
  100c1e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    while (ebp != 0)
  100c25:	e9 9b 00 00 00       	jmp    100cc5 <print_stackframe+0xc5>
    {
        cprintf("=================\n");
  100c2a:	83 ec 0c             	sub    $0xc,%esp
  100c2d:	8d 83 84 32 ff ff    	lea    -0xcd7c(%ebx),%eax
  100c33:	50                   	push   %eax
  100c34:	e8 b6 f6 ff ff       	call   1002ef <cprintf>
  100c39:	83 c4 10             	add    $0x10,%esp
        cprintf("fp = %d \n", deepth);
  100c3c:	83 ec 08             	sub    $0x8,%esp
  100c3f:	ff 75 f0             	pushl  -0x10(%ebp)
  100c42:	8d 83 97 32 ff ff    	lea    -0xcd69(%ebx),%eax
  100c48:	50                   	push   %eax
  100c49:	e8 a1 f6 ff ff       	call   1002ef <cprintf>
  100c4e:	83 c4 10             	add    $0x10,%esp
        cprintf("ebp = %08x   ra = %08x \n", ebp, ADDR2UINT(ebp+4));
  100c51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c54:	83 c0 04             	add    $0x4,%eax
  100c57:	8b 00                	mov    (%eax),%eax
  100c59:	83 ec 04             	sub    $0x4,%esp
  100c5c:	50                   	push   %eax
  100c5d:	ff 75 f4             	pushl  -0xc(%ebp)
  100c60:	8d 83 a1 32 ff ff    	lea    -0xcd5f(%ebx),%eax
  100c66:	50                   	push   %eax
  100c67:	e8 83 f6 ff ff       	call   1002ef <cprintf>
  100c6c:	83 c4 10             	add    $0x10,%esp
        cprintf("arg1 = %08x  arg2 = %08x   arg3 = %08x   arg4 = %08x \n",\
                ADDR2UINT(ebp+8),ADDR2UINT(ebp+12),ADDR2UINT(ebp+16),ADDR2UINT(ebp+20));
  100c6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c72:	83 c0 14             	add    $0x14,%eax
        cprintf("arg1 = %08x  arg2 = %08x   arg3 = %08x   arg4 = %08x \n",\
  100c75:	8b 30                	mov    (%eax),%esi
                ADDR2UINT(ebp+8),ADDR2UINT(ebp+12),ADDR2UINT(ebp+16),ADDR2UINT(ebp+20));
  100c77:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c7a:	83 c0 10             	add    $0x10,%eax
        cprintf("arg1 = %08x  arg2 = %08x   arg3 = %08x   arg4 = %08x \n",\
  100c7d:	8b 08                	mov    (%eax),%ecx
                ADDR2UINT(ebp+8),ADDR2UINT(ebp+12),ADDR2UINT(ebp+16),ADDR2UINT(ebp+20));
  100c7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c82:	83 c0 0c             	add    $0xc,%eax
        cprintf("arg1 = %08x  arg2 = %08x   arg3 = %08x   arg4 = %08x \n",\
  100c85:	8b 10                	mov    (%eax),%edx
                ADDR2UINT(ebp+8),ADDR2UINT(ebp+12),ADDR2UINT(ebp+16),ADDR2UINT(ebp+20));
  100c87:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c8a:	83 c0 08             	add    $0x8,%eax
        cprintf("arg1 = %08x  arg2 = %08x   arg3 = %08x   arg4 = %08x \n",\
  100c8d:	8b 00                	mov    (%eax),%eax
  100c8f:	83 ec 0c             	sub    $0xc,%esp
  100c92:	56                   	push   %esi
  100c93:	51                   	push   %ecx
  100c94:	52                   	push   %edx
  100c95:	50                   	push   %eax
  100c96:	8d 83 bc 32 ff ff    	lea    -0xcd44(%ebx),%eax
  100c9c:	50                   	push   %eax
  100c9d:	e8 4d f6 ff ff       	call   1002ef <cprintf>
  100ca2:	83 c4 20             	add    $0x20,%esp
        print_debuginfo(ADDR2UINT(ebp+4));
  100ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ca8:	83 c0 04             	add    $0x4,%eax
  100cab:	8b 00                	mov    (%eax),%eax
  100cad:	83 ec 0c             	sub    $0xc,%esp
  100cb0:	50                   	push   %eax
  100cb1:	e8 80 fe ff ff       	call   100b36 <print_debuginfo>
  100cb6:	83 c4 10             	add    $0x10,%esp
        ebp = ADDR2UINT(ebp);
  100cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cbc:	8b 00                	mov    (%eax),%eax
  100cbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
        deepth += 1;
  100cc1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    while (ebp != 0)
  100cc5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cc9:	0f 85 5b ff ff ff    	jne    100c2a <print_stackframe+0x2a>
    }
}
  100ccf:	90                   	nop
  100cd0:	90                   	nop
  100cd1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100cd4:	5b                   	pop    %ebx
  100cd5:	5e                   	pop    %esi
  100cd6:	5d                   	pop    %ebp
  100cd7:	c3                   	ret    

00100cd8 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100cd8:	55                   	push   %ebp
  100cd9:	89 e5                	mov    %esp,%ebp
  100cdb:	53                   	push   %ebx
  100cdc:	83 ec 14             	sub    $0x14,%esp
  100cdf:	e8 98 f5 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100ce4:	81 c3 6c fc 00 00    	add    $0xfc6c,%ebx
    int argc = 0;
  100cea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100cf1:	eb 0c                	jmp    100cff <parse+0x27>
            *buf ++ = '\0';
  100cf3:	8b 45 08             	mov    0x8(%ebp),%eax
  100cf6:	8d 50 01             	lea    0x1(%eax),%edx
  100cf9:	89 55 08             	mov    %edx,0x8(%ebp)
  100cfc:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100cff:	8b 45 08             	mov    0x8(%ebp),%eax
  100d02:	0f b6 00             	movzbl (%eax),%eax
  100d05:	84 c0                	test   %al,%al
  100d07:	74 20                	je     100d29 <parse+0x51>
  100d09:	8b 45 08             	mov    0x8(%ebp),%eax
  100d0c:	0f b6 00             	movzbl (%eax),%eax
  100d0f:	0f be c0             	movsbl %al,%eax
  100d12:	83 ec 08             	sub    $0x8,%esp
  100d15:	50                   	push   %eax
  100d16:	8d 83 74 33 ff ff    	lea    -0xcc8c(%ebx),%eax
  100d1c:	50                   	push   %eax
  100d1d:	e8 49 22 00 00       	call   102f6b <strchr>
  100d22:	83 c4 10             	add    $0x10,%esp
  100d25:	85 c0                	test   %eax,%eax
  100d27:	75 ca                	jne    100cf3 <parse+0x1b>
        }
        if (*buf == '\0') {
  100d29:	8b 45 08             	mov    0x8(%ebp),%eax
  100d2c:	0f b6 00             	movzbl (%eax),%eax
  100d2f:	84 c0                	test   %al,%al
  100d31:	74 69                	je     100d9c <parse+0xc4>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100d33:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100d37:	75 14                	jne    100d4d <parse+0x75>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100d39:	83 ec 08             	sub    $0x8,%esp
  100d3c:	6a 10                	push   $0x10
  100d3e:	8d 83 79 33 ff ff    	lea    -0xcc87(%ebx),%eax
  100d44:	50                   	push   %eax
  100d45:	e8 a5 f5 ff ff       	call   1002ef <cprintf>
  100d4a:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100d4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d50:	8d 50 01             	lea    0x1(%eax),%edx
  100d53:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100d56:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100d5d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d60:	01 c2                	add    %eax,%edx
  100d62:	8b 45 08             	mov    0x8(%ebp),%eax
  100d65:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100d67:	eb 04                	jmp    100d6d <parse+0x95>
            buf ++;
  100d69:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100d6d:	8b 45 08             	mov    0x8(%ebp),%eax
  100d70:	0f b6 00             	movzbl (%eax),%eax
  100d73:	84 c0                	test   %al,%al
  100d75:	74 88                	je     100cff <parse+0x27>
  100d77:	8b 45 08             	mov    0x8(%ebp),%eax
  100d7a:	0f b6 00             	movzbl (%eax),%eax
  100d7d:	0f be c0             	movsbl %al,%eax
  100d80:	83 ec 08             	sub    $0x8,%esp
  100d83:	50                   	push   %eax
  100d84:	8d 83 74 33 ff ff    	lea    -0xcc8c(%ebx),%eax
  100d8a:	50                   	push   %eax
  100d8b:	e8 db 21 00 00       	call   102f6b <strchr>
  100d90:	83 c4 10             	add    $0x10,%esp
  100d93:	85 c0                	test   %eax,%eax
  100d95:	74 d2                	je     100d69 <parse+0x91>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100d97:	e9 63 ff ff ff       	jmp    100cff <parse+0x27>
            break;
  100d9c:	90                   	nop
        }
    }
    return argc;
  100d9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100da0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100da3:	c9                   	leave  
  100da4:	c3                   	ret    

00100da5 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100da5:	55                   	push   %ebp
  100da6:	89 e5                	mov    %esp,%ebp
  100da8:	56                   	push   %esi
  100da9:	53                   	push   %ebx
  100daa:	83 ec 50             	sub    $0x50,%esp
  100dad:	e8 ca f4 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100db2:	81 c3 9e fb 00 00    	add    $0xfb9e,%ebx
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100db8:	83 ec 08             	sub    $0x8,%esp
  100dbb:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100dbe:	50                   	push   %eax
  100dbf:	ff 75 08             	pushl  0x8(%ebp)
  100dc2:	e8 11 ff ff ff       	call   100cd8 <parse>
  100dc7:	83 c4 10             	add    $0x10,%esp
  100dca:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100dcd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100dd1:	75 0a                	jne    100ddd <runcmd+0x38>
        return 0;
  100dd3:	b8 00 00 00 00       	mov    $0x0,%eax
  100dd8:	e9 8b 00 00 00       	jmp    100e68 <runcmd+0xc3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ddd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100de4:	eb 5f                	jmp    100e45 <runcmd+0xa0>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100de6:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100de9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100dec:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100df2:	89 d0                	mov    %edx,%eax
  100df4:	01 c0                	add    %eax,%eax
  100df6:	01 d0                	add    %edx,%eax
  100df8:	c1 e0 02             	shl    $0x2,%eax
  100dfb:	01 f0                	add    %esi,%eax
  100dfd:	8b 00                	mov    (%eax),%eax
  100dff:	83 ec 08             	sub    $0x8,%esp
  100e02:	51                   	push   %ecx
  100e03:	50                   	push   %eax
  100e04:	e8 af 20 00 00       	call   102eb8 <strcmp>
  100e09:	83 c4 10             	add    $0x10,%esp
  100e0c:	85 c0                	test   %eax,%eax
  100e0e:	75 31                	jne    100e41 <runcmd+0x9c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100e10:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e13:	8d 8b 18 00 00 00    	lea    0x18(%ebx),%ecx
  100e19:	89 d0                	mov    %edx,%eax
  100e1b:	01 c0                	add    %eax,%eax
  100e1d:	01 d0                	add    %edx,%eax
  100e1f:	c1 e0 02             	shl    $0x2,%eax
  100e22:	01 c8                	add    %ecx,%eax
  100e24:	8b 10                	mov    (%eax),%edx
  100e26:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100e29:	83 c0 04             	add    $0x4,%eax
  100e2c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100e2f:	83 e9 01             	sub    $0x1,%ecx
  100e32:	83 ec 04             	sub    $0x4,%esp
  100e35:	ff 75 0c             	pushl  0xc(%ebp)
  100e38:	50                   	push   %eax
  100e39:	51                   	push   %ecx
  100e3a:	ff d2                	call   *%edx
  100e3c:	83 c4 10             	add    $0x10,%esp
  100e3f:	eb 27                	jmp    100e68 <runcmd+0xc3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100e41:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100e45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e48:	83 f8 02             	cmp    $0x2,%eax
  100e4b:	76 99                	jbe    100de6 <runcmd+0x41>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100e4d:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100e50:	83 ec 08             	sub    $0x8,%esp
  100e53:	50                   	push   %eax
  100e54:	8d 83 97 33 ff ff    	lea    -0xcc69(%ebx),%eax
  100e5a:	50                   	push   %eax
  100e5b:	e8 8f f4 ff ff       	call   1002ef <cprintf>
  100e60:	83 c4 10             	add    $0x10,%esp
    return 0;
  100e63:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100e68:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e6b:	5b                   	pop    %ebx
  100e6c:	5e                   	pop    %esi
  100e6d:	5d                   	pop    %ebp
  100e6e:	c3                   	ret    

00100e6f <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100e6f:	55                   	push   %ebp
  100e70:	89 e5                	mov    %esp,%ebp
  100e72:	53                   	push   %ebx
  100e73:	83 ec 14             	sub    $0x14,%esp
  100e76:	e8 01 f4 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100e7b:	81 c3 d5 fa 00 00    	add    $0xfad5,%ebx
    cprintf("Welcome to the kernel debug monitor!!\n");
  100e81:	83 ec 0c             	sub    $0xc,%esp
  100e84:	8d 83 b0 33 ff ff    	lea    -0xcc50(%ebx),%eax
  100e8a:	50                   	push   %eax
  100e8b:	e8 5f f4 ff ff       	call   1002ef <cprintf>
  100e90:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100e93:	83 ec 0c             	sub    $0xc,%esp
  100e96:	8d 83 d8 33 ff ff    	lea    -0xcc28(%ebx),%eax
  100e9c:	50                   	push   %eax
  100e9d:	e8 4d f4 ff ff       	call   1002ef <cprintf>
  100ea2:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100ea5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ea9:	74 0e                	je     100eb9 <kmonitor+0x4a>
        print_trapframe(tf);
  100eab:	83 ec 0c             	sub    $0xc,%esp
  100eae:	ff 75 08             	pushl  0x8(%ebp)
  100eb1:	e8 9c 0e 00 00       	call   101d52 <print_trapframe>
  100eb6:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100eb9:	83 ec 0c             	sub    $0xc,%esp
  100ebc:	8d 83 fd 33 ff ff    	lea    -0xcc03(%ebx),%eax
  100ec2:	50                   	push   %eax
  100ec3:	e8 00 f5 ff ff       	call   1003c8 <readline>
  100ec8:	83 c4 10             	add    $0x10,%esp
  100ecb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ece:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ed2:	74 e5                	je     100eb9 <kmonitor+0x4a>
            if (runcmd(buf, tf) < 0) {
  100ed4:	83 ec 08             	sub    $0x8,%esp
  100ed7:	ff 75 08             	pushl  0x8(%ebp)
  100eda:	ff 75 f4             	pushl  -0xc(%ebp)
  100edd:	e8 c3 fe ff ff       	call   100da5 <runcmd>
  100ee2:	83 c4 10             	add    $0x10,%esp
  100ee5:	85 c0                	test   %eax,%eax
  100ee7:	78 02                	js     100eeb <kmonitor+0x7c>
        if ((buf = readline("K> ")) != NULL) {
  100ee9:	eb ce                	jmp    100eb9 <kmonitor+0x4a>
                break;
  100eeb:	90                   	nop
            }
        }
    }
}
  100eec:	90                   	nop
  100eed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ef0:	c9                   	leave  
  100ef1:	c3                   	ret    

00100ef2 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100ef2:	55                   	push   %ebp
  100ef3:	89 e5                	mov    %esp,%ebp
  100ef5:	56                   	push   %esi
  100ef6:	53                   	push   %ebx
  100ef7:	83 ec 10             	sub    $0x10,%esp
  100efa:	e8 7d f3 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100eff:	81 c3 51 fa 00 00    	add    $0xfa51,%ebx
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100f05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100f0c:	eb 44                	jmp    100f52 <mon_help+0x60>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100f0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f11:	8d 8b 14 00 00 00    	lea    0x14(%ebx),%ecx
  100f17:	89 d0                	mov    %edx,%eax
  100f19:	01 c0                	add    %eax,%eax
  100f1b:	01 d0                	add    %edx,%eax
  100f1d:	c1 e0 02             	shl    $0x2,%eax
  100f20:	01 c8                	add    %ecx,%eax
  100f22:	8b 08                	mov    (%eax),%ecx
  100f24:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f27:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100f2d:	89 d0                	mov    %edx,%eax
  100f2f:	01 c0                	add    %eax,%eax
  100f31:	01 d0                	add    %edx,%eax
  100f33:	c1 e0 02             	shl    $0x2,%eax
  100f36:	01 f0                	add    %esi,%eax
  100f38:	8b 00                	mov    (%eax),%eax
  100f3a:	83 ec 04             	sub    $0x4,%esp
  100f3d:	51                   	push   %ecx
  100f3e:	50                   	push   %eax
  100f3f:	8d 83 01 34 ff ff    	lea    -0xcbff(%ebx),%eax
  100f45:	50                   	push   %eax
  100f46:	e8 a4 f3 ff ff       	call   1002ef <cprintf>
  100f4b:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100f4e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100f52:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f55:	83 f8 02             	cmp    $0x2,%eax
  100f58:	76 b4                	jbe    100f0e <mon_help+0x1c>
    }
    return 0;
  100f5a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100f5f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100f62:	5b                   	pop    %ebx
  100f63:	5e                   	pop    %esi
  100f64:	5d                   	pop    %ebp
  100f65:	c3                   	ret    

00100f66 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100f66:	55                   	push   %ebp
  100f67:	89 e5                	mov    %esp,%ebp
  100f69:	53                   	push   %ebx
  100f6a:	83 ec 04             	sub    $0x4,%esp
  100f6d:	e8 06 f3 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  100f72:	05 de f9 00 00       	add    $0xf9de,%eax
    print_kerninfo();
  100f77:	89 c3                	mov    %eax,%ebx
  100f79:	e8 8e fa ff ff       	call   100a0c <print_kerninfo>
    return 0;
  100f7e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100f83:	83 c4 04             	add    $0x4,%esp
  100f86:	5b                   	pop    %ebx
  100f87:	5d                   	pop    %ebp
  100f88:	c3                   	ret    

00100f89 <mon_backtrace>:
    |   a   |
    |  ip+4 |
    |  ebp  |
*/
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100f89:	55                   	push   %ebp
  100f8a:	89 e5                	mov    %esp,%ebp
  100f8c:	53                   	push   %ebx
  100f8d:	83 ec 04             	sub    $0x4,%esp
  100f90:	e8 e3 f2 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  100f95:	05 bb f9 00 00       	add    $0xf9bb,%eax
    print_stackframe();
  100f9a:	89 c3                	mov    %eax,%ebx
  100f9c:	e8 5f fc ff ff       	call   100c00 <print_stackframe>
    return 0;
  100fa1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100fa6:	83 c4 04             	add    $0x4,%esp
  100fa9:	5b                   	pop    %ebx
  100faa:	5d                   	pop    %ebp
  100fab:	c3                   	ret    

00100fac <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100fac:	55                   	push   %ebp
  100fad:	89 e5                	mov    %esp,%ebp
  100faf:	53                   	push   %ebx
  100fb0:	83 ec 14             	sub    $0x14,%esp
  100fb3:	e8 c4 f2 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  100fb8:	81 c3 98 f9 00 00    	add    $0xf998,%ebx
  100fbe:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100fc4:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  100fc8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100fcc:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100fd0:	ee                   	out    %al,(%dx)
}
  100fd1:	90                   	nop
  100fd2:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100fd8:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  100fdc:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100fe0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100fe4:	ee                   	out    %al,(%dx)
}
  100fe5:	90                   	nop
  100fe6:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100fec:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  100ff0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ff4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ff8:	ee                   	out    %al,(%dx)
}
  100ff9:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100ffa:	c7 c0 90 19 11 00    	mov    $0x111990,%eax
  101000:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

    cprintf("++ setup timer interrupts\n");
  101006:	83 ec 0c             	sub    $0xc,%esp
  101009:	8d 83 0a 34 ff ff    	lea    -0xcbf6(%ebx),%eax
  10100f:	50                   	push   %eax
  101010:	e8 da f2 ff ff       	call   1002ef <cprintf>
  101015:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  101018:	83 ec 0c             	sub    $0xc,%esp
  10101b:	6a 00                	push   $0x0
  10101d:	e8 06 0a 00 00       	call   101a28 <pic_enable>
  101022:	83 c4 10             	add    $0x10,%esp
}
  101025:	90                   	nop
  101026:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101029:	c9                   	leave  
  10102a:	c3                   	ret    

0010102b <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  10102b:	55                   	push   %ebp
  10102c:	89 e5                	mov    %esp,%ebp
  10102e:	83 ec 10             	sub    $0x10,%esp
  101031:	e8 42 f2 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101036:	05 1a f9 00 00       	add    $0xf91a,%eax
  10103b:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile("inb %1, %0"
  101041:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101045:	89 c2                	mov    %eax,%edx
  101047:	ec                   	in     (%dx),%al
  101048:	88 45 f1             	mov    %al,-0xf(%ebp)
  10104b:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  101051:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101055:	89 c2                	mov    %eax,%edx
  101057:	ec                   	in     (%dx),%al
  101058:	88 45 f5             	mov    %al,-0xb(%ebp)
  10105b:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  101061:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101065:	89 c2                	mov    %eax,%edx
  101067:	ec                   	in     (%dx),%al
  101068:	88 45 f9             	mov    %al,-0x7(%ebp)
  10106b:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  101071:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  101075:	89 c2                	mov    %eax,%edx
  101077:	ec                   	in     (%dx),%al
  101078:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  10107b:	90                   	nop
  10107c:	c9                   	leave  
  10107d:	c3                   	ret    

0010107e <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  10107e:	55                   	push   %ebp
  10107f:	89 e5                	mov    %esp,%ebp
  101081:	83 ec 20             	sub    $0x20,%esp
  101084:	e8 34 09 00 00       	call   1019bd <__x86.get_pc_thunk.cx>
  101089:	81 c1 c7 f8 00 00    	add    $0xf8c7,%ecx
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;            //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  10108f:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  101096:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101099:	0f b7 00             	movzwl (%eax),%eax
  10109c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  1010a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010a3:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  1010a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010ab:	0f b7 00             	movzwl (%eax),%eax
  1010ae:	66 3d 5a a5          	cmp    $0xa55a,%ax
  1010b2:	74 12                	je     1010c6 <cga_init+0x48>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  1010b4:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  1010bb:	66 c7 81 76 05 00 00 	movw   $0x3b4,0x576(%ecx)
  1010c2:	b4 03 
  1010c4:	eb 13                	jmp    1010d9 <cga_init+0x5b>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  1010c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1010c9:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1010cd:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  1010d0:	66 c7 81 76 05 00 00 	movw   $0x3d4,0x576(%ecx)
  1010d7:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  1010d9:	0f b7 81 76 05 00 00 	movzwl 0x576(%ecx),%eax
  1010e0:	0f b7 c0             	movzwl %ax,%eax
  1010e3:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1010e7:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1010eb:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1010ef:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1010f3:	ee                   	out    %al,(%dx)
}
  1010f4:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  1010f5:	0f b7 81 76 05 00 00 	movzwl 0x576(%ecx),%eax
  1010fc:	83 c0 01             	add    $0x1,%eax
  1010ff:	0f b7 c0             	movzwl %ax,%eax
  101102:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile("inb %1, %0"
  101106:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  10110a:	89 c2                	mov    %eax,%edx
  10110c:	ec                   	in     (%dx),%al
  10110d:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  101110:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101114:	0f b6 c0             	movzbl %al,%eax
  101117:	c1 e0 08             	shl    $0x8,%eax
  10111a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  10111d:	0f b7 81 76 05 00 00 	movzwl 0x576(%ecx),%eax
  101124:	0f b7 c0             	movzwl %ax,%eax
  101127:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  10112b:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  10112f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101133:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101137:	ee                   	out    %al,(%dx)
}
  101138:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  101139:	0f b7 81 76 05 00 00 	movzwl 0x576(%ecx),%eax
  101140:	83 c0 01             	add    $0x1,%eax
  101143:	0f b7 c0             	movzwl %ax,%eax
  101146:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile("inb %1, %0"
  10114a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10114e:	89 c2                	mov    %eax,%edx
  101150:	ec                   	in     (%dx),%al
  101151:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  101154:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101158:	0f b6 c0             	movzbl %al,%eax
  10115b:	09 45 f4             	or     %eax,-0xc(%ebp)
    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  10115e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101161:	89 81 70 05 00 00    	mov    %eax,0x570(%ecx)
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  101167:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10116a:	66 89 81 74 05 00 00 	mov    %ax,0x574(%ecx)
}
  101171:	90                   	nop
  101172:	c9                   	leave  
  101173:	c3                   	ret    

00101174 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  101174:	55                   	push   %ebp
  101175:	89 e5                	mov    %esp,%ebp
  101177:	53                   	push   %ebx
  101178:	83 ec 34             	sub    $0x34,%esp
  10117b:	e8 3d 08 00 00       	call   1019bd <__x86.get_pc_thunk.cx>
  101180:	81 c1 d0 f7 00 00    	add    $0xf7d0,%ecx
  101186:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  10118c:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101190:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101194:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101198:	ee                   	out    %al,(%dx)
}
  101199:	90                   	nop
  10119a:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  1011a0:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1011a4:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1011a8:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1011ac:	ee                   	out    %al,(%dx)
}
  1011ad:	90                   	nop
  1011ae:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  1011b4:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1011b8:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1011bc:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1011c0:	ee                   	out    %al,(%dx)
}
  1011c1:	90                   	nop
  1011c2:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  1011c8:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1011cc:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1011d0:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1011d4:	ee                   	out    %al,(%dx)
}
  1011d5:	90                   	nop
  1011d6:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  1011dc:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1011e0:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1011e4:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1011e8:	ee                   	out    %al,(%dx)
}
  1011e9:	90                   	nop
  1011ea:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  1011f0:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1011f4:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1011f8:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1011fc:	ee                   	out    %al,(%dx)
}
  1011fd:	90                   	nop
  1011fe:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  101204:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101208:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10120c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101210:	ee                   	out    %al,(%dx)
}
  101211:	90                   	nop
  101212:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile("inb %1, %0"
  101218:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  10121c:	89 c2                	mov    %eax,%edx
  10121e:	ec                   	in     (%dx),%al
  10121f:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  101222:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    outb(COM1 + COM_MCR, 0);
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);
    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101226:	3c ff                	cmp    $0xff,%al
  101228:	0f 95 c0             	setne  %al
  10122b:	0f b6 c0             	movzbl %al,%eax
  10122e:	89 81 78 05 00 00    	mov    %eax,0x578(%ecx)
  101234:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile("inb %1, %0"
  10123a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10123e:	89 c2                	mov    %eax,%edx
  101240:	ec                   	in     (%dx),%al
  101241:	88 45 f1             	mov    %al,-0xf(%ebp)
  101244:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10124a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10124e:	89 c2                	mov    %eax,%edx
  101250:	ec                   	in     (%dx),%al
  101251:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101254:	8b 81 78 05 00 00    	mov    0x578(%ecx),%eax
  10125a:	85 c0                	test   %eax,%eax
  10125c:	74 0f                	je     10126d <serial_init+0xf9>
        pic_enable(IRQ_COM1);
  10125e:	83 ec 0c             	sub    $0xc,%esp
  101261:	6a 04                	push   $0x4
  101263:	89 cb                	mov    %ecx,%ebx
  101265:	e8 be 07 00 00       	call   101a28 <pic_enable>
  10126a:	83 c4 10             	add    $0x10,%esp
    }
}
  10126d:	90                   	nop
  10126e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101271:	c9                   	leave  
  101272:	c3                   	ret    

00101273 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101273:	55                   	push   %ebp
  101274:	89 e5                	mov    %esp,%ebp
  101276:	83 ec 20             	sub    $0x20,%esp
  101279:	e8 fa ef ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10127e:	05 d2 f6 00 00       	add    $0xf6d2,%eax
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101283:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10128a:	eb 09                	jmp    101295 <lpt_putc_sub+0x22>
        delay();
  10128c:	e8 9a fd ff ff       	call   10102b <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101291:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101295:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10129b:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10129f:	89 c2                	mov    %eax,%edx
  1012a1:	ec                   	in     (%dx),%al
  1012a2:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012a5:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012a9:	84 c0                	test   %al,%al
  1012ab:	78 09                	js     1012b6 <lpt_putc_sub+0x43>
  1012ad:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012b4:	7e d6                	jle    10128c <lpt_putc_sub+0x19>
    }
    outb(LPTPORT + 0, c);
  1012b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1012b9:	0f b6 c0             	movzbl %al,%eax
  1012bc:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  1012c2:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1012c5:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012c9:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012cd:	ee                   	out    %al,(%dx)
}
  1012ce:	90                   	nop
  1012cf:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1012d5:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1012d9:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012dd:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012e1:	ee                   	out    %al,(%dx)
}
  1012e2:	90                   	nop
  1012e3:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1012e9:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1012ed:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012f1:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012f5:	ee                   	out    %al,(%dx)
}
  1012f6:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1012f7:	90                   	nop
  1012f8:	c9                   	leave  
  1012f9:	c3                   	ret    

001012fa <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1012fa:	55                   	push   %ebp
  1012fb:	89 e5                	mov    %esp,%ebp
  1012fd:	e8 76 ef ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101302:	05 4e f6 00 00       	add    $0xf64e,%eax
    if (c != '\b') {
  101307:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10130b:	74 0d                	je     10131a <lpt_putc+0x20>
        lpt_putc_sub(c);
  10130d:	ff 75 08             	pushl  0x8(%ebp)
  101310:	e8 5e ff ff ff       	call   101273 <lpt_putc_sub>
  101315:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101318:	eb 1e                	jmp    101338 <lpt_putc+0x3e>
        lpt_putc_sub('\b');
  10131a:	6a 08                	push   $0x8
  10131c:	e8 52 ff ff ff       	call   101273 <lpt_putc_sub>
  101321:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101324:	6a 20                	push   $0x20
  101326:	e8 48 ff ff ff       	call   101273 <lpt_putc_sub>
  10132b:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  10132e:	6a 08                	push   $0x8
  101330:	e8 3e ff ff ff       	call   101273 <lpt_putc_sub>
  101335:	83 c4 04             	add    $0x4,%esp
}
  101338:	90                   	nop
  101339:	c9                   	leave  
  10133a:	c3                   	ret    

0010133b <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10133b:	55                   	push   %ebp
  10133c:	89 e5                	mov    %esp,%ebp
  10133e:	56                   	push   %esi
  10133f:	53                   	push   %ebx
  101340:	83 ec 20             	sub    $0x20,%esp
  101343:	e8 34 ef ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  101348:	81 c3 08 f6 00 00    	add    $0xf608,%ebx
    // set black on white
    if (!(c & ~0xFF)) {
  10134e:	8b 45 08             	mov    0x8(%ebp),%eax
  101351:	b0 00                	mov    $0x0,%al
  101353:	85 c0                	test   %eax,%eax
  101355:	75 07                	jne    10135e <cga_putc+0x23>
        c |= 0x0700;
  101357:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10135e:	8b 45 08             	mov    0x8(%ebp),%eax
  101361:	0f b6 c0             	movzbl %al,%eax
  101364:	83 f8 0d             	cmp    $0xd,%eax
  101367:	74 6f                	je     1013d8 <cga_putc+0x9d>
  101369:	83 f8 0d             	cmp    $0xd,%eax
  10136c:	0f 8f a1 00 00 00    	jg     101413 <cga_putc+0xd8>
  101372:	83 f8 08             	cmp    $0x8,%eax
  101375:	74 0a                	je     101381 <cga_putc+0x46>
  101377:	83 f8 0a             	cmp    $0xa,%eax
  10137a:	74 4b                	je     1013c7 <cga_putc+0x8c>
  10137c:	e9 92 00 00 00       	jmp    101413 <cga_putc+0xd8>
    case '\b':
        if (crt_pos > 0) {
  101381:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  101388:	66 85 c0             	test   %ax,%ax
  10138b:	0f 84 a8 00 00 00    	je     101439 <cga_putc+0xfe>
            crt_pos --;
  101391:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  101398:	83 e8 01             	sub    $0x1,%eax
  10139b:	66 89 83 74 05 00 00 	mov    %ax,0x574(%ebx)
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1013a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1013a5:	b0 00                	mov    $0x0,%al
  1013a7:	83 c8 20             	or     $0x20,%eax
  1013aa:	89 c1                	mov    %eax,%ecx
  1013ac:	8b 83 70 05 00 00    	mov    0x570(%ebx),%eax
  1013b2:	0f b7 93 74 05 00 00 	movzwl 0x574(%ebx),%edx
  1013b9:	0f b7 d2             	movzwl %dx,%edx
  1013bc:	01 d2                	add    %edx,%edx
  1013be:	01 d0                	add    %edx,%eax
  1013c0:	89 ca                	mov    %ecx,%edx
  1013c2:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1013c5:	eb 72                	jmp    101439 <cga_putc+0xfe>
    case '\n':
        crt_pos += CRT_COLS;
  1013c7:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  1013ce:	83 c0 50             	add    $0x50,%eax
  1013d1:	66 89 83 74 05 00 00 	mov    %ax,0x574(%ebx)
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1013d8:	0f b7 b3 74 05 00 00 	movzwl 0x574(%ebx),%esi
  1013df:	0f b7 8b 74 05 00 00 	movzwl 0x574(%ebx),%ecx
  1013e6:	0f b7 c1             	movzwl %cx,%eax
  1013e9:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1013ef:	c1 e8 10             	shr    $0x10,%eax
  1013f2:	89 c2                	mov    %eax,%edx
  1013f4:	66 c1 ea 06          	shr    $0x6,%dx
  1013f8:	89 d0                	mov    %edx,%eax
  1013fa:	c1 e0 02             	shl    $0x2,%eax
  1013fd:	01 d0                	add    %edx,%eax
  1013ff:	c1 e0 04             	shl    $0x4,%eax
  101402:	29 c1                	sub    %eax,%ecx
  101404:	89 ca                	mov    %ecx,%edx
  101406:	89 f0                	mov    %esi,%eax
  101408:	29 d0                	sub    %edx,%eax
  10140a:	66 89 83 74 05 00 00 	mov    %ax,0x574(%ebx)
        break;
  101411:	eb 27                	jmp    10143a <cga_putc+0xff>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101413:	8b 8b 70 05 00 00    	mov    0x570(%ebx),%ecx
  101419:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  101420:	8d 50 01             	lea    0x1(%eax),%edx
  101423:	66 89 93 74 05 00 00 	mov    %dx,0x574(%ebx)
  10142a:	0f b7 c0             	movzwl %ax,%eax
  10142d:	01 c0                	add    %eax,%eax
  10142f:	01 c8                	add    %ecx,%eax
  101431:	8b 55 08             	mov    0x8(%ebp),%edx
  101434:	66 89 10             	mov    %dx,(%eax)
        break;
  101437:	eb 01                	jmp    10143a <cga_putc+0xff>
        break;
  101439:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10143a:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  101441:	66 3d cf 07          	cmp    $0x7cf,%ax
  101445:	76 5d                	jbe    1014a4 <cga_putc+0x169>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101447:	8b 83 70 05 00 00    	mov    0x570(%ebx),%eax
  10144d:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101453:	8b 83 70 05 00 00    	mov    0x570(%ebx),%eax
  101459:	83 ec 04             	sub    $0x4,%esp
  10145c:	68 00 0f 00 00       	push   $0xf00
  101461:	52                   	push   %edx
  101462:	50                   	push   %eax
  101463:	e8 29 1d 00 00       	call   103191 <memmove>
  101468:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10146b:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101472:	eb 16                	jmp    10148a <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  101474:	8b 83 70 05 00 00    	mov    0x570(%ebx),%eax
  10147a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10147d:	01 d2                	add    %edx,%edx
  10147f:	01 d0                	add    %edx,%eax
  101481:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101486:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10148a:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101491:	7e e1                	jle    101474 <cga_putc+0x139>
        }
        crt_pos -= CRT_COLS;
  101493:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  10149a:	83 e8 50             	sub    $0x50,%eax
  10149d:	66 89 83 74 05 00 00 	mov    %ax,0x574(%ebx)
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1014a4:	0f b7 83 76 05 00 00 	movzwl 0x576(%ebx),%eax
  1014ab:	0f b7 c0             	movzwl %ax,%eax
  1014ae:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1014b2:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1014b6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1014ba:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1014be:	ee                   	out    %al,(%dx)
}
  1014bf:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  1014c0:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  1014c7:	66 c1 e8 08          	shr    $0x8,%ax
  1014cb:	0f b6 c0             	movzbl %al,%eax
  1014ce:	0f b7 93 76 05 00 00 	movzwl 0x576(%ebx),%edx
  1014d5:	83 c2 01             	add    $0x1,%edx
  1014d8:	0f b7 d2             	movzwl %dx,%edx
  1014db:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1014df:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1014e2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1014e6:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1014ea:	ee                   	out    %al,(%dx)
}
  1014eb:	90                   	nop
    outb(addr_6845, 15);
  1014ec:	0f b7 83 76 05 00 00 	movzwl 0x576(%ebx),%eax
  1014f3:	0f b7 c0             	movzwl %ax,%eax
  1014f6:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1014fa:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1014fe:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101502:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101506:	ee                   	out    %al,(%dx)
}
  101507:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  101508:	0f b7 83 74 05 00 00 	movzwl 0x574(%ebx),%eax
  10150f:	0f b6 c0             	movzbl %al,%eax
  101512:	0f b7 93 76 05 00 00 	movzwl 0x576(%ebx),%edx
  101519:	83 c2 01             	add    $0x1,%edx
  10151c:	0f b7 d2             	movzwl %dx,%edx
  10151f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101523:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101526:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10152a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10152e:	ee                   	out    %al,(%dx)
}
  10152f:	90                   	nop
}
  101530:	90                   	nop
  101531:	8d 65 f8             	lea    -0x8(%ebp),%esp
  101534:	5b                   	pop    %ebx
  101535:	5e                   	pop    %esi
  101536:	5d                   	pop    %ebp
  101537:	c3                   	ret    

00101538 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101538:	55                   	push   %ebp
  101539:	89 e5                	mov    %esp,%ebp
  10153b:	83 ec 10             	sub    $0x10,%esp
  10153e:	e8 35 ed ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101543:	05 0d f4 00 00       	add    $0xf40d,%eax
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101548:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10154f:	eb 09                	jmp    10155a <serial_putc_sub+0x22>
        delay();
  101551:	e8 d5 fa ff ff       	call   10102b <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101556:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10155a:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile("inb %1, %0"
  101560:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101564:	89 c2                	mov    %eax,%edx
  101566:	ec                   	in     (%dx),%al
  101567:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10156a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10156e:	0f b6 c0             	movzbl %al,%eax
  101571:	83 e0 20             	and    $0x20,%eax
  101574:	85 c0                	test   %eax,%eax
  101576:	75 09                	jne    101581 <serial_putc_sub+0x49>
  101578:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10157f:	7e d0                	jle    101551 <serial_putc_sub+0x19>
    }
    outb(COM1 + COM_TX, c);
  101581:	8b 45 08             	mov    0x8(%ebp),%eax
  101584:	0f b6 c0             	movzbl %al,%eax
  101587:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10158d:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101590:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101594:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101598:	ee                   	out    %al,(%dx)
}
  101599:	90                   	nop
}
  10159a:	90                   	nop
  10159b:	c9                   	leave  
  10159c:	c3                   	ret    

0010159d <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10159d:	55                   	push   %ebp
  10159e:	89 e5                	mov    %esp,%ebp
  1015a0:	e8 d3 ec ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1015a5:	05 ab f3 00 00       	add    $0xf3ab,%eax
    if (c != '\b') {
  1015aa:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1015ae:	74 0d                	je     1015bd <serial_putc+0x20>
        serial_putc_sub(c);
  1015b0:	ff 75 08             	pushl  0x8(%ebp)
  1015b3:	e8 80 ff ff ff       	call   101538 <serial_putc_sub>
  1015b8:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1015bb:	eb 1e                	jmp    1015db <serial_putc+0x3e>
        serial_putc_sub('\b');
  1015bd:	6a 08                	push   $0x8
  1015bf:	e8 74 ff ff ff       	call   101538 <serial_putc_sub>
  1015c4:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1015c7:	6a 20                	push   $0x20
  1015c9:	e8 6a ff ff ff       	call   101538 <serial_putc_sub>
  1015ce:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1015d1:	6a 08                	push   $0x8
  1015d3:	e8 60 ff ff ff       	call   101538 <serial_putc_sub>
  1015d8:	83 c4 04             	add    $0x4,%esp
}
  1015db:	90                   	nop
  1015dc:	c9                   	leave  
  1015dd:	c3                   	ret    

001015de <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1015de:	55                   	push   %ebp
  1015df:	89 e5                	mov    %esp,%ebp
  1015e1:	53                   	push   %ebx
  1015e2:	83 ec 14             	sub    $0x14,%esp
  1015e5:	e8 92 ec ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  1015ea:	81 c3 66 f3 00 00    	add    $0xf366,%ebx
    int c;
    while ((c = (*proc)()) != -1) {
  1015f0:	eb 36                	jmp    101628 <cons_intr+0x4a>
        if (c != 0) {
  1015f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1015f6:	74 30                	je     101628 <cons_intr+0x4a>
            cons.buf[cons.wpos ++] = c;
  1015f8:	8b 83 94 07 00 00    	mov    0x794(%ebx),%eax
  1015fe:	8d 50 01             	lea    0x1(%eax),%edx
  101601:	89 93 94 07 00 00    	mov    %edx,0x794(%ebx)
  101607:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10160a:	88 94 03 90 05 00 00 	mov    %dl,0x590(%ebx,%eax,1)
            if (cons.wpos == CONSBUFSIZE) {
  101611:	8b 83 94 07 00 00    	mov    0x794(%ebx),%eax
  101617:	3d 00 02 00 00       	cmp    $0x200,%eax
  10161c:	75 0a                	jne    101628 <cons_intr+0x4a>
                cons.wpos = 0;
  10161e:	c7 83 94 07 00 00 00 	movl   $0x0,0x794(%ebx)
  101625:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101628:	8b 45 08             	mov    0x8(%ebp),%eax
  10162b:	ff d0                	call   *%eax
  10162d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101630:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101634:	75 bc                	jne    1015f2 <cons_intr+0x14>
            }
        }
    }
}
  101636:	90                   	nop
  101637:	90                   	nop
  101638:	83 c4 14             	add    $0x14,%esp
  10163b:	5b                   	pop    %ebx
  10163c:	5d                   	pop    %ebp
  10163d:	c3                   	ret    

0010163e <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10163e:	55                   	push   %ebp
  10163f:	89 e5                	mov    %esp,%ebp
  101641:	83 ec 10             	sub    $0x10,%esp
  101644:	e8 2f ec ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101649:	05 07 f3 00 00       	add    $0xf307,%eax
  10164e:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile("inb %1, %0"
  101654:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101658:	89 c2                	mov    %eax,%edx
  10165a:	ec                   	in     (%dx),%al
  10165b:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10165e:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101662:	0f b6 c0             	movzbl %al,%eax
  101665:	83 e0 01             	and    $0x1,%eax
  101668:	85 c0                	test   %eax,%eax
  10166a:	75 07                	jne    101673 <serial_proc_data+0x35>
        return -1;
  10166c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101671:	eb 2a                	jmp    10169d <serial_proc_data+0x5f>
  101673:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile("inb %1, %0"
  101679:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10167d:	89 c2                	mov    %eax,%edx
  10167f:	ec                   	in     (%dx),%al
  101680:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101683:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101687:	0f b6 c0             	movzbl %al,%eax
  10168a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10168d:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101691:	75 07                	jne    10169a <serial_proc_data+0x5c>
        c = '\b';
  101693:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10169a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10169d:	c9                   	leave  
  10169e:	c3                   	ret    

0010169f <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10169f:	55                   	push   %ebp
  1016a0:	89 e5                	mov    %esp,%ebp
  1016a2:	83 ec 08             	sub    $0x8,%esp
  1016a5:	e8 ce eb ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1016aa:	05 a6 f2 00 00       	add    $0xf2a6,%eax
    if (serial_exists) {
  1016af:	8b 90 78 05 00 00    	mov    0x578(%eax),%edx
  1016b5:	85 d2                	test   %edx,%edx
  1016b7:	74 12                	je     1016cb <serial_intr+0x2c>
        cons_intr(serial_proc_data);
  1016b9:	83 ec 0c             	sub    $0xc,%esp
  1016bc:	8d 80 ee 0c ff ff    	lea    -0xf312(%eax),%eax
  1016c2:	50                   	push   %eax
  1016c3:	e8 16 ff ff ff       	call   1015de <cons_intr>
  1016c8:	83 c4 10             	add    $0x10,%esp
    }
}
  1016cb:	90                   	nop
  1016cc:	c9                   	leave  
  1016cd:	c3                   	ret    

001016ce <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1016ce:	55                   	push   %ebp
  1016cf:	89 e5                	mov    %esp,%ebp
  1016d1:	53                   	push   %ebx
  1016d2:	83 ec 24             	sub    $0x24,%esp
  1016d5:	e8 e3 02 00 00       	call   1019bd <__x86.get_pc_thunk.cx>
  1016da:	81 c1 76 f2 00 00    	add    $0xf276,%ecx
  1016e0:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile("inb %1, %0"
  1016e6:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1016ea:	89 c2                	mov    %eax,%edx
  1016ec:	ec                   	in     (%dx),%al
  1016ed:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1016f0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1016f4:	0f b6 c0             	movzbl %al,%eax
  1016f7:	83 e0 01             	and    $0x1,%eax
  1016fa:	85 c0                	test   %eax,%eax
  1016fc:	75 0a                	jne    101708 <kbd_proc_data+0x3a>
        return -1;
  1016fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101703:	e9 74 01 00 00       	jmp    10187c <kbd_proc_data+0x1ae>
  101708:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile("inb %1, %0"
  10170e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101712:	89 c2                	mov    %eax,%edx
  101714:	ec                   	in     (%dx),%al
  101715:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101718:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10171c:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10171f:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101723:	75 19                	jne    10173e <kbd_proc_data+0x70>
        // E0 escape character
        shift |= E0ESC;
  101725:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  10172b:	83 c8 40             	or     $0x40,%eax
  10172e:	89 81 98 07 00 00    	mov    %eax,0x798(%ecx)
        return 0;
  101734:	b8 00 00 00 00       	mov    $0x0,%eax
  101739:	e9 3e 01 00 00       	jmp    10187c <kbd_proc_data+0x1ae>
    } else if (data & 0x80) {
  10173e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101742:	84 c0                	test   %al,%al
  101744:	79 4b                	jns    101791 <kbd_proc_data+0xc3>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101746:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  10174c:	83 e0 40             	and    $0x40,%eax
  10174f:	85 c0                	test   %eax,%eax
  101751:	75 09                	jne    10175c <kbd_proc_data+0x8e>
  101753:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101757:	83 e0 7f             	and    $0x7f,%eax
  10175a:	eb 04                	jmp    101760 <kbd_proc_data+0x92>
  10175c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101760:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101763:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101767:	0f b6 84 01 b0 f6 ff 	movzbl -0x950(%ecx,%eax,1),%eax
  10176e:	ff 
  10176f:	83 c8 40             	or     $0x40,%eax
  101772:	0f b6 c0             	movzbl %al,%eax
  101775:	f7 d0                	not    %eax
  101777:	89 c2                	mov    %eax,%edx
  101779:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  10177f:	21 d0                	and    %edx,%eax
  101781:	89 81 98 07 00 00    	mov    %eax,0x798(%ecx)
        return 0;
  101787:	b8 00 00 00 00       	mov    $0x0,%eax
  10178c:	e9 eb 00 00 00       	jmp    10187c <kbd_proc_data+0x1ae>
    } else if (shift & E0ESC) {
  101791:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  101797:	83 e0 40             	and    $0x40,%eax
  10179a:	85 c0                	test   %eax,%eax
  10179c:	74 13                	je     1017b1 <kbd_proc_data+0xe3>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10179e:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1017a2:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  1017a8:	83 e0 bf             	and    $0xffffffbf,%eax
  1017ab:	89 81 98 07 00 00    	mov    %eax,0x798(%ecx)
    }

    shift |= shiftcode[data];
  1017b1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1017b5:	0f b6 84 01 b0 f6 ff 	movzbl -0x950(%ecx,%eax,1),%eax
  1017bc:	ff 
  1017bd:	0f b6 d0             	movzbl %al,%edx
  1017c0:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  1017c6:	09 d0                	or     %edx,%eax
  1017c8:	89 81 98 07 00 00    	mov    %eax,0x798(%ecx)
    shift ^= togglecode[data];
  1017ce:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1017d2:	0f b6 84 01 b0 f7 ff 	movzbl -0x850(%ecx,%eax,1),%eax
  1017d9:	ff 
  1017da:	0f b6 d0             	movzbl %al,%edx
  1017dd:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  1017e3:	31 d0                	xor    %edx,%eax
  1017e5:	89 81 98 07 00 00    	mov    %eax,0x798(%ecx)

    c = charcode[shift & (CTL | SHIFT)][data];
  1017eb:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  1017f1:	83 e0 03             	and    $0x3,%eax
  1017f4:	8b 94 81 34 00 00 00 	mov    0x34(%ecx,%eax,4),%edx
  1017fb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1017ff:	01 d0                	add    %edx,%eax
  101801:	0f b6 00             	movzbl (%eax),%eax
  101804:	0f b6 c0             	movzbl %al,%eax
  101807:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  10180a:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  101810:	83 e0 08             	and    $0x8,%eax
  101813:	85 c0                	test   %eax,%eax
  101815:	74 22                	je     101839 <kbd_proc_data+0x16b>
        if ('a' <= c && c <= 'z')
  101817:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  10181b:	7e 0c                	jle    101829 <kbd_proc_data+0x15b>
  10181d:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101821:	7f 06                	jg     101829 <kbd_proc_data+0x15b>
            c += 'A' - 'a';
  101823:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101827:	eb 10                	jmp    101839 <kbd_proc_data+0x16b>
        else if ('A' <= c && c <= 'Z')
  101829:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10182d:	7e 0a                	jle    101839 <kbd_proc_data+0x16b>
  10182f:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101833:	7f 04                	jg     101839 <kbd_proc_data+0x16b>
            c += 'a' - 'A';
  101835:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101839:	8b 81 98 07 00 00    	mov    0x798(%ecx),%eax
  10183f:	f7 d0                	not    %eax
  101841:	83 e0 06             	and    $0x6,%eax
  101844:	85 c0                	test   %eax,%eax
  101846:	75 31                	jne    101879 <kbd_proc_data+0x1ab>
  101848:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10184f:	75 28                	jne    101879 <kbd_proc_data+0x1ab>
        cprintf("Rebooting!\n");
  101851:	83 ec 0c             	sub    $0xc,%esp
  101854:	8d 81 25 34 ff ff    	lea    -0xcbdb(%ecx),%eax
  10185a:	50                   	push   %eax
  10185b:	89 cb                	mov    %ecx,%ebx
  10185d:	e8 8d ea ff ff       	call   1002ef <cprintf>
  101862:	83 c4 10             	add    $0x10,%esp
  101865:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10186b:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  10186f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101873:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101877:	ee                   	out    %al,(%dx)
}
  101878:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101879:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10187c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10187f:	c9                   	leave  
  101880:	c3                   	ret    

00101881 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101881:	55                   	push   %ebp
  101882:	89 e5                	mov    %esp,%ebp
  101884:	83 ec 08             	sub    $0x8,%esp
  101887:	e8 ec e9 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10188c:	05 c4 f0 00 00       	add    $0xf0c4,%eax
    cons_intr(kbd_proc_data);
  101891:	83 ec 0c             	sub    $0xc,%esp
  101894:	8d 80 7e 0d ff ff    	lea    -0xf282(%eax),%eax
  10189a:	50                   	push   %eax
  10189b:	e8 3e fd ff ff       	call   1015de <cons_intr>
  1018a0:	83 c4 10             	add    $0x10,%esp
}
  1018a3:	90                   	nop
  1018a4:	c9                   	leave  
  1018a5:	c3                   	ret    

001018a6 <kbd_init>:

static void
kbd_init(void) {
  1018a6:	55                   	push   %ebp
  1018a7:	89 e5                	mov    %esp,%ebp
  1018a9:	53                   	push   %ebx
  1018aa:	83 ec 04             	sub    $0x4,%esp
  1018ad:	e8 ca e9 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  1018b2:	81 c3 9e f0 00 00    	add    $0xf09e,%ebx
    // drain the kbd buffer
    kbd_intr();
  1018b8:	e8 c4 ff ff ff       	call   101881 <kbd_intr>
    pic_enable(IRQ_KBD);
  1018bd:	83 ec 0c             	sub    $0xc,%esp
  1018c0:	6a 01                	push   $0x1
  1018c2:	e8 61 01 00 00       	call   101a28 <pic_enable>
  1018c7:	83 c4 10             	add    $0x10,%esp
}
  1018ca:	90                   	nop
  1018cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1018ce:	c9                   	leave  
  1018cf:	c3                   	ret    

001018d0 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1018d0:	55                   	push   %ebp
  1018d1:	89 e5                	mov    %esp,%ebp
  1018d3:	53                   	push   %ebx
  1018d4:	83 ec 04             	sub    $0x4,%esp
  1018d7:	e8 a0 e9 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  1018dc:	81 c3 74 f0 00 00    	add    $0xf074,%ebx
    cga_init();
  1018e2:	e8 97 f7 ff ff       	call   10107e <cga_init>
    serial_init();
  1018e7:	e8 88 f8 ff ff       	call   101174 <serial_init>
    kbd_init();
  1018ec:	e8 b5 ff ff ff       	call   1018a6 <kbd_init>
    if (!serial_exists) {
  1018f1:	8b 83 78 05 00 00    	mov    0x578(%ebx),%eax
  1018f7:	85 c0                	test   %eax,%eax
  1018f9:	75 12                	jne    10190d <cons_init+0x3d>
        cprintf("serial port does not exist!!\n");
  1018fb:	83 ec 0c             	sub    $0xc,%esp
  1018fe:	8d 83 31 34 ff ff    	lea    -0xcbcf(%ebx),%eax
  101904:	50                   	push   %eax
  101905:	e8 e5 e9 ff ff       	call   1002ef <cprintf>
  10190a:	83 c4 10             	add    $0x10,%esp
    }
}
  10190d:	90                   	nop
  10190e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101911:	c9                   	leave  
  101912:	c3                   	ret    

00101913 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101913:	55                   	push   %ebp
  101914:	89 e5                	mov    %esp,%ebp
  101916:	83 ec 08             	sub    $0x8,%esp
  101919:	e8 5a e9 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10191e:	05 32 f0 00 00       	add    $0xf032,%eax
    lpt_putc(c);
  101923:	ff 75 08             	pushl  0x8(%ebp)
  101926:	e8 cf f9 ff ff       	call   1012fa <lpt_putc>
  10192b:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  10192e:	83 ec 0c             	sub    $0xc,%esp
  101931:	ff 75 08             	pushl  0x8(%ebp)
  101934:	e8 02 fa ff ff       	call   10133b <cga_putc>
  101939:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  10193c:	83 ec 0c             	sub    $0xc,%esp
  10193f:	ff 75 08             	pushl  0x8(%ebp)
  101942:	e8 56 fc ff ff       	call   10159d <serial_putc>
  101947:	83 c4 10             	add    $0x10,%esp
}
  10194a:	90                   	nop
  10194b:	c9                   	leave  
  10194c:	c3                   	ret    

0010194d <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10194d:	55                   	push   %ebp
  10194e:	89 e5                	mov    %esp,%ebp
  101950:	53                   	push   %ebx
  101951:	83 ec 14             	sub    $0x14,%esp
  101954:	e8 23 e9 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  101959:	81 c3 f7 ef 00 00    	add    $0xeff7,%ebx
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10195f:	e8 3b fd ff ff       	call   10169f <serial_intr>
    kbd_intr();
  101964:	e8 18 ff ff ff       	call   101881 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101969:	8b 93 90 07 00 00    	mov    0x790(%ebx),%edx
  10196f:	8b 83 94 07 00 00    	mov    0x794(%ebx),%eax
  101975:	39 c2                	cmp    %eax,%edx
  101977:	74 39                	je     1019b2 <cons_getc+0x65>
        c = cons.buf[cons.rpos ++];
  101979:	8b 83 90 07 00 00    	mov    0x790(%ebx),%eax
  10197f:	8d 50 01             	lea    0x1(%eax),%edx
  101982:	89 93 90 07 00 00    	mov    %edx,0x790(%ebx)
  101988:	0f b6 84 03 90 05 00 	movzbl 0x590(%ebx,%eax,1),%eax
  10198f:	00 
  101990:	0f b6 c0             	movzbl %al,%eax
  101993:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101996:	8b 83 90 07 00 00    	mov    0x790(%ebx),%eax
  10199c:	3d 00 02 00 00       	cmp    $0x200,%eax
  1019a1:	75 0a                	jne    1019ad <cons_getc+0x60>
            cons.rpos = 0;
  1019a3:	c7 83 90 07 00 00 00 	movl   $0x0,0x790(%ebx)
  1019aa:	00 00 00 
        }
        return c;
  1019ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019b0:	eb 05                	jmp    1019b7 <cons_getc+0x6a>
    }
    return 0;
  1019b2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1019b7:	83 c4 14             	add    $0x14,%esp
  1019ba:	5b                   	pop    %ebx
  1019bb:	5d                   	pop    %ebp
  1019bc:	c3                   	ret    

001019bd <__x86.get_pc_thunk.cx>:
  1019bd:	8b 0c 24             	mov    (%esp),%ecx
  1019c0:	c3                   	ret    

001019c1 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1019c1:	55                   	push   %ebp
  1019c2:	89 e5                	mov    %esp,%ebp
  1019c4:	83 ec 14             	sub    $0x14,%esp
  1019c7:	e8 ac e8 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1019cc:	05 84 ef 00 00       	add    $0xef84,%eax
  1019d1:	8b 55 08             	mov    0x8(%ebp),%edx
  1019d4:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
    irq_mask = mask;
  1019d8:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  1019dc:	66 89 90 b0 fb ff ff 	mov    %dx,-0x450(%eax)
    if (did_init) {
  1019e3:	8b 80 9c 07 00 00    	mov    0x79c(%eax),%eax
  1019e9:	85 c0                	test   %eax,%eax
  1019eb:	74 38                	je     101a25 <pic_setmask+0x64>
        outb(IO_PIC1 + 1, mask);
  1019ed:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1019f1:	0f b6 c0             	movzbl %al,%eax
  1019f4:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  1019fa:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  1019fd:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101a01:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101a05:	ee                   	out    %al,(%dx)
}
  101a06:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101a07:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101a0b:	66 c1 e8 08          	shr    $0x8,%ax
  101a0f:	0f b6 c0             	movzbl %al,%eax
  101a12:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101a18:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101a1b:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101a1f:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101a23:	ee                   	out    %al,(%dx)
}
  101a24:	90                   	nop
    }
}
  101a25:	90                   	nop
  101a26:	c9                   	leave  
  101a27:	c3                   	ret    

00101a28 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101a28:	55                   	push   %ebp
  101a29:	89 e5                	mov    %esp,%ebp
  101a2b:	53                   	push   %ebx
  101a2c:	e8 47 e8 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101a31:	05 1f ef 00 00       	add    $0xef1f,%eax
    pic_setmask(irq_mask & ~(1 << irq));
  101a36:	8b 55 08             	mov    0x8(%ebp),%edx
  101a39:	bb 01 00 00 00       	mov    $0x1,%ebx
  101a3e:	89 d1                	mov    %edx,%ecx
  101a40:	d3 e3                	shl    %cl,%ebx
  101a42:	89 da                	mov    %ebx,%edx
  101a44:	f7 d2                	not    %edx
  101a46:	0f b7 80 b0 fb ff ff 	movzwl -0x450(%eax),%eax
  101a4d:	21 d0                	and    %edx,%eax
  101a4f:	0f b7 c0             	movzwl %ax,%eax
  101a52:	50                   	push   %eax
  101a53:	e8 69 ff ff ff       	call   1019c1 <pic_setmask>
  101a58:	83 c4 04             	add    $0x4,%esp
}
  101a5b:	90                   	nop
  101a5c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101a5f:	c9                   	leave  
  101a60:	c3                   	ret    

00101a61 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101a61:	55                   	push   %ebp
  101a62:	89 e5                	mov    %esp,%ebp
  101a64:	83 ec 40             	sub    $0x40,%esp
  101a67:	e8 51 ff ff ff       	call   1019bd <__x86.get_pc_thunk.cx>
  101a6c:	81 c1 e4 ee 00 00    	add    $0xeee4,%ecx
    did_init = 1;
  101a72:	c7 81 9c 07 00 00 01 	movl   $0x1,0x79c(%ecx)
  101a79:	00 00 00 
  101a7c:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  101a82:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101a86:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101a8a:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101a8e:	ee                   	out    %al,(%dx)
}
  101a8f:	90                   	nop
  101a90:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  101a96:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101a9a:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101a9e:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101aa2:	ee                   	out    %al,(%dx)
}
  101aa3:	90                   	nop
  101aa4:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101aaa:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101aae:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101ab2:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101ab6:	ee                   	out    %al,(%dx)
}
  101ab7:	90                   	nop
  101ab8:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101abe:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101ac2:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101ac6:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101aca:	ee                   	out    %al,(%dx)
}
  101acb:	90                   	nop
  101acc:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101ad2:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101ad6:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101ada:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101ade:	ee                   	out    %al,(%dx)
}
  101adf:	90                   	nop
  101ae0:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101ae6:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101aea:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101aee:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101af2:	ee                   	out    %al,(%dx)
}
  101af3:	90                   	nop
  101af4:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101afa:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101afe:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101b02:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101b06:	ee                   	out    %al,(%dx)
}
  101b07:	90                   	nop
  101b08:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101b0e:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101b12:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101b16:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101b1a:	ee                   	out    %al,(%dx)
}
  101b1b:	90                   	nop
  101b1c:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101b22:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101b26:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101b2a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101b2e:	ee                   	out    %al,(%dx)
}
  101b2f:	90                   	nop
  101b30:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101b36:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101b3a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101b3e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101b42:	ee                   	out    %al,(%dx)
}
  101b43:	90                   	nop
  101b44:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101b4a:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101b4e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101b52:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101b56:	ee                   	out    %al,(%dx)
}
  101b57:	90                   	nop
  101b58:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101b5e:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101b62:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101b66:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101b6a:	ee                   	out    %al,(%dx)
}
  101b6b:	90                   	nop
  101b6c:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101b72:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101b76:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101b7a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101b7e:	ee                   	out    %al,(%dx)
}
  101b7f:	90                   	nop
  101b80:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101b86:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
  101b8a:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101b8e:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101b92:	ee                   	out    %al,(%dx)
}
  101b93:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101b94:	0f b7 81 b0 fb ff ff 	movzwl -0x450(%ecx),%eax
  101b9b:	66 83 f8 ff          	cmp    $0xffff,%ax
  101b9f:	74 13                	je     101bb4 <pic_init+0x153>
        pic_setmask(irq_mask);
  101ba1:	0f b7 81 b0 fb ff ff 	movzwl -0x450(%ecx),%eax
  101ba8:	0f b7 c0             	movzwl %ax,%eax
  101bab:	50                   	push   %eax
  101bac:	e8 10 fe ff ff       	call   1019c1 <pic_setmask>
  101bb1:	83 c4 04             	add    $0x4,%esp
    }
}
  101bb4:	90                   	nop
  101bb5:	c9                   	leave  
  101bb6:	c3                   	ret    

00101bb7 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101bb7:	55                   	push   %ebp
  101bb8:	89 e5                	mov    %esp,%ebp
  101bba:	e8 b9 e6 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101bbf:	05 91 ed 00 00       	add    $0xed91,%eax
}

static inline void
sti(void)
{
    asm volatile("sti");
  101bc4:	fb                   	sti    
}
  101bc5:	90                   	nop
    sti();
}
  101bc6:	90                   	nop
  101bc7:	5d                   	pop    %ebp
  101bc8:	c3                   	ret    

00101bc9 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101bc9:	55                   	push   %ebp
  101bca:	89 e5                	mov    %esp,%ebp
  101bcc:	e8 a7 e6 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101bd1:	05 7f ed 00 00       	add    $0xed7f,%eax

static inline void
cli(void)
{
    asm volatile("cli");
  101bd6:	fa                   	cli    
}
  101bd7:	90                   	nop
    cli();
}
  101bd8:	90                   	nop
  101bd9:	5d                   	pop    %ebp
  101bda:	c3                   	ret    

00101bdb <idt_init>:
};*/
static struct pseudodesc idt_pd;

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101bdb:	55                   	push   %ebp
  101bdc:	89 e5                	mov    %esp,%ebp
  101bde:	83 ec 10             	sub    $0x10,%esp
  101be1:	e8 92 e6 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101be6:	05 6a ed 00 00       	add    $0xed6a,%eax
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
	int i;
    idt_pd.pd_lim  = sizeof(idt) - 1;
  101beb:	66 c7 80 b0 0f 00 00 	movw   $0x7ff,0xfb0(%eax)
  101bf2:	ff 07 
    idt_pd.pd_base = (uintptr_t) idt;
  101bf4:	8d 90 b0 07 00 00    	lea    0x7b0(%eax),%edx
  101bfa:	89 90 b2 0f 00 00    	mov    %edx,0xfb2(%eax)

    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i++)
  101c00:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101c07:	e9 c7 00 00 00       	jmp    101cd3 <idt_init+0xf8>
    {
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101c0c:	c7 c2 02 05 11 00    	mov    $0x110502,%edx
  101c12:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101c15:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
  101c18:	89 d1                	mov    %edx,%ecx
  101c1a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c1d:	66 89 8c d0 b0 07 00 	mov    %cx,0x7b0(%eax,%edx,8)
  101c24:	00 
  101c25:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c28:	66 c7 84 d0 b2 07 00 	movw   $0x8,0x7b2(%eax,%edx,8)
  101c2f:	00 08 00 
  101c32:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c35:	0f b6 8c d0 b4 07 00 	movzbl 0x7b4(%eax,%edx,8),%ecx
  101c3c:	00 
  101c3d:	83 e1 e0             	and    $0xffffffe0,%ecx
  101c40:	88 8c d0 b4 07 00 00 	mov    %cl,0x7b4(%eax,%edx,8)
  101c47:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c4a:	0f b6 8c d0 b4 07 00 	movzbl 0x7b4(%eax,%edx,8),%ecx
  101c51:	00 
  101c52:	83 e1 1f             	and    $0x1f,%ecx
  101c55:	88 8c d0 b4 07 00 00 	mov    %cl,0x7b4(%eax,%edx,8)
  101c5c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c5f:	0f b6 8c d0 b5 07 00 	movzbl 0x7b5(%eax,%edx,8),%ecx
  101c66:	00 
  101c67:	83 e1 f0             	and    $0xfffffff0,%ecx
  101c6a:	83 c9 0e             	or     $0xe,%ecx
  101c6d:	88 8c d0 b5 07 00 00 	mov    %cl,0x7b5(%eax,%edx,8)
  101c74:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c77:	0f b6 8c d0 b5 07 00 	movzbl 0x7b5(%eax,%edx,8),%ecx
  101c7e:	00 
  101c7f:	83 e1 ef             	and    $0xffffffef,%ecx
  101c82:	88 8c d0 b5 07 00 00 	mov    %cl,0x7b5(%eax,%edx,8)
  101c89:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101c8c:	0f b6 8c d0 b5 07 00 	movzbl 0x7b5(%eax,%edx,8),%ecx
  101c93:	00 
  101c94:	83 e1 9f             	and    $0xffffff9f,%ecx
  101c97:	88 8c d0 b5 07 00 00 	mov    %cl,0x7b5(%eax,%edx,8)
  101c9e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101ca1:	0f b6 8c d0 b5 07 00 	movzbl 0x7b5(%eax,%edx,8),%ecx
  101ca8:	00 
  101ca9:	83 c9 80             	or     $0xffffff80,%ecx
  101cac:	88 8c d0 b5 07 00 00 	mov    %cl,0x7b5(%eax,%edx,8)
  101cb3:	c7 c2 02 05 11 00    	mov    $0x110502,%edx
  101cb9:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  101cbc:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
  101cbf:	c1 ea 10             	shr    $0x10,%edx
  101cc2:	89 d1                	mov    %edx,%ecx
  101cc4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cc7:	66 89 8c d0 b6 07 00 	mov    %cx,0x7b6(%eax,%edx,8)
  101cce:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i++)
  101ccf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101cd3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101cd6:	81 fa ff 00 00 00    	cmp    $0xff,%edx
  101cdc:	0f 86 2a ff ff ff    	jbe    101c0c <idt_init+0x31>
  101ce2:	8d 80 b0 0f 00 00    	lea    0xfb0(%eax),%eax
  101ce8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    asm volatile("lidt (%0)" ::"r"(pd));
  101ceb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101cee:	0f 01 18             	lidtl  (%eax)
}
  101cf1:	90                   	nop
    }
    lidt(&idt_pd);
}
  101cf2:	90                   	nop
  101cf3:	c9                   	leave  
  101cf4:	c3                   	ret    

00101cf5 <trapname>:

static const char *
trapname(int trapno) {
  101cf5:	55                   	push   %ebp
  101cf6:	89 e5                	mov    %esp,%ebp
  101cf8:	e8 7b e5 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101cfd:	05 53 ec 00 00       	add    $0xec53,%eax
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101d02:	8b 55 08             	mov    0x8(%ebp),%edx
  101d05:	83 fa 13             	cmp    $0x13,%edx
  101d08:	77 0c                	ja     101d16 <trapname+0x21>
        return excnames[trapno];
  101d0a:	8b 55 08             	mov    0x8(%ebp),%edx
  101d0d:	8b 84 90 b0 00 00 00 	mov    0xb0(%eax,%edx,4),%eax
  101d14:	eb 1a                	jmp    101d30 <trapname+0x3b>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101d16:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101d1a:	7e 0e                	jle    101d2a <trapname+0x35>
  101d1c:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101d20:	7f 08                	jg     101d2a <trapname+0x35>
        return "Hardware Interrupt";
  101d22:	8d 80 4f 34 ff ff    	lea    -0xcbb1(%eax),%eax
  101d28:	eb 06                	jmp    101d30 <trapname+0x3b>
    }
    return "(unknown trap)";
  101d2a:	8d 80 62 34 ff ff    	lea    -0xcb9e(%eax),%eax
}
  101d30:	5d                   	pop    %ebp
  101d31:	c3                   	ret    

00101d32 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101d32:	55                   	push   %ebp
  101d33:	89 e5                	mov    %esp,%ebp
  101d35:	e8 3e e5 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  101d3a:	05 16 ec 00 00       	add    $0xec16,%eax
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101d3f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d42:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d46:	66 83 f8 08          	cmp    $0x8,%ax
  101d4a:	0f 94 c0             	sete   %al
  101d4d:	0f b6 c0             	movzbl %al,%eax
}
  101d50:	5d                   	pop    %ebp
  101d51:	c3                   	ret    

00101d52 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101d52:	55                   	push   %ebp
  101d53:	89 e5                	mov    %esp,%ebp
  101d55:	53                   	push   %ebx
  101d56:	83 ec 14             	sub    $0x14,%esp
  101d59:	e8 1e e5 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  101d5e:	81 c3 f2 eb 00 00    	add    $0xebf2,%ebx
    cprintf("trapframe at %p\n", tf);
  101d64:	83 ec 08             	sub    $0x8,%esp
  101d67:	ff 75 08             	pushl  0x8(%ebp)
  101d6a:	8d 83 a3 34 ff ff    	lea    -0xcb5d(%ebx),%eax
  101d70:	50                   	push   %eax
  101d71:	e8 79 e5 ff ff       	call   1002ef <cprintf>
  101d76:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101d79:	8b 45 08             	mov    0x8(%ebp),%eax
  101d7c:	83 ec 0c             	sub    $0xc,%esp
  101d7f:	50                   	push   %eax
  101d80:	e8 d1 01 00 00       	call   101f56 <print_regs>
  101d85:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101d88:	8b 45 08             	mov    0x8(%ebp),%eax
  101d8b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101d8f:	0f b7 c0             	movzwl %ax,%eax
  101d92:	83 ec 08             	sub    $0x8,%esp
  101d95:	50                   	push   %eax
  101d96:	8d 83 b4 34 ff ff    	lea    -0xcb4c(%ebx),%eax
  101d9c:	50                   	push   %eax
  101d9d:	e8 4d e5 ff ff       	call   1002ef <cprintf>
  101da2:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101da5:	8b 45 08             	mov    0x8(%ebp),%eax
  101da8:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101dac:	0f b7 c0             	movzwl %ax,%eax
  101daf:	83 ec 08             	sub    $0x8,%esp
  101db2:	50                   	push   %eax
  101db3:	8d 83 c7 34 ff ff    	lea    -0xcb39(%ebx),%eax
  101db9:	50                   	push   %eax
  101dba:	e8 30 e5 ff ff       	call   1002ef <cprintf>
  101dbf:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101dc2:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc5:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101dc9:	0f b7 c0             	movzwl %ax,%eax
  101dcc:	83 ec 08             	sub    $0x8,%esp
  101dcf:	50                   	push   %eax
  101dd0:	8d 83 da 34 ff ff    	lea    -0xcb26(%ebx),%eax
  101dd6:	50                   	push   %eax
  101dd7:	e8 13 e5 ff ff       	call   1002ef <cprintf>
  101ddc:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101ddf:	8b 45 08             	mov    0x8(%ebp),%eax
  101de2:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101de6:	0f b7 c0             	movzwl %ax,%eax
  101de9:	83 ec 08             	sub    $0x8,%esp
  101dec:	50                   	push   %eax
  101ded:	8d 83 ed 34 ff ff    	lea    -0xcb13(%ebx),%eax
  101df3:	50                   	push   %eax
  101df4:	e8 f6 e4 ff ff       	call   1002ef <cprintf>
  101df9:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101dfc:	8b 45 08             	mov    0x8(%ebp),%eax
  101dff:	8b 40 30             	mov    0x30(%eax),%eax
  101e02:	83 ec 0c             	sub    $0xc,%esp
  101e05:	50                   	push   %eax
  101e06:	e8 ea fe ff ff       	call   101cf5 <trapname>
  101e0b:	83 c4 10             	add    $0x10,%esp
  101e0e:	8b 55 08             	mov    0x8(%ebp),%edx
  101e11:	8b 52 30             	mov    0x30(%edx),%edx
  101e14:	83 ec 04             	sub    $0x4,%esp
  101e17:	50                   	push   %eax
  101e18:	52                   	push   %edx
  101e19:	8d 83 00 35 ff ff    	lea    -0xcb00(%ebx),%eax
  101e1f:	50                   	push   %eax
  101e20:	e8 ca e4 ff ff       	call   1002ef <cprintf>
  101e25:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101e28:	8b 45 08             	mov    0x8(%ebp),%eax
  101e2b:	8b 40 34             	mov    0x34(%eax),%eax
  101e2e:	83 ec 08             	sub    $0x8,%esp
  101e31:	50                   	push   %eax
  101e32:	8d 83 12 35 ff ff    	lea    -0xcaee(%ebx),%eax
  101e38:	50                   	push   %eax
  101e39:	e8 b1 e4 ff ff       	call   1002ef <cprintf>
  101e3e:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101e41:	8b 45 08             	mov    0x8(%ebp),%eax
  101e44:	8b 40 38             	mov    0x38(%eax),%eax
  101e47:	83 ec 08             	sub    $0x8,%esp
  101e4a:	50                   	push   %eax
  101e4b:	8d 83 21 35 ff ff    	lea    -0xcadf(%ebx),%eax
  101e51:	50                   	push   %eax
  101e52:	e8 98 e4 ff ff       	call   1002ef <cprintf>
  101e57:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101e5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e61:	0f b7 c0             	movzwl %ax,%eax
  101e64:	83 ec 08             	sub    $0x8,%esp
  101e67:	50                   	push   %eax
  101e68:	8d 83 30 35 ff ff    	lea    -0xcad0(%ebx),%eax
  101e6e:	50                   	push   %eax
  101e6f:	e8 7b e4 ff ff       	call   1002ef <cprintf>
  101e74:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101e77:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7a:	8b 40 40             	mov    0x40(%eax),%eax
  101e7d:	83 ec 08             	sub    $0x8,%esp
  101e80:	50                   	push   %eax
  101e81:	8d 83 43 35 ff ff    	lea    -0xcabd(%ebx),%eax
  101e87:	50                   	push   %eax
  101e88:	e8 62 e4 ff ff       	call   1002ef <cprintf>
  101e8d:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101e90:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101e97:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101e9e:	eb 41                	jmp    101ee1 <print_trapframe+0x18f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101ea0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea3:	8b 50 40             	mov    0x40(%eax),%edx
  101ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ea9:	21 d0                	and    %edx,%eax
  101eab:	85 c0                	test   %eax,%eax
  101ead:	74 2b                	je     101eda <print_trapframe+0x188>
  101eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101eb2:	8b 84 83 50 00 00 00 	mov    0x50(%ebx,%eax,4),%eax
  101eb9:	85 c0                	test   %eax,%eax
  101ebb:	74 1d                	je     101eda <print_trapframe+0x188>
            cprintf("%s,", IA32flags[i]);
  101ebd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ec0:	8b 84 83 50 00 00 00 	mov    0x50(%ebx,%eax,4),%eax
  101ec7:	83 ec 08             	sub    $0x8,%esp
  101eca:	50                   	push   %eax
  101ecb:	8d 83 52 35 ff ff    	lea    -0xcaae(%ebx),%eax
  101ed1:	50                   	push   %eax
  101ed2:	e8 18 e4 ff ff       	call   1002ef <cprintf>
  101ed7:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101eda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101ede:	d1 65 f0             	shll   -0x10(%ebp)
  101ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ee4:	83 f8 17             	cmp    $0x17,%eax
  101ee7:	76 b7                	jbe    101ea0 <print_trapframe+0x14e>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101ee9:	8b 45 08             	mov    0x8(%ebp),%eax
  101eec:	8b 40 40             	mov    0x40(%eax),%eax
  101eef:	c1 e8 0c             	shr    $0xc,%eax
  101ef2:	83 e0 03             	and    $0x3,%eax
  101ef5:	83 ec 08             	sub    $0x8,%esp
  101ef8:	50                   	push   %eax
  101ef9:	8d 83 56 35 ff ff    	lea    -0xcaaa(%ebx),%eax
  101eff:	50                   	push   %eax
  101f00:	e8 ea e3 ff ff       	call   1002ef <cprintf>
  101f05:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101f08:	83 ec 0c             	sub    $0xc,%esp
  101f0b:	ff 75 08             	pushl  0x8(%ebp)
  101f0e:	e8 1f fe ff ff       	call   101d32 <trap_in_kernel>
  101f13:	83 c4 10             	add    $0x10,%esp
  101f16:	85 c0                	test   %eax,%eax
  101f18:	75 36                	jne    101f50 <print_trapframe+0x1fe>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101f1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101f1d:	8b 40 44             	mov    0x44(%eax),%eax
  101f20:	83 ec 08             	sub    $0x8,%esp
  101f23:	50                   	push   %eax
  101f24:	8d 83 5f 35 ff ff    	lea    -0xcaa1(%ebx),%eax
  101f2a:	50                   	push   %eax
  101f2b:	e8 bf e3 ff ff       	call   1002ef <cprintf>
  101f30:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101f33:	8b 45 08             	mov    0x8(%ebp),%eax
  101f36:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101f3a:	0f b7 c0             	movzwl %ax,%eax
  101f3d:	83 ec 08             	sub    $0x8,%esp
  101f40:	50                   	push   %eax
  101f41:	8d 83 6e 35 ff ff    	lea    -0xca92(%ebx),%eax
  101f47:	50                   	push   %eax
  101f48:	e8 a2 e3 ff ff       	call   1002ef <cprintf>
  101f4d:	83 c4 10             	add    $0x10,%esp
    }
}
  101f50:	90                   	nop
  101f51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101f54:	c9                   	leave  
  101f55:	c3                   	ret    

00101f56 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101f56:	55                   	push   %ebp
  101f57:	89 e5                	mov    %esp,%ebp
  101f59:	53                   	push   %ebx
  101f5a:	83 ec 04             	sub    $0x4,%esp
  101f5d:	e8 1a e3 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  101f62:	81 c3 ee e9 00 00    	add    $0xe9ee,%ebx
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101f68:	8b 45 08             	mov    0x8(%ebp),%eax
  101f6b:	8b 00                	mov    (%eax),%eax
  101f6d:	83 ec 08             	sub    $0x8,%esp
  101f70:	50                   	push   %eax
  101f71:	8d 83 81 35 ff ff    	lea    -0xca7f(%ebx),%eax
  101f77:	50                   	push   %eax
  101f78:	e8 72 e3 ff ff       	call   1002ef <cprintf>
  101f7d:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101f80:	8b 45 08             	mov    0x8(%ebp),%eax
  101f83:	8b 40 04             	mov    0x4(%eax),%eax
  101f86:	83 ec 08             	sub    $0x8,%esp
  101f89:	50                   	push   %eax
  101f8a:	8d 83 90 35 ff ff    	lea    -0xca70(%ebx),%eax
  101f90:	50                   	push   %eax
  101f91:	e8 59 e3 ff ff       	call   1002ef <cprintf>
  101f96:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101f99:	8b 45 08             	mov    0x8(%ebp),%eax
  101f9c:	8b 40 08             	mov    0x8(%eax),%eax
  101f9f:	83 ec 08             	sub    $0x8,%esp
  101fa2:	50                   	push   %eax
  101fa3:	8d 83 9f 35 ff ff    	lea    -0xca61(%ebx),%eax
  101fa9:	50                   	push   %eax
  101faa:	e8 40 e3 ff ff       	call   1002ef <cprintf>
  101faf:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101fb2:	8b 45 08             	mov    0x8(%ebp),%eax
  101fb5:	8b 40 0c             	mov    0xc(%eax),%eax
  101fb8:	83 ec 08             	sub    $0x8,%esp
  101fbb:	50                   	push   %eax
  101fbc:	8d 83 ae 35 ff ff    	lea    -0xca52(%ebx),%eax
  101fc2:	50                   	push   %eax
  101fc3:	e8 27 e3 ff ff       	call   1002ef <cprintf>
  101fc8:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101fcb:	8b 45 08             	mov    0x8(%ebp),%eax
  101fce:	8b 40 10             	mov    0x10(%eax),%eax
  101fd1:	83 ec 08             	sub    $0x8,%esp
  101fd4:	50                   	push   %eax
  101fd5:	8d 83 bd 35 ff ff    	lea    -0xca43(%ebx),%eax
  101fdb:	50                   	push   %eax
  101fdc:	e8 0e e3 ff ff       	call   1002ef <cprintf>
  101fe1:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101fe4:	8b 45 08             	mov    0x8(%ebp),%eax
  101fe7:	8b 40 14             	mov    0x14(%eax),%eax
  101fea:	83 ec 08             	sub    $0x8,%esp
  101fed:	50                   	push   %eax
  101fee:	8d 83 cc 35 ff ff    	lea    -0xca34(%ebx),%eax
  101ff4:	50                   	push   %eax
  101ff5:	e8 f5 e2 ff ff       	call   1002ef <cprintf>
  101ffa:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ffd:	8b 45 08             	mov    0x8(%ebp),%eax
  102000:	8b 40 18             	mov    0x18(%eax),%eax
  102003:	83 ec 08             	sub    $0x8,%esp
  102006:	50                   	push   %eax
  102007:	8d 83 db 35 ff ff    	lea    -0xca25(%ebx),%eax
  10200d:	50                   	push   %eax
  10200e:	e8 dc e2 ff ff       	call   1002ef <cprintf>
  102013:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  102016:	8b 45 08             	mov    0x8(%ebp),%eax
  102019:	8b 40 1c             	mov    0x1c(%eax),%eax
  10201c:	83 ec 08             	sub    $0x8,%esp
  10201f:	50                   	push   %eax
  102020:	8d 83 ea 35 ff ff    	lea    -0xca16(%ebx),%eax
  102026:	50                   	push   %eax
  102027:	e8 c3 e2 ff ff       	call   1002ef <cprintf>
  10202c:	83 c4 10             	add    $0x10,%esp
}
  10202f:	90                   	nop
  102030:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102033:	c9                   	leave  
  102034:	c3                   	ret    

00102035 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  102035:	55                   	push   %ebp
  102036:	89 e5                	mov    %esp,%ebp
  102038:	53                   	push   %ebx
  102039:	83 ec 14             	sub    $0x14,%esp
  10203c:	e8 3b e2 ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  102041:	81 c3 0f e9 00 00    	add    $0xe90f,%ebx
    char c;

    switch (tf->tf_trapno) {
  102047:	8b 45 08             	mov    0x8(%ebp),%eax
  10204a:	8b 40 30             	mov    0x30(%eax),%eax
  10204d:	83 f8 79             	cmp    $0x79,%eax
  102050:	0f 87 e6 00 00 00    	ja     10213c <trap_dispatch+0x107>
  102056:	83 f8 78             	cmp    $0x78,%eax
  102059:	0f 83 c2 00 00 00    	jae    102121 <trap_dispatch+0xec>
  10205f:	83 f8 2f             	cmp    $0x2f,%eax
  102062:	0f 87 d4 00 00 00    	ja     10213c <trap_dispatch+0x107>
  102068:	83 f8 2e             	cmp    $0x2e,%eax
  10206b:	0f 83 05 01 00 00    	jae    102176 <trap_dispatch+0x141>
  102071:	83 f8 24             	cmp    $0x24,%eax
  102074:	74 5f                	je     1020d5 <trap_dispatch+0xa0>
  102076:	83 f8 24             	cmp    $0x24,%eax
  102079:	0f 87 bd 00 00 00    	ja     10213c <trap_dispatch+0x107>
  10207f:	83 f8 20             	cmp    $0x20,%eax
  102082:	74 0a                	je     10208e <trap_dispatch+0x59>
  102084:	83 f8 21             	cmp    $0x21,%eax
  102087:	74 72                	je     1020fb <trap_dispatch+0xc6>
  102089:	e9 ae 00 00 00       	jmp    10213c <trap_dispatch+0x107>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks += 1;
  10208e:	c7 c0 90 19 11 00    	mov    $0x111990,%eax
  102094:	8b 00                	mov    (%eax),%eax
  102096:	8d 50 01             	lea    0x1(%eax),%edx
  102099:	c7 c0 90 19 11 00    	mov    $0x111990,%eax
  10209f:	89 10                	mov    %edx,(%eax)
        if(ticks == 100){
  1020a1:	c7 c0 90 19 11 00    	mov    $0x111990,%eax
  1020a7:	8b 00                	mov    (%eax),%eax
  1020a9:	83 f8 64             	cmp    $0x64,%eax
  1020ac:	0f 85 c7 00 00 00    	jne    102179 <trap_dispatch+0x144>
            cprintf("100 ticks \n");
  1020b2:	83 ec 0c             	sub    $0xc,%esp
  1020b5:	8d 83 f9 35 ff ff    	lea    -0xca07(%ebx),%eax
  1020bb:	50                   	push   %eax
  1020bc:	e8 2e e2 ff ff       	call   1002ef <cprintf>
  1020c1:	83 c4 10             	add    $0x10,%esp
            ticks = 0;
  1020c4:	c7 c0 90 19 11 00    	mov    $0x111990,%eax
  1020ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
        }
        break;
  1020d0:	e9 a4 00 00 00       	jmp    102179 <trap_dispatch+0x144>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  1020d5:	e8 73 f8 ff ff       	call   10194d <cons_getc>
  1020da:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  1020dd:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  1020e1:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1020e5:	83 ec 04             	sub    $0x4,%esp
  1020e8:	52                   	push   %edx
  1020e9:	50                   	push   %eax
  1020ea:	8d 83 05 36 ff ff    	lea    -0xc9fb(%ebx),%eax
  1020f0:	50                   	push   %eax
  1020f1:	e8 f9 e1 ff ff       	call   1002ef <cprintf>
  1020f6:	83 c4 10             	add    $0x10,%esp
        break;
  1020f9:	eb 7f                	jmp    10217a <trap_dispatch+0x145>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  1020fb:	e8 4d f8 ff ff       	call   10194d <cons_getc>
  102100:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  102103:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  102107:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10210b:	83 ec 04             	sub    $0x4,%esp
  10210e:	52                   	push   %edx
  10210f:	50                   	push   %eax
  102110:	8d 83 17 36 ff ff    	lea    -0xc9e9(%ebx),%eax
  102116:	50                   	push   %eax
  102117:	e8 d3 e1 ff ff       	call   1002ef <cprintf>
  10211c:	83 c4 10             	add    $0x10,%esp
        break;
  10211f:	eb 59                	jmp    10217a <trap_dispatch+0x145>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  102121:	83 ec 04             	sub    $0x4,%esp
  102124:	8d 83 26 36 ff ff    	lea    -0xc9da(%ebx),%eax
  10212a:	50                   	push   %eax
  10212b:	68 aa 00 00 00       	push   $0xaa
  102130:	8d 83 36 36 ff ff    	lea    -0xc9ca(%ebx),%eax
  102136:	50                   	push   %eax
  102137:	e8 64 e3 ff ff       	call   1004a0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  10213c:	8b 45 08             	mov    0x8(%ebp),%eax
  10213f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  102143:	0f b7 c0             	movzwl %ax,%eax
  102146:	83 e0 03             	and    $0x3,%eax
  102149:	85 c0                	test   %eax,%eax
  10214b:	75 2d                	jne    10217a <trap_dispatch+0x145>
            print_trapframe(tf);
  10214d:	83 ec 0c             	sub    $0xc,%esp
  102150:	ff 75 08             	pushl  0x8(%ebp)
  102153:	e8 fa fb ff ff       	call   101d52 <print_trapframe>
  102158:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  10215b:	83 ec 04             	sub    $0x4,%esp
  10215e:	8d 83 47 36 ff ff    	lea    -0xc9b9(%ebx),%eax
  102164:	50                   	push   %eax
  102165:	68 b4 00 00 00       	push   $0xb4
  10216a:	8d 83 36 36 ff ff    	lea    -0xc9ca(%ebx),%eax
  102170:	50                   	push   %eax
  102171:	e8 2a e3 ff ff       	call   1004a0 <__panic>
        break;
  102176:	90                   	nop
  102177:	eb 01                	jmp    10217a <trap_dispatch+0x145>
        break;
  102179:	90                   	nop
        }
    }
}
  10217a:	90                   	nop
  10217b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10217e:	c9                   	leave  
  10217f:	c3                   	ret    

00102180 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  102180:	55                   	push   %ebp
  102181:	89 e5                	mov    %esp,%ebp
  102183:	83 ec 08             	sub    $0x8,%esp
  102186:	e8 ed e0 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10218b:	05 c5 e7 00 00       	add    $0xe7c5,%eax
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  102190:	83 ec 0c             	sub    $0xc,%esp
  102193:	ff 75 08             	pushl  0x8(%ebp)
  102196:	e8 9a fe ff ff       	call   102035 <trap_dispatch>
  10219b:	83 c4 10             	add    $0x10,%esp
}
  10219e:	90                   	nop
  10219f:	c9                   	leave  
  1021a0:	c3                   	ret    

001021a1 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  1021a1:	6a 00                	push   $0x0
  pushl $0
  1021a3:	6a 00                	push   $0x0
  jmp __alltraps
  1021a5:	e9 67 0a 00 00       	jmp    102c11 <__alltraps>

001021aa <vector1>:
.globl vector1
vector1:
  pushl $0
  1021aa:	6a 00                	push   $0x0
  pushl $1
  1021ac:	6a 01                	push   $0x1
  jmp __alltraps
  1021ae:	e9 5e 0a 00 00       	jmp    102c11 <__alltraps>

001021b3 <vector2>:
.globl vector2
vector2:
  pushl $0
  1021b3:	6a 00                	push   $0x0
  pushl $2
  1021b5:	6a 02                	push   $0x2
  jmp __alltraps
  1021b7:	e9 55 0a 00 00       	jmp    102c11 <__alltraps>

001021bc <vector3>:
.globl vector3
vector3:
  pushl $0
  1021bc:	6a 00                	push   $0x0
  pushl $3
  1021be:	6a 03                	push   $0x3
  jmp __alltraps
  1021c0:	e9 4c 0a 00 00       	jmp    102c11 <__alltraps>

001021c5 <vector4>:
.globl vector4
vector4:
  pushl $0
  1021c5:	6a 00                	push   $0x0
  pushl $4
  1021c7:	6a 04                	push   $0x4
  jmp __alltraps
  1021c9:	e9 43 0a 00 00       	jmp    102c11 <__alltraps>

001021ce <vector5>:
.globl vector5
vector5:
  pushl $0
  1021ce:	6a 00                	push   $0x0
  pushl $5
  1021d0:	6a 05                	push   $0x5
  jmp __alltraps
  1021d2:	e9 3a 0a 00 00       	jmp    102c11 <__alltraps>

001021d7 <vector6>:
.globl vector6
vector6:
  pushl $0
  1021d7:	6a 00                	push   $0x0
  pushl $6
  1021d9:	6a 06                	push   $0x6
  jmp __alltraps
  1021db:	e9 31 0a 00 00       	jmp    102c11 <__alltraps>

001021e0 <vector7>:
.globl vector7
vector7:
  pushl $0
  1021e0:	6a 00                	push   $0x0
  pushl $7
  1021e2:	6a 07                	push   $0x7
  jmp __alltraps
  1021e4:	e9 28 0a 00 00       	jmp    102c11 <__alltraps>

001021e9 <vector8>:
.globl vector8
vector8:
  pushl $8
  1021e9:	6a 08                	push   $0x8
  jmp __alltraps
  1021eb:	e9 21 0a 00 00       	jmp    102c11 <__alltraps>

001021f0 <vector9>:
.globl vector9
vector9:
  pushl $9
  1021f0:	6a 09                	push   $0x9
  jmp __alltraps
  1021f2:	e9 1a 0a 00 00       	jmp    102c11 <__alltraps>

001021f7 <vector10>:
.globl vector10
vector10:
  pushl $10
  1021f7:	6a 0a                	push   $0xa
  jmp __alltraps
  1021f9:	e9 13 0a 00 00       	jmp    102c11 <__alltraps>

001021fe <vector11>:
.globl vector11
vector11:
  pushl $11
  1021fe:	6a 0b                	push   $0xb
  jmp __alltraps
  102200:	e9 0c 0a 00 00       	jmp    102c11 <__alltraps>

00102205 <vector12>:
.globl vector12
vector12:
  pushl $12
  102205:	6a 0c                	push   $0xc
  jmp __alltraps
  102207:	e9 05 0a 00 00       	jmp    102c11 <__alltraps>

0010220c <vector13>:
.globl vector13
vector13:
  pushl $13
  10220c:	6a 0d                	push   $0xd
  jmp __alltraps
  10220e:	e9 fe 09 00 00       	jmp    102c11 <__alltraps>

00102213 <vector14>:
.globl vector14
vector14:
  pushl $14
  102213:	6a 0e                	push   $0xe
  jmp __alltraps
  102215:	e9 f7 09 00 00       	jmp    102c11 <__alltraps>

0010221a <vector15>:
.globl vector15
vector15:
  pushl $0
  10221a:	6a 00                	push   $0x0
  pushl $15
  10221c:	6a 0f                	push   $0xf
  jmp __alltraps
  10221e:	e9 ee 09 00 00       	jmp    102c11 <__alltraps>

00102223 <vector16>:
.globl vector16
vector16:
  pushl $0
  102223:	6a 00                	push   $0x0
  pushl $16
  102225:	6a 10                	push   $0x10
  jmp __alltraps
  102227:	e9 e5 09 00 00       	jmp    102c11 <__alltraps>

0010222c <vector17>:
.globl vector17
vector17:
  pushl $17
  10222c:	6a 11                	push   $0x11
  jmp __alltraps
  10222e:	e9 de 09 00 00       	jmp    102c11 <__alltraps>

00102233 <vector18>:
.globl vector18
vector18:
  pushl $0
  102233:	6a 00                	push   $0x0
  pushl $18
  102235:	6a 12                	push   $0x12
  jmp __alltraps
  102237:	e9 d5 09 00 00       	jmp    102c11 <__alltraps>

0010223c <vector19>:
.globl vector19
vector19:
  pushl $0
  10223c:	6a 00                	push   $0x0
  pushl $19
  10223e:	6a 13                	push   $0x13
  jmp __alltraps
  102240:	e9 cc 09 00 00       	jmp    102c11 <__alltraps>

00102245 <vector20>:
.globl vector20
vector20:
  pushl $0
  102245:	6a 00                	push   $0x0
  pushl $20
  102247:	6a 14                	push   $0x14
  jmp __alltraps
  102249:	e9 c3 09 00 00       	jmp    102c11 <__alltraps>

0010224e <vector21>:
.globl vector21
vector21:
  pushl $0
  10224e:	6a 00                	push   $0x0
  pushl $21
  102250:	6a 15                	push   $0x15
  jmp __alltraps
  102252:	e9 ba 09 00 00       	jmp    102c11 <__alltraps>

00102257 <vector22>:
.globl vector22
vector22:
  pushl $0
  102257:	6a 00                	push   $0x0
  pushl $22
  102259:	6a 16                	push   $0x16
  jmp __alltraps
  10225b:	e9 b1 09 00 00       	jmp    102c11 <__alltraps>

00102260 <vector23>:
.globl vector23
vector23:
  pushl $0
  102260:	6a 00                	push   $0x0
  pushl $23
  102262:	6a 17                	push   $0x17
  jmp __alltraps
  102264:	e9 a8 09 00 00       	jmp    102c11 <__alltraps>

00102269 <vector24>:
.globl vector24
vector24:
  pushl $0
  102269:	6a 00                	push   $0x0
  pushl $24
  10226b:	6a 18                	push   $0x18
  jmp __alltraps
  10226d:	e9 9f 09 00 00       	jmp    102c11 <__alltraps>

00102272 <vector25>:
.globl vector25
vector25:
  pushl $0
  102272:	6a 00                	push   $0x0
  pushl $25
  102274:	6a 19                	push   $0x19
  jmp __alltraps
  102276:	e9 96 09 00 00       	jmp    102c11 <__alltraps>

0010227b <vector26>:
.globl vector26
vector26:
  pushl $0
  10227b:	6a 00                	push   $0x0
  pushl $26
  10227d:	6a 1a                	push   $0x1a
  jmp __alltraps
  10227f:	e9 8d 09 00 00       	jmp    102c11 <__alltraps>

00102284 <vector27>:
.globl vector27
vector27:
  pushl $0
  102284:	6a 00                	push   $0x0
  pushl $27
  102286:	6a 1b                	push   $0x1b
  jmp __alltraps
  102288:	e9 84 09 00 00       	jmp    102c11 <__alltraps>

0010228d <vector28>:
.globl vector28
vector28:
  pushl $0
  10228d:	6a 00                	push   $0x0
  pushl $28
  10228f:	6a 1c                	push   $0x1c
  jmp __alltraps
  102291:	e9 7b 09 00 00       	jmp    102c11 <__alltraps>

00102296 <vector29>:
.globl vector29
vector29:
  pushl $0
  102296:	6a 00                	push   $0x0
  pushl $29
  102298:	6a 1d                	push   $0x1d
  jmp __alltraps
  10229a:	e9 72 09 00 00       	jmp    102c11 <__alltraps>

0010229f <vector30>:
.globl vector30
vector30:
  pushl $0
  10229f:	6a 00                	push   $0x0
  pushl $30
  1022a1:	6a 1e                	push   $0x1e
  jmp __alltraps
  1022a3:	e9 69 09 00 00       	jmp    102c11 <__alltraps>

001022a8 <vector31>:
.globl vector31
vector31:
  pushl $0
  1022a8:	6a 00                	push   $0x0
  pushl $31
  1022aa:	6a 1f                	push   $0x1f
  jmp __alltraps
  1022ac:	e9 60 09 00 00       	jmp    102c11 <__alltraps>

001022b1 <vector32>:
.globl vector32
vector32:
  pushl $0
  1022b1:	6a 00                	push   $0x0
  pushl $32
  1022b3:	6a 20                	push   $0x20
  jmp __alltraps
  1022b5:	e9 57 09 00 00       	jmp    102c11 <__alltraps>

001022ba <vector33>:
.globl vector33
vector33:
  pushl $0
  1022ba:	6a 00                	push   $0x0
  pushl $33
  1022bc:	6a 21                	push   $0x21
  jmp __alltraps
  1022be:	e9 4e 09 00 00       	jmp    102c11 <__alltraps>

001022c3 <vector34>:
.globl vector34
vector34:
  pushl $0
  1022c3:	6a 00                	push   $0x0
  pushl $34
  1022c5:	6a 22                	push   $0x22
  jmp __alltraps
  1022c7:	e9 45 09 00 00       	jmp    102c11 <__alltraps>

001022cc <vector35>:
.globl vector35
vector35:
  pushl $0
  1022cc:	6a 00                	push   $0x0
  pushl $35
  1022ce:	6a 23                	push   $0x23
  jmp __alltraps
  1022d0:	e9 3c 09 00 00       	jmp    102c11 <__alltraps>

001022d5 <vector36>:
.globl vector36
vector36:
  pushl $0
  1022d5:	6a 00                	push   $0x0
  pushl $36
  1022d7:	6a 24                	push   $0x24
  jmp __alltraps
  1022d9:	e9 33 09 00 00       	jmp    102c11 <__alltraps>

001022de <vector37>:
.globl vector37
vector37:
  pushl $0
  1022de:	6a 00                	push   $0x0
  pushl $37
  1022e0:	6a 25                	push   $0x25
  jmp __alltraps
  1022e2:	e9 2a 09 00 00       	jmp    102c11 <__alltraps>

001022e7 <vector38>:
.globl vector38
vector38:
  pushl $0
  1022e7:	6a 00                	push   $0x0
  pushl $38
  1022e9:	6a 26                	push   $0x26
  jmp __alltraps
  1022eb:	e9 21 09 00 00       	jmp    102c11 <__alltraps>

001022f0 <vector39>:
.globl vector39
vector39:
  pushl $0
  1022f0:	6a 00                	push   $0x0
  pushl $39
  1022f2:	6a 27                	push   $0x27
  jmp __alltraps
  1022f4:	e9 18 09 00 00       	jmp    102c11 <__alltraps>

001022f9 <vector40>:
.globl vector40
vector40:
  pushl $0
  1022f9:	6a 00                	push   $0x0
  pushl $40
  1022fb:	6a 28                	push   $0x28
  jmp __alltraps
  1022fd:	e9 0f 09 00 00       	jmp    102c11 <__alltraps>

00102302 <vector41>:
.globl vector41
vector41:
  pushl $0
  102302:	6a 00                	push   $0x0
  pushl $41
  102304:	6a 29                	push   $0x29
  jmp __alltraps
  102306:	e9 06 09 00 00       	jmp    102c11 <__alltraps>

0010230b <vector42>:
.globl vector42
vector42:
  pushl $0
  10230b:	6a 00                	push   $0x0
  pushl $42
  10230d:	6a 2a                	push   $0x2a
  jmp __alltraps
  10230f:	e9 fd 08 00 00       	jmp    102c11 <__alltraps>

00102314 <vector43>:
.globl vector43
vector43:
  pushl $0
  102314:	6a 00                	push   $0x0
  pushl $43
  102316:	6a 2b                	push   $0x2b
  jmp __alltraps
  102318:	e9 f4 08 00 00       	jmp    102c11 <__alltraps>

0010231d <vector44>:
.globl vector44
vector44:
  pushl $0
  10231d:	6a 00                	push   $0x0
  pushl $44
  10231f:	6a 2c                	push   $0x2c
  jmp __alltraps
  102321:	e9 eb 08 00 00       	jmp    102c11 <__alltraps>

00102326 <vector45>:
.globl vector45
vector45:
  pushl $0
  102326:	6a 00                	push   $0x0
  pushl $45
  102328:	6a 2d                	push   $0x2d
  jmp __alltraps
  10232a:	e9 e2 08 00 00       	jmp    102c11 <__alltraps>

0010232f <vector46>:
.globl vector46
vector46:
  pushl $0
  10232f:	6a 00                	push   $0x0
  pushl $46
  102331:	6a 2e                	push   $0x2e
  jmp __alltraps
  102333:	e9 d9 08 00 00       	jmp    102c11 <__alltraps>

00102338 <vector47>:
.globl vector47
vector47:
  pushl $0
  102338:	6a 00                	push   $0x0
  pushl $47
  10233a:	6a 2f                	push   $0x2f
  jmp __alltraps
  10233c:	e9 d0 08 00 00       	jmp    102c11 <__alltraps>

00102341 <vector48>:
.globl vector48
vector48:
  pushl $0
  102341:	6a 00                	push   $0x0
  pushl $48
  102343:	6a 30                	push   $0x30
  jmp __alltraps
  102345:	e9 c7 08 00 00       	jmp    102c11 <__alltraps>

0010234a <vector49>:
.globl vector49
vector49:
  pushl $0
  10234a:	6a 00                	push   $0x0
  pushl $49
  10234c:	6a 31                	push   $0x31
  jmp __alltraps
  10234e:	e9 be 08 00 00       	jmp    102c11 <__alltraps>

00102353 <vector50>:
.globl vector50
vector50:
  pushl $0
  102353:	6a 00                	push   $0x0
  pushl $50
  102355:	6a 32                	push   $0x32
  jmp __alltraps
  102357:	e9 b5 08 00 00       	jmp    102c11 <__alltraps>

0010235c <vector51>:
.globl vector51
vector51:
  pushl $0
  10235c:	6a 00                	push   $0x0
  pushl $51
  10235e:	6a 33                	push   $0x33
  jmp __alltraps
  102360:	e9 ac 08 00 00       	jmp    102c11 <__alltraps>

00102365 <vector52>:
.globl vector52
vector52:
  pushl $0
  102365:	6a 00                	push   $0x0
  pushl $52
  102367:	6a 34                	push   $0x34
  jmp __alltraps
  102369:	e9 a3 08 00 00       	jmp    102c11 <__alltraps>

0010236e <vector53>:
.globl vector53
vector53:
  pushl $0
  10236e:	6a 00                	push   $0x0
  pushl $53
  102370:	6a 35                	push   $0x35
  jmp __alltraps
  102372:	e9 9a 08 00 00       	jmp    102c11 <__alltraps>

00102377 <vector54>:
.globl vector54
vector54:
  pushl $0
  102377:	6a 00                	push   $0x0
  pushl $54
  102379:	6a 36                	push   $0x36
  jmp __alltraps
  10237b:	e9 91 08 00 00       	jmp    102c11 <__alltraps>

00102380 <vector55>:
.globl vector55
vector55:
  pushl $0
  102380:	6a 00                	push   $0x0
  pushl $55
  102382:	6a 37                	push   $0x37
  jmp __alltraps
  102384:	e9 88 08 00 00       	jmp    102c11 <__alltraps>

00102389 <vector56>:
.globl vector56
vector56:
  pushl $0
  102389:	6a 00                	push   $0x0
  pushl $56
  10238b:	6a 38                	push   $0x38
  jmp __alltraps
  10238d:	e9 7f 08 00 00       	jmp    102c11 <__alltraps>

00102392 <vector57>:
.globl vector57
vector57:
  pushl $0
  102392:	6a 00                	push   $0x0
  pushl $57
  102394:	6a 39                	push   $0x39
  jmp __alltraps
  102396:	e9 76 08 00 00       	jmp    102c11 <__alltraps>

0010239b <vector58>:
.globl vector58
vector58:
  pushl $0
  10239b:	6a 00                	push   $0x0
  pushl $58
  10239d:	6a 3a                	push   $0x3a
  jmp __alltraps
  10239f:	e9 6d 08 00 00       	jmp    102c11 <__alltraps>

001023a4 <vector59>:
.globl vector59
vector59:
  pushl $0
  1023a4:	6a 00                	push   $0x0
  pushl $59
  1023a6:	6a 3b                	push   $0x3b
  jmp __alltraps
  1023a8:	e9 64 08 00 00       	jmp    102c11 <__alltraps>

001023ad <vector60>:
.globl vector60
vector60:
  pushl $0
  1023ad:	6a 00                	push   $0x0
  pushl $60
  1023af:	6a 3c                	push   $0x3c
  jmp __alltraps
  1023b1:	e9 5b 08 00 00       	jmp    102c11 <__alltraps>

001023b6 <vector61>:
.globl vector61
vector61:
  pushl $0
  1023b6:	6a 00                	push   $0x0
  pushl $61
  1023b8:	6a 3d                	push   $0x3d
  jmp __alltraps
  1023ba:	e9 52 08 00 00       	jmp    102c11 <__alltraps>

001023bf <vector62>:
.globl vector62
vector62:
  pushl $0
  1023bf:	6a 00                	push   $0x0
  pushl $62
  1023c1:	6a 3e                	push   $0x3e
  jmp __alltraps
  1023c3:	e9 49 08 00 00       	jmp    102c11 <__alltraps>

001023c8 <vector63>:
.globl vector63
vector63:
  pushl $0
  1023c8:	6a 00                	push   $0x0
  pushl $63
  1023ca:	6a 3f                	push   $0x3f
  jmp __alltraps
  1023cc:	e9 40 08 00 00       	jmp    102c11 <__alltraps>

001023d1 <vector64>:
.globl vector64
vector64:
  pushl $0
  1023d1:	6a 00                	push   $0x0
  pushl $64
  1023d3:	6a 40                	push   $0x40
  jmp __alltraps
  1023d5:	e9 37 08 00 00       	jmp    102c11 <__alltraps>

001023da <vector65>:
.globl vector65
vector65:
  pushl $0
  1023da:	6a 00                	push   $0x0
  pushl $65
  1023dc:	6a 41                	push   $0x41
  jmp __alltraps
  1023de:	e9 2e 08 00 00       	jmp    102c11 <__alltraps>

001023e3 <vector66>:
.globl vector66
vector66:
  pushl $0
  1023e3:	6a 00                	push   $0x0
  pushl $66
  1023e5:	6a 42                	push   $0x42
  jmp __alltraps
  1023e7:	e9 25 08 00 00       	jmp    102c11 <__alltraps>

001023ec <vector67>:
.globl vector67
vector67:
  pushl $0
  1023ec:	6a 00                	push   $0x0
  pushl $67
  1023ee:	6a 43                	push   $0x43
  jmp __alltraps
  1023f0:	e9 1c 08 00 00       	jmp    102c11 <__alltraps>

001023f5 <vector68>:
.globl vector68
vector68:
  pushl $0
  1023f5:	6a 00                	push   $0x0
  pushl $68
  1023f7:	6a 44                	push   $0x44
  jmp __alltraps
  1023f9:	e9 13 08 00 00       	jmp    102c11 <__alltraps>

001023fe <vector69>:
.globl vector69
vector69:
  pushl $0
  1023fe:	6a 00                	push   $0x0
  pushl $69
  102400:	6a 45                	push   $0x45
  jmp __alltraps
  102402:	e9 0a 08 00 00       	jmp    102c11 <__alltraps>

00102407 <vector70>:
.globl vector70
vector70:
  pushl $0
  102407:	6a 00                	push   $0x0
  pushl $70
  102409:	6a 46                	push   $0x46
  jmp __alltraps
  10240b:	e9 01 08 00 00       	jmp    102c11 <__alltraps>

00102410 <vector71>:
.globl vector71
vector71:
  pushl $0
  102410:	6a 00                	push   $0x0
  pushl $71
  102412:	6a 47                	push   $0x47
  jmp __alltraps
  102414:	e9 f8 07 00 00       	jmp    102c11 <__alltraps>

00102419 <vector72>:
.globl vector72
vector72:
  pushl $0
  102419:	6a 00                	push   $0x0
  pushl $72
  10241b:	6a 48                	push   $0x48
  jmp __alltraps
  10241d:	e9 ef 07 00 00       	jmp    102c11 <__alltraps>

00102422 <vector73>:
.globl vector73
vector73:
  pushl $0
  102422:	6a 00                	push   $0x0
  pushl $73
  102424:	6a 49                	push   $0x49
  jmp __alltraps
  102426:	e9 e6 07 00 00       	jmp    102c11 <__alltraps>

0010242b <vector74>:
.globl vector74
vector74:
  pushl $0
  10242b:	6a 00                	push   $0x0
  pushl $74
  10242d:	6a 4a                	push   $0x4a
  jmp __alltraps
  10242f:	e9 dd 07 00 00       	jmp    102c11 <__alltraps>

00102434 <vector75>:
.globl vector75
vector75:
  pushl $0
  102434:	6a 00                	push   $0x0
  pushl $75
  102436:	6a 4b                	push   $0x4b
  jmp __alltraps
  102438:	e9 d4 07 00 00       	jmp    102c11 <__alltraps>

0010243d <vector76>:
.globl vector76
vector76:
  pushl $0
  10243d:	6a 00                	push   $0x0
  pushl $76
  10243f:	6a 4c                	push   $0x4c
  jmp __alltraps
  102441:	e9 cb 07 00 00       	jmp    102c11 <__alltraps>

00102446 <vector77>:
.globl vector77
vector77:
  pushl $0
  102446:	6a 00                	push   $0x0
  pushl $77
  102448:	6a 4d                	push   $0x4d
  jmp __alltraps
  10244a:	e9 c2 07 00 00       	jmp    102c11 <__alltraps>

0010244f <vector78>:
.globl vector78
vector78:
  pushl $0
  10244f:	6a 00                	push   $0x0
  pushl $78
  102451:	6a 4e                	push   $0x4e
  jmp __alltraps
  102453:	e9 b9 07 00 00       	jmp    102c11 <__alltraps>

00102458 <vector79>:
.globl vector79
vector79:
  pushl $0
  102458:	6a 00                	push   $0x0
  pushl $79
  10245a:	6a 4f                	push   $0x4f
  jmp __alltraps
  10245c:	e9 b0 07 00 00       	jmp    102c11 <__alltraps>

00102461 <vector80>:
.globl vector80
vector80:
  pushl $0
  102461:	6a 00                	push   $0x0
  pushl $80
  102463:	6a 50                	push   $0x50
  jmp __alltraps
  102465:	e9 a7 07 00 00       	jmp    102c11 <__alltraps>

0010246a <vector81>:
.globl vector81
vector81:
  pushl $0
  10246a:	6a 00                	push   $0x0
  pushl $81
  10246c:	6a 51                	push   $0x51
  jmp __alltraps
  10246e:	e9 9e 07 00 00       	jmp    102c11 <__alltraps>

00102473 <vector82>:
.globl vector82
vector82:
  pushl $0
  102473:	6a 00                	push   $0x0
  pushl $82
  102475:	6a 52                	push   $0x52
  jmp __alltraps
  102477:	e9 95 07 00 00       	jmp    102c11 <__alltraps>

0010247c <vector83>:
.globl vector83
vector83:
  pushl $0
  10247c:	6a 00                	push   $0x0
  pushl $83
  10247e:	6a 53                	push   $0x53
  jmp __alltraps
  102480:	e9 8c 07 00 00       	jmp    102c11 <__alltraps>

00102485 <vector84>:
.globl vector84
vector84:
  pushl $0
  102485:	6a 00                	push   $0x0
  pushl $84
  102487:	6a 54                	push   $0x54
  jmp __alltraps
  102489:	e9 83 07 00 00       	jmp    102c11 <__alltraps>

0010248e <vector85>:
.globl vector85
vector85:
  pushl $0
  10248e:	6a 00                	push   $0x0
  pushl $85
  102490:	6a 55                	push   $0x55
  jmp __alltraps
  102492:	e9 7a 07 00 00       	jmp    102c11 <__alltraps>

00102497 <vector86>:
.globl vector86
vector86:
  pushl $0
  102497:	6a 00                	push   $0x0
  pushl $86
  102499:	6a 56                	push   $0x56
  jmp __alltraps
  10249b:	e9 71 07 00 00       	jmp    102c11 <__alltraps>

001024a0 <vector87>:
.globl vector87
vector87:
  pushl $0
  1024a0:	6a 00                	push   $0x0
  pushl $87
  1024a2:	6a 57                	push   $0x57
  jmp __alltraps
  1024a4:	e9 68 07 00 00       	jmp    102c11 <__alltraps>

001024a9 <vector88>:
.globl vector88
vector88:
  pushl $0
  1024a9:	6a 00                	push   $0x0
  pushl $88
  1024ab:	6a 58                	push   $0x58
  jmp __alltraps
  1024ad:	e9 5f 07 00 00       	jmp    102c11 <__alltraps>

001024b2 <vector89>:
.globl vector89
vector89:
  pushl $0
  1024b2:	6a 00                	push   $0x0
  pushl $89
  1024b4:	6a 59                	push   $0x59
  jmp __alltraps
  1024b6:	e9 56 07 00 00       	jmp    102c11 <__alltraps>

001024bb <vector90>:
.globl vector90
vector90:
  pushl $0
  1024bb:	6a 00                	push   $0x0
  pushl $90
  1024bd:	6a 5a                	push   $0x5a
  jmp __alltraps
  1024bf:	e9 4d 07 00 00       	jmp    102c11 <__alltraps>

001024c4 <vector91>:
.globl vector91
vector91:
  pushl $0
  1024c4:	6a 00                	push   $0x0
  pushl $91
  1024c6:	6a 5b                	push   $0x5b
  jmp __alltraps
  1024c8:	e9 44 07 00 00       	jmp    102c11 <__alltraps>

001024cd <vector92>:
.globl vector92
vector92:
  pushl $0
  1024cd:	6a 00                	push   $0x0
  pushl $92
  1024cf:	6a 5c                	push   $0x5c
  jmp __alltraps
  1024d1:	e9 3b 07 00 00       	jmp    102c11 <__alltraps>

001024d6 <vector93>:
.globl vector93
vector93:
  pushl $0
  1024d6:	6a 00                	push   $0x0
  pushl $93
  1024d8:	6a 5d                	push   $0x5d
  jmp __alltraps
  1024da:	e9 32 07 00 00       	jmp    102c11 <__alltraps>

001024df <vector94>:
.globl vector94
vector94:
  pushl $0
  1024df:	6a 00                	push   $0x0
  pushl $94
  1024e1:	6a 5e                	push   $0x5e
  jmp __alltraps
  1024e3:	e9 29 07 00 00       	jmp    102c11 <__alltraps>

001024e8 <vector95>:
.globl vector95
vector95:
  pushl $0
  1024e8:	6a 00                	push   $0x0
  pushl $95
  1024ea:	6a 5f                	push   $0x5f
  jmp __alltraps
  1024ec:	e9 20 07 00 00       	jmp    102c11 <__alltraps>

001024f1 <vector96>:
.globl vector96
vector96:
  pushl $0
  1024f1:	6a 00                	push   $0x0
  pushl $96
  1024f3:	6a 60                	push   $0x60
  jmp __alltraps
  1024f5:	e9 17 07 00 00       	jmp    102c11 <__alltraps>

001024fa <vector97>:
.globl vector97
vector97:
  pushl $0
  1024fa:	6a 00                	push   $0x0
  pushl $97
  1024fc:	6a 61                	push   $0x61
  jmp __alltraps
  1024fe:	e9 0e 07 00 00       	jmp    102c11 <__alltraps>

00102503 <vector98>:
.globl vector98
vector98:
  pushl $0
  102503:	6a 00                	push   $0x0
  pushl $98
  102505:	6a 62                	push   $0x62
  jmp __alltraps
  102507:	e9 05 07 00 00       	jmp    102c11 <__alltraps>

0010250c <vector99>:
.globl vector99
vector99:
  pushl $0
  10250c:	6a 00                	push   $0x0
  pushl $99
  10250e:	6a 63                	push   $0x63
  jmp __alltraps
  102510:	e9 fc 06 00 00       	jmp    102c11 <__alltraps>

00102515 <vector100>:
.globl vector100
vector100:
  pushl $0
  102515:	6a 00                	push   $0x0
  pushl $100
  102517:	6a 64                	push   $0x64
  jmp __alltraps
  102519:	e9 f3 06 00 00       	jmp    102c11 <__alltraps>

0010251e <vector101>:
.globl vector101
vector101:
  pushl $0
  10251e:	6a 00                	push   $0x0
  pushl $101
  102520:	6a 65                	push   $0x65
  jmp __alltraps
  102522:	e9 ea 06 00 00       	jmp    102c11 <__alltraps>

00102527 <vector102>:
.globl vector102
vector102:
  pushl $0
  102527:	6a 00                	push   $0x0
  pushl $102
  102529:	6a 66                	push   $0x66
  jmp __alltraps
  10252b:	e9 e1 06 00 00       	jmp    102c11 <__alltraps>

00102530 <vector103>:
.globl vector103
vector103:
  pushl $0
  102530:	6a 00                	push   $0x0
  pushl $103
  102532:	6a 67                	push   $0x67
  jmp __alltraps
  102534:	e9 d8 06 00 00       	jmp    102c11 <__alltraps>

00102539 <vector104>:
.globl vector104
vector104:
  pushl $0
  102539:	6a 00                	push   $0x0
  pushl $104
  10253b:	6a 68                	push   $0x68
  jmp __alltraps
  10253d:	e9 cf 06 00 00       	jmp    102c11 <__alltraps>

00102542 <vector105>:
.globl vector105
vector105:
  pushl $0
  102542:	6a 00                	push   $0x0
  pushl $105
  102544:	6a 69                	push   $0x69
  jmp __alltraps
  102546:	e9 c6 06 00 00       	jmp    102c11 <__alltraps>

0010254b <vector106>:
.globl vector106
vector106:
  pushl $0
  10254b:	6a 00                	push   $0x0
  pushl $106
  10254d:	6a 6a                	push   $0x6a
  jmp __alltraps
  10254f:	e9 bd 06 00 00       	jmp    102c11 <__alltraps>

00102554 <vector107>:
.globl vector107
vector107:
  pushl $0
  102554:	6a 00                	push   $0x0
  pushl $107
  102556:	6a 6b                	push   $0x6b
  jmp __alltraps
  102558:	e9 b4 06 00 00       	jmp    102c11 <__alltraps>

0010255d <vector108>:
.globl vector108
vector108:
  pushl $0
  10255d:	6a 00                	push   $0x0
  pushl $108
  10255f:	6a 6c                	push   $0x6c
  jmp __alltraps
  102561:	e9 ab 06 00 00       	jmp    102c11 <__alltraps>

00102566 <vector109>:
.globl vector109
vector109:
  pushl $0
  102566:	6a 00                	push   $0x0
  pushl $109
  102568:	6a 6d                	push   $0x6d
  jmp __alltraps
  10256a:	e9 a2 06 00 00       	jmp    102c11 <__alltraps>

0010256f <vector110>:
.globl vector110
vector110:
  pushl $0
  10256f:	6a 00                	push   $0x0
  pushl $110
  102571:	6a 6e                	push   $0x6e
  jmp __alltraps
  102573:	e9 99 06 00 00       	jmp    102c11 <__alltraps>

00102578 <vector111>:
.globl vector111
vector111:
  pushl $0
  102578:	6a 00                	push   $0x0
  pushl $111
  10257a:	6a 6f                	push   $0x6f
  jmp __alltraps
  10257c:	e9 90 06 00 00       	jmp    102c11 <__alltraps>

00102581 <vector112>:
.globl vector112
vector112:
  pushl $0
  102581:	6a 00                	push   $0x0
  pushl $112
  102583:	6a 70                	push   $0x70
  jmp __alltraps
  102585:	e9 87 06 00 00       	jmp    102c11 <__alltraps>

0010258a <vector113>:
.globl vector113
vector113:
  pushl $0
  10258a:	6a 00                	push   $0x0
  pushl $113
  10258c:	6a 71                	push   $0x71
  jmp __alltraps
  10258e:	e9 7e 06 00 00       	jmp    102c11 <__alltraps>

00102593 <vector114>:
.globl vector114
vector114:
  pushl $0
  102593:	6a 00                	push   $0x0
  pushl $114
  102595:	6a 72                	push   $0x72
  jmp __alltraps
  102597:	e9 75 06 00 00       	jmp    102c11 <__alltraps>

0010259c <vector115>:
.globl vector115
vector115:
  pushl $0
  10259c:	6a 00                	push   $0x0
  pushl $115
  10259e:	6a 73                	push   $0x73
  jmp __alltraps
  1025a0:	e9 6c 06 00 00       	jmp    102c11 <__alltraps>

001025a5 <vector116>:
.globl vector116
vector116:
  pushl $0
  1025a5:	6a 00                	push   $0x0
  pushl $116
  1025a7:	6a 74                	push   $0x74
  jmp __alltraps
  1025a9:	e9 63 06 00 00       	jmp    102c11 <__alltraps>

001025ae <vector117>:
.globl vector117
vector117:
  pushl $0
  1025ae:	6a 00                	push   $0x0
  pushl $117
  1025b0:	6a 75                	push   $0x75
  jmp __alltraps
  1025b2:	e9 5a 06 00 00       	jmp    102c11 <__alltraps>

001025b7 <vector118>:
.globl vector118
vector118:
  pushl $0
  1025b7:	6a 00                	push   $0x0
  pushl $118
  1025b9:	6a 76                	push   $0x76
  jmp __alltraps
  1025bb:	e9 51 06 00 00       	jmp    102c11 <__alltraps>

001025c0 <vector119>:
.globl vector119
vector119:
  pushl $0
  1025c0:	6a 00                	push   $0x0
  pushl $119
  1025c2:	6a 77                	push   $0x77
  jmp __alltraps
  1025c4:	e9 48 06 00 00       	jmp    102c11 <__alltraps>

001025c9 <vector120>:
.globl vector120
vector120:
  pushl $0
  1025c9:	6a 00                	push   $0x0
  pushl $120
  1025cb:	6a 78                	push   $0x78
  jmp __alltraps
  1025cd:	e9 3f 06 00 00       	jmp    102c11 <__alltraps>

001025d2 <vector121>:
.globl vector121
vector121:
  pushl $0
  1025d2:	6a 00                	push   $0x0
  pushl $121
  1025d4:	6a 79                	push   $0x79
  jmp __alltraps
  1025d6:	e9 36 06 00 00       	jmp    102c11 <__alltraps>

001025db <vector122>:
.globl vector122
vector122:
  pushl $0
  1025db:	6a 00                	push   $0x0
  pushl $122
  1025dd:	6a 7a                	push   $0x7a
  jmp __alltraps
  1025df:	e9 2d 06 00 00       	jmp    102c11 <__alltraps>

001025e4 <vector123>:
.globl vector123
vector123:
  pushl $0
  1025e4:	6a 00                	push   $0x0
  pushl $123
  1025e6:	6a 7b                	push   $0x7b
  jmp __alltraps
  1025e8:	e9 24 06 00 00       	jmp    102c11 <__alltraps>

001025ed <vector124>:
.globl vector124
vector124:
  pushl $0
  1025ed:	6a 00                	push   $0x0
  pushl $124
  1025ef:	6a 7c                	push   $0x7c
  jmp __alltraps
  1025f1:	e9 1b 06 00 00       	jmp    102c11 <__alltraps>

001025f6 <vector125>:
.globl vector125
vector125:
  pushl $0
  1025f6:	6a 00                	push   $0x0
  pushl $125
  1025f8:	6a 7d                	push   $0x7d
  jmp __alltraps
  1025fa:	e9 12 06 00 00       	jmp    102c11 <__alltraps>

001025ff <vector126>:
.globl vector126
vector126:
  pushl $0
  1025ff:	6a 00                	push   $0x0
  pushl $126
  102601:	6a 7e                	push   $0x7e
  jmp __alltraps
  102603:	e9 09 06 00 00       	jmp    102c11 <__alltraps>

00102608 <vector127>:
.globl vector127
vector127:
  pushl $0
  102608:	6a 00                	push   $0x0
  pushl $127
  10260a:	6a 7f                	push   $0x7f
  jmp __alltraps
  10260c:	e9 00 06 00 00       	jmp    102c11 <__alltraps>

00102611 <vector128>:
.globl vector128
vector128:
  pushl $0
  102611:	6a 00                	push   $0x0
  pushl $128
  102613:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102618:	e9 f4 05 00 00       	jmp    102c11 <__alltraps>

0010261d <vector129>:
.globl vector129
vector129:
  pushl $0
  10261d:	6a 00                	push   $0x0
  pushl $129
  10261f:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102624:	e9 e8 05 00 00       	jmp    102c11 <__alltraps>

00102629 <vector130>:
.globl vector130
vector130:
  pushl $0
  102629:	6a 00                	push   $0x0
  pushl $130
  10262b:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102630:	e9 dc 05 00 00       	jmp    102c11 <__alltraps>

00102635 <vector131>:
.globl vector131
vector131:
  pushl $0
  102635:	6a 00                	push   $0x0
  pushl $131
  102637:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10263c:	e9 d0 05 00 00       	jmp    102c11 <__alltraps>

00102641 <vector132>:
.globl vector132
vector132:
  pushl $0
  102641:	6a 00                	push   $0x0
  pushl $132
  102643:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102648:	e9 c4 05 00 00       	jmp    102c11 <__alltraps>

0010264d <vector133>:
.globl vector133
vector133:
  pushl $0
  10264d:	6a 00                	push   $0x0
  pushl $133
  10264f:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102654:	e9 b8 05 00 00       	jmp    102c11 <__alltraps>

00102659 <vector134>:
.globl vector134
vector134:
  pushl $0
  102659:	6a 00                	push   $0x0
  pushl $134
  10265b:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102660:	e9 ac 05 00 00       	jmp    102c11 <__alltraps>

00102665 <vector135>:
.globl vector135
vector135:
  pushl $0
  102665:	6a 00                	push   $0x0
  pushl $135
  102667:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10266c:	e9 a0 05 00 00       	jmp    102c11 <__alltraps>

00102671 <vector136>:
.globl vector136
vector136:
  pushl $0
  102671:	6a 00                	push   $0x0
  pushl $136
  102673:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102678:	e9 94 05 00 00       	jmp    102c11 <__alltraps>

0010267d <vector137>:
.globl vector137
vector137:
  pushl $0
  10267d:	6a 00                	push   $0x0
  pushl $137
  10267f:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102684:	e9 88 05 00 00       	jmp    102c11 <__alltraps>

00102689 <vector138>:
.globl vector138
vector138:
  pushl $0
  102689:	6a 00                	push   $0x0
  pushl $138
  10268b:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102690:	e9 7c 05 00 00       	jmp    102c11 <__alltraps>

00102695 <vector139>:
.globl vector139
vector139:
  pushl $0
  102695:	6a 00                	push   $0x0
  pushl $139
  102697:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10269c:	e9 70 05 00 00       	jmp    102c11 <__alltraps>

001026a1 <vector140>:
.globl vector140
vector140:
  pushl $0
  1026a1:	6a 00                	push   $0x0
  pushl $140
  1026a3:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1026a8:	e9 64 05 00 00       	jmp    102c11 <__alltraps>

001026ad <vector141>:
.globl vector141
vector141:
  pushl $0
  1026ad:	6a 00                	push   $0x0
  pushl $141
  1026af:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1026b4:	e9 58 05 00 00       	jmp    102c11 <__alltraps>

001026b9 <vector142>:
.globl vector142
vector142:
  pushl $0
  1026b9:	6a 00                	push   $0x0
  pushl $142
  1026bb:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1026c0:	e9 4c 05 00 00       	jmp    102c11 <__alltraps>

001026c5 <vector143>:
.globl vector143
vector143:
  pushl $0
  1026c5:	6a 00                	push   $0x0
  pushl $143
  1026c7:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1026cc:	e9 40 05 00 00       	jmp    102c11 <__alltraps>

001026d1 <vector144>:
.globl vector144
vector144:
  pushl $0
  1026d1:	6a 00                	push   $0x0
  pushl $144
  1026d3:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1026d8:	e9 34 05 00 00       	jmp    102c11 <__alltraps>

001026dd <vector145>:
.globl vector145
vector145:
  pushl $0
  1026dd:	6a 00                	push   $0x0
  pushl $145
  1026df:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1026e4:	e9 28 05 00 00       	jmp    102c11 <__alltraps>

001026e9 <vector146>:
.globl vector146
vector146:
  pushl $0
  1026e9:	6a 00                	push   $0x0
  pushl $146
  1026eb:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1026f0:	e9 1c 05 00 00       	jmp    102c11 <__alltraps>

001026f5 <vector147>:
.globl vector147
vector147:
  pushl $0
  1026f5:	6a 00                	push   $0x0
  pushl $147
  1026f7:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1026fc:	e9 10 05 00 00       	jmp    102c11 <__alltraps>

00102701 <vector148>:
.globl vector148
vector148:
  pushl $0
  102701:	6a 00                	push   $0x0
  pushl $148
  102703:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102708:	e9 04 05 00 00       	jmp    102c11 <__alltraps>

0010270d <vector149>:
.globl vector149
vector149:
  pushl $0
  10270d:	6a 00                	push   $0x0
  pushl $149
  10270f:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102714:	e9 f8 04 00 00       	jmp    102c11 <__alltraps>

00102719 <vector150>:
.globl vector150
vector150:
  pushl $0
  102719:	6a 00                	push   $0x0
  pushl $150
  10271b:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102720:	e9 ec 04 00 00       	jmp    102c11 <__alltraps>

00102725 <vector151>:
.globl vector151
vector151:
  pushl $0
  102725:	6a 00                	push   $0x0
  pushl $151
  102727:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10272c:	e9 e0 04 00 00       	jmp    102c11 <__alltraps>

00102731 <vector152>:
.globl vector152
vector152:
  pushl $0
  102731:	6a 00                	push   $0x0
  pushl $152
  102733:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102738:	e9 d4 04 00 00       	jmp    102c11 <__alltraps>

0010273d <vector153>:
.globl vector153
vector153:
  pushl $0
  10273d:	6a 00                	push   $0x0
  pushl $153
  10273f:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102744:	e9 c8 04 00 00       	jmp    102c11 <__alltraps>

00102749 <vector154>:
.globl vector154
vector154:
  pushl $0
  102749:	6a 00                	push   $0x0
  pushl $154
  10274b:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102750:	e9 bc 04 00 00       	jmp    102c11 <__alltraps>

00102755 <vector155>:
.globl vector155
vector155:
  pushl $0
  102755:	6a 00                	push   $0x0
  pushl $155
  102757:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10275c:	e9 b0 04 00 00       	jmp    102c11 <__alltraps>

00102761 <vector156>:
.globl vector156
vector156:
  pushl $0
  102761:	6a 00                	push   $0x0
  pushl $156
  102763:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102768:	e9 a4 04 00 00       	jmp    102c11 <__alltraps>

0010276d <vector157>:
.globl vector157
vector157:
  pushl $0
  10276d:	6a 00                	push   $0x0
  pushl $157
  10276f:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102774:	e9 98 04 00 00       	jmp    102c11 <__alltraps>

00102779 <vector158>:
.globl vector158
vector158:
  pushl $0
  102779:	6a 00                	push   $0x0
  pushl $158
  10277b:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102780:	e9 8c 04 00 00       	jmp    102c11 <__alltraps>

00102785 <vector159>:
.globl vector159
vector159:
  pushl $0
  102785:	6a 00                	push   $0x0
  pushl $159
  102787:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10278c:	e9 80 04 00 00       	jmp    102c11 <__alltraps>

00102791 <vector160>:
.globl vector160
vector160:
  pushl $0
  102791:	6a 00                	push   $0x0
  pushl $160
  102793:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102798:	e9 74 04 00 00       	jmp    102c11 <__alltraps>

0010279d <vector161>:
.globl vector161
vector161:
  pushl $0
  10279d:	6a 00                	push   $0x0
  pushl $161
  10279f:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1027a4:	e9 68 04 00 00       	jmp    102c11 <__alltraps>

001027a9 <vector162>:
.globl vector162
vector162:
  pushl $0
  1027a9:	6a 00                	push   $0x0
  pushl $162
  1027ab:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1027b0:	e9 5c 04 00 00       	jmp    102c11 <__alltraps>

001027b5 <vector163>:
.globl vector163
vector163:
  pushl $0
  1027b5:	6a 00                	push   $0x0
  pushl $163
  1027b7:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1027bc:	e9 50 04 00 00       	jmp    102c11 <__alltraps>

001027c1 <vector164>:
.globl vector164
vector164:
  pushl $0
  1027c1:	6a 00                	push   $0x0
  pushl $164
  1027c3:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1027c8:	e9 44 04 00 00       	jmp    102c11 <__alltraps>

001027cd <vector165>:
.globl vector165
vector165:
  pushl $0
  1027cd:	6a 00                	push   $0x0
  pushl $165
  1027cf:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1027d4:	e9 38 04 00 00       	jmp    102c11 <__alltraps>

001027d9 <vector166>:
.globl vector166
vector166:
  pushl $0
  1027d9:	6a 00                	push   $0x0
  pushl $166
  1027db:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1027e0:	e9 2c 04 00 00       	jmp    102c11 <__alltraps>

001027e5 <vector167>:
.globl vector167
vector167:
  pushl $0
  1027e5:	6a 00                	push   $0x0
  pushl $167
  1027e7:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1027ec:	e9 20 04 00 00       	jmp    102c11 <__alltraps>

001027f1 <vector168>:
.globl vector168
vector168:
  pushl $0
  1027f1:	6a 00                	push   $0x0
  pushl $168
  1027f3:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1027f8:	e9 14 04 00 00       	jmp    102c11 <__alltraps>

001027fd <vector169>:
.globl vector169
vector169:
  pushl $0
  1027fd:	6a 00                	push   $0x0
  pushl $169
  1027ff:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102804:	e9 08 04 00 00       	jmp    102c11 <__alltraps>

00102809 <vector170>:
.globl vector170
vector170:
  pushl $0
  102809:	6a 00                	push   $0x0
  pushl $170
  10280b:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102810:	e9 fc 03 00 00       	jmp    102c11 <__alltraps>

00102815 <vector171>:
.globl vector171
vector171:
  pushl $0
  102815:	6a 00                	push   $0x0
  pushl $171
  102817:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10281c:	e9 f0 03 00 00       	jmp    102c11 <__alltraps>

00102821 <vector172>:
.globl vector172
vector172:
  pushl $0
  102821:	6a 00                	push   $0x0
  pushl $172
  102823:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102828:	e9 e4 03 00 00       	jmp    102c11 <__alltraps>

0010282d <vector173>:
.globl vector173
vector173:
  pushl $0
  10282d:	6a 00                	push   $0x0
  pushl $173
  10282f:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102834:	e9 d8 03 00 00       	jmp    102c11 <__alltraps>

00102839 <vector174>:
.globl vector174
vector174:
  pushl $0
  102839:	6a 00                	push   $0x0
  pushl $174
  10283b:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102840:	e9 cc 03 00 00       	jmp    102c11 <__alltraps>

00102845 <vector175>:
.globl vector175
vector175:
  pushl $0
  102845:	6a 00                	push   $0x0
  pushl $175
  102847:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10284c:	e9 c0 03 00 00       	jmp    102c11 <__alltraps>

00102851 <vector176>:
.globl vector176
vector176:
  pushl $0
  102851:	6a 00                	push   $0x0
  pushl $176
  102853:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102858:	e9 b4 03 00 00       	jmp    102c11 <__alltraps>

0010285d <vector177>:
.globl vector177
vector177:
  pushl $0
  10285d:	6a 00                	push   $0x0
  pushl $177
  10285f:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102864:	e9 a8 03 00 00       	jmp    102c11 <__alltraps>

00102869 <vector178>:
.globl vector178
vector178:
  pushl $0
  102869:	6a 00                	push   $0x0
  pushl $178
  10286b:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102870:	e9 9c 03 00 00       	jmp    102c11 <__alltraps>

00102875 <vector179>:
.globl vector179
vector179:
  pushl $0
  102875:	6a 00                	push   $0x0
  pushl $179
  102877:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10287c:	e9 90 03 00 00       	jmp    102c11 <__alltraps>

00102881 <vector180>:
.globl vector180
vector180:
  pushl $0
  102881:	6a 00                	push   $0x0
  pushl $180
  102883:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102888:	e9 84 03 00 00       	jmp    102c11 <__alltraps>

0010288d <vector181>:
.globl vector181
vector181:
  pushl $0
  10288d:	6a 00                	push   $0x0
  pushl $181
  10288f:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102894:	e9 78 03 00 00       	jmp    102c11 <__alltraps>

00102899 <vector182>:
.globl vector182
vector182:
  pushl $0
  102899:	6a 00                	push   $0x0
  pushl $182
  10289b:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1028a0:	e9 6c 03 00 00       	jmp    102c11 <__alltraps>

001028a5 <vector183>:
.globl vector183
vector183:
  pushl $0
  1028a5:	6a 00                	push   $0x0
  pushl $183
  1028a7:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1028ac:	e9 60 03 00 00       	jmp    102c11 <__alltraps>

001028b1 <vector184>:
.globl vector184
vector184:
  pushl $0
  1028b1:	6a 00                	push   $0x0
  pushl $184
  1028b3:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1028b8:	e9 54 03 00 00       	jmp    102c11 <__alltraps>

001028bd <vector185>:
.globl vector185
vector185:
  pushl $0
  1028bd:	6a 00                	push   $0x0
  pushl $185
  1028bf:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1028c4:	e9 48 03 00 00       	jmp    102c11 <__alltraps>

001028c9 <vector186>:
.globl vector186
vector186:
  pushl $0
  1028c9:	6a 00                	push   $0x0
  pushl $186
  1028cb:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1028d0:	e9 3c 03 00 00       	jmp    102c11 <__alltraps>

001028d5 <vector187>:
.globl vector187
vector187:
  pushl $0
  1028d5:	6a 00                	push   $0x0
  pushl $187
  1028d7:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1028dc:	e9 30 03 00 00       	jmp    102c11 <__alltraps>

001028e1 <vector188>:
.globl vector188
vector188:
  pushl $0
  1028e1:	6a 00                	push   $0x0
  pushl $188
  1028e3:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1028e8:	e9 24 03 00 00       	jmp    102c11 <__alltraps>

001028ed <vector189>:
.globl vector189
vector189:
  pushl $0
  1028ed:	6a 00                	push   $0x0
  pushl $189
  1028ef:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1028f4:	e9 18 03 00 00       	jmp    102c11 <__alltraps>

001028f9 <vector190>:
.globl vector190
vector190:
  pushl $0
  1028f9:	6a 00                	push   $0x0
  pushl $190
  1028fb:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102900:	e9 0c 03 00 00       	jmp    102c11 <__alltraps>

00102905 <vector191>:
.globl vector191
vector191:
  pushl $0
  102905:	6a 00                	push   $0x0
  pushl $191
  102907:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10290c:	e9 00 03 00 00       	jmp    102c11 <__alltraps>

00102911 <vector192>:
.globl vector192
vector192:
  pushl $0
  102911:	6a 00                	push   $0x0
  pushl $192
  102913:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102918:	e9 f4 02 00 00       	jmp    102c11 <__alltraps>

0010291d <vector193>:
.globl vector193
vector193:
  pushl $0
  10291d:	6a 00                	push   $0x0
  pushl $193
  10291f:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102924:	e9 e8 02 00 00       	jmp    102c11 <__alltraps>

00102929 <vector194>:
.globl vector194
vector194:
  pushl $0
  102929:	6a 00                	push   $0x0
  pushl $194
  10292b:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102930:	e9 dc 02 00 00       	jmp    102c11 <__alltraps>

00102935 <vector195>:
.globl vector195
vector195:
  pushl $0
  102935:	6a 00                	push   $0x0
  pushl $195
  102937:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10293c:	e9 d0 02 00 00       	jmp    102c11 <__alltraps>

00102941 <vector196>:
.globl vector196
vector196:
  pushl $0
  102941:	6a 00                	push   $0x0
  pushl $196
  102943:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102948:	e9 c4 02 00 00       	jmp    102c11 <__alltraps>

0010294d <vector197>:
.globl vector197
vector197:
  pushl $0
  10294d:	6a 00                	push   $0x0
  pushl $197
  10294f:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102954:	e9 b8 02 00 00       	jmp    102c11 <__alltraps>

00102959 <vector198>:
.globl vector198
vector198:
  pushl $0
  102959:	6a 00                	push   $0x0
  pushl $198
  10295b:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102960:	e9 ac 02 00 00       	jmp    102c11 <__alltraps>

00102965 <vector199>:
.globl vector199
vector199:
  pushl $0
  102965:	6a 00                	push   $0x0
  pushl $199
  102967:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10296c:	e9 a0 02 00 00       	jmp    102c11 <__alltraps>

00102971 <vector200>:
.globl vector200
vector200:
  pushl $0
  102971:	6a 00                	push   $0x0
  pushl $200
  102973:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102978:	e9 94 02 00 00       	jmp    102c11 <__alltraps>

0010297d <vector201>:
.globl vector201
vector201:
  pushl $0
  10297d:	6a 00                	push   $0x0
  pushl $201
  10297f:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102984:	e9 88 02 00 00       	jmp    102c11 <__alltraps>

00102989 <vector202>:
.globl vector202
vector202:
  pushl $0
  102989:	6a 00                	push   $0x0
  pushl $202
  10298b:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102990:	e9 7c 02 00 00       	jmp    102c11 <__alltraps>

00102995 <vector203>:
.globl vector203
vector203:
  pushl $0
  102995:	6a 00                	push   $0x0
  pushl $203
  102997:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10299c:	e9 70 02 00 00       	jmp    102c11 <__alltraps>

001029a1 <vector204>:
.globl vector204
vector204:
  pushl $0
  1029a1:	6a 00                	push   $0x0
  pushl $204
  1029a3:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1029a8:	e9 64 02 00 00       	jmp    102c11 <__alltraps>

001029ad <vector205>:
.globl vector205
vector205:
  pushl $0
  1029ad:	6a 00                	push   $0x0
  pushl $205
  1029af:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1029b4:	e9 58 02 00 00       	jmp    102c11 <__alltraps>

001029b9 <vector206>:
.globl vector206
vector206:
  pushl $0
  1029b9:	6a 00                	push   $0x0
  pushl $206
  1029bb:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1029c0:	e9 4c 02 00 00       	jmp    102c11 <__alltraps>

001029c5 <vector207>:
.globl vector207
vector207:
  pushl $0
  1029c5:	6a 00                	push   $0x0
  pushl $207
  1029c7:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1029cc:	e9 40 02 00 00       	jmp    102c11 <__alltraps>

001029d1 <vector208>:
.globl vector208
vector208:
  pushl $0
  1029d1:	6a 00                	push   $0x0
  pushl $208
  1029d3:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1029d8:	e9 34 02 00 00       	jmp    102c11 <__alltraps>

001029dd <vector209>:
.globl vector209
vector209:
  pushl $0
  1029dd:	6a 00                	push   $0x0
  pushl $209
  1029df:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1029e4:	e9 28 02 00 00       	jmp    102c11 <__alltraps>

001029e9 <vector210>:
.globl vector210
vector210:
  pushl $0
  1029e9:	6a 00                	push   $0x0
  pushl $210
  1029eb:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1029f0:	e9 1c 02 00 00       	jmp    102c11 <__alltraps>

001029f5 <vector211>:
.globl vector211
vector211:
  pushl $0
  1029f5:	6a 00                	push   $0x0
  pushl $211
  1029f7:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1029fc:	e9 10 02 00 00       	jmp    102c11 <__alltraps>

00102a01 <vector212>:
.globl vector212
vector212:
  pushl $0
  102a01:	6a 00                	push   $0x0
  pushl $212
  102a03:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102a08:	e9 04 02 00 00       	jmp    102c11 <__alltraps>

00102a0d <vector213>:
.globl vector213
vector213:
  pushl $0
  102a0d:	6a 00                	push   $0x0
  pushl $213
  102a0f:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102a14:	e9 f8 01 00 00       	jmp    102c11 <__alltraps>

00102a19 <vector214>:
.globl vector214
vector214:
  pushl $0
  102a19:	6a 00                	push   $0x0
  pushl $214
  102a1b:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102a20:	e9 ec 01 00 00       	jmp    102c11 <__alltraps>

00102a25 <vector215>:
.globl vector215
vector215:
  pushl $0
  102a25:	6a 00                	push   $0x0
  pushl $215
  102a27:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102a2c:	e9 e0 01 00 00       	jmp    102c11 <__alltraps>

00102a31 <vector216>:
.globl vector216
vector216:
  pushl $0
  102a31:	6a 00                	push   $0x0
  pushl $216
  102a33:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102a38:	e9 d4 01 00 00       	jmp    102c11 <__alltraps>

00102a3d <vector217>:
.globl vector217
vector217:
  pushl $0
  102a3d:	6a 00                	push   $0x0
  pushl $217
  102a3f:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102a44:	e9 c8 01 00 00       	jmp    102c11 <__alltraps>

00102a49 <vector218>:
.globl vector218
vector218:
  pushl $0
  102a49:	6a 00                	push   $0x0
  pushl $218
  102a4b:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102a50:	e9 bc 01 00 00       	jmp    102c11 <__alltraps>

00102a55 <vector219>:
.globl vector219
vector219:
  pushl $0
  102a55:	6a 00                	push   $0x0
  pushl $219
  102a57:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102a5c:	e9 b0 01 00 00       	jmp    102c11 <__alltraps>

00102a61 <vector220>:
.globl vector220
vector220:
  pushl $0
  102a61:	6a 00                	push   $0x0
  pushl $220
  102a63:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102a68:	e9 a4 01 00 00       	jmp    102c11 <__alltraps>

00102a6d <vector221>:
.globl vector221
vector221:
  pushl $0
  102a6d:	6a 00                	push   $0x0
  pushl $221
  102a6f:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102a74:	e9 98 01 00 00       	jmp    102c11 <__alltraps>

00102a79 <vector222>:
.globl vector222
vector222:
  pushl $0
  102a79:	6a 00                	push   $0x0
  pushl $222
  102a7b:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102a80:	e9 8c 01 00 00       	jmp    102c11 <__alltraps>

00102a85 <vector223>:
.globl vector223
vector223:
  pushl $0
  102a85:	6a 00                	push   $0x0
  pushl $223
  102a87:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102a8c:	e9 80 01 00 00       	jmp    102c11 <__alltraps>

00102a91 <vector224>:
.globl vector224
vector224:
  pushl $0
  102a91:	6a 00                	push   $0x0
  pushl $224
  102a93:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102a98:	e9 74 01 00 00       	jmp    102c11 <__alltraps>

00102a9d <vector225>:
.globl vector225
vector225:
  pushl $0
  102a9d:	6a 00                	push   $0x0
  pushl $225
  102a9f:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102aa4:	e9 68 01 00 00       	jmp    102c11 <__alltraps>

00102aa9 <vector226>:
.globl vector226
vector226:
  pushl $0
  102aa9:	6a 00                	push   $0x0
  pushl $226
  102aab:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102ab0:	e9 5c 01 00 00       	jmp    102c11 <__alltraps>

00102ab5 <vector227>:
.globl vector227
vector227:
  pushl $0
  102ab5:	6a 00                	push   $0x0
  pushl $227
  102ab7:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102abc:	e9 50 01 00 00       	jmp    102c11 <__alltraps>

00102ac1 <vector228>:
.globl vector228
vector228:
  pushl $0
  102ac1:	6a 00                	push   $0x0
  pushl $228
  102ac3:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102ac8:	e9 44 01 00 00       	jmp    102c11 <__alltraps>

00102acd <vector229>:
.globl vector229
vector229:
  pushl $0
  102acd:	6a 00                	push   $0x0
  pushl $229
  102acf:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102ad4:	e9 38 01 00 00       	jmp    102c11 <__alltraps>

00102ad9 <vector230>:
.globl vector230
vector230:
  pushl $0
  102ad9:	6a 00                	push   $0x0
  pushl $230
  102adb:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102ae0:	e9 2c 01 00 00       	jmp    102c11 <__alltraps>

00102ae5 <vector231>:
.globl vector231
vector231:
  pushl $0
  102ae5:	6a 00                	push   $0x0
  pushl $231
  102ae7:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102aec:	e9 20 01 00 00       	jmp    102c11 <__alltraps>

00102af1 <vector232>:
.globl vector232
vector232:
  pushl $0
  102af1:	6a 00                	push   $0x0
  pushl $232
  102af3:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102af8:	e9 14 01 00 00       	jmp    102c11 <__alltraps>

00102afd <vector233>:
.globl vector233
vector233:
  pushl $0
  102afd:	6a 00                	push   $0x0
  pushl $233
  102aff:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102b04:	e9 08 01 00 00       	jmp    102c11 <__alltraps>

00102b09 <vector234>:
.globl vector234
vector234:
  pushl $0
  102b09:	6a 00                	push   $0x0
  pushl $234
  102b0b:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102b10:	e9 fc 00 00 00       	jmp    102c11 <__alltraps>

00102b15 <vector235>:
.globl vector235
vector235:
  pushl $0
  102b15:	6a 00                	push   $0x0
  pushl $235
  102b17:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102b1c:	e9 f0 00 00 00       	jmp    102c11 <__alltraps>

00102b21 <vector236>:
.globl vector236
vector236:
  pushl $0
  102b21:	6a 00                	push   $0x0
  pushl $236
  102b23:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102b28:	e9 e4 00 00 00       	jmp    102c11 <__alltraps>

00102b2d <vector237>:
.globl vector237
vector237:
  pushl $0
  102b2d:	6a 00                	push   $0x0
  pushl $237
  102b2f:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102b34:	e9 d8 00 00 00       	jmp    102c11 <__alltraps>

00102b39 <vector238>:
.globl vector238
vector238:
  pushl $0
  102b39:	6a 00                	push   $0x0
  pushl $238
  102b3b:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102b40:	e9 cc 00 00 00       	jmp    102c11 <__alltraps>

00102b45 <vector239>:
.globl vector239
vector239:
  pushl $0
  102b45:	6a 00                	push   $0x0
  pushl $239
  102b47:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102b4c:	e9 c0 00 00 00       	jmp    102c11 <__alltraps>

00102b51 <vector240>:
.globl vector240
vector240:
  pushl $0
  102b51:	6a 00                	push   $0x0
  pushl $240
  102b53:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102b58:	e9 b4 00 00 00       	jmp    102c11 <__alltraps>

00102b5d <vector241>:
.globl vector241
vector241:
  pushl $0
  102b5d:	6a 00                	push   $0x0
  pushl $241
  102b5f:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102b64:	e9 a8 00 00 00       	jmp    102c11 <__alltraps>

00102b69 <vector242>:
.globl vector242
vector242:
  pushl $0
  102b69:	6a 00                	push   $0x0
  pushl $242
  102b6b:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102b70:	e9 9c 00 00 00       	jmp    102c11 <__alltraps>

00102b75 <vector243>:
.globl vector243
vector243:
  pushl $0
  102b75:	6a 00                	push   $0x0
  pushl $243
  102b77:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102b7c:	e9 90 00 00 00       	jmp    102c11 <__alltraps>

00102b81 <vector244>:
.globl vector244
vector244:
  pushl $0
  102b81:	6a 00                	push   $0x0
  pushl $244
  102b83:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102b88:	e9 84 00 00 00       	jmp    102c11 <__alltraps>

00102b8d <vector245>:
.globl vector245
vector245:
  pushl $0
  102b8d:	6a 00                	push   $0x0
  pushl $245
  102b8f:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102b94:	e9 78 00 00 00       	jmp    102c11 <__alltraps>

00102b99 <vector246>:
.globl vector246
vector246:
  pushl $0
  102b99:	6a 00                	push   $0x0
  pushl $246
  102b9b:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102ba0:	e9 6c 00 00 00       	jmp    102c11 <__alltraps>

00102ba5 <vector247>:
.globl vector247
vector247:
  pushl $0
  102ba5:	6a 00                	push   $0x0
  pushl $247
  102ba7:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102bac:	e9 60 00 00 00       	jmp    102c11 <__alltraps>

00102bb1 <vector248>:
.globl vector248
vector248:
  pushl $0
  102bb1:	6a 00                	push   $0x0
  pushl $248
  102bb3:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102bb8:	e9 54 00 00 00       	jmp    102c11 <__alltraps>

00102bbd <vector249>:
.globl vector249
vector249:
  pushl $0
  102bbd:	6a 00                	push   $0x0
  pushl $249
  102bbf:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102bc4:	e9 48 00 00 00       	jmp    102c11 <__alltraps>

00102bc9 <vector250>:
.globl vector250
vector250:
  pushl $0
  102bc9:	6a 00                	push   $0x0
  pushl $250
  102bcb:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102bd0:	e9 3c 00 00 00       	jmp    102c11 <__alltraps>

00102bd5 <vector251>:
.globl vector251
vector251:
  pushl $0
  102bd5:	6a 00                	push   $0x0
  pushl $251
  102bd7:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102bdc:	e9 30 00 00 00       	jmp    102c11 <__alltraps>

00102be1 <vector252>:
.globl vector252
vector252:
  pushl $0
  102be1:	6a 00                	push   $0x0
  pushl $252
  102be3:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102be8:	e9 24 00 00 00       	jmp    102c11 <__alltraps>

00102bed <vector253>:
.globl vector253
vector253:
  pushl $0
  102bed:	6a 00                	push   $0x0
  pushl $253
  102bef:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102bf4:	e9 18 00 00 00       	jmp    102c11 <__alltraps>

00102bf9 <vector254>:
.globl vector254
vector254:
  pushl $0
  102bf9:	6a 00                	push   $0x0
  pushl $254
  102bfb:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102c00:	e9 0c 00 00 00       	jmp    102c11 <__alltraps>

00102c05 <vector255>:
.globl vector255
vector255:
  pushl $0
  102c05:	6a 00                	push   $0x0
  pushl $255
  102c07:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102c0c:	e9 00 00 00 00       	jmp    102c11 <__alltraps>

00102c11 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102c11:	1e                   	push   %ds
    pushl %es
  102c12:	06                   	push   %es
    pushl %fs
  102c13:	0f a0                	push   %fs
    pushl %gs
  102c15:	0f a8                	push   %gs
    pushal
  102c17:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102c18:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102c1d:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102c1f:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102c21:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102c22:	e8 59 f5 ff ff       	call   102180 <trap>

    # pop the pushed stack pointer
    popl %esp
  102c27:	5c                   	pop    %esp

00102c28 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102c28:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102c29:	0f a9                	pop    %gs
    popl %fs
  102c2b:	0f a1                	pop    %fs
    popl %es
  102c2d:	07                   	pop    %es
    popl %ds
  102c2e:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102c2f:	83 c4 08             	add    $0x8,%esp
    iret
  102c32:	cf                   	iret   

00102c33 <lgdt>:
/*
    GDT表已经在内存中定义并赋了初值，这里要 加载 段选择子（也就是段寄存器（16位的）），
    加载好了之后，再配合 GDTR 寄存器 就可以分段 了
*/
static inline void
lgdt(struct pseudodesc *pd) {
  102c33:	55                   	push   %ebp
  102c34:	89 e5                	mov    %esp,%ebp
  102c36:	e8 3d d6 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102c3b:	05 15 dd 00 00       	add    $0xdd15,%eax
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102c40:	8b 45 08             	mov    0x8(%ebp),%eax
  102c43:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102c46:	b8 23 00 00 00       	mov    $0x23,%eax
  102c4b:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102c4d:	b8 23 00 00 00       	mov    $0x23,%eax
  102c52:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102c54:	b8 10 00 00 00       	mov    $0x10,%eax
  102c59:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102c5b:	b8 10 00 00 00       	mov    $0x10,%eax
  102c60:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102c62:	b8 10 00 00 00       	mov    $0x10,%eax
  102c67:	8e d0                	mov    %eax,%ss
    // reload cs
    // KERNEL_CS = 1<<3 
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102c69:	ea 70 2c 10 00 08 00 	ljmp   $0x8,$0x102c70
}
  102c70:	90                   	nop
  102c71:	5d                   	pop    %ebp
  102c72:	c3                   	ret    

00102c73 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102c73:	55                   	push   %ebp
  102c74:	89 e5                	mov    %esp,%ebp
  102c76:	83 ec 10             	sub    $0x10,%esp
  102c79:	e8 fa d5 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102c7e:	05 d2 dc 00 00       	add    $0xdcd2,%eax
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's onb ly a temporary value,
    // it will be set to KSTACKTOP in lab2.
    //init gdt_pd here
    gdt_pd.pd_lim  = (sizeof(gdt) - 1);
  102c83:	66 c7 80 38 10 00 00 	movw   $0x2f,0x1038(%eax)
  102c8a:	2f 00 
    gdt_pd.pd_base = ((uint32_t)gdt);
  102c8c:	8d 90 d0 ff ff ff    	lea    -0x30(%eax),%edx
  102c92:	89 90 3a 10 00 00    	mov    %edx,0x103a(%eax)
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102c98:	c7 c2 a0 19 11 00    	mov    $0x1119a0,%edx
  102c9e:	81 c2 00 04 00 00    	add    $0x400,%edx
  102ca4:	89 90 d4 0f 00 00    	mov    %edx,0xfd4(%eax)
    ts.ts_ss0 = KERNEL_DS;
  102caa:	66 c7 80 d8 0f 00 00 	movw   $0x10,0xfd8(%eax)
  102cb1:	10 00 
    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102cb3:	66 c7 80 f8 ff ff ff 	movw   $0x68,-0x8(%eax)
  102cba:	68 00 
  102cbc:	8d 90 d0 0f 00 00    	lea    0xfd0(%eax),%edx
  102cc2:	66 89 90 fa ff ff ff 	mov    %dx,-0x6(%eax)
  102cc9:	8d 90 d0 0f 00 00    	lea    0xfd0(%eax),%edx
  102ccf:	c1 ea 10             	shr    $0x10,%edx
  102cd2:	88 90 fc ff ff ff    	mov    %dl,-0x4(%eax)
  102cd8:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102cdf:	83 e2 f0             	and    $0xfffffff0,%edx
  102ce2:	83 ca 09             	or     $0x9,%edx
  102ce5:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102ceb:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102cf2:	83 ca 10             	or     $0x10,%edx
  102cf5:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102cfb:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102d02:	83 e2 9f             	and    $0xffffff9f,%edx
  102d05:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102d0b:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102d12:	83 ca 80             	or     $0xffffff80,%edx
  102d15:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102d1b:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102d22:	83 e2 f0             	and    $0xfffffff0,%edx
  102d25:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102d2b:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102d32:	83 e2 ef             	and    $0xffffffef,%edx
  102d35:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102d3b:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102d42:	83 e2 df             	and    $0xffffffdf,%edx
  102d45:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102d4b:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102d52:	83 ca 40             	or     $0x40,%edx
  102d55:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102d5b:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102d62:	83 e2 7f             	and    $0x7f,%edx
  102d65:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102d6b:	8d 90 d0 0f 00 00    	lea    0xfd0(%eax),%edx
  102d71:	c1 ea 18             	shr    $0x18,%edx
  102d74:	88 90 ff ff ff ff    	mov    %dl,-0x1(%eax)
    gdt[SEG_TSS].sd_s = 0;
  102d7a:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102d81:	83 e2 ef             	and    $0xffffffef,%edx
  102d84:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
    // reload all segment registers
    lgdt(&gdt_pd);
  102d8a:	8d 80 38 10 00 00    	lea    0x1038(%eax),%eax
  102d90:	50                   	push   %eax
  102d91:	e8 9d fe ff ff       	call   102c33 <lgdt>
  102d96:	83 c4 04             	add    $0x4,%esp
  102d99:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel)
{
    asm volatile("ltr %0" ::"r"(sel));
  102d9f:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102da3:	0f 00 d8             	ltr    %ax
}
  102da6:	90                   	nop
    // load the TSS
    ltr(GD_TSS);
}
  102da7:	90                   	nop
  102da8:	c9                   	leave  
  102da9:	c3                   	ret    

00102daa <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102daa:	55                   	push   %ebp
  102dab:	89 e5                	mov    %esp,%ebp
  102dad:	e8 c6 d4 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102db2:	05 9e db 00 00       	add    $0xdb9e,%eax
    gdt_init();
  102db7:	e8 b7 fe ff ff       	call   102c73 <gdt_init>
}
  102dbc:	90                   	nop
  102dbd:	5d                   	pop    %ebp
  102dbe:	c3                   	ret    

00102dbf <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102dbf:	55                   	push   %ebp
  102dc0:	89 e5                	mov    %esp,%ebp
  102dc2:	83 ec 10             	sub    $0x10,%esp
  102dc5:	e8 ae d4 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102dca:	05 86 db 00 00       	add    $0xdb86,%eax
    size_t cnt = 0;
  102dcf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102dd6:	eb 04                	jmp    102ddc <strlen+0x1d>
        cnt ++;
  102dd8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102ddc:	8b 45 08             	mov    0x8(%ebp),%eax
  102ddf:	8d 50 01             	lea    0x1(%eax),%edx
  102de2:	89 55 08             	mov    %edx,0x8(%ebp)
  102de5:	0f b6 00             	movzbl (%eax),%eax
  102de8:	84 c0                	test   %al,%al
  102dea:	75 ec                	jne    102dd8 <strlen+0x19>
    }
    return cnt;
  102dec:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102def:	c9                   	leave  
  102df0:	c3                   	ret    

00102df1 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102df1:	55                   	push   %ebp
  102df2:	89 e5                	mov    %esp,%ebp
  102df4:	83 ec 10             	sub    $0x10,%esp
  102df7:	e8 7c d4 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102dfc:	05 54 db 00 00       	add    $0xdb54,%eax
    size_t cnt = 0;
  102e01:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102e08:	eb 04                	jmp    102e0e <strnlen+0x1d>
        cnt ++;
  102e0a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102e0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e11:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102e14:	73 10                	jae    102e26 <strnlen+0x35>
  102e16:	8b 45 08             	mov    0x8(%ebp),%eax
  102e19:	8d 50 01             	lea    0x1(%eax),%edx
  102e1c:	89 55 08             	mov    %edx,0x8(%ebp)
  102e1f:	0f b6 00             	movzbl (%eax),%eax
  102e22:	84 c0                	test   %al,%al
  102e24:	75 e4                	jne    102e0a <strnlen+0x19>
    }
    return cnt;
  102e26:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e29:	c9                   	leave  
  102e2a:	c3                   	ret    

00102e2b <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102e2b:	55                   	push   %ebp
  102e2c:	89 e5                	mov    %esp,%ebp
  102e2e:	57                   	push   %edi
  102e2f:	56                   	push   %esi
  102e30:	83 ec 20             	sub    $0x20,%esp
  102e33:	e8 40 d4 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102e38:	05 18 db 00 00       	add    $0xdb18,%eax
  102e3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e40:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e43:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e46:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src)
{
    int d0, d1, d2;
    asm volatile(
  102e49:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e4f:	89 d1                	mov    %edx,%ecx
  102e51:	89 c2                	mov    %eax,%edx
  102e53:	89 ce                	mov    %ecx,%esi
  102e55:	89 d7                	mov    %edx,%edi
  102e57:	ac                   	lods   %ds:(%esi),%al
  102e58:	aa                   	stos   %al,%es:(%edi)
  102e59:	84 c0                	test   %al,%al
  102e5b:	75 fa                	jne    102e57 <strcpy+0x2c>
  102e5d:	89 fa                	mov    %edi,%edx
  102e5f:	89 f1                	mov    %esi,%ecx
  102e61:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e64:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102e67:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        "testb %%al, %%al;"
        "jne 1b;"
        : "=&S"(d0), "=&D"(d1), "=&a"(d2)
        : "0"(src), "1"(dst)
        : "memory");
    return dst;
  102e6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102e6d:	83 c4 20             	add    $0x20,%esp
  102e70:	5e                   	pop    %esi
  102e71:	5f                   	pop    %edi
  102e72:	5d                   	pop    %ebp
  102e73:	c3                   	ret    

00102e74 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102e74:	55                   	push   %ebp
  102e75:	89 e5                	mov    %esp,%ebp
  102e77:	83 ec 10             	sub    $0x10,%esp
  102e7a:	e8 f9 d3 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102e7f:	05 d1 da 00 00       	add    $0xdad1,%eax
    char *p = dst;
  102e84:	8b 45 08             	mov    0x8(%ebp),%eax
  102e87:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102e8a:	eb 21                	jmp    102ead <strncpy+0x39>
        if ((*p = *src) != '\0') {
  102e8c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e8f:	0f b6 10             	movzbl (%eax),%edx
  102e92:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e95:	88 10                	mov    %dl,(%eax)
  102e97:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e9a:	0f b6 00             	movzbl (%eax),%eax
  102e9d:	84 c0                	test   %al,%al
  102e9f:	74 04                	je     102ea5 <strncpy+0x31>
            src ++;
  102ea1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102ea5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102ea9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  102ead:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102eb1:	75 d9                	jne    102e8c <strncpy+0x18>
    }
    return dst;
  102eb3:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102eb6:	c9                   	leave  
  102eb7:	c3                   	ret    

00102eb8 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102eb8:	55                   	push   %ebp
  102eb9:	89 e5                	mov    %esp,%ebp
  102ebb:	57                   	push   %edi
  102ebc:	56                   	push   %esi
  102ebd:	83 ec 20             	sub    $0x20,%esp
  102ec0:	e8 b3 d3 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102ec5:	05 8b da 00 00       	add    $0xda8b,%eax
  102eca:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ed0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile(
  102ed6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ed9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102edc:	89 d1                	mov    %edx,%ecx
  102ede:	89 c2                	mov    %eax,%edx
  102ee0:	89 ce                	mov    %ecx,%esi
  102ee2:	89 d7                	mov    %edx,%edi
  102ee4:	ac                   	lods   %ds:(%esi),%al
  102ee5:	ae                   	scas   %es:(%edi),%al
  102ee6:	75 08                	jne    102ef0 <strcmp+0x38>
  102ee8:	84 c0                	test   %al,%al
  102eea:	75 f8                	jne    102ee4 <strcmp+0x2c>
  102eec:	31 c0                	xor    %eax,%eax
  102eee:	eb 04                	jmp    102ef4 <strcmp+0x3c>
  102ef0:	19 c0                	sbb    %eax,%eax
  102ef2:	0c 01                	or     $0x1,%al
  102ef4:	89 fa                	mov    %edi,%edx
  102ef6:	89 f1                	mov    %esi,%ecx
  102ef8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102efb:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102efe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102f01:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102f04:	83 c4 20             	add    $0x20,%esp
  102f07:	5e                   	pop    %esi
  102f08:	5f                   	pop    %edi
  102f09:	5d                   	pop    %ebp
  102f0a:	c3                   	ret    

00102f0b <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102f0b:	55                   	push   %ebp
  102f0c:	89 e5                	mov    %esp,%ebp
  102f0e:	e8 65 d3 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102f13:	05 3d da 00 00       	add    $0xda3d,%eax
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f18:	eb 0c                	jmp    102f26 <strncmp+0x1b>
        n --, s1 ++, s2 ++;
  102f1a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f1e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f22:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f26:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f2a:	74 1a                	je     102f46 <strncmp+0x3b>
  102f2c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2f:	0f b6 00             	movzbl (%eax),%eax
  102f32:	84 c0                	test   %al,%al
  102f34:	74 10                	je     102f46 <strncmp+0x3b>
  102f36:	8b 45 08             	mov    0x8(%ebp),%eax
  102f39:	0f b6 10             	movzbl (%eax),%edx
  102f3c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f3f:	0f b6 00             	movzbl (%eax),%eax
  102f42:	38 c2                	cmp    %al,%dl
  102f44:	74 d4                	je     102f1a <strncmp+0xf>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f46:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f4a:	74 18                	je     102f64 <strncmp+0x59>
  102f4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4f:	0f b6 00             	movzbl (%eax),%eax
  102f52:	0f b6 d0             	movzbl %al,%edx
  102f55:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f58:	0f b6 00             	movzbl (%eax),%eax
  102f5b:	0f b6 c0             	movzbl %al,%eax
  102f5e:	29 c2                	sub    %eax,%edx
  102f60:	89 d0                	mov    %edx,%eax
  102f62:	eb 05                	jmp    102f69 <strncmp+0x5e>
  102f64:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f69:	5d                   	pop    %ebp
  102f6a:	c3                   	ret    

00102f6b <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102f6b:	55                   	push   %ebp
  102f6c:	89 e5                	mov    %esp,%ebp
  102f6e:	83 ec 04             	sub    $0x4,%esp
  102f71:	e8 02 d3 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102f76:	05 da d9 00 00       	add    $0xd9da,%eax
  102f7b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f7e:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f81:	eb 14                	jmp    102f97 <strchr+0x2c>
        if (*s == c) {
  102f83:	8b 45 08             	mov    0x8(%ebp),%eax
  102f86:	0f b6 00             	movzbl (%eax),%eax
  102f89:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102f8c:	75 05                	jne    102f93 <strchr+0x28>
            return (char *)s;
  102f8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f91:	eb 13                	jmp    102fa6 <strchr+0x3b>
        }
        s ++;
  102f93:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102f97:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9a:	0f b6 00             	movzbl (%eax),%eax
  102f9d:	84 c0                	test   %al,%al
  102f9f:	75 e2                	jne    102f83 <strchr+0x18>
    }
    return NULL;
  102fa1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102fa6:	c9                   	leave  
  102fa7:	c3                   	ret    

00102fa8 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102fa8:	55                   	push   %ebp
  102fa9:	89 e5                	mov    %esp,%ebp
  102fab:	83 ec 04             	sub    $0x4,%esp
  102fae:	e8 c5 d2 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102fb3:	05 9d d9 00 00       	add    $0xd99d,%eax
  102fb8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fbb:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102fbe:	eb 0f                	jmp    102fcf <strfind+0x27>
        if (*s == c) {
  102fc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fc3:	0f b6 00             	movzbl (%eax),%eax
  102fc6:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102fc9:	74 10                	je     102fdb <strfind+0x33>
            break;
        }
        s ++;
  102fcb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102fcf:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd2:	0f b6 00             	movzbl (%eax),%eax
  102fd5:	84 c0                	test   %al,%al
  102fd7:	75 e7                	jne    102fc0 <strfind+0x18>
  102fd9:	eb 01                	jmp    102fdc <strfind+0x34>
            break;
  102fdb:	90                   	nop
    }
    return (char *)s;
  102fdc:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102fdf:	c9                   	leave  
  102fe0:	c3                   	ret    

00102fe1 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102fe1:	55                   	push   %ebp
  102fe2:	89 e5                	mov    %esp,%ebp
  102fe4:	83 ec 10             	sub    $0x10,%esp
  102fe7:	e8 8c d2 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  102fec:	05 64 d9 00 00       	add    $0xd964,%eax
    int neg = 0;
  102ff1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102ff8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102fff:	eb 04                	jmp    103005 <strtol+0x24>
        s ++;
  103001:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  103005:	8b 45 08             	mov    0x8(%ebp),%eax
  103008:	0f b6 00             	movzbl (%eax),%eax
  10300b:	3c 20                	cmp    $0x20,%al
  10300d:	74 f2                	je     103001 <strtol+0x20>
  10300f:	8b 45 08             	mov    0x8(%ebp),%eax
  103012:	0f b6 00             	movzbl (%eax),%eax
  103015:	3c 09                	cmp    $0x9,%al
  103017:	74 e8                	je     103001 <strtol+0x20>
    }

    // plus/minus sign
    if (*s == '+') {
  103019:	8b 45 08             	mov    0x8(%ebp),%eax
  10301c:	0f b6 00             	movzbl (%eax),%eax
  10301f:	3c 2b                	cmp    $0x2b,%al
  103021:	75 06                	jne    103029 <strtol+0x48>
        s ++;
  103023:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103027:	eb 15                	jmp    10303e <strtol+0x5d>
    }
    else if (*s == '-') {
  103029:	8b 45 08             	mov    0x8(%ebp),%eax
  10302c:	0f b6 00             	movzbl (%eax),%eax
  10302f:	3c 2d                	cmp    $0x2d,%al
  103031:	75 0b                	jne    10303e <strtol+0x5d>
        s ++, neg = 1;
  103033:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103037:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10303e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103042:	74 06                	je     10304a <strtol+0x69>
  103044:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103048:	75 24                	jne    10306e <strtol+0x8d>
  10304a:	8b 45 08             	mov    0x8(%ebp),%eax
  10304d:	0f b6 00             	movzbl (%eax),%eax
  103050:	3c 30                	cmp    $0x30,%al
  103052:	75 1a                	jne    10306e <strtol+0x8d>
  103054:	8b 45 08             	mov    0x8(%ebp),%eax
  103057:	83 c0 01             	add    $0x1,%eax
  10305a:	0f b6 00             	movzbl (%eax),%eax
  10305d:	3c 78                	cmp    $0x78,%al
  10305f:	75 0d                	jne    10306e <strtol+0x8d>
        s += 2, base = 16;
  103061:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103065:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10306c:	eb 2a                	jmp    103098 <strtol+0xb7>
    }
    else if (base == 0 && s[0] == '0') {
  10306e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103072:	75 17                	jne    10308b <strtol+0xaa>
  103074:	8b 45 08             	mov    0x8(%ebp),%eax
  103077:	0f b6 00             	movzbl (%eax),%eax
  10307a:	3c 30                	cmp    $0x30,%al
  10307c:	75 0d                	jne    10308b <strtol+0xaa>
        s ++, base = 8;
  10307e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103082:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103089:	eb 0d                	jmp    103098 <strtol+0xb7>
    }
    else if (base == 0) {
  10308b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10308f:	75 07                	jne    103098 <strtol+0xb7>
        base = 10;
  103091:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103098:	8b 45 08             	mov    0x8(%ebp),%eax
  10309b:	0f b6 00             	movzbl (%eax),%eax
  10309e:	3c 2f                	cmp    $0x2f,%al
  1030a0:	7e 1b                	jle    1030bd <strtol+0xdc>
  1030a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a5:	0f b6 00             	movzbl (%eax),%eax
  1030a8:	3c 39                	cmp    $0x39,%al
  1030aa:	7f 11                	jg     1030bd <strtol+0xdc>
            dig = *s - '0';
  1030ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1030af:	0f b6 00             	movzbl (%eax),%eax
  1030b2:	0f be c0             	movsbl %al,%eax
  1030b5:	83 e8 30             	sub    $0x30,%eax
  1030b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030bb:	eb 48                	jmp    103105 <strtol+0x124>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1030bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c0:	0f b6 00             	movzbl (%eax),%eax
  1030c3:	3c 60                	cmp    $0x60,%al
  1030c5:	7e 1b                	jle    1030e2 <strtol+0x101>
  1030c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ca:	0f b6 00             	movzbl (%eax),%eax
  1030cd:	3c 7a                	cmp    $0x7a,%al
  1030cf:	7f 11                	jg     1030e2 <strtol+0x101>
            dig = *s - 'a' + 10;
  1030d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d4:	0f b6 00             	movzbl (%eax),%eax
  1030d7:	0f be c0             	movsbl %al,%eax
  1030da:	83 e8 57             	sub    $0x57,%eax
  1030dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030e0:	eb 23                	jmp    103105 <strtol+0x124>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1030e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e5:	0f b6 00             	movzbl (%eax),%eax
  1030e8:	3c 40                	cmp    $0x40,%al
  1030ea:	7e 3c                	jle    103128 <strtol+0x147>
  1030ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ef:	0f b6 00             	movzbl (%eax),%eax
  1030f2:	3c 5a                	cmp    $0x5a,%al
  1030f4:	7f 32                	jg     103128 <strtol+0x147>
            dig = *s - 'A' + 10;
  1030f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f9:	0f b6 00             	movzbl (%eax),%eax
  1030fc:	0f be c0             	movsbl %al,%eax
  1030ff:	83 e8 37             	sub    $0x37,%eax
  103102:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103105:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103108:	3b 45 10             	cmp    0x10(%ebp),%eax
  10310b:	7d 1a                	jge    103127 <strtol+0x146>
            break;
        }
        s ++, val = (val * base) + dig;
  10310d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103111:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103114:	0f af 45 10          	imul   0x10(%ebp),%eax
  103118:	89 c2                	mov    %eax,%edx
  10311a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10311d:	01 d0                	add    %edx,%eax
  10311f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  103122:	e9 71 ff ff ff       	jmp    103098 <strtol+0xb7>
            break;
  103127:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  103128:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10312c:	74 08                	je     103136 <strtol+0x155>
        *endptr = (char *) s;
  10312e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103131:	8b 55 08             	mov    0x8(%ebp),%edx
  103134:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103136:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10313a:	74 07                	je     103143 <strtol+0x162>
  10313c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10313f:	f7 d8                	neg    %eax
  103141:	eb 03                	jmp    103146 <strtol+0x165>
  103143:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103146:	c9                   	leave  
  103147:	c3                   	ret    

00103148 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103148:	55                   	push   %ebp
  103149:	89 e5                	mov    %esp,%ebp
  10314b:	57                   	push   %edi
  10314c:	83 ec 24             	sub    $0x24,%esp
  10314f:	e8 24 d1 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  103154:	05 fc d7 00 00       	add    $0xd7fc,%eax
  103159:	8b 45 0c             	mov    0xc(%ebp),%eax
  10315c:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  10315f:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  103163:	8b 55 08             	mov    0x8(%ebp),%edx
  103166:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103169:	88 45 f7             	mov    %al,-0x9(%ebp)
  10316c:	8b 45 10             	mov    0x10(%ebp),%eax
  10316f:	89 45 f0             	mov    %eax,-0x10(%ebp)
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n)
{
    int d0, d1;
    asm volatile(
  103172:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103175:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103179:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10317c:	89 d7                	mov    %edx,%edi
  10317e:	f3 aa                	rep stos %al,%es:(%edi)
  103180:	89 fa                	mov    %edi,%edx
  103182:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103185:	89 55 e8             	mov    %edx,-0x18(%ebp)
        "rep; stosb;"
        : "=&c"(d0), "=&D"(d1)
        : "0"(n), "a"(c), "1"(s)
        : "memory");
    return s;
  103188:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  10318b:	83 c4 24             	add    $0x24,%esp
  10318e:	5f                   	pop    %edi
  10318f:	5d                   	pop    %ebp
  103190:	c3                   	ret    

00103191 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103191:	55                   	push   %ebp
  103192:	89 e5                	mov    %esp,%ebp
  103194:	57                   	push   %edi
  103195:	56                   	push   %esi
  103196:	53                   	push   %ebx
  103197:	83 ec 30             	sub    $0x30,%esp
  10319a:	e8 d9 d0 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10319f:	05 b1 d7 00 00       	add    $0xd7b1,%eax
  1031a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1031b0:	8b 45 10             	mov    0x10(%ebp),%eax
  1031b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n)
{
    if (dst < src)
  1031b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031b9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1031bc:	73 42                	jae    103200 <memmove+0x6f>
  1031be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1031c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031c7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1031ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031cd:	89 45 dc             	mov    %eax,-0x24(%ebp)
        "andl $3, %%ecx;"
        "jz 1f;"
        "rep; movsb;"
        "1:"
        : "=&c"(d0), "=&D"(d1), "=&S"(d2)
        : "0"(n / 4), "g"(n), "1"(dst), "2"(src)
  1031d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1031d3:	c1 e8 02             	shr    $0x2,%eax
  1031d6:	89 c1                	mov    %eax,%ecx
    asm volatile(
  1031d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031db:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031de:	89 d7                	mov    %edx,%edi
  1031e0:	89 c6                	mov    %eax,%esi
  1031e2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1031e4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1031e7:	83 e1 03             	and    $0x3,%ecx
  1031ea:	74 02                	je     1031ee <memmove+0x5d>
  1031ec:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031ee:	89 f0                	mov    %esi,%eax
  1031f0:	89 fa                	mov    %edi,%edx
  1031f2:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1031f5:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1031f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        : "memory");
    return dst;
  1031fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  1031fe:	eb 36                	jmp    103236 <memmove+0xa5>
        : "0"(n), "1"(n - 1 + src), "2"(n - 1 + dst)
  103200:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103203:	8d 50 ff             	lea    -0x1(%eax),%edx
  103206:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103209:	01 c2                	add    %eax,%edx
  10320b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10320e:	8d 48 ff             	lea    -0x1(%eax),%ecx
  103211:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103214:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile(
  103217:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10321a:	89 c1                	mov    %eax,%ecx
  10321c:	89 d8                	mov    %ebx,%eax
  10321e:	89 d6                	mov    %edx,%esi
  103220:	89 c7                	mov    %eax,%edi
  103222:	fd                   	std    
  103223:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103225:	fc                   	cld    
  103226:	89 f8                	mov    %edi,%eax
  103228:	89 f2                	mov    %esi,%edx
  10322a:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10322d:	89 55 c8             	mov    %edx,-0x38(%ebp)
  103230:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  103233:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103236:	83 c4 30             	add    $0x30,%esp
  103239:	5b                   	pop    %ebx
  10323a:	5e                   	pop    %esi
  10323b:	5f                   	pop    %edi
  10323c:	5d                   	pop    %ebp
  10323d:	c3                   	ret    

0010323e <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10323e:	55                   	push   %ebp
  10323f:	89 e5                	mov    %esp,%ebp
  103241:	57                   	push   %edi
  103242:	56                   	push   %esi
  103243:	83 ec 20             	sub    $0x20,%esp
  103246:	e8 2d d0 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10324b:	05 05 d7 00 00       	add    $0xd705,%eax
  103250:	8b 45 08             	mov    0x8(%ebp),%eax
  103253:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103256:	8b 45 0c             	mov    0xc(%ebp),%eax
  103259:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10325c:	8b 45 10             	mov    0x10(%ebp),%eax
  10325f:	89 45 ec             	mov    %eax,-0x14(%ebp)
        : "0"(n / 4), "g"(n), "1"(dst), "2"(src)
  103262:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103265:	c1 e8 02             	shr    $0x2,%eax
  103268:	89 c1                	mov    %eax,%ecx
    asm volatile(
  10326a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10326d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103270:	89 d7                	mov    %edx,%edi
  103272:	89 c6                	mov    %eax,%esi
  103274:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103276:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103279:	83 e1 03             	and    $0x3,%ecx
  10327c:	74 02                	je     103280 <memcpy+0x42>
  10327e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103280:	89 f0                	mov    %esi,%eax
  103282:	89 fa                	mov    %edi,%edx
  103284:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103287:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10328a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  10328d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103290:	83 c4 20             	add    $0x20,%esp
  103293:	5e                   	pop    %esi
  103294:	5f                   	pop    %edi
  103295:	5d                   	pop    %ebp
  103296:	c3                   	ret    

00103297 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103297:	55                   	push   %ebp
  103298:	89 e5                	mov    %esp,%ebp
  10329a:	83 ec 10             	sub    $0x10,%esp
  10329d:	e8 d6 cf ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1032a2:	05 ae d6 00 00       	add    $0xd6ae,%eax
    const char *s1 = (const char *)v1;
  1032a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1032aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1032ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1032b3:	eb 30                	jmp    1032e5 <memcmp+0x4e>
        if (*s1 != *s2) {
  1032b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1032b8:	0f b6 10             	movzbl (%eax),%edx
  1032bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032be:	0f b6 00             	movzbl (%eax),%eax
  1032c1:	38 c2                	cmp    %al,%dl
  1032c3:	74 18                	je     1032dd <memcmp+0x46>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1032c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1032c8:	0f b6 00             	movzbl (%eax),%eax
  1032cb:	0f b6 d0             	movzbl %al,%edx
  1032ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032d1:	0f b6 00             	movzbl (%eax),%eax
  1032d4:	0f b6 c0             	movzbl %al,%eax
  1032d7:	29 c2                	sub    %eax,%edx
  1032d9:	89 d0                	mov    %edx,%eax
  1032db:	eb 1a                	jmp    1032f7 <memcmp+0x60>
        }
        s1 ++, s2 ++;
  1032dd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1032e1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  1032e5:	8b 45 10             	mov    0x10(%ebp),%eax
  1032e8:	8d 50 ff             	lea    -0x1(%eax),%edx
  1032eb:	89 55 10             	mov    %edx,0x10(%ebp)
  1032ee:	85 c0                	test   %eax,%eax
  1032f0:	75 c3                	jne    1032b5 <memcmp+0x1e>
    }
    return 0;
  1032f2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032f7:	c9                   	leave  
  1032f8:	c3                   	ret    

001032f9 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1032f9:	55                   	push   %ebp
  1032fa:	89 e5                	mov    %esp,%ebp
  1032fc:	53                   	push   %ebx
  1032fd:	83 ec 34             	sub    $0x34,%esp
  103300:	e8 77 cf ff ff       	call   10027c <__x86.get_pc_thunk.bx>
  103305:	81 c3 4b d6 00 00    	add    $0xd64b,%ebx
  10330b:	8b 45 10             	mov    0x10(%ebp),%eax
  10330e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  103311:	8b 45 14             	mov    0x14(%ebp),%eax
  103314:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  103317:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10331a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10331d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103320:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  103323:	8b 45 18             	mov    0x18(%ebp),%eax
  103326:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103329:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10332c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10332f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103332:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103335:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103338:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10333b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10333f:	74 1c                	je     10335d <printnum+0x64>
  103341:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103344:	ba 00 00 00 00       	mov    $0x0,%edx
  103349:	f7 75 e4             	divl   -0x1c(%ebp)
  10334c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10334f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103352:	ba 00 00 00 00       	mov    $0x0,%edx
  103357:	f7 75 e4             	divl   -0x1c(%ebp)
  10335a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10335d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103360:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103363:	f7 75 e4             	divl   -0x1c(%ebp)
  103366:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103369:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10336c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10336f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103372:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103375:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103378:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10337b:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  10337e:	8b 45 18             	mov    0x18(%ebp),%eax
  103381:	ba 00 00 00 00       	mov    $0x0,%edx
  103386:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  103389:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  10338c:	19 d1                	sbb    %edx,%ecx
  10338e:	72 37                	jb     1033c7 <printnum+0xce>
        printnum(putch, putdat, result, base, width - 1, padc);
  103390:	8b 45 1c             	mov    0x1c(%ebp),%eax
  103393:	83 e8 01             	sub    $0x1,%eax
  103396:	83 ec 04             	sub    $0x4,%esp
  103399:	ff 75 20             	pushl  0x20(%ebp)
  10339c:	50                   	push   %eax
  10339d:	ff 75 18             	pushl  0x18(%ebp)
  1033a0:	ff 75 ec             	pushl  -0x14(%ebp)
  1033a3:	ff 75 e8             	pushl  -0x18(%ebp)
  1033a6:	ff 75 0c             	pushl  0xc(%ebp)
  1033a9:	ff 75 08             	pushl  0x8(%ebp)
  1033ac:	e8 48 ff ff ff       	call   1032f9 <printnum>
  1033b1:	83 c4 20             	add    $0x20,%esp
  1033b4:	eb 1b                	jmp    1033d1 <printnum+0xd8>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1033b6:	83 ec 08             	sub    $0x8,%esp
  1033b9:	ff 75 0c             	pushl  0xc(%ebp)
  1033bc:	ff 75 20             	pushl  0x20(%ebp)
  1033bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c2:	ff d0                	call   *%eax
  1033c4:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  1033c7:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  1033cb:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1033cf:	7f e5                	jg     1033b6 <printnum+0xbd>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1033d1:	8d 93 0a 38 ff ff    	lea    -0xc7f6(%ebx),%edx
  1033d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1033da:	01 d0                	add    %edx,%eax
  1033dc:	0f b6 00             	movzbl (%eax),%eax
  1033df:	0f be c0             	movsbl %al,%eax
  1033e2:	83 ec 08             	sub    $0x8,%esp
  1033e5:	ff 75 0c             	pushl  0xc(%ebp)
  1033e8:	50                   	push   %eax
  1033e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ec:	ff d0                	call   *%eax
  1033ee:	83 c4 10             	add    $0x10,%esp
}
  1033f1:	90                   	nop
  1033f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1033f5:	c9                   	leave  
  1033f6:	c3                   	ret    

001033f7 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1033f7:	55                   	push   %ebp
  1033f8:	89 e5                	mov    %esp,%ebp
  1033fa:	e8 79 ce ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1033ff:	05 51 d5 00 00       	add    $0xd551,%eax
    if (lflag >= 2) {
  103404:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103408:	7e 14                	jle    10341e <getuint+0x27>
        return va_arg(*ap, unsigned long long);
  10340a:	8b 45 08             	mov    0x8(%ebp),%eax
  10340d:	8b 00                	mov    (%eax),%eax
  10340f:	8d 48 08             	lea    0x8(%eax),%ecx
  103412:	8b 55 08             	mov    0x8(%ebp),%edx
  103415:	89 0a                	mov    %ecx,(%edx)
  103417:	8b 50 04             	mov    0x4(%eax),%edx
  10341a:	8b 00                	mov    (%eax),%eax
  10341c:	eb 30                	jmp    10344e <getuint+0x57>
    }
    else if (lflag) {
  10341e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103422:	74 16                	je     10343a <getuint+0x43>
        return va_arg(*ap, unsigned long);
  103424:	8b 45 08             	mov    0x8(%ebp),%eax
  103427:	8b 00                	mov    (%eax),%eax
  103429:	8d 48 04             	lea    0x4(%eax),%ecx
  10342c:	8b 55 08             	mov    0x8(%ebp),%edx
  10342f:	89 0a                	mov    %ecx,(%edx)
  103431:	8b 00                	mov    (%eax),%eax
  103433:	ba 00 00 00 00       	mov    $0x0,%edx
  103438:	eb 14                	jmp    10344e <getuint+0x57>
    }
    else {
        return va_arg(*ap, unsigned int);
  10343a:	8b 45 08             	mov    0x8(%ebp),%eax
  10343d:	8b 00                	mov    (%eax),%eax
  10343f:	8d 48 04             	lea    0x4(%eax),%ecx
  103442:	8b 55 08             	mov    0x8(%ebp),%edx
  103445:	89 0a                	mov    %ecx,(%edx)
  103447:	8b 00                	mov    (%eax),%eax
  103449:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  10344e:	5d                   	pop    %ebp
  10344f:	c3                   	ret    

00103450 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103450:	55                   	push   %ebp
  103451:	89 e5                	mov    %esp,%ebp
  103453:	e8 20 ce ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  103458:	05 f8 d4 00 00       	add    $0xd4f8,%eax
    if (lflag >= 2) {
  10345d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103461:	7e 14                	jle    103477 <getint+0x27>
        return va_arg(*ap, long long);
  103463:	8b 45 08             	mov    0x8(%ebp),%eax
  103466:	8b 00                	mov    (%eax),%eax
  103468:	8d 48 08             	lea    0x8(%eax),%ecx
  10346b:	8b 55 08             	mov    0x8(%ebp),%edx
  10346e:	89 0a                	mov    %ecx,(%edx)
  103470:	8b 50 04             	mov    0x4(%eax),%edx
  103473:	8b 00                	mov    (%eax),%eax
  103475:	eb 28                	jmp    10349f <getint+0x4f>
    }
    else if (lflag) {
  103477:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10347b:	74 12                	je     10348f <getint+0x3f>
        return va_arg(*ap, long);
  10347d:	8b 45 08             	mov    0x8(%ebp),%eax
  103480:	8b 00                	mov    (%eax),%eax
  103482:	8d 48 04             	lea    0x4(%eax),%ecx
  103485:	8b 55 08             	mov    0x8(%ebp),%edx
  103488:	89 0a                	mov    %ecx,(%edx)
  10348a:	8b 00                	mov    (%eax),%eax
  10348c:	99                   	cltd   
  10348d:	eb 10                	jmp    10349f <getint+0x4f>
    }
    else {
        return va_arg(*ap, int);
  10348f:	8b 45 08             	mov    0x8(%ebp),%eax
  103492:	8b 00                	mov    (%eax),%eax
  103494:	8d 48 04             	lea    0x4(%eax),%ecx
  103497:	8b 55 08             	mov    0x8(%ebp),%edx
  10349a:	89 0a                	mov    %ecx,(%edx)
  10349c:	8b 00                	mov    (%eax),%eax
  10349e:	99                   	cltd   
    }
}
  10349f:	5d                   	pop    %ebp
  1034a0:	c3                   	ret    

001034a1 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1034a1:	55                   	push   %ebp
  1034a2:	89 e5                	mov    %esp,%ebp
  1034a4:	83 ec 18             	sub    $0x18,%esp
  1034a7:	e8 cc cd ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1034ac:	05 a4 d4 00 00       	add    $0xd4a4,%eax
    va_list ap;

    va_start(ap, fmt);
  1034b1:	8d 45 14             	lea    0x14(%ebp),%eax
  1034b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1034b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1034ba:	50                   	push   %eax
  1034bb:	ff 75 10             	pushl  0x10(%ebp)
  1034be:	ff 75 0c             	pushl  0xc(%ebp)
  1034c1:	ff 75 08             	pushl  0x8(%ebp)
  1034c4:	e8 06 00 00 00       	call   1034cf <vprintfmt>
  1034c9:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  1034cc:	90                   	nop
  1034cd:	c9                   	leave  
  1034ce:	c3                   	ret    

001034cf <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1034cf:	55                   	push   %ebp
  1034d0:	89 e5                	mov    %esp,%ebp
  1034d2:	57                   	push   %edi
  1034d3:	56                   	push   %esi
  1034d4:	53                   	push   %ebx
  1034d5:	83 ec 2c             	sub    $0x2c,%esp
  1034d8:	e8 8c 04 00 00       	call   103969 <__x86.get_pc_thunk.di>
  1034dd:	81 c7 73 d4 00 00    	add    $0xd473,%edi
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1034e3:	eb 17                	jmp    1034fc <vprintfmt+0x2d>
            if (ch == '\0') {
  1034e5:	85 db                	test   %ebx,%ebx
  1034e7:	0f 84 9a 03 00 00    	je     103887 <.L22+0x2d>
                return;
            }
            putch(ch, putdat);
  1034ed:	83 ec 08             	sub    $0x8,%esp
  1034f0:	ff 75 0c             	pushl  0xc(%ebp)
  1034f3:	53                   	push   %ebx
  1034f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f7:	ff d0                	call   *%eax
  1034f9:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1034fc:	8b 45 10             	mov    0x10(%ebp),%eax
  1034ff:	8d 50 01             	lea    0x1(%eax),%edx
  103502:	89 55 10             	mov    %edx,0x10(%ebp)
  103505:	0f b6 00             	movzbl (%eax),%eax
  103508:	0f b6 d8             	movzbl %al,%ebx
  10350b:	83 fb 25             	cmp    $0x25,%ebx
  10350e:	75 d5                	jne    1034e5 <vprintfmt+0x16>
        }

        // Process a %-escape sequence
        char padc = ' ';
  103510:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
        width = precision = -1;
  103514:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  10351b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10351e:	89 45 d8             	mov    %eax,-0x28(%ebp)
        lflag = altflag = 0;
  103521:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  103528:	8b 45 cc             	mov    -0x34(%ebp),%eax
  10352b:	89 45 d0             	mov    %eax,-0x30(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10352e:	8b 45 10             	mov    0x10(%ebp),%eax
  103531:	8d 50 01             	lea    0x1(%eax),%edx
  103534:	89 55 10             	mov    %edx,0x10(%ebp)
  103537:	0f b6 00             	movzbl (%eax),%eax
  10353a:	0f b6 d8             	movzbl %al,%ebx
  10353d:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103540:	83 f8 55             	cmp    $0x55,%eax
  103543:	0f 87 11 03 00 00    	ja     10385a <.L22>
  103549:	c1 e0 02             	shl    $0x2,%eax
  10354c:	8b 84 38 30 38 ff ff 	mov    -0xc7d0(%eax,%edi,1),%eax
  103553:	01 f8                	add    %edi,%eax
  103555:	ff e0                	jmp    *%eax

00103557 <.L36>:

        // flag to pad on the right
        case '-':
            padc = '-';
  103557:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
            goto reswitch;
  10355b:	eb d1                	jmp    10352e <vprintfmt+0x5f>

0010355d <.L34>:

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10355d:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
            goto reswitch;
  103561:	eb cb                	jmp    10352e <vprintfmt+0x5f>

00103563 <.L33>:

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103563:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
                precision = precision * 10 + ch - '0';
  10356a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10356d:	89 d0                	mov    %edx,%eax
  10356f:	c1 e0 02             	shl    $0x2,%eax
  103572:	01 d0                	add    %edx,%eax
  103574:	01 c0                	add    %eax,%eax
  103576:	01 d8                	add    %ebx,%eax
  103578:	83 e8 30             	sub    $0x30,%eax
  10357b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                ch = *fmt;
  10357e:	8b 45 10             	mov    0x10(%ebp),%eax
  103581:	0f b6 00             	movzbl (%eax),%eax
  103584:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103587:	83 fb 2f             	cmp    $0x2f,%ebx
  10358a:	7e 39                	jle    1035c5 <.L39+0xc>
  10358c:	83 fb 39             	cmp    $0x39,%ebx
  10358f:	7f 34                	jg     1035c5 <.L39+0xc>
            for (precision = 0; ; ++ fmt) {
  103591:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
  103595:	eb d3                	jmp    10356a <.L33+0x7>

00103597 <.L37>:
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  103597:	8b 45 14             	mov    0x14(%ebp),%eax
  10359a:	8d 50 04             	lea    0x4(%eax),%edx
  10359d:	89 55 14             	mov    %edx,0x14(%ebp)
  1035a0:	8b 00                	mov    (%eax),%eax
  1035a2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
            goto process_precision;
  1035a5:	eb 1f                	jmp    1035c6 <.L39+0xd>

001035a7 <.L35>:

        case '.':
            if (width < 0)
  1035a7:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1035ab:	79 81                	jns    10352e <vprintfmt+0x5f>
                width = 0;
  1035ad:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            goto reswitch;
  1035b4:	e9 75 ff ff ff       	jmp    10352e <vprintfmt+0x5f>

001035b9 <.L39>:

        case '#':
            altflag = 1;
  1035b9:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
            goto reswitch;
  1035c0:	e9 69 ff ff ff       	jmp    10352e <vprintfmt+0x5f>
            goto process_precision;
  1035c5:	90                   	nop

        process_precision:
            if (width < 0)
  1035c6:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1035ca:	0f 89 5e ff ff ff    	jns    10352e <vprintfmt+0x5f>
                width = precision, precision = -1;
  1035d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1035d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1035d6:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
            goto reswitch;
  1035dd:	e9 4c ff ff ff       	jmp    10352e <vprintfmt+0x5f>

001035e2 <.L29>:

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1035e2:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
            goto reswitch;
  1035e6:	e9 43 ff ff ff       	jmp    10352e <vprintfmt+0x5f>

001035eb <.L32>:

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1035eb:	8b 45 14             	mov    0x14(%ebp),%eax
  1035ee:	8d 50 04             	lea    0x4(%eax),%edx
  1035f1:	89 55 14             	mov    %edx,0x14(%ebp)
  1035f4:	8b 00                	mov    (%eax),%eax
  1035f6:	83 ec 08             	sub    $0x8,%esp
  1035f9:	ff 75 0c             	pushl  0xc(%ebp)
  1035fc:	50                   	push   %eax
  1035fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103600:	ff d0                	call   *%eax
  103602:	83 c4 10             	add    $0x10,%esp
            break;
  103605:	e9 78 02 00 00       	jmp    103882 <.L22+0x28>

0010360a <.L30>:

        // error message
        case 'e':
            err = va_arg(ap, int);
  10360a:	8b 45 14             	mov    0x14(%ebp),%eax
  10360d:	8d 50 04             	lea    0x4(%eax),%edx
  103610:	89 55 14             	mov    %edx,0x14(%ebp)
  103613:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103615:	85 db                	test   %ebx,%ebx
  103617:	79 02                	jns    10361b <.L30+0x11>
                err = -err;
  103619:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10361b:	83 fb 06             	cmp    $0x6,%ebx
  10361e:	7f 0b                	jg     10362b <.L30+0x21>
  103620:	8b b4 9f 00 01 00 00 	mov    0x100(%edi,%ebx,4),%esi
  103627:	85 f6                	test   %esi,%esi
  103629:	75 1b                	jne    103646 <.L30+0x3c>
                printfmt(putch, putdat, "error %d", err);
  10362b:	53                   	push   %ebx
  10362c:	8d 87 1b 38 ff ff    	lea    -0xc7e5(%edi),%eax
  103632:	50                   	push   %eax
  103633:	ff 75 0c             	pushl  0xc(%ebp)
  103636:	ff 75 08             	pushl  0x8(%ebp)
  103639:	e8 63 fe ff ff       	call   1034a1 <printfmt>
  10363e:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103641:	e9 3c 02 00 00       	jmp    103882 <.L22+0x28>
                printfmt(putch, putdat, "%s", p);
  103646:	56                   	push   %esi
  103647:	8d 87 24 38 ff ff    	lea    -0xc7dc(%edi),%eax
  10364d:	50                   	push   %eax
  10364e:	ff 75 0c             	pushl  0xc(%ebp)
  103651:	ff 75 08             	pushl  0x8(%ebp)
  103654:	e8 48 fe ff ff       	call   1034a1 <printfmt>
  103659:	83 c4 10             	add    $0x10,%esp
            break;
  10365c:	e9 21 02 00 00       	jmp    103882 <.L22+0x28>

00103661 <.L26>:

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103661:	8b 45 14             	mov    0x14(%ebp),%eax
  103664:	8d 50 04             	lea    0x4(%eax),%edx
  103667:	89 55 14             	mov    %edx,0x14(%ebp)
  10366a:	8b 30                	mov    (%eax),%esi
  10366c:	85 f6                	test   %esi,%esi
  10366e:	75 06                	jne    103676 <.L26+0x15>
                p = "(null)";
  103670:	8d b7 27 38 ff ff    	lea    -0xc7d9(%edi),%esi
            }
            if (width > 0 && padc != '-') {
  103676:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  10367a:	7e 78                	jle    1036f4 <.L26+0x93>
  10367c:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  103680:	74 72                	je     1036f4 <.L26+0x93>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103682:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  103685:	83 ec 08             	sub    $0x8,%esp
  103688:	50                   	push   %eax
  103689:	56                   	push   %esi
  10368a:	89 fb                	mov    %edi,%ebx
  10368c:	e8 60 f7 ff ff       	call   102df1 <strnlen>
  103691:	83 c4 10             	add    $0x10,%esp
  103694:	8b 55 d8             	mov    -0x28(%ebp),%edx
  103697:	29 c2                	sub    %eax,%edx
  103699:	89 d0                	mov    %edx,%eax
  10369b:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10369e:	eb 17                	jmp    1036b7 <.L26+0x56>
                    putch(padc, putdat);
  1036a0:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  1036a4:	83 ec 08             	sub    $0x8,%esp
  1036a7:	ff 75 0c             	pushl  0xc(%ebp)
  1036aa:	50                   	push   %eax
  1036ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1036ae:	ff d0                	call   *%eax
  1036b0:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  1036b3:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  1036b7:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1036bb:	7f e3                	jg     1036a0 <.L26+0x3f>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1036bd:	eb 35                	jmp    1036f4 <.L26+0x93>
                if (altflag && (ch < ' ' || ch > '~')) {
  1036bf:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  1036c3:	74 1c                	je     1036e1 <.L26+0x80>
  1036c5:	83 fb 1f             	cmp    $0x1f,%ebx
  1036c8:	7e 05                	jle    1036cf <.L26+0x6e>
  1036ca:	83 fb 7e             	cmp    $0x7e,%ebx
  1036cd:	7e 12                	jle    1036e1 <.L26+0x80>
                    putch('?', putdat);
  1036cf:	83 ec 08             	sub    $0x8,%esp
  1036d2:	ff 75 0c             	pushl  0xc(%ebp)
  1036d5:	6a 3f                	push   $0x3f
  1036d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1036da:	ff d0                	call   *%eax
  1036dc:	83 c4 10             	add    $0x10,%esp
  1036df:	eb 0f                	jmp    1036f0 <.L26+0x8f>
                }
                else {
                    putch(ch, putdat);
  1036e1:	83 ec 08             	sub    $0x8,%esp
  1036e4:	ff 75 0c             	pushl  0xc(%ebp)
  1036e7:	53                   	push   %ebx
  1036e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1036eb:	ff d0                	call   *%eax
  1036ed:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1036f0:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  1036f4:	89 f0                	mov    %esi,%eax
  1036f6:	8d 70 01             	lea    0x1(%eax),%esi
  1036f9:	0f b6 00             	movzbl (%eax),%eax
  1036fc:	0f be d8             	movsbl %al,%ebx
  1036ff:	85 db                	test   %ebx,%ebx
  103701:	74 26                	je     103729 <.L26+0xc8>
  103703:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103707:	78 b6                	js     1036bf <.L26+0x5e>
  103709:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  10370d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103711:	79 ac                	jns    1036bf <.L26+0x5e>
                }
            }
            for (; width > 0; width --) {
  103713:	eb 14                	jmp    103729 <.L26+0xc8>
                putch(' ', putdat);
  103715:	83 ec 08             	sub    $0x8,%esp
  103718:	ff 75 0c             	pushl  0xc(%ebp)
  10371b:	6a 20                	push   $0x20
  10371d:	8b 45 08             	mov    0x8(%ebp),%eax
  103720:	ff d0                	call   *%eax
  103722:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  103725:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103729:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  10372d:	7f e6                	jg     103715 <.L26+0xb4>
            }
            break;
  10372f:	e9 4e 01 00 00       	jmp    103882 <.L22+0x28>

00103734 <.L31>:

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103734:	83 ec 08             	sub    $0x8,%esp
  103737:	ff 75 d0             	pushl  -0x30(%ebp)
  10373a:	8d 45 14             	lea    0x14(%ebp),%eax
  10373d:	50                   	push   %eax
  10373e:	e8 0d fd ff ff       	call   103450 <getint>
  103743:	83 c4 10             	add    $0x10,%esp
  103746:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103749:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            if ((long long)num < 0) {
  10374c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10374f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103752:	85 d2                	test   %edx,%edx
  103754:	79 23                	jns    103779 <.L31+0x45>
                putch('-', putdat);
  103756:	83 ec 08             	sub    $0x8,%esp
  103759:	ff 75 0c             	pushl  0xc(%ebp)
  10375c:	6a 2d                	push   $0x2d
  10375e:	8b 45 08             	mov    0x8(%ebp),%eax
  103761:	ff d0                	call   *%eax
  103763:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103766:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103769:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10376c:	f7 d8                	neg    %eax
  10376e:	83 d2 00             	adc    $0x0,%edx
  103771:	f7 da                	neg    %edx
  103773:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103776:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            }
            base = 10;
  103779:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  103780:	e9 9f 00 00 00       	jmp    103824 <.L23+0x1f>

00103785 <.L25>:

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103785:	83 ec 08             	sub    $0x8,%esp
  103788:	ff 75 d0             	pushl  -0x30(%ebp)
  10378b:	8d 45 14             	lea    0x14(%ebp),%eax
  10378e:	50                   	push   %eax
  10378f:	e8 63 fc ff ff       	call   1033f7 <getuint>
  103794:	83 c4 10             	add    $0x10,%esp
  103797:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10379a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 10;
  10379d:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  1037a4:	eb 7e                	jmp    103824 <.L23+0x1f>

001037a6 <.L28>:

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1037a6:	83 ec 08             	sub    $0x8,%esp
  1037a9:	ff 75 d0             	pushl  -0x30(%ebp)
  1037ac:	8d 45 14             	lea    0x14(%ebp),%eax
  1037af:	50                   	push   %eax
  1037b0:	e8 42 fc ff ff       	call   1033f7 <getuint>
  1037b5:	83 c4 10             	add    $0x10,%esp
  1037b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1037bb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 8;
  1037be:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%ebp)
            goto number;
  1037c5:	eb 5d                	jmp    103824 <.L23+0x1f>

001037c7 <.L27>:

        // pointer
        case 'p':
            putch('0', putdat);
  1037c7:	83 ec 08             	sub    $0x8,%esp
  1037ca:	ff 75 0c             	pushl  0xc(%ebp)
  1037cd:	6a 30                	push   $0x30
  1037cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1037d2:	ff d0                	call   *%eax
  1037d4:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1037d7:	83 ec 08             	sub    $0x8,%esp
  1037da:	ff 75 0c             	pushl  0xc(%ebp)
  1037dd:	6a 78                	push   $0x78
  1037df:	8b 45 08             	mov    0x8(%ebp),%eax
  1037e2:	ff d0                	call   *%eax
  1037e4:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1037e7:	8b 45 14             	mov    0x14(%ebp),%eax
  1037ea:	8d 50 04             	lea    0x4(%eax),%edx
  1037ed:	89 55 14             	mov    %edx,0x14(%ebp)
  1037f0:	8b 00                	mov    (%eax),%eax
  1037f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1037f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
            base = 16;
  1037fc:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
            goto number;
  103803:	eb 1f                	jmp    103824 <.L23+0x1f>

00103805 <.L23>:

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103805:	83 ec 08             	sub    $0x8,%esp
  103808:	ff 75 d0             	pushl  -0x30(%ebp)
  10380b:	8d 45 14             	lea    0x14(%ebp),%eax
  10380e:	50                   	push   %eax
  10380f:	e8 e3 fb ff ff       	call   1033f7 <getuint>
  103814:	83 c4 10             	add    $0x10,%esp
  103817:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10381a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 16;
  10381d:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103824:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  103828:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10382b:	83 ec 04             	sub    $0x4,%esp
  10382e:	52                   	push   %edx
  10382f:	ff 75 d8             	pushl  -0x28(%ebp)
  103832:	50                   	push   %eax
  103833:	ff 75 e4             	pushl  -0x1c(%ebp)
  103836:	ff 75 e0             	pushl  -0x20(%ebp)
  103839:	ff 75 0c             	pushl  0xc(%ebp)
  10383c:	ff 75 08             	pushl  0x8(%ebp)
  10383f:	e8 b5 fa ff ff       	call   1032f9 <printnum>
  103844:	83 c4 20             	add    $0x20,%esp
            break;
  103847:	eb 39                	jmp    103882 <.L22+0x28>

00103849 <.L38>:

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103849:	83 ec 08             	sub    $0x8,%esp
  10384c:	ff 75 0c             	pushl  0xc(%ebp)
  10384f:	53                   	push   %ebx
  103850:	8b 45 08             	mov    0x8(%ebp),%eax
  103853:	ff d0                	call   *%eax
  103855:	83 c4 10             	add    $0x10,%esp
            break;
  103858:	eb 28                	jmp    103882 <.L22+0x28>

0010385a <.L22>:

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10385a:	83 ec 08             	sub    $0x8,%esp
  10385d:	ff 75 0c             	pushl  0xc(%ebp)
  103860:	6a 25                	push   $0x25
  103862:	8b 45 08             	mov    0x8(%ebp),%eax
  103865:	ff d0                	call   *%eax
  103867:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  10386a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10386e:	eb 04                	jmp    103874 <.L22+0x1a>
  103870:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103874:	8b 45 10             	mov    0x10(%ebp),%eax
  103877:	83 e8 01             	sub    $0x1,%eax
  10387a:	0f b6 00             	movzbl (%eax),%eax
  10387d:	3c 25                	cmp    $0x25,%al
  10387f:	75 ef                	jne    103870 <.L22+0x16>
                /* do nothing */;
            break;
  103881:	90                   	nop
    while (1) {
  103882:	e9 5c fc ff ff       	jmp    1034e3 <vprintfmt+0x14>
                return;
  103887:	90                   	nop
        }
    }
}
  103888:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10388b:	5b                   	pop    %ebx
  10388c:	5e                   	pop    %esi
  10388d:	5f                   	pop    %edi
  10388e:	5d                   	pop    %ebp
  10388f:	c3                   	ret    

00103890 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103890:	55                   	push   %ebp
  103891:	89 e5                	mov    %esp,%ebp
  103893:	e8 e0 c9 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  103898:	05 b8 d0 00 00       	add    $0xd0b8,%eax
    b->cnt ++;
  10389d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1038a0:	8b 40 08             	mov    0x8(%eax),%eax
  1038a3:	8d 50 01             	lea    0x1(%eax),%edx
  1038a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1038a9:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1038ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1038af:	8b 10                	mov    (%eax),%edx
  1038b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1038b4:	8b 40 04             	mov    0x4(%eax),%eax
  1038b7:	39 c2                	cmp    %eax,%edx
  1038b9:	73 12                	jae    1038cd <sprintputch+0x3d>
        *b->buf ++ = ch;
  1038bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1038be:	8b 00                	mov    (%eax),%eax
  1038c0:	8d 48 01             	lea    0x1(%eax),%ecx
  1038c3:	8b 55 0c             	mov    0xc(%ebp),%edx
  1038c6:	89 0a                	mov    %ecx,(%edx)
  1038c8:	8b 55 08             	mov    0x8(%ebp),%edx
  1038cb:	88 10                	mov    %dl,(%eax)
    }
}
  1038cd:	90                   	nop
  1038ce:	5d                   	pop    %ebp
  1038cf:	c3                   	ret    

001038d0 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1038d0:	55                   	push   %ebp
  1038d1:	89 e5                	mov    %esp,%ebp
  1038d3:	83 ec 18             	sub    $0x18,%esp
  1038d6:	e8 9d c9 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  1038db:	05 75 d0 00 00       	add    $0xd075,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1038e0:	8d 45 14             	lea    0x14(%ebp),%eax
  1038e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1038e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1038e9:	50                   	push   %eax
  1038ea:	ff 75 10             	pushl  0x10(%ebp)
  1038ed:	ff 75 0c             	pushl  0xc(%ebp)
  1038f0:	ff 75 08             	pushl  0x8(%ebp)
  1038f3:	e8 0b 00 00 00       	call   103903 <vsnprintf>
  1038f8:	83 c4 10             	add    $0x10,%esp
  1038fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1038fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103901:	c9                   	leave  
  103902:	c3                   	ret    

00103903 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103903:	55                   	push   %ebp
  103904:	89 e5                	mov    %esp,%ebp
  103906:	83 ec 18             	sub    $0x18,%esp
  103909:	e8 6a c9 ff ff       	call   100278 <__x86.get_pc_thunk.ax>
  10390e:	05 42 d0 00 00       	add    $0xd042,%eax
    struct sprintbuf b = {str, str + size - 1, 0};
  103913:	8b 55 08             	mov    0x8(%ebp),%edx
  103916:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103919:	8b 55 0c             	mov    0xc(%ebp),%edx
  10391c:	8d 4a ff             	lea    -0x1(%edx),%ecx
  10391f:	8b 55 08             	mov    0x8(%ebp),%edx
  103922:	01 ca                	add    %ecx,%edx
  103924:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103927:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10392e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103932:	74 0a                	je     10393e <vsnprintf+0x3b>
  103934:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103937:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10393a:	39 d1                	cmp    %edx,%ecx
  10393c:	76 07                	jbe    103945 <vsnprintf+0x42>
        return -E_INVAL;
  10393e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103943:	eb 22                	jmp    103967 <vsnprintf+0x64>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103945:	ff 75 14             	pushl  0x14(%ebp)
  103948:	ff 75 10             	pushl  0x10(%ebp)
  10394b:	8d 55 ec             	lea    -0x14(%ebp),%edx
  10394e:	52                   	push   %edx
  10394f:	8d 80 40 2f ff ff    	lea    -0xd0c0(%eax),%eax
  103955:	50                   	push   %eax
  103956:	e8 74 fb ff ff       	call   1034cf <vprintfmt>
  10395b:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10395e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103961:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103964:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103967:	c9                   	leave  
  103968:	c3                   	ret    

00103969 <__x86.get_pc_thunk.di>:
  103969:	8b 3c 24             	mov    (%esp),%edi
  10396c:	c3                   	ret    
