
_test_14:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <worker+0x30>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <worker+0x79>
   assert(global == 1);
  18:	a1 30 0d 00 00       	mov    0xd30,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 30 0d 00 00       	mov    %eax,0xd30
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 ac 08 00 00       	push   $0x8ac
  37:	68 b6 08 00 00       	push   $0x8b6
  3c:	6a 01                	push   $0x1
  3e:	e8 bb 05 00 00       	call   5fe <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 be 08 00 00       	push   $0x8be
  4b:	68 c9 08 00 00       	push   $0x8c9
  50:	6a 01                	push   $0x1
  52:	e8 a7 05 00 00       	call   5fe <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 dd 08 00 00       	push   $0x8dd
  5f:	6a 01                	push   $0x1
  61:	e8 98 05 00 00       	call   5fe <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 34 0d 00 00    	push   0xd34
  6f:	e8 65 04 00 00       	call   4d9 <kill>
  74:	e8 30 04 00 00       	call   4a9 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 ac 08 00 00       	push   $0x8ac
  80:	68 b6 08 00 00       	push   $0x8b6
  85:	6a 01                	push   $0x1
  87:	e8 72 05 00 00       	call   5fe <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 ea 08 00 00       	push   $0x8ea
  94:	68 c9 08 00 00       	push   $0x8c9
  99:	6a 01                	push   $0x1
  9b:	e8 5e 05 00 00       	call   5fe <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 dd 08 00 00       	push   $0x8dd
  a8:	6a 01                	push   $0x1
  aa:	e8 4f 05 00 00       	call   5fe <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 34 0d 00 00    	push   0xd34
  b8:	e8 1c 04 00 00       	call   4d9 <kill>
  bd:	e8 e7 03 00 00       	call   4a9 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 ac 08 00 00       	push   $0x8ac
  c9:	68 b6 08 00 00       	push   $0x8b6
  ce:	6a 01                	push   $0x1
  d0:	e8 29 05 00 00       	call   5fe <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 f5 08 00 00       	push   $0x8f5
  dd:	68 c9 08 00 00       	push   $0x8c9
  e2:	6a 01                	push   $0x1
  e4:	e8 15 05 00 00       	call   5fe <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 dd 08 00 00       	push   $0x8dd
  f1:	6a 01                	push   $0x1
  f3:	e8 06 05 00 00       	call   5fe <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 34 0d 00 00    	push   0xd34
 101:	e8 d3 03 00 00       	call   4d9 <kill>
 106:	e8 9e 03 00 00       	call   4a9 <exit>

