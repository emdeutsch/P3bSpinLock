
_ln:     file format elf32-i386


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
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 14                	je     2b <main+0x2b>
    printf(2, "Usage: ln old new\n");
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	68 ac 06 00 00       	push   $0x6ac
  1f:	6a 02                	push   $0x2
  21:	e8 d8 03 00 00       	call   3fe <printf>
    exit();
  26:	e8 7e 02 00 00       	call   2a9 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 d0 02 00 00       	call   309 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 64 02 00 00       	call   2a9 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 bf 06 00 00       	push   $0x6bf
  50:	6a 02                	push   $0x2
  52:	e8 a7 03 00 00       	call   3fe <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	56                   	push   %esi
  60:	53                   	push   %ebx
  61:	8b 75 08             	mov    0x8(%ebp),%esi
  64:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  67:	89 f0                	mov    %esi,%eax
  69:	89 d1                	mov    %edx,%ecx
  6b:	83 c2 01             	add    $0x1,%edx
  6e:	89 c3                	mov    %eax,%ebx
  70:	83 c0 01             	add    $0x1,%eax
  73:	0f b6 09             	movzbl (%ecx),%ecx
  76:	88 0b                	mov    %cl,(%ebx)
  78:	84 c9                	test   %cl,%cl
  7a:	75 ed                	jne    69 <strcpy+0xd>
    ;
  return os;
}
  7c:	89 f0                	mov    %esi,%eax
  7e:	5b                   	pop    %ebx
  7f:	5e                   	pop    %esi
  80:	5d                   	pop    %ebp
  81:	c3                   	ret    

00000082 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  85:	8b 4d 08             	mov    0x8(%ebp),%ecx
  88:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8b:	eb 06                	jmp    93 <strcmp+0x11>
    p++, q++;
  8d:	83 c1 01             	add    $0x1,%ecx
  90:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  93:	0f b6 01             	movzbl (%ecx),%eax
  96:	84 c0                	test   %al,%al
  98:	74 04                	je     9e <strcmp+0x1c>
  9a:	3a 02                	cmp    (%edx),%al
  9c:	74 ef                	je     8d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9e:	0f b6 c0             	movzbl %al,%eax
  a1:	0f b6 12             	movzbl (%edx),%edx
  a4:	29 d0                	sub    %edx,%eax
}
  a6:	5d                   	pop    %ebp
  a7:	c3                   	ret    

000000a8 <strlen>:

uint
strlen(const char *s)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ae:	b8 00 00 00 00       	mov    $0x0,%eax
  b3:	eb 03                	jmp    b8 <strlen+0x10>
  b5:	83 c0 01             	add    $0x1,%eax
  b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bc:	75 f7                	jne    b5 <strlen+0xd>
    ;
  return n;
}
  be:	5d                   	pop    %ebp
  bf:	c3                   	ret    

000000c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c7:	89 d7                	mov    %edx,%edi
  c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  cf:	fc                   	cld    
  d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d2:	89 d0                	mov    %edx,%eax
  d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d7:	c9                   	leave  
  d8:	c3                   	ret    

000000d9 <strchr>:

char*
strchr(const char *s, char c)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	8b 45 08             	mov    0x8(%ebp),%eax
  df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  e3:	eb 03                	jmp    e8 <strchr+0xf>
  e5:	83 c0 01             	add    $0x1,%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	84 d2                	test   %dl,%dl
  ed:	74 06                	je     f5 <strchr+0x1c>
    if(*s == c)
  ef:	38 ca                	cmp    %cl,%dl
  f1:	75 f2                	jne    e5 <strchr+0xc>
  f3:	eb 05                	jmp    fa <strchr+0x21>
      return (char*)s;
  return 0;
  f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  fa:	5d                   	pop    %ebp
  fb:	c3                   	ret    

000000fc <gets>:

