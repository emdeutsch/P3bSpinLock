
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
  3e:	e8 ba 05 00 00       	call   5fd <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 be 08 00 00       	push   $0x8be
  4b:	68 c9 08 00 00       	push   $0x8c9
  50:	6a 01                	push   $0x1
  52:	e8 a6 05 00 00       	call   5fd <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 dd 08 00 00       	push   $0x8dd
  5f:	6a 01                	push   $0x1
  61:	e8 97 05 00 00       	call   5fd <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 34 0d 00 00    	push   0xd34
  6f:	e8 64 04 00 00       	call   4d8 <kill>
  74:	e8 2f 04 00 00       	call   4a8 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 ac 08 00 00       	push   $0x8ac
  80:	68 b6 08 00 00       	push   $0x8b6
  85:	6a 01                	push   $0x1
  87:	e8 71 05 00 00       	call   5fd <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 ea 08 00 00       	push   $0x8ea
  94:	68 c9 08 00 00       	push   $0x8c9
  99:	6a 01                	push   $0x1
  9b:	e8 5d 05 00 00       	call   5fd <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 dd 08 00 00       	push   $0x8dd
  a8:	6a 01                	push   $0x1
  aa:	e8 4e 05 00 00       	call   5fd <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 34 0d 00 00    	push   0xd34
  b8:	e8 1b 04 00 00       	call   4d8 <kill>
  bd:	e8 e6 03 00 00       	call   4a8 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 ac 08 00 00       	push   $0x8ac
  c9:	68 b6 08 00 00       	push   $0x8b6
  ce:	6a 01                	push   $0x1
  d0:	e8 28 05 00 00       	call   5fd <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 f5 08 00 00       	push   $0x8f5
  dd:	68 c9 08 00 00       	push   $0x8c9
  e2:	6a 01                	push   $0x1
  e4:	e8 14 05 00 00       	call   5fd <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 dd 08 00 00       	push   $0x8dd
  f1:	6a 01                	push   $0x1
  f3:	e8 05 05 00 00       	call   5fd <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 34 0d 00 00    	push   0xd34
 101:	e8 d2 03 00 00       	call   4d8 <kill>
 106:	e8 9d 03 00 00       	call   4a8 <exit>

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
 11d:	e8 06 04 00 00       	call   528 <getpid>
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
 153:	e8 21 03 00 00       	call   479 <thread_join>
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
 17b:	e8 7d 04 00 00       	call   5fd <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 27 09 00 00       	push   $0x927
 188:	68 c9 08 00 00       	push   $0x8c9
 18d:	6a 01                	push   $0x1
 18f:	e8 69 04 00 00       	call   5fd <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 dd 08 00 00       	push   $0x8dd
 19c:	6a 01                	push   $0x1
 19e:	e8 5a 04 00 00       	call   5fd <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 34 0d 00 00    	push   0xd34
 1ac:	e8 27 03 00 00       	call   4d8 <kill>
 1b1:	e8 f2 02 00 00       	call   4a8 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 ac 08 00 00       	push   $0x8ac
 1bd:	68 b6 08 00 00       	push   $0x8b6
 1c2:	6a 01                	push   $0x1
 1c4:	e8 34 04 00 00       	call   5fd <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 01 09 00 00       	push   $0x901
 1d1:	68 c9 08 00 00       	push   $0x8c9
 1d6:	6a 01                	push   $0x1
 1d8:	e8 20 04 00 00       	call   5fd <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 dd 08 00 00       	push   $0x8dd
 1e5:	6a 01                	push   $0x1
 1e7:	e8 11 04 00 00       	call   5fd <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 34 0d 00 00    	push   0xd34
 1f5:	e8 de 02 00 00       	call   4d8 <kill>
 1fa:	e8 a9 02 00 00       	call   4a8 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 ac 08 00 00       	push   $0x8ac
 206:	68 b6 08 00 00       	push   $0x8b6
 20b:	6a 01                	push   $0x1
 20d:	e8 eb 03 00 00       	call   5fd <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 10 09 00 00       	push   $0x910
 21a:	68 c9 08 00 00       	push   $0x8c9
 21f:	6a 01                	push   $0x1
 221:	e8 d7 03 00 00       	call   5fd <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 dd 08 00 00       	push   $0x8dd
 22e:	6a 01                	push   $0x1
 230:	e8 c8 03 00 00       	call   5fd <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 34 0d 00 00    	push   0xd34
 23e:	e8 95 02 00 00       	call   4d8 <kill>
 243:	e8 60 02 00 00       	call   4a8 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 33 09 00 00       	push   $0x933
 250:	6a 01                	push   $0x1
 252:	e8 a6 03 00 00       	call   5fd <printf>
   exit();
 257:	e8 4c 02 00 00       	call   4a8 <exit>