0000010b <main>:
{
 10b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 10f:	83 e4 f0             	and    $0xfffffff0,%esp
 112:	ff 71 fc             	push   -0x4(%ecx)
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	53                   	push   %ebx
 119:	51                   	push   %ecx
 11a:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 11d:	e8 07 04 00 00       	call   529 <getpid>
 122:	a3 34 0d 00 00       	mov    %eax,0xd34
   int arg1 = 42, arg2 = 24;
 127:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 12e:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 135:	83 ec 04             	sub    $0x4,%esp
 138:	8d 45 f0             	lea    -0x10(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 13f:	50                   	push   %eax
 140:	68 00 00 00 00       	push   $0x0
 145:	e8 f8 02 00 00       	call   442 <thread_create>
   assert(thread_pid > 0);
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	7e 65                	jle    1b6 <main+0xab>
 151:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 153:	e8 22 03 00 00       	call   47a <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d 30 0d 00 00 02 	cmpl   $0x2,0xd30
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 ac 08 00 00       	push   $0x8ac
 174:	68 b6 08 00 00       	push   $0x8b6
 179:	6a 01                	push   $0x1
 17b:	e8 7e 04 00 00       	call   5fe <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 27 09 00 00       	push   $0x927
 188:	68 c9 08 00 00       	push   $0x8c9
 18d:	6a 01                	push   $0x1
 18f:	e8 6a 04 00 00       	call   5fe <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 dd 08 00 00       	push   $0x8dd
 19c:	6a 01                	push   $0x1
 19e:	e8 5b 04 00 00       	call   5fe <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 34 0d 00 00    	push   0xd34
 1ac:	e8 28 03 00 00       	call   4d9 <kill>
 1b1:	e8 f3 02 00 00       	call   4a9 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 ac 08 00 00       	push   $0x8ac
 1bd:	68 b6 08 00 00       	push   $0x8b6
 1c2:	6a 01                	push   $0x1
 1c4:	e8 35 04 00 00       	call   5fe <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 01 09 00 00       	push   $0x901
 1d1:	68 c9 08 00 00       	push   $0x8c9
 1d6:	6a 01                	push   $0x1
 1d8:	e8 21 04 00 00       	call   5fe <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 dd 08 00 00       	push   $0x8dd
 1e5:	6a 01                	push   $0x1
 1e7:	e8 12 04 00 00       	call   5fe <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 34 0d 00 00    	push   0xd34
 1f5:	e8 df 02 00 00       	call   4d9 <kill>
 1fa:	e8 aa 02 00 00       	call   4a9 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 ac 08 00 00       	push   $0x8ac
 206:	68 b6 08 00 00       	push   $0x8b6
 20b:	6a 01                	push   $0x1
 20d:	e8 ec 03 00 00       	call   5fe <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 10 09 00 00       	push   $0x910
 21a:	68 c9 08 00 00       	push   $0x8c9
 21f:	6a 01                	push   $0x1
 221:	e8 d8 03 00 00       	call   5fe <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 dd 08 00 00       	push   $0x8dd
 22e:	6a 01                	push   $0x1
 230:	e8 c9 03 00 00       	call   5fe <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 34 0d 00 00    	push   0xd34
 23e:	e8 96 02 00 00       	call   4d9 <kill>
 243:	e8 61 02 00 00       	call   4a9 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 33 09 00 00       	push   $0x933
 250:	6a 01                	push   $0x1
 252:	e8 a7 03 00 00       	call   5fe <printf>
   exit();
 257:	e8 4d 02 00 00       	call   4a9 <exit>

0000025c <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	56                   	push   %esi
 260:	53                   	push   %ebx
 261:	8b 75 08             	mov    0x8(%ebp),%esi
 264:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 267:	89 f0                	mov    %esi,%eax
 269:	89 d1                	mov    %edx,%ecx
 26b:	83 c2 01             	add    $0x1,%edx
 26e:	89 c3                	mov    %eax,%ebx
 270:	83 c0 01             	add    $0x1,%eax
 273:	0f b6 09             	movzbl (%ecx),%ecx
 276:	88 0b                	mov    %cl,(%ebx)
 278:	84 c9                	test   %cl,%cl
 27a:	75 ed                	jne    269 <strcpy+0xd>
    ;
  return os;
}
 27c:	89 f0                	mov    %esi,%eax
 27e:	5b                   	pop    %ebx
 27f:	5e                   	pop    %esi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret    

00000282 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	8b 4d 08             	mov    0x8(%ebp),%ecx
 288:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 28b:	eb 06                	jmp    293 <strcmp+0x11>
    p++, q++;
 28d:	83 c1 01             	add    $0x1,%ecx
 290:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 293:	0f b6 01             	movzbl (%ecx),%eax
 296:	84 c0                	test   %al,%al
 298:	74 04                	je     29e <strcmp+0x1c>
 29a:	3a 02                	cmp    (%edx),%al
 29c:	74 ef                	je     28d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 29e:	0f b6 c0             	movzbl %al,%eax
 2a1:	0f b6 12             	movzbl (%edx),%edx
 2a4:	29 d0                	sub    %edx,%eax
}
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    

000002a8 <strlen>:

uint
strlen(const char *s)
{
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ae:	b8 00 00 00 00       	mov    $0x0,%eax
 2b3:	eb 03                	jmp    2b8 <strlen+0x10>
 2b5:	83 c0 01             	add    $0x1,%eax
 2b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2bc:	75 f7                	jne    2b5 <strlen+0xd>
    ;
  return n;
}
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    

000002c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c7:	89 d7                	mov    %edx,%edi
 2c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <strchr>:

