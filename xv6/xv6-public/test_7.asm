
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 f2 03 00 00       	call   408 <getpid>
  16:	a3 c0 0b 00 00       	mov    %eax,0xbc0

   int fork_pid = fork();
  1b:	e8 60 03 00 00       	call   380 <fork>
   if(fork_pid == 0) {
  20:	85 c0                	test   %eax,%eax
  22:	74 63                	je     87 <main+0x87>
     exit();
   }
   assert(fork_pid > 0);
  24:	7e 66                	jle    8c <main+0x8c>

   void *join_stack;
   int join_pid = join(&join_stack);
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	8d 45 f4             	lea    -0xc(%ebp),%eax
  2c:	50                   	push   %eax
  2d:	e8 fe 03 00 00       	call   430 <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 8c 07 00 00       	push   $0x78c
  45:	68 95 07 00 00       	push   $0x795
  4a:	6a 01                	push   $0x1
  4c:	e8 8c 04 00 00       	call   4dd <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 cb 07 00 00       	push   $0x7cb
  59:	68 aa 07 00 00       	push   $0x7aa
  5e:	6a 01                	push   $0x1
  60:	e8 78 04 00 00       	call   4dd <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 be 07 00 00       	push   $0x7be
  6d:	6a 01                	push   $0x1
  6f:	e8 69 04 00 00       	call   4dd <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 c0 0b 00 00    	push   0xbc0
  7d:	e8 36 03 00 00       	call   3b8 <kill>
  82:	e8 01 03 00 00       	call   388 <exit>
     exit();
  87:	e8 fc 02 00 00       	call   388 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 8c 07 00 00       	push   $0x78c
  93:	68 95 07 00 00       	push   $0x795
  98:	6a 01                	push   $0x1
  9a:	e8 3e 04 00 00       	call   4dd <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 9d 07 00 00       	push   $0x79d
  a7:	68 aa 07 00 00       	push   $0x7aa
  ac:	6a 01                	push   $0x1
  ae:	e8 2a 04 00 00       	call   4dd <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 be 07 00 00       	push   $0x7be
  bb:	6a 01                	push   $0x1
  bd:	e8 1b 04 00 00       	call   4dd <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 c0 0b 00 00    	push   0xbc0
  cb:	e8 e8 02 00 00       	call   3b8 <kill>
  d0:	e8 b3 02 00 00       	call   388 <exit>

   assert(wait() > 0);
  d5:	e8 b6 02 00 00       	call   390 <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 e5 07 00 00       	push   $0x7e5
  e6:	6a 01                	push   $0x1
  e8:	e8 f0 03 00 00       	call   4dd <printf>
   exit();
  ed:	e8 96 02 00 00       	call   388 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 8c 07 00 00       	push   $0x78c
  f9:	68 95 07 00 00       	push   $0x795
  fe:	6a 01                	push   $0x1
 100:	e8 d8 03 00 00       	call   4dd <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 da 07 00 00       	push   $0x7da
 10d:	68 aa 07 00 00       	push   $0x7aa
 112:	6a 01                	push   $0x1
 114:	e8 c4 03 00 00       	call   4dd <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 be 07 00 00       	push   $0x7be
 121:	6a 01                	push   $0x1
 123:	e8 b5 03 00 00       	call   4dd <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 c0 0b 00 00    	push   0xbc0
 131:	e8 82 02 00 00       	call   3b8 <kill>
 136:	e8 4d 02 00 00       	call   388 <exit>

0000013b <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	56                   	push   %esi
 13f:	53                   	push   %ebx
 140:	8b 75 08             	mov    0x8(%ebp),%esi
 143:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 146:	89 f0                	mov    %esi,%eax
 148:	89 d1                	mov    %edx,%ecx
 14a:	83 c2 01             	add    $0x1,%edx
 14d:	89 c3                	mov    %eax,%ebx
 14f:	83 c0 01             	add    $0x1,%eax
 152:	0f b6 09             	movzbl (%ecx),%ecx
 155:	88 0b                	mov    %cl,(%ebx)
 157:	84 c9                	test   %cl,%cl
 159:	75 ed                	jne    148 <strcpy+0xd>
    ;
  return os;
}
 15b:	89 f0                	mov    %esi,%eax
 15d:	5b                   	pop    %ebx
 15e:	5e                   	pop    %esi
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    

