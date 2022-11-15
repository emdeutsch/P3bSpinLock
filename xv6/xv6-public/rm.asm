
_rm:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: rm files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 c4 06 00 00       	push   $0x6c4
  30:	6a 02                	push   $0x2
  32:	e8 de 03 00 00       	call   415 <printf>
    exit();
  37:	e8 84 02 00 00       	call   2c0 <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(unlink(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 bd 02 00 00       	call   310 <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 d8 06 00 00       	push   $0x6d8
  64:	6a 02                	push   $0x2
  66:	e8 aa 03 00 00       	call   415 <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 4d 02 00 00       	call   2c0 <exit>

00000073 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	56                   	push   %esi
  77:	53                   	push   %ebx
  78:	8b 75 08             	mov    0x8(%ebp),%esi
  7b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7e:	89 f0                	mov    %esi,%eax
  80:	89 d1                	mov    %edx,%ecx
  82:	83 c2 01             	add    $0x1,%edx
  85:	89 c3                	mov    %eax,%ebx
  87:	83 c0 01             	add    $0x1,%eax
  8a:	0f b6 09             	movzbl (%ecx),%ecx
  8d:	88 0b                	mov    %cl,(%ebx)
  8f:	84 c9                	test   %cl,%cl
  91:	75 ed                	jne    80 <strcpy+0xd>
    ;
  return os;
}
  93:	89 f0                	mov    %esi,%eax
  95:	5b                   	pop    %ebx
  96:	5e                   	pop    %esi
  97:	5d                   	pop    %ebp
  98:	c3                   	ret    

00000099 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  99:	55                   	push   %ebp
  9a:	89 e5                	mov    %esp,%ebp
  9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  a2:	eb 06                	jmp    aa <strcmp+0x11>
    p++, q++;
  a4:	83 c1 01             	add    $0x1,%ecx
  a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  aa:	0f b6 01             	movzbl (%ecx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 04                	je     b5 <strcmp+0x1c>
  b1:	3a 02                	cmp    (%edx),%al
  b3:	74 ef                	je     a4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	0f b6 12             	movzbl (%edx),%edx
  bb:	29 d0                	sub    %edx,%eax
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <strlen>:

uint
strlen(const char *s)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  c5:	b8 00 00 00 00       	mov    $0x0,%eax
  ca:	eb 03                	jmp    cf <strlen+0x10>
  cc:	83 c0 01             	add    $0x1,%eax
  cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  d3:	75 f7                	jne    cc <strlen+0xd>
    ;
  return n;
}
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    

000000d7 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d7:	55                   	push   %ebp
  d8:	89 e5                	mov    %esp,%ebp
  da:	57                   	push   %edi
  db:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  de:	89 d7                	mov    %edx,%edi
  e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  e6:	fc                   	cld    
  e7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e9:	89 d0                	mov    %edx,%eax
  eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ee:	c9                   	leave  
  ef:	c3                   	ret    

000000f0 <strchr>:

char*
strchr(const char *s, char c)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  fa:	eb 03                	jmp    ff <strchr+0xf>
  fc:	83 c0 01             	add    $0x1,%eax
  ff:	0f b6 10             	movzbl (%eax),%edx
 102:	84 d2                	test   %dl,%dl
 104:	74 06                	je     10c <strchr+0x1c>
    if(*s == c)
 106:	38 ca                	cmp    %cl,%dl
 108:	75 f2                	jne    fc <strchr+0xc>
 10a:	eb 05                	jmp    111 <strchr+0x21>
      return (char*)s;
  return 0;
 10c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <gets>:

char*
gets(char *buf, int max)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	56                   	push   %esi
 118:	53                   	push   %ebx
 119:	83 ec 1c             	sub    $0x1c,%esp
 11c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11f:	bb 00 00 00 00       	mov    $0x0,%ebx
 124:	89 de                	mov    %ebx,%esi
 126:	83 c3 01             	add    $0x1,%ebx
 129:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12c:	7d 2e                	jge    15c <gets+0x49>
    cc = read(0, &c, 1);
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	6a 01                	push   $0x1
 133:	8d 45 e7             	lea    -0x19(%ebp),%eax
 136:	50                   	push   %eax
 137:	6a 00                	push   $0x0
 139:	e8 9a 01 00 00       	call   2d8 <read>
    if(cc < 1)
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	7e 17                	jle    15c <gets+0x49>
      break;
    buf[i++] = c;
 145:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 149:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14c:	3c 0a                	cmp    $0xa,%al
 14e:	0f 94 c2             	sete   %dl
 151:	3c 0d                	cmp    $0xd,%al
 153:	0f 94 c0             	sete   %al
 156:	08 c2                	or     %al,%dl
 158:	74 ca                	je     124 <gets+0x11>
    buf[i++] = c;
 15a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 160:	89 f8                	mov    %edi,%eax
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <stat>:

int
stat(const char *n, struct stat *st)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	56                   	push   %esi
 16e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	6a 00                	push   $0x0
 174:	ff 75 08             	push   0x8(%ebp)
 177:	e8 84 01 00 00       	call   300 <open>
  if(fd < 0)
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	85 c0                	test   %eax,%eax
 181:	78 24                	js     1a7 <stat+0x3d>
 183:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 185:	83 ec 08             	sub    $0x8,%esp
 188:	ff 75 0c             	push   0xc(%ebp)
 18b:	50                   	push   %eax
 18c:	e8 87 01 00 00       	call   318 <fstat>
 191:	89 c6                	mov    %eax,%esi
  close(fd);
 193:	89 1c 24             	mov    %ebx,(%esp)
 196:	e8 4d 01 00 00       	call   2e8 <close>
  return r;
 19b:	83 c4 10             	add    $0x10,%esp
}
 19e:	89 f0                	mov    %esi,%eax
 1a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a3:	5b                   	pop    %ebx
 1a4:	5e                   	pop    %esi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
    return -1;
 1a7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1ac:	eb f0                	jmp    19e <stat+0x34>

