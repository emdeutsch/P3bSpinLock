
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
   6:	a1 98 0c 00 00       	mov    0xc98,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 34 08 00 00       	push   $0x834
  17:	68 3d 08 00 00       	push   $0x83d
  1c:	6a 01                	push   $0x1
  1e:	e8 64 05 00 00       	call   587 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 45 08 00 00       	push   $0x845
  2b:	68 51 08 00 00       	push   $0x851
  30:	6a 01                	push   $0x1
  32:	e8 50 05 00 00       	call   587 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 65 08 00 00       	push   $0x865
  3f:	6a 01                	push   $0x1
  41:	e8 41 05 00 00       	call   587 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 9c 0c 00 00    	push   0xc9c
  4f:	e8 0e 04 00 00       	call   462 <kill>
  54:	e8 d9 03 00 00       	call   432 <exit>
   global = 5;
  59:	c7 05 98 0c 00 00 05 	movl   $0x5,0xc98
  60:	00 00 00 
   exit();
  63:	e8 ca 03 00 00       	call   432 <exit>

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
  7b:	e8 32 04 00 00       	call   4b2 <getpid>
  80:	a3 9c 0c 00 00       	mov    %eax,0xc9c
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 1b 07 00 00       	call   7ad <malloc>
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
  bc:	e8 11 04 00 00       	call   4d2 <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 98 0c 00 00       	mov    0xc98,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 8a 08 00 00       	push   $0x88a
  e0:	6a 01                	push   $0x1
  e2:	e8 a0 04 00 00       	call   587 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 e8 03 00 00       	call   4da <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 34 08 00 00       	push   $0x834
 104:	68 3d 08 00 00       	push   $0x83d
 109:	6a 01                	push   $0x1
 10b:	e8 77 04 00 00       	call   587 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 97 08 00 00       	push   $0x897
 118:	68 51 08 00 00       	push   $0x851
 11d:	6a 01                	push   $0x1
 11f:	e8 63 04 00 00       	call   587 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 65 08 00 00       	push   $0x865
 12c:	6a 01                	push   $0x1
 12e:	e8 54 04 00 00       	call   587 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 9c 0c 00 00    	push   0xc9c
 13c:	e8 21 03 00 00       	call   462 <kill>
 141:	e8 ec 02 00 00       	call   432 <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 34 08 00 00       	push   $0x834
 14d:	68 3d 08 00 00       	push   $0x83d
 152:	6a 01                	push   $0x1
 154:	e8 2e 04 00 00       	call   587 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 72 08 00 00       	push   $0x872
 161:	68 51 08 00 00       	push   $0x851
 166:	6a 01                	push   $0x1
 168:	e8 1a 04 00 00       	call   587 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 65 08 00 00       	push   $0x865
 175:	6a 01                	push   $0x1
 177:	e8 0b 04 00 00       	call   587 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 9c 0c 00 00    	push   0xc9c
 185:	e8 d8 02 00 00       	call   462 <kill>
 18a:	e8 a3 02 00 00       	call   432 <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 34 08 00 00       	push   $0x834
 196:	68 3d 08 00 00       	push   $0x83d
 19b:	6a 01                	push   $0x1
 19d:	e8 e5 03 00 00       	call   587 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 7c 08 00 00       	push   $0x87c
 1aa:	68 51 08 00 00       	push   $0x851
 1af:	6a 01                	push   $0x1
 1b1:	e8 d1 03 00 00       	call   587 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 65 08 00 00       	push   $0x865
 1be:	6a 01                	push   $0x1
 1c0:	e8 c2 03 00 00       	call   587 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 9c 0c 00 00    	push   0xc9c
 1ce:	e8 8f 02 00 00       	call   462 <kill>
 1d3:	e8 5a 02 00 00       	call   432 <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 0c 05 00 00       	call   6ed <free>
   exit();
 1e1:	e8 4c 02 00 00       	call   432 <exit>

