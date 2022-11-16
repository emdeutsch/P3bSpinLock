
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
  21:	e8 d7 03 00 00       	call   3fd <printf>
    exit();
  26:	e8 7d 02 00 00       	call   2a8 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 cf 02 00 00       	call   308 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 63 02 00 00       	call   2a8 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 bf 06 00 00       	push   $0x6bf
  50:	6a 02                	push   $0x2
  52:	e8 a6 03 00 00       	call   3fd <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <strcpy>:
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
 122:	e8 99 01 00 00       	call   2c0 <read>
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
 160:	e8 83 01 00 00       	call   2e8 <open>
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
 175:	e8 86 01 00 00       	call   300 <fstat>
 17a:	89 c6                	mov    %eax,%esi
  close(fd);
 17c:	89 1c 24             	mov    %ebx,(%esp)
 17f:	e8 4c 01 00 00       	call   2d0 <close>
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
 24d:	e8 d1 03 00 00       	call   623 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 252:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 255:	83 c4 10             	add    $0x10,%esp
 258:	eb 03                	jmp    25d <thread_create+0x1b>
      stack += 1;
 25a:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 25d:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 263:	75 f5                	jne    25a <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 265:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 268:	52                   	push   %edx
 269:	ff 75 10             	push   0x10(%ebp)
 26c:	ff 75 0c             	push   0xc(%ebp)
 26f:	ff 75 08             	push   0x8(%ebp)
 272:	e8 d1 00 00 00       	call   348 <clone>
 
    return pid;
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <thread_join>:
int 
thread_join(){
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
 27c:	53                   	push   %ebx
 27d:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 280:	8d 45 f4             	lea    -0xc(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 c7 00 00 00       	call   350 <join>
 289:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 28b:	83 c4 04             	add    $0x4,%esp
 28e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 291:	ff 70 fc             	push   -0x4(%eax)
 294:	e8 ca 02 00 00       	call   563 <free>
  return pid;
 299:	89 d8                	mov    %ebx,%eax
 29b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29e:	c9                   	leave  
 29f:	c3                   	ret    

000002a0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a0:	b8 01 00 00 00       	mov    $0x1,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <exit>:
SYSCALL(exit)
 2a8:	b8 02 00 00 00       	mov    $0x2,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <wait>:
SYSCALL(wait)
 2b0:	b8 03 00 00 00       	mov    $0x3,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <pipe>:
SYSCALL(pipe)
 2b8:	b8 04 00 00 00       	mov    $0x4,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <read>:
SYSCALL(read)
 2c0:	b8 05 00 00 00       	mov    $0x5,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <write>:
SYSCALL(write)
 2c8:	b8 10 00 00 00       	mov    $0x10,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <close>:
SYSCALL(close)
 2d0:	b8 15 00 00 00       	mov    $0x15,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <kill>:
SYSCALL(kill)
 2d8:	b8 06 00 00 00       	mov    $0x6,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <exec>:
SYSCALL(exec)
 2e0:	b8 07 00 00 00       	mov    $0x7,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <open>:
SYSCALL(open)
 2e8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <mknod>:
SYSCALL(mknod)
 2f0:	b8 11 00 00 00       	mov    $0x11,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <unlink>:
SYSCALL(unlink)
 2f8:	b8 12 00 00 00       	mov    $0x12,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <fstat>:
SYSCALL(fstat)
 300:	b8 08 00 00 00       	mov    $0x8,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <link>:
SYSCALL(link)
 308:	b8 13 00 00 00       	mov    $0x13,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <mkdir>:
SYSCALL(mkdir)
 310:	b8 14 00 00 00       	mov    $0x14,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <chdir>:
SYSCALL(chdir)
 318:	b8 09 00 00 00       	mov    $0x9,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <dup>:
SYSCALL(dup)
 320:	b8 0a 00 00 00       	mov    $0xa,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <getpid>:
SYSCALL(getpid)
 328:	b8 0b 00 00 00       	mov    $0xb,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <sbrk>:
SYSCALL(sbrk)
 330:	b8 0c 00 00 00       	mov    $0xc,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <sleep>:
SYSCALL(sleep)
 338:	b8 0d 00 00 00       	mov    $0xd,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <uptime>:
SYSCALL(uptime)
 340:	b8 0e 00 00 00       	mov    $0xe,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <clone>:
SYSCALL(clone)
 348:	b8 16 00 00 00       	mov    $0x16,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <join>:
SYSCALL(join)
 350:	b8 17 00 00 00       	mov    $0x17,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	83 ec 1c             	sub    $0x1c,%esp
 35e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 361:	6a 01                	push   $0x1
 363:	8d 55 f4             	lea    -0xc(%ebp),%edx
 366:	52                   	push   %edx
 367:	50                   	push   %eax
 368:	e8 5b ff ff ff       	call   2c8 <write>
}
 36d:	83 c4 10             	add    $0x10,%esp
 370:	c9                   	leave  
 371:	c3                   	ret    

00000372 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
 375:	57                   	push   %edi
 376:	56                   	push   %esi
 377:	53                   	push   %ebx
 378:	83 ec 2c             	sub    $0x2c,%esp
 37b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 37e:	89 d0                	mov    %edx,%eax
 380:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 382:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 386:	0f 95 c1             	setne  %cl
 389:	c1 ea 1f             	shr    $0x1f,%edx
 38c:	84 d1                	test   %dl,%cl
 38e:	74 44                	je     3d4 <printint+0x62>
    neg = 1;
    x = -xx;
 390:	f7 d8                	neg    %eax
 392:	89 c1                	mov    %eax,%ecx
    neg = 1;
 394:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 39b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	ba 00 00 00 00       	mov    $0x0,%edx
 3a7:	f7 f6                	div    %esi
 3a9:	89 df                	mov    %ebx,%edi
 3ab:	83 c3 01             	add    $0x1,%ebx
 3ae:	0f b6 92 34 07 00 00 	movzbl 0x734(%edx),%edx
 3b5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3b9:	89 ca                	mov    %ecx,%edx
 3bb:	89 c1                	mov    %eax,%ecx
 3bd:	39 d6                	cmp    %edx,%esi
 3bf:	76 df                	jbe    3a0 <printint+0x2e>
  if(neg)
 3c1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3c5:	74 31                	je     3f8 <printint+0x86>
    buf[i++] = '-';
 3c7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3cc:	8d 5f 02             	lea    0x2(%edi),%ebx
 3cf:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d2:	eb 17                	jmp    3eb <printint+0x79>
    x = xx;
 3d4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3d6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3dd:	eb bc                	jmp    39b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3df:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3e4:	89 f0                	mov    %esi,%eax
 3e6:	e8 6d ff ff ff       	call   358 <putc>
  while(--i >= 0)
 3eb:	83 eb 01             	sub    $0x1,%ebx
 3ee:	79 ef                	jns    3df <printint+0x6d>
}
 3f0:	83 c4 2c             	add    $0x2c,%esp
 3f3:	5b                   	pop    %ebx
 3f4:	5e                   	pop    %esi
 3f5:	5f                   	pop    %edi
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    
 3f8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3fb:	eb ee                	jmp    3eb <printint+0x79>