000001ae <atoi>:

int
atoi(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	53                   	push   %ebx
 1b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1b5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1ba:	eb 10                	jmp    1cc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1bc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1bf:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1c2:	83 c1 01             	add    $0x1,%ecx
 1c5:	0f be c0             	movsbl %al,%eax
 1c8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1cc:	0f b6 01             	movzbl (%ecx),%eax
 1cf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1d2:	80 fb 09             	cmp    $0x9,%bl
 1d5:	76 e5                	jbe    1bc <atoi+0xe>
  return n;
}
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1dc:	c9                   	leave  
 1dd:	c3                   	ret    

000001de <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	56                   	push   %esi
 1e2:	53                   	push   %ebx
 1e3:	8b 75 08             	mov    0x8(%ebp),%esi
 1e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1e9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1ee:	eb 0d                	jmp    1fd <memmove+0x1f>
    *dst++ = *src++;
 1f0:	0f b6 01             	movzbl (%ecx),%eax
 1f3:	88 02                	mov    %al,(%edx)
 1f5:	8d 49 01             	lea    0x1(%ecx),%ecx
 1f8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1fb:	89 d8                	mov    %ebx,%eax
 1fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 200:	85 c0                	test   %eax,%eax
 202:	7f ec                	jg     1f0 <memmove+0x12>
  return vdst;
}
 204:	89 f0                	mov    %esi,%eax
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5d                   	pop    %ebp
 209:	c3                   	ret    

0000020a <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 210:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 212:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 215:	89 08                	mov    %ecx,(%eax)
  return old;
}
 217:	89 d0                	mov    %edx,%eax
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    

