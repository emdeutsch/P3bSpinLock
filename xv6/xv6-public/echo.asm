
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	ba a2 06 00 00       	mov    $0x6a2,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 a4 06 00 00       	push   $0x6a4
  2e:	6a 01                	push   $0x1
  30:	e8 be 03 00 00       	call   3f3 <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba a0 06 00 00       	mov    $0x6a0,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 4d 02 00 00       	call   29e <exit>

00000051 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	56                   	push   %esi
  55:	53                   	push   %ebx
  56:	8b 75 08             	mov    0x8(%ebp),%esi
  59:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  5c:	89 f0                	mov    %esi,%eax
  5e:	89 d1                	mov    %edx,%ecx
  60:	83 c2 01             	add    $0x1,%edx
  63:	89 c3                	mov    %eax,%ebx
  65:	83 c0 01             	add    $0x1,%eax
  68:	0f b6 09             	movzbl (%ecx),%ecx
  6b:	88 0b                	mov    %cl,(%ebx)
  6d:	84 c9                	test   %cl,%cl
  6f:	75 ed                	jne    5e <strcpy+0xd>
    ;
  return os;
}
  71:	89 f0                	mov    %esi,%eax
  73:	5b                   	pop    %ebx
  74:	5e                   	pop    %esi
  75:	5d                   	pop    %ebp
  76:	c3                   	ret    

00000077 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  77:	55                   	push   %ebp
  78:	89 e5                	mov    %esp,%ebp
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  80:	eb 06                	jmp    88 <strcmp+0x11>
    p++, q++;
  82:	83 c1 01             	add    $0x1,%ecx
  85:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  88:	0f b6 01             	movzbl (%ecx),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 04                	je     93 <strcmp+0x1c>
  8f:	3a 02                	cmp    (%edx),%al
  91:	74 ef                	je     82 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  93:	0f b6 c0             	movzbl %al,%eax
  96:	0f b6 12             	movzbl (%edx),%edx
  99:	29 d0                	sub    %edx,%eax
}
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    

0000009d <strlen>:

uint
strlen(const char *s)
{
  9d:	55                   	push   %ebp
  9e:	89 e5                	mov    %esp,%ebp
  a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  a3:	b8 00 00 00 00       	mov    $0x0,%eax
  a8:	eb 03                	jmp    ad <strlen+0x10>
  aa:	83 c0 01             	add    $0x1,%eax
  ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  b1:	75 f7                	jne    aa <strlen+0xd>
    ;
  return n;
}
  b3:	5d                   	pop    %ebp
  b4:	c3                   	ret    

000000b5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  b5:	55                   	push   %ebp
  b6:	89 e5                	mov    %esp,%ebp
  b8:	57                   	push   %edi
  b9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  bc:	89 d7                	mov    %edx,%edi
  be:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  c4:	fc                   	cld    
  c5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  c7:	89 d0                	mov    %edx,%eax
  c9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strchr>:

char*
strchr(const char *s, char c)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	8b 45 08             	mov    0x8(%ebp),%eax
  d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  d8:	eb 03                	jmp    dd <strchr+0xf>
  da:	83 c0 01             	add    $0x1,%eax
  dd:	0f b6 10             	movzbl (%eax),%edx
  e0:	84 d2                	test   %dl,%dl
  e2:	74 06                	je     ea <strchr+0x1c>
    if(*s == c)
  e4:	38 ca                	cmp    %cl,%dl
  e6:	75 f2                	jne    da <strchr+0xc>
  e8:	eb 05                	jmp    ef <strchr+0x21>
      return (char*)s;
  return 0;
  ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    

000000f1 <gets>:

char*
gets(char *buf, int max)
{
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	57                   	push   %edi
  f5:	56                   	push   %esi
  f6:	53                   	push   %ebx
  f7:	83 ec 1c             	sub    $0x1c,%esp
  fa:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 102:	89 de                	mov    %ebx,%esi
 104:	83 c3 01             	add    $0x1,%ebx
 107:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 10a:	7d 2e                	jge    13a <gets+0x49>
    cc = read(0, &c, 1);
 10c:	83 ec 04             	sub    $0x4,%esp
 10f:	6a 01                	push   $0x1
 111:	8d 45 e7             	lea    -0x19(%ebp),%eax
 114:	50                   	push   %eax
 115:	6a 00                	push   $0x0
 117:	e8 9a 01 00 00       	call   2b6 <read>
    if(cc < 1)
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	7e 17                	jle    13a <gets+0x49>
      break;
    buf[i++] = c;
 123:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 127:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 12a:	3c 0a                	cmp    $0xa,%al
 12c:	0f 94 c2             	sete   %dl
 12f:	3c 0d                	cmp    $0xd,%al
 131:	0f 94 c0             	sete   %al
 134:	08 c2                	or     %al,%dl
 136:	74 ca                	je     102 <gets+0x11>
    buf[i++] = c;
 138:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 13a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 13e:	89 f8                	mov    %edi,%eax
 140:	8d 65 f4             	lea    -0xc(%ebp),%esp
 143:	5b                   	pop    %ebx
 144:	5e                   	pop    %esi
 145:	5f                   	pop    %edi
 146:	5d                   	pop    %ebp
 147:	c3                   	ret    

00000148 <stat>:

int
stat(const char *n, struct stat *st)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 14d:	83 ec 08             	sub    $0x8,%esp
 150:	6a 00                	push   $0x0
 152:	ff 75 08             	push   0x8(%ebp)
 155:	e8 84 01 00 00       	call   2de <open>
  if(fd < 0)
 15a:	83 c4 10             	add    $0x10,%esp
 15d:	85 c0                	test   %eax,%eax
 15f:	78 24                	js     185 <stat+0x3d>
 161:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 163:	83 ec 08             	sub    $0x8,%esp
 166:	ff 75 0c             	push   0xc(%ebp)
 169:	50                   	push   %eax
 16a:	e8 87 01 00 00       	call   2f6 <fstat>
 16f:	89 c6                	mov    %eax,%esi
  close(fd);
 171:	89 1c 24             	mov    %ebx,(%esp)
 174:	e8 4d 01 00 00       	call   2c6 <close>
  return r;
 179:	83 c4 10             	add    $0x10,%esp
}
 17c:	89 f0                	mov    %esi,%eax
 17e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 181:	5b                   	pop    %ebx
 182:	5e                   	pop    %esi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
    return -1;
 185:	be ff ff ff ff       	mov    $0xffffffff,%esi
 18a:	eb f0                	jmp    17c <stat+0x34>

0000018c <atoi>:

int
atoi(const char *s)
{
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	53                   	push   %ebx
 190:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 193:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 198:	eb 10                	jmp    1aa <atoi+0x1e>
    n = n*10 + *s++ - '0';
 19a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 19d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f be c0             	movsbl %al,%eax
 1a6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1aa:	0f b6 01             	movzbl (%ecx),%eax
 1ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1b0:	80 fb 09             	cmp    $0x9,%bl
 1b3:	76 e5                	jbe    19a <atoi+0xe>
  return n;
}
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ba:	c9                   	leave  
 1bb:	c3                   	ret    

000001bc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	56                   	push   %esi
 1c0:	53                   	push   %ebx
 1c1:	8b 75 08             	mov    0x8(%ebp),%esi
 1c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1c7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ca:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1cc:	eb 0d                	jmp    1db <memmove+0x1f>
    *dst++ = *src++;
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	88 02                	mov    %al,(%edx)
 1d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 1d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1d9:	89 d8                	mov    %ebx,%eax
 1db:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1de:	85 c0                	test   %eax,%eax
 1e0:	7f ec                	jg     1ce <memmove+0x12>
  return vdst;
}
 1e2:	89 f0                	mov    %esi,%eax
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    

000001e8 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 1ee:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 1f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f3:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    

000001f9 <lock_init>:
void 
lock_init(lock_t *lock){
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    

00000207 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 207:	55                   	push   %ebp
 208:	89 e5                	mov    %esp,%ebp
 20a:	53                   	push   %ebx
 20b:	83 ec 04             	sub    $0x4,%esp
 20e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 211:	83 ec 08             	sub    $0x8,%esp
 214:	6a 01                	push   $0x1
 216:	53                   	push   %ebx
 217:	e8 cc ff ff ff       	call   1e8 <TestAndSet>
 21c:	83 c4 10             	add    $0x10,%esp
 21f:	83 f8 01             	cmp    $0x1,%eax
 222:	74 ed                	je     211 <lock_acquire+0xa>
    ;
}
 224:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 227:	c9                   	leave  
 228:	c3                   	ret    