000003fd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	57                   	push   %edi
 401:	56                   	push   %esi
 402:	53                   	push   %ebx
 403:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 406:	8d 45 10             	lea    0x10(%ebp),%eax
 409:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 40c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 411:	bb 00 00 00 00       	mov    $0x0,%ebx
 416:	eb 14                	jmp    42c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 418:	89 fa                	mov    %edi,%edx
 41a:	8b 45 08             	mov    0x8(%ebp),%eax
 41d:	e8 36 ff ff ff       	call   358 <putc>
 422:	eb 05                	jmp    429 <printf+0x2c>
      }
    } else if(state == '%'){
 424:	83 fe 25             	cmp    $0x25,%esi
 427:	74 25                	je     44e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 429:	83 c3 01             	add    $0x1,%ebx
 42c:	8b 45 0c             	mov    0xc(%ebp),%eax
 42f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 433:	84 c0                	test   %al,%al
 435:	0f 84 20 01 00 00    	je     55b <printf+0x15e>
    c = fmt[i] & 0xff;
 43b:	0f be f8             	movsbl %al,%edi
 43e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 441:	85 f6                	test   %esi,%esi
 443:	75 df                	jne    424 <printf+0x27>
      if(c == '%'){
 445:	83 f8 25             	cmp    $0x25,%eax
 448:	75 ce                	jne    418 <printf+0x1b>
        state = '%';
 44a:	89 c6                	mov    %eax,%esi
 44c:	eb db                	jmp    429 <printf+0x2c>
      if(c == 'd'){
 44e:	83 f8 25             	cmp    $0x25,%eax
 451:	0f 84 cf 00 00 00    	je     526 <printf+0x129>
 457:	0f 8c dd 00 00 00    	jl     53a <printf+0x13d>
 45d:	83 f8 78             	cmp    $0x78,%eax
 460:	0f 8f d4 00 00 00    	jg     53a <printf+0x13d>
 466:	83 f8 63             	cmp    $0x63,%eax
 469:	0f 8c cb 00 00 00    	jl     53a <printf+0x13d>
 46f:	83 e8 63             	sub    $0x63,%eax
 472:	83 f8 15             	cmp    $0x15,%eax
 475:	0f 87 bf 00 00 00    	ja     53a <printf+0x13d>
 47b:	ff 24 85 dc 06 00 00 	jmp    *0x6dc(,%eax,4)
        printint(fd, *ap, 10, 1);
 482:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 485:	8b 17                	mov    (%edi),%edx
 487:	83 ec 0c             	sub    $0xc,%esp
 48a:	6a 01                	push   $0x1
 48c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 491:	8b 45 08             	mov    0x8(%ebp),%eax
 494:	e8 d9 fe ff ff       	call   372 <printint>
        ap++;
 499:	83 c7 04             	add    $0x4,%edi
 49c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 49f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a2:	be 00 00 00 00       	mov    $0x0,%esi
 4a7:	eb 80                	jmp    429 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4a9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ac:	8b 17                	mov    (%edi),%edx
 4ae:	83 ec 0c             	sub    $0xc,%esp
 4b1:	6a 00                	push   $0x0
 4b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b8:	8b 45 08             	mov    0x8(%ebp),%eax
 4bb:	e8 b2 fe ff ff       	call   372 <printint>
        ap++;
 4c0:	83 c7 04             	add    $0x4,%edi
 4c3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c9:	be 00 00 00 00       	mov    $0x0,%esi
 4ce:	e9 56 ff ff ff       	jmp    429 <printf+0x2c>
        s = (char*)*ap;
 4d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d6:	8b 30                	mov    (%eax),%esi
        ap++;
 4d8:	83 c0 04             	add    $0x4,%eax
 4db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4de:	85 f6                	test   %esi,%esi
 4e0:	75 15                	jne    4f7 <printf+0xfa>
          s = "(null)";
 4e2:	be d3 06 00 00       	mov    $0x6d3,%esi
 4e7:	eb 0e                	jmp    4f7 <printf+0xfa>
          putc(fd, *s);
 4e9:	0f be d2             	movsbl %dl,%edx
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
 4ef:	e8 64 fe ff ff       	call   358 <putc>
          s++;
 4f4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4f7:	0f b6 16             	movzbl (%esi),%edx
 4fa:	84 d2                	test   %dl,%dl
 4fc:	75 eb                	jne    4e9 <printf+0xec>
      state = 0;
 4fe:	be 00 00 00 00       	mov    $0x0,%esi
 503:	e9 21 ff ff ff       	jmp    429 <printf+0x2c>
        putc(fd, *ap);
 508:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50b:	0f be 17             	movsbl (%edi),%edx
 50e:	8b 45 08             	mov    0x8(%ebp),%eax
 511:	e8 42 fe ff ff       	call   358 <putc>
        ap++;
 516:	83 c7 04             	add    $0x4,%edi
 519:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 51c:	be 00 00 00 00       	mov    $0x0,%esi
 521:	e9 03 ff ff ff       	jmp    429 <printf+0x2c>
        putc(fd, c);
 526:	89 fa                	mov    %edi,%edx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	e8 28 fe ff ff       	call   358 <putc>
      state = 0;
 530:	be 00 00 00 00       	mov    $0x0,%esi
 535:	e9 ef fe ff ff       	jmp    429 <printf+0x2c>
        putc(fd, '%');
 53a:	ba 25 00 00 00       	mov    $0x25,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	e8 11 fe ff ff       	call   358 <putc>
        putc(fd, c);
 547:	89 fa                	mov    %edi,%edx
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	e8 07 fe ff ff       	call   358 <putc>
      state = 0;
 551:	be 00 00 00 00       	mov    $0x0,%esi
 556:	e9 ce fe ff ff       	jmp    429 <printf+0x2c>
    }
  }
}
 55b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55e:	5b                   	pop    %ebx
 55f:	5e                   	pop    %esi
 560:	5f                   	pop    %edi
 561:	5d                   	pop    %ebp
 562:	c3                   	ret    

