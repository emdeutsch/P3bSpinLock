
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
  32:	e8 dd 03 00 00       	call   414 <printf>
    exit();
  37:	e8 83 02 00 00       	call   2bf <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(unlink(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 bc 02 00 00       	call   30f <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 d8 06 00 00       	push   $0x6d8
  64:	6a 02                	push   $0x2
  66:	e8 a9 03 00 00       	call   414 <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 4c 02 00 00       	call   2bf <exit>

00000073 <strcpy>:
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
 139:	e8 99 01 00 00       	call   2d7 <read>
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
 177:	e8 83 01 00 00       	call   2ff <open>
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
 18c:	e8 86 01 00 00       	call   317 <fstat>
 191:	89 c6                	mov    %eax,%esi
  close(fd);
 193:	89 1c 24             	mov    %ebx,(%esp)
 196:	e8 4c 01 00 00       	call   2e7 <close>
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
 264:	e8 d1 03 00 00       	call   63a <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 269:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 26c:	83 c4 10             	add    $0x10,%esp
 26f:	eb 03                	jmp    274 <thread_create+0x1b>
      stack += 1;
 271:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 274:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 27a:	75 f5                	jne    271 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 27c:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 27f:	52                   	push   %edx
 280:	ff 75 10             	push   0x10(%ebp)
 283:	ff 75 0c             	push   0xc(%ebp)
 286:	ff 75 08             	push   0x8(%ebp)
 289:	e8 d1 00 00 00       	call   35f <clone>
 
    return pid;
}
 28e:	c9                   	leave  
 28f:	c3                   	ret    

00000290 <thread_join>:
int 
thread_join(){
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 297:	8d 45 f4             	lea    -0xc(%ebp),%eax
 29a:	50                   	push   %eax
 29b:	e8 c7 00 00 00       	call   367 <join>
 2a0:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 2a2:	83 c4 04             	add    $0x4,%esp
 2a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a8:	ff 70 fc             	push   -0x4(%eax)
 2ab:	e8 ca 02 00 00       	call   57a <free>
  return pid;
 2b0:	89 d8                	mov    %ebx,%eax
 2b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b5:	c9                   	leave  
 2b6:	c3                   	ret    

000002b7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b7:	b8 01 00 00 00       	mov    $0x1,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <exit>:
SYSCALL(exit)
 2bf:	b8 02 00 00 00       	mov    $0x2,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <wait>:
SYSCALL(wait)
 2c7:	b8 03 00 00 00       	mov    $0x3,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <pipe>:
SYSCALL(pipe)
 2cf:	b8 04 00 00 00       	mov    $0x4,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <read>:
SYSCALL(read)
 2d7:	b8 05 00 00 00       	mov    $0x5,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <write>:
SYSCALL(write)
 2df:	b8 10 00 00 00       	mov    $0x10,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <close>:
SYSCALL(close)
 2e7:	b8 15 00 00 00       	mov    $0x15,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <kill>:
SYSCALL(kill)
 2ef:	b8 06 00 00 00       	mov    $0x6,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <exec>:
SYSCALL(exec)
 2f7:	b8 07 00 00 00       	mov    $0x7,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <open>:
SYSCALL(open)
 2ff:	b8 0f 00 00 00       	mov    $0xf,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <mknod>:
SYSCALL(mknod)
 307:	b8 11 00 00 00       	mov    $0x11,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <unlink>:
SYSCALL(unlink)
 30f:	b8 12 00 00 00       	mov    $0x12,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <fstat>:
SYSCALL(fstat)
 317:	b8 08 00 00 00       	mov    $0x8,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <link>:
SYSCALL(link)
 31f:	b8 13 00 00 00       	mov    $0x13,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <mkdir>:
SYSCALL(mkdir)
 327:	b8 14 00 00 00       	mov    $0x14,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <chdir>:
SYSCALL(chdir)
 32f:	b8 09 00 00 00       	mov    $0x9,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <dup>:
SYSCALL(dup)
 337:	b8 0a 00 00 00       	mov    $0xa,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <getpid>:
SYSCALL(getpid)
 33f:	b8 0b 00 00 00       	mov    $0xb,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <sbrk>:
SYSCALL(sbrk)
 347:	b8 0c 00 00 00       	mov    $0xc,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <sleep>:
SYSCALL(sleep)
 34f:	b8 0d 00 00 00       	mov    $0xd,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <uptime>:
SYSCALL(uptime)
 357:	b8 0e 00 00 00       	mov    $0xe,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <clone>:
SYSCALL(clone)
 35f:	b8 16 00 00 00       	mov    $0x16,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <join>:
SYSCALL(join)
 367:	b8 17 00 00 00       	mov    $0x17,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	83 ec 1c             	sub    $0x1c,%esp
 375:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 378:	6a 01                	push   $0x1
 37a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 37d:	52                   	push   %edx
 37e:	50                   	push   %eax
 37f:	e8 5b ff ff ff       	call   2df <write>
}
 384:	83 c4 10             	add    $0x10,%esp
 387:	c9                   	leave  
 388:	c3                   	ret    

00000389 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	57                   	push   %edi
 38d:	56                   	push   %esi
 38e:	53                   	push   %ebx
 38f:	83 ec 2c             	sub    $0x2c,%esp
 392:	89 45 d0             	mov    %eax,-0x30(%ebp)
 395:	89 d0                	mov    %edx,%eax
 397:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 399:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 39d:	0f 95 c1             	setne  %cl
 3a0:	c1 ea 1f             	shr    $0x1f,%edx
 3a3:	84 d1                	test   %dl,%cl
 3a5:	74 44                	je     3eb <printint+0x62>
    neg = 1;
    x = -xx;
 3a7:	f7 d8                	neg    %eax
 3a9:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3ab:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3b2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3b7:	89 c8                	mov    %ecx,%eax
 3b9:	ba 00 00 00 00       	mov    $0x0,%edx
 3be:	f7 f6                	div    %esi
 3c0:	89 df                	mov    %ebx,%edi
 3c2:	83 c3 01             	add    $0x1,%ebx
 3c5:	0f b6 92 50 07 00 00 	movzbl 0x750(%edx),%edx
 3cc:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3d0:	89 ca                	mov    %ecx,%edx
 3d2:	89 c1                	mov    %eax,%ecx
 3d4:	39 d6                	cmp    %edx,%esi
 3d6:	76 df                	jbe    3b7 <printint+0x2e>
  if(neg)
 3d8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3dc:	74 31                	je     40f <printint+0x86>
    buf[i++] = '-';
 3de:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3e3:	8d 5f 02             	lea    0x2(%edi),%ebx
 3e6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3e9:	eb 17                	jmp    402 <printint+0x79>
    x = xx;
 3eb:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3ed:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3f4:	eb bc                	jmp    3b2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3f6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3fb:	89 f0                	mov    %esi,%eax
 3fd:	e8 6d ff ff ff       	call   36f <putc>
  while(--i >= 0)
 402:	83 eb 01             	sub    $0x1,%ebx
 405:	79 ef                	jns    3f6 <printint+0x6d>
}
 407:	83 c4 2c             	add    $0x2c,%esp
 40a:	5b                   	pop    %ebx
 40b:	5e                   	pop    %esi
 40c:	5f                   	pop    %edi
 40d:	5d                   	pop    %ebp
 40e:	c3                   	ret    
 40f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 412:	eb ee                	jmp    402 <printint+0x79>

