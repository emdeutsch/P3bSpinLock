
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
  11:	e8 f1 03 00 00       	call   407 <getpid>
  16:	a3 c0 0b 00 00       	mov    %eax,0xbc0

   int fork_pid = fork();
  1b:	e8 5f 03 00 00       	call   37f <fork>
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
  2d:	e8 fd 03 00 00       	call   42f <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 8c 07 00 00       	push   $0x78c
  45:	68 95 07 00 00       	push   $0x795
  4a:	6a 01                	push   $0x1
  4c:	e8 8b 04 00 00       	call   4dc <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 cb 07 00 00       	push   $0x7cb
  59:	68 aa 07 00 00       	push   $0x7aa
  5e:	6a 01                	push   $0x1
  60:	e8 77 04 00 00       	call   4dc <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 be 07 00 00       	push   $0x7be
  6d:	6a 01                	push   $0x1
  6f:	e8 68 04 00 00       	call   4dc <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 c0 0b 00 00    	push   0xbc0
  7d:	e8 35 03 00 00       	call   3b7 <kill>
  82:	e8 00 03 00 00       	call   387 <exit>
     exit();
  87:	e8 fb 02 00 00       	call   387 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 8c 07 00 00       	push   $0x78c
  93:	68 95 07 00 00       	push   $0x795
  98:	6a 01                	push   $0x1
  9a:	e8 3d 04 00 00       	call   4dc <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 9d 07 00 00       	push   $0x79d
  a7:	68 aa 07 00 00       	push   $0x7aa
  ac:	6a 01                	push   $0x1
  ae:	e8 29 04 00 00       	call   4dc <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 be 07 00 00       	push   $0x7be
  bb:	6a 01                	push   $0x1
  bd:	e8 1a 04 00 00       	call   4dc <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 c0 0b 00 00    	push   0xbc0
  cb:	e8 e7 02 00 00       	call   3b7 <kill>
  d0:	e8 b2 02 00 00       	call   387 <exit>

   assert(wait() > 0);
  d5:	e8 b5 02 00 00       	call   38f <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 e5 07 00 00       	push   $0x7e5
  e6:	6a 01                	push   $0x1
  e8:	e8 ef 03 00 00       	call   4dc <printf>
   exit();
  ed:	e8 95 02 00 00       	call   387 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 8c 07 00 00       	push   $0x78c
  f9:	68 95 07 00 00       	push   $0x795
  fe:	6a 01                	push   $0x1
 100:	e8 d7 03 00 00       	call   4dc <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 da 07 00 00       	push   $0x7da
 10d:	68 aa 07 00 00       	push   $0x7aa
 112:	6a 01                	push   $0x1
 114:	e8 c3 03 00 00       	call   4dc <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 be 07 00 00       	push   $0x7be
 121:	6a 01                	push   $0x1
 123:	e8 b4 03 00 00       	call   4dc <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 c0 0b 00 00    	push   0xbc0
 131:	e8 81 02 00 00       	call   3b7 <kill>
 136:	e8 4c 02 00 00       	call   387 <exit>

0000013b <strcpy>:
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
 201:	e8 99 01 00 00       	call   39f <read>
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
 23f:	e8 83 01 00 00       	call   3c7 <open>
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
 254:	e8 86 01 00 00       	call   3df <fstat>
 259:	89 c6                	mov    %eax,%esi
  close(fd);
 25b:	89 1c 24             	mov    %ebx,(%esp)
 25e:	e8 4c 01 00 00       	call   3af <close>
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
 32c:	e8 d1 03 00 00       	call   702 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 331:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 334:	83 c4 10             	add    $0x10,%esp
 337:	eb 03                	jmp    33c <thread_create+0x1b>
      stack += 1;
 339:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 33c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 342:	75 f5                	jne    339 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 344:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 347:	52                   	push   %edx
 348:	ff 75 10             	push   0x10(%ebp)
 34b:	ff 75 0c             	push   0xc(%ebp)
 34e:	ff 75 08             	push   0x8(%ebp)
 351:	e8 d1 00 00 00       	call   427 <clone>
 
    return pid;
}
 356:	c9                   	leave  
 357:	c3                   	ret    