0000025c <strcpy>:
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
 322:	e8 99 01 00 00       	call   4c0 <read>
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
 360:	e8 83 01 00 00       	call   4e8 <open>
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
 375:	e8 86 01 00 00       	call   500 <fstat>
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	89 1c 24             	mov    %ebx,(%esp)
 37f:	e8 4c 01 00 00       	call   4d0 <close>
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
 44d:	e8 d1 03 00 00       	call   823 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 452:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 455:	83 c4 10             	add    $0x10,%esp
 458:	eb 03                	jmp    45d <thread_create+0x1b>
      stack += 1;
 45a:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 45d:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 463:	75 f5                	jne    45a <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 465:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 468:	52                   	push   %edx
 469:	ff 75 10             	push   0x10(%ebp)
 46c:	ff 75 0c             	push   0xc(%ebp)
 46f:	ff 75 08             	push   0x8(%ebp)
 472:	e8 d1 00 00 00       	call   548 <clone>
 
    return pid;
}
 477:	c9                   	leave  
 478:	c3                   	ret    

00000479 <thread_join>:
int 
thread_join(){
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	53                   	push   %ebx
 47d:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 480:	8d 45 f4             	lea    -0xc(%ebp),%eax
 483:	50                   	push   %eax
 484:	e8 c7 00 00 00       	call   550 <join>
 489:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 48b:	83 c4 04             	add    $0x4,%esp
 48e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 491:	ff 70 fc             	push   -0x4(%eax)
 494:	e8 ca 02 00 00       	call   763 <free>
  return pid;
 499:	89 d8                	mov    %ebx,%eax
 49b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49e:	c9                   	leave  
 49f:	c3                   	ret    

000004a0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a0:	b8 01 00 00 00       	mov    $0x1,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <exit>:
SYSCALL(exit)
 4a8:	b8 02 00 00 00       	mov    $0x2,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <wait>:
SYSCALL(wait)
 4b0:	b8 03 00 00 00       	mov    $0x3,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <pipe>:
SYSCALL(pipe)
 4b8:	b8 04 00 00 00       	mov    $0x4,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <read>:
SYSCALL(read)
 4c0:	b8 05 00 00 00       	mov    $0x5,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <write>:
SYSCALL(write)
 4c8:	b8 10 00 00 00       	mov    $0x10,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <close>:
SYSCALL(close)
 4d0:	b8 15 00 00 00       	mov    $0x15,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <kill>:
SYSCALL(kill)
 4d8:	b8 06 00 00 00       	mov    $0x6,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <exec>:
SYSCALL(exec)
 4e0:	b8 07 00 00 00       	mov    $0x7,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <open>:
SYSCALL(open)
 4e8:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <mknod>:
SYSCALL(mknod)
 4f0:	b8 11 00 00 00       	mov    $0x11,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <unlink>:
SYSCALL(unlink)
 4f8:	b8 12 00 00 00       	mov    $0x12,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <fstat>:
SYSCALL(fstat)
 500:	b8 08 00 00 00       	mov    $0x8,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <link>:
SYSCALL(link)
 508:	b8 13 00 00 00       	mov    $0x13,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <mkdir>:
SYSCALL(mkdir)
 510:	b8 14 00 00 00       	mov    $0x14,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <chdir>:
SYSCALL(chdir)
 518:	b8 09 00 00 00       	mov    $0x9,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <dup>:
SYSCALL(dup)
 520:	b8 0a 00 00 00       	mov    $0xa,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <getpid>:
SYSCALL(getpid)
 528:	b8 0b 00 00 00       	mov    $0xb,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <sbrk>:
SYSCALL(sbrk)
 530:	b8 0c 00 00 00       	mov    $0xc,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <sleep>:
SYSCALL(sleep)
 538:	b8 0d 00 00 00       	mov    $0xd,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <uptime>:
SYSCALL(uptime)
 540:	b8 0e 00 00 00       	mov    $0xe,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <clone>:
SYSCALL(clone)
 548:	b8 16 00 00 00       	mov    $0x16,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <join>:
SYSCALL(join)
 550:	b8 17 00 00 00       	mov    $0x17,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 558:	55                   	push   %ebp
 559:	89 e5                	mov    %esp,%ebp
 55b:	83 ec 1c             	sub    $0x1c,%esp
 55e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 561:	6a 01                	push   $0x1
 563:	8d 55 f4             	lea    -0xc(%ebp),%edx
 566:	52                   	push   %edx
 567:	50                   	push   %eax
 568:	e8 5b ff ff ff       	call   4c8 <write>
}
 56d:	83 c4 10             	add    $0x10,%esp
 570:	c9                   	leave  
 571:	c3                   	ret    