char*
gets(char *buf, int max)
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	57                   	push   %edi
 100:	56                   	push   %esi
 101:	53                   	push   %ebx
 102:	83 ec 1c             	sub    $0x1c,%esp
 105:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 108:	bb 00 00 00 00       	mov    $0x0,%ebx
 10d:	89 de                	mov    %ebx,%esi
 10f:	83 c3 01             	add    $0x1,%ebx
 112:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 115:	7d 2e                	jge    145 <gets+0x49>
    cc = read(0, &c, 1);
 117:	83 ec 04             	sub    $0x4,%esp
 11a:	6a 01                	push   $0x1
 11c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11f:	50                   	push   %eax
 120:	6a 00                	push   $0x0
 122:	e8 9a 01 00 00       	call   2c1 <read>
    if(cc < 1)
 127:	83 c4 10             	add    $0x10,%esp
 12a:	85 c0                	test   %eax,%eax
 12c:	7e 17                	jle    145 <gets+0x49>
      break;
    buf[i++] = c;
 12e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 132:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 135:	3c 0a                	cmp    $0xa,%al
 137:	0f 94 c2             	sete   %dl
 13a:	3c 0d                	cmp    $0xd,%al
 13c:	0f 94 c0             	sete   %al
 13f:	08 c2                	or     %al,%dl
 141:	74 ca                	je     10d <gets+0x11>
    buf[i++] = c;
 143:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 145:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 149:	89 f8                	mov    %edi,%eax
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14e:	5b                   	pop    %ebx
 14f:	5e                   	pop    %esi
 150:	5f                   	pop    %edi
 151:	5d                   	pop    %ebp
 152:	c3                   	ret    

00000153 <stat>:

int
stat(const char *n, struct stat *st)
{
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	56                   	push   %esi
 157:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 158:	83 ec 08             	sub    $0x8,%esp
 15b:	6a 00                	push   $0x0
 15d:	ff 75 08             	push   0x8(%ebp)
 160:	e8 84 01 00 00       	call   2e9 <open>
  if(fd < 0)
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	78 24                	js     190 <stat+0x3d>
 16c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16e:	83 ec 08             	sub    $0x8,%esp
 171:	ff 75 0c             	push   0xc(%ebp)
 174:	50                   	push   %eax
 175:	e8 87 01 00 00       	call   301 <fstat>
 17a:	89 c6                	mov    %eax,%esi
  close(fd);
 17c:	89 1c 24             	mov    %ebx,(%esp)
 17f:	e8 4d 01 00 00       	call   2d1 <close>
  return r;
 184:	83 c4 10             	add    $0x10,%esp
}
 187:	89 f0                	mov    %esi,%eax
 189:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18c:	5b                   	pop    %ebx
 18d:	5e                   	pop    %esi
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    
    return -1;
 190:	be ff ff ff ff       	mov    $0xffffffff,%esi
 195:	eb f0                	jmp    187 <stat+0x34>

00000197 <atoi>:

int
atoi(const char *s)
{
 197:	55                   	push   %ebp
 198:	89 e5                	mov    %esp,%ebp
 19a:	53                   	push   %ebx
 19b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1a3:	eb 10                	jmp    1b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1ab:	83 c1 01             	add    $0x1,%ecx
 1ae:	0f be c0             	movsbl %al,%eax
 1b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1b5:	0f b6 01             	movzbl (%ecx),%eax
 1b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1bb:	80 fb 09             	cmp    $0x9,%bl
 1be:	76 e5                	jbe    1a5 <atoi+0xe>
  return n;
}
 1c0:	89 d0                	mov    %edx,%eax
 1c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c5:	c9                   	leave  
 1c6:	c3                   	ret    

000001c7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	56                   	push   %esi
 1cb:	53                   	push   %ebx
 1cc:	8b 75 08             	mov    0x8(%ebp),%esi
 1cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1d7:	eb 0d                	jmp    1e6 <memmove+0x1f>
    *dst++ = *src++;
 1d9:	0f b6 01             	movzbl (%ecx),%eax
 1dc:	88 02                	mov    %al,(%edx)
 1de:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1e4:	89 d8                	mov    %ebx,%eax
 1e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e9:	85 c0                	test   %eax,%eax
 1eb:	7f ec                	jg     1d9 <memmove+0x12>
  return vdst;
}
 1ed:	89 f0                	mov    %esi,%eax
 1ef:	5b                   	pop    %ebx
 1f0:	5e                   	pop    %esi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    