char*
strchr(const char *s, char c)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2e3:	eb 03                	jmp    2e8 <strchr+0xf>
 2e5:	83 c0 01             	add    $0x1,%eax
 2e8:	0f b6 10             	movzbl (%eax),%edx
 2eb:	84 d2                	test   %dl,%dl
 2ed:	74 06                	je     2f5 <strchr+0x1c>
    if(*s == c)
 2ef:	38 ca                	cmp    %cl,%dl
 2f1:	75 f2                	jne    2e5 <strchr+0xc>
 2f3:	eb 05                	jmp    2fa <strchr+0x21>
      return (char*)s;
  return 0;
 2f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    

000002fc <gets>:

char*
gets(char *buf, int max)
{
 2fc:	55                   	push   %ebp
 2fd:	89 e5                	mov    %esp,%ebp
 2ff:	57                   	push   %edi
 300:	56                   	push   %esi
 301:	53                   	push   %ebx
 302:	83 ec 1c             	sub    $0x1c,%esp
 305:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 308:	bb 00 00 00 00       	mov    $0x0,%ebx
 30d:	89 de                	mov    %ebx,%esi
 30f:	83 c3 01             	add    $0x1,%ebx
 312:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 315:	7d 2e                	jge    345 <gets+0x49>
    cc = read(0, &c, 1);
 317:	83 ec 04             	sub    $0x4,%esp
 31a:	6a 01                	push   $0x1
 31c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 31f:	50                   	push   %eax
 320:	6a 00                	push   $0x0
 322:	e8 9a 01 00 00       	call   4c1 <read>
    if(cc < 1)
 327:	83 c4 10             	add    $0x10,%esp
 32a:	85 c0                	test   %eax,%eax
 32c:	7e 17                	jle    345 <gets+0x49>
      break;
    buf[i++] = c;
 32e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 332:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 335:	3c 0a                	cmp    $0xa,%al
 337:	0f 94 c2             	sete   %dl
 33a:	3c 0d                	cmp    $0xd,%al
 33c:	0f 94 c0             	sete   %al
 33f:	08 c2                	or     %al,%dl
 341:	74 ca                	je     30d <gets+0x11>
    buf[i++] = c;
 343:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 345:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 349:	89 f8                	mov    %edi,%eax
 34b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34e:	5b                   	pop    %ebx
 34f:	5e                   	pop    %esi
 350:	5f                   	pop    %edi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    

00000353 <stat>:

int
stat(const char *n, struct stat *st)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	56                   	push   %esi
 357:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 358:	83 ec 08             	sub    $0x8,%esp
 35b:	6a 00                	push   $0x0
 35d:	ff 75 08             	push   0x8(%ebp)
 360:	e8 84 01 00 00       	call   4e9 <open>
  if(fd < 0)
 365:	83 c4 10             	add    $0x10,%esp
 368:	85 c0                	test   %eax,%eax
 36a:	78 24                	js     390 <stat+0x3d>
 36c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 36e:	83 ec 08             	sub    $0x8,%esp
 371:	ff 75 0c             	push   0xc(%ebp)
 374:	50                   	push   %eax
 375:	e8 87 01 00 00       	call   501 <fstat>
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	89 1c 24             	mov    %ebx,(%esp)
 37f:	e8 4d 01 00 00       	call   4d1 <close>
  return r;
 384:	83 c4 10             	add    $0x10,%esp
}
 387:	89 f0                	mov    %esi,%eax
 389:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb f0                	jmp    387 <stat+0x34>

00000397 <atoi>:

int
atoi(const char *s)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	53                   	push   %ebx
 39b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 39e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3a3:	eb 10                	jmp    3b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3ab:	83 c1 01             	add    $0x1,%ecx
 3ae:	0f be c0             	movsbl %al,%eax
 3b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3b5:	0f b6 01             	movzbl (%ecx),%eax
 3b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3bb:	80 fb 09             	cmp    $0x9,%bl
 3be:	76 e5                	jbe    3a5 <atoi+0xe>
  return n;
}
 3c0:	89 d0                	mov    %edx,%eax
 3c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c5:	c9                   	leave  
 3c6:	c3                   	ret    

