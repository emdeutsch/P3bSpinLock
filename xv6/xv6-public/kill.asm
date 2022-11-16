
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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

  if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
    printf(2, "usage: kill pid...\n");
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 ac 06 00 00       	push   $0x6ac
  2d:	6a 02                	push   $0x2
  2f:	e8 c8 03 00 00       	call   3fc <printf>
    exit();
  34:	e8 6e 02 00 00       	call   2a7 <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 52 01 00 00       	call   196 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 8b 02 00 00       	call   2d7 <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 4c 02 00 00       	call   2a7 <exit>

0000005b <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	56                   	push   %esi
  5f:	53                   	push   %ebx
  60:	8b 75 08             	mov    0x8(%ebp),%esi
  63:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  66:	89 f0                	mov    %esi,%eax
  68:	89 d1                	mov    %edx,%ecx
  6a:	83 c2 01             	add    $0x1,%edx
  6d:	89 c3                	mov    %eax,%ebx
  6f:	83 c0 01             	add    $0x1,%eax
  72:	0f b6 09             	movzbl (%ecx),%ecx
  75:	88 0b                	mov    %cl,(%ebx)
  77:	84 c9                	test   %cl,%cl
  79:	75 ed                	jne    68 <strcpy+0xd>
    ;
  return os;
}
  7b:	89 f0                	mov    %esi,%eax
  7d:	5b                   	pop    %ebx
  7e:	5e                   	pop    %esi
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    

00000081 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  81:	55                   	push   %ebp
  82:	89 e5                	mov    %esp,%ebp
  84:	8b 4d 08             	mov    0x8(%ebp),%ecx
  87:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8a:	eb 06                	jmp    92 <strcmp+0x11>
    p++, q++;
  8c:	83 c1 01             	add    $0x1,%ecx
  8f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  92:	0f b6 01             	movzbl (%ecx),%eax
  95:	84 c0                	test   %al,%al
  97:	74 04                	je     9d <strcmp+0x1c>
  99:	3a 02                	cmp    (%edx),%al
  9b:	74 ef                	je     8c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  9d:	0f b6 c0             	movzbl %al,%eax
  a0:	0f b6 12             	movzbl (%edx),%edx
  a3:	29 d0                	sub    %edx,%eax
}
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    

000000a7 <strlen>:

uint
strlen(const char *s)
{
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ad:	b8 00 00 00 00       	mov    $0x0,%eax
  b2:	eb 03                	jmp    b7 <strlen+0x10>
  b4:	83 c0 01             	add    $0x1,%eax
  b7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bb:	75 f7                	jne    b4 <strlen+0xd>
    ;
  return n;
}
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    

000000bf <memset>:

void*
memset(void *dst, int c, uint n)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	57                   	push   %edi
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c6:	89 d7                	mov    %edx,%edi
  c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ce:	fc                   	cld    
  cf:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d1:	89 d0                	mov    %edx,%eax
  d3:	8b 7d fc             	mov    -0x4(%ebp),%edi
  d6:	c9                   	leave  
  d7:	c3                   	ret    

000000d8 <strchr>:

char*
strchr(const char *s, char c)
{
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  e2:	eb 03                	jmp    e7 <strchr+0xf>
  e4:	83 c0 01             	add    $0x1,%eax
  e7:	0f b6 10             	movzbl (%eax),%edx
  ea:	84 d2                	test   %dl,%dl
  ec:	74 06                	je     f4 <strchr+0x1c>
    if(*s == c)
  ee:	38 ca                	cmp    %cl,%dl
  f0:	75 f2                	jne    e4 <strchr+0xc>
  f2:	eb 05                	jmp    f9 <strchr+0x21>
      return (char*)s;
  return 0;
  f4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <gets>:

char*
gets(char *buf, int max)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	57                   	push   %edi
  ff:	56                   	push   %esi
 100:	53                   	push   %ebx
 101:	83 ec 1c             	sub    $0x1c,%esp
 104:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 107:	bb 00 00 00 00       	mov    $0x0,%ebx
 10c:	89 de                	mov    %ebx,%esi
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 114:	7d 2e                	jge    144 <gets+0x49>
    cc = read(0, &c, 1);
 116:	83 ec 04             	sub    $0x4,%esp
 119:	6a 01                	push   $0x1
 11b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 11e:	50                   	push   %eax
 11f:	6a 00                	push   $0x0
 121:	e8 99 01 00 00       	call   2bf <read>
    if(cc < 1)
 126:	83 c4 10             	add    $0x10,%esp
 129:	85 c0                	test   %eax,%eax
 12b:	7e 17                	jle    144 <gets+0x49>
      break;
    buf[i++] = c;
 12d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 131:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 134:	3c 0a                	cmp    $0xa,%al
 136:	0f 94 c2             	sete   %dl
 139:	3c 0d                	cmp    $0xd,%al
 13b:	0f 94 c0             	sete   %al
 13e:	08 c2                	or     %al,%dl
 140:	74 ca                	je     10c <gets+0x11>
    buf[i++] = c;
 142:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 144:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 148:	89 f8                	mov    %edi,%eax
 14a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    

00000152 <stat>:

int
stat(const char *n, struct stat *st)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	56                   	push   %esi
 156:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 157:	83 ec 08             	sub    $0x8,%esp
 15a:	6a 00                	push   $0x0
 15c:	ff 75 08             	push   0x8(%ebp)
 15f:	e8 83 01 00 00       	call   2e7 <open>
  if(fd < 0)
 164:	83 c4 10             	add    $0x10,%esp
 167:	85 c0                	test   %eax,%eax
 169:	78 24                	js     18f <stat+0x3d>
 16b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 16d:	83 ec 08             	sub    $0x8,%esp
 170:	ff 75 0c             	push   0xc(%ebp)
 173:	50                   	push   %eax
 174:	e8 86 01 00 00       	call   2ff <fstat>
 179:	89 c6                	mov    %eax,%esi
  close(fd);
 17b:	89 1c 24             	mov    %ebx,(%esp)
 17e:	e8 4c 01 00 00       	call   2cf <close>
  return r;
 183:	83 c4 10             	add    $0x10,%esp
}
 186:	89 f0                	mov    %esi,%eax
 188:	8d 65 f8             	lea    -0x8(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
    return -1;
 18f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 194:	eb f0                	jmp    186 <stat+0x34>

00000196 <atoi>:

int
atoi(const char *s)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 19d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1a2:	eb 10                	jmp    1b4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1a4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1aa:	83 c1 01             	add    $0x1,%ecx
 1ad:	0f be c0             	movsbl %al,%eax
 1b0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1b4:	0f b6 01             	movzbl (%ecx),%eax
 1b7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1ba:	80 fb 09             	cmp    $0x9,%bl
 1bd:	76 e5                	jbe    1a4 <atoi+0xe>
  return n;
}
 1bf:	89 d0                	mov    %edx,%eax
 1c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c4:	c9                   	leave  
 1c5:	c3                   	ret    

000001c6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	56                   	push   %esi
 1ca:	53                   	push   %ebx
 1cb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1d4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1d6:	eb 0d                	jmp    1e5 <memmove+0x1f>
    *dst++ = *src++;
 1d8:	0f b6 01             	movzbl (%ecx),%eax
 1db:	88 02                	mov    %al,(%edx)
 1dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 1e0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1e3:	89 d8                	mov    %ebx,%eax
 1e5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <memmove+0x12>
  return vdst;
}
 1ec:	89 f0                	mov    %esi,%eax
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 1f8:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 1fa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1fd:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1ff:	89 d0                	mov    %edx,%eax
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    

00000203 <lock_init>:
void 
lock_init(lock_t *lock){
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    

00000211 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 211:	55                   	push   %ebp
 212:	89 e5                	mov    %esp,%ebp
 214:	53                   	push   %ebx
 215:	83 ec 04             	sub    $0x4,%esp
 218:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 21b:	83 ec 08             	sub    $0x8,%esp
 21e:	6a 01                	push   $0x1
 220:	53                   	push   %ebx
 221:	e8 cc ff ff ff       	call   1f2 <TestAndSet>
 226:	83 c4 10             	add    $0x10,%esp
 229:	83 f8 01             	cmp    $0x1,%eax
 22c:	74 ed                	je     21b <lock_acquire+0xa>
    ;
}
 22e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <lock_release>:
void 
lock_release(lock_t *lock){
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    

00000241 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
 244:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 247:	68 04 20 00 00       	push   $0x2004
 24c:	e8 d1 03 00 00       	call   622 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 251:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 254:	83 c4 10             	add    $0x10,%esp
 257:	eb 03                	jmp    25c <thread_create+0x1b>
      stack += 1;
 259:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 25c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 262:	75 f5                	jne    259 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 264:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 267:	52                   	push   %edx
 268:	ff 75 10             	push   0x10(%ebp)
 26b:	ff 75 0c             	push   0xc(%ebp)
 26e:	ff 75 08             	push   0x8(%ebp)
 271:	e8 d1 00 00 00       	call   347 <clone>
 
    return pid;
}
 276:	c9                   	leave  
 277:	c3                   	ret    

