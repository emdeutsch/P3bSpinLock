
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 5d 02 00 00       	call   273 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 5c 02 00 00       	call   27b <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 e2 02 00 00       	call   30b <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	56                   	push   %esi
  32:	53                   	push   %ebx
  33:	8b 75 08             	mov    0x8(%ebp),%esi
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  39:	89 f0                	mov    %esi,%eax
  3b:	89 d1                	mov    %edx,%ecx
  3d:	83 c2 01             	add    $0x1,%edx
  40:	89 c3                	mov    %eax,%ebx
  42:	83 c0 01             	add    $0x1,%eax
  45:	0f b6 09             	movzbl (%ecx),%ecx
  48:	88 0b                	mov    %cl,(%ebx)
  4a:	84 c9                	test   %cl,%cl
  4c:	75 ed                	jne    3b <strcpy+0xd>
    ;
  return os;
}
  4e:	89 f0                	mov    %esi,%eax
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    

00000054 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  5d:	eb 06                	jmp    65 <strcmp+0x11>
    p++, q++;
  5f:	83 c1 01             	add    $0x1,%ecx
  62:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  65:	0f b6 01             	movzbl (%ecx),%eax
  68:	84 c0                	test   %al,%al
  6a:	74 04                	je     70 <strcmp+0x1c>
  6c:	3a 02                	cmp    (%edx),%al
  6e:	74 ef                	je     5f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  70:	0f b6 c0             	movzbl %al,%eax
  73:	0f b6 12             	movzbl (%edx),%edx
  76:	29 d0                	sub    %edx,%eax
}
  78:	5d                   	pop    %ebp
  79:	c3                   	ret    

0000007a <strlen>:

uint
strlen(const char *s)
{
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  80:	b8 00 00 00 00       	mov    $0x0,%eax
  85:	eb 03                	jmp    8a <strlen+0x10>
  87:	83 c0 01             	add    $0x1,%eax
  8a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8e:	75 f7                	jne    87 <strlen+0xd>
    ;
  return n;
}
  90:	5d                   	pop    %ebp
  91:	c3                   	ret    

00000092 <memset>:

void*
memset(void *dst, int c, uint n)
{
  92:	55                   	push   %ebp
  93:	89 e5                	mov    %esp,%ebp
  95:	57                   	push   %edi
  96:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  99:	89 d7                	mov    %edx,%edi
  9b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  a1:	fc                   	cld    
  a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  a4:	89 d0                	mov    %edx,%eax
  a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
  a9:	c9                   	leave  
  aa:	c3                   	ret    

000000ab <strchr>:

char*
strchr(const char *s, char c)
{
  ab:	55                   	push   %ebp
  ac:	89 e5                	mov    %esp,%ebp
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  b5:	eb 03                	jmp    ba <strchr+0xf>
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	0f b6 10             	movzbl (%eax),%edx
  bd:	84 d2                	test   %dl,%dl
  bf:	74 06                	je     c7 <strchr+0x1c>
    if(*s == c)
  c1:	38 ca                	cmp    %cl,%dl
  c3:	75 f2                	jne    b7 <strchr+0xc>
  c5:	eb 05                	jmp    cc <strchr+0x21>
      return (char*)s;
  return 0;
  c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  cc:	5d                   	pop    %ebp
  cd:	c3                   	ret    

000000ce <gets>:

char*
gets(char *buf, int max)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	57                   	push   %edi
  d2:	56                   	push   %esi
  d3:	53                   	push   %ebx
  d4:	83 ec 1c             	sub    $0x1c,%esp
  d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  da:	bb 00 00 00 00       	mov    $0x0,%ebx
  df:	89 de                	mov    %ebx,%esi
  e1:	83 c3 01             	add    $0x1,%ebx
  e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  e7:	7d 2e                	jge    117 <gets+0x49>
    cc = read(0, &c, 1);
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	6a 01                	push   $0x1
  ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
  f1:	50                   	push   %eax
  f2:	6a 00                	push   $0x0
  f4:	e8 9a 01 00 00       	call   293 <read>
    if(cc < 1)
  f9:	83 c4 10             	add    $0x10,%esp
  fc:	85 c0                	test   %eax,%eax
  fe:	7e 17                	jle    117 <gets+0x49>
      break;
    buf[i++] = c;
 100:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 104:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c2             	sete   %dl
 10c:	3c 0d                	cmp    $0xd,%al
 10e:	0f 94 c0             	sete   %al
 111:	08 c2                	or     %al,%dl
 113:	74 ca                	je     df <gets+0x11>
    buf[i++] = c;
 115:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 117:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 11b:	89 f8                	mov    %edi,%eax
 11d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 120:	5b                   	pop    %ebx
 121:	5e                   	pop    %esi
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <stat>:

int
stat(const char *n, struct stat *st)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 12a:	83 ec 08             	sub    $0x8,%esp
 12d:	6a 00                	push   $0x0
 12f:	ff 75 08             	push   0x8(%ebp)
 132:	e8 84 01 00 00       	call   2bb <open>
  if(fd < 0)
 137:	83 c4 10             	add    $0x10,%esp
 13a:	85 c0                	test   %eax,%eax
 13c:	78 24                	js     162 <stat+0x3d>
 13e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 140:	83 ec 08             	sub    $0x8,%esp
 143:	ff 75 0c             	push   0xc(%ebp)
 146:	50                   	push   %eax
 147:	e8 87 01 00 00       	call   2d3 <fstat>
 14c:	89 c6                	mov    %eax,%esi
  close(fd);
 14e:	89 1c 24             	mov    %ebx,(%esp)
 151:	e8 4d 01 00 00       	call   2a3 <close>
  return r;
 156:	83 c4 10             	add    $0x10,%esp
}
 159:	89 f0                	mov    %esi,%eax
 15b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15e:	5b                   	pop    %ebx
 15f:	5e                   	pop    %esi
 160:	5d                   	pop    %ebp
 161:	c3                   	ret    
    return -1;
 162:	be ff ff ff ff       	mov    $0xffffffff,%esi
 167:	eb f0                	jmp    159 <stat+0x34>

00000169 <atoi>:

int
atoi(const char *s)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	53                   	push   %ebx
 16d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 170:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 175:	eb 10                	jmp    187 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 177:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 17a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 17d:	83 c1 01             	add    $0x1,%ecx
 180:	0f be c0             	movsbl %al,%eax
 183:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 187:	0f b6 01             	movzbl (%ecx),%eax
 18a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 18d:	80 fb 09             	cmp    $0x9,%bl
 190:	76 e5                	jbe    177 <atoi+0xe>
  return n;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	8b 75 08             	mov    0x8(%ebp),%esi
 1a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1a9:	eb 0d                	jmp    1b8 <memmove+0x1f>
    *dst++ = *src++;
 1ab:	0f b6 01             	movzbl (%ecx),%eax
 1ae:	88 02                	mov    %al,(%edx)
 1b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 1b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1b6:	89 d8                	mov    %ebx,%eax
 1b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7f ec                	jg     1ab <memmove+0x12>
  return vdst;
}
 1bf:	89 f0                	mov    %esi,%eax
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    

000001c5 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 1cb:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 1cd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d0:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5d                   	pop    %ebp
 1d5:	c3                   	ret    

000001d6 <lock_init>:
void 
lock_init(lock_t *lock){
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    

000001e4 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	53                   	push   %ebx
 1e8:	83 ec 04             	sub    $0x4,%esp
 1eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 1ee:	83 ec 08             	sub    $0x8,%esp
 1f1:	6a 01                	push   $0x1
 1f3:	53                   	push   %ebx
 1f4:	e8 cc ff ff ff       	call   1c5 <TestAndSet>
 1f9:	83 c4 10             	add    $0x10,%esp
 1fc:	83 f8 01             	cmp    $0x1,%eax
 1ff:	74 ed                	je     1ee <lock_acquire+0xa>
    ;
}
 201:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 204:	c9                   	leave  
 205:	c3                   	ret    

00000206 <lock_release>:
void 
lock_release(lock_t *lock){
 206:	55                   	push   %ebp
 207:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 21a:	68 04 20 00 00       	push   $0x2004
 21f:	e8 d2 03 00 00       	call   5f6 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 224:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 227:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 229:	eb 03                	jmp    22e <thread_create+0x1a>
      stack += 1;
 22b:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 22e:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 234:	75 f5                	jne    22b <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 236:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 238:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 23b:	52                   	push   %edx
 23c:	ff 75 10             	push   0x10(%ebp)
 23f:	ff 75 0c             	push   0xc(%ebp)
 242:	ff 75 08             	push   0x8(%ebp)
 245:	e8 d1 00 00 00       	call   31b <clone>
 
    return pid;
}
 24a:	c9                   	leave  
 24b:	c3                   	ret    