000003c7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	56                   	push   %esi
 3cb:	53                   	push   %ebx
 3cc:	8b 75 08             	mov    0x8(%ebp),%esi
 3cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3d7:	eb 0d                	jmp    3e6 <memmove+0x1f>
    *dst++ = *src++;
 3d9:	0f b6 01             	movzbl (%ecx),%eax
 3dc:	88 02                	mov    %al,(%edx)
 3de:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3e4:	89 d8                	mov    %ebx,%eax
 3e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3e9:	85 c0                	test   %eax,%eax
 3eb:	7f ec                	jg     3d9 <memmove+0x12>
  return vdst;
}
 3ed:	89 f0                	mov    %esi,%eax
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5d                   	pop    %ebp
 3f2:	c3                   	ret    

000003f3 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 3f9:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 3fb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3fe:	89 08                	mov    %ecx,(%eax)
  return old;
}
 400:	89 d0                	mov    %edx,%eax
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    

00000404 <lock_init>:
void 
lock_init(lock_t *lock){
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 410:	5d                   	pop    %ebp
 411:	c3                   	ret    

00000412 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
 415:	53                   	push   %ebx
 416:	83 ec 04             	sub    $0x4,%esp
 419:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 41c:	83 ec 08             	sub    $0x8,%esp
 41f:	6a 01                	push   $0x1
 421:	53                   	push   %ebx
 422:	e8 cc ff ff ff       	call   3f3 <TestAndSet>
 427:	83 c4 10             	add    $0x10,%esp
 42a:	83 f8 01             	cmp    $0x1,%eax
 42d:	74 ed                	je     41c <lock_acquire+0xa>
    ;
}
 42f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 432:	c9                   	leave  
 433:	c3                   	ret    

00000434 <lock_release>:
void 
lock_release(lock_t *lock){
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 437:	8b 45 08             	mov    0x8(%ebp),%eax
 43a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    

00000442 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 448:	68 04 20 00 00       	push   $0x2004
 44d:	e8 d2 03 00 00       	call   824 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 452:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 455:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 457:	eb 03                	jmp    45c <thread_create+0x1a>
      stack += 1;
 459:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 45c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 462:	75 f5                	jne    459 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 464:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 466:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 469:	52                   	push   %edx
 46a:	ff 75 10             	push   0x10(%ebp)
 46d:	ff 75 0c             	push   0xc(%ebp)
 470:	ff 75 08             	push   0x8(%ebp)
 473:	e8 d1 00 00 00       	call   549 <clone>
 
    return pid;
}
 478:	c9                   	leave  
 479:	c3                   	ret    