0000021b <lock_init>:
void 
lock_init(lock_t *lock){
 21b:	55                   	push   %ebp
 21c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret    

00000229 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	53                   	push   %ebx
 22d:	83 ec 04             	sub    $0x4,%esp
 230:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 233:	83 ec 08             	sub    $0x8,%esp
 236:	6a 01                	push   $0x1
 238:	53                   	push   %ebx
 239:	e8 cc ff ff ff       	call   20a <TestAndSet>
 23e:	83 c4 10             	add    $0x10,%esp
 241:	83 f8 01             	cmp    $0x1,%eax
 244:	74 ed                	je     233 <lock_acquire+0xa>
    ;
}
 246:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 249:	c9                   	leave  
 24a:	c3                   	ret    

0000024b <lock_release>:
void 
lock_release(lock_t *lock){
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    

00000259 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 25f:	68 04 20 00 00       	push   $0x2004
 264:	e8 d2 03 00 00       	call   63b <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 269:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 26c:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 26e:	eb 03                	jmp    273 <thread_create+0x1a>
      stack += 1;
 270:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 273:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 279:	75 f5                	jne    270 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 27b:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 27d:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 280:	52                   	push   %edx
 281:	ff 75 10             	push   0x10(%ebp)
 284:	ff 75 0c             	push   0xc(%ebp)
 287:	ff 75 08             	push   0x8(%ebp)
 28a:	e8 d1 00 00 00       	call   360 <clone>
 
    return pid;
}
 28f:	c9                   	leave  
 290:	c3                   	ret    

00000291 <thread_join>:
int 
thread_join(){
 291:	55                   	push   %ebp
 292:	89 e5                	mov    %esp,%ebp
 294:	53                   	push   %ebx
 295:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 298:	8d 45 f4             	lea    -0xc(%ebp),%eax
 29b:	50                   	push   %eax
 29c:	e8 c7 00 00 00       	call   368 <join>
 2a1:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 2a3:	83 c4 04             	add    $0x4,%esp
 2a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a9:	ff 70 fc             	push   -0x4(%eax)
 2ac:	e8 ca 02 00 00       	call   57b <free>
  return waitedForPID;
 2b1:	89 d8                	mov    %ebx,%eax
 2b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b8:	b8 01 00 00 00       	mov    $0x1,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <exit>:
SYSCALL(exit)
 2c0:	b8 02 00 00 00       	mov    $0x2,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <wait>:
SYSCALL(wait)
 2c8:	b8 03 00 00 00       	mov    $0x3,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <pipe>:
SYSCALL(pipe)
 2d0:	b8 04 00 00 00       	mov    $0x4,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <read>:
SYSCALL(read)
 2d8:	b8 05 00 00 00       	mov    $0x5,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <write>:
SYSCALL(write)
 2e0:	b8 10 00 00 00       	mov    $0x10,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <close>:
SYSCALL(close)
 2e8:	b8 15 00 00 00       	mov    $0x15,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <kill>:
SYSCALL(kill)
 2f0:	b8 06 00 00 00       	mov    $0x6,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <exec>:
SYSCALL(exec)
 2f8:	b8 07 00 00 00       	mov    $0x7,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <open>:
SYSCALL(open)
 300:	b8 0f 00 00 00       	mov    $0xf,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <mknod>:
SYSCALL(mknod)
 308:	b8 11 00 00 00       	mov    $0x11,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <unlink>:
SYSCALL(unlink)
 310:	b8 12 00 00 00       	mov    $0x12,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <fstat>:
SYSCALL(fstat)
 318:	b8 08 00 00 00       	mov    $0x8,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <link>:
SYSCALL(link)
 320:	b8 13 00 00 00       	mov    $0x13,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <mkdir>:
SYSCALL(mkdir)
 328:	b8 14 00 00 00       	mov    $0x14,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <chdir>:
SYSCALL(chdir)
 330:	b8 09 00 00 00       	mov    $0x9,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <dup>:
SYSCALL(dup)
 338:	b8 0a 00 00 00       	mov    $0xa,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <getpid>:
SYSCALL(getpid)
 340:	b8 0b 00 00 00       	mov    $0xb,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <sbrk>:
SYSCALL(sbrk)
 348:	b8 0c 00 00 00       	mov    $0xc,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <sleep>:
SYSCALL(sleep)
 350:	b8 0d 00 00 00       	mov    $0xd,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <uptime>:
SYSCALL(uptime)
 358:	b8 0e 00 00 00       	mov    $0xe,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <clone>:
SYSCALL(clone)
 360:	b8 16 00 00 00       	mov    $0x16,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <join>:
SYSCALL(join)
 368:	b8 17 00 00 00       	mov    $0x17,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	83 ec 1c             	sub    $0x1c,%esp
 376:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 379:	6a 01                	push   $0x1
 37b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 37e:	52                   	push   %edx
 37f:	50                   	push   %eax
 380:	e8 5b ff ff ff       	call   2e0 <write>
}
 385:	83 c4 10             	add    $0x10,%esp
 388:	c9                   	leave  
 389:	c3                   	ret    