0000024c <thread_join>:
int 
thread_join(){
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	53                   	push   %ebx
 250:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 253:	8d 45 f4             	lea    -0xc(%ebp),%eax
 256:	50                   	push   %eax
 257:	e8 c7 00 00 00       	call   323 <join>
 25c:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 25e:	83 c4 04             	add    $0x4,%esp
 261:	8b 45 f4             	mov    -0xc(%ebp),%eax
 264:	ff 70 fc             	push   -0x4(%eax)
 267:	e8 ca 02 00 00       	call   536 <free>
  return waitedForPID;
 26c:	89 d8                	mov    %ebx,%eax
 26e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 271:	c9                   	leave  
 272:	c3                   	ret    

00000273 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 273:	b8 01 00 00 00       	mov    $0x1,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <exit>:
SYSCALL(exit)
 27b:	b8 02 00 00 00       	mov    $0x2,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <wait>:
SYSCALL(wait)
 283:	b8 03 00 00 00       	mov    $0x3,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <pipe>:
SYSCALL(pipe)
 28b:	b8 04 00 00 00       	mov    $0x4,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <read>:
SYSCALL(read)
 293:	b8 05 00 00 00       	mov    $0x5,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <write>:
SYSCALL(write)
 29b:	b8 10 00 00 00       	mov    $0x10,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <close>:
SYSCALL(close)
 2a3:	b8 15 00 00 00       	mov    $0x15,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <kill>:
SYSCALL(kill)
 2ab:	b8 06 00 00 00       	mov    $0x6,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <exec>:
SYSCALL(exec)
 2b3:	b8 07 00 00 00       	mov    $0x7,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <open>:
SYSCALL(open)
 2bb:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <mknod>:
SYSCALL(mknod)
 2c3:	b8 11 00 00 00       	mov    $0x11,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <unlink>:
SYSCALL(unlink)
 2cb:	b8 12 00 00 00       	mov    $0x12,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <fstat>:
SYSCALL(fstat)
 2d3:	b8 08 00 00 00       	mov    $0x8,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <link>:
SYSCALL(link)
 2db:	b8 13 00 00 00       	mov    $0x13,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <mkdir>:
SYSCALL(mkdir)
 2e3:	b8 14 00 00 00       	mov    $0x14,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <chdir>:
SYSCALL(chdir)
 2eb:	b8 09 00 00 00       	mov    $0x9,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <dup>:
SYSCALL(dup)
 2f3:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <getpid>:
SYSCALL(getpid)
 2fb:	b8 0b 00 00 00       	mov    $0xb,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <sbrk>:
SYSCALL(sbrk)
 303:	b8 0c 00 00 00       	mov    $0xc,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sleep>:
SYSCALL(sleep)
 30b:	b8 0d 00 00 00       	mov    $0xd,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <uptime>:
SYSCALL(uptime)
 313:	b8 0e 00 00 00       	mov    $0xe,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <clone>:
SYSCALL(clone)
 31b:	b8 16 00 00 00       	mov    $0x16,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <join>:
SYSCALL(join)
 323:	b8 17 00 00 00       	mov    $0x17,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 32b:	55                   	push   %ebp
 32c:	89 e5                	mov    %esp,%ebp
 32e:	83 ec 1c             	sub    $0x1c,%esp
 331:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 334:	6a 01                	push   $0x1
 336:	8d 55 f4             	lea    -0xc(%ebp),%edx
 339:	52                   	push   %edx
 33a:	50                   	push   %eax
 33b:	e8 5b ff ff ff       	call   29b <write>
}
 340:	83 c4 10             	add    $0x10,%esp
 343:	c9                   	leave  
 344:	c3                   	ret    