00000161 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 161:	55                   	push   %ebp
 162:	89 e5                	mov    %esp,%ebp
 164:	8b 4d 08             	mov    0x8(%ebp),%ecx
 167:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 16a:	eb 06                	jmp    172 <strcmp+0x11>
    p++, q++;
 16c:	83 c1 01             	add    $0x1,%ecx
 16f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 172:	0f b6 01             	movzbl (%ecx),%eax
 175:	84 c0                	test   %al,%al
 177:	74 04                	je     17d <strcmp+0x1c>
 179:	3a 02                	cmp    (%edx),%al
 17b:	74 ef                	je     16c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 17d:	0f b6 c0             	movzbl %al,%eax
 180:	0f b6 12             	movzbl (%edx),%edx
 183:	29 d0                	sub    %edx,%eax
}
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    

00000187 <strlen>:

uint
strlen(const char *s)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 18d:	b8 00 00 00 00       	mov    $0x0,%eax
 192:	eb 03                	jmp    197 <strlen+0x10>
 194:	83 c0 01             	add    $0x1,%eax
 197:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 19b:	75 f7                	jne    194 <strlen+0xd>
    ;
  return n;
}
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    

0000019f <memset>:

void*
memset(void *dst, int c, uint n)
{
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	57                   	push   %edi
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a6:	89 d7                	mov    %edx,%edi
 1a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ae:	fc                   	cld    
 1af:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b1:	89 d0                	mov    %edx,%eax
 1b3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b6:	c9                   	leave  
 1b7:	c3                   	ret    

000001b8 <strchr>:

char*
strchr(const char *s, char c)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1c2:	eb 03                	jmp    1c7 <strchr+0xf>
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	0f b6 10             	movzbl (%eax),%edx
 1ca:	84 d2                	test   %dl,%dl
 1cc:	74 06                	je     1d4 <strchr+0x1c>
    if(*s == c)
 1ce:	38 ca                	cmp    %cl,%dl
 1d0:	75 f2                	jne    1c4 <strchr+0xc>
 1d2:	eb 05                	jmp    1d9 <strchr+0x21>
      return (char*)s;
  return 0;
 1d4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    

000001db <gets>:

char*
gets(char *buf, int max)
{
 1db:	55                   	push   %ebp
 1dc:	89 e5                	mov    %esp,%ebp
 1de:	57                   	push   %edi
 1df:	56                   	push   %esi
 1e0:	53                   	push   %ebx
 1e1:	83 ec 1c             	sub    $0x1c,%esp
 1e4:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e7:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ec:	89 de                	mov    %ebx,%esi
 1ee:	83 c3 01             	add    $0x1,%ebx
 1f1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f4:	7d 2e                	jge    224 <gets+0x49>
    cc = read(0, &c, 1);
 1f6:	83 ec 04             	sub    $0x4,%esp
 1f9:	6a 01                	push   $0x1
 1fb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1fe:	50                   	push   %eax
 1ff:	6a 00                	push   $0x0
 201:	e8 9a 01 00 00       	call   3a0 <read>
    if(cc < 1)
 206:	83 c4 10             	add    $0x10,%esp
 209:	85 c0                	test   %eax,%eax
 20b:	7e 17                	jle    224 <gets+0x49>
      break;
    buf[i++] = c;
 20d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 211:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 214:	3c 0a                	cmp    $0xa,%al
 216:	0f 94 c2             	sete   %dl
 219:	3c 0d                	cmp    $0xd,%al
 21b:	0f 94 c0             	sete   %al
 21e:	08 c2                	or     %al,%dl
 220:	74 ca                	je     1ec <gets+0x11>
    buf[i++] = c;
 222:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 224:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 228:	89 f8                	mov    %edi,%eax
 22a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22d:	5b                   	pop    %ebx
 22e:	5e                   	pop    %esi
 22f:	5f                   	pop    %edi
 230:	5d                   	pop    %ebp
 231:	c3                   	ret    

00000232 <stat>:

int
stat(const char *n, struct stat *st)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	56                   	push   %esi
 236:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 237:	83 ec 08             	sub    $0x8,%esp
 23a:	6a 00                	push   $0x0
 23c:	ff 75 08             	push   0x8(%ebp)
 23f:	e8 84 01 00 00       	call   3c8 <open>
  if(fd < 0)
 244:	83 c4 10             	add    $0x10,%esp
 247:	85 c0                	test   %eax,%eax
 249:	78 24                	js     26f <stat+0x3d>
 24b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	ff 75 0c             	push   0xc(%ebp)
 253:	50                   	push   %eax
 254:	e8 87 01 00 00       	call   3e0 <fstat>
 259:	89 c6                	mov    %eax,%esi
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
 25e:	e8 4d 01 00 00       	call   3b0 <close>
  return r;
 263:	83 c4 10             	add    $0x10,%esp
}
 266:	89 f0                	mov    %esi,%eax
 268:	8d 65 f8             	lea    -0x8(%ebp),%esp
 26b:	5b                   	pop    %ebx
 26c:	5e                   	pop    %esi
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
    return -1;
 26f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 274:	eb f0                	jmp    266 <stat+0x34>

00000276 <atoi>:

int
atoi(const char *s)
{
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	53                   	push   %ebx
 27a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 282:	eb 10                	jmp    294 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 284:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 287:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 28a:	83 c1 01             	add    $0x1,%ecx
 28d:	0f be c0             	movsbl %al,%eax
 290:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 294:	0f b6 01             	movzbl (%ecx),%eax
 297:	8d 58 d0             	lea    -0x30(%eax),%ebx
 29a:	80 fb 09             	cmp    $0x9,%bl
 29d:	76 e5                	jbe    284 <atoi+0xe>
  return n;
}
 29f:	89 d0                	mov    %edx,%eax
 2a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	56                   	push   %esi
 2aa:	53                   	push   %ebx
 2ab:	8b 75 08             	mov    0x8(%ebp),%esi
 2ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2b4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b6:	eb 0d                	jmp    2c5 <memmove+0x1f>
    *dst++ = *src++;
 2b8:	0f b6 01             	movzbl (%ecx),%eax
 2bb:	88 02                	mov    %al,(%edx)
 2bd:	8d 49 01             	lea    0x1(%ecx),%ecx
 2c0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2c3:	89 d8                	mov    %ebx,%eax
 2c5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2c8:	85 c0                	test   %eax,%eax
 2ca:	7f ec                	jg     2b8 <memmove+0x12>
  return vdst;
}
 2cc:	89 f0                	mov    %esi,%eax
 2ce:	5b                   	pop    %ebx
 2cf:	5e                   	pop    %esi
 2d0:	5d                   	pop    %ebp
 2d1:	c3                   	ret    