000001e6 <strcpy>:
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
 2ac:	e8 99 01 00 00       	call   44a <read>
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
 2ea:	e8 83 01 00 00       	call   472 <open>
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
 2ff:	e8 86 01 00 00       	call   48a <fstat>
 304:	89 c6                	mov    %eax,%esi
  close(fd);
 306:	89 1c 24             	mov    %ebx,(%esp)
 309:	e8 4c 01 00 00       	call   45a <close>
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
 3d7:	e8 d1 03 00 00       	call   7ad <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 3dc:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 3df:	83 c4 10             	add    $0x10,%esp
 3e2:	eb 03                	jmp    3e7 <thread_create+0x1b>
      stack += 1;
 3e4:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 3e7:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 3ed:	75 f5                	jne    3e4 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 3ef:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 3f2:	52                   	push   %edx
 3f3:	ff 75 10             	push   0x10(%ebp)
 3f6:	ff 75 0c             	push   0xc(%ebp)
 3f9:	ff 75 08             	push   0x8(%ebp)
 3fc:	e8 d1 00 00 00       	call   4d2 <clone>
 
    return pid;
}
 401:	c9                   	leave  
 402:	c3                   	ret    

00000403 <thread_join>:
int 
thread_join(){
 403:	55                   	push   %ebp
 404:	89 e5                	mov    %esp,%ebp
 406:	53                   	push   %ebx
 407:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 40a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 40d:	50                   	push   %eax
 40e:	e8 c7 00 00 00       	call   4da <join>
 413:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 415:	83 c4 04             	add    $0x4,%esp
 418:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41b:	ff 70 fc             	push   -0x4(%eax)
 41e:	e8 ca 02 00 00       	call   6ed <free>
  return pid;
 423:	89 d8                	mov    %ebx,%eax
 425:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 428:	c9                   	leave  
 429:	c3                   	ret    

0000042a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42a:	b8 01 00 00 00       	mov    $0x1,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <exit>:
SYSCALL(exit)
 432:	b8 02 00 00 00       	mov    $0x2,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <wait>:
SYSCALL(wait)
 43a:	b8 03 00 00 00       	mov    $0x3,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <pipe>:
SYSCALL(pipe)
 442:	b8 04 00 00 00       	mov    $0x4,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <read>:
SYSCALL(read)
 44a:	b8 05 00 00 00       	mov    $0x5,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <write>:
SYSCALL(write)
 452:	b8 10 00 00 00       	mov    $0x10,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <close>:
SYSCALL(close)
 45a:	b8 15 00 00 00       	mov    $0x15,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <kill>:
SYSCALL(kill)
 462:	b8 06 00 00 00       	mov    $0x6,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <exec>:
SYSCALL(exec)
 46a:	b8 07 00 00 00       	mov    $0x7,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <open>:
SYSCALL(open)
 472:	b8 0f 00 00 00       	mov    $0xf,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <mknod>:
SYSCALL(mknod)
 47a:	b8 11 00 00 00       	mov    $0x11,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <unlink>:
SYSCALL(unlink)
 482:	b8 12 00 00 00       	mov    $0x12,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <fstat>:
SYSCALL(fstat)
 48a:	b8 08 00 00 00       	mov    $0x8,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <link>:
SYSCALL(link)
 492:	b8 13 00 00 00       	mov    $0x13,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <mkdir>:
SYSCALL(mkdir)
 49a:	b8 14 00 00 00       	mov    $0x14,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <chdir>:
SYSCALL(chdir)
 4a2:	b8 09 00 00 00       	mov    $0x9,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <dup>:
SYSCALL(dup)
 4aa:	b8 0a 00 00 00       	mov    $0xa,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <getpid>:
SYSCALL(getpid)
 4b2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <sbrk>:
SYSCALL(sbrk)
 4ba:	b8 0c 00 00 00       	mov    $0xc,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <sleep>:
SYSCALL(sleep)
 4c2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <uptime>:
SYSCALL(uptime)
 4ca:	b8 0e 00 00 00       	mov    $0xe,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <clone>:
SYSCALL(clone)
 4d2:	b8 16 00 00 00       	mov    $0x16,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <join>:
SYSCALL(join)
 4da:	b8 17 00 00 00       	mov    $0x17,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4e2:	55                   	push   %ebp
 4e3:	89 e5                	mov    %esp,%ebp
 4e5:	83 ec 1c             	sub    $0x1c,%esp
 4e8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4eb:	6a 01                	push   $0x1
 4ed:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4f0:	52                   	push   %edx
 4f1:	50                   	push   %eax
 4f2:	e8 5b ff ff ff       	call   452 <write>
}
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	c9                   	leave  
 4fb:	c3                   	ret    

