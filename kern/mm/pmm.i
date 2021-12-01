# 1 "pmm.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "pmm.c"
# 1 "/home/zzzzz/ucore/labcodes/lab1/libs/defs.h" 1
# 13 "/home/zzzzz/ucore/labcodes/lab1/libs/defs.h"
typedef int bool;


typedef char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
typedef unsigned long long uint64_t;






typedef int32_t intptr_t;
typedef uint32_t uintptr_t;


typedef uintptr_t size_t;


typedef size_t ppn_t;
# 2 "pmm.c" 2
# 1 "/home/zzzzz/ucore/labcodes/lab1/libs/x86.h" 1
# 28 "/home/zzzzz/ucore/labcodes/lab1/libs/x86.h"
static inline uint8_t inb(uint16_t port) __attribute__((always_inline));
static inline void insl(uint32_t port, void *addr, int cnt) __attribute__((always_inline));
static inline void outb(uint16_t port, uint8_t data) __attribute__((always_inline));
static inline void outw(uint16_t port, uint16_t data) __attribute__((always_inline));
static inline uint32_t read_ebp(void) __attribute__((always_inline));


struct pseudodesc
{
    uint16_t pd_lim;
    uint32_t pd_base;
} __attribute__((packed));

static inline void lidt(struct pseudodesc *pd) __attribute__((always_inline));
static inline void sti(void) __attribute__((always_inline));
static inline void cli(void) __attribute__((always_inline));
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port)
{
    uint8_t data;
    asm volatile("inb %1, %0"
                 : "=a"(data)
                 : "d"(port));
    return data;
}