0000047a <thread_join>:
int 
thread_join(){
 47a:	55                   	push   %ebp
 47b:	89 e5                	mov    %esp,%ebp
 47d:	53                   	push   %ebx
 47e:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 481:	8d 45 f4             	lea    -0xc(%ebp),%eax
 484:	50                   	push   %eax
 485:	e8 c7 00 00 00       	call   551 <join>
 48a:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 48c:	83 c4 04             	add    $0x4,%esp
 48f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 492:	ff 70 fc             	push   -0x4(%eax)
 495:	e8 ca 02 00 00       	call   764 <free>
  return waitedForPID;
 49a:	89 d8                	mov    %ebx,%eax
 49c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49f:	c9                   	leave  
 4a0:	c3                   	ret    

000004a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a1:	b8 01 00 00 00       	mov    $0x1,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <exit>:
SYSCALL(exit)
 4a9:	b8 02 00 00 00       	mov    $0x2,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <wait>:
SYSCALL(wait)
 4b1:	b8 03 00 00 00       	mov    $0x3,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <pipe>:
SYSCALL(pipe)
 4b9:	b8 04 00 00 00       	mov    $0x4,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <read>:
SYSCALL(read)
 4c1:	b8 05 00 00 00       	mov    $0x5,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <write>:
SYSCALL(write)
 4c9:	b8 10 00 00 00       	mov    $0x10,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <close>:
SYSCALL(close)
 4d1:	b8 15 00 00 00       	mov    $0x15,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <kill>:
SYSCALL(kill)
 4d9:	b8 06 00 00 00       	mov    $0x6,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <exec>:
SYSCALL(exec)
 4e1:	b8 07 00 00 00       	mov    $0x7,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <open>:
SYSCALL(open)
 4e9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <mknod>:
SYSCALL(mknod)
 4f1:	b8 11 00 00 00       	mov    $0x11,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <unlink>:
SYSCALL(unlink)
 4f9:	b8 12 00 00 00       	mov    $0x12,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <fstat>:
SYSCALL(fstat)
 501:	b8 08 00 00 00       	mov    $0x8,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <link>:
SYSCALL(link)
 509:	b8 13 00 00 00       	mov    $0x13,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <mkdir>:
SYSCALL(mkdir)
 511:	b8 14 00 00 00       	mov    $0x14,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <chdir>:
SYSCALL(chdir)
 519:	b8 09 00 00 00       	mov    $0x9,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <dup>:
SYSCALL(dup)
 521:	b8 0a 00 00 00       	mov    $0xa,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <getpid>:
SYSCALL(getpid)
 529:	b8 0b 00 00 00       	mov    $0xb,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <sbrk>:
SYSCALL(sbrk)
 531:	b8 0c 00 00 00       	mov    $0xc,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <sleep>:
SYSCALL(sleep)
 539:	b8 0d 00 00 00       	mov    $0xd,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <uptime>:
SYSCALL(uptime)
 541:	b8 0e 00 00 00       	mov    $0xe,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <clone>:
SYSCALL(clone)
 549:	b8 16 00 00 00       	mov    $0x16,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <join>:
SYSCALL(join)
 551:	b8 17 00 00 00       	mov    $0x17,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 559:	55                   	push   %ebp
 55a:	89 e5                	mov    %esp,%ebp
 55c:	83 ec 1c             	sub    $0x1c,%esp
 55f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 562:	6a 01                	push   $0x1
 564:	8d 55 f4             	lea    -0xc(%ebp),%edx
 567:	52                   	push   %edx
 568:	50                   	push   %eax
 569:	e8 5b ff ff ff       	call   4c9 <write>
}
 56e:	83 c4 10             	add    $0x10,%esp
 571:	c9                   	leave  
 572:	c3                   	ret    

00000573 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 573:	55                   	push   %ebp
 574:	89 e5                	mov    %esp,%ebp
 576:	57                   	push   %edi
 577:	56                   	push   %esi
 578:	53                   	push   %ebx
 579:	83 ec 2c             	sub    $0x2c,%esp
 57c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 57f:	89 d0                	mov    %edx,%eax
 581:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 583:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 587:	0f 95 c1             	setne  %cl
 58a:	c1 ea 1f             	shr    $0x1f,%edx
 58d:	84 d1                	test   %dl,%cl
 58f:	74 44                	je     5d5 <printint+0x62>
    neg = 1;
    x = -xx;
 591:	f7 d8                	neg    %eax
 593:	89 c1                	mov    %eax,%ecx
    neg = 1;
 595:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 59c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5a1:	89 c8                	mov    %ecx,%eax
 5a3:	ba 00 00 00 00       	mov    $0x0,%edx
 5a8:	f7 f6                	div    %esi
 5aa:	89 df                	mov    %ebx,%edi
 5ac:	83 c3 01             	add    $0x1,%ebx
 5af:	0f b6 92 a0 09 00 00 	movzbl 0x9a0(%edx),%edx
 5b6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5ba:	89 ca                	mov    %ecx,%edx
 5bc:	89 c1                	mov    %eax,%ecx
 5be:	39 d6                	cmp    %edx,%esi
 5c0:	76 df                	jbe    5a1 <printint+0x2e>
  if(neg)
 5c2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5c6:	74 31                	je     5f9 <printint+0x86>
    buf[i++] = '-';
 5c8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5cd:	8d 5f 02             	lea    0x2(%edi),%ebx
 5d0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5d3:	eb 17                	jmp    5ec <printint+0x79>
    x = xx;
 5d5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5d7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5de:	eb bc                	jmp    59c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5e0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5e5:	89 f0                	mov    %esi,%eax
 5e7:	e8 6d ff ff ff       	call   559 <putc>
  while(--i >= 0)
 5ec:	83 eb 01             	sub    $0x1,%ebx
 5ef:	79 ef                	jns    5e0 <printint+0x6d>
}
 5f1:	83 c4 2c             	add    $0x2c,%esp
 5f4:	5b                   	pop    %ebx
 5f5:	5e                   	pop    %esi
 5f6:	5f                   	pop    %edi
 5f7:	5d                   	pop    %ebp
 5f8:	c3                   	ret    
 5f9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5fc:	eb ee                	jmp    5ec <printint+0x79>