00000345 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 345:	55                   	push   %ebp
 346:	89 e5                	mov    %esp,%ebp
 348:	57                   	push   %edi
 349:	56                   	push   %esi
 34a:	53                   	push   %ebx
 34b:	83 ec 2c             	sub    $0x2c,%esp
 34e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 351:	89 d0                	mov    %edx,%eax
 353:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 355:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 359:	0f 95 c1             	setne  %cl
 35c:	c1 ea 1f             	shr    $0x1f,%edx
 35f:	84 d1                	test   %dl,%cl
 361:	74 44                	je     3a7 <printint+0x62>
    neg = 1;
    x = -xx;
 363:	f7 d8                	neg    %eax
 365:	89 c1                	mov    %eax,%ecx
    neg = 1;
 367:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 36e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 373:	89 c8                	mov    %ecx,%eax
 375:	ba 00 00 00 00       	mov    $0x0,%edx
 37a:	f7 f6                	div    %esi
 37c:	89 df                	mov    %ebx,%edi
 37e:	83 c3 01             	add    $0x1,%ebx
 381:	0f b6 92 e0 06 00 00 	movzbl 0x6e0(%edx),%edx
 388:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 38c:	89 ca                	mov    %ecx,%edx
 38e:	89 c1                	mov    %eax,%ecx
 390:	39 d6                	cmp    %edx,%esi
 392:	76 df                	jbe    373 <printint+0x2e>
  if(neg)
 394:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 398:	74 31                	je     3cb <printint+0x86>
    buf[i++] = '-';
 39a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 39f:	8d 5f 02             	lea    0x2(%edi),%ebx
 3a2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a5:	eb 17                	jmp    3be <printint+0x79>
    x = xx;
 3a7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3a9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3b0:	eb bc                	jmp    36e <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3b2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	e8 6d ff ff ff       	call   32b <putc>
  while(--i >= 0)
 3be:	83 eb 01             	sub    $0x1,%ebx
 3c1:	79 ef                	jns    3b2 <printint+0x6d>
}
 3c3:	83 c4 2c             	add    $0x2c,%esp
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ce:	eb ee                	jmp    3be <printint+0x79>

000003d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3d9:	8d 45 10             	lea    0x10(%ebp),%eax
 3dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3df:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3e4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e9:	eb 14                	jmp    3ff <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3eb:	89 fa                	mov    %edi,%edx
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	e8 36 ff ff ff       	call   32b <putc>
 3f5:	eb 05                	jmp    3fc <printf+0x2c>
      }
    } else if(state == '%'){
 3f7:	83 fe 25             	cmp    $0x25,%esi
 3fa:	74 25                	je     421 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3fc:	83 c3 01             	add    $0x1,%ebx
 3ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 402:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 406:	84 c0                	test   %al,%al
 408:	0f 84 20 01 00 00    	je     52e <printf+0x15e>
    c = fmt[i] & 0xff;
 40e:	0f be f8             	movsbl %al,%edi
 411:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 414:	85 f6                	test   %esi,%esi
 416:	75 df                	jne    3f7 <printf+0x27>
      if(c == '%'){
 418:	83 f8 25             	cmp    $0x25,%eax
 41b:	75 ce                	jne    3eb <printf+0x1b>
        state = '%';
 41d:	89 c6                	mov    %eax,%esi
 41f:	eb db                	jmp    3fc <printf+0x2c>
      if(c == 'd'){
 421:	83 f8 25             	cmp    $0x25,%eax
 424:	0f 84 cf 00 00 00    	je     4f9 <printf+0x129>
 42a:	0f 8c dd 00 00 00    	jl     50d <printf+0x13d>
 430:	83 f8 78             	cmp    $0x78,%eax
 433:	0f 8f d4 00 00 00    	jg     50d <printf+0x13d>
 439:	83 f8 63             	cmp    $0x63,%eax
 43c:	0f 8c cb 00 00 00    	jl     50d <printf+0x13d>
 442:	83 e8 63             	sub    $0x63,%eax
 445:	83 f8 15             	cmp    $0x15,%eax
 448:	0f 87 bf 00 00 00    	ja     50d <printf+0x13d>
 44e:	ff 24 85 88 06 00 00 	jmp    *0x688(,%eax,4)
        printint(fd, *ap, 10, 1);
 455:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 458:	8b 17                	mov    (%edi),%edx
 45a:	83 ec 0c             	sub    $0xc,%esp
 45d:	6a 01                	push   $0x1
 45f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	e8 d9 fe ff ff       	call   345 <printint>
        ap++;
 46c:	83 c7 04             	add    $0x4,%edi
 46f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 472:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 475:	be 00 00 00 00       	mov    $0x0,%esi
 47a:	eb 80                	jmp    3fc <printf+0x2c>
        printint(fd, *ap, 16, 0);
 47c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 47f:	8b 17                	mov    (%edi),%edx
 481:	83 ec 0c             	sub    $0xc,%esp
 484:	6a 00                	push   $0x0
 486:	b9 10 00 00 00       	mov    $0x10,%ecx
 48b:	8b 45 08             	mov    0x8(%ebp),%eax
 48e:	e8 b2 fe ff ff       	call   345 <printint>
        ap++;
 493:	83 c7 04             	add    $0x4,%edi
 496:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 499:	83 c4 10             	add    $0x10,%esp
      state = 0;
 49c:	be 00 00 00 00       	mov    $0x0,%esi
 4a1:	e9 56 ff ff ff       	jmp    3fc <printf+0x2c>
        s = (char*)*ap;
 4a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a9:	8b 30                	mov    (%eax),%esi
        ap++;
 4ab:	83 c0 04             	add    $0x4,%eax
 4ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4b1:	85 f6                	test   %esi,%esi
 4b3:	75 15                	jne    4ca <printf+0xfa>
          s = "(null)";
 4b5:	be 80 06 00 00       	mov    $0x680,%esi
 4ba:	eb 0e                	jmp    4ca <printf+0xfa>
          putc(fd, *s);
 4bc:	0f be d2             	movsbl %dl,%edx
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	e8 64 fe ff ff       	call   32b <putc>
          s++;
 4c7:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4ca:	0f b6 16             	movzbl (%esi),%edx
 4cd:	84 d2                	test   %dl,%dl
 4cf:	75 eb                	jne    4bc <printf+0xec>
      state = 0;
 4d1:	be 00 00 00 00       	mov    $0x0,%esi
 4d6:	e9 21 ff ff ff       	jmp    3fc <printf+0x2c>
        putc(fd, *ap);
 4db:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4de:	0f be 17             	movsbl (%edi),%edx
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	e8 42 fe ff ff       	call   32b <putc>
        ap++;
 4e9:	83 c7 04             	add    $0x4,%edi
 4ec:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4ef:	be 00 00 00 00       	mov    $0x0,%esi
 4f4:	e9 03 ff ff ff       	jmp    3fc <printf+0x2c>
        putc(fd, c);
 4f9:	89 fa                	mov    %edi,%edx
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	e8 28 fe ff ff       	call   32b <putc>
      state = 0;
 503:	be 00 00 00 00       	mov    $0x0,%esi
 508:	e9 ef fe ff ff       	jmp    3fc <printf+0x2c>
        putc(fd, '%');
 50d:	ba 25 00 00 00       	mov    $0x25,%edx
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	e8 11 fe ff ff       	call   32b <putc>
        putc(fd, c);
 51a:	89 fa                	mov    %edi,%edx
 51c:	8b 45 08             	mov    0x8(%ebp),%eax
 51f:	e8 07 fe ff ff       	call   32b <putc>
      state = 0;
 524:	be 00 00 00 00       	mov    $0x0,%esi
 529:	e9 ce fe ff ff       	jmp    3fc <printf+0x2c>
    }
  }
}
 52e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 531:	5b                   	pop    %ebx
 532:	5e                   	pop    %esi
 533:	5f                   	pop    %edi
 534:	5d                   	pop    %ebp
 535:	c3                   	ret    