00000358 <thread_join>:
int 
thread_join(){
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	53                   	push   %ebx
 35c:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 35f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 362:	50                   	push   %eax
 363:	e8 c7 00 00 00       	call   42f <join>
 368:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 370:	ff 70 fc             	push   -0x4(%eax)
 373:	e8 ca 02 00 00       	call   642 <free>
  return pid;
 378:	89 d8                	mov    %ebx,%eax
 37a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 37d:	c9                   	leave  
 37e:	c3                   	ret    

0000037f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37f:	b8 01 00 00 00       	mov    $0x1,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <exit>:
SYSCALL(exit)
 387:	b8 02 00 00 00       	mov    $0x2,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <wait>:
SYSCALL(wait)
 38f:	b8 03 00 00 00       	mov    $0x3,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <pipe>:
SYSCALL(pipe)
 397:	b8 04 00 00 00       	mov    $0x4,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <read>:
SYSCALL(read)
 39f:	b8 05 00 00 00       	mov    $0x5,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <write>:
SYSCALL(write)
 3a7:	b8 10 00 00 00       	mov    $0x10,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <close>:
SYSCALL(close)
 3af:	b8 15 00 00 00       	mov    $0x15,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <kill>:
SYSCALL(kill)
 3b7:	b8 06 00 00 00       	mov    $0x6,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <exec>:
SYSCALL(exec)
 3bf:	b8 07 00 00 00       	mov    $0x7,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <open>:
SYSCALL(open)
 3c7:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <mknod>:
SYSCALL(mknod)
 3cf:	b8 11 00 00 00       	mov    $0x11,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <unlink>:
SYSCALL(unlink)
 3d7:	b8 12 00 00 00       	mov    $0x12,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <fstat>:
SYSCALL(fstat)
 3df:	b8 08 00 00 00       	mov    $0x8,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <link>:
SYSCALL(link)
 3e7:	b8 13 00 00 00       	mov    $0x13,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <mkdir>:
SYSCALL(mkdir)
 3ef:	b8 14 00 00 00       	mov    $0x14,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <chdir>:
SYSCALL(chdir)
 3f7:	b8 09 00 00 00       	mov    $0x9,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <dup>:
SYSCALL(dup)
 3ff:	b8 0a 00 00 00       	mov    $0xa,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <getpid>:
SYSCALL(getpid)
 407:	b8 0b 00 00 00       	mov    $0xb,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <sbrk>:
SYSCALL(sbrk)
 40f:	b8 0c 00 00 00       	mov    $0xc,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <sleep>:
SYSCALL(sleep)
 417:	b8 0d 00 00 00       	mov    $0xd,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <uptime>:
SYSCALL(uptime)
 41f:	b8 0e 00 00 00       	mov    $0xe,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <clone>:
SYSCALL(clone)
 427:	b8 16 00 00 00       	mov    $0x16,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <join>:
SYSCALL(join)
 42f:	b8 17 00 00 00       	mov    $0x17,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	83 ec 1c             	sub    $0x1c,%esp
 43d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 440:	6a 01                	push   $0x1
 442:	8d 55 f4             	lea    -0xc(%ebp),%edx
 445:	52                   	push   %edx
 446:	50                   	push   %eax
 447:	e8 5b ff ff ff       	call   3a7 <write>
}
 44c:	83 c4 10             	add    $0x10,%esp
 44f:	c9                   	leave  
 450:	c3                   	ret    

00000451 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 451:	55                   	push   %ebp
 452:	89 e5                	mov    %esp,%ebp
 454:	57                   	push   %edi
 455:	56                   	push   %esi
 456:	53                   	push   %ebx
 457:	83 ec 2c             	sub    $0x2c,%esp
 45a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 45d:	89 d0                	mov    %edx,%eax
 45f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 461:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 465:	0f 95 c1             	setne  %cl
 468:	c1 ea 1f             	shr    $0x1f,%edx
 46b:	84 d1                	test   %dl,%cl
 46d:	74 44                	je     4b3 <printint+0x62>
    neg = 1;
    x = -xx;
 46f:	f7 d8                	neg    %eax
 471:	89 c1                	mov    %eax,%ecx
    neg = 1;
 473:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 47a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 47f:	89 c8                	mov    %ecx,%eax
 481:	ba 00 00 00 00       	mov    $0x0,%edx
 486:	f7 f6                	div    %esi
 488:	89 df                	mov    %ebx,%edi
 48a:	83 c3 01             	add    $0x1,%ebx
 48d:	0f b6 92 54 08 00 00 	movzbl 0x854(%edx),%edx
 494:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 498:	89 ca                	mov    %ecx,%edx
 49a:	89 c1                	mov    %eax,%ecx
 49c:	39 d6                	cmp    %edx,%esi
 49e:	76 df                	jbe    47f <printint+0x2e>
  if(neg)
 4a0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4a4:	74 31                	je     4d7 <printint+0x86>
    buf[i++] = '-';
 4a6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4ab:	8d 5f 02             	lea    0x2(%edi),%ebx
 4ae:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b1:	eb 17                	jmp    4ca <printint+0x79>
    x = xx;
 4b3:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4b5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4bc:	eb bc                	jmp    47a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4be:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4c3:	89 f0                	mov    %esi,%eax
 4c5:	e8 6d ff ff ff       	call   437 <putc>
  while(--i >= 0)
 4ca:	83 eb 01             	sub    $0x1,%ebx
 4cd:	79 ef                	jns    4be <printint+0x6d>
}
 4cf:	83 c4 2c             	add    $0x2c,%esp
 4d2:	5b                   	pop    %ebx
 4d3:	5e                   	pop    %esi
 4d4:	5f                   	pop    %edi
 4d5:	5d                   	pop    %ebp
 4d6:	c3                   	ret    
 4d7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4da:	eb ee                	jmp    4ca <printint+0x79>