00000278 <thread_join>:
int 
thread_join(){
 278:	55                   	push   %ebp
 279:	89 e5                	mov    %esp,%ebp
 27b:	53                   	push   %ebx
 27c:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 27f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 282:	50                   	push   %eax
 283:	e8 c7 00 00 00       	call   34f <join>
 288:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 290:	ff 70 fc             	push   -0x4(%eax)
 293:	e8 ca 02 00 00       	call   562 <free>
  return pid;
 298:	89 d8                	mov    %ebx,%eax
 29a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29d:	c9                   	leave  
 29e:	c3                   	ret    

0000029f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29f:	b8 01 00 00 00       	mov    $0x1,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <exit>:
SYSCALL(exit)
 2a7:	b8 02 00 00 00       	mov    $0x2,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <wait>:
SYSCALL(wait)
 2af:	b8 03 00 00 00       	mov    $0x3,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <pipe>:
SYSCALL(pipe)
 2b7:	b8 04 00 00 00       	mov    $0x4,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <read>:
SYSCALL(read)
 2bf:	b8 05 00 00 00       	mov    $0x5,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <write>:
SYSCALL(write)
 2c7:	b8 10 00 00 00       	mov    $0x10,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <close>:
SYSCALL(close)
 2cf:	b8 15 00 00 00       	mov    $0x15,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <kill>:
SYSCALL(kill)
 2d7:	b8 06 00 00 00       	mov    $0x6,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <exec>:
SYSCALL(exec)
 2df:	b8 07 00 00 00       	mov    $0x7,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <open>:
SYSCALL(open)
 2e7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <mknod>:
SYSCALL(mknod)
 2ef:	b8 11 00 00 00       	mov    $0x11,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <unlink>:
SYSCALL(unlink)
 2f7:	b8 12 00 00 00       	mov    $0x12,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <fstat>:
SYSCALL(fstat)
 2ff:	b8 08 00 00 00       	mov    $0x8,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <link>:
SYSCALL(link)
 307:	b8 13 00 00 00       	mov    $0x13,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <mkdir>:
SYSCALL(mkdir)
 30f:	b8 14 00 00 00       	mov    $0x14,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <chdir>:
SYSCALL(chdir)
 317:	b8 09 00 00 00       	mov    $0x9,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <dup>:
SYSCALL(dup)
 31f:	b8 0a 00 00 00       	mov    $0xa,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <getpid>:
SYSCALL(getpid)
 327:	b8 0b 00 00 00       	mov    $0xb,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <sbrk>:
SYSCALL(sbrk)
 32f:	b8 0c 00 00 00       	mov    $0xc,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <sleep>:
SYSCALL(sleep)
 337:	b8 0d 00 00 00       	mov    $0xd,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <uptime>:
SYSCALL(uptime)
 33f:	b8 0e 00 00 00       	mov    $0xe,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <clone>:
SYSCALL(clone)
 347:	b8 16 00 00 00       	mov    $0x16,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <join>:
SYSCALL(join)
 34f:	b8 17 00 00 00       	mov    $0x17,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	83 ec 1c             	sub    $0x1c,%esp
 35d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 360:	6a 01                	push   $0x1
 362:	8d 55 f4             	lea    -0xc(%ebp),%edx
 365:	52                   	push   %edx
 366:	50                   	push   %eax
 367:	e8 5b ff ff ff       	call   2c7 <write>
}
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	c9                   	leave  
 370:	c3                   	ret    