000001f3 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 1f9:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 1fb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1fe:	89 08                	mov    %ecx,(%eax)
  return old;
}
 200:	89 d0                	mov    %edx,%eax
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    

00000204 <lock_init>:
void 
lock_init(lock_t *lock){
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 210:	5d                   	pop    %ebp
 211:	c3                   	ret    

00000212 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 212:	55                   	push   %ebp
 213:	89 e5                	mov    %esp,%ebp
 215:	53                   	push   %ebx
 216:	83 ec 04             	sub    $0x4,%esp
 219:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 21c:	83 ec 08             	sub    $0x8,%esp
 21f:	6a 01                	push   $0x1
 221:	53                   	push   %ebx
 222:	e8 cc ff ff ff       	call   1f3 <TestAndSet>
 227:	83 c4 10             	add    $0x10,%esp
 22a:	83 f8 01             	cmp    $0x1,%eax
 22d:	74 ed                	je     21c <lock_acquire+0xa>
    ;
}
 22f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 232:	c9                   	leave  
 233:	c3                   	ret    

00000234 <lock_release>:
void 
lock_release(lock_t *lock){
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 240:	5d                   	pop    %ebp
 241:	c3                   	ret    

00000242 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 248:	68 04 20 00 00       	push   $0x2004
 24d:	e8 d2 03 00 00       	call   624 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 252:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 255:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 257:	eb 03                	jmp    25c <thread_create+0x1a>
      stack += 1;
 259:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 25c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 262:	75 f5                	jne    259 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 264:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 266:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 269:	52                   	push   %edx
 26a:	ff 75 10             	push   0x10(%ebp)
 26d:	ff 75 0c             	push   0xc(%ebp)
 270:	ff 75 08             	push   0x8(%ebp)
 273:	e8 d1 00 00 00       	call   349 <clone>
 
    return pid;
}
 278:	c9                   	leave  
 279:	c3                   	ret    