0000038a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	57                   	push   %edi
 38e:	56                   	push   %esi
 38f:	53                   	push   %ebx
 390:	83 ec 2c             	sub    $0x2c,%esp
 393:	89 45 d0             	mov    %eax,-0x30(%ebp)
 396:	89 d0                	mov    %edx,%eax
 398:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 39a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 39e:	0f 95 c1             	setne  %cl
 3a1:	c1 ea 1f             	shr    $0x1f,%edx
 3a4:	84 d1                	test   %dl,%cl
 3a6:	74 44                	je     3ec <printint+0x62>
    neg = 1;
    x = -xx;
 3a8:	f7 d8                	neg    %eax
 3aa:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3ac:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3b3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3b8:	89 c8                	mov    %ecx,%eax
 3ba:	ba 00 00 00 00       	mov    $0x0,%edx
 3bf:	f7 f6                	div    %esi
 3c1:	89 df                	mov    %ebx,%edi
 3c3:	83 c3 01             	add    $0x1,%ebx
 3c6:	0f b6 92 50 07 00 00 	movzbl 0x750(%edx),%edx
 3cd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3d1:	89 ca                	mov    %ecx,%edx
 3d3:	89 c1                	mov    %eax,%ecx
 3d5:	39 d6                	cmp    %edx,%esi
 3d7:	76 df                	jbe    3b8 <printint+0x2e>
  if(neg)
 3d9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3dd:	74 31                	je     410 <printint+0x86>
    buf[i++] = '-';
 3df:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3e4:	8d 5f 02             	lea    0x2(%edi),%ebx
 3e7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ea:	eb 17                	jmp    403 <printint+0x79>
    x = xx;
 3ec:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3ee:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3f5:	eb bc                	jmp    3b3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3f7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3fc:	89 f0                	mov    %esi,%eax
 3fe:	e8 6d ff ff ff       	call   370 <putc>
  while(--i >= 0)
 403:	83 eb 01             	sub    $0x1,%ebx
 406:	79 ef                	jns    3f7 <printint+0x6d>
}
 408:	83 c4 2c             	add    $0x2c,%esp
 40b:	5b                   	pop    %ebx
 40c:	5e                   	pop    %esi
 40d:	5f                   	pop    %edi
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    
 410:	8b 75 d0             	mov    -0x30(%ebp),%esi
 413:	eb ee                	jmp    403 <printint+0x79>

