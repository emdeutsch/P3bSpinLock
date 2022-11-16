
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
  11:	e8 5c 02 00 00       	call   272 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 5b 02 00 00       	call   27a <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 e1 02 00 00       	call   30a <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <strcpy>:
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
  f4:	e8 99 01 00 00       	call   292 <read>
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
 132:	e8 83 01 00 00       	call   2ba <open>
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
 147:	e8 86 01 00 00       	call   2d2 <fstat>
 14c:	89 c6                	mov    %eax,%esi
  close(fd);
 14e:	89 1c 24             	mov    %ebx,(%esp)
 151:	e8 4c 01 00 00       	call   2a2 <close>
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
 21f:	e8 d1 03 00 00       	call   5f5 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 224:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 227:	83 c4 10             	add    $0x10,%esp
 22a:	eb 03                	jmp    22f <thread_create+0x1b>
      stack += 1;
 22c:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 22f:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 235:	75 f5                	jne    22c <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 237:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 23a:	52                   	push   %edx
 23b:	ff 75 10             	push   0x10(%ebp)
 23e:	ff 75 0c             	push   0xc(%ebp)
 241:	ff 75 08             	push   0x8(%ebp)
 244:	e8 d1 00 00 00       	call   31a <clone>
 
    return pid;
}
 249:	c9                   	leave  
 24a:	c3                   	ret    

0000024b <thread_join>:
int 
thread_join(){
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
 24e:	53                   	push   %ebx
 24f:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 252:	8d 45 f4             	lea    -0xc(%ebp),%eax
 255:	50                   	push   %eax
 256:	e8 c7 00 00 00       	call   322 <join>
 25b:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 25d:	83 c4 04             	add    $0x4,%esp
 260:	8b 45 f4             	mov    -0xc(%ebp),%eax
 263:	ff 70 fc             	push   -0x4(%eax)
 266:	e8 ca 02 00 00       	call   535 <free>
  return pid;
 26b:	89 d8                	mov    %ebx,%eax
 26d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 270:	c9                   	leave  
 271:	c3                   	ret    

00000272 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 272:	b8 01 00 00 00       	mov    $0x1,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <exit>:
SYSCALL(exit)
 27a:	b8 02 00 00 00       	mov    $0x2,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <wait>:
SYSCALL(wait)
 282:	b8 03 00 00 00       	mov    $0x3,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <pipe>:
SYSCALL(pipe)
 28a:	b8 04 00 00 00       	mov    $0x4,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <read>:
SYSCALL(read)
 292:	b8 05 00 00 00       	mov    $0x5,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <write>:
SYSCALL(write)
 29a:	b8 10 00 00 00       	mov    $0x10,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <close>:
SYSCALL(close)
 2a2:	b8 15 00 00 00       	mov    $0x15,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <kill>:
SYSCALL(kill)
 2aa:	b8 06 00 00 00       	mov    $0x6,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <exec>:
SYSCALL(exec)
 2b2:	b8 07 00 00 00       	mov    $0x7,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <open>:
SYSCALL(open)
 2ba:	b8 0f 00 00 00       	mov    $0xf,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <mknod>:
SYSCALL(mknod)
 2c2:	b8 11 00 00 00       	mov    $0x11,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <unlink>:
SYSCALL(unlink)
 2ca:	b8 12 00 00 00       	mov    $0x12,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <fstat>:
SYSCALL(fstat)
 2d2:	b8 08 00 00 00       	mov    $0x8,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <link>:
SYSCALL(link)
 2da:	b8 13 00 00 00       	mov    $0x13,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <mkdir>:
SYSCALL(mkdir)
 2e2:	b8 14 00 00 00       	mov    $0x14,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <chdir>:
SYSCALL(chdir)
 2ea:	b8 09 00 00 00       	mov    $0x9,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <dup>:
SYSCALL(dup)
 2f2:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <getpid>:
SYSCALL(getpid)
 2fa:	b8 0b 00 00 00       	mov    $0xb,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <sbrk>:
SYSCALL(sbrk)
 302:	b8 0c 00 00 00       	mov    $0xc,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <sleep>:
SYSCALL(sleep)
 30a:	b8 0d 00 00 00       	mov    $0xd,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <uptime>:
SYSCALL(uptime)
 312:	b8 0e 00 00 00       	mov    $0xe,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <clone>:
SYSCALL(clone)
 31a:	b8 16 00 00 00       	mov    $0x16,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <join>:
SYSCALL(join)
 322:	b8 17 00 00 00       	mov    $0x17,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 32a:	55                   	push   %ebp
 32b:	89 e5                	mov    %esp,%ebp
 32d:	83 ec 1c             	sub    $0x1c,%esp
 330:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 333:	6a 01                	push   $0x1
 335:	8d 55 f4             	lea    -0xc(%ebp),%edx
 338:	52                   	push   %edx
 339:	50                   	push   %eax
 33a:	e8 5b ff ff ff       	call   29a <write>
}
 33f:	83 c4 10             	add    $0x10,%esp
 342:	c9                   	leave  
 343:	c3                   	ret    