000005fe <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5fe:	55                   	push   %ebp
 5ff:	89 e5                	mov    %esp,%ebp
 601:	57                   	push   %edi
 602:	56                   	push   %esi
 603:	53                   	push   %ebx
 604:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 607:	8d 45 10             	lea    0x10(%ebp),%eax
 60a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 60d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 612:	bb 00 00 00 00       	mov    $0x0,%ebx
 617:	eb 14                	jmp    62d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 619:	89 fa                	mov    %edi,%edx
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	e8 36 ff ff ff       	call   559 <putc>
 623:	eb 05                	jmp    62a <printf+0x2c>
      }
    } else if(state == '%'){
 625:	83 fe 25             	cmp    $0x25,%esi
 628:	74 25                	je     64f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 62a:	83 c3 01             	add    $0x1,%ebx
 62d:	8b 45 0c             	mov    0xc(%ebp),%eax
 630:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 634:	84 c0                	test   %al,%al
 636:	0f 84 20 01 00 00    	je     75c <printf+0x15e>
    c = fmt[i] & 0xff;
 63c:	0f be f8             	movsbl %al,%edi
 63f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 642:	85 f6                	test   %esi,%esi
 644:	75 df                	jne    625 <printf+0x27>
      if(c == '%'){
 646:	83 f8 25             	cmp    $0x25,%eax
 649:	75 ce                	jne    619 <printf+0x1b>
        state = '%';
 64b:	89 c6                	mov    %eax,%esi
 64d:	eb db                	jmp    62a <printf+0x2c>
      if(c == 'd'){
 64f:	83 f8 25             	cmp    $0x25,%eax
 652:	0f 84 cf 00 00 00    	je     727 <printf+0x129>
 658:	0f 8c dd 00 00 00    	jl     73b <printf+0x13d>
 65e:	83 f8 78             	cmp    $0x78,%eax
 661:	0f 8f d4 00 00 00    	jg     73b <printf+0x13d>
 667:	83 f8 63             	cmp    $0x63,%eax
 66a:	0f 8c cb 00 00 00    	jl     73b <printf+0x13d>
 670:	83 e8 63             	sub    $0x63,%eax
 673:	83 f8 15             	cmp    $0x15,%eax
 676:	0f 87 bf 00 00 00    	ja     73b <printf+0x13d>
 67c:	ff 24 85 48 09 00 00 	jmp    *0x948(,%eax,4)
        printint(fd, *ap, 10, 1);
 683:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 686:	8b 17                	mov    (%edi),%edx
 688:	83 ec 0c             	sub    $0xc,%esp
 68b:	6a 01                	push   $0x1
 68d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 692:	8b 45 08             	mov    0x8(%ebp),%eax
 695:	e8 d9 fe ff ff       	call   573 <printint>
        ap++;
 69a:	83 c7 04             	add    $0x4,%edi
 69d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a0:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6a3:	be 00 00 00 00       	mov    $0x0,%esi
 6a8:	eb 80                	jmp    62a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ad:	8b 17                	mov    (%edi),%edx
 6af:	83 ec 0c             	sub    $0xc,%esp
 6b2:	6a 00                	push   $0x0
 6b4:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
 6bc:	e8 b2 fe ff ff       	call   573 <printint>
        ap++;
 6c1:	83 c7 04             	add    $0x4,%edi
 6c4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6c7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ca:	be 00 00 00 00       	mov    $0x0,%esi
 6cf:	e9 56 ff ff ff       	jmp    62a <printf+0x2c>
        s = (char*)*ap;
 6d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d7:	8b 30                	mov    (%eax),%esi
        ap++;
 6d9:	83 c0 04             	add    $0x4,%eax
 6dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6df:	85 f6                	test   %esi,%esi
 6e1:	75 15                	jne    6f8 <printf+0xfa>
          s = "(null)";
 6e3:	be 40 09 00 00       	mov    $0x940,%esi
 6e8:	eb 0e                	jmp    6f8 <printf+0xfa>
          putc(fd, *s);
 6ea:	0f be d2             	movsbl %dl,%edx
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	e8 64 fe ff ff       	call   559 <putc>
          s++;
 6f5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6f8:	0f b6 16             	movzbl (%esi),%edx
 6fb:	84 d2                	test   %dl,%dl
 6fd:	75 eb                	jne    6ea <printf+0xec>
      state = 0;
 6ff:	be 00 00 00 00       	mov    $0x0,%esi
 704:	e9 21 ff ff ff       	jmp    62a <printf+0x2c>
        putc(fd, *ap);
 709:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70c:	0f be 17             	movsbl (%edi),%edx
 70f:	8b 45 08             	mov    0x8(%ebp),%eax
 712:	e8 42 fe ff ff       	call   559 <putc>
        ap++;
 717:	83 c7 04             	add    $0x4,%edi
 71a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 71d:	be 00 00 00 00       	mov    $0x0,%esi
 722:	e9 03 ff ff ff       	jmp    62a <printf+0x2c>
        putc(fd, c);
 727:	89 fa                	mov    %edi,%edx
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	e8 28 fe ff ff       	call   559 <putc>
      state = 0;
 731:	be 00 00 00 00       	mov    $0x0,%esi
 736:	e9 ef fe ff ff       	jmp    62a <printf+0x2c>
        putc(fd, '%');
 73b:	ba 25 00 00 00       	mov    $0x25,%edx
 740:	8b 45 08             	mov    0x8(%ebp),%eax
 743:	e8 11 fe ff ff       	call   559 <putc>
        putc(fd, c);
 748:	89 fa                	mov    %edi,%edx
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	e8 07 fe ff ff       	call   559 <putc>
      state = 0;
 752:	be 00 00 00 00       	mov    $0x0,%esi
 757:	e9 ce fe ff ff       	jmp    62a <printf+0x2c>
    }
  }
}
 75c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 75f:	5b                   	pop    %ebx
 760:	5e                   	pop    %esi
 761:	5f                   	pop    %edi
 762:	5d                   	pop    %ebp
 763:	c3                   	ret    

