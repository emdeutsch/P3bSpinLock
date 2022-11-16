
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
  42:	e8 f5 05 00 00       	call   63c <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 b4 09 00 00       	push   $0x9b4
  4f:	68 fd 08 00 00       	push   $0x8fd
  54:	6a 01                	push   $0x1
  56:	e8 e1 05 00 00       	call   63c <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 11 09 00 00       	push   $0x911
  63:	6a 01                	push   $0x1
  65:	e8 d2 05 00 00       	call   63c <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 d4 0d 00 00    	push   0xdd4
  73:	e8 9f 04 00 00       	call   517 <kill>
  78:	e8 6a 04 00 00       	call   4e7 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 ec 08 00 00       	push   $0x8ec
  84:	68 f5 08 00 00       	push   $0x8f5
  89:	6a 01                	push   $0x1
  8b:	e8 ac 05 00 00       	call   63c <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 5c 09 00 00       	push   $0x95c
  98:	68 fd 08 00 00       	push   $0x8fd
  9d:	6a 01                	push   $0x1
  9f:	e8 98 05 00 00       	call   63c <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 11 09 00 00       	push   $0x911
  ac:	6a 01                	push   $0x1
  ae:	e8 89 05 00 00       	call   63c <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 d4 0d 00 00    	push   0xdd4
  bc:	e8 56 04 00 00       	call   517 <kill>
  c1:	e8 21 04 00 00       	call   4e7 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 ec 08 00 00       	push   $0x8ec
  cd:	68 f5 08 00 00       	push   $0x8f5
  d2:	6a 01                	push   $0x1
  d4:	e8 63 05 00 00       	call   63c <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 88 09 00 00       	push   $0x988
  e1:	68 fd 08 00 00       	push   $0x8fd
  e6:	6a 01                	push   $0x1
  e8:	e8 4f 05 00 00       	call   63c <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 11 09 00 00       	push   $0x911
  f5:	6a 01                	push   $0x1
  f7:	e8 40 05 00 00       	call   63c <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 d4 0d 00 00    	push   0xdd4
 105:	e8 0d 04 00 00       	call   517 <kill>
 10a:	e8 d8 03 00 00       	call   4e7 <exit>
   global = 5;
 10f:	c7 05 d0 0d 00 00 05 	movl   $0x5,0xdd0
 116:	00 00 00 
   exit();
 119:	e8 c9 03 00 00       	call   4e7 <exit>

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
 131:	e8 31 04 00 00       	call   567 <getpid>
 136:	a3 d4 0d 00 00       	mov    %eax,0xdd4
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 1a 07 00 00       	call   862 <malloc>
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
 171:	e8 11 04 00 00       	call   587 <clone>
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
 197:	e8 a0 04 00 00       	call   63c <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 e8 03 00 00       	call   58f <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 ec 08 00 00       	push   $0x8ec
 1b9:	68 f5 08 00 00       	push   $0x8f5
 1be:	6a 01                	push   $0x1
 1c0:	e8 77 04 00 00       	call   63c <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 43 09 00 00       	push   $0x943
 1cd:	68 fd 08 00 00       	push   $0x8fd
 1d2:	6a 01                	push   $0x1
 1d4:	e8 63 04 00 00       	call   63c <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 11 09 00 00       	push   $0x911
 1e1:	6a 01                	push   $0x1
 1e3:	e8 54 04 00 00       	call   63c <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 d4 0d 00 00    	push   0xdd4
 1f1:	e8 21 03 00 00       	call   517 <kill>
 1f6:	e8 ec 02 00 00       	call   4e7 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 ec 08 00 00       	push   $0x8ec
 202:	68 f5 08 00 00       	push   $0x8f5
 207:	6a 01                	push   $0x1
 209:	e8 2e 04 00 00       	call   63c <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 1e 09 00 00       	push   $0x91e
 216:	68 fd 08 00 00       	push   $0x8fd
 21b:	6a 01                	push   $0x1
 21d:	e8 1a 04 00 00       	call   63c <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 11 09 00 00       	push   $0x911
 22a:	6a 01                	push   $0x1
 22c:	e8 0b 04 00 00       	call   63c <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 d4 0d 00 00    	push   0xdd4
 23a:	e8 d8 02 00 00       	call   517 <kill>
 23f:	e8 a3 02 00 00       	call   4e7 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 ec 08 00 00       	push   $0x8ec
 24b:	68 f5 08 00 00       	push   $0x8f5
 250:	6a 01                	push   $0x1
 252:	e8 e5 03 00 00       	call   63c <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 28 09 00 00       	push   $0x928
 25f:	68 fd 08 00 00       	push   $0x8fd
 264:	6a 01                	push   $0x1
 266:	e8 d1 03 00 00       	call   63c <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 11 09 00 00       	push   $0x911
 273:	6a 01                	push   $0x1
 275:	e8 c2 03 00 00       	call   63c <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 d4 0d 00 00    	push   0xdd4
 283:	e8 8f 02 00 00       	call   517 <kill>
 288:	e8 5a 02 00 00       	call   4e7 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 0c 05 00 00       	call   7a2 <free>
   exit();
 296:	e8 4c 02 00 00       	call   4e7 <exit>

