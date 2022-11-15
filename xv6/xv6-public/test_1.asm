
_test_1:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   6:	a1 9c 0c 00 00       	mov    0xc9c,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 38 08 00 00       	push   $0x838
  17:	68 41 08 00 00       	push   $0x841
  1c:	6a 01                	push   $0x1
  1e:	e8 65 05 00 00       	call   588 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 49 08 00 00       	push   $0x849
  2b:	68 55 08 00 00       	push   $0x855
  30:	6a 01                	push   $0x1
  32:	e8 51 05 00 00       	call   588 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 69 08 00 00       	push   $0x869
  3f:	6a 01                	push   $0x1
  41:	e8 42 05 00 00       	call   588 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 a0 0c 00 00    	push   0xca0
  4f:	e8 0f 04 00 00       	call   463 <kill>
  54:	e8 da 03 00 00       	call   433 <exit>
   global = 5;
  59:	c7 05 9c 0c 00 00 05 	movl   $0x5,0xc9c
  60:	00 00 00 
   exit();
  63:	e8 cb 03 00 00       	call   433 <exit>

00000068 <main>:
{
  68:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6c:	83 e4 f0             	and    $0xfffffff0,%esp
  6f:	ff 71 fc             	push   -0x4(%ecx)
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	56                   	push   %esi
  76:	53                   	push   %ebx
  77:	51                   	push   %ecx
  78:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  7b:	e8 33 04 00 00       	call   4b3 <getpid>
  80:	a3 a0 0c 00 00       	mov    %eax,0xca0
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 1c 07 00 00       	call   7ae <malloc>
   assert(p != NULL);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	0f 84 a9 00 00 00    	je     146 <main+0xde>
  9d:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  9f:	89 c2                	mov    %eax,%edx
  a1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  a7:	74 09                	je     b2 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  a9:	b8 00 10 00 00       	mov    $0x1000,%eax
  ae:	29 d0                	sub    %edx,%eax
  b0:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, 0, 0, stack);
  b2:	50                   	push   %eax
  b3:	6a 00                	push   $0x0
  b5:	6a 00                	push   $0x0
  b7:	68 00 00 00 00       	push   $0x0
  bc:	e8 12 04 00 00       	call   4d3 <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 9c 0c 00 00       	mov    0xc9c,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 8e 08 00 00       	push   $0x88e
  e0:	6a 01                	push   $0x1
  e2:	e8 a1 04 00 00       	call   588 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 e9 03 00 00       	call   4db <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 38 08 00 00       	push   $0x838
 104:	68 41 08 00 00       	push   $0x841
 109:	6a 01                	push   $0x1
 10b:	e8 78 04 00 00       	call   588 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 9b 08 00 00       	push   $0x89b
 118:	68 55 08 00 00       	push   $0x855
 11d:	6a 01                	push   $0x1
 11f:	e8 64 04 00 00       	call   588 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 69 08 00 00       	push   $0x869
 12c:	6a 01                	push   $0x1
 12e:	e8 55 04 00 00       	call   588 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 a0 0c 00 00    	push   0xca0
 13c:	e8 22 03 00 00       	call   463 <kill>
 141:	e8 ed 02 00 00       	call   433 <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 38 08 00 00       	push   $0x838
 14d:	68 41 08 00 00       	push   $0x841
 152:	6a 01                	push   $0x1
 154:	e8 2f 04 00 00       	call   588 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 76 08 00 00       	push   $0x876
 161:	68 55 08 00 00       	push   $0x855
 166:	6a 01                	push   $0x1
 168:	e8 1b 04 00 00       	call   588 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 69 08 00 00       	push   $0x869
 175:	6a 01                	push   $0x1
 177:	e8 0c 04 00 00       	call   588 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 a0 0c 00 00    	push   0xca0
 185:	e8 d9 02 00 00       	call   463 <kill>
 18a:	e8 a4 02 00 00       	call   433 <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 38 08 00 00       	push   $0x838
 196:	68 41 08 00 00       	push   $0x841
 19b:	6a 01                	push   $0x1
 19d:	e8 e6 03 00 00       	call   588 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 80 08 00 00       	push   $0x880
 1aa:	68 55 08 00 00       	push   $0x855
 1af:	6a 01                	push   $0x1
 1b1:	e8 d2 03 00 00       	call   588 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 69 08 00 00       	push   $0x869
 1be:	6a 01                	push   $0x1
 1c0:	e8 c3 03 00 00       	call   588 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 a0 0c 00 00    	push   0xca0
 1ce:	e8 90 02 00 00       	call   463 <kill>
 1d3:	e8 5b 02 00 00       	call   433 <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 0d 05 00 00       	call   6ee <free>
   exit();
 1e1:	e8 4d 02 00 00       	call   433 <exit>

