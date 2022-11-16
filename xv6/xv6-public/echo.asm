
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
  30:	e8 bd 03 00 00       	call   3f2 <printf>
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
  4c:	e8 4c 02 00 00       	call   29d <exit>

00000051 <strcpy>:
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
 117:	e8 99 01 00 00       	call   2b5 <read>
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
 155:	e8 83 01 00 00       	call   2dd <open>
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
 16a:	e8 86 01 00 00       	call   2f5 <fstat>
 16f:	89 c6                	mov    %eax,%esi
  close(fd);
 171:	89 1c 24             	mov    %ebx,(%esp)
 174:	e8 4c 01 00 00       	call   2c5 <close>
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
 242:	e8 d1 03 00 00       	call   618 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 247:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 24a:	83 c4 10             	add    $0x10,%esp
 24d:	eb 03                	jmp    252 <thread_create+0x1b>
      stack += 1;
 24f:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 252:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 258:	75 f5                	jne    24f <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 25a:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 25d:	52                   	push   %edx
 25e:	ff 75 10             	push   0x10(%ebp)
 261:	ff 75 0c             	push   0xc(%ebp)
 264:	ff 75 08             	push   0x8(%ebp)
 267:	e8 d1 00 00 00       	call   33d <clone>
 
    return pid;
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <thread_join>:
int 
thread_join(){
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	53                   	push   %ebx
 272:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 275:	8d 45 f4             	lea    -0xc(%ebp),%eax
 278:	50                   	push   %eax
 279:	e8 c7 00 00 00       	call   345 <join>
 27e:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 280:	83 c4 04             	add    $0x4,%esp
 283:	8b 45 f4             	mov    -0xc(%ebp),%eax
 286:	ff 70 fc             	push   -0x4(%eax)
 289:	e8 ca 02 00 00       	call   558 <free>
  return pid;
 28e:	89 d8                	mov    %ebx,%eax
 290:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 293:	c9                   	leave  
 294:	c3                   	ret    

00000295 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 295:	b8 01 00 00 00       	mov    $0x1,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <exit>:
SYSCALL(exit)
 29d:	b8 02 00 00 00       	mov    $0x2,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <wait>:
SYSCALL(wait)
 2a5:	b8 03 00 00 00       	mov    $0x3,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <pipe>:
SYSCALL(pipe)
 2ad:	b8 04 00 00 00       	mov    $0x4,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <read>:
SYSCALL(read)
 2b5:	b8 05 00 00 00       	mov    $0x5,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <write>:
SYSCALL(write)
 2bd:	b8 10 00 00 00       	mov    $0x10,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <close>:
SYSCALL(close)
 2c5:	b8 15 00 00 00       	mov    $0x15,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <kill>:
SYSCALL(kill)
 2cd:	b8 06 00 00 00       	mov    $0x6,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <exec>:
SYSCALL(exec)
 2d5:	b8 07 00 00 00       	mov    $0x7,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <open>:
SYSCALL(open)
 2dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <mknod>:
SYSCALL(mknod)
 2e5:	b8 11 00 00 00       	mov    $0x11,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <unlink>:
SYSCALL(unlink)
 2ed:	b8 12 00 00 00       	mov    $0x12,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <fstat>:
SYSCALL(fstat)
 2f5:	b8 08 00 00 00       	mov    $0x8,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <link>:
SYSCALL(link)
 2fd:	b8 13 00 00 00       	mov    $0x13,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <mkdir>:
SYSCALL(mkdir)
 305:	b8 14 00 00 00       	mov    $0x14,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <chdir>:
SYSCALL(chdir)
 30d:	b8 09 00 00 00       	mov    $0x9,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <dup>:
SYSCALL(dup)
 315:	b8 0a 00 00 00       	mov    $0xa,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <getpid>:
SYSCALL(getpid)
 31d:	b8 0b 00 00 00       	mov    $0xb,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <sbrk>:
SYSCALL(sbrk)
 325:	b8 0c 00 00 00       	mov    $0xc,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <sleep>:
SYSCALL(sleep)
 32d:	b8 0d 00 00 00       	mov    $0xd,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <uptime>:
SYSCALL(uptime)
 335:	b8 0e 00 00 00       	mov    $0xe,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <clone>:
SYSCALL(clone)
 33d:	b8 16 00 00 00       	mov    $0x16,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <join>:
SYSCALL(join)
 345:	b8 17 00 00 00       	mov    $0x17,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	83 ec 1c             	sub    $0x1c,%esp
 353:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 356:	6a 01                	push   $0x1
 358:	8d 55 f4             	lea    -0xc(%ebp),%edx
 35b:	52                   	push   %edx
 35c:	50                   	push   %eax
 35d:	e8 5b ff ff ff       	call   2bd <write>
}
 362:	83 c4 10             	add    $0x10,%esp
 365:	c9                   	leave  
 366:	c3                   	ret    