00000414 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	57                   	push   %edi
 418:	56                   	push   %esi
 419:	53                   	push   %ebx
 41a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 41d:	8d 45 10             	lea    0x10(%ebp),%eax
 420:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 423:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 428:	bb 00 00 00 00       	mov    $0x0,%ebx
 42d:	eb 14                	jmp    443 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 42f:	89 fa                	mov    %edi,%edx
 431:	8b 45 08             	mov    0x8(%ebp),%eax
 434:	e8 36 ff ff ff       	call   36f <putc>
 439:	eb 05                	jmp    440 <printf+0x2c>
      }
    } else if(state == '%'){
 43b:	83 fe 25             	cmp    $0x25,%esi
 43e:	74 25                	je     465 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 440:	83 c3 01             	add    $0x1,%ebx
 443:	8b 45 0c             	mov    0xc(%ebp),%eax
 446:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 44a:	84 c0                	test   %al,%al
 44c:	0f 84 20 01 00 00    	je     572 <printf+0x15e>
    c = fmt[i] & 0xff;
 452:	0f be f8             	movsbl %al,%edi
 455:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 458:	85 f6                	test   %esi,%esi
 45a:	75 df                	jne    43b <printf+0x27>
      if(c == '%'){
 45c:	83 f8 25             	cmp    $0x25,%eax
 45f:	75 ce                	jne    42f <printf+0x1b>
        state = '%';
 461:	89 c6                	mov    %eax,%esi
 463:	eb db                	jmp    440 <printf+0x2c>
      if(c == 'd'){
 465:	83 f8 25             	cmp    $0x25,%eax
 468:	0f 84 cf 00 00 00    	je     53d <printf+0x129>
 46e:	0f 8c dd 00 00 00    	jl     551 <printf+0x13d>
 474:	83 f8 78             	cmp    $0x78,%eax
 477:	0f 8f d4 00 00 00    	jg     551 <printf+0x13d>
 47d:	83 f8 63             	cmp    $0x63,%eax
 480:	0f 8c cb 00 00 00    	jl     551 <printf+0x13d>
 486:	83 e8 63             	sub    $0x63,%eax
 489:	83 f8 15             	cmp    $0x15,%eax
 48c:	0f 87 bf 00 00 00    	ja     551 <printf+0x13d>
 492:	ff 24 85 f8 06 00 00 	jmp    *0x6f8(,%eax,4)
        printint(fd, *ap, 10, 1);
 499:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 49c:	8b 17                	mov    (%edi),%edx
 49e:	83 ec 0c             	sub    $0xc,%esp
 4a1:	6a 01                	push   $0x1
 4a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
 4ab:	e8 d9 fe ff ff       	call   389 <printint>
        ap++;
 4b0:	83 c7 04             	add    $0x4,%edi
 4b3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4b6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4b9:	be 00 00 00 00       	mov    $0x0,%esi
 4be:	eb 80                	jmp    440 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4c3:	8b 17                	mov    (%edi),%edx
 4c5:	83 ec 0c             	sub    $0xc,%esp
 4c8:	6a 00                	push   $0x0
 4ca:	b9 10 00 00 00       	mov    $0x10,%ecx
 4cf:	8b 45 08             	mov    0x8(%ebp),%eax
 4d2:	e8 b2 fe ff ff       	call   389 <printint>
        ap++;
 4d7:	83 c7 04             	add    $0x4,%edi
 4da:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4dd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4e0:	be 00 00 00 00       	mov    $0x0,%esi
 4e5:	e9 56 ff ff ff       	jmp    440 <printf+0x2c>
        s = (char*)*ap;
 4ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ed:	8b 30                	mov    (%eax),%esi
        ap++;
 4ef:	83 c0 04             	add    $0x4,%eax
 4f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4f5:	85 f6                	test   %esi,%esi
 4f7:	75 15                	jne    50e <printf+0xfa>
          s = "(null)";
 4f9:	be f1 06 00 00       	mov    $0x6f1,%esi
 4fe:	eb 0e                	jmp    50e <printf+0xfa>
          putc(fd, *s);
 500:	0f be d2             	movsbl %dl,%edx
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	e8 64 fe ff ff       	call   36f <putc>
          s++;
 50b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 50e:	0f b6 16             	movzbl (%esi),%edx
 511:	84 d2                	test   %dl,%dl
 513:	75 eb                	jne    500 <printf+0xec>
      state = 0;
 515:	be 00 00 00 00       	mov    $0x0,%esi
 51a:	e9 21 ff ff ff       	jmp    440 <printf+0x2c>
        putc(fd, *ap);
 51f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 522:	0f be 17             	movsbl (%edi),%edx
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	e8 42 fe ff ff       	call   36f <putc>
        ap++;
 52d:	83 c7 04             	add    $0x4,%edi
 530:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 533:	be 00 00 00 00       	mov    $0x0,%esi
 538:	e9 03 ff ff ff       	jmp    440 <printf+0x2c>
        putc(fd, c);
 53d:	89 fa                	mov    %edi,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	e8 28 fe ff ff       	call   36f <putc>
      state = 0;
 547:	be 00 00 00 00       	mov    $0x0,%esi
 54c:	e9 ef fe ff ff       	jmp    440 <printf+0x2c>
        putc(fd, '%');
 551:	ba 25 00 00 00       	mov    $0x25,%edx
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	e8 11 fe ff ff       	call   36f <putc>
        putc(fd, c);
 55e:	89 fa                	mov    %edi,%edx
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	e8 07 fe ff ff       	call   36f <putc>
      state = 0;
 568:	be 00 00 00 00       	mov    $0x0,%esi
 56d:	e9 ce fe ff ff       	jmp    440 <printf+0x2c>
    }
  }
}
 572:	8d 65 f4             	lea    -0xc(%ebp),%esp
 575:	5b                   	pop    %ebx
 576:	5e                   	pop    %esi
 577:	5f                   	pop    %edi
 578:	5d                   	pop    %ebp
 579:	c3                   	ret    