00000536 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	57                   	push   %edi
 53a:	56                   	push   %esi
 53b:	53                   	push   %ebx
 53c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 53f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 542:	a1 48 0a 00 00       	mov    0xa48,%eax
 547:	eb 02                	jmp    54b <free+0x15>
 549:	89 d0                	mov    %edx,%eax
 54b:	39 c8                	cmp    %ecx,%eax
 54d:	73 04                	jae    553 <free+0x1d>
 54f:	39 08                	cmp    %ecx,(%eax)
 551:	77 12                	ja     565 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 553:	8b 10                	mov    (%eax),%edx
 555:	39 c2                	cmp    %eax,%edx
 557:	77 f0                	ja     549 <free+0x13>
 559:	39 c8                	cmp    %ecx,%eax
 55b:	72 08                	jb     565 <free+0x2f>
 55d:	39 ca                	cmp    %ecx,%edx
 55f:	77 04                	ja     565 <free+0x2f>
 561:	89 d0                	mov    %edx,%eax
 563:	eb e6                	jmp    54b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 565:	8b 73 fc             	mov    -0x4(%ebx),%esi
 568:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 56b:	8b 10                	mov    (%eax),%edx
 56d:	39 d7                	cmp    %edx,%edi
 56f:	74 19                	je     58a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 571:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 574:	8b 50 04             	mov    0x4(%eax),%edx
 577:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 57a:	39 ce                	cmp    %ecx,%esi
 57c:	74 1b                	je     599 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 57e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 580:	a3 48 0a 00 00       	mov    %eax,0xa48
}
 585:	5b                   	pop    %ebx
 586:	5e                   	pop    %esi
 587:	5f                   	pop    %edi
 588:	5d                   	pop    %ebp
 589:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 58a:	03 72 04             	add    0x4(%edx),%esi
 58d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 590:	8b 10                	mov    (%eax),%edx
 592:	8b 12                	mov    (%edx),%edx
 594:	89 53 f8             	mov    %edx,-0x8(%ebx)
 597:	eb db                	jmp    574 <free+0x3e>
    p->s.size += bp->s.size;
 599:	03 53 fc             	add    -0x4(%ebx),%edx
 59c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 59f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5a2:	89 10                	mov    %edx,(%eax)
 5a4:	eb da                	jmp    580 <free+0x4a>