000004fc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	57                   	push   %edi
 500:	56                   	push   %esi
 501:	53                   	push   %ebx
 502:	83 ec 2c             	sub    $0x2c,%esp
 505:	89 45 d0             	mov    %eax,-0x30(%ebp)
 508:	89 d0                	mov    %edx,%eax
 50a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 50c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 510:	0f 95 c1             	setne  %cl
 513:	c1 ea 1f             	shr    $0x1f,%edx
 516:	84 d1                	test   %dl,%cl
 518:	74 44                	je     55e <printint+0x62>
    neg = 1;
    x = -xx;
 51a:	f7 d8                	neg    %eax
 51c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 51e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 525:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 52a:	89 c8                	mov    %ecx,%eax
 52c:	ba 00 00 00 00       	mov    $0x0,%edx
 531:	f7 f6                	div    %esi
 533:	89 df                	mov    %ebx,%edi
 535:	83 c3 01             	add    $0x1,%ebx
 538:	0f b6 92 0c 09 00 00 	movzbl 0x90c(%edx),%edx
 53f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 543:	89 ca                	mov    %ecx,%edx
 545:	89 c1                	mov    %eax,%ecx
 547:	39 d6                	cmp    %edx,%esi
 549:	76 df                	jbe    52a <printint+0x2e>
  if(neg)
 54b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 54f:	74 31                	je     582 <printint+0x86>
    buf[i++] = '-';
 551:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 556:	8d 5f 02             	lea    0x2(%edi),%ebx
 559:	8b 75 d0             	mov    -0x30(%ebp),%esi
 55c:	eb 17                	jmp    575 <printint+0x79>
    x = xx;
 55e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 560:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 567:	eb bc                	jmp    525 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 569:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 56e:	89 f0                	mov    %esi,%eax
 570:	e8 6d ff ff ff       	call   4e2 <putc>
  while(--i >= 0)
 575:	83 eb 01             	sub    $0x1,%ebx
 578:	79 ef                	jns    569 <printint+0x6d>
}
 57a:	83 c4 2c             	add    $0x2c,%esp
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5f                   	pop    %edi
 580:	5d                   	pop    %ebp
 581:	c3                   	ret    
 582:	8b 75 d0             	mov    -0x30(%ebp),%esi
 585:	eb ee                	jmp    575 <printint+0x79>