0000057a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 57a:	55                   	push   %ebp
 57b:	89 e5                	mov    %esp,%ebp
 57d:	57                   	push   %edi
 57e:	56                   	push   %esi
 57f:	53                   	push   %ebx
 580:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 583:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 586:	a1 c4 0a 00 00       	mov    0xac4,%eax
 58b:	eb 02                	jmp    58f <free+0x15>
 58d:	89 d0                	mov    %edx,%eax
 58f:	39 c8                	cmp    %ecx,%eax
 591:	73 04                	jae    597 <free+0x1d>
 593:	39 08                	cmp    %ecx,(%eax)
 595:	77 12                	ja     5a9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 597:	8b 10                	mov    (%eax),%edx
 599:	39 c2                	cmp    %eax,%edx
 59b:	77 f0                	ja     58d <free+0x13>
 59d:	39 c8                	cmp    %ecx,%eax
 59f:	72 08                	jb     5a9 <free+0x2f>
 5a1:	39 ca                	cmp    %ecx,%edx
 5a3:	77 04                	ja     5a9 <free+0x2f>
 5a5:	89 d0                	mov    %edx,%eax
 5a7:	eb e6                	jmp    58f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5a9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ac:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5af:	8b 10                	mov    (%eax),%edx
 5b1:	39 d7                	cmp    %edx,%edi
 5b3:	74 19                	je     5ce <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5b5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5b8:	8b 50 04             	mov    0x4(%eax),%edx
 5bb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5be:	39 ce                	cmp    %ecx,%esi
 5c0:	74 1b                	je     5dd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5c2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5c4:	a3 c4 0a 00 00       	mov    %eax,0xac4
}
 5c9:	5b                   	pop    %ebx
 5ca:	5e                   	pop    %esi
 5cb:	5f                   	pop    %edi
 5cc:	5d                   	pop    %ebp
 5cd:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5ce:	03 72 04             	add    0x4(%edx),%esi
 5d1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5d4:	8b 10                	mov    (%eax),%edx
 5d6:	8b 12                	mov    (%edx),%edx
 5d8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5db:	eb db                	jmp    5b8 <free+0x3e>
    p->s.size += bp->s.size;
 5dd:	03 53 fc             	add    -0x4(%ebx),%edx
 5e0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5e3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5e6:	89 10                	mov    %edx,(%eax)
 5e8:	eb da                	jmp    5c4 <free+0x4a>

