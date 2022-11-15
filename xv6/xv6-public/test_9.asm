
_test_9:     file format elf32-i386


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
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
   6:	8d 4d 0c             	lea    0xc(%ebp),%ecx
   9:	8b 45 08             	mov    0x8(%ebp),%eax
   c:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  12:	39 d1                	cmp    %edx,%ecx
  14:	75 67                	jne    7d <worker+0x7d>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  16:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  1c:	8d 4d 08             	lea    0x8(%ebp),%ecx
  1f:	39 d1                	cmp    %edx,%ecx
  21:	0f 85 9f 00 00 00    	jne    c6 <worker+0xc6>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
  27:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
  2e:	0f 84 db 00 00 00    	je     10f <worker+0x10f>
  34:	6a 32                	push   $0x32
  36:	68 ec 08 00 00       	push   $0x8ec
  3b:	68 f5 08 00 00       	push   $0x8f5
  40:	6a 01                	push   $0x1
  42:	e8 f6 05 00 00       	call   63d <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 b4 09 00 00       	push   $0x9b4
  4f:	68 fd 08 00 00       	push   $0x8fd
  54:	6a 01                	push   $0x1
  56:	e8 e2 05 00 00       	call   63d <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 11 09 00 00       	push   $0x911
  63:	6a 01                	push   $0x1
  65:	e8 d3 05 00 00       	call   63d <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 d4 0d 00 00    	push   0xdd4
  73:	e8 a0 04 00 00       	call   518 <kill>
  78:	e8 6b 04 00 00       	call   4e8 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 ec 08 00 00       	push   $0x8ec
  84:	68 f5 08 00 00       	push   $0x8f5
  89:	6a 01                	push   $0x1
  8b:	e8 ad 05 00 00       	call   63d <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 5c 09 00 00       	push   $0x95c
  98:	68 fd 08 00 00       	push   $0x8fd
  9d:	6a 01                	push   $0x1
  9f:	e8 99 05 00 00       	call   63d <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 11 09 00 00       	push   $0x911
  ac:	6a 01                	push   $0x1
  ae:	e8 8a 05 00 00       	call   63d <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 d4 0d 00 00    	push   0xdd4
  bc:	e8 57 04 00 00       	call   518 <kill>
  c1:	e8 22 04 00 00       	call   4e8 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 ec 08 00 00       	push   $0x8ec
  cd:	68 f5 08 00 00       	push   $0x8f5
  d2:	6a 01                	push   $0x1
  d4:	e8 64 05 00 00       	call   63d <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 88 09 00 00       	push   $0x988
  e1:	68 fd 08 00 00       	push   $0x8fd
  e6:	6a 01                	push   $0x1
  e8:	e8 50 05 00 00       	call   63d <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 11 09 00 00       	push   $0x911
  f5:	6a 01                	push   $0x1
  f7:	e8 41 05 00 00       	call   63d <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 d4 0d 00 00    	push   0xdd4
 105:	e8 0e 04 00 00       	call   518 <kill>
 10a:	e8 d9 03 00 00       	call   4e8 <exit>
   global = 5;
 10f:	c7 05 d0 0d 00 00 05 	movl   $0x5,0xdd0
 116:	00 00 00 
   exit();
 119:	e8 ca 03 00 00       	call   4e8 <exit>