00000563 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 563:	55                   	push   %ebp
 564:	89 e5                	mov    %esp,%ebp
 566:	57                   	push   %edi
 567:	56                   	push   %esi
 568:	53                   	push   %ebx
 569:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 56c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 56f:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 574:	eb 02                	jmp    578 <free+0x15>
 576:	89 d0                	mov    %edx,%eax
 578:	39 c8                	cmp    %ecx,%eax
 57a:	73 04                	jae    580 <free+0x1d>
 57c:	39 08                	cmp    %ecx,(%eax)
 57e:	77 12                	ja     592 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 580:	8b 10                	mov    (%eax),%edx
 582:	39 c2                	cmp    %eax,%edx
 584:	77 f0                	ja     576 <free+0x13>
 586:	39 c8                	cmp    %ecx,%eax
 588:	72 08                	jb     592 <free+0x2f>
 58a:	39 ca                	cmp    %ecx,%edx
 58c:	77 04                	ja     592 <free+0x2f>
 58e:	89 d0                	mov    %edx,%eax
 590:	eb e6                	jmp    578 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 592:	8b 73 fc             	mov    -0x4(%ebx),%esi
 595:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 598:	8b 10                	mov    (%eax),%edx
 59a:	39 d7                	cmp    %edx,%edi
 59c:	74 19                	je     5b7 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 59e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5a1:	8b 50 04             	mov    0x4(%eax),%edx
 5a4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5a7:	39 ce                	cmp    %ecx,%esi
 5a9:	74 1b                	je     5c6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5ab:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5ad:	a3 a0 0a 00 00       	mov    %eax,0xaa0
}
 5b2:	5b                   	pop    %ebx
 5b3:	5e                   	pop    %esi
 5b4:	5f                   	pop    %edi
 5b5:	5d                   	pop    %ebp
 5b6:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5b7:	03 72 04             	add    0x4(%edx),%esi
 5ba:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5bd:	8b 10                	mov    (%eax),%edx
 5bf:	8b 12                	mov    (%edx),%edx
 5c1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5c4:	eb db                	jmp    5a1 <free+0x3e>
    p->s.size += bp->s.size;
 5c6:	03 53 fc             	add    -0x4(%ebx),%edx
 5c9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5cc:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5cf:	89 10                	mov    %edx,(%eax)
 5d1:	eb da                	jmp    5ad <free+0x4a>