000001e6 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	56                   	push   %esi
 1ea:	53                   	push   %ebx
 1eb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f1:	89 f0                	mov    %esi,%eax
 1f3:	89 d1                	mov    %edx,%ecx
 1f5:	83 c2 01             	add    $0x1,%edx
 1f8:	89 c3                	mov    %eax,%ebx
 1fa:	83 c0 01             	add    $0x1,%eax
 1fd:	0f b6 09             	movzbl (%ecx),%ecx
 200:	88 0b                	mov    %cl,(%ebx)
 202:	84 c9                	test   %cl,%cl
 204:	75 ed                	jne    1f3 <strcpy+0xd>
    ;
  return os;
}
 206:	89 f0                	mov    %esi,%eax
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    

0000020c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 212:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 215:	eb 06                	jmp    21d <strcmp+0x11>
    p++, q++;
 217:	83 c1 01             	add    $0x1,%ecx
 21a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 21d:	0f b6 01             	movzbl (%ecx),%eax
 220:	84 c0                	test   %al,%al
 222:	74 04                	je     228 <strcmp+0x1c>
 224:	3a 02                	cmp    (%edx),%al
 226:	74 ef                	je     217 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 228:	0f b6 c0             	movzbl %al,%eax
 22b:	0f b6 12             	movzbl (%edx),%edx
 22e:	29 d0                	sub    %edx,%eax
}
 230:	5d                   	pop    %ebp
 231:	c3                   	ret    

00000232 <strlen>:

uint
strlen(const char *s)
{
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 238:	b8 00 00 00 00       	mov    $0x0,%eax
 23d:	eb 03                	jmp    242 <strlen+0x10>
 23f:	83 c0 01             	add    $0x1,%eax
 242:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 246:	75 f7                	jne    23f <strlen+0xd>
    ;
  return n;
}
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <memset>:

void*
memset(void *dst, int c, uint n)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	57                   	push   %edi
 24e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 251:	89 d7                	mov    %edx,%edi
 253:	8b 4d 10             	mov    0x10(%ebp),%ecx
 256:	8b 45 0c             	mov    0xc(%ebp),%eax
 259:	fc                   	cld    
 25a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <strchr>:

char*
strchr(const char *s, char c)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26d:	eb 03                	jmp    272 <strchr+0xf>
 26f:	83 c0 01             	add    $0x1,%eax
 272:	0f b6 10             	movzbl (%eax),%edx
 275:	84 d2                	test   %dl,%dl
 277:	74 06                	je     27f <strchr+0x1c>
    if(*s == c)
 279:	38 ca                	cmp    %cl,%dl
 27b:	75 f2                	jne    26f <strchr+0xc>
 27d:	eb 05                	jmp    284 <strchr+0x21>
      return (char*)s;
  return 0;
 27f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 284:	5d                   	pop    %ebp
 285:	c3                   	ret    

00000286 <gets>:

char*
gets(char *buf, int max)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	57                   	push   %edi
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	83 ec 1c             	sub    $0x1c,%esp
 28f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 292:	bb 00 00 00 00       	mov    $0x0,%ebx
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7d 2e                	jge    2cf <gets+0x49>
    cc = read(0, &c, 1);
 2a1:	83 ec 04             	sub    $0x4,%esp
 2a4:	6a 01                	push   $0x1
 2a6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a9:	50                   	push   %eax
 2aa:	6a 00                	push   $0x0
 2ac:	e8 9a 01 00 00       	call   44b <read>
    if(cc < 1)
 2b1:	83 c4 10             	add    $0x10,%esp
 2b4:	85 c0                	test   %eax,%eax
 2b6:	7e 17                	jle    2cf <gets+0x49>
      break;
    buf[i++] = c;
 2b8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2bc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2bf:	3c 0a                	cmp    $0xa,%al
 2c1:	0f 94 c2             	sete   %dl
 2c4:	3c 0d                	cmp    $0xd,%al
 2c6:	0f 94 c0             	sete   %al
 2c9:	08 c2                	or     %al,%dl
 2cb:	74 ca                	je     297 <gets+0x11>
    buf[i++] = c;
 2cd:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2cf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d3:	89 f8                	mov    %edi,%eax
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    

000002dd <stat>:

int
stat(const char *n, struct stat *st)
{
 2dd:	55                   	push   %ebp
 2de:	89 e5                	mov    %esp,%ebp
 2e0:	56                   	push   %esi
 2e1:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e2:	83 ec 08             	sub    $0x8,%esp
 2e5:	6a 00                	push   $0x0
 2e7:	ff 75 08             	push   0x8(%ebp)
 2ea:	e8 84 01 00 00       	call   473 <open>
  if(fd < 0)
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	85 c0                	test   %eax,%eax
 2f4:	78 24                	js     31a <stat+0x3d>
 2f6:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2f8:	83 ec 08             	sub    $0x8,%esp
 2fb:	ff 75 0c             	push   0xc(%ebp)
 2fe:	50                   	push   %eax
 2ff:	e8 87 01 00 00       	call   48b <fstat>
 304:	89 c6                	mov    %eax,%esi
  close(fd);
 306:	89 1c 24             	mov    %ebx,(%esp)
 309:	e8 4d 01 00 00       	call   45b <close>
  return r;
 30e:	83 c4 10             	add    $0x10,%esp
}
 311:	89 f0                	mov    %esi,%eax
 313:	8d 65 f8             	lea    -0x8(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
    return -1;
 31a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 31f:	eb f0                	jmp    311 <stat+0x34>

00000321 <atoi>:

int
atoi(const char *s)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	53                   	push   %ebx
 325:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 328:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 32d:	eb 10                	jmp    33f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 32f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 332:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 335:	83 c1 01             	add    $0x1,%ecx
 338:	0f be c0             	movsbl %al,%eax
 33b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 33f:	0f b6 01             	movzbl (%ecx),%eax
 342:	8d 58 d0             	lea    -0x30(%eax),%ebx
 345:	80 fb 09             	cmp    $0x9,%bl
 348:	76 e5                	jbe    32f <atoi+0xe>
  return n;
}
 34a:	89 d0                	mov    %edx,%eax
 34c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34f:	c9                   	leave  
 350:	c3                   	ret    

00000351 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	8b 75 08             	mov    0x8(%ebp),%esi
 359:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 35c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 35f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 361:	eb 0d                	jmp    370 <memmove+0x1f>
    *dst++ = *src++;
 363:	0f b6 01             	movzbl (%ecx),%eax
 366:	88 02                	mov    %al,(%edx)
 368:	8d 49 01             	lea    0x1(%ecx),%ecx
 36b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 36e:	89 d8                	mov    %ebx,%eax
 370:	8d 58 ff             	lea    -0x1(%eax),%ebx
 373:	85 c0                	test   %eax,%eax
 375:	7f ec                	jg     363 <memmove+0x12>
  return vdst;
}
 377:	89 f0                	mov    %esi,%eax
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    

0000037d <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 37d:	55                   	push   %ebp
 37e:	89 e5                	mov    %esp,%ebp
 380:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 383:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 385:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 388:	89 08                	mov    %ecx,(%eax)
  return old;
}
 38a:	89 d0                	mov    %edx,%eax
 38c:	5d                   	pop    %ebp
 38d:	c3                   	ret    