0000011e <main>:
{
 11e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 122:	83 e4 f0             	and    $0xfffffff0,%esp
 125:	ff 71 fc             	push   -0x4(%ecx)
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	56                   	push   %esi
 12c:	53                   	push   %ebx
 12d:	51                   	push   %ecx
 12e:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
 131:	e8 32 04 00 00       	call   568 <getpid>
 136:	a3 d4 0d 00 00       	mov    %eax,0xdd4
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 1b 07 00 00       	call   863 <malloc>
   assert(p != NULL);
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	0f 84 a8 00 00 00    	je     1fb <main+0xdd>
 153:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 155:	89 c2                	mov    %eax,%edx
 157:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 15d:	74 09                	je     168 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 15f:	b8 00 10 00 00       	mov    $0x1000,%eax
 164:	29 d0                	sub    %edx,%eax
 166:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, stack, 0, stack);
 168:	50                   	push   %eax
 169:	6a 00                	push   $0x0
 16b:	50                   	push   %eax
 16c:	68 00 00 00 00       	push   $0x0
 171:	e8 12 04 00 00       	call   588 <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 d0 0d 00 00       	mov    0xdd0,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 36 09 00 00       	push   $0x936
 195:	6a 01                	push   $0x1
 197:	e8 a1 04 00 00       	call   63d <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 e9 03 00 00       	call   590 <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 ec 08 00 00       	push   $0x8ec
 1b9:	68 f5 08 00 00       	push   $0x8f5
 1be:	6a 01                	push   $0x1
 1c0:	e8 78 04 00 00       	call   63d <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 43 09 00 00       	push   $0x943
 1cd:	68 fd 08 00 00       	push   $0x8fd
 1d2:	6a 01                	push   $0x1
 1d4:	e8 64 04 00 00       	call   63d <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 11 09 00 00       	push   $0x911
 1e1:	6a 01                	push   $0x1
 1e3:	e8 55 04 00 00       	call   63d <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 d4 0d 00 00    	push   0xdd4
 1f1:	e8 22 03 00 00       	call   518 <kill>
 1f6:	e8 ed 02 00 00       	call   4e8 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 ec 08 00 00       	push   $0x8ec
 202:	68 f5 08 00 00       	push   $0x8f5
 207:	6a 01                	push   $0x1
 209:	e8 2f 04 00 00       	call   63d <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 1e 09 00 00       	push   $0x91e
 216:	68 fd 08 00 00       	push   $0x8fd
 21b:	6a 01                	push   $0x1
 21d:	e8 1b 04 00 00       	call   63d <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 11 09 00 00       	push   $0x911
 22a:	6a 01                	push   $0x1
 22c:	e8 0c 04 00 00       	call   63d <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 d4 0d 00 00    	push   0xdd4
 23a:	e8 d9 02 00 00       	call   518 <kill>
 23f:	e8 a4 02 00 00       	call   4e8 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 ec 08 00 00       	push   $0x8ec
 24b:	68 f5 08 00 00       	push   $0x8f5
 250:	6a 01                	push   $0x1
 252:	e8 e6 03 00 00       	call   63d <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 28 09 00 00       	push   $0x928
 25f:	68 fd 08 00 00       	push   $0x8fd
 264:	6a 01                	push   $0x1
 266:	e8 d2 03 00 00       	call   63d <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 11 09 00 00       	push   $0x911
 273:	6a 01                	push   $0x1
 275:	e8 c3 03 00 00       	call   63d <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 d4 0d 00 00    	push   0xdd4
 283:	e8 90 02 00 00       	call   518 <kill>
 288:	e8 5b 02 00 00       	call   4e8 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 0d 05 00 00       	call   7a3 <free>
   exit();
 296:	e8 4d 02 00 00       	call   4e8 <exit>

0000029b <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	56                   	push   %esi
 29f:	53                   	push   %ebx
 2a0:	8b 75 08             	mov    0x8(%ebp),%esi
 2a3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2a6:	89 f0                	mov    %esi,%eax
 2a8:	89 d1                	mov    %edx,%ecx
 2aa:	83 c2 01             	add    $0x1,%edx
 2ad:	89 c3                	mov    %eax,%ebx
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 09             	movzbl (%ecx),%ecx
 2b5:	88 0b                	mov    %cl,(%ebx)
 2b7:	84 c9                	test   %cl,%cl
 2b9:	75 ed                	jne    2a8 <strcpy+0xd>
    ;
  return os;
}
 2bb:	89 f0                	mov    %esi,%eax
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    

000002c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ca:	eb 06                	jmp    2d2 <strcmp+0x11>
    p++, q++;
 2cc:	83 c1 01             	add    $0x1,%ecx
 2cf:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2d2:	0f b6 01             	movzbl (%ecx),%eax
 2d5:	84 c0                	test   %al,%al
 2d7:	74 04                	je     2dd <strcmp+0x1c>
 2d9:	3a 02                	cmp    (%edx),%al
 2db:	74 ef                	je     2cc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2dd:	0f b6 c0             	movzbl %al,%eax
 2e0:	0f b6 12             	movzbl (%edx),%edx
 2e3:	29 d0                	sub    %edx,%eax
}
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    

000002e7 <strlen>:

uint
strlen(const char *s)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ed:	b8 00 00 00 00       	mov    $0x0,%eax
 2f2:	eb 03                	jmp    2f7 <strlen+0x10>
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2fb:	75 f7                	jne    2f4 <strlen+0xd>
    ;
  return n;
}
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    