000005d3 <morecore>:

static Header*
morecore(uint nu)
{
 5d3:	55                   	push   %ebp
 5d4:	89 e5                	mov    %esp,%ebp
 5d6:	53                   	push   %ebx
 5d7:	83 ec 04             	sub    $0x4,%esp
 5da:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5dc:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5e1:	77 05                	ja     5e8 <morecore+0x15>
    nu = 4096;
 5e3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5e8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5ef:	83 ec 0c             	sub    $0xc,%esp
 5f2:	50                   	push   %eax
 5f3:	e8 38 fd ff ff       	call   330 <sbrk>
  if(p == (char*)-1)
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5fe:	74 1c                	je     61c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 600:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 603:	83 c0 08             	add    $0x8,%eax
 606:	83 ec 0c             	sub    $0xc,%esp
 609:	50                   	push   %eax
 60a:	e8 54 ff ff ff       	call   563 <free>
  return freep;
 60f:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 614:	83 c4 10             	add    $0x10,%esp
}
 617:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 61a:	c9                   	leave  
 61b:	c3                   	ret    
    return 0;
 61c:	b8 00 00 00 00       	mov    $0x0,%eax
 621:	eb f4                	jmp    617 <morecore+0x44>

00000623 <malloc>:

void*
malloc(uint nbytes)
{
 623:	55                   	push   %ebp
 624:	89 e5                	mov    %esp,%ebp
 626:	53                   	push   %ebx
 627:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	8d 58 07             	lea    0x7(%eax),%ebx
 630:	c1 eb 03             	shr    $0x3,%ebx
 633:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 636:	8b 0d a0 0a 00 00    	mov    0xaa0,%ecx
 63c:	85 c9                	test   %ecx,%ecx
 63e:	74 04                	je     644 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 640:	8b 01                	mov    (%ecx),%eax
 642:	eb 4a                	jmp    68e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 644:	c7 05 a0 0a 00 00 a4 	movl   $0xaa4,0xaa0
 64b:	0a 00 00 
 64e:	c7 05 a4 0a 00 00 a4 	movl   $0xaa4,0xaa4
 655:	0a 00 00 
    base.s.size = 0;
 658:	c7 05 a8 0a 00 00 00 	movl   $0x0,0xaa8
 65f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 662:	b9 a4 0a 00 00       	mov    $0xaa4,%ecx
 667:	eb d7                	jmp    640 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 669:	74 19                	je     684 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 66b:	29 da                	sub    %ebx,%edx
 66d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 670:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 673:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 676:	89 0d a0 0a 00 00    	mov    %ecx,0xaa0
      return (void*)(p + 1);
 67c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 67f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 682:	c9                   	leave  
 683:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 684:	8b 10                	mov    (%eax),%edx
 686:	89 11                	mov    %edx,(%ecx)
 688:	eb ec                	jmp    676 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 68a:	89 c1                	mov    %eax,%ecx
 68c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 68e:	8b 50 04             	mov    0x4(%eax),%edx
 691:	39 da                	cmp    %ebx,%edx
 693:	73 d4                	jae    669 <malloc+0x46>
    if(p == freep)
 695:	39 05 a0 0a 00 00    	cmp    %eax,0xaa0
 69b:	75 ed                	jne    68a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 69d:	89 d8                	mov    %ebx,%eax
 69f:	e8 2f ff ff ff       	call   5d3 <morecore>
 6a4:	85 c0                	test   %eax,%eax
 6a6:	75 e2                	jne    68a <malloc+0x67>
 6a8:	eb d5                	jmp    67f <malloc+0x5c>