static inline void
insl(uint32_t port, void *addr, int cnt)
{
    asm volatile(
        "cld;"
        "repne; insl;"
        : "=D"(addr), "=c"(cnt)
        : "d"(port), "0"(addr), "1"(cnt)
        : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data)
{
    asm volatile("outb %0, %1" ::"a"(data), "d"(port));
}

static inline void
outw(uint16_t port, uint16_t data)
{
    asm volatile("outw %0, %1" ::"a"(data), "d"(port));
}

static inline uint32_t
read_ebp(void)
{
    uint32_t ebp;
    asm volatile("movl %%ebp, %0"
                 : "=r"(ebp));
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd)
{
    asm volatile("lidt (%0)" ::"r"(pd));
}

static inline void
sti(void)
{
    asm volatile("sti");
}

static inline void
cli(void)
{
    asm volatile("cli");
}

static inline void
ltr(uint16_t sel)
{
    asm volatile("ltr %0" ::"r"(sel));
}

static inline int __strcmp(const char *s1, const char *s2) __attribute__((always_inline));
static inline char *__strcpy(char *dst, const char *src) __attribute__((always_inline));
static inline void *__memset(void *s, char c, size_t n) __attribute__((always_inline));
static inline void *__memmove(void *dst, const void *src, size_t n) __attribute__((always_inline));
static inline void *__memcpy(void *dst, const void *src, size_t n) __attribute__((always_inline));



static inline int
__strcmp(const char *s1, const char *s2)
{
    int d0, d1, ret;
    asm volatile(
        "1: lodsb;"
        "scasb;"
        "jne 2f;"
        "testb %%al, %%al;"
        "jne 1b;"
        "xorl %%eax, %%eax;"
        "jmp 3f;"
        "2: sbbl %%eax, %%eax;"
        "orb $1, %%al;"
        "3:"
        : "=a"(ret), "=&S"(d0), "=&D"(d1)
        : "1"(s1), "2"(s2)
        : "memory");
    return ret;
}





static inline char *
__strcpy(char *dst, const char *src)
{
    int d0, d1, d2;
    asm volatile(
        "1: lodsb;"
        "stosb;"
        "testb %%al, %%al;"
        "jne 1b;"
        : "=&S"(d0), "=&D"(d1), "=&a"(d2)
        : "0"(src), "1"(dst)
        : "memory");
    return dst;
}




static inline void *
__memset(void *s, char c, size_t n)
{
    int d0, d1;
    asm volatile(
        "rep; stosb;"
        : "=&c"(d0), "=&D"(d1)
        : "0"(n), "a"(c), "1"(s)
        : "memory");
    return s;
}




static inline void *
__memmove(void *dst, const void *src, size_t n)
{
    if (dst < src)
    {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile(
        "std;"
        "rep; movsb;"
        "cld;"
        : "=&c"(d0), "=&S"(d1), "=&D"(d2)
        : "0"(n), "1"(n - 1 + src), "2"(n - 1 + dst)
        : "memory");
    return dst;
}




static inline void *
__memcpy(void *dst, const void *src, size_t n)
{
    int d0, d1, d2;
    asm volatile(
        "rep; movsl;"
        "movl %4, %%ecx;"
        "andl $3, %%ecx;"
        "jz 1f;"
        "rep; movsb;"
        "1:"
        : "=&c"(d0), "=&D"(d1), "=&S"(d2)
        : "0"(n / 4), "g"(n), "1"(dst), "2"(src)
        : "memory");
    return dst;
}
# 3 "pmm.c" 2
# 1 "./mmu.h" 1
# 53 "./mmu.h"
struct gatedesc {
    unsigned gd_off_15_0 : 16;
    unsigned gd_ss : 16;
    unsigned gd_args : 5;
    unsigned gd_rsv1 : 3;
    unsigned gd_type : 4;
    unsigned gd_s : 1;
    unsigned gd_dpl : 2;
    unsigned gd_p : 1;
    unsigned gd_off_31_16 : 16;
};
# 101 "./mmu.h"
struct segdesc {
    unsigned sd_lim_15_0 : 16;
    unsigned sd_base_15_0 : 16;
    unsigned sd_base_23_16 : 8;
    unsigned sd_type : 4;
    unsigned sd_s : 1;
    unsigned sd_dpl : 2;
    unsigned sd_p : 1;
    unsigned sd_lim_19_16 : 4;
    unsigned sd_avl : 1;
    unsigned sd_rsv1 : 1;
    unsigned sd_db : 1;
    unsigned sd_g : 1;
    unsigned sd_base_31_24 : 8;
};
# 137 "./mmu.h"
struct taskstate {
    uint32_t ts_link;
    uintptr_t ts_esp0;
    uint16_t ts_ss0;
    uint16_t ts_padding1;
    uintptr_t ts_esp1;
    uint16_t ts_ss1;
    uint16_t ts_padding2;
    uintptr_t ts_esp2;
    uint16_t ts_ss2;
    uint16_t ts_padding3;
    uintptr_t ts_cr3;
    uintptr_t ts_eip;
    uint32_t ts_eflags;
    uint32_t ts_eax;
    uint32_t ts_ecx;
    uint32_t ts_edx;
    uint32_t ts_ebx;
    uintptr_t ts_esp;
    uintptr_t ts_ebp;
    uint32_t ts_esi;
    uint32_t ts_edi;
    uint16_t ts_es;
    uint16_t ts_padding4;
    uint16_t ts_cs;
    uint16_t ts_padding5;
    uint16_t ts_ss;
    uint16_t ts_padding6;
    uint16_t ts_ds;
    uint16_t ts_padding7;
    uint16_t ts_fs;
    uint16_t ts_padding8;
    uint16_t ts_gs;
    uint16_t ts_padding9;
    uint16_t ts_ldt;
    uint16_t ts_padding10;
    uint16_t ts_t;
    uint16_t ts_iomb;
};
# 4 "pmm.c" 2
# 1 "./memlayout.h" 1
# 5 "pmm.c" 2
# 1 "./pmm.h" 1



void pmm_init(void);
# 6 "pmm.c" 2
# 27 "pmm.c"
static struct taskstate ts = {0};
# 48 "pmm.c"
static struct segdesc gdt[] = {
    (struct segdesc){0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    [1] = (struct segdesc){ ((0xFFFFFFFF) >> 12) & 0xffff, (0x0) & 0xffff, ((0x0) >> 16) & 0xff, 0x8 | 0x2, 1, (0), 1, (unsigned)(0xFFFFFFFF) >> 28, 0, 0, 1, 1, (unsigned) (0x0) >> 24 },
    [2] = (struct segdesc){ ((0xFFFFFFFF) >> 12) & 0xffff, (0x0) & 0xffff, ((0x0) >> 16) & 0xff, 0x2, 1, (0), 1, (unsigned)(0xFFFFFFFF) >> 28, 0, 0, 1, 1, (unsigned) (0x0) >> 24 },
    [3] = (struct segdesc){ ((0xFFFFFFFF) >> 12) & 0xffff, (0x0) & 0xffff, ((0x0) >> 16) & 0xff, 0x8 | 0x2, 1, (3), 1, (unsigned)(0xFFFFFFFF) >> 28, 0, 0, 1, 1, (unsigned) (0x0) >> 24 },
    [4] = (struct segdesc){ ((0xFFFFFFFF) >> 12) & 0xffff, (0x0) & 0xffff, ((0x0) >> 16) & 0xff, 0x2, 1, (3), 1, (unsigned)(0xFFFFFFFF) >> 28, 0, 0, 1, 1, (unsigned) (0x0) >> 24 },
    [5] = (struct segdesc){0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
};

static struct pseudodesc gdt_pd = {
    sizeof(gdt) - 1, (uint32_t)gdt
};
# 69 "pmm.c"
static inline void
lgdt(struct pseudodesc *pd) {
    asm volatile ("lgdt (%0)" :: "r" (pd));
    asm volatile ("movw %%ax, %%gs" :: "a" (((((4) << 3)) | (3))));
    asm volatile ("movw %%ax, %%fs" :: "a" (((((4) << 3)) | (3))));
    asm volatile ("movw %%ax, %%es" :: "a" (((((2) << 3)) | (0))));
    asm volatile ("movw %%ax, %%ds" :: "a" (((((2) << 3)) | (0))));
    asm volatile ("movw %%ax, %%ss" :: "a" (((((2) << 3)) | (0))));


    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (((((1) << 3)) | (0))));
}


uint8_t stack0[1024];


static void
gdt_init(void) {



    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
    ts.ts_ss0 = ((((2) << 3)) | (0));


    gdt[5] = (struct segdesc){ (sizeof(ts)) & 0xffff, ((uint32_t)&ts) & 0xffff, (((uint32_t)&ts) >> 16) & 0xff, 0x9, 1, (0), 1, (unsigned) (sizeof(ts)) >> 16, 0, 0, 1, 0, (unsigned) ((uint32_t)&ts) >> 24 };
    gdt[5].sd_s = 0;


    lgdt(&gdt_pd);


    ltr(((5) << 3));
}


void
pmm_init(void) {
    gdt_init();
}