000002ff <memset>:

void*
memset(void *dst, int c, uint n)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	57                   	push   %edi
 303:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 306:	89 d7                	mov    %edx,%edi
 308:	8b 4d 10             	mov    0x10(%ebp),%ecx
 30b:	8b 45 0c             	mov    0xc(%ebp),%eax
 30e:	fc                   	cld    
 30f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 311:	89 d0                	mov    %edx,%eax
 313:	8b 7d fc             	mov    -0x4(%ebp),%edi
 316:	c9                   	leave  
 317:	c3                   	ret    

00000318 <strchr>:

char*
strchr(const char *s, char c)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 322:	eb 03                	jmp    327 <strchr+0xf>
 324:	83 c0 01             	add    $0x1,%eax
 327:	0f b6 10             	movzbl (%eax),%edx
 32a:	84 d2                	test   %dl,%dl
 32c:	74 06                	je     334 <strchr+0x1c>
    if(*s == c)
 32e:	38 ca                	cmp    %cl,%dl
 330:	75 f2                	jne    324 <strchr+0xc>
 332:	eb 05                	jmp    339 <strchr+0x21>
      return (char*)s;
  return 0;
 334:	b8 00 00 00 00       	mov    $0x0,%eax
}
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <gets>:

char*
gets(char *buf, int max)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	57                   	push   %edi
 33f:	56                   	push   %esi
 340:	53                   	push   %ebx
 341:	83 ec 1c             	sub    $0x1c,%esp
 344:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 347:	bb 00 00 00 00       	mov    $0x0,%ebx
 34c:	89 de                	mov    %ebx,%esi
 34e:	83 c3 01             	add    $0x1,%ebx
 351:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 354:	7d 2e                	jge    384 <gets+0x49>
    cc = read(0, &c, 1);
 356:	83 ec 04             	sub    $0x4,%esp
 359:	6a 01                	push   $0x1
 35b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 35e:	50                   	push   %eax
 35f:	6a 00                	push   $0x0
 361:	e8 9a 01 00 00       	call   500 <read>
    if(cc < 1)
 366:	83 c4 10             	add    $0x10,%esp
 369:	85 c0                	test   %eax,%eax
 36b:	7e 17                	jle    384 <gets+0x49>
      break;
    buf[i++] = c;
 36d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 371:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 374:	3c 0a                	cmp    $0xa,%al
 376:	0f 94 c2             	sete   %dl
 379:	3c 0d                	cmp    $0xd,%al
 37b:	0f 94 c0             	sete   %al
 37e:	08 c2                	or     %al,%dl
 380:	74 ca                	je     34c <gets+0x11>
    buf[i++] = c;
 382:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 384:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 388:	89 f8                	mov    %edi,%eax
 38a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5f                   	pop    %edi
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <stat>:

int
stat(const char *n, struct stat *st)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	56                   	push   %esi
 396:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 397:	83 ec 08             	sub    $0x8,%esp
 39a:	6a 00                	push   $0x0
 39c:	ff 75 08             	push   0x8(%ebp)
 39f:	e8 84 01 00 00       	call   528 <open>
  if(fd < 0)
 3a4:	83 c4 10             	add    $0x10,%esp
 3a7:	85 c0                	test   %eax,%eax
 3a9:	78 24                	js     3cf <stat+0x3d>
 3ab:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3ad:	83 ec 08             	sub    $0x8,%esp
 3b0:	ff 75 0c             	push   0xc(%ebp)
 3b3:	50                   	push   %eax
 3b4:	e8 87 01 00 00       	call   540 <fstat>
 3b9:	89 c6                	mov    %eax,%esi
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
 3be:	e8 4d 01 00 00       	call   510 <close>
  return r;
 3c3:	83 c4 10             	add    $0x10,%esp
}
 3c6:	89 f0                	mov    %esi,%eax
 3c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3cb:	5b                   	pop    %ebx
 3cc:	5e                   	pop    %esi
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    
    return -1;
 3cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d4:	eb f0                	jmp    3c6 <stat+0x34>

000003d6 <atoi>:

int
atoi(const char *s)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	53                   	push   %ebx
 3da:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3dd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3e2:	eb 10                	jmp    3f4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3e4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3e7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ea:	83 c1 01             	add    $0x1,%ecx
 3ed:	0f be c0             	movsbl %al,%eax
 3f0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3f4:	0f b6 01             	movzbl (%ecx),%eax
 3f7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3fa:	80 fb 09             	cmp    $0x9,%bl
 3fd:	76 e5                	jbe    3e4 <atoi+0xe>
  return n;
}
 3ff:	89 d0                	mov    %edx,%eax
 401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	56                   	push   %esi
 40a:	53                   	push   %ebx
 40b:	8b 75 08             	mov    0x8(%ebp),%esi
 40e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 411:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 414:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 416:	eb 0d                	jmp    425 <memmove+0x1f>
    *dst++ = *src++;
 418:	0f b6 01             	movzbl (%ecx),%eax
 41b:	88 02                	mov    %al,(%edx)
 41d:	8d 49 01             	lea    0x1(%ecx),%ecx
 420:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 423:	89 d8                	mov    %ebx,%eax
 425:	8d 58 ff             	lea    -0x1(%eax),%ebx
 428:	85 c0                	test   %eax,%eax
 42a:	7f ec                	jg     418 <memmove+0x12>
  return vdst;
}
 42c:	89 f0                	mov    %esi,%eax
 42e:	5b                   	pop    %ebx
 42f:	5e                   	pop    %esi
 430:	5d                   	pop    %ebp
 431:	c3                   	ret    

00000432 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 438:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 43a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 43d:	89 08                	mov    %ecx,(%eax)
  return old;
}
 43f:	89 d0                	mov    %edx,%eax
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    

00000443 <lock_init>:
void 
lock_init(lock_t *lock){
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 446:	8b 45 08             	mov    0x8(%ebp),%eax
 449:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    

00000451 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 451:	55                   	push   %ebp
 452:	89 e5                	mov    %esp,%ebp
 454:	53                   	push   %ebx
 455:	83 ec 04             	sub    $0x4,%esp
 458:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 45b:	83 ec 08             	sub    $0x8,%esp
 45e:	6a 01                	push   $0x1
 460:	53                   	push   %ebx
 461:	e8 cc ff ff ff       	call   432 <TestAndSet>
 466:	83 c4 10             	add    $0x10,%esp
 469:	83 f8 01             	cmp    $0x1,%eax
 46c:	74 ed                	je     45b <lock_acquire+0xa>
    ;
}
 46e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 471:	c9                   	leave  
 472:	c3                   	ret    

00000473 <lock_release>:
void 
lock_release(lock_t *lock){
 473:	55                   	push   %ebp
 474:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 476:	8b 45 08             	mov    0x8(%ebp),%eax
 479:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    

00000481 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 481:	55                   	push   %ebp
 482:	89 e5                	mov    %esp,%ebp
 484:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 487:	68 04 20 00 00       	push   $0x2004
 48c:	e8 d2 03 00 00       	call   863 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 491:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 494:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 496:	eb 03                	jmp    49b <thread_create+0x1a>
      stack += 1;
 498:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 49b:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4a1:	75 f5                	jne    498 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 4a3:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 4a5:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4a8:	52                   	push   %edx
 4a9:	ff 75 10             	push   0x10(%ebp)
 4ac:	ff 75 0c             	push   0xc(%ebp)
 4af:	ff 75 08             	push   0x8(%ebp)
 4b2:	e8 d1 00 00 00       	call   588 <clone>
 
    return pid;
}
 4b7:	c9                   	leave  
 4b8:	c3                   	ret    