000004dc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4dc:	55                   	push   %ebp
 4dd:	89 e5                	mov    %esp,%ebp
 4df:	57                   	push   %edi
 4e0:	56                   	push   %esi
 4e1:	53                   	push   %ebx
 4e2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4e5:	8d 45 10             	lea    0x10(%ebp),%eax
 4e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4eb:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f5:	eb 14                	jmp    50b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4f7:	89 fa                	mov    %edi,%edx
 4f9:	8b 45 08             	mov    0x8(%ebp),%eax
 4fc:	e8 36 ff ff ff       	call   437 <putc>
 501:	eb 05                	jmp    508 <printf+0x2c>
      }
    } else if(state == '%'){
 503:	83 fe 25             	cmp    $0x25,%esi
 506:	74 25                	je     52d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 508:	83 c3 01             	add    $0x1,%ebx
 50b:	8b 45 0c             	mov    0xc(%ebp),%eax
 50e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 512:	84 c0                	test   %al,%al
 514:	0f 84 20 01 00 00    	je     63a <printf+0x15e>
    c = fmt[i] & 0xff;
 51a:	0f be f8             	movsbl %al,%edi
 51d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 520:	85 f6                	test   %esi,%esi
 522:	75 df                	jne    503 <printf+0x27>
      if(c == '%'){
 524:	83 f8 25             	cmp    $0x25,%eax
 527:	75 ce                	jne    4f7 <printf+0x1b>
        state = '%';
 529:	89 c6                	mov    %eax,%esi
 52b:	eb db                	jmp    508 <printf+0x2c>
      if(c == 'd'){
 52d:	83 f8 25             	cmp    $0x25,%eax
 530:	0f 84 cf 00 00 00    	je     605 <printf+0x129>
 536:	0f 8c dd 00 00 00    	jl     619 <printf+0x13d>
 53c:	83 f8 78             	cmp    $0x78,%eax
 53f:	0f 8f d4 00 00 00    	jg     619 <printf+0x13d>
 545:	83 f8 63             	cmp    $0x63,%eax
 548:	0f 8c cb 00 00 00    	jl     619 <printf+0x13d>
 54e:	83 e8 63             	sub    $0x63,%eax
 551:	83 f8 15             	cmp    $0x15,%eax
 554:	0f 87 bf 00 00 00    	ja     619 <printf+0x13d>
 55a:	ff 24 85 fc 07 00 00 	jmp    *0x7fc(,%eax,4)
        printint(fd, *ap, 10, 1);
 561:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 564:	8b 17                	mov    (%edi),%edx
 566:	83 ec 0c             	sub    $0xc,%esp
 569:	6a 01                	push   $0x1
 56b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	e8 d9 fe ff ff       	call   451 <printint>
        ap++;
 578:	83 c7 04             	add    $0x4,%edi
 57b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 581:	be 00 00 00 00       	mov    $0x0,%esi
 586:	eb 80                	jmp    508 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 588:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58b:	8b 17                	mov    (%edi),%edx
 58d:	83 ec 0c             	sub    $0xc,%esp
 590:	6a 00                	push   $0x0
 592:	b9 10 00 00 00       	mov    $0x10,%ecx
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	e8 b2 fe ff ff       	call   451 <printint>
        ap++;
 59f:	83 c7 04             	add    $0x4,%edi
 5a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a8:	be 00 00 00 00       	mov    $0x0,%esi
 5ad:	e9 56 ff ff ff       	jmp    508 <printf+0x2c>
        s = (char*)*ap;
 5b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b5:	8b 30                	mov    (%eax),%esi
        ap++;
 5b7:	83 c0 04             	add    $0x4,%eax
 5ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5bd:	85 f6                	test   %esi,%esi
 5bf:	75 15                	jne    5d6 <printf+0xfa>
          s = "(null)";
 5c1:	be f2 07 00 00       	mov    $0x7f2,%esi
 5c6:	eb 0e                	jmp    5d6 <printf+0xfa>
          putc(fd, *s);
 5c8:	0f be d2             	movsbl %dl,%edx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 64 fe ff ff       	call   437 <putc>
          s++;
 5d3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5d6:	0f b6 16             	movzbl (%esi),%edx
 5d9:	84 d2                	test   %dl,%dl
 5db:	75 eb                	jne    5c8 <printf+0xec>
      state = 0;
 5dd:	be 00 00 00 00       	mov    $0x0,%esi
 5e2:	e9 21 ff ff ff       	jmp    508 <printf+0x2c>
        putc(fd, *ap);
 5e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ea:	0f be 17             	movsbl (%edi),%edx
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
 5f0:	e8 42 fe ff ff       	call   437 <putc>
        ap++;
 5f5:	83 c7 04             	add    $0x4,%edi
 5f8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5fb:	be 00 00 00 00       	mov    $0x0,%esi
 600:	e9 03 ff ff ff       	jmp    508 <printf+0x2c>
        putc(fd, c);
 605:	89 fa                	mov    %edi,%edx
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	e8 28 fe ff ff       	call   437 <putc>
      state = 0;
 60f:	be 00 00 00 00       	mov    $0x0,%esi
 614:	e9 ef fe ff ff       	jmp    508 <printf+0x2c>
        putc(fd, '%');
 619:	ba 25 00 00 00       	mov    $0x25,%edx
 61e:	8b 45 08             	mov    0x8(%ebp),%eax
 621:	e8 11 fe ff ff       	call   437 <putc>
        putc(fd, c);
 626:	89 fa                	mov    %edi,%edx
 628:	8b 45 08             	mov    0x8(%ebp),%eax
 62b:	e8 07 fe ff ff       	call   437 <putc>
      state = 0;
 630:	be 00 00 00 00       	mov    $0x0,%esi
 635:	e9 ce fe ff ff       	jmp    508 <printf+0x2c>
    }
  }
}
 63a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63d:	5b                   	pop    %ebx
 63e:	5e                   	pop    %esi
 63f:	5f                   	pop    %edi
 640:	5d                   	pop    %ebp
 641:	c3                   	ret    