00000587 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 587:	55                   	push   %ebp
 588:	89 e5                	mov    %esp,%ebp
 58a:	57                   	push   %edi
 58b:	56                   	push   %esi
 58c:	53                   	push   %ebx
 58d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 590:	8d 45 10             	lea    0x10(%ebp),%eax
 593:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 596:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 59b:	bb 00 00 00 00       	mov    $0x0,%ebx
 5a0:	eb 14                	jmp    5b6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5a2:	89 fa                	mov    %edi,%edx
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	e8 36 ff ff ff       	call   4e2 <putc>
 5ac:	eb 05                	jmp    5b3 <printf+0x2c>
      }
    } else if(state == '%'){
 5ae:	83 fe 25             	cmp    $0x25,%esi
 5b1:	74 25                	je     5d8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5bd:	84 c0                	test   %al,%al
 5bf:	0f 84 20 01 00 00    	je     6e5 <printf+0x15e>
    c = fmt[i] & 0xff;
 5c5:	0f be f8             	movsbl %al,%edi
 5c8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5cb:	85 f6                	test   %esi,%esi
 5cd:	75 df                	jne    5ae <printf+0x27>
      if(c == '%'){
 5cf:	83 f8 25             	cmp    $0x25,%eax
 5d2:	75 ce                	jne    5a2 <printf+0x1b>
        state = '%';
 5d4:	89 c6                	mov    %eax,%esi
 5d6:	eb db                	jmp    5b3 <printf+0x2c>
      if(c == 'd'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	0f 84 cf 00 00 00    	je     6b0 <printf+0x129>
 5e1:	0f 8c dd 00 00 00    	jl     6c4 <printf+0x13d>
 5e7:	83 f8 78             	cmp    $0x78,%eax
 5ea:	0f 8f d4 00 00 00    	jg     6c4 <printf+0x13d>
 5f0:	83 f8 63             	cmp    $0x63,%eax
 5f3:	0f 8c cb 00 00 00    	jl     6c4 <printf+0x13d>
 5f9:	83 e8 63             	sub    $0x63,%eax
 5fc:	83 f8 15             	cmp    $0x15,%eax
 5ff:	0f 87 bf 00 00 00    	ja     6c4 <printf+0x13d>
 605:	ff 24 85 b4 08 00 00 	jmp    *0x8b4(,%eax,4)
        printint(fd, *ap, 10, 1);
 60c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 60f:	8b 17                	mov    (%edi),%edx
 611:	83 ec 0c             	sub    $0xc,%esp
 614:	6a 01                	push   $0x1
 616:	b9 0a 00 00 00       	mov    $0xa,%ecx
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	e8 d9 fe ff ff       	call   4fc <printint>
        ap++;
 623:	83 c7 04             	add    $0x4,%edi
 626:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 629:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 62c:	be 00 00 00 00       	mov    $0x0,%esi
 631:	eb 80                	jmp    5b3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 633:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 636:	8b 17                	mov    (%edi),%edx
 638:	83 ec 0c             	sub    $0xc,%esp
 63b:	6a 00                	push   $0x0
 63d:	b9 10 00 00 00       	mov    $0x10,%ecx
 642:	8b 45 08             	mov    0x8(%ebp),%eax
 645:	e8 b2 fe ff ff       	call   4fc <printint>
        ap++;
 64a:	83 c7 04             	add    $0x4,%edi
 64d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 650:	83 c4 10             	add    $0x10,%esp
      state = 0;
 653:	be 00 00 00 00       	mov    $0x0,%esi
 658:	e9 56 ff ff ff       	jmp    5b3 <printf+0x2c>
        s = (char*)*ap;
 65d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 660:	8b 30                	mov    (%eax),%esi
        ap++;
 662:	83 c0 04             	add    $0x4,%eax
 665:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 668:	85 f6                	test   %esi,%esi
 66a:	75 15                	jne    681 <printf+0xfa>
          s = "(null)";
 66c:	be ad 08 00 00       	mov    $0x8ad,%esi
 671:	eb 0e                	jmp    681 <printf+0xfa>
          putc(fd, *s);
 673:	0f be d2             	movsbl %dl,%edx
 676:	8b 45 08             	mov    0x8(%ebp),%eax
 679:	e8 64 fe ff ff       	call   4e2 <putc>
          s++;
 67e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 681:	0f b6 16             	movzbl (%esi),%edx
 684:	84 d2                	test   %dl,%dl
 686:	75 eb                	jne    673 <printf+0xec>
      state = 0;
 688:	be 00 00 00 00       	mov    $0x0,%esi
 68d:	e9 21 ff ff ff       	jmp    5b3 <printf+0x2c>
        putc(fd, *ap);
 692:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 695:	0f be 17             	movsbl (%edi),%edx
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	e8 42 fe ff ff       	call   4e2 <putc>
        ap++;
 6a0:	83 c7 04             	add    $0x4,%edi
 6a3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6a6:	be 00 00 00 00       	mov    $0x0,%esi
 6ab:	e9 03 ff ff ff       	jmp    5b3 <printf+0x2c>
        putc(fd, c);
 6b0:	89 fa                	mov    %edi,%edx
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	e8 28 fe ff ff       	call   4e2 <putc>
      state = 0;
 6ba:	be 00 00 00 00       	mov    $0x0,%esi
 6bf:	e9 ef fe ff ff       	jmp    5b3 <printf+0x2c>
        putc(fd, '%');
 6c4:	ba 25 00 00 00       	mov    $0x25,%edx
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
 6cc:	e8 11 fe ff ff       	call   4e2 <putc>
        putc(fd, c);
 6d1:	89 fa                	mov    %edi,%edx
 6d3:	8b 45 08             	mov    0x8(%ebp),%eax
 6d6:	e8 07 fe ff ff       	call   4e2 <putc>
      state = 0;
 6db:	be 00 00 00 00       	mov    $0x0,%esi
 6e0:	e9 ce fe ff ff       	jmp    5b3 <printf+0x2c>
    }
  }
}
 6e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e8:	5b                   	pop    %ebx
 6e9:	5e                   	pop    %esi
 6ea:	5f                   	pop    %edi
 6eb:	5d                   	pop    %ebp
 6ec:	c3                   	ret    