0000038e <lock_init>:
void 
lock_init(lock_t *lock){
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 391:	8b 45 08             	mov    0x8(%ebp),%eax
 394:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    

0000039c <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	53                   	push   %ebx
 3a0:	83 ec 04             	sub    $0x4,%esp
 3a3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 3a6:	83 ec 08             	sub    $0x8,%esp
 3a9:	6a 01                	push   $0x1
 3ab:	53                   	push   %ebx
 3ac:	e8 cc ff ff ff       	call   37d <TestAndSet>
 3b1:	83 c4 10             	add    $0x10,%esp
 3b4:	83 f8 01             	cmp    $0x1,%eax
 3b7:	74 ed                	je     3a6 <lock_acquire+0xa>
    ;
}
 3b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3bc:	c9                   	leave  
 3bd:	c3                   	ret    

000003be <lock_release>:
void 
lock_release(lock_t *lock){
 3be:	55                   	push   %ebp
 3bf:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3c1:	8b 45 08             	mov    0x8(%ebp),%eax
 3c4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3ca:	5d                   	pop    %ebp
 3cb:	c3                   	ret    

000003cc <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3cc:	55                   	push   %ebp
 3cd:	89 e5                	mov    %esp,%ebp
 3cf:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 3d2:	68 04 20 00 00       	push   $0x2004
 3d7:	e8 d2 03 00 00       	call   7ae <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 3dc:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 3df:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 3e1:	eb 03                	jmp    3e6 <thread_create+0x1a>
      stack += 1;
 3e3:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 3e6:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 3ec:	75 f5                	jne    3e3 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 3ee:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 3f0:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 3f3:	52                   	push   %edx
 3f4:	ff 75 10             	push   0x10(%ebp)
 3f7:	ff 75 0c             	push   0xc(%ebp)
 3fa:	ff 75 08             	push   0x8(%ebp)
 3fd:	e8 d1 00 00 00       	call   4d3 <clone>
 
    return pid;
}
 402:	c9                   	leave  
 403:	c3                   	ret    

00000404 <thread_join>:
int 
thread_join(){
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	53                   	push   %ebx
 408:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 40b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 40e:	50                   	push   %eax
 40f:	e8 c7 00 00 00       	call   4db <join>
 414:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 416:	83 c4 04             	add    $0x4,%esp
 419:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41c:	ff 70 fc             	push   -0x4(%eax)
 41f:	e8 ca 02 00 00       	call   6ee <free>
  return waitedForPID;
 424:	89 d8                	mov    %ebx,%eax
 426:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 429:	c9                   	leave  
 42a:	c3                   	ret    

0000042b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42b:	b8 01 00 00 00       	mov    $0x1,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <exit>:
SYSCALL(exit)
 433:	b8 02 00 00 00       	mov    $0x2,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <wait>:
SYSCALL(wait)
 43b:	b8 03 00 00 00       	mov    $0x3,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <pipe>:
SYSCALL(pipe)
 443:	b8 04 00 00 00       	mov    $0x4,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <read>:
SYSCALL(read)
 44b:	b8 05 00 00 00       	mov    $0x5,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <write>:
SYSCALL(write)
 453:	b8 10 00 00 00       	mov    $0x10,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <close>:
SYSCALL(close)
 45b:	b8 15 00 00 00       	mov    $0x15,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <kill>:
SYSCALL(kill)
 463:	b8 06 00 00 00       	mov    $0x6,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <exec>:
SYSCALL(exec)
 46b:	b8 07 00 00 00       	mov    $0x7,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <open>:
SYSCALL(open)
 473:	b8 0f 00 00 00       	mov    $0xf,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <mknod>:
SYSCALL(mknod)
 47b:	b8 11 00 00 00       	mov    $0x11,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <unlink>:
SYSCALL(unlink)
 483:	b8 12 00 00 00       	mov    $0x12,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <fstat>:
SYSCALL(fstat)
 48b:	b8 08 00 00 00       	mov    $0x8,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <link>:
SYSCALL(link)
 493:	b8 13 00 00 00       	mov    $0x13,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <mkdir>:
SYSCALL(mkdir)
 49b:	b8 14 00 00 00       	mov    $0x14,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <chdir>:
SYSCALL(chdir)
 4a3:	b8 09 00 00 00       	mov    $0x9,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <dup>:
SYSCALL(dup)
 4ab:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <getpid>:
SYSCALL(getpid)
 4b3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <sbrk>:
SYSCALL(sbrk)
 4bb:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <sleep>:
SYSCALL(sleep)
 4c3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <uptime>:
SYSCALL(uptime)
 4cb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <clone>:
SYSCALL(clone)
 4d3:	b8 16 00 00 00       	mov    $0x16,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <join>:
SYSCALL(join)
 4db:	b8 17 00 00 00       	mov    $0x17,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 1c             	sub    $0x1c,%esp
 4e9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4ec:	6a 01                	push   $0x1
 4ee:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4f1:	52                   	push   %edx
 4f2:	50                   	push   %eax
 4f3:	e8 5b ff ff ff       	call   453 <write>
}
 4f8:	83 c4 10             	add    $0x10,%esp
 4fb:	c9                   	leave  
 4fc:	c3                   	ret    