0000029b <strcpy>:
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
 361:	e8 99 01 00 00       	call   4ff <read>
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
 39f:	e8 83 01 00 00       	call   527 <open>
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
 3b4:	e8 86 01 00 00       	call   53f <fstat>
 3b9:	89 c6                	mov    %eax,%esi
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
 3be:	e8 4c 01 00 00       	call   50f <close>
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
 48c:	e8 d1 03 00 00       	call   862 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 491:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 494:	83 c4 10             	add    $0x10,%esp
 497:	eb 03                	jmp    49c <thread_create+0x1b>
      stack += 1;
 499:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 49c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4a2:	75 f5                	jne    499 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 4a4:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4a7:	52                   	push   %edx
 4a8:	ff 75 10             	push   0x10(%ebp)
 4ab:	ff 75 0c             	push   0xc(%ebp)
 4ae:	ff 75 08             	push   0x8(%ebp)
 4b1:	e8 d1 00 00 00       	call   587 <clone>
 
    return pid;
}
 4b6:	c9                   	leave  
 4b7:	c3                   	ret    

000004b8 <thread_join>:
int 
thread_join(){
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	53                   	push   %ebx
 4bc:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 4bf:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c2:	50                   	push   %eax
 4c3:	e8 c7 00 00 00       	call   58f <join>
 4c8:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 4ca:	83 c4 04             	add    $0x4,%esp
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	ff 70 fc             	push   -0x4(%eax)
 4d3:	e8 ca 02 00 00       	call   7a2 <free>
  return pid;
 4d8:	89 d8                	mov    %ebx,%eax
 4da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4dd:	c9                   	leave  
 4de:	c3                   	ret    

000004df <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4df:	b8 01 00 00 00       	mov    $0x1,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <exit>:
SYSCALL(exit)
 4e7:	b8 02 00 00 00       	mov    $0x2,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <wait>:
SYSCALL(wait)
 4ef:	b8 03 00 00 00       	mov    $0x3,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <pipe>:
SYSCALL(pipe)
 4f7:	b8 04 00 00 00       	mov    $0x4,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <read>:
SYSCALL(read)
 4ff:	b8 05 00 00 00       	mov    $0x5,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <write>:
SYSCALL(write)
 507:	b8 10 00 00 00       	mov    $0x10,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <close>:
SYSCALL(close)
 50f:	b8 15 00 00 00       	mov    $0x15,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <kill>:
SYSCALL(kill)
 517:	b8 06 00 00 00       	mov    $0x6,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <exec>:
SYSCALL(exec)
 51f:	b8 07 00 00 00       	mov    $0x7,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <open>:
SYSCALL(open)
 527:	b8 0f 00 00 00       	mov    $0xf,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <mknod>:
SYSCALL(mknod)
 52f:	b8 11 00 00 00       	mov    $0x11,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <unlink>:
SYSCALL(unlink)
 537:	b8 12 00 00 00       	mov    $0x12,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <fstat>:
SYSCALL(fstat)
 53f:	b8 08 00 00 00       	mov    $0x8,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <link>:
SYSCALL(link)
 547:	b8 13 00 00 00       	mov    $0x13,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <mkdir>:
SYSCALL(mkdir)
 54f:	b8 14 00 00 00       	mov    $0x14,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <chdir>:
SYSCALL(chdir)
 557:	b8 09 00 00 00       	mov    $0x9,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <dup>:
SYSCALL(dup)
 55f:	b8 0a 00 00 00       	mov    $0xa,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <getpid>:
SYSCALL(getpid)
 567:	b8 0b 00 00 00       	mov    $0xb,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <sbrk>:
SYSCALL(sbrk)
 56f:	b8 0c 00 00 00       	mov    $0xc,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <sleep>:
SYSCALL(sleep)
 577:	b8 0d 00 00 00       	mov    $0xd,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <uptime>:
SYSCALL(uptime)
 57f:	b8 0e 00 00 00       	mov    $0xe,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <clone>:
SYSCALL(clone)
 587:	b8 16 00 00 00       	mov    $0x16,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <join>:
SYSCALL(join)
 58f:	b8 17 00 00 00       	mov    $0x17,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	83 ec 1c             	sub    $0x1c,%esp
 59d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5a0:	6a 01                	push   $0x1
 5a2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5a5:	52                   	push   %edx
 5a6:	50                   	push   %eax
 5a7:	e8 5b ff ff ff       	call   507 <write>
}
 5ac:	83 c4 10             	add    $0x10,%esp
 5af:	c9                   	leave  
 5b0:	c3                   	ret    