000004b9 <thread_join>:
int 
thread_join(){
 4b9:	55                   	push   %ebp
 4ba:	89 e5                	mov    %esp,%ebp
 4bc:	53                   	push   %ebx
 4bd:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 4c0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c3:	50                   	push   %eax
 4c4:	e8 c7 00 00 00       	call   590 <join>
 4c9:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 4cb:	83 c4 04             	add    $0x4,%esp
 4ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d1:	ff 70 fc             	push   -0x4(%eax)
 4d4:	e8 ca 02 00 00       	call   7a3 <free>
  return waitedForPID;
 4d9:	89 d8                	mov    %ebx,%eax
 4db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4de:	c9                   	leave  
 4df:	c3                   	ret    

000004e0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4e0:	b8 01 00 00 00       	mov    $0x1,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <exit>:
SYSCALL(exit)
 4e8:	b8 02 00 00 00       	mov    $0x2,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <wait>:
SYSCALL(wait)
 4f0:	b8 03 00 00 00       	mov    $0x3,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <pipe>:
SYSCALL(pipe)
 4f8:	b8 04 00 00 00       	mov    $0x4,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <read>:
SYSCALL(read)
 500:	b8 05 00 00 00       	mov    $0x5,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <write>:
SYSCALL(write)
 508:	b8 10 00 00 00       	mov    $0x10,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <close>:
SYSCALL(close)
 510:	b8 15 00 00 00       	mov    $0x15,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <kill>:
SYSCALL(kill)
 518:	b8 06 00 00 00       	mov    $0x6,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <exec>:
SYSCALL(exec)
 520:	b8 07 00 00 00       	mov    $0x7,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <open>:
SYSCALL(open)
 528:	b8 0f 00 00 00       	mov    $0xf,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <mknod>:
SYSCALL(mknod)
 530:	b8 11 00 00 00       	mov    $0x11,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <unlink>:
SYSCALL(unlink)
 538:	b8 12 00 00 00       	mov    $0x12,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <fstat>:
SYSCALL(fstat)
 540:	b8 08 00 00 00       	mov    $0x8,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <link>:
SYSCALL(link)
 548:	b8 13 00 00 00       	mov    $0x13,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <mkdir>:
SYSCALL(mkdir)
 550:	b8 14 00 00 00       	mov    $0x14,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <chdir>:
SYSCALL(chdir)
 558:	b8 09 00 00 00       	mov    $0x9,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <dup>:
SYSCALL(dup)
 560:	b8 0a 00 00 00       	mov    $0xa,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <getpid>:
SYSCALL(getpid)
 568:	b8 0b 00 00 00       	mov    $0xb,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <sbrk>:
SYSCALL(sbrk)
 570:	b8 0c 00 00 00       	mov    $0xc,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <sleep>:
SYSCALL(sleep)
 578:	b8 0d 00 00 00       	mov    $0xd,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <uptime>:
SYSCALL(uptime)
 580:	b8 0e 00 00 00       	mov    $0xe,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <clone>:
SYSCALL(clone)
 588:	b8 16 00 00 00       	mov    $0x16,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <join>:
SYSCALL(join)
 590:	b8 17 00 00 00       	mov    $0x17,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 598:	55                   	push   %ebp
 599:	89 e5                	mov    %esp,%ebp
 59b:	83 ec 1c             	sub    $0x1c,%esp
 59e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5a1:	6a 01                	push   $0x1
 5a3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5a6:	52                   	push   %edx
 5a7:	50                   	push   %eax
 5a8:	e8 5b ff ff ff       	call   508 <write>
}
 5ad:	83 c4 10             	add    $0x10,%esp
 5b0:	c9                   	leave  
 5b1:	c3                   	ret    

000005b2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5b2:	55                   	push   %ebp
 5b3:	89 e5                	mov    %esp,%ebp
 5b5:	57                   	push   %edi
 5b6:	56                   	push   %esi
 5b7:	53                   	push   %ebx
 5b8:	83 ec 2c             	sub    $0x2c,%esp
 5bb:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5be:	89 d0                	mov    %edx,%eax
 5c0:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5c2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5c6:	0f 95 c1             	setne  %cl
 5c9:	c1 ea 1f             	shr    $0x1f,%edx
 5cc:	84 d1                	test   %dl,%cl
 5ce:	74 44                	je     614 <printint+0x62>
    neg = 1;
    x = -xx;
 5d0:	f7 d8                	neg    %eax
 5d2:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5d4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5db:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5e0:	89 c8                	mov    %ecx,%eax
 5e2:	ba 00 00 00 00       	mov    $0x0,%edx
 5e7:	f7 f6                	div    %esi
 5e9:	89 df                	mov    %ebx,%edi
 5eb:	83 c3 01             	add    $0x1,%ebx
 5ee:	0f b6 92 44 0a 00 00 	movzbl 0xa44(%edx),%edx
 5f5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5f9:	89 ca                	mov    %ecx,%edx
 5fb:	89 c1                	mov    %eax,%ecx
 5fd:	39 d6                	cmp    %edx,%esi
 5ff:	76 df                	jbe    5e0 <printint+0x2e>
  if(neg)
 601:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 605:	74 31                	je     638 <printint+0x86>
    buf[i++] = '-';
 607:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 60c:	8d 5f 02             	lea    0x2(%edi),%ebx
 60f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 612:	eb 17                	jmp    62b <printint+0x79>
    x = xx;
 614:	89 c1                	mov    %eax,%ecx
  neg = 0;
 616:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 61d:	eb bc                	jmp    5db <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 61f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 624:	89 f0                	mov    %esi,%eax
 626:	e8 6d ff ff ff       	call   598 <putc>
  while(--i >= 0)
 62b:	83 eb 01             	sub    $0x1,%ebx
 62e:	79 ef                	jns    61f <printint+0x6d>
}
 630:	83 c4 2c             	add    $0x2c,%esp
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    
 638:	8b 75 d0             	mov    -0x30(%ebp),%esi
 63b:	eb ee                	jmp    62b <printint+0x79>