00000572 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 572:	55                   	push   %ebp
 573:	89 e5                	mov    %esp,%ebp
 575:	57                   	push   %edi
 576:	56                   	push   %esi
 577:	53                   	push   %ebx
 578:	83 ec 2c             	sub    $0x2c,%esp
 57b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 57e:	89 d0                	mov    %edx,%eax
 580:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 582:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 586:	0f 95 c1             	setne  %cl
 589:	c1 ea 1f             	shr    $0x1f,%edx
 58c:	84 d1                	test   %dl,%cl
 58e:	74 44                	je     5d4 <printint+0x62>
    neg = 1;
    x = -xx;
 590:	f7 d8                	neg    %eax
 592:	89 c1                	mov    %eax,%ecx
    neg = 1;
 594:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 59b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	ba 00 00 00 00       	mov    $0x0,%edx
 5a7:	f7 f6                	div    %esi
 5a9:	89 df                	mov    %ebx,%edi
 5ab:	83 c3 01             	add    $0x1,%ebx
 5ae:	0f b6 92 a0 09 00 00 	movzbl 0x9a0(%edx),%edx
 5b5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5b9:	89 ca                	mov    %ecx,%edx
 5bb:	89 c1                	mov    %eax,%ecx
 5bd:	39 d6                	cmp    %edx,%esi
 5bf:	76 df                	jbe    5a0 <printint+0x2e>
  if(neg)
 5c1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5c5:	74 31                	je     5f8 <printint+0x86>
    buf[i++] = '-';
 5c7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5cc:	8d 5f 02             	lea    0x2(%edi),%ebx
 5cf:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5d2:	eb 17                	jmp    5eb <printint+0x79>
    x = xx;
 5d4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5d6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5dd:	eb bc                	jmp    59b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5df:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5e4:	89 f0                	mov    %esi,%eax
 5e6:	e8 6d ff ff ff       	call   558 <putc>
  while(--i >= 0)
 5eb:	83 eb 01             	sub    $0x1,%ebx
 5ee:	79 ef                	jns    5df <printint+0x6d>
}
 5f0:	83 c4 2c             	add    $0x2c,%esp
 5f3:	5b                   	pop    %ebx
 5f4:	5e                   	pop    %esi
 5f5:	5f                   	pop    %edi
 5f6:	5d                   	pop    %ebp
 5f7:	c3                   	ret    
 5f8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5fb:	eb ee                	jmp    5eb <printint+0x79>