000005b1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5b1:	55                   	push   %ebp
 5b2:	89 e5                	mov    %esp,%ebp
 5b4:	57                   	push   %edi
 5b5:	56                   	push   %esi
 5b6:	53                   	push   %ebx
 5b7:	83 ec 2c             	sub    $0x2c,%esp
 5ba:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5bd:	89 d0                	mov    %edx,%eax
 5bf:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5c1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5c5:	0f 95 c1             	setne  %cl
 5c8:	c1 ea 1f             	shr    $0x1f,%edx
 5cb:	84 d1                	test   %dl,%cl
 5cd:	74 44                	je     613 <printint+0x62>
    neg = 1;
    x = -xx;
 5cf:	f7 d8                	neg    %eax
 5d1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5d3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5da:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5df:	89 c8                	mov    %ecx,%eax
 5e1:	ba 00 00 00 00       	mov    $0x0,%edx
 5e6:	f7 f6                	div    %esi
 5e8:	89 df                	mov    %ebx,%edi
 5ea:	83 c3 01             	add    $0x1,%ebx
 5ed:	0f b6 92 44 0a 00 00 	movzbl 0xa44(%edx),%edx
 5f4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5f8:	89 ca                	mov    %ecx,%edx
 5fa:	89 c1                	mov    %eax,%ecx
 5fc:	39 d6                	cmp    %edx,%esi
 5fe:	76 df                	jbe    5df <printint+0x2e>
  if(neg)
 600:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 604:	74 31                	je     637 <printint+0x86>
    buf[i++] = '-';
 606:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 60b:	8d 5f 02             	lea    0x2(%edi),%ebx
 60e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 611:	eb 17                	jmp    62a <printint+0x79>
    x = xx;
 613:	89 c1                	mov    %eax,%ecx
  neg = 0;
 615:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 61c:	eb bc                	jmp    5da <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 61e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 623:	89 f0                	mov    %esi,%eax
 625:	e8 6d ff ff ff       	call   597 <putc>
  while(--i >= 0)
 62a:	83 eb 01             	sub    $0x1,%ebx
 62d:	79 ef                	jns    61e <printint+0x6d>
}
 62f:	83 c4 2c             	add    $0x2c,%esp
 632:	5b                   	pop    %ebx
 633:	5e                   	pop    %esi
 634:	5f                   	pop    %edi
 635:	5d                   	pop    %ebp
 636:	c3                   	ret    
 637:	8b 75 d0             	mov    -0x30(%ebp),%esi
 63a:	eb ee                	jmp    62a <printint+0x79>