00000344 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	56                   	push   %esi
 349:	53                   	push   %ebx
 34a:	83 ec 2c             	sub    $0x2c,%esp
 34d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 350:	89 d0                	mov    %edx,%eax
 352:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 354:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 358:	0f 95 c1             	setne  %cl
 35b:	c1 ea 1f             	shr    $0x1f,%edx
 35e:	84 d1                	test   %dl,%cl
 360:	74 44                	je     3a6 <printint+0x62>
    neg = 1;
    x = -xx;
 362:	f7 d8                	neg    %eax
 364:	89 c1                	mov    %eax,%ecx
    neg = 1;
 366:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 36d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 372:	89 c8                	mov    %ecx,%eax
 374:	ba 00 00 00 00       	mov    $0x0,%edx
 379:	f7 f6                	div    %esi
 37b:	89 df                	mov    %ebx,%edi
 37d:	83 c3 01             	add    $0x1,%ebx
 380:	0f b6 92 dc 06 00 00 	movzbl 0x6dc(%edx),%edx
 387:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 38b:	89 ca                	mov    %ecx,%edx
 38d:	89 c1                	mov    %eax,%ecx
 38f:	39 d6                	cmp    %edx,%esi
 391:	76 df                	jbe    372 <printint+0x2e>
  if(neg)
 393:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 397:	74 31                	je     3ca <printint+0x86>
    buf[i++] = '-';
 399:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 39e:	8d 5f 02             	lea    0x2(%edi),%ebx
 3a1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a4:	eb 17                	jmp    3bd <printint+0x79>
    x = xx;
 3a6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3a8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3af:	eb bc                	jmp    36d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3b1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3b6:	89 f0                	mov    %esi,%eax
 3b8:	e8 6d ff ff ff       	call   32a <putc>
  while(--i >= 0)
 3bd:	83 eb 01             	sub    $0x1,%ebx
 3c0:	79 ef                	jns    3b1 <printint+0x6d>
}
 3c2:	83 c4 2c             	add    $0x2c,%esp
 3c5:	5b                   	pop    %ebx
 3c6:	5e                   	pop    %esi
 3c7:	5f                   	pop    %edi
 3c8:	5d                   	pop    %ebp
 3c9:	c3                   	ret    
 3ca:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3cd:	eb ee                	jmp    3bd <printint+0x79>