00000367 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 367:	55                   	push   %ebp
 368:	89 e5                	mov    %esp,%ebp
 36a:	57                   	push   %edi
 36b:	56                   	push   %esi
 36c:	53                   	push   %ebx
 36d:	83 ec 2c             	sub    $0x2c,%esp
 370:	89 45 d0             	mov    %eax,-0x30(%ebp)
 373:	89 d0                	mov    %edx,%eax
 375:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 377:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 37b:	0f 95 c1             	setne  %cl
 37e:	c1 ea 1f             	shr    $0x1f,%edx
 381:	84 d1                	test   %dl,%cl
 383:	74 44                	je     3c9 <printint+0x62>
    neg = 1;
    x = -xx;
 385:	f7 d8                	neg    %eax
 387:	89 c1                	mov    %eax,%ecx
    neg = 1;
 389:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 390:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 395:	89 c8                	mov    %ecx,%eax
 397:	ba 00 00 00 00       	mov    $0x0,%edx
 39c:	f7 f6                	div    %esi
 39e:	89 df                	mov    %ebx,%edi
 3a0:	83 c3 01             	add    $0x1,%ebx
 3a3:	0f b6 92 08 07 00 00 	movzbl 0x708(%edx),%edx
 3aa:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3ae:	89 ca                	mov    %ecx,%edx
 3b0:	89 c1                	mov    %eax,%ecx
 3b2:	39 d6                	cmp    %edx,%esi
 3b4:	76 df                	jbe    395 <printint+0x2e>
  if(neg)
 3b6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3ba:	74 31                	je     3ed <printint+0x86>
    buf[i++] = '-';
 3bc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3c1:	8d 5f 02             	lea    0x2(%edi),%ebx
 3c4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3c7:	eb 17                	jmp    3e0 <printint+0x79>
    x = xx;
 3c9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3cb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3d2:	eb bc                	jmp    390 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3d4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3d9:	89 f0                	mov    %esi,%eax
 3db:	e8 6d ff ff ff       	call   34d <putc>
  while(--i >= 0)
 3e0:	83 eb 01             	sub    $0x1,%ebx
 3e3:	79 ef                	jns    3d4 <printint+0x6d>
}
 3e5:	83 c4 2c             	add    $0x2c,%esp
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5f                   	pop    %edi
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
 3ed:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3f0:	eb ee                	jmp    3e0 <printint+0x79>