000006ed <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ed:	55                   	push   %ebp
 6ee:	89 e5                	mov    %esp,%ebp
 6f0:	57                   	push   %edi
 6f1:	56                   	push   %esi
 6f2:	53                   	push   %ebx
 6f3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f9:	a1 a0 0c 00 00       	mov    0xca0,%eax
 6fe:	eb 02                	jmp    702 <free+0x15>
 700:	89 d0                	mov    %edx,%eax
 702:	39 c8                	cmp    %ecx,%eax
 704:	73 04                	jae    70a <free+0x1d>
 706:	39 08                	cmp    %ecx,(%eax)
 708:	77 12                	ja     71c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70a:	8b 10                	mov    (%eax),%edx
 70c:	39 c2                	cmp    %eax,%edx
 70e:	77 f0                	ja     700 <free+0x13>
 710:	39 c8                	cmp    %ecx,%eax
 712:	72 08                	jb     71c <free+0x2f>
 714:	39 ca                	cmp    %ecx,%edx
 716:	77 04                	ja     71c <free+0x2f>
 718:	89 d0                	mov    %edx,%eax
 71a:	eb e6                	jmp    702 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 71c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 71f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 722:	8b 10                	mov    (%eax),%edx
 724:	39 d7                	cmp    %edx,%edi
 726:	74 19                	je     741 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 728:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 72b:	8b 50 04             	mov    0x4(%eax),%edx
 72e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 731:	39 ce                	cmp    %ecx,%esi
 733:	74 1b                	je     750 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 735:	89 08                	mov    %ecx,(%eax)
  freep = p;
 737:	a3 a0 0c 00 00       	mov    %eax,0xca0
}
 73c:	5b                   	pop    %ebx
 73d:	5e                   	pop    %esi
 73e:	5f                   	pop    %edi
 73f:	5d                   	pop    %ebp
 740:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 741:	03 72 04             	add    0x4(%edx),%esi
 744:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 747:	8b 10                	mov    (%eax),%edx
 749:	8b 12                	mov    (%edx),%edx
 74b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 74e:	eb db                	jmp    72b <free+0x3e>
    p->s.size += bp->s.size;
 750:	03 53 fc             	add    -0x4(%ebx),%edx
 753:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 756:	8b 53 f8             	mov    -0x8(%ebx),%edx
 759:	89 10                	mov    %edx,(%eax)
 75b:	eb da                	jmp    737 <free+0x4a>