000003cf <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	57                   	push   %edi
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
 3d5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3d8:	8d 45 10             	lea    0x10(%ebp),%eax
 3db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3de:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3e3:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e8:	eb 14                	jmp    3fe <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3ea:	89 fa                	mov    %edi,%edx
 3ec:	8b 45 08             	mov    0x8(%ebp),%eax
 3ef:	e8 36 ff ff ff       	call   32a <putc>
 3f4:	eb 05                	jmp    3fb <printf+0x2c>
      }
    } else if(state == '%'){
 3f6:	83 fe 25             	cmp    $0x25,%esi
 3f9:	74 25                	je     420 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3fb:	83 c3 01             	add    $0x1,%ebx
 3fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 401:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 405:	84 c0                	test   %al,%al
 407:	0f 84 20 01 00 00    	je     52d <printf+0x15e>
    c = fmt[i] & 0xff;
 40d:	0f be f8             	movsbl %al,%edi
 410:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 413:	85 f6                	test   %esi,%esi
 415:	75 df                	jne    3f6 <printf+0x27>
      if(c == '%'){
 417:	83 f8 25             	cmp    $0x25,%eax
 41a:	75 ce                	jne    3ea <printf+0x1b>
        state = '%';
 41c:	89 c6                	mov    %eax,%esi
 41e:	eb db                	jmp    3fb <printf+0x2c>
      if(c == 'd'){
 420:	83 f8 25             	cmp    $0x25,%eax
 423:	0f 84 cf 00 00 00    	je     4f8 <printf+0x129>
 429:	0f 8c dd 00 00 00    	jl     50c <printf+0x13d>
 42f:	83 f8 78             	cmp    $0x78,%eax
 432:	0f 8f d4 00 00 00    	jg     50c <printf+0x13d>
 438:	83 f8 63             	cmp    $0x63,%eax
 43b:	0f 8c cb 00 00 00    	jl     50c <printf+0x13d>
 441:	83 e8 63             	sub    $0x63,%eax
 444:	83 f8 15             	cmp    $0x15,%eax
 447:	0f 87 bf 00 00 00    	ja     50c <printf+0x13d>
 44d:	ff 24 85 84 06 00 00 	jmp    *0x684(,%eax,4)
        printint(fd, *ap, 10, 1);
 454:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 457:	8b 17                	mov    (%edi),%edx
 459:	83 ec 0c             	sub    $0xc,%esp
 45c:	6a 01                	push   $0x1
 45e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	e8 d9 fe ff ff       	call   344 <printint>
        ap++;
 46b:	83 c7 04             	add    $0x4,%edi
 46e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 471:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 474:	be 00 00 00 00       	mov    $0x0,%esi
 479:	eb 80                	jmp    3fb <printf+0x2c>
        printint(fd, *ap, 16, 0);
 47b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 47e:	8b 17                	mov    (%edi),%edx
 480:	83 ec 0c             	sub    $0xc,%esp
 483:	6a 00                	push   $0x0
 485:	b9 10 00 00 00       	mov    $0x10,%ecx
 48a:	8b 45 08             	mov    0x8(%ebp),%eax
 48d:	e8 b2 fe ff ff       	call   344 <printint>
        ap++;
 492:	83 c7 04             	add    $0x4,%edi
 495:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 498:	83 c4 10             	add    $0x10,%esp
      state = 0;
 49b:	be 00 00 00 00       	mov    $0x0,%esi
 4a0:	e9 56 ff ff ff       	jmp    3fb <printf+0x2c>
        s = (char*)*ap;
 4a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a8:	8b 30                	mov    (%eax),%esi
        ap++;
 4aa:	83 c0 04             	add    $0x4,%eax
 4ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4b0:	85 f6                	test   %esi,%esi
 4b2:	75 15                	jne    4c9 <printf+0xfa>
          s = "(null)";
 4b4:	be 7c 06 00 00       	mov    $0x67c,%esi
 4b9:	eb 0e                	jmp    4c9 <printf+0xfa>
          putc(fd, *s);
 4bb:	0f be d2             	movsbl %dl,%edx
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	e8 64 fe ff ff       	call   32a <putc>
          s++;
 4c6:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4c9:	0f b6 16             	movzbl (%esi),%edx
 4cc:	84 d2                	test   %dl,%dl
 4ce:	75 eb                	jne    4bb <printf+0xec>
      state = 0;
 4d0:	be 00 00 00 00       	mov    $0x0,%esi
 4d5:	e9 21 ff ff ff       	jmp    3fb <printf+0x2c>
        putc(fd, *ap);
 4da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4dd:	0f be 17             	movsbl (%edi),%edx
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	e8 42 fe ff ff       	call   32a <putc>
        ap++;
 4e8:	83 c7 04             	add    $0x4,%edi
 4eb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4ee:	be 00 00 00 00       	mov    $0x0,%esi
 4f3:	e9 03 ff ff ff       	jmp    3fb <printf+0x2c>
        putc(fd, c);
 4f8:	89 fa                	mov    %edi,%edx
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	e8 28 fe ff ff       	call   32a <putc>
      state = 0;
 502:	be 00 00 00 00       	mov    $0x0,%esi
 507:	e9 ef fe ff ff       	jmp    3fb <printf+0x2c>
        putc(fd, '%');
 50c:	ba 25 00 00 00       	mov    $0x25,%edx
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	e8 11 fe ff ff       	call   32a <putc>
        putc(fd, c);
 519:	89 fa                	mov    %edi,%edx
 51b:	8b 45 08             	mov    0x8(%ebp),%eax
 51e:	e8 07 fe ff ff       	call   32a <putc>
      state = 0;
 523:	be 00 00 00 00       	mov    $0x0,%esi
 528:	e9 ce fe ff ff       	jmp    3fb <printf+0x2c>
    }
  }
}
 52d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 530:	5b                   	pop    %ebx
 531:	5e                   	pop    %esi
 532:	5f                   	pop    %edi
 533:	5d                   	pop    %ebp
 534:	c3                   	ret    