000003f2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	57                   	push   %edi
 3f6:	56                   	push   %esi
 3f7:	53                   	push   %ebx
 3f8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3fb:	8d 45 10             	lea    0x10(%ebp),%eax
 3fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 401:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 406:	bb 00 00 00 00       	mov    $0x0,%ebx
 40b:	eb 14                	jmp    421 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 40d:	89 fa                	mov    %edi,%edx
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
 412:	e8 36 ff ff ff       	call   34d <putc>
 417:	eb 05                	jmp    41e <printf+0x2c>
      }
    } else if(state == '%'){
 419:	83 fe 25             	cmp    $0x25,%esi
 41c:	74 25                	je     443 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 41e:	83 c3 01             	add    $0x1,%ebx
 421:	8b 45 0c             	mov    0xc(%ebp),%eax
 424:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 428:	84 c0                	test   %al,%al
 42a:	0f 84 20 01 00 00    	je     550 <printf+0x15e>
    c = fmt[i] & 0xff;
 430:	0f be f8             	movsbl %al,%edi
 433:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 436:	85 f6                	test   %esi,%esi
 438:	75 df                	jne    419 <printf+0x27>
      if(c == '%'){
 43a:	83 f8 25             	cmp    $0x25,%eax
 43d:	75 ce                	jne    40d <printf+0x1b>
        state = '%';
 43f:	89 c6                	mov    %eax,%esi
 441:	eb db                	jmp    41e <printf+0x2c>
      if(c == 'd'){
 443:	83 f8 25             	cmp    $0x25,%eax
 446:	0f 84 cf 00 00 00    	je     51b <printf+0x129>
 44c:	0f 8c dd 00 00 00    	jl     52f <printf+0x13d>
 452:	83 f8 78             	cmp    $0x78,%eax
 455:	0f 8f d4 00 00 00    	jg     52f <printf+0x13d>
 45b:	83 f8 63             	cmp    $0x63,%eax
 45e:	0f 8c cb 00 00 00    	jl     52f <printf+0x13d>
 464:	83 e8 63             	sub    $0x63,%eax
 467:	83 f8 15             	cmp    $0x15,%eax
 46a:	0f 87 bf 00 00 00    	ja     52f <printf+0x13d>
 470:	ff 24 85 b0 06 00 00 	jmp    *0x6b0(,%eax,4)
        printint(fd, *ap, 10, 1);
 477:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 47a:	8b 17                	mov    (%edi),%edx
 47c:	83 ec 0c             	sub    $0xc,%esp
 47f:	6a 01                	push   $0x1
 481:	b9 0a 00 00 00       	mov    $0xa,%ecx
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	e8 d9 fe ff ff       	call   367 <printint>
        ap++;
 48e:	83 c7 04             	add    $0x4,%edi
 491:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 494:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 497:	be 00 00 00 00       	mov    $0x0,%esi
 49c:	eb 80                	jmp    41e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 49e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4a1:	8b 17                	mov    (%edi),%edx
 4a3:	83 ec 0c             	sub    $0xc,%esp
 4a6:	6a 00                	push   $0x0
 4a8:	b9 10 00 00 00       	mov    $0x10,%ecx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	e8 b2 fe ff ff       	call   367 <printint>
        ap++;
 4b5:	83 c7 04             	add    $0x4,%edi
 4b8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4bb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4be:	be 00 00 00 00       	mov    $0x0,%esi
 4c3:	e9 56 ff ff ff       	jmp    41e <printf+0x2c>
        s = (char*)*ap;
 4c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4cb:	8b 30                	mov    (%eax),%esi
        ap++;
 4cd:	83 c0 04             	add    $0x4,%eax
 4d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4d3:	85 f6                	test   %esi,%esi
 4d5:	75 15                	jne    4ec <printf+0xfa>
          s = "(null)";
 4d7:	be a9 06 00 00       	mov    $0x6a9,%esi
 4dc:	eb 0e                	jmp    4ec <printf+0xfa>
          putc(fd, *s);
 4de:	0f be d2             	movsbl %dl,%edx
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	e8 64 fe ff ff       	call   34d <putc>
          s++;
 4e9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4ec:	0f b6 16             	movzbl (%esi),%edx
 4ef:	84 d2                	test   %dl,%dl
 4f1:	75 eb                	jne    4de <printf+0xec>
      state = 0;
 4f3:	be 00 00 00 00       	mov    $0x0,%esi
 4f8:	e9 21 ff ff ff       	jmp    41e <printf+0x2c>
        putc(fd, *ap);
 4fd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 500:	0f be 17             	movsbl (%edi),%edx
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	e8 42 fe ff ff       	call   34d <putc>
        ap++;
 50b:	83 c7 04             	add    $0x4,%edi
 50e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 511:	be 00 00 00 00       	mov    $0x0,%esi
 516:	e9 03 ff ff ff       	jmp    41e <printf+0x2c>
        putc(fd, c);
 51b:	89 fa                	mov    %edi,%edx
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	e8 28 fe ff ff       	call   34d <putc>
      state = 0;
 525:	be 00 00 00 00       	mov    $0x0,%esi
 52a:	e9 ef fe ff ff       	jmp    41e <printf+0x2c>
        putc(fd, '%');
 52f:	ba 25 00 00 00       	mov    $0x25,%edx
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	e8 11 fe ff ff       	call   34d <putc>
        putc(fd, c);
 53c:	89 fa                	mov    %edi,%edx
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	e8 07 fe ff ff       	call   34d <putc>
      state = 0;
 546:	be 00 00 00 00       	mov    $0x0,%esi
 54b:	e9 ce fe ff ff       	jmp    41e <printf+0x2c>
    }
  }
}
 550:	8d 65 f4             	lea    -0xc(%ebp),%esp
 553:	5b                   	pop    %ebx
 554:	5e                   	pop    %esi
 555:	5f                   	pop    %edi
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    

00000558 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 558:	55                   	push   %ebp
 559:	89 e5                	mov    %esp,%ebp
 55b:	57                   	push   %edi
 55c:	56                   	push   %esi
 55d:	53                   	push   %ebx
 55e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 561:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 564:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 569:	eb 02                	jmp    56d <free+0x15>
 56b:	89 d0                	mov    %edx,%eax
 56d:	39 c8                	cmp    %ecx,%eax
 56f:	73 04                	jae    575 <free+0x1d>
 571:	39 08                	cmp    %ecx,(%eax)
 573:	77 12                	ja     587 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 575:	8b 10                	mov    (%eax),%edx
 577:	39 c2                	cmp    %eax,%edx
 579:	77 f0                	ja     56b <free+0x13>
 57b:	39 c8                	cmp    %ecx,%eax
 57d:	72 08                	jb     587 <free+0x2f>
 57f:	39 ca                	cmp    %ecx,%edx
 581:	77 04                	ja     587 <free+0x2f>
 583:	89 d0                	mov    %edx,%eax
 585:	eb e6                	jmp    56d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 587:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 58d:	8b 10                	mov    (%eax),%edx
 58f:	39 d7                	cmp    %edx,%edi
 591:	74 19                	je     5ac <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 593:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 596:	8b 50 04             	mov    0x4(%eax),%edx
 599:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 59c:	39 ce                	cmp    %ecx,%esi
 59e:	74 1b                	je     5bb <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5a0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5a2:	a3 7c 0a 00 00       	mov    %eax,0xa7c
}
 5a7:	5b                   	pop    %ebx
 5a8:	5e                   	pop    %esi
 5a9:	5f                   	pop    %edi
 5aa:	5d                   	pop    %ebp
 5ab:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5ac:	03 72 04             	add    0x4(%edx),%esi
 5af:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5b2:	8b 10                	mov    (%eax),%edx
 5b4:	8b 12                	mov    (%edx),%edx
 5b6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5b9:	eb db                	jmp    596 <free+0x3e>
    p->s.size += bp->s.size;
 5bb:	03 53 fc             	add    -0x4(%ebx),%edx
 5be:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5c1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5c4:	89 10                	mov    %edx,(%eax)
 5c6:	eb da                	jmp    5a2 <free+0x4a>