0000027a <thread_join>:
int 
thread_join(){
 27a:	55                   	push   %ebp
 27b:	89 e5                	mov    %esp,%ebp
 27d:	53                   	push   %ebx
 27e:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 281:	8d 45 f4             	lea    -0xc(%ebp),%eax
 284:	50                   	push   %eax
 285:	e8 c7 00 00 00       	call   351 <join>
 28a:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 28c:	83 c4 04             	add    $0x4,%esp
 28f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 292:	ff 70 fc             	push   -0x4(%eax)
 295:	e8 ca 02 00 00       	call   564 <free>
  return waitedForPID;
 29a:	89 d8                	mov    %ebx,%eax
 29c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a1:	b8 01 00 00 00       	mov    $0x1,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <exit>:
SYSCALL(exit)
 2a9:	b8 02 00 00 00       	mov    $0x2,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <wait>:
SYSCALL(wait)
 2b1:	b8 03 00 00 00       	mov    $0x3,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <pipe>:
SYSCALL(pipe)
 2b9:	b8 04 00 00 00       	mov    $0x4,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <read>:
SYSCALL(read)
 2c1:	b8 05 00 00 00       	mov    $0x5,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <write>:
SYSCALL(write)
 2c9:	b8 10 00 00 00       	mov    $0x10,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <close>:
SYSCALL(close)
 2d1:	b8 15 00 00 00       	mov    $0x15,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <kill>:
SYSCALL(kill)
 2d9:	b8 06 00 00 00       	mov    $0x6,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <exec>:
SYSCALL(exec)
 2e1:	b8 07 00 00 00       	mov    $0x7,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <open>:
SYSCALL(open)
 2e9:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <mknod>:
SYSCALL(mknod)
 2f1:	b8 11 00 00 00       	mov    $0x11,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <unlink>:
SYSCALL(unlink)
 2f9:	b8 12 00 00 00       	mov    $0x12,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <fstat>:
SYSCALL(fstat)
 301:	b8 08 00 00 00       	mov    $0x8,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <link>:
SYSCALL(link)
 309:	b8 13 00 00 00       	mov    $0x13,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <mkdir>:
SYSCALL(mkdir)
 311:	b8 14 00 00 00       	mov    $0x14,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <chdir>:
SYSCALL(chdir)
 319:	b8 09 00 00 00       	mov    $0x9,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <dup>:
SYSCALL(dup)
 321:	b8 0a 00 00 00       	mov    $0xa,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <getpid>:
SYSCALL(getpid)
 329:	b8 0b 00 00 00       	mov    $0xb,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <sbrk>:
SYSCALL(sbrk)
 331:	b8 0c 00 00 00       	mov    $0xc,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <sleep>:
SYSCALL(sleep)
 339:	b8 0d 00 00 00       	mov    $0xd,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <uptime>:
SYSCALL(uptime)
 341:	b8 0e 00 00 00       	mov    $0xe,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <clone>:
SYSCALL(clone)
 349:	b8 16 00 00 00       	mov    $0x16,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <join>:
SYSCALL(join)
 351:	b8 17 00 00 00       	mov    $0x17,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	83 ec 1c             	sub    $0x1c,%esp
 35f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 362:	6a 01                	push   $0x1
 364:	8d 55 f4             	lea    -0xc(%ebp),%edx
 367:	52                   	push   %edx
 368:	50                   	push   %eax
 369:	e8 5b ff ff ff       	call   2c9 <write>
}
 36e:	83 c4 10             	add    $0x10,%esp
 371:	c9                   	leave  
 372:	c3                   	ret    

00000373 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 373:	55                   	push   %ebp
 374:	89 e5                	mov    %esp,%ebp
 376:	57                   	push   %edi
 377:	56                   	push   %esi
 378:	53                   	push   %ebx
 379:	83 ec 2c             	sub    $0x2c,%esp
 37c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 37f:	89 d0                	mov    %edx,%eax
 381:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 383:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 387:	0f 95 c1             	setne  %cl
 38a:	c1 ea 1f             	shr    $0x1f,%edx
 38d:	84 d1                	test   %dl,%cl
 38f:	74 44                	je     3d5 <printint+0x62>
    neg = 1;
    x = -xx;
 391:	f7 d8                	neg    %eax
 393:	89 c1                	mov    %eax,%ecx
    neg = 1;
 395:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 39c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3a1:	89 c8                	mov    %ecx,%eax
 3a3:	ba 00 00 00 00       	mov    $0x0,%edx
 3a8:	f7 f6                	div    %esi
 3aa:	89 df                	mov    %ebx,%edi
 3ac:	83 c3 01             	add    $0x1,%ebx
 3af:	0f b6 92 34 07 00 00 	movzbl 0x734(%edx),%edx
 3b6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3ba:	89 ca                	mov    %ecx,%edx
 3bc:	89 c1                	mov    %eax,%ecx
 3be:	39 d6                	cmp    %edx,%esi
 3c0:	76 df                	jbe    3a1 <printint+0x2e>
  if(neg)
 3c2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3c6:	74 31                	je     3f9 <printint+0x86>
    buf[i++] = '-';
 3c8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3cd:	8d 5f 02             	lea    0x2(%edi),%ebx
 3d0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d3:	eb 17                	jmp    3ec <printint+0x79>
    x = xx;
 3d5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3d7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3de:	eb bc                	jmp    39c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3e0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3e5:	89 f0                	mov    %esi,%eax
 3e7:	e8 6d ff ff ff       	call   359 <putc>
  while(--i >= 0)
 3ec:	83 eb 01             	sub    $0x1,%ebx
 3ef:	79 ef                	jns    3e0 <printint+0x6d>
}
 3f1:	83 c4 2c             	add    $0x2c,%esp
 3f4:	5b                   	pop    %ebx
 3f5:	5e                   	pop    %esi
 3f6:	5f                   	pop    %edi
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret    
 3f9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3fc:	eb ee                	jmp    3ec <printint+0x79>