000002d2 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 2d8:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 2da:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2dd:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2df:	89 d0                	mov    %edx,%eax
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    

000002e3 <lock_init>:
void 
lock_init(lock_t *lock){
 2e3:	55                   	push   %ebp
 2e4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2e6:	8b 45 08             	mov    0x8(%ebp),%eax
 2e9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    

000002f1 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 2f1:	55                   	push   %ebp
 2f2:	89 e5                	mov    %esp,%ebp
 2f4:	53                   	push   %ebx
 2f5:	83 ec 04             	sub    $0x4,%esp
 2f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 2fb:	83 ec 08             	sub    $0x8,%esp
 2fe:	6a 01                	push   $0x1
 300:	53                   	push   %ebx
 301:	e8 cc ff ff ff       	call   2d2 <TestAndSet>
 306:	83 c4 10             	add    $0x10,%esp
 309:	83 f8 01             	cmp    $0x1,%eax
 30c:	74 ed                	je     2fb <lock_acquire+0xa>
    ;
}
 30e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 311:	c9                   	leave  
 312:	c3                   	ret    

00000313 <lock_release>:
void 
lock_release(lock_t *lock){
 313:	55                   	push   %ebp
 314:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 316:	8b 45 08             	mov    0x8(%ebp),%eax
 319:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    

00000321 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 327:	68 04 20 00 00       	push   $0x2004
 32c:	e8 d2 03 00 00       	call   703 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 331:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 334:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 336:	eb 03                	jmp    33b <thread_create+0x1a>
      stack += 1;
 338:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 33b:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 341:	75 f5                	jne    338 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 343:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 345:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 348:	52                   	push   %edx
 349:	ff 75 10             	push   0x10(%ebp)
 34c:	ff 75 0c             	push   0xc(%ebp)
 34f:	ff 75 08             	push   0x8(%ebp)
 352:	e8 d1 00 00 00       	call   428 <clone>
 
    return pid;
}
 357:	c9                   	leave  
 358:	c3                   	ret    