00000229 <lock_release>:
void 
lock_release(lock_t *lock){
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 22c:	8b 45 08             	mov    0x8(%ebp),%eax
 22f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    

00000237 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 23d:	68 04 20 00 00       	push   $0x2004
 242:	e8 d2 03 00 00       	call   619 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 247:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 24a:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 24c:	eb 03                	jmp    251 <thread_create+0x1a>
      stack += 1;
 24e:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 251:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 257:	75 f5                	jne    24e <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 259:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 25b:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 25e:	52                   	push   %edx
 25f:	ff 75 10             	push   0x10(%ebp)
 262:	ff 75 0c             	push   0xc(%ebp)
 265:	ff 75 08             	push   0x8(%ebp)
 268:	e8 d1 00 00 00       	call   33e <clone>
 
    return pid;
}
 26d:	c9                   	leave  
 26e:	c3                   	ret    

0000026f <thread_join>:
int 
thread_join(){
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	53                   	push   %ebx
 273:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 276:	8d 45 f4             	lea    -0xc(%ebp),%eax
 279:	50                   	push   %eax
 27a:	e8 c7 00 00 00       	call   346 <join>
 27f:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 281:	83 c4 04             	add    $0x4,%esp
 284:	8b 45 f4             	mov    -0xc(%ebp),%eax
 287:	ff 70 fc             	push   -0x4(%eax)
 28a:	e8 ca 02 00 00       	call   559 <free>
  return waitedForPID;
 28f:	89 d8                	mov    %ebx,%eax
 291:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 294:	c9                   	leave  
 295:	c3                   	ret    

00000296 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 296:	b8 01 00 00 00       	mov    $0x1,%eax
 29b:	cd 40                	int    $0x40
 29d:	c3                   	ret    

0000029e <exit>:
SYSCALL(exit)
 29e:	b8 02 00 00 00       	mov    $0x2,%eax
 2a3:	cd 40                	int    $0x40
 2a5:	c3                   	ret    

000002a6 <wait>:
SYSCALL(wait)
 2a6:	b8 03 00 00 00       	mov    $0x3,%eax
 2ab:	cd 40                	int    $0x40
 2ad:	c3                   	ret    

000002ae <pipe>:
SYSCALL(pipe)
 2ae:	b8 04 00 00 00       	mov    $0x4,%eax
 2b3:	cd 40                	int    $0x40
 2b5:	c3                   	ret    

000002b6 <read>:
SYSCALL(read)
 2b6:	b8 05 00 00 00       	mov    $0x5,%eax
 2bb:	cd 40                	int    $0x40
 2bd:	c3                   	ret    

000002be <write>:
SYSCALL(write)
 2be:	b8 10 00 00 00       	mov    $0x10,%eax
 2c3:	cd 40                	int    $0x40
 2c5:	c3                   	ret    

000002c6 <close>:
SYSCALL(close)
 2c6:	b8 15 00 00 00       	mov    $0x15,%eax
 2cb:	cd 40                	int    $0x40
 2cd:	c3                   	ret    

000002ce <kill>:
SYSCALL(kill)
 2ce:	b8 06 00 00 00       	mov    $0x6,%eax
 2d3:	cd 40                	int    $0x40
 2d5:	c3                   	ret    

000002d6 <exec>:
SYSCALL(exec)
 2d6:	b8 07 00 00 00       	mov    $0x7,%eax
 2db:	cd 40                	int    $0x40
 2dd:	c3                   	ret    

000002de <open>:
SYSCALL(open)
 2de:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e3:	cd 40                	int    $0x40
 2e5:	c3                   	ret    

000002e6 <mknod>:
SYSCALL(mknod)
 2e6:	b8 11 00 00 00       	mov    $0x11,%eax
 2eb:	cd 40                	int    $0x40
 2ed:	c3                   	ret    

000002ee <unlink>:
SYSCALL(unlink)
 2ee:	b8 12 00 00 00       	mov    $0x12,%eax
 2f3:	cd 40                	int    $0x40
 2f5:	c3                   	ret    

000002f6 <fstat>:
SYSCALL(fstat)
 2f6:	b8 08 00 00 00       	mov    $0x8,%eax
 2fb:	cd 40                	int    $0x40
 2fd:	c3                   	ret    

000002fe <link>:
SYSCALL(link)
 2fe:	b8 13 00 00 00       	mov    $0x13,%eax
 303:	cd 40                	int    $0x40
 305:	c3                   	ret    

00000306 <mkdir>:
SYSCALL(mkdir)
 306:	b8 14 00 00 00       	mov    $0x14,%eax
 30b:	cd 40                	int    $0x40
 30d:	c3                   	ret    

0000030e <chdir>:
SYSCALL(chdir)
 30e:	b8 09 00 00 00       	mov    $0x9,%eax
 313:	cd 40                	int    $0x40
 315:	c3                   	ret    

00000316 <dup>:
SYSCALL(dup)
 316:	b8 0a 00 00 00       	mov    $0xa,%eax
 31b:	cd 40                	int    $0x40
 31d:	c3                   	ret    

0000031e <getpid>:
SYSCALL(getpid)
 31e:	b8 0b 00 00 00       	mov    $0xb,%eax
 323:	cd 40                	int    $0x40
 325:	c3                   	ret    

00000326 <sbrk>:
SYSCALL(sbrk)
 326:	b8 0c 00 00 00       	mov    $0xc,%eax
 32b:	cd 40                	int    $0x40
 32d:	c3                   	ret    

0000032e <sleep>:
SYSCALL(sleep)
 32e:	b8 0d 00 00 00       	mov    $0xd,%eax
 333:	cd 40                	int    $0x40
 335:	c3                   	ret    

00000336 <uptime>:
SYSCALL(uptime)
 336:	b8 0e 00 00 00       	mov    $0xe,%eax
 33b:	cd 40                	int    $0x40
 33d:	c3                   	ret    

0000033e <clone>:
SYSCALL(clone)
 33e:	b8 16 00 00 00       	mov    $0x16,%eax
 343:	cd 40                	int    $0x40
 345:	c3                   	ret    

00000346 <join>:
SYSCALL(join)
 346:	b8 17 00 00 00       	mov    $0x17,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret    

0000034e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
 351:	83 ec 1c             	sub    $0x1c,%esp
 354:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 357:	6a 01                	push   $0x1
 359:	8d 55 f4             	lea    -0xc(%ebp),%edx
 35c:	52                   	push   %edx
 35d:	50                   	push   %eax
 35e:	e8 5b ff ff ff       	call   2be <write>
}
 363:	83 c4 10             	add    $0x10,%esp
 366:	c9                   	leave  
 367:	c3                   	ret    