000003fe <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3fe:	55                   	push   %ebp
 3ff:	89 e5                	mov    %esp,%ebp
 401:	57                   	push   %edi
 402:	56                   	push   %esi
 403:	53                   	push   %ebx
 404:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 407:	8d 45 10             	lea    0x10(%ebp),%eax
 40a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 40d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 412:	bb 00 00 00 00       	mov    $0x0,%ebx
 417:	eb 14                	jmp    42d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 419:	89 fa                	mov    %edi,%edx
 41b:	8b 45 08             	mov    0x8(%ebp),%eax
 41e:	e8 36 ff ff ff       	call   359 <putc>
 423:	eb 05                	jmp    42a <printf+0x2c>
      }
    } else if(state == '%'){
 425:	83 fe 25             	cmp    $0x25,%esi
 428:	74 25                	je     44f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 42a:	83 c3 01             	add    $0x1,%ebx
 42d:	8b 45 0c             	mov    0xc(%ebp),%eax
 430:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 434:	84 c0                	test   %al,%al
 436:	0f 84 20 01 00 00    	je     55c <printf+0x15e>
    c = fmt[i] & 0xff;
 43c:	0f be f8             	movsbl %al,%edi
 43f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 442:	85 f6                	test   %esi,%esi
 444:	75 df                	jne    425 <printf+0x27>
      if(c == '%'){
 446:	83 f8 25             	cmp    $0x25,%eax
 449:	75 ce                	jne    419 <printf+0x1b>
        state = '%';
 44b:	89 c6                	mov    %eax,%esi
 44d:	eb db                	jmp    42a <printf+0x2c>
      if(c == 'd'){
 44f:	83 f8 25             	cmp    $0x25,%eax
 452:	0f 84 cf 00 00 00    	je     527 <printf+0x129>
 458:	0f 8c dd 00 00 00    	jl     53b <printf+0x13d>
 45e:	83 f8 78             	cmp    $0x78,%eax
 461:	0f 8f d4 00 00 00    	jg     53b <printf+0x13d>
 467:	83 f8 63             	cmp    $0x63,%eax
 46a:	0f 8c cb 00 00 00    	jl     53b <printf+0x13d>
 470:	83 e8 63             	sub    $0x63,%eax
 473:	83 f8 15             	cmp    $0x15,%eax
 476:	0f 87 bf 00 00 00    	ja     53b <printf+0x13d>
 47c:	ff 24 85 dc 06 00 00 	jmp    *0x6dc(,%eax,4)
        printint(fd, *ap, 10, 1);
 483:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 486:	8b 17                	mov    (%edi),%edx
 488:	83 ec 0c             	sub    $0xc,%esp
 48b:	6a 01                	push   $0x1
 48d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 492:	8b 45 08             	mov    0x8(%ebp),%eax
 495:	e8 d9 fe ff ff       	call   373 <printint>
        ap++;
 49a:	83 c7 04             	add    $0x4,%edi
 49d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4a0:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a3:	be 00 00 00 00       	mov    $0x0,%esi
 4a8:	eb 80                	jmp    42a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ad:	8b 17                	mov    (%edi),%edx
 4af:	83 ec 0c             	sub    $0xc,%esp
 4b2:	6a 00                	push   $0x0
 4b4:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b9:	8b 45 08             	mov    0x8(%ebp),%eax
 4bc:	e8 b2 fe ff ff       	call   373 <printint>
        ap++;
 4c1:	83 c7 04             	add    $0x4,%edi
 4c4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ca:	be 00 00 00 00       	mov    $0x0,%esi
 4cf:	e9 56 ff ff ff       	jmp    42a <printf+0x2c>
        s = (char*)*ap;
 4d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d7:	8b 30                	mov    (%eax),%esi
        ap++;
 4d9:	83 c0 04             	add    $0x4,%eax
 4dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4df:	85 f6                	test   %esi,%esi
 4e1:	75 15                	jne    4f8 <printf+0xfa>
          s = "(null)";
 4e3:	be d3 06 00 00       	mov    $0x6d3,%esi
 4e8:	eb 0e                	jmp    4f8 <printf+0xfa>
          putc(fd, *s);
 4ea:	0f be d2             	movsbl %dl,%edx
 4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 4f0:	e8 64 fe ff ff       	call   359 <putc>
          s++;
 4f5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4f8:	0f b6 16             	movzbl (%esi),%edx
 4fb:	84 d2                	test   %dl,%dl
 4fd:	75 eb                	jne    4ea <printf+0xec>
      state = 0;
 4ff:	be 00 00 00 00       	mov    $0x0,%esi
 504:	e9 21 ff ff ff       	jmp    42a <printf+0x2c>
        putc(fd, *ap);
 509:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50c:	0f be 17             	movsbl (%edi),%edx
 50f:	8b 45 08             	mov    0x8(%ebp),%eax
 512:	e8 42 fe ff ff       	call   359 <putc>
        ap++;
 517:	83 c7 04             	add    $0x4,%edi
 51a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 51d:	be 00 00 00 00       	mov    $0x0,%esi
 522:	e9 03 ff ff ff       	jmp    42a <printf+0x2c>
        putc(fd, c);
 527:	89 fa                	mov    %edi,%edx
 529:	8b 45 08             	mov    0x8(%ebp),%eax
 52c:	e8 28 fe ff ff       	call   359 <putc>
      state = 0;
 531:	be 00 00 00 00       	mov    $0x0,%esi
 536:	e9 ef fe ff ff       	jmp    42a <printf+0x2c>
        putc(fd, '%');
 53b:	ba 25 00 00 00       	mov    $0x25,%edx
 540:	8b 45 08             	mov    0x8(%ebp),%eax
 543:	e8 11 fe ff ff       	call   359 <putc>
        putc(fd, c);
 548:	89 fa                	mov    %edi,%edx
 54a:	8b 45 08             	mov    0x8(%ebp),%eax
 54d:	e8 07 fe ff ff       	call   359 <putc>
      state = 0;
 552:	be 00 00 00 00       	mov    $0x0,%esi
 557:	e9 ce fe ff ff       	jmp    42a <printf+0x2c>
    }
  }
}
 55c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    