0000063c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 63c:	55                   	push   %ebp
 63d:	89 e5                	mov    %esp,%ebp
 63f:	57                   	push   %edi
 640:	56                   	push   %esi
 641:	53                   	push   %ebx
 642:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 645:	8d 45 10             	lea    0x10(%ebp),%eax
 648:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 64b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 650:	bb 00 00 00 00       	mov    $0x0,%ebx
 655:	eb 14                	jmp    66b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 657:	89 fa                	mov    %edi,%edx
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	e8 36 ff ff ff       	call   597 <putc>
 661:	eb 05                	jmp    668 <printf+0x2c>
      }
    } else if(state == '%'){
 663:	83 fe 25             	cmp    $0x25,%esi
 666:	74 25                	je     68d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 668:	83 c3 01             	add    $0x1,%ebx
 66b:	8b 45 0c             	mov    0xc(%ebp),%eax
 66e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 672:	84 c0                	test   %al,%al
 674:	0f 84 20 01 00 00    	je     79a <printf+0x15e>
    c = fmt[i] & 0xff;
 67a:	0f be f8             	movsbl %al,%edi
 67d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 680:	85 f6                	test   %esi,%esi
 682:	75 df                	jne    663 <printf+0x27>
      if(c == '%'){
 684:	83 f8 25             	cmp    $0x25,%eax
 687:	75 ce                	jne    657 <printf+0x1b>
        state = '%';
 689:	89 c6                	mov    %eax,%esi
 68b:	eb db                	jmp    668 <printf+0x2c>
      if(c == 'd'){
 68d:	83 f8 25             	cmp    $0x25,%eax
 690:	0f 84 cf 00 00 00    	je     765 <printf+0x129>
 696:	0f 8c dd 00 00 00    	jl     779 <printf+0x13d>
 69c:	83 f8 78             	cmp    $0x78,%eax
 69f:	0f 8f d4 00 00 00    	jg     779 <printf+0x13d>
 6a5:	83 f8 63             	cmp    $0x63,%eax
 6a8:	0f 8c cb 00 00 00    	jl     779 <printf+0x13d>
 6ae:	83 e8 63             	sub    $0x63,%eax
 6b1:	83 f8 15             	cmp    $0x15,%eax
 6b4:	0f 87 bf 00 00 00    	ja     779 <printf+0x13d>
 6ba:	ff 24 85 ec 09 00 00 	jmp    *0x9ec(,%eax,4)
        printint(fd, *ap, 10, 1);
 6c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c4:	8b 17                	mov    (%edi),%edx
 6c6:	83 ec 0c             	sub    $0xc,%esp
 6c9:	6a 01                	push   $0x1
 6cb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d0:	8b 45 08             	mov    0x8(%ebp),%eax
 6d3:	e8 d9 fe ff ff       	call   5b1 <printint>
        ap++;
 6d8:	83 c7 04             	add    $0x4,%edi
 6db:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6de:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6e1:	be 00 00 00 00       	mov    $0x0,%esi
 6e6:	eb 80                	jmp    668 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6eb:	8b 17                	mov    (%edi),%edx
 6ed:	83 ec 0c             	sub    $0xc,%esp
 6f0:	6a 00                	push   $0x0
 6f2:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	e8 b2 fe ff ff       	call   5b1 <printint>
        ap++;
 6ff:	83 c7 04             	add    $0x4,%edi
 702:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 705:	83 c4 10             	add    $0x10,%esp
      state = 0;
 708:	be 00 00 00 00       	mov    $0x0,%esi
 70d:	e9 56 ff ff ff       	jmp    668 <printf+0x2c>
        s = (char*)*ap;
 712:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 715:	8b 30                	mov    (%eax),%esi
        ap++;
 717:	83 c0 04             	add    $0x4,%eax
 71a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 71d:	85 f6                	test   %esi,%esi
 71f:	75 15                	jne    736 <printf+0xfa>
          s = "(null)";
 721:	be e2 09 00 00       	mov    $0x9e2,%esi
 726:	eb 0e                	jmp    736 <printf+0xfa>
          putc(fd, *s);
 728:	0f be d2             	movsbl %dl,%edx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 64 fe ff ff       	call   597 <putc>
          s++;
 733:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 736:	0f b6 16             	movzbl (%esi),%edx
 739:	84 d2                	test   %dl,%dl
 73b:	75 eb                	jne    728 <printf+0xec>
      state = 0;
 73d:	be 00 00 00 00       	mov    $0x0,%esi
 742:	e9 21 ff ff ff       	jmp    668 <printf+0x2c>
        putc(fd, *ap);
 747:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 74a:	0f be 17             	movsbl (%edi),%edx
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
 750:	e8 42 fe ff ff       	call   597 <putc>
        ap++;
 755:	83 c7 04             	add    $0x4,%edi
 758:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 75b:	be 00 00 00 00       	mov    $0x0,%esi
 760:	e9 03 ff ff ff       	jmp    668 <printf+0x2c>
        putc(fd, c);
 765:	89 fa                	mov    %edi,%edx
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	e8 28 fe ff ff       	call   597 <putc>
      state = 0;
 76f:	be 00 00 00 00       	mov    $0x0,%esi
 774:	e9 ef fe ff ff       	jmp    668 <printf+0x2c>
        putc(fd, '%');
 779:	ba 25 00 00 00       	mov    $0x25,%edx
 77e:	8b 45 08             	mov    0x8(%ebp),%eax
 781:	e8 11 fe ff ff       	call   597 <putc>
        putc(fd, c);
 786:	89 fa                	mov    %edi,%edx
 788:	8b 45 08             	mov    0x8(%ebp),%eax
 78b:	e8 07 fe ff ff       	call   597 <putc>
      state = 0;
 790:	be 00 00 00 00       	mov    $0x0,%esi
 795:	e9 ce fe ff ff       	jmp    668 <printf+0x2c>
    }
  }
}
 79a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79d:	5b                   	pop    %ebx
 79e:	5e                   	pop    %esi
 79f:	5f                   	pop    %edi
 7a0:	5d                   	pop    %ebp
 7a1:	c3                   	ret    