00000368 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 368:	55                   	push   %ebp
 369:	89 e5                	mov    %esp,%ebp
 36b:	57                   	push   %edi
 36c:	56                   	push   %esi
 36d:	53                   	push   %ebx
 36e:	83 ec 2c             	sub    $0x2c,%esp
 371:	89 45 d0             	mov    %eax,-0x30(%ebp)
 374:	89 d0                	mov    %edx,%eax
 376:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 378:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 37c:	0f 95 c1             	setne  %cl
 37f:	c1 ea 1f             	shr    $0x1f,%edx
 382:	84 d1                	test   %dl,%cl
 384:	74 44                	je     3ca <printint+0x62>
    neg = 1;
    x = -xx;
 386:	f7 d8                	neg    %eax
 388:	89 c1                	mov    %eax,%ecx
    neg = 1;
 38a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 391:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 396:	89 c8                	mov    %ecx,%eax
 398:	ba 00 00 00 00       	mov    $0x0,%edx
 39d:	f7 f6                	div    %esi
 39f:	89 df                	mov    %ebx,%edi
 3a1:	83 c3 01             	add    $0x1,%ebx
 3a4:	0f b6 92 08 07 00 00 	movzbl 0x708(%edx),%edx
 3ab:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3af:	89 ca                	mov    %ecx,%edx
 3b1:	89 c1                	mov    %eax,%ecx
 3b3:	39 d6                	cmp    %edx,%esi
 3b5:	76 df                	jbe    396 <printint+0x2e>
  if(neg)
 3b7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3bb:	74 31                	je     3ee <printint+0x86>
    buf[i++] = '-';
 3bd:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3c2:	8d 5f 02             	lea    0x2(%edi),%ebx
 3c5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3c8:	eb 17                	jmp    3e1 <printint+0x79>
    x = xx;
 3ca:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3cc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3d3:	eb bc                	jmp    391 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3d5:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3da:	89 f0                	mov    %esi,%eax
 3dc:	e8 6d ff ff ff       	call   34e <putc>
  while(--i >= 0)
 3e1:	83 eb 01             	sub    $0x1,%ebx
 3e4:	79 ef                	jns    3d5 <printint+0x6d>
}
 3e6:	83 c4 2c             	add    $0x2c,%esp
 3e9:	5b                   	pop    %ebx
 3ea:	5e                   	pop    %esi
 3eb:	5f                   	pop    %edi
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    
 3ee:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3f1:	eb ee                	jmp    3e1 <printint+0x79>