000005fd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	57                   	push   %edi
 601:	56                   	push   %esi
 602:	53                   	push   %ebx
 603:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 606:	8d 45 10             	lea    0x10(%ebp),%eax
 609:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 60c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 611:	bb 00 00 00 00       	mov    $0x0,%ebx
 616:	eb 14                	jmp    62c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 618:	89 fa                	mov    %edi,%edx
 61a:	8b 45 08             	mov    0x8(%ebp),%eax
 61d:	e8 36 ff ff ff       	call   558 <putc>
 622:	eb 05                	jmp    629 <printf+0x2c>
      }
    } else if(state == '%'){
 624:	83 fe 25             	cmp    $0x25,%esi
 627:	74 25                	je     64e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 629:	83 c3 01             	add    $0x1,%ebx
 62c:	8b 45 0c             	mov    0xc(%ebp),%eax
 62f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 633:	84 c0                	test   %al,%al
 635:	0f 84 20 01 00 00    	je     75b <printf+0x15e>
    c = fmt[i] & 0xff;
 63b:	0f be f8             	movsbl %al,%edi
 63e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 641:	85 f6                	test   %esi,%esi
 643:	75 df                	jne    624 <printf+0x27>
      if(c == '%'){
 645:	83 f8 25             	cmp    $0x25,%eax
 648:	75 ce                	jne    618 <printf+0x1b>
        state = '%';
 64a:	89 c6                	mov    %eax,%esi
 64c:	eb db                	jmp    629 <printf+0x2c>
      if(c == 'd'){
 64e:	83 f8 25             	cmp    $0x25,%eax
 651:	0f 84 cf 00 00 00    	je     726 <printf+0x129>
 657:	0f 8c dd 00 00 00    	jl     73a <printf+0x13d>
 65d:	83 f8 78             	cmp    $0x78,%eax
 660:	0f 8f d4 00 00 00    	jg     73a <printf+0x13d>
 666:	83 f8 63             	cmp    $0x63,%eax
 669:	0f 8c cb 00 00 00    	jl     73a <printf+0x13d>
 66f:	83 e8 63             	sub    $0x63,%eax
 672:	83 f8 15             	cmp    $0x15,%eax
 675:	0f 87 bf 00 00 00    	ja     73a <printf+0x13d>
 67b:	ff 24 85 48 09 00 00 	jmp    *0x948(,%eax,4)
        printint(fd, *ap, 10, 1);
 682:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 685:	8b 17                	mov    (%edi),%edx
 687:	83 ec 0c             	sub    $0xc,%esp
 68a:	6a 01                	push   $0x1
 68c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 691:	8b 45 08             	mov    0x8(%ebp),%eax
 694:	e8 d9 fe ff ff       	call   572 <printint>
        ap++;
 699:	83 c7 04             	add    $0x4,%edi
 69c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 69f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6a2:	be 00 00 00 00       	mov    $0x0,%esi
 6a7:	eb 80                	jmp    629 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6a9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ac:	8b 17                	mov    (%edi),%edx
 6ae:	83 ec 0c             	sub    $0xc,%esp
 6b1:	6a 00                	push   $0x0
 6b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	e8 b2 fe ff ff       	call   572 <printint>
        ap++;
 6c0:	83 c7 04             	add    $0x4,%edi
 6c3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c9:	be 00 00 00 00       	mov    $0x0,%esi
 6ce:	e9 56 ff ff ff       	jmp    629 <printf+0x2c>
        s = (char*)*ap;
 6d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d6:	8b 30                	mov    (%eax),%esi
        ap++;
 6d8:	83 c0 04             	add    $0x4,%eax
 6db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6de:	85 f6                	test   %esi,%esi
 6e0:	75 15                	jne    6f7 <printf+0xfa>
          s = "(null)";
 6e2:	be 40 09 00 00       	mov    $0x940,%esi
 6e7:	eb 0e                	jmp    6f7 <printf+0xfa>
          putc(fd, *s);
 6e9:	0f be d2             	movsbl %dl,%edx
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	e8 64 fe ff ff       	call   558 <putc>
          s++;
 6f4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6f7:	0f b6 16             	movzbl (%esi),%edx
 6fa:	84 d2                	test   %dl,%dl
 6fc:	75 eb                	jne    6e9 <printf+0xec>
      state = 0;
 6fe:	be 00 00 00 00       	mov    $0x0,%esi
 703:	e9 21 ff ff ff       	jmp    629 <printf+0x2c>
        putc(fd, *ap);
 708:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70b:	0f be 17             	movsbl (%edi),%edx
 70e:	8b 45 08             	mov    0x8(%ebp),%eax
 711:	e8 42 fe ff ff       	call   558 <putc>
        ap++;
 716:	83 c7 04             	add    $0x4,%edi
 719:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 03 ff ff ff       	jmp    629 <printf+0x2c>
        putc(fd, c);
 726:	89 fa                	mov    %edi,%edx
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	e8 28 fe ff ff       	call   558 <putc>
      state = 0;
 730:	be 00 00 00 00       	mov    $0x0,%esi
 735:	e9 ef fe ff ff       	jmp    629 <printf+0x2c>
        putc(fd, '%');
 73a:	ba 25 00 00 00       	mov    $0x25,%edx
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	e8 11 fe ff ff       	call   558 <putc>
        putc(fd, c);
 747:	89 fa                	mov    %edi,%edx
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	e8 07 fe ff ff       	call   558 <putc>
      state = 0;
 751:	be 00 00 00 00       	mov    $0x0,%esi
 756:	e9 ce fe ff ff       	jmp    629 <printf+0x2c>
    }
  }
}
 75b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 75e:	5b                   	pop    %ebx
 75f:	5e                   	pop    %esi
 760:	5f                   	pop    %edi
 761:	5d                   	pop    %ebp
 762:	c3                   	ret    