000007a2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a2:	55                   	push   %ebp
 7a3:	89 e5                	mov    %esp,%ebp
 7a5:	57                   	push   %edi
 7a6:	56                   	push   %esi
 7a7:	53                   	push   %ebx
 7a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ab:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ae:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 7b3:	eb 02                	jmp    7b7 <free+0x15>
 7b5:	89 d0                	mov    %edx,%eax
 7b7:	39 c8                	cmp    %ecx,%eax
 7b9:	73 04                	jae    7bf <free+0x1d>
 7bb:	39 08                	cmp    %ecx,(%eax)
 7bd:	77 12                	ja     7d1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7bf:	8b 10                	mov    (%eax),%edx
 7c1:	39 c2                	cmp    %eax,%edx
 7c3:	77 f0                	ja     7b5 <free+0x13>
 7c5:	39 c8                	cmp    %ecx,%eax
 7c7:	72 08                	jb     7d1 <free+0x2f>
 7c9:	39 ca                	cmp    %ecx,%edx
 7cb:	77 04                	ja     7d1 <free+0x2f>
 7cd:	89 d0                	mov    %edx,%eax
 7cf:	eb e6                	jmp    7b7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7d7:	8b 10                	mov    (%eax),%edx
 7d9:	39 d7                	cmp    %edx,%edi
 7db:	74 19                	je     7f6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7dd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7e0:	8b 50 04             	mov    0x4(%eax),%edx
 7e3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e6:	39 ce                	cmp    %ecx,%esi
 7e8:	74 1b                	je     805 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ea:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7ec:	a3 d8 0d 00 00       	mov    %eax,0xdd8
}
 7f1:	5b                   	pop    %ebx
 7f2:	5e                   	pop    %esi
 7f3:	5f                   	pop    %edi
 7f4:	5d                   	pop    %ebp
 7f5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7f6:	03 72 04             	add    0x4(%edx),%esi
 7f9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7fc:	8b 10                	mov    (%eax),%edx
 7fe:	8b 12                	mov    (%edx),%edx
 800:	89 53 f8             	mov    %edx,-0x8(%ebx)
 803:	eb db                	jmp    7e0 <free+0x3e>
    p->s.size += bp->s.size;
 805:	03 53 fc             	add    -0x4(%ebx),%edx
 808:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 80b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80e:	89 10                	mov    %edx,(%eax)
 810:	eb da                	jmp    7ec <free+0x4a>