00000642 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 642:	55                   	push   %ebp
 643:	89 e5                	mov    %esp,%ebp
 645:	57                   	push   %edi
 646:	56                   	push   %esi
 647:	53                   	push   %ebx
 648:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64e:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 653:	eb 02                	jmp    657 <free+0x15>
 655:	89 d0                	mov    %edx,%eax
 657:	39 c8                	cmp    %ecx,%eax
 659:	73 04                	jae    65f <free+0x1d>
 65b:	39 08                	cmp    %ecx,(%eax)
 65d:	77 12                	ja     671 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 65f:	8b 10                	mov    (%eax),%edx
 661:	39 c2                	cmp    %eax,%edx
 663:	77 f0                	ja     655 <free+0x13>
 665:	39 c8                	cmp    %ecx,%eax
 667:	72 08                	jb     671 <free+0x2f>
 669:	39 ca                	cmp    %ecx,%edx
 66b:	77 04                	ja     671 <free+0x2f>
 66d:	89 d0                	mov    %edx,%eax
 66f:	eb e6                	jmp    657 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 671:	8b 73 fc             	mov    -0x4(%ebx),%esi
 674:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 677:	8b 10                	mov    (%eax),%edx
 679:	39 d7                	cmp    %edx,%edi
 67b:	74 19                	je     696 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 67d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 680:	8b 50 04             	mov    0x4(%eax),%edx
 683:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 686:	39 ce                	cmp    %ecx,%esi
 688:	74 1b                	je     6a5 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 68a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 68c:	a3 c4 0b 00 00       	mov    %eax,0xbc4
}
 691:	5b                   	pop    %ebx
 692:	5e                   	pop    %esi
 693:	5f                   	pop    %edi
 694:	5d                   	pop    %ebp
 695:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 696:	03 72 04             	add    0x4(%edx),%esi
 699:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 69c:	8b 10                	mov    (%eax),%edx
 69e:	8b 12                	mov    (%edx),%edx
 6a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6a3:	eb db                	jmp    680 <free+0x3e>
    p->s.size += bp->s.size;
 6a5:	03 53 fc             	add    -0x4(%ebx),%edx
 6a8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ab:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ae:	89 10                	mov    %edx,(%eax)
 6b0:	eb da                	jmp    68c <free+0x4a>