000004fd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
 500:	57                   	push   %edi
 501:	56                   	push   %esi
 502:	53                   	push   %ebx
 503:	83 ec 2c             	sub    $0x2c,%esp
 506:	89 45 d0             	mov    %eax,-0x30(%ebp)
 509:	89 d0                	mov    %edx,%eax
 50b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 50d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 511:	0f 95 c1             	setne  %cl
 514:	c1 ea 1f             	shr    $0x1f,%edx
 517:	84 d1                	test   %dl,%cl
 519:	74 44                	je     55f <printint+0x62>
    neg = 1;
    x = -xx;
 51b:	f7 d8                	neg    %eax
 51d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 51f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 526:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 52b:	89 c8                	mov    %ecx,%eax
 52d:	ba 00 00 00 00       	mov    $0x0,%edx
 532:	f7 f6                	div    %esi
 534:	89 df                	mov    %ebx,%edi
 536:	83 c3 01             	add    $0x1,%ebx
 539:	0f b6 92 10 09 00 00 	movzbl 0x910(%edx),%edx
 540:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 544:	89 ca                	mov    %ecx,%edx
 546:	89 c1                	mov    %eax,%ecx
 548:	39 d6                	cmp    %edx,%esi
 54a:	76 df                	jbe    52b <printint+0x2e>
  if(neg)
 54c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 550:	74 31                	je     583 <printint+0x86>
    buf[i++] = '-';
 552:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 557:	8d 5f 02             	lea    0x2(%edi),%ebx
 55a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 55d:	eb 17                	jmp    576 <printint+0x79>
    x = xx;
 55f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 561:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 568:	eb bc                	jmp    526 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 56a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 56f:	89 f0                	mov    %esi,%eax
 571:	e8 6d ff ff ff       	call   4e3 <putc>
  while(--i >= 0)
 576:	83 eb 01             	sub    $0x1,%ebx
 579:	79 ef                	jns    56a <printint+0x6d>
}
 57b:	83 c4 2c             	add    $0x2c,%esp
 57e:	5b                   	pop    %ebx
 57f:	5e                   	pop    %esi
 580:	5f                   	pop    %edi
 581:	5d                   	pop    %ebp
 582:	c3                   	ret    
 583:	8b 75 d0             	mov    -0x30(%ebp),%esi
 586:	eb ee                	jmp    576 <printint+0x79>