00000415 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	57                   	push   %edi
 419:	56                   	push   %esi
 41a:	53                   	push   %ebx
 41b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 41e:	8d 45 10             	lea    0x10(%ebp),%eax
 421:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 424:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 429:	bb 00 00 00 00       	mov    $0x0,%ebx
 42e:	eb 14                	jmp    444 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 430:	89 fa                	mov    %edi,%edx
 432:	8b 45 08             	mov    0x8(%ebp),%eax
 435:	e8 36 ff ff ff       	call   370 <putc>
 43a:	eb 05                	jmp    441 <printf+0x2c>
      }
    } else if(state == '%'){
 43c:	83 fe 25             	cmp    $0x25,%esi
 43f:	74 25                	je     466 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 441:	83 c3 01             	add    $0x1,%ebx
 444:	8b 45 0c             	mov    0xc(%ebp),%eax
 447:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 44b:	84 c0                	test   %al,%al
 44d:	0f 84 20 01 00 00    	je     573 <printf+0x15e>
    c = fmt[i] & 0xff;
 453:	0f be f8             	movsbl %al,%edi
 456:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 459:	85 f6                	test   %esi,%esi
 45b:	75 df                	jne    43c <printf+0x27>
      if(c == '%'){
 45d:	83 f8 25             	cmp    $0x25,%eax
 460:	75 ce                	jne    430 <printf+0x1b>
        state = '%';
 462:	89 c6                	mov    %eax,%esi
 464:	eb db                	jmp    441 <printf+0x2c>
      if(c == 'd'){
 466:	83 f8 25             	cmp    $0x25,%eax
 469:	0f 84 cf 00 00 00    	je     53e <printf+0x129>
 46f:	0f 8c dd 00 00 00    	jl     552 <printf+0x13d>
 475:	83 f8 78             	cmp    $0x78,%eax
 478:	0f 8f d4 00 00 00    	jg     552 <printf+0x13d>
 47e:	83 f8 63             	cmp    $0x63,%eax
 481:	0f 8c cb 00 00 00    	jl     552 <printf+0x13d>
 487:	83 e8 63             	sub    $0x63,%eax
 48a:	83 f8 15             	cmp    $0x15,%eax
 48d:	0f 87 bf 00 00 00    	ja     552 <printf+0x13d>
 493:	ff 24 85 f8 06 00 00 	jmp    *0x6f8(,%eax,4)
        printint(fd, *ap, 10, 1);
 49a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 49d:	8b 17                	mov    (%edi),%edx
 49f:	83 ec 0c             	sub    $0xc,%esp
 4a2:	6a 01                	push   $0x1
 4a4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ac:	e8 d9 fe ff ff       	call   38a <printint>
        ap++;
 4b1:	83 c7 04             	add    $0x4,%edi
 4b4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4b7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ba:	be 00 00 00 00       	mov    $0x0,%esi
 4bf:	eb 80                	jmp    441 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4c4:	8b 17                	mov    (%edi),%edx
 4c6:	83 ec 0c             	sub    $0xc,%esp
 4c9:	6a 00                	push   $0x0
 4cb:	b9 10 00 00 00       	mov    $0x10,%ecx
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
 4d3:	e8 b2 fe ff ff       	call   38a <printint>
        ap++;
 4d8:	83 c7 04             	add    $0x4,%edi
 4db:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4de:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4e1:	be 00 00 00 00       	mov    $0x0,%esi
 4e6:	e9 56 ff ff ff       	jmp    441 <printf+0x2c>
        s = (char*)*ap;
 4eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ee:	8b 30                	mov    (%eax),%esi
        ap++;
 4f0:	83 c0 04             	add    $0x4,%eax
 4f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4f6:	85 f6                	test   %esi,%esi
 4f8:	75 15                	jne    50f <printf+0xfa>
          s = "(null)";
 4fa:	be f1 06 00 00       	mov    $0x6f1,%esi
 4ff:	eb 0e                	jmp    50f <printf+0xfa>
          putc(fd, *s);
 501:	0f be d2             	movsbl %dl,%edx
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	e8 64 fe ff ff       	call   370 <putc>
          s++;
 50c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 50f:	0f b6 16             	movzbl (%esi),%edx
 512:	84 d2                	test   %dl,%dl
 514:	75 eb                	jne    501 <printf+0xec>
      state = 0;
 516:	be 00 00 00 00       	mov    $0x0,%esi
 51b:	e9 21 ff ff ff       	jmp    441 <printf+0x2c>
        putc(fd, *ap);
 520:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 523:	0f be 17             	movsbl (%edi),%edx
 526:	8b 45 08             	mov    0x8(%ebp),%eax
 529:	e8 42 fe ff ff       	call   370 <putc>
        ap++;
 52e:	83 c7 04             	add    $0x4,%edi
 531:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 534:	be 00 00 00 00       	mov    $0x0,%esi
 539:	e9 03 ff ff ff       	jmp    441 <printf+0x2c>
        putc(fd, c);
 53e:	89 fa                	mov    %edi,%edx
 540:	8b 45 08             	mov    0x8(%ebp),%eax
 543:	e8 28 fe ff ff       	call   370 <putc>
      state = 0;
 548:	be 00 00 00 00       	mov    $0x0,%esi
 54d:	e9 ef fe ff ff       	jmp    441 <printf+0x2c>
        putc(fd, '%');
 552:	ba 25 00 00 00       	mov    $0x25,%edx
 557:	8b 45 08             	mov    0x8(%ebp),%eax
 55a:	e8 11 fe ff ff       	call   370 <putc>
        putc(fd, c);
 55f:	89 fa                	mov    %edi,%edx
 561:	8b 45 08             	mov    0x8(%ebp),%eax
 564:	e8 07 fe ff ff       	call   370 <putc>
      state = 0;
 569:	be 00 00 00 00       	mov    $0x0,%esi
 56e:	e9 ce fe ff ff       	jmp    441 <printf+0x2c>
    }
  }
}
 573:	8d 65 f4             	lea    -0xc(%ebp),%esp
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5f                   	pop    %edi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret    