00000763 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 763:	55                   	push   %ebp
 764:	89 e5                	mov    %esp,%ebp
 766:	57                   	push   %edi
 767:	56                   	push   %esi
 768:	53                   	push   %ebx
 769:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 76c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76f:	a1 38 0d 00 00       	mov    0xd38,%eax
 774:	eb 02                	jmp    778 <free+0x15>
 776:	89 d0                	mov    %edx,%eax
 778:	39 c8                	cmp    %ecx,%eax
 77a:	73 04                	jae    780 <free+0x1d>
 77c:	39 08                	cmp    %ecx,(%eax)
 77e:	77 12                	ja     792 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	8b 10                	mov    (%eax),%edx
 782:	39 c2                	cmp    %eax,%edx
 784:	77 f0                	ja     776 <free+0x13>
 786:	39 c8                	cmp    %ecx,%eax
 788:	72 08                	jb     792 <free+0x2f>
 78a:	39 ca                	cmp    %ecx,%edx
 78c:	77 04                	ja     792 <free+0x2f>
 78e:	89 d0                	mov    %edx,%eax
 790:	eb e6                	jmp    778 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 792:	8b 73 fc             	mov    -0x4(%ebx),%esi
 795:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 798:	8b 10                	mov    (%eax),%edx
 79a:	39 d7                	cmp    %edx,%edi
 79c:	74 19                	je     7b7 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 79e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a1:	8b 50 04             	mov    0x4(%eax),%edx
 7a4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a7:	39 ce                	cmp    %ecx,%esi
 7a9:	74 1b                	je     7c6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ab:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7ad:	a3 38 0d 00 00       	mov    %eax,0xd38
}
 7b2:	5b                   	pop    %ebx
 7b3:	5e                   	pop    %esi
 7b4:	5f                   	pop    %edi
 7b5:	5d                   	pop    %ebp
 7b6:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7b7:	03 72 04             	add    0x4(%edx),%esi
 7ba:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7bd:	8b 10                	mov    (%eax),%edx
 7bf:	8b 12                	mov    (%edx),%edx
 7c1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7c4:	eb db                	jmp    7a1 <free+0x3e>
    p->s.size += bp->s.size;
 7c6:	03 53 fc             	add    -0x4(%ebx),%edx
 7c9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7cc:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7cf:	89 10                	mov    %edx,(%eax)
 7d1:	eb da                	jmp    7ad <free+0x4a>