00000588 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
 58e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 591:	8d 45 10             	lea    0x10(%ebp),%eax
 594:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 597:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 59c:	bb 00 00 00 00       	mov    $0x0,%ebx
 5a1:	eb 14                	jmp    5b7 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5a3:	89 fa                	mov    %edi,%edx
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	e8 36 ff ff ff       	call   4e3 <putc>
 5ad:	eb 05                	jmp    5b4 <printf+0x2c>
      }
    } else if(state == '%'){
 5af:	83 fe 25             	cmp    $0x25,%esi
 5b2:	74 25                	je     5d9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5b4:	83 c3 01             	add    $0x1,%ebx
 5b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ba:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5be:	84 c0                	test   %al,%al
 5c0:	0f 84 20 01 00 00    	je     6e6 <printf+0x15e>
    c = fmt[i] & 0xff;
 5c6:	0f be f8             	movsbl %al,%edi
 5c9:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5cc:	85 f6                	test   %esi,%esi
 5ce:	75 df                	jne    5af <printf+0x27>
      if(c == '%'){
 5d0:	83 f8 25             	cmp    $0x25,%eax
 5d3:	75 ce                	jne    5a3 <printf+0x1b>
        state = '%';
 5d5:	89 c6                	mov    %eax,%esi
 5d7:	eb db                	jmp    5b4 <printf+0x2c>
      if(c == 'd'){
 5d9:	83 f8 25             	cmp    $0x25,%eax
 5dc:	0f 84 cf 00 00 00    	je     6b1 <printf+0x129>
 5e2:	0f 8c dd 00 00 00    	jl     6c5 <printf+0x13d>
 5e8:	83 f8 78             	cmp    $0x78,%eax
 5eb:	0f 8f d4 00 00 00    	jg     6c5 <printf+0x13d>
 5f1:	83 f8 63             	cmp    $0x63,%eax
 5f4:	0f 8c cb 00 00 00    	jl     6c5 <printf+0x13d>
 5fa:	83 e8 63             	sub    $0x63,%eax
 5fd:	83 f8 15             	cmp    $0x15,%eax
 600:	0f 87 bf 00 00 00    	ja     6c5 <printf+0x13d>
 606:	ff 24 85 b8 08 00 00 	jmp    *0x8b8(,%eax,4)
        printint(fd, *ap, 10, 1);
 60d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 610:	8b 17                	mov    (%edi),%edx
 612:	83 ec 0c             	sub    $0xc,%esp
 615:	6a 01                	push   $0x1
 617:	b9 0a 00 00 00       	mov    $0xa,%ecx
 61c:	8b 45 08             	mov    0x8(%ebp),%eax
 61f:	e8 d9 fe ff ff       	call   4fd <printint>
        ap++;
 624:	83 c7 04             	add    $0x4,%edi
 627:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 62a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 62d:	be 00 00 00 00       	mov    $0x0,%esi
 632:	eb 80                	jmp    5b4 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 634:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 637:	8b 17                	mov    (%edi),%edx
 639:	83 ec 0c             	sub    $0xc,%esp
 63c:	6a 00                	push   $0x0
 63e:	b9 10 00 00 00       	mov    $0x10,%ecx
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	e8 b2 fe ff ff       	call   4fd <printint>
        ap++;
 64b:	83 c7 04             	add    $0x4,%edi
 64e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 651:	83 c4 10             	add    $0x10,%esp
      state = 0;
 654:	be 00 00 00 00       	mov    $0x0,%esi
 659:	e9 56 ff ff ff       	jmp    5b4 <printf+0x2c>
        s = (char*)*ap;
 65e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 661:	8b 30                	mov    (%eax),%esi
        ap++;
 663:	83 c0 04             	add    $0x4,%eax
 666:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 669:	85 f6                	test   %esi,%esi
 66b:	75 15                	jne    682 <printf+0xfa>
          s = "(null)";
 66d:	be b1 08 00 00       	mov    $0x8b1,%esi
 672:	eb 0e                	jmp    682 <printf+0xfa>
          putc(fd, *s);
 674:	0f be d2             	movsbl %dl,%edx
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	e8 64 fe ff ff       	call   4e3 <putc>
          s++;
 67f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 682:	0f b6 16             	movzbl (%esi),%edx
 685:	84 d2                	test   %dl,%dl
 687:	75 eb                	jne    674 <printf+0xec>
      state = 0;
 689:	be 00 00 00 00       	mov    $0x0,%esi
 68e:	e9 21 ff ff ff       	jmp    5b4 <printf+0x2c>
        putc(fd, *ap);
 693:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 696:	0f be 17             	movsbl (%edi),%edx
 699:	8b 45 08             	mov    0x8(%ebp),%eax
 69c:	e8 42 fe ff ff       	call   4e3 <putc>
        ap++;
 6a1:	83 c7 04             	add    $0x4,%edi
 6a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6a7:	be 00 00 00 00       	mov    $0x0,%esi
 6ac:	e9 03 ff ff ff       	jmp    5b4 <printf+0x2c>
        putc(fd, c);
 6b1:	89 fa                	mov    %edi,%edx
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	e8 28 fe ff ff       	call   4e3 <putc>
      state = 0;
 6bb:	be 00 00 00 00       	mov    $0x0,%esi
 6c0:	e9 ef fe ff ff       	jmp    5b4 <printf+0x2c>
        putc(fd, '%');
 6c5:	ba 25 00 00 00       	mov    $0x25,%edx
 6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 6cd:	e8 11 fe ff ff       	call   4e3 <putc>
        putc(fd, c);
 6d2:	89 fa                	mov    %edi,%edx
 6d4:	8b 45 08             	mov    0x8(%ebp),%eax
 6d7:	e8 07 fe ff ff       	call   4e3 <putc>
      state = 0;
 6dc:	be 00 00 00 00       	mov    $0x0,%esi
 6e1:	e9 ce fe ff ff       	jmp    5b4 <printf+0x2c>
    }
  }
}
 6e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e9:	5b                   	pop    %ebx
 6ea:	5e                   	pop    %esi
 6eb:	5f                   	pop    %edi
 6ec:	5d                   	pop    %ebp
 6ed:	c3                   	ret    