000003f3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	57                   	push   %edi
 3f7:	56                   	push   %esi
 3f8:	53                   	push   %ebx
 3f9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3fc:	8d 45 10             	lea    0x10(%ebp),%eax
 3ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 402:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 407:	bb 00 00 00 00       	mov    $0x0,%ebx
 40c:	eb 14                	jmp    422 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 40e:	89 fa                	mov    %edi,%edx
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	e8 36 ff ff ff       	call   34e <putc>
 418:	eb 05                	jmp    41f <printf+0x2c>
      }
    } else if(state == '%'){
 41a:	83 fe 25             	cmp    $0x25,%esi
 41d:	74 25                	je     444 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 41f:	83 c3 01             	add    $0x1,%ebx
 422:	8b 45 0c             	mov    0xc(%ebp),%eax
 425:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 429:	84 c0                	test   %al,%al
 42b:	0f 84 20 01 00 00    	je     551 <printf+0x15e>
    c = fmt[i] & 0xff;
 431:	0f be f8             	movsbl %al,%edi
 434:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 437:	85 f6                	test   %esi,%esi
 439:	75 df                	jne    41a <printf+0x27>
      if(c == '%'){
 43b:	83 f8 25             	cmp    $0x25,%eax
 43e:	75 ce                	jne    40e <printf+0x1b>
        state = '%';
 440:	89 c6                	mov    %eax,%esi
 442:	eb db                	jmp    41f <printf+0x2c>
      if(c == 'd'){
 444:	83 f8 25             	cmp    $0x25,%eax
 447:	0f 84 cf 00 00 00    	je     51c <printf+0x129>
 44d:	0f 8c dd 00 00 00    	jl     530 <printf+0x13d>
 453:	83 f8 78             	cmp    $0x78,%eax
 456:	0f 8f d4 00 00 00    	jg     530 <printf+0x13d>
 45c:	83 f8 63             	cmp    $0x63,%eax
 45f:	0f 8c cb 00 00 00    	jl     530 <printf+0x13d>
 465:	83 e8 63             	sub    $0x63,%eax
 468:	83 f8 15             	cmp    $0x15,%eax
 46b:	0f 87 bf 00 00 00    	ja     530 <printf+0x13d>
 471:	ff 24 85 b0 06 00 00 	jmp    *0x6b0(,%eax,4)
        printint(fd, *ap, 10, 1);
 478:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 47b:	8b 17                	mov    (%edi),%edx
 47d:	83 ec 0c             	sub    $0xc,%esp
 480:	6a 01                	push   $0x1
 482:	b9 0a 00 00 00       	mov    $0xa,%ecx
 487:	8b 45 08             	mov    0x8(%ebp),%eax
 48a:	e8 d9 fe ff ff       	call   368 <printint>
        ap++;
 48f:	83 c7 04             	add    $0x4,%edi
 492:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 495:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 498:	be 00 00 00 00       	mov    $0x0,%esi
 49d:	eb 80                	jmp    41f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 49f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4a2:	8b 17                	mov    (%edi),%edx
 4a4:	83 ec 0c             	sub    $0xc,%esp
 4a7:	6a 00                	push   $0x0
 4a9:	b9 10 00 00 00       	mov    $0x10,%ecx
 4ae:	8b 45 08             	mov    0x8(%ebp),%eax
 4b1:	e8 b2 fe ff ff       	call   368 <printint>
        ap++;
 4b6:	83 c7 04             	add    $0x4,%edi
 4b9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4bf:	be 00 00 00 00       	mov    $0x0,%esi
 4c4:	e9 56 ff ff ff       	jmp    41f <printf+0x2c>
        s = (char*)*ap;
 4c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4cc:	8b 30                	mov    (%eax),%esi
        ap++;
 4ce:	83 c0 04             	add    $0x4,%eax
 4d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4d4:	85 f6                	test   %esi,%esi
 4d6:	75 15                	jne    4ed <printf+0xfa>
          s = "(null)";
 4d8:	be a9 06 00 00       	mov    $0x6a9,%esi
 4dd:	eb 0e                	jmp    4ed <printf+0xfa>
          putc(fd, *s);
 4df:	0f be d2             	movsbl %dl,%edx
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	e8 64 fe ff ff       	call   34e <putc>
          s++;
 4ea:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4ed:	0f b6 16             	movzbl (%esi),%edx
 4f0:	84 d2                	test   %dl,%dl
 4f2:	75 eb                	jne    4df <printf+0xec>
      state = 0;
 4f4:	be 00 00 00 00       	mov    $0x0,%esi
 4f9:	e9 21 ff ff ff       	jmp    41f <printf+0x2c>
        putc(fd, *ap);
 4fe:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 501:	0f be 17             	movsbl (%edi),%edx
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	e8 42 fe ff ff       	call   34e <putc>
        ap++;
 50c:	83 c7 04             	add    $0x4,%edi
 50f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 512:	be 00 00 00 00       	mov    $0x0,%esi
 517:	e9 03 ff ff ff       	jmp    41f <printf+0x2c>
        putc(fd, c);
 51c:	89 fa                	mov    %edi,%edx
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	e8 28 fe ff ff       	call   34e <putc>
      state = 0;
 526:	be 00 00 00 00       	mov    $0x0,%esi
 52b:	e9 ef fe ff ff       	jmp    41f <printf+0x2c>
        putc(fd, '%');
 530:	ba 25 00 00 00       	mov    $0x25,%edx
 535:	8b 45 08             	mov    0x8(%ebp),%eax
 538:	e8 11 fe ff ff       	call   34e <putc>
        putc(fd, c);
 53d:	89 fa                	mov    %edi,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	e8 07 fe ff ff       	call   34e <putc>
      state = 0;
 547:	be 00 00 00 00       	mov    $0x0,%esi
 54c:	e9 ce fe ff ff       	jmp    41f <printf+0x2c>
    }
  }
}
 551:	8d 65 f4             	lea    -0xc(%ebp),%esp
 554:	5b                   	pop    %ebx
 555:	5e                   	pop    %esi
 556:	5f                   	pop    %edi
 557:	5d                   	pop    %ebp
 558:	c3                   	ret    