00000371 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 371:	55                   	push   %ebp
 372:	89 e5                	mov    %esp,%ebp
 374:	57                   	push   %edi
 375:	56                   	push   %esi
 376:	53                   	push   %ebx
 377:	83 ec 2c             	sub    $0x2c,%esp
 37a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 37d:	89 d0                	mov    %edx,%eax
 37f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 381:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 385:	0f 95 c1             	setne  %cl
 388:	c1 ea 1f             	shr    $0x1f,%edx
 38b:	84 d1                	test   %dl,%cl
 38d:	74 44                	je     3d3 <printint+0x62>
    neg = 1;
    x = -xx;
 38f:	f7 d8                	neg    %eax
 391:	89 c1                	mov    %eax,%ecx
    neg = 1;
 393:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 39a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 39f:	89 c8                	mov    %ecx,%eax
 3a1:	ba 00 00 00 00       	mov    $0x0,%edx
 3a6:	f7 f6                	div    %esi
 3a8:	89 df                	mov    %ebx,%edi
 3aa:	83 c3 01             	add    $0x1,%ebx
 3ad:	0f b6 92 20 07 00 00 	movzbl 0x720(%edx),%edx
 3b4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3b8:	89 ca                	mov    %ecx,%edx
 3ba:	89 c1                	mov    %eax,%ecx
 3bc:	39 d6                	cmp    %edx,%esi
 3be:	76 df                	jbe    39f <printint+0x2e>
  if(neg)
 3c0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3c4:	74 31                	je     3f7 <printint+0x86>
    buf[i++] = '-';
 3c6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3cb:	8d 5f 02             	lea    0x2(%edi),%ebx
 3ce:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d1:	eb 17                	jmp    3ea <printint+0x79>
    x = xx;
 3d3:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3d5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3dc:	eb bc                	jmp    39a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3de:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3e3:	89 f0                	mov    %esi,%eax
 3e5:	e8 6d ff ff ff       	call   357 <putc>
  while(--i >= 0)
 3ea:	83 eb 01             	sub    $0x1,%ebx
 3ed:	79 ef                	jns    3de <printint+0x6d>
}
 3ef:	83 c4 2c             	add    $0x2c,%esp
 3f2:	5b                   	pop    %ebx
 3f3:	5e                   	pop    %esi
 3f4:	5f                   	pop    %edi
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    
 3f7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3fa:	eb ee                	jmp    3ea <printint+0x79>