00000812 <morecore>:

static Header*
morecore(uint nu)
{
 812:	55                   	push   %ebp
 813:	89 e5                	mov    %esp,%ebp
 815:	53                   	push   %ebx
 816:	83 ec 04             	sub    $0x4,%esp
 819:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 81b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 820:	77 05                	ja     827 <morecore+0x15>
    nu = 4096;
 822:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 827:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82e:	83 ec 0c             	sub    $0xc,%esp
 831:	50                   	push   %eax
 832:	e8 38 fd ff ff       	call   56f <sbrk>
  if(p == (char*)-1)
 837:	83 c4 10             	add    $0x10,%esp
 83a:	83 f8 ff             	cmp    $0xffffffff,%eax
 83d:	74 1c                	je     85b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 83f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 842:	83 c0 08             	add    $0x8,%eax
 845:	83 ec 0c             	sub    $0xc,%esp
 848:	50                   	push   %eax
 849:	e8 54 ff ff ff       	call   7a2 <free>
  return freep;
 84e:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 853:	83 c4 10             	add    $0x10,%esp
}
 856:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 859:	c9                   	leave  
 85a:	c3                   	ret    
    return 0;
 85b:	b8 00 00 00 00       	mov    $0x0,%eax
 860:	eb f4                	jmp    856 <morecore+0x44>

00000862 <malloc>:

void*
malloc(uint nbytes)
{
 862:	55                   	push   %ebp
 863:	89 e5                	mov    %esp,%ebp
 865:	53                   	push   %ebx
 866:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 869:	8b 45 08             	mov    0x8(%ebp),%eax
 86c:	8d 58 07             	lea    0x7(%eax),%ebx
 86f:	c1 eb 03             	shr    $0x3,%ebx
 872:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 875:	8b 0d d8 0d 00 00    	mov    0xdd8,%ecx
 87b:	85 c9                	test   %ecx,%ecx
 87d:	74 04                	je     883 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87f:	8b 01                	mov    (%ecx),%eax
 881:	eb 4a                	jmp    8cd <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 883:	c7 05 d8 0d 00 00 dc 	movl   $0xddc,0xdd8
 88a:	0d 00 00 
 88d:	c7 05 dc 0d 00 00 dc 	movl   $0xddc,0xddc
 894:	0d 00 00 
    base.s.size = 0;
 897:	c7 05 e0 0d 00 00 00 	movl   $0x0,0xde0
 89e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8a1:	b9 dc 0d 00 00       	mov    $0xddc,%ecx
 8a6:	eb d7                	jmp    87f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8a8:	74 19                	je     8c3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8aa:	29 da                	sub    %ebx,%edx
 8ac:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8af:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8b2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8b5:	89 0d d8 0d 00 00    	mov    %ecx,0xdd8
      return (void*)(p + 1);
 8bb:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c1:	c9                   	leave  
 8c2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8c3:	8b 10                	mov    (%eax),%edx
 8c5:	89 11                	mov    %edx,(%ecx)
 8c7:	eb ec                	jmp    8b5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	89 c1                	mov    %eax,%ecx
 8cb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8cd:	8b 50 04             	mov    0x4(%eax),%edx
 8d0:	39 da                	cmp    %ebx,%edx
 8d2:	73 d4                	jae    8a8 <malloc+0x46>
    if(p == freep)
 8d4:	39 05 d8 0d 00 00    	cmp    %eax,0xdd8
 8da:	75 ed                	jne    8c9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8dc:	89 d8                	mov    %ebx,%eax
 8de:	e8 2f ff ff ff       	call   812 <morecore>
 8e3:	85 c0                	test   %eax,%eax
 8e5:	75 e2                	jne    8c9 <malloc+0x67>
 8e7:	eb d5                	jmp    8be <malloc+0x5c>