000007d3 <morecore>:

static Header*
morecore(uint nu)
{
 7d3:	55                   	push   %ebp
 7d4:	89 e5                	mov    %esp,%ebp
 7d6:	53                   	push   %ebx
 7d7:	83 ec 04             	sub    $0x4,%esp
 7da:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7dc:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7e1:	77 05                	ja     7e8 <morecore+0x15>
    nu = 4096;
 7e3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7e8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	50                   	push   %eax
 7f3:	e8 38 fd ff ff       	call   530 <sbrk>
  if(p == (char*)-1)
 7f8:	83 c4 10             	add    $0x10,%esp
 7fb:	83 f8 ff             	cmp    $0xffffffff,%eax
 7fe:	74 1c                	je     81c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 800:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 803:	83 c0 08             	add    $0x8,%eax
 806:	83 ec 0c             	sub    $0xc,%esp
 809:	50                   	push   %eax
 80a:	e8 54 ff ff ff       	call   763 <free>
  return freep;
 80f:	a1 38 0d 00 00       	mov    0xd38,%eax
 814:	83 c4 10             	add    $0x10,%esp
}
 817:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 81a:	c9                   	leave  
 81b:	c3                   	ret    
    return 0;
 81c:	b8 00 00 00 00       	mov    $0x0,%eax
 821:	eb f4                	jmp    817 <morecore+0x44>

00000823 <malloc>:

void*
malloc(uint nbytes)
{
 823:	55                   	push   %ebp
 824:	89 e5                	mov    %esp,%ebp
 826:	53                   	push   %ebx
 827:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 82a:	8b 45 08             	mov    0x8(%ebp),%eax
 82d:	8d 58 07             	lea    0x7(%eax),%ebx
 830:	c1 eb 03             	shr    $0x3,%ebx
 833:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 836:	8b 0d 38 0d 00 00    	mov    0xd38,%ecx
 83c:	85 c9                	test   %ecx,%ecx
 83e:	74 04                	je     844 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	8b 01                	mov    (%ecx),%eax
 842:	eb 4a                	jmp    88e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 844:	c7 05 38 0d 00 00 3c 	movl   $0xd3c,0xd38
 84b:	0d 00 00 
 84e:	c7 05 3c 0d 00 00 3c 	movl   $0xd3c,0xd3c
 855:	0d 00 00 
    base.s.size = 0;
 858:	c7 05 40 0d 00 00 00 	movl   $0x0,0xd40
 85f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 862:	b9 3c 0d 00 00       	mov    $0xd3c,%ecx
 867:	eb d7                	jmp    840 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 869:	74 19                	je     884 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 86b:	29 da                	sub    %ebx,%edx
 86d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 870:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 873:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 876:	89 0d 38 0d 00 00    	mov    %ecx,0xd38
      return (void*)(p + 1);
 87c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 87f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 882:	c9                   	leave  
 883:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 884:	8b 10                	mov    (%eax),%edx
 886:	89 11                	mov    %edx,(%ecx)
 888:	eb ec                	jmp    876 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88a:	89 c1                	mov    %eax,%ecx
 88c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 88e:	8b 50 04             	mov    0x4(%eax),%edx
 891:	39 da                	cmp    %ebx,%edx
 893:	73 d4                	jae    869 <malloc+0x46>
    if(p == freep)
 895:	39 05 38 0d 00 00    	cmp    %eax,0xd38
 89b:	75 ed                	jne    88a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 89d:	89 d8                	mov    %ebx,%eax
 89f:	e8 2f ff ff ff       	call   7d3 <morecore>
 8a4:	85 c0                	test   %eax,%eax
 8a6:	75 e2                	jne    88a <malloc+0x67>
 8a8:	eb d5                	jmp    87f <malloc+0x5c>