00000359 <thread_join>:
int 
thread_join(){
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	53                   	push   %ebx
 35d:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 360:	8d 45 f4             	lea    -0xc(%ebp),%eax
 363:	50                   	push   %eax
 364:	e8 c7 00 00 00       	call   430 <join>
 369:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 36b:	83 c4 04             	add    $0x4,%esp
 36e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 371:	ff 70 fc             	push   -0x4(%eax)
 374:	e8 ca 02 00 00       	call   643 <free>
  return waitedForPID;
 379:	89 d8                	mov    %ebx,%eax
 37b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 37e:	c9                   	leave  
 37f:	c3                   	ret    

00000380 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 380:	b8 01 00 00 00       	mov    $0x1,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <exit>:
SYSCALL(exit)
 388:	b8 02 00 00 00       	mov    $0x2,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <wait>:
SYSCALL(wait)
 390:	b8 03 00 00 00       	mov    $0x3,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <pipe>:
SYSCALL(pipe)
 398:	b8 04 00 00 00       	mov    $0x4,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <read>:
SYSCALL(read)
 3a0:	b8 05 00 00 00       	mov    $0x5,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <write>:
SYSCALL(write)
 3a8:	b8 10 00 00 00       	mov    $0x10,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <close>:
SYSCALL(close)
 3b0:	b8 15 00 00 00       	mov    $0x15,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <kill>:
SYSCALL(kill)
 3b8:	b8 06 00 00 00       	mov    $0x6,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <exec>:
SYSCALL(exec)
 3c0:	b8 07 00 00 00       	mov    $0x7,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <open>:
SYSCALL(open)
 3c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <mknod>:
SYSCALL(mknod)
 3d0:	b8 11 00 00 00       	mov    $0x11,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <unlink>:
SYSCALL(unlink)
 3d8:	b8 12 00 00 00       	mov    $0x12,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <fstat>:
SYSCALL(fstat)
 3e0:	b8 08 00 00 00       	mov    $0x8,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <link>:
SYSCALL(link)
 3e8:	b8 13 00 00 00       	mov    $0x13,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <mkdir>:
SYSCALL(mkdir)
 3f0:	b8 14 00 00 00       	mov    $0x14,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <chdir>:
SYSCALL(chdir)
 3f8:	b8 09 00 00 00       	mov    $0x9,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <dup>:
SYSCALL(dup)
 400:	b8 0a 00 00 00       	mov    $0xa,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <getpid>:
SYSCALL(getpid)
 408:	b8 0b 00 00 00       	mov    $0xb,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <sbrk>:
SYSCALL(sbrk)
 410:	b8 0c 00 00 00       	mov    $0xc,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <sleep>:
SYSCALL(sleep)
 418:	b8 0d 00 00 00       	mov    $0xd,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <uptime>:
SYSCALL(uptime)
 420:	b8 0e 00 00 00       	mov    $0xe,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <clone>:
SYSCALL(clone)
 428:	b8 16 00 00 00       	mov    $0x16,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <join>:
SYSCALL(join)
 430:	b8 17 00 00 00       	mov    $0x17,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	83 ec 1c             	sub    $0x1c,%esp
 43e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 441:	6a 01                	push   $0x1
 443:	8d 55 f4             	lea    -0xc(%ebp),%edx
 446:	52                   	push   %edx
 447:	50                   	push   %eax
 448:	e8 5b ff ff ff       	call   3a8 <write>
}
 44d:	83 c4 10             	add    $0x10,%esp
 450:	c9                   	leave  
 451:	c3                   	ret    