000003fc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	57                   	push   %edi
 400:	56                   	push   %esi
 401:	53                   	push   %ebx
 402:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 405:	8d 45 10             	lea    0x10(%ebp),%eax
 408:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 40b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 410:	bb 00 00 00 00       	mov    $0x0,%ebx
 415:	eb 14                	jmp    42b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 417:	89 fa                	mov    %edi,%edx
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	e8 36 ff ff ff       	call   357 <putc>
 421:	eb 05                	jmp    428 <printf+0x2c>
      }
    } else if(state == '%'){
 423:	83 fe 25             	cmp    $0x25,%esi
 426:	74 25                	je     44d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 428:	83 c3 01             	add    $0x1,%ebx
 42b:	8b 45 0c             	mov    0xc(%ebp),%eax
 42e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 432:	84 c0                	test   %al,%al
 434:	0f 84 20 01 00 00    	je     55a <printf+0x15e>
    c = fmt[i] & 0xff;
 43a:	0f be f8             	movsbl %al,%edi
 43d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 440:	85 f6                	test   %esi,%esi
 442:	75 df                	jne    423 <printf+0x27>
      if(c == '%'){
 444:	83 f8 25             	cmp    $0x25,%eax
 447:	75 ce                	jne    417 <printf+0x1b>
        state = '%';
 449:	89 c6                	mov    %eax,%esi
 44b:	eb db                	jmp    428 <printf+0x2c>
      if(c == 'd'){
 44d:	83 f8 25             	cmp    $0x25,%eax
 450:	0f 84 cf 00 00 00    	je     525 <printf+0x129>
 456:	0f 8c dd 00 00 00    	jl     539 <printf+0x13d>
 45c:	83 f8 78             	cmp    $0x78,%eax
 45f:	0f 8f d4 00 00 00    	jg     539 <printf+0x13d>
 465:	83 f8 63             	cmp    $0x63,%eax
 468:	0f 8c cb 00 00 00    	jl     539 <printf+0x13d>
 46e:	83 e8 63             	sub    $0x63,%eax
 471:	83 f8 15             	cmp    $0x15,%eax
 474:	0f 87 bf 00 00 00    	ja     539 <printf+0x13d>
 47a:	ff 24 85 c8 06 00 00 	jmp    *0x6c8(,%eax,4)
        printint(fd, *ap, 10, 1);
 481:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 484:	8b 17                	mov    (%edi),%edx
 486:	83 ec 0c             	sub    $0xc,%esp
 489:	6a 01                	push   $0x1
 48b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 490:	8b 45 08             	mov    0x8(%ebp),%eax
 493:	e8 d9 fe ff ff       	call   371 <printint>
        ap++;
 498:	83 c7 04             	add    $0x4,%edi
 49b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 49e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a1:	be 00 00 00 00       	mov    $0x0,%esi
 4a6:	eb 80                	jmp    428 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4a8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ab:	8b 17                	mov    (%edi),%edx
 4ad:	83 ec 0c             	sub    $0xc,%esp
 4b0:	6a 00                	push   $0x0
 4b2:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ba:	e8 b2 fe ff ff       	call   371 <printint>
        ap++;
 4bf:	83 c7 04             	add    $0x4,%edi
 4c2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c8:	be 00 00 00 00       	mov    $0x0,%esi
 4cd:	e9 56 ff ff ff       	jmp    428 <printf+0x2c>
        s = (char*)*ap;
 4d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d5:	8b 30                	mov    (%eax),%esi
        ap++;
 4d7:	83 c0 04             	add    $0x4,%eax
 4da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4dd:	85 f6                	test   %esi,%esi
 4df:	75 15                	jne    4f6 <printf+0xfa>
          s = "(null)";
 4e1:	be c0 06 00 00       	mov    $0x6c0,%esi
 4e6:	eb 0e                	jmp    4f6 <printf+0xfa>
          putc(fd, *s);
 4e8:	0f be d2             	movsbl %dl,%edx
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	e8 64 fe ff ff       	call   357 <putc>
          s++;
 4f3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4f6:	0f b6 16             	movzbl (%esi),%edx
 4f9:	84 d2                	test   %dl,%dl
 4fb:	75 eb                	jne    4e8 <printf+0xec>
      state = 0;
 4fd:	be 00 00 00 00       	mov    $0x0,%esi
 502:	e9 21 ff ff ff       	jmp    428 <printf+0x2c>
        putc(fd, *ap);
 507:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 50a:	0f be 17             	movsbl (%edi),%edx
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	e8 42 fe ff ff       	call   357 <putc>
        ap++;
 515:	83 c7 04             	add    $0x4,%edi
 518:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 51b:	be 00 00 00 00       	mov    $0x0,%esi
 520:	e9 03 ff ff ff       	jmp    428 <printf+0x2c>
        putc(fd, c);
 525:	89 fa                	mov    %edi,%edx
 527:	8b 45 08             	mov    0x8(%ebp),%eax
 52a:	e8 28 fe ff ff       	call   357 <putc>
      state = 0;
 52f:	be 00 00 00 00       	mov    $0x0,%esi
 534:	e9 ef fe ff ff       	jmp    428 <printf+0x2c>
        putc(fd, '%');
 539:	ba 25 00 00 00       	mov    $0x25,%edx
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	e8 11 fe ff ff       	call   357 <putc>
        putc(fd, c);
 546:	89 fa                	mov    %edi,%edx
 548:	8b 45 08             	mov    0x8(%ebp),%eax
 54b:	e8 07 fe ff ff       	call   357 <putc>
      state = 0;
 550:	be 00 00 00 00       	mov    $0x0,%esi
 555:	e9 ce fe ff ff       	jmp    428 <printf+0x2c>
    }
  }
}
 55a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55d:	5b                   	pop    %ebx
 55e:	5e                   	pop    %esi
 55f:	5f                   	pop    %edi
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    

00000562 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 562:	55                   	push   %ebp
 563:	89 e5                	mov    %esp,%ebp
 565:	57                   	push   %edi
 566:	56                   	push   %esi
 567:	53                   	push   %ebx
 568:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 56b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 56e:	a1 94 0a 00 00       	mov    0xa94,%eax
 573:	eb 02                	jmp    577 <free+0x15>
 575:	89 d0                	mov    %edx,%eax
 577:	39 c8                	cmp    %ecx,%eax
 579:	73 04                	jae    57f <free+0x1d>
 57b:	39 08                	cmp    %ecx,(%eax)
 57d:	77 12                	ja     591 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 57f:	8b 10                	mov    (%eax),%edx
 581:	39 c2                	cmp    %eax,%edx
 583:	77 f0                	ja     575 <free+0x13>
 585:	39 c8                	cmp    %ecx,%eax
 587:	72 08                	jb     591 <free+0x2f>
 589:	39 ca                	cmp    %ecx,%edx
 58b:	77 04                	ja     591 <free+0x2f>
 58d:	89 d0                	mov    %edx,%eax
 58f:	eb e6                	jmp    577 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 591:	8b 73 fc             	mov    -0x4(%ebx),%esi
 594:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 597:	8b 10                	mov    (%eax),%edx
 599:	39 d7                	cmp    %edx,%edi
 59b:	74 19                	je     5b6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 59d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5a0:	8b 50 04             	mov    0x4(%eax),%edx
 5a3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5a6:	39 ce                	cmp    %ecx,%esi
 5a8:	74 1b                	je     5c5 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5aa:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5ac:	a3 94 0a 00 00       	mov    %eax,0xa94
}
 5b1:	5b                   	pop    %ebx
 5b2:	5e                   	pop    %esi
 5b3:	5f                   	pop    %edi
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5b6:	03 72 04             	add    0x4(%edx),%esi
 5b9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5bc:	8b 10                	mov    (%eax),%edx
 5be:	8b 12                	mov    (%edx),%edx
 5c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5c3:	eb db                	jmp    5a0 <free+0x3e>
    p->s.size += bp->s.size;
 5c5:	03 53 fc             	add    -0x4(%ebx),%edx
 5c8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5cb:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5ce:	89 10                	mov    %edx,(%eax)
 5d0:	eb da                	jmp    5ac <free+0x4a>