000005ea <morecore>:

static Header*
morecore(uint nu)
{
 5ea:	55                   	push   %ebp
 5eb:	89 e5                	mov    %esp,%ebp
 5ed:	53                   	push   %ebx
 5ee:	83 ec 04             	sub    $0x4,%esp
 5f1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5f3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5f8:	77 05                	ja     5ff <morecore+0x15>
    nu = 4096;
 5fa:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5ff:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 606:	83 ec 0c             	sub    $0xc,%esp
 609:	50                   	push   %eax
 60a:	e8 38 fd ff ff       	call   347 <sbrk>
  if(p == (char*)-1)
 60f:	83 c4 10             	add    $0x10,%esp
 612:	83 f8 ff             	cmp    $0xffffffff,%eax
 615:	74 1c                	je     633 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 617:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 61a:	83 c0 08             	add    $0x8,%eax
 61d:	83 ec 0c             	sub    $0xc,%esp
 620:	50                   	push   %eax
 621:	e8 54 ff ff ff       	call   57a <free>
  return freep;
 626:	a1 c4 0a 00 00       	mov    0xac4,%eax
 62b:	83 c4 10             	add    $0x10,%esp
}
 62e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 631:	c9                   	leave  
 632:	c3                   	ret    
    return 0;
 633:	b8 00 00 00 00       	mov    $0x0,%eax
 638:	eb f4                	jmp    62e <morecore+0x44>