0000063d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	57                   	push   %edi
 641:	56                   	push   %esi
 642:	53                   	push   %ebx
 643:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 646:	8d 45 10             	lea    0x10(%ebp),%eax
 649:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 64c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 651:	bb 00 00 00 00       	mov    $0x0,%ebx
 656:	eb 14                	jmp    66c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 658:	89 fa                	mov    %edi,%edx
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	e8 36 ff ff ff       	call   598 <putc>
 662:	eb 05                	jmp    669 <printf+0x2c>
      }
    } else if(state == '%'){
 664:	83 fe 25             	cmp    $0x25,%esi
 667:	74 25                	je     68e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 669:	83 c3 01             	add    $0x1,%ebx
 66c:	8b 45 0c             	mov    0xc(%ebp),%eax
 66f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 673:	84 c0                	test   %al,%al
 675:	0f 84 20 01 00 00    	je     79b <printf+0x15e>
    c = fmt[i] & 0xff;
 67b:	0f be f8             	movsbl %al,%edi
 67e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 681:	85 f6                	test   %esi,%esi
 683:	75 df                	jne    664 <printf+0x27>
      if(c == '%'){
 685:	83 f8 25             	cmp    $0x25,%eax
 688:	75 ce                	jne    658 <printf+0x1b>
        state = '%';
 68a:	89 c6                	mov    %eax,%esi
 68c:	eb db                	jmp    669 <printf+0x2c>
      if(c == 'd'){
 68e:	83 f8 25             	cmp    $0x25,%eax
 691:	0f 84 cf 00 00 00    	je     766 <printf+0x129>
 697:	0f 8c dd 00 00 00    	jl     77a <printf+0x13d>
 69d:	83 f8 78             	cmp    $0x78,%eax
 6a0:	0f 8f d4 00 00 00    	jg     77a <printf+0x13d>
 6a6:	83 f8 63             	cmp    $0x63,%eax
 6a9:	0f 8c cb 00 00 00    	jl     77a <printf+0x13d>
 6af:	83 e8 63             	sub    $0x63,%eax
 6b2:	83 f8 15             	cmp    $0x15,%eax
 6b5:	0f 87 bf 00 00 00    	ja     77a <printf+0x13d>
 6bb:	ff 24 85 ec 09 00 00 	jmp    *0x9ec(,%eax,4)
        printint(fd, *ap, 10, 1);
 6c2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c5:	8b 17                	mov    (%edi),%edx
 6c7:	83 ec 0c             	sub    $0xc,%esp
 6ca:	6a 01                	push   $0x1
 6cc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d1:	8b 45 08             	mov    0x8(%ebp),%eax
 6d4:	e8 d9 fe ff ff       	call   5b2 <printint>
        ap++;
 6d9:	83 c7 04             	add    $0x4,%edi
 6dc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6df:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6e2:	be 00 00 00 00       	mov    $0x0,%esi
 6e7:	eb 80                	jmp    669 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ec:	8b 17                	mov    (%edi),%edx
 6ee:	83 ec 0c             	sub    $0xc,%esp
 6f1:	6a 00                	push   $0x0
 6f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f8:	8b 45 08             	mov    0x8(%ebp),%eax
 6fb:	e8 b2 fe ff ff       	call   5b2 <printint>
        ap++;
 700:	83 c7 04             	add    $0x4,%edi
 703:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 706:	83 c4 10             	add    $0x10,%esp
      state = 0;
 709:	be 00 00 00 00       	mov    $0x0,%esi
 70e:	e9 56 ff ff ff       	jmp    669 <printf+0x2c>
        s = (char*)*ap;
 713:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 716:	8b 30                	mov    (%eax),%esi
        ap++;
 718:	83 c0 04             	add    $0x4,%eax
 71b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 71e:	85 f6                	test   %esi,%esi
 720:	75 15                	jne    737 <printf+0xfa>
          s = "(null)";
 722:	be e2 09 00 00       	mov    $0x9e2,%esi
 727:	eb 0e                	jmp    737 <printf+0xfa>
          putc(fd, *s);
 729:	0f be d2             	movsbl %dl,%edx
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	e8 64 fe ff ff       	call   598 <putc>
          s++;
 734:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 737:	0f b6 16             	movzbl (%esi),%edx
 73a:	84 d2                	test   %dl,%dl
 73c:	75 eb                	jne    729 <printf+0xec>
      state = 0;
 73e:	be 00 00 00 00       	mov    $0x0,%esi
 743:	e9 21 ff ff ff       	jmp    669 <printf+0x2c>
        putc(fd, *ap);
 748:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 74b:	0f be 17             	movsbl (%edi),%edx
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	e8 42 fe ff ff       	call   598 <putc>
        ap++;
 756:	83 c7 04             	add    $0x4,%edi
 759:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 75c:	be 00 00 00 00       	mov    $0x0,%esi
 761:	e9 03 ff ff ff       	jmp    669 <printf+0x2c>
        putc(fd, c);
 766:	89 fa                	mov    %edi,%edx
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	e8 28 fe ff ff       	call   598 <putc>
      state = 0;
 770:	be 00 00 00 00       	mov    $0x0,%esi
 775:	e9 ef fe ff ff       	jmp    669 <printf+0x2c>
        putc(fd, '%');
 77a:	ba 25 00 00 00       	mov    $0x25,%edx
 77f:	8b 45 08             	mov    0x8(%ebp),%eax
 782:	e8 11 fe ff ff       	call   598 <putc>
        putc(fd, c);
 787:	89 fa                	mov    %edi,%edx
 789:	8b 45 08             	mov    0x8(%ebp),%eax
 78c:	e8 07 fe ff ff       	call   598 <putc>
      state = 0;
 791:	be 00 00 00 00       	mov    $0x0,%esi
 796:	e9 ce fe ff ff       	jmp    669 <printf+0x2c>
    }
  }
}
 79b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79e:	5b                   	pop    %ebx
 79f:	5e                   	pop    %esi
 7a0:	5f                   	pop    %edi
 7a1:	5d                   	pop    %ebp
 7a2:	c3                   	ret    

