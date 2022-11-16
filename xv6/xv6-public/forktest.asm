
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   a:	53                   	push   %ebx
   b:	e8 25 01 00 00       	call   135 <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 38 03 00 00       	call   355 <write>
}
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave  
  24:	c3                   	ret    

00000025 <forktest>:

void
forktest(void)
{
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  2c:	68 2c 05 00 00       	push   $0x52c
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 e0 02 00 00       	call   32d <fork>
    if(pid < 0)
  4d:	85 c0                	test   %eax,%eax
  4f:	78 0c                	js     5d <forktest+0x38>
      break;
    if(pid == 0)
  51:	74 05                	je     58 <forktest+0x33>
  for(n=0; n<N; n++){
  53:	83 c3 01             	add    $0x1,%ebx
  56:	eb e8                	jmp    40 <forktest+0x1b>
      exit();
  58:	e8 d8 02 00 00       	call   335 <exit>
  }

  if(n == N){
  5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  63:	74 12                	je     77 <forktest+0x52>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  65:	85 db                	test   %ebx,%ebx
  67:	7e 3b                	jle    a4 <forktest+0x7f>
    if(wait() < 0){
  69:	e8 cf 02 00 00       	call   33d <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 6c 05 00 00       	push   $0x56c
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 a5 02 00 00       	call   335 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 37 05 00 00       	push   $0x537
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 91 02 00 00       	call   335 <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 94 02 00 00       	call   33d <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 5e 05 00 00       	push   $0x55e
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 4b 05 00 00       	push   $0x54b
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 5c 02 00 00       	call   335 <exit>

000000d9 <main>:

int
main(void)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  df:	e8 41 ff ff ff       	call   25 <forktest>
  exit();
  e4:	e8 4c 02 00 00       	call   335 <exit>

000000e9 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	56                   	push   %esi
  ed:	53                   	push   %ebx
  ee:	8b 75 08             	mov    0x8(%ebp),%esi
  f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f4:	89 f0                	mov    %esi,%eax
  f6:	89 d1                	mov    %edx,%ecx
  f8:	83 c2 01             	add    $0x1,%edx
  fb:	89 c3                	mov    %eax,%ebx
  fd:	83 c0 01             	add    $0x1,%eax
 100:	0f b6 09             	movzbl (%ecx),%ecx
 103:	88 0b                	mov    %cl,(%ebx)
 105:	84 c9                	test   %cl,%cl
 107:	75 ed                	jne    f6 <strcpy+0xd>
    ;
  return os;
}
 109:	89 f0                	mov    %esi,%eax
 10b:	5b                   	pop    %ebx
 10c:	5e                   	pop    %esi
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    

0000010f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	8b 4d 08             	mov    0x8(%ebp),%ecx
 115:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 118:	eb 06                	jmp    120 <strcmp+0x11>
    p++, q++;
 11a:	83 c1 01             	add    $0x1,%ecx
 11d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 120:	0f b6 01             	movzbl (%ecx),%eax
 123:	84 c0                	test   %al,%al
 125:	74 04                	je     12b <strcmp+0x1c>
 127:	3a 02                	cmp    (%edx),%al
 129:	74 ef                	je     11a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 12b:	0f b6 c0             	movzbl %al,%eax
 12e:	0f b6 12             	movzbl (%edx),%edx
 131:	29 d0                	sub    %edx,%eax
}
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strlen>:

uint
strlen(const char *s)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 13b:	b8 00 00 00 00       	mov    $0x0,%eax
 140:	eb 03                	jmp    145 <strlen+0x10>
 142:	83 c0 01             	add    $0x1,%eax
 145:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 149:	75 f7                	jne    142 <strlen+0xd>
    ;
  return n;
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    

0000014d <memset>:

void*
memset(void *dst, int c, uint n)
{
 14d:	55                   	push   %ebp
 14e:	89 e5                	mov    %esp,%ebp
 150:	57                   	push   %edi
 151:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 154:	89 d7                	mov    %edx,%edi
 156:	8b 4d 10             	mov    0x10(%ebp),%ecx
 159:	8b 45 0c             	mov    0xc(%ebp),%eax
 15c:	fc                   	cld    
 15d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 15f:	89 d0                	mov    %edx,%eax
 161:	8b 7d fc             	mov    -0x4(%ebp),%edi
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 170:	eb 03                	jmp    175 <strchr+0xf>
 172:	83 c0 01             	add    $0x1,%eax
 175:	0f b6 10             	movzbl (%eax),%edx
 178:	84 d2                	test   %dl,%dl
 17a:	74 06                	je     182 <strchr+0x1c>
    if(*s == c)
 17c:	38 ca                	cmp    %cl,%dl
 17e:	75 f2                	jne    172 <strchr+0xc>
 180:	eb 05                	jmp    187 <strchr+0x21>
      return (char*)s;
  return 0;
 182:	b8 00 00 00 00       	mov    $0x0,%eax
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    

00000189 <gets>:

char*
gets(char *buf, int max)
{
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	57                   	push   %edi
 18d:	56                   	push   %esi
 18e:	53                   	push   %ebx
 18f:	83 ec 1c             	sub    $0x1c,%esp
 192:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	bb 00 00 00 00       	mov    $0x0,%ebx
 19a:	89 de                	mov    %ebx,%esi
 19c:	83 c3 01             	add    $0x1,%ebx
 19f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a2:	7d 2e                	jge    1d2 <gets+0x49>
    cc = read(0, &c, 1);
 1a4:	83 ec 04             	sub    $0x4,%esp
 1a7:	6a 01                	push   $0x1
 1a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ac:	50                   	push   %eax
 1ad:	6a 00                	push   $0x0
 1af:	e8 99 01 00 00       	call   34d <read>
    if(cc < 1)
 1b4:	83 c4 10             	add    $0x10,%esp
 1b7:	85 c0                	test   %eax,%eax
 1b9:	7e 17                	jle    1d2 <gets+0x49>
      break;
    buf[i++] = c;
 1bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	0f 94 c2             	sete   %dl
 1c7:	3c 0d                	cmp    $0xd,%al
 1c9:	0f 94 c0             	sete   %al
 1cc:	08 c2                	or     %al,%dl
 1ce:	74 ca                	je     19a <gets+0x11>
    buf[i++] = c;
 1d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1d6:	89 f8                	mov    %edi,%eax
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 83 01 00 00       	call   375 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 24                	js     21d <stat+0x3d>
 1f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1fb:	83 ec 08             	sub    $0x8,%esp
 1fe:	ff 75 0c             	push   0xc(%ebp)
 201:	50                   	push   %eax
 202:	e8 86 01 00 00       	call   38d <fstat>
 207:	89 c6                	mov    %eax,%esi
  close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
 20c:	e8 4c 01 00 00       	call   35d <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	89 f0                	mov    %esi,%eax
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
    return -1;
 21d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 222:	eb f0                	jmp    214 <stat+0x34>

00000224 <atoi>:

int
atoi(const char *s)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 22b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 230:	eb 10                	jmp    242 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 232:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 235:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 238:	83 c1 01             	add    $0x1,%ecx
 23b:	0f be c0             	movsbl %al,%eax
 23e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 242:	0f b6 01             	movzbl (%ecx),%eax
 245:	8d 58 d0             	lea    -0x30(%eax),%ebx
 248:	80 fb 09             	cmp    $0x9,%bl
 24b:	76 e5                	jbe    232 <atoi+0xe>
  return n;
}
 24d:	89 d0                	mov    %edx,%eax
 24f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 252:	c9                   	leave  
 253:	c3                   	ret    

00000254 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	56                   	push   %esi
 258:	53                   	push   %ebx
 259:	8b 75 08             	mov    0x8(%ebp),%esi
 25c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 25f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 262:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 264:	eb 0d                	jmp    273 <memmove+0x1f>
    *dst++ = *src++;
 266:	0f b6 01             	movzbl (%ecx),%eax
 269:	88 02                	mov    %al,(%edx)
 26b:	8d 49 01             	lea    0x1(%ecx),%ecx
 26e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 271:	89 d8                	mov    %ebx,%eax
 273:	8d 58 ff             	lea    -0x1(%eax),%ebx
 276:	85 c0                	test   %eax,%eax
 278:	7f ec                	jg     266 <memmove+0x12>
  return vdst;
}
 27a:	89 f0                	mov    %esi,%eax
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 286:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 288:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 28b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 28d:	89 d0                	mov    %edx,%eax
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    

00000291 <lock_init>:
void 
lock_init(lock_t *lock){
 291:	55                   	push   %ebp
 292:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    

0000029f <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 29f:	55                   	push   %ebp
 2a0:	89 e5                	mov    %esp,%ebp
 2a2:	53                   	push   %ebx
 2a3:	83 ec 04             	sub    $0x4,%esp
 2a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	6a 01                	push   $0x1
 2ae:	53                   	push   %ebx
 2af:	e8 cc ff ff ff       	call   280 <TestAndSet>
 2b4:	83 c4 10             	add    $0x10,%esp
 2b7:	83 f8 01             	cmp    $0x1,%eax
 2ba:	74 ed                	je     2a9 <lock_acquire+0xa>
    ;
}
 2bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2bf:	c9                   	leave  
 2c0:	c3                   	ret    

000002c1 <lock_release>:
void 
lock_release(lock_t *lock){
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2cd:	5d                   	pop    %ebp
 2ce:	c3                   	ret    

000002cf <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2cf:	55                   	push   %ebp
 2d0:	89 e5                	mov    %esp,%ebp
 2d2:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 2d5:	68 04 20 00 00       	push   $0x2004
 2da:	e8 c6 01 00 00       	call   4a5 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 2df:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	eb 03                	jmp    2ea <thread_create+0x1b>
      stack += 1;
 2e7:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 2ea:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 2f0:	75 f5                	jne    2e7 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 2f2:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 2f5:	52                   	push   %edx
 2f6:	ff 75 10             	push   0x10(%ebp)
 2f9:	ff 75 0c             	push   0xc(%ebp)
 2fc:	ff 75 08             	push   0x8(%ebp)
 2ff:	e8 d1 00 00 00       	call   3d5 <clone>
 
    return pid;
}
 304:	c9                   	leave  
 305:	c3                   	ret    

00000306 <thread_join>:
int 
thread_join(){
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
 309:	53                   	push   %ebx
 30a:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 30d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 310:	50                   	push   %eax
 311:	e8 c7 00 00 00       	call   3dd <join>
 316:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 318:	83 c4 04             	add    $0x4,%esp
 31b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31e:	ff 70 fc             	push   -0x4(%eax)
 321:	e8 bf 00 00 00       	call   3e5 <free>
  return pid;
 326:	89 d8                	mov    %ebx,%eax
 328:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 32b:	c9                   	leave  
 32c:	c3                   	ret    

0000032d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 32d:	b8 01 00 00 00       	mov    $0x1,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <exit>:
SYSCALL(exit)
 335:	b8 02 00 00 00       	mov    $0x2,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <wait>:
SYSCALL(wait)
 33d:	b8 03 00 00 00       	mov    $0x3,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <pipe>:
SYSCALL(pipe)
 345:	b8 04 00 00 00       	mov    $0x4,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <read>:
SYSCALL(read)
 34d:	b8 05 00 00 00       	mov    $0x5,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <write>:
SYSCALL(write)
 355:	b8 10 00 00 00       	mov    $0x10,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <close>:
SYSCALL(close)
 35d:	b8 15 00 00 00       	mov    $0x15,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <kill>:
SYSCALL(kill)
 365:	b8 06 00 00 00       	mov    $0x6,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <exec>:
SYSCALL(exec)
 36d:	b8 07 00 00 00       	mov    $0x7,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <open>:
SYSCALL(open)
 375:	b8 0f 00 00 00       	mov    $0xf,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <mknod>:
SYSCALL(mknod)
 37d:	b8 11 00 00 00       	mov    $0x11,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <unlink>:
SYSCALL(unlink)
 385:	b8 12 00 00 00       	mov    $0x12,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <fstat>:
SYSCALL(fstat)
 38d:	b8 08 00 00 00       	mov    $0x8,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <link>:
SYSCALL(link)
 395:	b8 13 00 00 00       	mov    $0x13,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <mkdir>:
SYSCALL(mkdir)
 39d:	b8 14 00 00 00       	mov    $0x14,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <chdir>:
SYSCALL(chdir)
 3a5:	b8 09 00 00 00       	mov    $0x9,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <dup>:
SYSCALL(dup)
 3ad:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <getpid>:
SYSCALL(getpid)
 3b5:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <sbrk>:
SYSCALL(sbrk)
 3bd:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <sleep>:
SYSCALL(sleep)
 3c5:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <uptime>:
SYSCALL(uptime)
 3cd:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <clone>:
SYSCALL(clone)
 3d5:	b8 16 00 00 00       	mov    $0x16,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <join>:
SYSCALL(join)
 3dd:	b8 17 00 00 00       	mov    $0x17,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	57                   	push   %edi
 3e9:	56                   	push   %esi
 3ea:	53                   	push   %ebx
 3eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 3ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3f1:	a1 a4 08 00 00       	mov    0x8a4,%eax
 3f6:	eb 02                	jmp    3fa <free+0x15>
 3f8:	89 d0                	mov    %edx,%eax
 3fa:	39 c8                	cmp    %ecx,%eax
 3fc:	73 04                	jae    402 <free+0x1d>
 3fe:	39 08                	cmp    %ecx,(%eax)
 400:	77 12                	ja     414 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 402:	8b 10                	mov    (%eax),%edx
 404:	39 c2                	cmp    %eax,%edx
 406:	77 f0                	ja     3f8 <free+0x13>
 408:	39 c8                	cmp    %ecx,%eax
 40a:	72 08                	jb     414 <free+0x2f>
 40c:	39 ca                	cmp    %ecx,%edx
 40e:	77 04                	ja     414 <free+0x2f>
 410:	89 d0                	mov    %edx,%eax
 412:	eb e6                	jmp    3fa <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 414:	8b 73 fc             	mov    -0x4(%ebx),%esi
 417:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 41a:	8b 10                	mov    (%eax),%edx
 41c:	39 d7                	cmp    %edx,%edi
 41e:	74 19                	je     439 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 420:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 423:	8b 50 04             	mov    0x4(%eax),%edx
 426:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 429:	39 ce                	cmp    %ecx,%esi
 42b:	74 1b                	je     448 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 42d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 42f:	a3 a4 08 00 00       	mov    %eax,0x8a4
}
 434:	5b                   	pop    %ebx
 435:	5e                   	pop    %esi
 436:	5f                   	pop    %edi
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 439:	03 72 04             	add    0x4(%edx),%esi
 43c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 43f:	8b 10                	mov    (%eax),%edx
 441:	8b 12                	mov    (%edx),%edx
 443:	89 53 f8             	mov    %edx,-0x8(%ebx)
 446:	eb db                	jmp    423 <free+0x3e>
    p->s.size += bp->s.size;
 448:	03 53 fc             	add    -0x4(%ebx),%edx
 44b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 44e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 451:	89 10                	mov    %edx,(%eax)
 453:	eb da                	jmp    42f <free+0x4a>

00000455 <morecore>:

static Header*
morecore(uint nu)
{
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	53                   	push   %ebx
 459:	83 ec 04             	sub    $0x4,%esp
 45c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 45e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 463:	77 05                	ja     46a <morecore+0x15>
    nu = 4096;
 465:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 46a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 471:	83 ec 0c             	sub    $0xc,%esp
 474:	50                   	push   %eax
 475:	e8 43 ff ff ff       	call   3bd <sbrk>
  if(p == (char*)-1)
 47a:	83 c4 10             	add    $0x10,%esp
 47d:	83 f8 ff             	cmp    $0xffffffff,%eax
 480:	74 1c                	je     49e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 482:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 485:	83 c0 08             	add    $0x8,%eax
 488:	83 ec 0c             	sub    $0xc,%esp
 48b:	50                   	push   %eax
 48c:	e8 54 ff ff ff       	call   3e5 <free>
  return freep;
 491:	a1 a4 08 00 00       	mov    0x8a4,%eax
 496:	83 c4 10             	add    $0x10,%esp
}
 499:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49c:	c9                   	leave  
 49d:	c3                   	ret    
    return 0;
 49e:	b8 00 00 00 00       	mov    $0x0,%eax
 4a3:	eb f4                	jmp    499 <morecore+0x44>

000004a5 <malloc>:

void*
malloc(uint nbytes)
{
 4a5:	55                   	push   %ebp
 4a6:	89 e5                	mov    %esp,%ebp
 4a8:	53                   	push   %ebx
 4a9:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	8d 58 07             	lea    0x7(%eax),%ebx
 4b2:	c1 eb 03             	shr    $0x3,%ebx
 4b5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 4b8:	8b 0d a4 08 00 00    	mov    0x8a4,%ecx
 4be:	85 c9                	test   %ecx,%ecx
 4c0:	74 04                	je     4c6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4c2:	8b 01                	mov    (%ecx),%eax
 4c4:	eb 4a                	jmp    510 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 4c6:	c7 05 a4 08 00 00 a8 	movl   $0x8a8,0x8a4
 4cd:	08 00 00 
 4d0:	c7 05 a8 08 00 00 a8 	movl   $0x8a8,0x8a8
 4d7:	08 00 00 
    base.s.size = 0;
 4da:	c7 05 ac 08 00 00 00 	movl   $0x0,0x8ac
 4e1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 4e4:	b9 a8 08 00 00       	mov    $0x8a8,%ecx
 4e9:	eb d7                	jmp    4c2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 4eb:	74 19                	je     506 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 4ed:	29 da                	sub    %ebx,%edx
 4ef:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 4f2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 4f5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 4f8:	89 0d a4 08 00 00    	mov    %ecx,0x8a4
      return (void*)(p + 1);
 4fe:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 501:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 504:	c9                   	leave  
 505:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 506:	8b 10                	mov    (%eax),%edx
 508:	89 11                	mov    %edx,(%ecx)
 50a:	eb ec                	jmp    4f8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 50c:	89 c1                	mov    %eax,%ecx
 50e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 510:	8b 50 04             	mov    0x4(%eax),%edx
 513:	39 da                	cmp    %ebx,%edx
 515:	73 d4                	jae    4eb <malloc+0x46>
    if(p == freep)
 517:	39 05 a4 08 00 00    	cmp    %eax,0x8a4
 51d:	75 ed                	jne    50c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 51f:	89 d8                	mov    %ebx,%eax
 521:	e8 2f ff ff ff       	call   455 <morecore>
 526:	85 c0                	test   %eax,%eax
 528:	75 e2                	jne    50c <malloc+0x67>
 52a:	eb d5                	jmp    501 <malloc+0x5c>