0000063a <malloc>:

void*
malloc(uint nbytes)
{
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
 63d:	53                   	push   %ebx
 63e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 641:	8b 45 08             	mov    0x8(%ebp),%eax
 644:	8d 58 07             	lea    0x7(%eax),%ebx
 647:	c1 eb 03             	shr    $0x3,%ebx
 64a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 64d:	8b 0d c4 0a 00 00    	mov    0xac4,%ecx
 653:	85 c9                	test   %ecx,%ecx
 655:	74 04                	je     65b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 657:	8b 01                	mov    (%ecx),%eax
 659:	eb 4a                	jmp    6a5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 65b:	c7 05 c4 0a 00 00 c8 	movl   $0xac8,0xac4
 662:	0a 00 00 
 665:	c7 05 c8 0a 00 00 c8 	movl   $0xac8,0xac8
 66c:	0a 00 00 
    base.s.size = 0;
 66f:	c7 05 cc 0a 00 00 00 	movl   $0x0,0xacc
 676:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 679:	b9 c8 0a 00 00       	mov    $0xac8,%ecx
 67e:	eb d7                	jmp    657 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 680:	74 19                	je     69b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 682:	29 da                	sub    %ebx,%edx
 684:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 687:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 68a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 68d:	89 0d c4 0a 00 00    	mov    %ecx,0xac4
      return (void*)(p + 1);
 693:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 696:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 699:	c9                   	leave  
 69a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 69b:	8b 10                	mov    (%eax),%edx
 69d:	89 11                	mov    %edx,(%ecx)
 69f:	eb ec                	jmp    68d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a1:	89 c1                	mov    %eax,%ecx
 6a3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6a5:	8b 50 04             	mov    0x4(%eax),%edx
 6a8:	39 da                	cmp    %ebx,%edx
 6aa:	73 d4                	jae    680 <malloc+0x46>
    if(p == freep)
 6ac:	39 05 c4 0a 00 00    	cmp    %eax,0xac4
 6b2:	75 ed                	jne    6a1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6b4:	89 d8                	mov    %ebx,%eax
 6b6:	e8 2f ff ff ff       	call   5ea <morecore>
 6bb:	85 c0                	test   %eax,%eax
 6bd:	75 e2                	jne    6a1 <malloc+0x67>
 6bf:	eb d5                	jmp    696 <malloc+0x5c>