000007a3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a3:	55                   	push   %ebp
 7a4:	89 e5                	mov    %esp,%ebp
 7a6:	57                   	push   %edi
 7a7:	56                   	push   %esi
 7a8:	53                   	push   %ebx
 7a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ac:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7af:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 7b4:	eb 02                	jmp    7b8 <free+0x15>
 7b6:	89 d0                	mov    %edx,%eax
 7b8:	39 c8                	cmp    %ecx,%eax
 7ba:	73 04                	jae    7c0 <free+0x1d>
 7bc:	39 08                	cmp    %ecx,(%eax)
 7be:	77 12                	ja     7d2 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c0:	8b 10                	mov    (%eax),%edx
 7c2:	39 c2                	cmp    %eax,%edx
 7c4:	77 f0                	ja     7b6 <free+0x13>
 7c6:	39 c8                	cmp    %ecx,%eax
 7c8:	72 08                	jb     7d2 <free+0x2f>
 7ca:	39 ca                	cmp    %ecx,%edx
 7cc:	77 04                	ja     7d2 <free+0x2f>
 7ce:	89 d0                	mov    %edx,%eax
 7d0:	eb e6                	jmp    7b8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d2:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d5:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7d8:	8b 10                	mov    (%eax),%edx
 7da:	39 d7                	cmp    %edx,%edi
 7dc:	74 19                	je     7f7 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7de:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7e1:	8b 50 04             	mov    0x4(%eax),%edx
 7e4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e7:	39 ce                	cmp    %ecx,%esi
 7e9:	74 1b                	je     806 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7eb:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7ed:	a3 d8 0d 00 00       	mov    %eax,0xdd8
}
 7f2:	5b                   	pop    %ebx
 7f3:	5e                   	pop    %esi
 7f4:	5f                   	pop    %edi
 7f5:	5d                   	pop    %ebp
 7f6:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7f7:	03 72 04             	add    0x4(%edx),%esi
 7fa:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7fd:	8b 10                	mov    (%eax),%edx
 7ff:	8b 12                	mov    (%edx),%edx
 801:	89 53 f8             	mov    %edx,-0x8(%ebx)
 804:	eb db                	jmp    7e1 <free+0x3e>
    p->s.size += bp->s.size;
 806:	03 53 fc             	add    -0x4(%ebx),%edx
 809:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 80c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80f:	89 10                	mov    %edx,(%eax)
 811:	eb da                	jmp    7ed <free+0x4a>