000005a6 <morecore>:

static Header*
morecore(uint nu)
{
 5a6:	55                   	push   %ebp
 5a7:	89 e5                	mov    %esp,%ebp
 5a9:	53                   	push   %ebx
 5aa:	83 ec 04             	sub    $0x4,%esp
 5ad:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5af:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5b4:	77 05                	ja     5bb <morecore+0x15>
    nu = 4096;
 5b6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5bb:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5c2:	83 ec 0c             	sub    $0xc,%esp
 5c5:	50                   	push   %eax
 5c6:	e8 38 fd ff ff       	call   303 <sbrk>
  if(p == (char*)-1)
 5cb:	83 c4 10             	add    $0x10,%esp
 5ce:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d1:	74 1c                	je     5ef <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5d3:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5d6:	83 c0 08             	add    $0x8,%eax
 5d9:	83 ec 0c             	sub    $0xc,%esp
 5dc:	50                   	push   %eax
 5dd:	e8 54 ff ff ff       	call   536 <free>
  return freep;
 5e2:	a1 48 0a 00 00       	mov    0xa48,%eax
 5e7:	83 c4 10             	add    $0x10,%esp
}
 5ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ed:	c9                   	leave  
 5ee:	c3                   	ret    
    return 0;
 5ef:	b8 00 00 00 00       	mov    $0x0,%eax
 5f4:	eb f4                	jmp    5ea <morecore+0x44>

000005f6 <malloc>:

void*
malloc(uint nbytes)
{
 5f6:	55                   	push   %ebp
 5f7:	89 e5                	mov    %esp,%ebp
 5f9:	53                   	push   %ebx
 5fa:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	8d 58 07             	lea    0x7(%eax),%ebx
 603:	c1 eb 03             	shr    $0x3,%ebx
 606:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 609:	8b 0d 48 0a 00 00    	mov    0xa48,%ecx
 60f:	85 c9                	test   %ecx,%ecx
 611:	74 04                	je     617 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 613:	8b 01                	mov    (%ecx),%eax
 615:	eb 4a                	jmp    661 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 617:	c7 05 48 0a 00 00 4c 	movl   $0xa4c,0xa48
 61e:	0a 00 00 
 621:	c7 05 4c 0a 00 00 4c 	movl   $0xa4c,0xa4c
 628:	0a 00 00 
    base.s.size = 0;
 62b:	c7 05 50 0a 00 00 00 	movl   $0x0,0xa50
 632:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 635:	b9 4c 0a 00 00       	mov    $0xa4c,%ecx
 63a:	eb d7                	jmp    613 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 63c:	74 19                	je     657 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 63e:	29 da                	sub    %ebx,%edx
 640:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 643:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 646:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 649:	89 0d 48 0a 00 00    	mov    %ecx,0xa48
      return (void*)(p + 1);
 64f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 655:	c9                   	leave  
 656:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 657:	8b 10                	mov    (%eax),%edx
 659:	89 11                	mov    %edx,(%ecx)
 65b:	eb ec                	jmp    649 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 65d:	89 c1                	mov    %eax,%ecx
 65f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 661:	8b 50 04             	mov    0x4(%eax),%edx
 664:	39 da                	cmp    %ebx,%edx
 666:	73 d4                	jae    63c <malloc+0x46>
    if(p == freep)
 668:	39 05 48 0a 00 00    	cmp    %eax,0xa48
 66e:	75 ed                	jne    65d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 670:	89 d8                	mov    %ebx,%eax
 672:	e8 2f ff ff ff       	call   5a6 <morecore>
 677:	85 c0                	test   %eax,%eax
 679:	75 e2                	jne    65d <malloc+0x67>
 67b:	eb d5                	jmp    652 <malloc+0x5c>