000006ee <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ee:	55                   	push   %ebp
 6ef:	89 e5                	mov    %esp,%ebp
 6f1:	57                   	push   %edi
 6f2:	56                   	push   %esi
 6f3:	53                   	push   %ebx
 6f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fa:	a1 a4 0c 00 00       	mov    0xca4,%eax
 6ff:	eb 02                	jmp    703 <free+0x15>
 701:	89 d0                	mov    %edx,%eax
 703:	39 c8                	cmp    %ecx,%eax
 705:	73 04                	jae    70b <free+0x1d>
 707:	39 08                	cmp    %ecx,(%eax)
 709:	77 12                	ja     71d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70b:	8b 10                	mov    (%eax),%edx
 70d:	39 c2                	cmp    %eax,%edx
 70f:	77 f0                	ja     701 <free+0x13>
 711:	39 c8                	cmp    %ecx,%eax
 713:	72 08                	jb     71d <free+0x2f>
 715:	39 ca                	cmp    %ecx,%edx
 717:	77 04                	ja     71d <free+0x2f>
 719:	89 d0                	mov    %edx,%eax
 71b:	eb e6                	jmp    703 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 71d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 720:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 723:	8b 10                	mov    (%eax),%edx
 725:	39 d7                	cmp    %edx,%edi
 727:	74 19                	je     742 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 729:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 72c:	8b 50 04             	mov    0x4(%eax),%edx
 72f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 732:	39 ce                	cmp    %ecx,%esi
 734:	74 1b                	je     751 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 736:	89 08                	mov    %ecx,(%eax)
  freep = p;
 738:	a3 a4 0c 00 00       	mov    %eax,0xca4
}
 73d:	5b                   	pop    %ebx
 73e:	5e                   	pop    %esi
 73f:	5f                   	pop    %edi
 740:	5d                   	pop    %ebp
 741:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 742:	03 72 04             	add    0x4(%edx),%esi
 745:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 748:	8b 10                	mov    (%eax),%edx
 74a:	8b 12                	mov    (%edx),%edx
 74c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 74f:	eb db                	jmp    72c <free+0x3e>
    p->s.size += bp->s.size;
 751:	03 53 fc             	add    -0x4(%ebx),%edx
 754:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 757:	8b 53 f8             	mov    -0x8(%ebx),%edx
 75a:	89 10                	mov    %edx,(%eax)
 75c:	eb da                	jmp    738 <free+0x4a>