00000813 <morecore>:

static Header*
morecore(uint nu)
{
 813:	55                   	push   %ebp
 814:	89 e5                	mov    %esp,%ebp
 816:	53                   	push   %ebx
 817:	83 ec 04             	sub    $0x4,%esp
 81a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 81c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 821:	77 05                	ja     828 <morecore+0x15>
    nu = 4096;
 823:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 828:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82f:	83 ec 0c             	sub    $0xc,%esp
 832:	50                   	push   %eax
 833:	e8 38 fd ff ff       	call   570 <sbrk>
  if(p == (char*)-1)
 838:	83 c4 10             	add    $0x10,%esp
 83b:	83 f8 ff             	cmp    $0xffffffff,%eax
 83e:	74 1c                	je     85c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 840:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 843:	83 c0 08             	add    $0x8,%eax
 846:	83 ec 0c             	sub    $0xc,%esp
 849:	50                   	push   %eax
 84a:	e8 54 ff ff ff       	call   7a3 <free>
  return freep;
 84f:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 854:	83 c4 10             	add    $0x10,%esp
}
 857:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 85a:	c9                   	leave  
 85b:	c3                   	ret    
    return 0;
 85c:	b8 00 00 00 00       	mov    $0x0,%eax
 861:	eb f4                	jmp    857 <morecore+0x44>

00000863 <malloc>:

void*
malloc(uint nbytes)
{
 863:	55                   	push   %ebp
 864:	89 e5                	mov    %esp,%ebp
 866:	53                   	push   %ebx
 867:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86a:	8b 45 08             	mov    0x8(%ebp),%eax
 86d:	8d 58 07             	lea    0x7(%eax),%ebx
 870:	c1 eb 03             	shr    $0x3,%ebx
 873:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 876:	8b 0d d8 0d 00 00    	mov    0xdd8,%ecx
 87c:	85 c9                	test   %ecx,%ecx
 87e:	74 04                	je     884 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 880:	8b 01                	mov    (%ecx),%eax
 882:	eb 4a                	jmp    8ce <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 884:	c7 05 d8 0d 00 00 dc 	movl   $0xddc,0xdd8
 88b:	0d 00 00 
 88e:	c7 05 dc 0d 00 00 dc 	movl   $0xddc,0xddc
 895:	0d 00 00 
    base.s.size = 0;
 898:	c7 05 e0 0d 00 00 00 	movl   $0x0,0xde0
 89f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8a2:	b9 dc 0d 00 00       	mov    $0xddc,%ecx
 8a7:	eb d7                	jmp    880 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8a9:	74 19                	je     8c4 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8ab:	29 da                	sub    %ebx,%edx
 8ad:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8b0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8b3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8b6:	89 0d d8 0d 00 00    	mov    %ecx,0xdd8
      return (void*)(p + 1);
 8bc:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c2:	c9                   	leave  
 8c3:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8c4:	8b 10                	mov    (%eax),%edx
 8c6:	89 11                	mov    %edx,(%ecx)
 8c8:	eb ec                	jmp    8b6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ca:	89 c1                	mov    %eax,%ecx
 8cc:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ce:	8b 50 04             	mov    0x4(%eax),%edx
 8d1:	39 da                	cmp    %ebx,%edx
 8d3:	73 d4                	jae    8a9 <malloc+0x46>
    if(p == freep)
 8d5:	39 05 d8 0d 00 00    	cmp    %eax,0xdd8
 8db:	75 ed                	jne    8ca <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8dd:	89 d8                	mov    %ebx,%eax
 8df:	e8 2f ff ff ff       	call   813 <morecore>
 8e4:	85 c0                	test   %eax,%eax
 8e6:	75 e2                	jne    8ca <malloc+0x67>
 8e8:	eb d5                	jmp    8bf <malloc+0x5c>