00000452 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	57                   	push   %edi
 456:	56                   	push   %esi
 457:	53                   	push   %ebx
 458:	83 ec 2c             	sub    $0x2c,%esp
 45b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 45e:	89 d0                	mov    %edx,%eax
 460:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 462:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 466:	0f 95 c1             	setne  %cl
 469:	c1 ea 1f             	shr    $0x1f,%edx
 46c:	84 d1                	test   %dl,%cl
 46e:	74 44                	je     4b4 <printint+0x62>
    neg = 1;
    x = -xx;
 470:	f7 d8                	neg    %eax
 472:	89 c1                	mov    %eax,%ecx
    neg = 1;
 474:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 47b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	ba 00 00 00 00       	mov    $0x0,%edx
 487:	f7 f6                	div    %esi
 489:	89 df                	mov    %ebx,%edi
 48b:	83 c3 01             	add    $0x1,%ebx
 48e:	0f b6 92 54 08 00 00 	movzbl 0x854(%edx),%edx
 495:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 499:	89 ca                	mov    %ecx,%edx
 49b:	89 c1                	mov    %eax,%ecx
 49d:	39 d6                	cmp    %edx,%esi
 49f:	76 df                	jbe    480 <printint+0x2e>
  if(neg)
 4a1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4a5:	74 31                	je     4d8 <printint+0x86>
    buf[i++] = '-';
 4a7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4ac:	8d 5f 02             	lea    0x2(%edi),%ebx
 4af:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b2:	eb 17                	jmp    4cb <printint+0x79>
    x = xx;
 4b4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4b6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4bd:	eb bc                	jmp    47b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4bf:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4c4:	89 f0                	mov    %esi,%eax
 4c6:	e8 6d ff ff ff       	call   438 <putc>
  while(--i >= 0)
 4cb:	83 eb 01             	sub    $0x1,%ebx
 4ce:	79 ef                	jns    4bf <printint+0x6d>
}
 4d0:	83 c4 2c             	add    $0x2c,%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
 4d8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4db:	eb ee                	jmp    4cb <printint+0x79>

000004dd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4dd:	55                   	push   %ebp
 4de:	89 e5                	mov    %esp,%ebp
 4e0:	57                   	push   %edi
 4e1:	56                   	push   %esi
 4e2:	53                   	push   %ebx
 4e3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4e6:	8d 45 10             	lea    0x10(%ebp),%eax
 4e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4ec:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f6:	eb 14                	jmp    50c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4f8:	89 fa                	mov    %edi,%edx
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	e8 36 ff ff ff       	call   438 <putc>
 502:	eb 05                	jmp    509 <printf+0x2c>
      }
    } else if(state == '%'){
 504:	83 fe 25             	cmp    $0x25,%esi
 507:	74 25                	je     52e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 509:	83 c3 01             	add    $0x1,%ebx
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 513:	84 c0                	test   %al,%al
 515:	0f 84 20 01 00 00    	je     63b <printf+0x15e>
    c = fmt[i] & 0xff;
 51b:	0f be f8             	movsbl %al,%edi
 51e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 521:	85 f6                	test   %esi,%esi
 523:	75 df                	jne    504 <printf+0x27>
      if(c == '%'){
 525:	83 f8 25             	cmp    $0x25,%eax
 528:	75 ce                	jne    4f8 <printf+0x1b>
        state = '%';
 52a:	89 c6                	mov    %eax,%esi
 52c:	eb db                	jmp    509 <printf+0x2c>
      if(c == 'd'){
 52e:	83 f8 25             	cmp    $0x25,%eax
 531:	0f 84 cf 00 00 00    	je     606 <printf+0x129>
 537:	0f 8c dd 00 00 00    	jl     61a <printf+0x13d>
 53d:	83 f8 78             	cmp    $0x78,%eax
 540:	0f 8f d4 00 00 00    	jg     61a <printf+0x13d>
 546:	83 f8 63             	cmp    $0x63,%eax
 549:	0f 8c cb 00 00 00    	jl     61a <printf+0x13d>
 54f:	83 e8 63             	sub    $0x63,%eax
 552:	83 f8 15             	cmp    $0x15,%eax
 555:	0f 87 bf 00 00 00    	ja     61a <printf+0x13d>
 55b:	ff 24 85 fc 07 00 00 	jmp    *0x7fc(,%eax,4)
        printint(fd, *ap, 10, 1);
 562:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 565:	8b 17                	mov    (%edi),%edx
 567:	83 ec 0c             	sub    $0xc,%esp
 56a:	6a 01                	push   $0x1
 56c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	e8 d9 fe ff ff       	call   452 <printint>
        ap++;
 579:	83 c7 04             	add    $0x4,%edi
 57c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
 587:	eb 80                	jmp    509 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 589:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58c:	8b 17                	mov    (%edi),%edx
 58e:	83 ec 0c             	sub    $0xc,%esp
 591:	6a 00                	push   $0x0
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	e8 b2 fe ff ff       	call   452 <printint>
        ap++;
 5a0:	83 c7 04             	add    $0x4,%edi
 5a3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a9:	be 00 00 00 00       	mov    $0x0,%esi
 5ae:	e9 56 ff ff ff       	jmp    509 <printf+0x2c>
        s = (char*)*ap;
 5b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b6:	8b 30                	mov    (%eax),%esi
        ap++;
 5b8:	83 c0 04             	add    $0x4,%eax
 5bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5be:	85 f6                	test   %esi,%esi
 5c0:	75 15                	jne    5d7 <printf+0xfa>
          s = "(null)";
 5c2:	be f2 07 00 00       	mov    $0x7f2,%esi
 5c7:	eb 0e                	jmp    5d7 <printf+0xfa>
          putc(fd, *s);
 5c9:	0f be d2             	movsbl %dl,%edx
 5cc:	8b 45 08             	mov    0x8(%ebp),%eax
 5cf:	e8 64 fe ff ff       	call   438 <putc>
          s++;
 5d4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5d7:	0f b6 16             	movzbl (%esi),%edx
 5da:	84 d2                	test   %dl,%dl
 5dc:	75 eb                	jne    5c9 <printf+0xec>
      state = 0;
 5de:	be 00 00 00 00       	mov    $0x0,%esi
 5e3:	e9 21 ff ff ff       	jmp    509 <printf+0x2c>
        putc(fd, *ap);
 5e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5eb:	0f be 17             	movsbl (%edi),%edx
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	e8 42 fe ff ff       	call   438 <putc>
        ap++;
 5f6:	83 c7 04             	add    $0x4,%edi
 5f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5fc:	be 00 00 00 00       	mov    $0x0,%esi
 601:	e9 03 ff ff ff       	jmp    509 <printf+0x2c>
        putc(fd, c);
 606:	89 fa                	mov    %edi,%edx
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	e8 28 fe ff ff       	call   438 <putc>
      state = 0;
 610:	be 00 00 00 00       	mov    $0x0,%esi
 615:	e9 ef fe ff ff       	jmp    509 <printf+0x2c>
        putc(fd, '%');
 61a:	ba 25 00 00 00       	mov    $0x25,%edx
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	e8 11 fe ff ff       	call   438 <putc>
        putc(fd, c);
 627:	89 fa                	mov    %edi,%edx
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	e8 07 fe ff ff       	call   438 <putc>
      state = 0;
 631:	be 00 00 00 00       	mov    $0x0,%esi
 636:	e9 ce fe ff ff       	jmp    509 <printf+0x2c>
    }
  }
}
 63b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63e:	5b                   	pop    %ebx
 63f:	5e                   	pop    %esi
 640:	5f                   	pop    %edi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    