00000559 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 559:	55                   	push   %ebp
 55a:	89 e5                	mov    %esp,%ebp
 55c:	57                   	push   %edi
 55d:	56                   	push   %esi
 55e:	53                   	push   %ebx
 55f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 562:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 565:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 56a:	eb 02                	jmp    56e <free+0x15>
 56c:	89 d0                	mov    %edx,%eax
 56e:	39 c8                	cmp    %ecx,%eax
 570:	73 04                	jae    576 <free+0x1d>
 572:	39 08                	cmp    %ecx,(%eax)
 574:	77 12                	ja     588 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 576:	8b 10                	mov    (%eax),%edx
 578:	39 c2                	cmp    %eax,%edx
 57a:	77 f0                	ja     56c <free+0x13>
 57c:	39 c8                	cmp    %ecx,%eax
 57e:	72 08                	jb     588 <free+0x2f>
 580:	39 ca                	cmp    %ecx,%edx
 582:	77 04                	ja     588 <free+0x2f>
 584:	89 d0                	mov    %edx,%eax
 586:	eb e6                	jmp    56e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 588:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 58e:	8b 10                	mov    (%eax),%edx
 590:	39 d7                	cmp    %edx,%edi
 592:	74 19                	je     5ad <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 594:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 597:	8b 50 04             	mov    0x4(%eax),%edx
 59a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 59d:	39 ce                	cmp    %ecx,%esi
 59f:	74 1b                	je     5bc <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5a1:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5a3:	a3 7c 0a 00 00       	mov    %eax,0xa7c
}
 5a8:	5b                   	pop    %ebx
 5a9:	5e                   	pop    %esi
 5aa:	5f                   	pop    %edi
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5ad:	03 72 04             	add    0x4(%edx),%esi
 5b0:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5b3:	8b 10                	mov    (%eax),%edx
 5b5:	8b 12                	mov    (%edx),%edx
 5b7:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5ba:	eb db                	jmp    597 <free+0x3e>
    p->s.size += bp->s.size;
 5bc:	03 53 fc             	add    -0x4(%ebx),%edx
 5bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5c5:	89 10                	mov    %edx,(%eax)
 5c7:	eb da                	jmp    5a3 <free+0x4a>