000005c8 <morecore>:

static Header*
morecore(uint nu)
{
 5c8:	55                   	push   %ebp
 5c9:	89 e5                	mov    %esp,%ebp
 5cb:	53                   	push   %ebx
 5cc:	83 ec 04             	sub    $0x4,%esp
 5cf:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5d1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5d6:	77 05                	ja     5dd <morecore+0x15>
    nu = 4096;
 5d8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5dd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5e4:	83 ec 0c             	sub    $0xc,%esp
 5e7:	50                   	push   %eax
 5e8:	e8 38 fd ff ff       	call   325 <sbrk>
  if(p == (char*)-1)
 5ed:	83 c4 10             	add    $0x10,%esp
 5f0:	83 f8 ff             	cmp    $0xffffffff,%eax
 5f3:	74 1c                	je     611 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5f5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5f8:	83 c0 08             	add    $0x8,%eax
 5fb:	83 ec 0c             	sub    $0xc,%esp
 5fe:	50                   	push   %eax
 5ff:	e8 54 ff ff ff       	call   558 <free>
  return freep;
 604:	a1 7c 0a 00 00       	mov    0xa7c,%eax
 609:	83 c4 10             	add    $0x10,%esp
}
 60c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 60f:	c9                   	leave  
 610:	c3                   	ret    
    return 0;
 611:	b8 00 00 00 00       	mov    $0x0,%eax
 616:	eb f4                	jmp    60c <morecore+0x44>

00000618 <malloc>:

void*
malloc(uint nbytes)
{
 618:	55                   	push   %ebp
 619:	89 e5                	mov    %esp,%ebp
 61b:	53                   	push   %ebx
 61c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	8d 58 07             	lea    0x7(%eax),%ebx
 625:	c1 eb 03             	shr    $0x3,%ebx
 628:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 62b:	8b 0d 7c 0a 00 00    	mov    0xa7c,%ecx
 631:	85 c9                	test   %ecx,%ecx
 633:	74 04                	je     639 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 635:	8b 01                	mov    (%ecx),%eax
 637:	eb 4a                	jmp    683 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 639:	c7 05 7c 0a 00 00 80 	movl   $0xa80,0xa7c
 640:	0a 00 00 
 643:	c7 05 80 0a 00 00 80 	movl   $0xa80,0xa80
 64a:	0a 00 00 
    base.s.size = 0;
 64d:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 654:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 657:	b9 80 0a 00 00       	mov    $0xa80,%ecx
 65c:	eb d7                	jmp    635 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 65e:	74 19                	je     679 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 660:	29 da                	sub    %ebx,%edx
 662:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 665:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 668:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 66b:	89 0d 7c 0a 00 00    	mov    %ecx,0xa7c
      return (void*)(p + 1);
 671:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 674:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 677:	c9                   	leave  
 678:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 679:	8b 10                	mov    (%eax),%edx
 67b:	89 11                	mov    %edx,(%ecx)
 67d:	eb ec                	jmp    66b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 67f:	89 c1                	mov    %eax,%ecx
 681:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 683:	8b 50 04             	mov    0x4(%eax),%edx
 686:	39 da                	cmp    %ebx,%edx
 688:	73 d4                	jae    65e <malloc+0x46>
    if(p == freep)
 68a:	39 05 7c 0a 00 00    	cmp    %eax,0xa7c
 690:	75 ed                	jne    67f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 692:	89 d8                	mov    %ebx,%eax
 694:	e8 2f ff ff ff       	call   5c8 <morecore>
 699:	85 c0                	test   %eax,%eax
 69b:	75 e2                	jne    67f <malloc+0x67>
 69d:	eb d5                	jmp    674 <malloc+0x5c>