00000643 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 643:	55                   	push   %ebp
 644:	89 e5                	mov    %esp,%ebp
 646:	57                   	push   %edi
 647:	56                   	push   %esi
 648:	53                   	push   %ebx
 649:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64f:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 654:	eb 02                	jmp    658 <free+0x15>
 656:	89 d0                	mov    %edx,%eax
 658:	39 c8                	cmp    %ecx,%eax
 65a:	73 04                	jae    660 <free+0x1d>
 65c:	39 08                	cmp    %ecx,(%eax)
 65e:	77 12                	ja     672 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 660:	8b 10                	mov    (%eax),%edx
 662:	39 c2                	cmp    %eax,%edx
 664:	77 f0                	ja     656 <free+0x13>
 666:	39 c8                	cmp    %ecx,%eax
 668:	72 08                	jb     672 <free+0x2f>
 66a:	39 ca                	cmp    %ecx,%edx
 66c:	77 04                	ja     672 <free+0x2f>
 66e:	89 d0                	mov    %edx,%eax
 670:	eb e6                	jmp    658 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 672:	8b 73 fc             	mov    -0x4(%ebx),%esi
 675:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 678:	8b 10                	mov    (%eax),%edx
 67a:	39 d7                	cmp    %edx,%edi
 67c:	74 19                	je     697 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 67e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 681:	8b 50 04             	mov    0x4(%eax),%edx
 684:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 687:	39 ce                	cmp    %ecx,%esi
 689:	74 1b                	je     6a6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 68b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 68d:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 692:	5b                   	pop    %ebx
 693:	5e                   	pop    %esi
 694:	5f                   	pop    %edi
 695:	5d                   	pop    %ebp
 696:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 697:	03 72 04             	add    0x4(%edx),%esi
 69a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 69d:	8b 10                	mov    (%eax),%edx
 69f:	8b 12                	mov    (%edx),%edx
 6a1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6a4:	eb db                	jmp    681 <free+0x3e>
    p->s.size += bp->s.size;
 6a6:	03 53 fc             	add    -0x4(%ebx),%edx
 6a9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ac:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6af:	89 10                	mov    %edx,(%eax)
 6b1:	eb da                	jmp    68d <free+0x4a>