00000564 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	57                   	push   %edi
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
 56a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 56d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 570:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 575:	eb 02                	jmp    579 <free+0x15>
 577:	89 d0                	mov    %edx,%eax
 579:	39 c8                	cmp    %ecx,%eax
 57b:	73 04                	jae    581 <free+0x1d>
 57d:	39 08                	cmp    %ecx,(%eax)
 57f:	77 12                	ja     593 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 581:	8b 10                	mov    (%eax),%edx
 583:	39 c2                	cmp    %eax,%edx
 585:	77 f0                	ja     577 <free+0x13>
 587:	39 c8                	cmp    %ecx,%eax
 589:	72 08                	jb     593 <free+0x2f>
 58b:	39 ca                	cmp    %ecx,%edx
 58d:	77 04                	ja     593 <free+0x2f>
 58f:	89 d0                	mov    %edx,%eax
 591:	eb e6                	jmp    579 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 593:	8b 73 fc             	mov    -0x4(%ebx),%esi
 596:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 599:	8b 10                	mov    (%eax),%edx
 59b:	39 d7                	cmp    %edx,%edi
 59d:	74 19                	je     5b8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 59f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5a2:	8b 50 04             	mov    0x4(%eax),%edx
 5a5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5a8:	39 ce                	cmp    %ecx,%esi
 5aa:	74 1b                	je     5c7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5ac:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5ae:	a3 a0 0a 00 00       	mov    %eax,0xaa0
}
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5b8:	03 72 04             	add    0x4(%edx),%esi
 5bb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5be:	8b 10                	mov    (%eax),%edx
 5c0:	8b 12                	mov    (%edx),%edx
 5c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5c5:	eb db                	jmp    5a2 <free+0x3e>
    p->s.size += bp->s.size;
 5c7:	03 53 fc             	add    -0x4(%ebx),%edx
 5ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5cd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5d0:	89 10                	mov    %edx,(%eax)
 5d2:	eb da                	jmp    5ae <free+0x4a>