00000535 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 535:	55                   	push   %ebp
 536:	89 e5                	mov    %esp,%ebp
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	53                   	push   %ebx
 53b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 53e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 541:	a1 44 0a 00 00       	mov    0xa44,%eax
 546:	eb 02                	jmp    54a <free+0x15>
 548:	89 d0                	mov    %edx,%eax
 54a:	39 c8                	cmp    %ecx,%eax
 54c:	73 04                	jae    552 <free+0x1d>
 54e:	39 08                	cmp    %ecx,(%eax)
 550:	77 12                	ja     564 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 552:	8b 10                	mov    (%eax),%edx
 554:	39 c2                	cmp    %eax,%edx
 556:	77 f0                	ja     548 <free+0x13>
 558:	39 c8                	cmp    %ecx,%eax
 55a:	72 08                	jb     564 <free+0x2f>
 55c:	39 ca                	cmp    %ecx,%edx
 55e:	77 04                	ja     564 <free+0x2f>
 560:	89 d0                	mov    %edx,%eax
 562:	eb e6                	jmp    54a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 564:	8b 73 fc             	mov    -0x4(%ebx),%esi
 567:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 56a:	8b 10                	mov    (%eax),%edx
 56c:	39 d7                	cmp    %edx,%edi
 56e:	74 19                	je     589 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 570:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 573:	8b 50 04             	mov    0x4(%eax),%edx
 576:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 579:	39 ce                	cmp    %ecx,%esi
 57b:	74 1b                	je     598 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 57d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 57f:	a3 44 0a 00 00       	mov    %eax,0xa44
}
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 589:	03 72 04             	add    0x4(%edx),%esi
 58c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 58f:	8b 10                	mov    (%eax),%edx
 591:	8b 12                	mov    (%edx),%edx
 593:	89 53 f8             	mov    %edx,-0x8(%ebx)
 596:	eb db                	jmp    573 <free+0x3e>
    p->s.size += bp->s.size;
 598:	03 53 fc             	add    -0x4(%ebx),%edx
 59b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 59e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5a1:	89 10                	mov    %edx,(%eax)
 5a3:	eb da                	jmp    57f <free+0x4a>

000005a5 <morecore>:

static Header*
morecore(uint nu)
{
 5a5:	55                   	push   %ebp
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	53                   	push   %ebx
 5a9:	83 ec 04             	sub    $0x4,%esp
 5ac:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5ae:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5b3:	77 05                	ja     5ba <morecore+0x15>
    nu = 4096;
 5b5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5ba:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5c1:	83 ec 0c             	sub    $0xc,%esp
 5c4:	50                   	push   %eax
 5c5:	e8 38 fd ff ff       	call   302 <sbrk>
  if(p == (char*)-1)
 5ca:	83 c4 10             	add    $0x10,%esp
 5cd:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d0:	74 1c                	je     5ee <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5d2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5d5:	83 c0 08             	add    $0x8,%eax
 5d8:	83 ec 0c             	sub    $0xc,%esp
 5db:	50                   	push   %eax
 5dc:	e8 54 ff ff ff       	call   535 <free>
  return freep;
 5e1:	a1 44 0a 00 00       	mov    0xa44,%eax
 5e6:	83 c4 10             	add    $0x10,%esp
}
 5e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ec:	c9                   	leave  
 5ed:	c3                   	ret    
    return 0;
 5ee:	b8 00 00 00 00       	mov    $0x0,%eax
 5f3:	eb f4                	jmp    5e9 <morecore+0x44>

000005f5 <malloc>:

void*
malloc(uint nbytes)
{
 5f5:	55                   	push   %ebp
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	53                   	push   %ebx
 5f9:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	8d 58 07             	lea    0x7(%eax),%ebx
 602:	c1 eb 03             	shr    $0x3,%ebx
 605:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 608:	8b 0d 44 0a 00 00    	mov    0xa44,%ecx
 60e:	85 c9                	test   %ecx,%ecx
 610:	74 04                	je     616 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 612:	8b 01                	mov    (%ecx),%eax
 614:	eb 4a                	jmp    660 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 616:	c7 05 44 0a 00 00 48 	movl   $0xa48,0xa44
 61d:	0a 00 00 
 620:	c7 05 48 0a 00 00 48 	movl   $0xa48,0xa48
 627:	0a 00 00 
    base.s.size = 0;
 62a:	c7 05 4c 0a 00 00 00 	movl   $0x0,0xa4c
 631:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 634:	b9 48 0a 00 00       	mov    $0xa48,%ecx
 639:	eb d7                	jmp    612 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 63b:	74 19                	je     656 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 63d:	29 da                	sub    %ebx,%edx
 63f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 642:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 645:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 648:	89 0d 44 0a 00 00    	mov    %ecx,0xa44
      return (void*)(p + 1);
 64e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 651:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 654:	c9                   	leave  
 655:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 656:	8b 10                	mov    (%eax),%edx
 658:	89 11                	mov    %edx,(%ecx)
 65a:	eb ec                	jmp    648 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 65c:	89 c1                	mov    %eax,%ecx
 65e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 660:	8b 50 04             	mov    0x4(%eax),%edx
 663:	39 da                	cmp    %ebx,%edx
 665:	73 d4                	jae    63b <malloc+0x46>
    if(p == freep)
 667:	39 05 44 0a 00 00    	cmp    %eax,0xa44
 66d:	75 ed                	jne    65c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 66f:	89 d8                	mov    %ebx,%eax
 671:	e8 2f ff ff ff       	call   5a5 <morecore>
 676:	85 c0                	test   %eax,%eax
 678:	75 e2                	jne    65c <malloc+0x67>
 67a:	eb d5                	jmp    651 <malloc+0x5c>