000006b3 <morecore>:

static Header*
morecore(uint nu)
{
 6b3:	55                   	push   %ebp
 6b4:	89 e5                	mov    %esp,%ebp
 6b6:	53                   	push   %ebx
 6b7:	83 ec 04             	sub    $0x4,%esp
 6ba:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6bc:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6c1:	77 05                	ja     6c8 <morecore+0x15>
    nu = 4096;
 6c3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6c8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6cf:	83 ec 0c             	sub    $0xc,%esp
 6d2:	50                   	push   %eax
 6d3:	e8 38 fd ff ff       	call   410 <sbrk>
  if(p == (char*)-1)
 6d8:	83 c4 10             	add    $0x10,%esp
 6db:	83 f8 ff             	cmp    $0xffffffff,%eax
 6de:	74 1c                	je     6fc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6e3:	83 c0 08             	add    $0x8,%eax
 6e6:	83 ec 0c             	sub    $0xc,%esp
 6e9:	50                   	push   %eax
 6ea:	e8 54 ff ff ff       	call   643 <free>
  return freep;
 6ef:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 6f4:	83 c4 10             	add    $0x10,%esp
}
 6f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6fa:	c9                   	leave  
 6fb:	c3                   	ret    
    return 0;
 6fc:	b8 00 00 00 00       	mov    $0x0,%eax
 701:	eb f4                	jmp    6f7 <morecore+0x44>

00000703 <malloc>:

void*
malloc(uint nbytes)
{
 703:	55                   	push   %ebp
 704:	89 e5                	mov    %esp,%ebp
 706:	53                   	push   %ebx
 707:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	8d 58 07             	lea    0x7(%eax),%ebx
 710:	c1 eb 03             	shr    $0x3,%ebx
 713:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 716:	8b 0d c4 0b 00 00    	mov    0xbc4,%ecx
 71c:	85 c9                	test   %ecx,%ecx
 71e:	74 04                	je     724 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 720:	8b 01                	mov    (%ecx),%eax
 722:	eb 4a                	jmp    76e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 724:	c7 05 c4 0b 00 00 c8 	movl   $0xbc8,0xbc4
 72b:	0b 00 00 
 72e:	c7 05 c8 0b 00 00 c8 	movl   $0xbc8,0xbc8
 735:	0b 00 00 
    base.s.size = 0;
 738:	c7 05 cc 0b 00 00 00 	movl   $0x0,0xbcc
 73f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 742:	b9 c8 0b 00 00       	mov    $0xbc8,%ecx
 747:	eb d7                	jmp    720 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 749:	74 19                	je     764 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 74b:	29 da                	sub    %ebx,%edx
 74d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 750:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 753:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 756:	89 0d c4 0b 00 00    	mov    %ecx,0xbc4
      return (void*)(p + 1);
 75c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 75f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 762:	c9                   	leave  
 763:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 764:	8b 10                	mov    (%eax),%edx
 766:	89 11                	mov    %edx,(%ecx)
 768:	eb ec                	jmp    756 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 76a:	89 c1                	mov    %eax,%ecx
 76c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 76e:	8b 50 04             	mov    0x4(%eax),%edx
 771:	39 da                	cmp    %ebx,%edx
 773:	73 d4                	jae    749 <malloc+0x46>
    if(p == freep)
 775:	39 05 c4 0b 00 00    	cmp    %eax,0xbc4
 77b:	75 ed                	jne    76a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 77d:	89 d8                	mov    %ebx,%eax
 77f:	e8 2f ff ff ff       	call   6b3 <morecore>
 784:	85 c0                	test   %eax,%eax
 786:	75 e2                	jne    76a <malloc+0x67>
 788:	eb d5                	jmp    75f <malloc+0x5c>