000005d4 <morecore>:

static Header*
morecore(uint nu)
{
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	53                   	push   %ebx
 5d8:	83 ec 04             	sub    $0x4,%esp
 5db:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5dd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5e2:	77 05                	ja     5e9 <morecore+0x15>
    nu = 4096;
 5e4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5e9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	50                   	push   %eax
 5f4:	e8 38 fd ff ff       	call   331 <sbrk>
  if(p == (char*)-1)
 5f9:	83 c4 10             	add    $0x10,%esp
 5fc:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ff:	74 1c                	je     61d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 601:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 604:	83 c0 08             	add    $0x8,%eax
 607:	83 ec 0c             	sub    $0xc,%esp
 60a:	50                   	push   %eax
 60b:	e8 54 ff ff ff       	call   564 <free>
  return freep;
 610:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 615:	83 c4 10             	add    $0x10,%esp
}
 618:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 61b:	c9                   	leave  
 61c:	c3                   	ret    
    return 0;
 61d:	b8 00 00 00 00       	mov    $0x0,%eax
 622:	eb f4                	jmp    618 <morecore+0x44>

00000624 <malloc>:

void*
malloc(uint nbytes)
{
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	53                   	push   %ebx
 628:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 62b:	8b 45 08             	mov    0x8(%ebp),%eax
 62e:	8d 58 07             	lea    0x7(%eax),%ebx
 631:	c1 eb 03             	shr    $0x3,%ebx
 634:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 637:	8b 0d a0 0a 00 00    	mov    0xaa0,%ecx
 63d:	85 c9                	test   %ecx,%ecx
 63f:	74 04                	je     645 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 641:	8b 01                	mov    (%ecx),%eax
 643:	eb 4a                	jmp    68f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 645:	c7 05 a0 0a 00 00 a4 	movl   $0xaa4,0xaa0
 64c:	0a 00 00 
 64f:	c7 05 a4 0a 00 00 a4 	movl   $0xaa4,0xaa4
 656:	0a 00 00 
    base.s.size = 0;
 659:	c7 05 a8 0a 00 00 00 	movl   $0x0,0xaa8
 660:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 663:	b9 a4 0a 00 00       	mov    $0xaa4,%ecx
 668:	eb d7                	jmp    641 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 66a:	74 19                	je     685 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 66c:	29 da                	sub    %ebx,%edx
 66e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 671:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 674:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 677:	89 0d a0 0a 00 00    	mov    %ecx,0xaa0
      return (void*)(p + 1);
 67d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 680:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 683:	c9                   	leave  
 684:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 685:	8b 10                	mov    (%eax),%edx
 687:	89 11                	mov    %edx,(%ecx)
 689:	eb ec                	jmp    677 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 68b:	89 c1                	mov    %eax,%ecx
 68d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 68f:	8b 50 04             	mov    0x4(%eax),%edx
 692:	39 da                	cmp    %ebx,%edx
 694:	73 d4                	jae    66a <malloc+0x46>
    if(p == freep)
 696:	39 05 a0 0a 00 00    	cmp    %eax,0xaa0
 69c:	75 ed                	jne    68b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 69e:	89 d8                	mov    %ebx,%eax
 6a0:	e8 2f ff ff ff       	call   5d4 <morecore>
 6a5:	85 c0                	test   %eax,%eax
 6a7:	75 e2                	jne    68b <malloc+0x67>
 6a9:	eb d5                	jmp    680 <malloc+0x5c>