00000764 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	57                   	push   %edi
 768:	56                   	push   %esi
 769:	53                   	push   %ebx
 76a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 76d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 770:	a1 38 0d 00 00       	mov    0xd38,%eax
 775:	eb 02                	jmp    779 <free+0x15>
 777:	89 d0                	mov    %edx,%eax
 779:	39 c8                	cmp    %ecx,%eax
 77b:	73 04                	jae    781 <free+0x1d>
 77d:	39 08                	cmp    %ecx,(%eax)
 77f:	77 12                	ja     793 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 781:	8b 10                	mov    (%eax),%edx
 783:	39 c2                	cmp    %eax,%edx
 785:	77 f0                	ja     777 <free+0x13>
 787:	39 c8                	cmp    %ecx,%eax
 789:	72 08                	jb     793 <free+0x2f>
 78b:	39 ca                	cmp    %ecx,%edx
 78d:	77 04                	ja     793 <free+0x2f>
 78f:	89 d0                	mov    %edx,%eax
 791:	eb e6                	jmp    779 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 793:	8b 73 fc             	mov    -0x4(%ebx),%esi
 796:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 799:	8b 10                	mov    (%eax),%edx
 79b:	39 d7                	cmp    %edx,%edi
 79d:	74 19                	je     7b8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 79f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a2:	8b 50 04             	mov    0x4(%eax),%edx
 7a5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a8:	39 ce                	cmp    %ecx,%esi
 7aa:	74 1b                	je     7c7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ac:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7ae:	a3 38 0d 00 00       	mov    %eax,0xd38
}
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7b8:	03 72 04             	add    0x4(%edx),%esi
 7bb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7be:	8b 10                	mov    (%eax),%edx
 7c0:	8b 12                	mov    (%edx),%edx
 7c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7c5:	eb db                	jmp    7a2 <free+0x3e>
    p->s.size += bp->s.size;
 7c7:	03 53 fc             	add    -0x4(%ebx),%edx
 7ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7cd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7d0:	89 10                	mov    %edx,(%eax)
 7d2:	eb da                	jmp    7ae <free+0x4a>