0000057b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 57b:	55                   	push   %ebp
 57c:	89 e5                	mov    %esp,%ebp
 57e:	57                   	push   %edi
 57f:	56                   	push   %esi
 580:	53                   	push   %ebx
 581:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 584:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 587:	a1 c4 0a 00 00       	mov    0xac4,%eax
 58c:	eb 02                	jmp    590 <free+0x15>
 58e:	89 d0                	mov    %edx,%eax
 590:	39 c8                	cmp    %ecx,%eax
 592:	73 04                	jae    598 <free+0x1d>
 594:	39 08                	cmp    %ecx,(%eax)
 596:	77 12                	ja     5aa <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 598:	8b 10                	mov    (%eax),%edx
 59a:	39 c2                	cmp    %eax,%edx
 59c:	77 f0                	ja     58e <free+0x13>
 59e:	39 c8                	cmp    %ecx,%eax
 5a0:	72 08                	jb     5aa <free+0x2f>
 5a2:	39 ca                	cmp    %ecx,%edx
 5a4:	77 04                	ja     5aa <free+0x2f>
 5a6:	89 d0                	mov    %edx,%eax
 5a8:	eb e6                	jmp    590 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5aa:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ad:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5b0:	8b 10                	mov    (%eax),%edx
 5b2:	39 d7                	cmp    %edx,%edi
 5b4:	74 19                	je     5cf <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5b6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5b9:	8b 50 04             	mov    0x4(%eax),%edx
 5bc:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5bf:	39 ce                	cmp    %ecx,%esi
 5c1:	74 1b                	je     5de <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5c3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5c5:	a3 c4 0a 00 00       	mov    %eax,0xac4
}
 5ca:	5b                   	pop    %ebx
 5cb:	5e                   	pop    %esi
 5cc:	5f                   	pop    %edi
 5cd:	5d                   	pop    %ebp
 5ce:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5cf:	03 72 04             	add    0x4(%edx),%esi
 5d2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5d5:	8b 10                	mov    (%eax),%edx
 5d7:	8b 12                	mov    (%edx),%edx
 5d9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5dc:	eb db                	jmp    5b9 <free+0x3e>
    p->s.size += bp->s.size;
 5de:	03 53 fc             	add    -0x4(%ebx),%edx
 5e1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5e4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5e7:	89 10                	mov    %edx,(%eax)
 5e9:	eb da                	jmp    5c5 <free+0x4a>