0000075d <morecore>:

static Header*
morecore(uint nu)
{
 75d:	55                   	push   %ebp
 75e:	89 e5                	mov    %esp,%ebp
 760:	53                   	push   %ebx
 761:	83 ec 04             	sub    $0x4,%esp
 764:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 766:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 76b:	77 05                	ja     772 <morecore+0x15>
    nu = 4096;
 76d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 772:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 779:	83 ec 0c             	sub    $0xc,%esp
 77c:	50                   	push   %eax
 77d:	e8 38 fd ff ff       	call   4ba <sbrk>
  if(p == (char*)-1)
 782:	83 c4 10             	add    $0x10,%esp
 785:	83 f8 ff             	cmp    $0xffffffff,%eax
 788:	74 1c                	je     7a6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 78a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 78d:	83 c0 08             	add    $0x8,%eax
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	50                   	push   %eax
 794:	e8 54 ff ff ff       	call   6ed <free>
  return freep;
 799:	a1 a0 0c 00 00       	mov    0xca0,%eax
 79e:	83 c4 10             	add    $0x10,%esp
}
 7a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7a4:	c9                   	leave  
 7a5:	c3                   	ret    
    return 0;
 7a6:	b8 00 00 00 00       	mov    $0x0,%eax
 7ab:	eb f4                	jmp    7a1 <morecore+0x44>

000007ad <malloc>:

void*
malloc(uint nbytes)
{
 7ad:	55                   	push   %ebp
 7ae:	89 e5                	mov    %esp,%ebp
 7b0:	53                   	push   %ebx
 7b1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b4:	8b 45 08             	mov    0x8(%ebp),%eax
 7b7:	8d 58 07             	lea    0x7(%eax),%ebx
 7ba:	c1 eb 03             	shr    $0x3,%ebx
 7bd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7c0:	8b 0d a0 0c 00 00    	mov    0xca0,%ecx
 7c6:	85 c9                	test   %ecx,%ecx
 7c8:	74 04                	je     7ce <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ca:	8b 01                	mov    (%ecx),%eax
 7cc:	eb 4a                	jmp    818 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7ce:	c7 05 a0 0c 00 00 a4 	movl   $0xca4,0xca0
 7d5:	0c 00 00 
 7d8:	c7 05 a4 0c 00 00 a4 	movl   $0xca4,0xca4
 7df:	0c 00 00 
    base.s.size = 0;
 7e2:	c7 05 a8 0c 00 00 00 	movl   $0x0,0xca8
 7e9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7ec:	b9 a4 0c 00 00       	mov    $0xca4,%ecx
 7f1:	eb d7                	jmp    7ca <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7f3:	74 19                	je     80e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7f5:	29 da                	sub    %ebx,%edx
 7f7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7fa:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7fd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 800:	89 0d a0 0c 00 00    	mov    %ecx,0xca0
      return (void*)(p + 1);
 806:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 809:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 80c:	c9                   	leave  
 80d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 80e:	8b 10                	mov    (%eax),%edx
 810:	89 11                	mov    %edx,(%ecx)
 812:	eb ec                	jmp    800 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 814:	89 c1                	mov    %eax,%ecx
 816:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 818:	8b 50 04             	mov    0x4(%eax),%edx
 81b:	39 da                	cmp    %ebx,%edx
 81d:	73 d4                	jae    7f3 <malloc+0x46>
    if(p == freep)
 81f:	39 05 a0 0c 00 00    	cmp    %eax,0xca0
 825:	75 ed                	jne    814 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 827:	89 d8                	mov    %ebx,%eax
 829:	e8 2f ff ff ff       	call   75d <morecore>
 82e:	85 c0                	test   %eax,%eax
 830:	75 e2                	jne    814 <malloc+0x67>
 832:	eb d5                	jmp    809 <malloc+0x5c>