000007d4 <morecore>:

static Header*
morecore(uint nu)
{
 7d4:	55                   	push   %ebp
 7d5:	89 e5                	mov    %esp,%ebp
 7d7:	53                   	push   %ebx
 7d8:	83 ec 04             	sub    $0x4,%esp
 7db:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7dd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7e2:	77 05                	ja     7e9 <morecore+0x15>
    nu = 4096;
 7e4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7e9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	50                   	push   %eax
 7f4:	e8 38 fd ff ff       	call   531 <sbrk>
  if(p == (char*)-1)
 7f9:	83 c4 10             	add    $0x10,%esp
 7fc:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ff:	74 1c                	je     81d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 801:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 804:	83 c0 08             	add    $0x8,%eax
 807:	83 ec 0c             	sub    $0xc,%esp
 80a:	50                   	push   %eax
 80b:	e8 54 ff ff ff       	call   764 <free>
  return freep;
 810:	a1 38 0d 00 00       	mov    0xd38,%eax
 815:	83 c4 10             	add    $0x10,%esp
}
 818:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 81b:	c9                   	leave  
 81c:	c3                   	ret    
    return 0;
 81d:	b8 00 00 00 00       	mov    $0x0,%eax
 822:	eb f4                	jmp    818 <morecore+0x44>

00000824 <malloc>:

void*
malloc(uint nbytes)
{
 824:	55                   	push   %ebp
 825:	89 e5                	mov    %esp,%ebp
 827:	53                   	push   %ebx
 828:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 82b:	8b 45 08             	mov    0x8(%ebp),%eax
 82e:	8d 58 07             	lea    0x7(%eax),%ebx
 831:	c1 eb 03             	shr    $0x3,%ebx
 834:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 837:	8b 0d 38 0d 00 00    	mov    0xd38,%ecx
 83d:	85 c9                	test   %ecx,%ecx
 83f:	74 04                	je     845 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 841:	8b 01                	mov    (%ecx),%eax
 843:	eb 4a                	jmp    88f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 845:	c7 05 38 0d 00 00 3c 	movl   $0xd3c,0xd38
 84c:	0d 00 00 
 84f:	c7 05 3c 0d 00 00 3c 	movl   $0xd3c,0xd3c
 856:	0d 00 00 
    base.s.size = 0;
 859:	c7 05 40 0d 00 00 00 	movl   $0x0,0xd40
 860:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 863:	b9 3c 0d 00 00       	mov    $0xd3c,%ecx
 868:	eb d7                	jmp    841 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 86a:	74 19                	je     885 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 86c:	29 da                	sub    %ebx,%edx
 86e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 871:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 874:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 877:	89 0d 38 0d 00 00    	mov    %ecx,0xd38
      return (void*)(p + 1);
 87d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 880:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 883:	c9                   	leave  
 884:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 885:	8b 10                	mov    (%eax),%edx
 887:	89 11                	mov    %edx,(%ecx)
 889:	eb ec                	jmp    877 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88b:	89 c1                	mov    %eax,%ecx
 88d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 88f:	8b 50 04             	mov    0x4(%eax),%edx
 892:	39 da                	cmp    %ebx,%edx
 894:	73 d4                	jae    86a <malloc+0x46>
    if(p == freep)
 896:	39 05 38 0d 00 00    	cmp    %eax,0xd38
 89c:	75 ed                	jne    88b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 89e:	89 d8                	mov    %ebx,%eax
 8a0:	e8 2f ff ff ff       	call   7d4 <morecore>
 8a5:	85 c0                	test   %eax,%eax
 8a7:	75 e2                	jne    88b <malloc+0x67>
 8a9:	eb d5                	jmp    880 <malloc+0x5c>