000005c9 <morecore>:

static Header*
morecore(uint nu)
{
 5c9:	55                   	push   %ebp
 5ca:	89 e5                	mov    %esp,%ebp
 5cc:	53                   	push   %ebx
 5cd:	83 ec 04             	sub    $0x4,%esp
 5d0:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5d2:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5d7:	77 05                	ja     5de <morecore+0x15>
    nu = 4096;
 5d9:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5de:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5e5:	83 ec 0c             	sub    $0xc,%esp
 5e8:	50                   	push   %eax
 5e9:	e8 38 fd ff ff       	call   326 <sbrk>
  if(p == (char*)-1)
 5ee:	83 c4 10             	add    $0x10,%esp
 5f1:	83 f8 ff             	cmp    $0xffffffff,%eax
 5f4:	74 1c                	je     612 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5f6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5f9:	83 c0 08             	add    $0x8,%eax
 5fc:	83 ec 0c             	sub    $0xc,%esp
 5ff:	50                   	push   %eax
 600:	e8 54 ff ff ff       	call   559 <free>
  return freep;
 605:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 60a:	83 c4 10             	add    $0x10,%esp
}
 60d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 610:	c9                   	leave  
 611:	c3                   	ret    
    return 0;
 612:	b8 00 00 00 00       	mov    $0x0,%eax
 617:	eb f4                	jmp    60d <morecore+0x44>

00000619 <malloc>:

void*
malloc(uint nbytes)
{
 619:	55                   	push   %ebp
 61a:	89 e5                	mov    %esp,%ebp
 61c:	53                   	push   %ebx
 61d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 620:	8b 45 08             	mov    0x8(%ebp),%eax
 623:	8d 58 07             	lea    0x7(%eax),%ebx
 626:	c1 eb 03             	shr    $0x3,%ebx
 629:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 62c:	8b 0d 7c 0a 00 00    	mov    0xa7c,%ecx
 632:	85 c9                	test   %ecx,%ecx
 634:	74 04                	je     63a <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 636:	8b 01                	mov    (%ecx),%eax
 638:	eb 4a                	jmp    684 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 63a:	c7 05 7c 0a 00 00 80 	movl   $0xa80,0xa7c
 641:	0a 00 00 
 644:	c7 05 80 0a 00 00 80 	movl   $0xa80,0xa80
 64b:	0a 00 00 
    base.s.size = 0;
 64e:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 655:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 658:	b9 80 0a 00 00       	mov    $0xa80,%ecx
 65d:	eb d7                	jmp    636 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 65f:	74 19                	je     67a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 661:	29 da                	sub    %ebx,%edx
 663:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 666:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 669:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 66c:	89 0d 7c 0a 00 00    	mov    %ecx,0xa7c
      return (void*)(p + 1);
 672:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 675:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 678:	c9                   	leave  
 679:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 67a:	8b 10                	mov    (%eax),%edx
 67c:	89 11                	mov    %edx,(%ecx)
 67e:	eb ec                	jmp    66c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 680:	89 c1                	mov    %eax,%ecx
 682:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 684:	8b 50 04             	mov    0x4(%eax),%edx
 687:	39 da                	cmp    %ebx,%edx
 689:	73 d4                	jae    65f <malloc+0x46>
    if(p == freep)
 68b:	39 05 7c 0a 00 00    	cmp    %eax,0xa7c
 691:	75 ed                	jne    680 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 693:	89 d8                	mov    %ebx,%eax
 695:	e8 2f ff ff ff       	call   5c9 <morecore>
 69a:	85 c0                	test   %eax,%eax
 69c:	75 e2                	jne    680 <malloc+0x67>
 69e:	eb d5                	jmp    675 <malloc+0x5c>