000006b2 <morecore>:

static Header*
morecore(uint nu)
{
 6b2:	55                   	push   %ebp
 6b3:	89 e5                	mov    %esp,%ebp
 6b5:	53                   	push   %ebx
 6b6:	83 ec 04             	sub    $0x4,%esp
 6b9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6bb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6c0:	77 05                	ja     6c7 <morecore+0x15>
    nu = 4096;
 6c2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6c7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6ce:	83 ec 0c             	sub    $0xc,%esp
 6d1:	50                   	push   %eax
 6d2:	e8 38 fd ff ff       	call   40f <sbrk>
  if(p == (char*)-1)
 6d7:	83 c4 10             	add    $0x10,%esp
 6da:	83 f8 ff             	cmp    $0xffffffff,%eax
 6dd:	74 1c                	je     6fb <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6df:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6e2:	83 c0 08             	add    $0x8,%eax
 6e5:	83 ec 0c             	sub    $0xc,%esp
 6e8:	50                   	push   %eax
 6e9:	e8 54 ff ff ff       	call   642 <free>
  return freep;
 6ee:	a1 c4 0b 00 00       	mov    0xbc4,%eax
 6f3:	83 c4 10             	add    $0x10,%esp
}
 6f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f9:	c9                   	leave  
 6fa:	c3                   	ret    
    return 0;
 6fb:	b8 00 00 00 00       	mov    $0x0,%eax
 700:	eb f4                	jmp    6f6 <morecore+0x44>

00000702 <malloc>:

void*
malloc(uint nbytes)
{
 702:	55                   	push   %ebp
 703:	89 e5                	mov    %esp,%ebp
 705:	53                   	push   %ebx
 706:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	8d 58 07             	lea    0x7(%eax),%ebx
 70f:	c1 eb 03             	shr    $0x3,%ebx
 712:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 715:	8b 0d c4 0b 00 00    	mov    0xbc4,%ecx
 71b:	85 c9                	test   %ecx,%ecx
 71d:	74 04                	je     723 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 71f:	8b 01                	mov    (%ecx),%eax
 721:	eb 4a                	jmp    76d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 723:	c7 05 c4 0b 00 00 c8 	movl   $0xbc8,0xbc4
 72a:	0b 00 00 
 72d:	c7 05 c8 0b 00 00 c8 	movl   $0xbc8,0xbc8
 734:	0b 00 00 
    base.s.size = 0;
 737:	c7 05 cc 0b 00 00 00 	movl   $0x0,0xbcc
 73e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 741:	b9 c8 0b 00 00       	mov    $0xbc8,%ecx
 746:	eb d7                	jmp    71f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 748:	74 19                	je     763 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 74a:	29 da                	sub    %ebx,%edx
 74c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 74f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 752:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 755:	89 0d c4 0b 00 00    	mov    %ecx,0xbc4
      return (void*)(p + 1);
 75b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 75e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 761:	c9                   	leave  
 762:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 763:	8b 10                	mov    (%eax),%edx
 765:	89 11                	mov    %edx,(%ecx)
 767:	eb ec                	jmp    755 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 769:	89 c1                	mov    %eax,%ecx
 76b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 76d:	8b 50 04             	mov    0x4(%eax),%edx
 770:	39 da                	cmp    %ebx,%edx
 772:	73 d4                	jae    748 <malloc+0x46>
    if(p == freep)
 774:	39 05 c4 0b 00 00    	cmp    %eax,0xbc4
 77a:	75 ed                	jne    769 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 77c:	89 d8                	mov    %ebx,%eax
 77e:	e8 2f ff ff ff       	call   6b2 <morecore>
 783:	85 c0                	test   %eax,%eax
 785:	75 e2                	jne    769 <malloc+0x67>
 787:	eb d5                	jmp    75e <malloc+0x5c>