0000075e <morecore>:

static Header*
morecore(uint nu)
{
 75e:	55                   	push   %ebp
 75f:	89 e5                	mov    %esp,%ebp
 761:	53                   	push   %ebx
 762:	83 ec 04             	sub    $0x4,%esp
 765:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 767:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 76c:	77 05                	ja     773 <morecore+0x15>
    nu = 4096;
 76e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 773:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 77a:	83 ec 0c             	sub    $0xc,%esp
 77d:	50                   	push   %eax
 77e:	e8 38 fd ff ff       	call   4bb <sbrk>
  if(p == (char*)-1)
 783:	83 c4 10             	add    $0x10,%esp
 786:	83 f8 ff             	cmp    $0xffffffff,%eax
 789:	74 1c                	je     7a7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 78b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 78e:	83 c0 08             	add    $0x8,%eax
 791:	83 ec 0c             	sub    $0xc,%esp
 794:	50                   	push   %eax
 795:	e8 54 ff ff ff       	call   6ee <free>
  return freep;
 79a:	a1 a4 0c 00 00       	mov    0xca4,%eax
 79f:	83 c4 10             	add    $0x10,%esp
}
 7a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7a5:	c9                   	leave  
 7a6:	c3                   	ret    
    return 0;
 7a7:	b8 00 00 00 00       	mov    $0x0,%eax
 7ac:	eb f4                	jmp    7a2 <morecore+0x44>

000007ae <malloc>:

void*
malloc(uint nbytes)
{
 7ae:	55                   	push   %ebp
 7af:	89 e5                	mov    %esp,%ebp
 7b1:	53                   	push   %ebx
 7b2:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b5:	8b 45 08             	mov    0x8(%ebp),%eax
 7b8:	8d 58 07             	lea    0x7(%eax),%ebx
 7bb:	c1 eb 03             	shr    $0x3,%ebx
 7be:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7c1:	8b 0d a4 0c 00 00    	mov    0xca4,%ecx
 7c7:	85 c9                	test   %ecx,%ecx
 7c9:	74 04                	je     7cf <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cb:	8b 01                	mov    (%ecx),%eax
 7cd:	eb 4a                	jmp    819 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7cf:	c7 05 a4 0c 00 00 a8 	movl   $0xca8,0xca4
 7d6:	0c 00 00 
 7d9:	c7 05 a8 0c 00 00 a8 	movl   $0xca8,0xca8
 7e0:	0c 00 00 
    base.s.size = 0;
 7e3:	c7 05 ac 0c 00 00 00 	movl   $0x0,0xcac
 7ea:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7ed:	b9 a8 0c 00 00       	mov    $0xca8,%ecx
 7f2:	eb d7                	jmp    7cb <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7f4:	74 19                	je     80f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7f6:	29 da                	sub    %ebx,%edx
 7f8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7fb:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7fe:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 801:	89 0d a4 0c 00 00    	mov    %ecx,0xca4
      return (void*)(p + 1);
 807:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 80a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80d:	c9                   	leave  
 80e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 80f:	8b 10                	mov    (%eax),%edx
 811:	89 11                	mov    %edx,(%ecx)
 813:	eb ec                	jmp    801 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 815:	89 c1                	mov    %eax,%ecx
 817:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 819:	8b 50 04             	mov    0x4(%eax),%edx
 81c:	39 da                	cmp    %ebx,%edx
 81e:	73 d4                	jae    7f4 <malloc+0x46>
    if(p == freep)
 820:	39 05 a4 0c 00 00    	cmp    %eax,0xca4
 826:	75 ed                	jne    815 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 828:	89 d8                	mov    %ebx,%eax
 82a:	e8 2f ff ff ff       	call   75e <morecore>
 82f:	85 c0                	test   %eax,%eax
 831:	75 e2                	jne    815 <malloc+0x67>
 833:	eb d5                	jmp    80a <malloc+0x5c>