000005d2 <morecore>:

static Header*
morecore(uint nu)
{
 5d2:	55                   	push   %ebp
 5d3:	89 e5                	mov    %esp,%ebp
 5d5:	53                   	push   %ebx
 5d6:	83 ec 04             	sub    $0x4,%esp
 5d9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5db:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5e0:	77 05                	ja     5e7 <morecore+0x15>
    nu = 4096;
 5e2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5e7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5ee:	83 ec 0c             	sub    $0xc,%esp
 5f1:	50                   	push   %eax
 5f2:	e8 38 fd ff ff       	call   32f <sbrk>
  if(p == (char*)-1)
 5f7:	83 c4 10             	add    $0x10,%esp
 5fa:	83 f8 ff             	cmp    $0xffffffff,%eax
 5fd:	74 1c                	je     61b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5ff:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 602:	83 c0 08             	add    $0x8,%eax
 605:	83 ec 0c             	sub    $0xc,%esp
 608:	50                   	push   %eax
 609:	e8 54 ff ff ff       	call   562 <free>
  return freep;
 60e:	a1 94 0a 00 00       	mov    0xa94,%eax
 613:	83 c4 10             	add    $0x10,%esp
}
 616:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 619:	c9                   	leave  
 61a:	c3                   	ret    
    return 0;
 61b:	b8 00 00 00 00       	mov    $0x0,%eax
 620:	eb f4                	jmp    616 <morecore+0x44>

00000622 <malloc>:

void*
malloc(uint nbytes)
{
 622:	55                   	push   %ebp
 623:	89 e5                	mov    %esp,%ebp
 625:	53                   	push   %ebx
 626:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	8d 58 07             	lea    0x7(%eax),%ebx
 62f:	c1 eb 03             	shr    $0x3,%ebx
 632:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 635:	8b 0d 94 0a 00 00    	mov    0xa94,%ecx
 63b:	85 c9                	test   %ecx,%ecx
 63d:	74 04                	je     643 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 63f:	8b 01                	mov    (%ecx),%eax
 641:	eb 4a                	jmp    68d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 643:	c7 05 94 0a 00 00 98 	movl   $0xa98,0xa94
 64a:	0a 00 00 
 64d:	c7 05 98 0a 00 00 98 	movl   $0xa98,0xa98
 654:	0a 00 00 
    base.s.size = 0;
 657:	c7 05 9c 0a 00 00 00 	movl   $0x0,0xa9c
 65e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 661:	b9 98 0a 00 00       	mov    $0xa98,%ecx
 666:	eb d7                	jmp    63f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 668:	74 19                	je     683 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 66a:	29 da                	sub    %ebx,%edx
 66c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 66f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 672:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 675:	89 0d 94 0a 00 00    	mov    %ecx,0xa94
      return (void*)(p + 1);
 67b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 67e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 681:	c9                   	leave  
 682:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 683:	8b 10                	mov    (%eax),%edx
 685:	89 11                	mov    %edx,(%ecx)
 687:	eb ec                	jmp    675 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 689:	89 c1                	mov    %eax,%ecx
 68b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	39 da                	cmp    %ebx,%edx
 692:	73 d4                	jae    668 <malloc+0x46>
    if(p == freep)
 694:	39 05 94 0a 00 00    	cmp    %eax,0xa94
 69a:	75 ed                	jne    689 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 69c:	89 d8                	mov    %ebx,%eax
 69e:	e8 2f ff ff ff       	call   5d2 <morecore>
 6a3:	85 c0                	test   %eax,%eax
 6a5:	75 e2                	jne    689 <malloc+0x67>
 6a7:	eb d5                	jmp    67e <malloc+0x5c>