000005eb <morecore>:

static Header*
morecore(uint nu)
{
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	53                   	push   %ebx
 5ef:	83 ec 04             	sub    $0x4,%esp
 5f2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5f4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5f9:	77 05                	ja     600 <morecore+0x15>
    nu = 4096;
 5fb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 600:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 607:	83 ec 0c             	sub    $0xc,%esp
 60a:	50                   	push   %eax
 60b:	e8 38 fd ff ff       	call   348 <sbrk>
  if(p == (char*)-1)
 610:	83 c4 10             	add    $0x10,%esp
 613:	83 f8 ff             	cmp    $0xffffffff,%eax
 616:	74 1c                	je     634 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 618:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 61b:	83 c0 08             	add    $0x8,%eax
 61e:	83 ec 0c             	sub    $0xc,%esp
 621:	50                   	push   %eax
 622:	e8 54 ff ff ff       	call   57b <free>
  return freep;
 627:	a1 c4 0a 00 00       	mov    0xac4,%eax
 62c:	83 c4 10             	add    $0x10,%esp
}
 62f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 632:	c9                   	leave  
 633:	c3                   	ret    
    return 0;
 634:	b8 00 00 00 00       	mov    $0x0,%eax
 639:	eb f4                	jmp    62f <morecore+0x44>

0000063b <malloc>:

void*
malloc(uint nbytes)
{
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	53                   	push   %ebx
 63f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 642:	8b 45 08             	mov    0x8(%ebp),%eax
 645:	8d 58 07             	lea    0x7(%eax),%ebx
 648:	c1 eb 03             	shr    $0x3,%ebx
 64b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 64e:	8b 0d c4 0a 00 00    	mov    0xac4,%ecx
 654:	85 c9                	test   %ecx,%ecx
 656:	74 04                	je     65c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 658:	8b 01                	mov    (%ecx),%eax
 65a:	eb 4a                	jmp    6a6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 65c:	c7 05 c4 0a 00 00 c8 	movl   $0xac8,0xac4
 663:	0a 00 00 
 666:	c7 05 c8 0a 00 00 c8 	movl   $0xac8,0xac8
 66d:	0a 00 00 
    base.s.size = 0;
 670:	c7 05 cc 0a 00 00 00 	movl   $0x0,0xacc
 677:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 67a:	b9 c8 0a 00 00       	mov    $0xac8,%ecx
 67f:	eb d7                	jmp    658 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 681:	74 19                	je     69c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 683:	29 da                	sub    %ebx,%edx
 685:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 688:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 68b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 68e:	89 0d c4 0a 00 00    	mov    %ecx,0xac4
      return (void*)(p + 1);
 694:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 697:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 69a:	c9                   	leave  
 69b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 69c:	8b 10                	mov    (%eax),%edx
 69e:	89 11                	mov    %edx,(%ecx)
 6a0:	eb ec                	jmp    68e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a2:	89 c1                	mov    %eax,%ecx
 6a4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6a6:	8b 50 04             	mov    0x4(%eax),%edx
 6a9:	39 da                	cmp    %ebx,%edx
 6ab:	73 d4                	jae    681 <malloc+0x46>
    if(p == freep)
 6ad:	39 05 c4 0a 00 00    	cmp    %eax,0xac4
 6b3:	75 ed                	jne    6a2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6b5:	89 d8                	mov    %ebx,%eax
 6b7:	e8 2f ff ff ff       	call   5eb <morecore>
 6bc:	85 c0                	test   %eax,%eax
 6be:	75 e2                	jne    6a2 <malloc+0x67>
 6c0:	eb d5                	jmp    697 <malloc+0x5c>
