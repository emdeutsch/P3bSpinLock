
_test_11:     file format elf32-i386


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
   assert(global == 1);
   6:	a1 1c 0d 00 00       	mov    0xd1c,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 74 08 00 00       	push   $0x874
  17:	68 7e 08 00 00       	push   $0x87e
  1c:	6a 01                	push   $0x1
  1e:	e8 a4 05 00 00       	call   5c7 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 86 08 00 00       	push   $0x886
  2b:	68 92 08 00 00       	push   $0x892
  30:	6a 01                	push   $0x1
  32:	e8 90 05 00 00       	call   5c7 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 a6 08 00 00       	push   $0x8a6
  3f:	6a 01                	push   $0x1
  41:	e8 81 05 00 00       	call   5c7 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 20 0d 00 00    	push   0xd20
  4f:	e8 4e 04 00 00       	call   4a2 <kill>
  54:	e8 19 04 00 00       	call   472 <exit>
   global += 4;
  59:	a1 1c 0d 00 00       	mov    0xd1c,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 1c 0d 00 00       	mov    %eax,0xd1c
   exit();
  66:	e8 07 04 00 00       	call   472 <exit>

0000006b <main>:
{
  6b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6f:	83 e4 f0             	and    $0xfffffff0,%esp
  72:	ff 71 fc             	push   -0x4(%ecx)
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	56                   	push   %esi
  79:	53                   	push   %ebx
  7a:	51                   	push   %ecx
  7b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  7e:	e8 6f 04 00 00       	call   4f2 <getpid>
  83:	a3 20 0d 00 00       	mov    %eax,0xd20
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 1c 0d 00 00 01 	movl   $0x1,0xd1c
  9d:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	6a 00                	push   $0x0
  a5:	6a 00                	push   $0x0
  a7:	68 00 00 00 00       	push   $0x0
  ac:	e8 5b 03 00 00       	call   40c <thread_create>
  b1:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	85 c0                	test   %eax,%eax
  b8:	7e 34                	jle    ee <main+0x83>
      join_pid = thread_join();
  ba:	e8 84 03 00 00       	call   443 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 1c 0d 00 00       	mov    0xd1c,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 1f 04 00 00       	call   4fa <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 74 08 00 00       	push   $0x874
  f5:	68 7e 08 00 00       	push   $0x87e
  fa:	6a 01                	push   $0x1
  fc:	e8 c6 04 00 00       	call   5c7 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 b3 08 00 00       	push   $0x8b3
 109:	68 92 08 00 00       	push   $0x892
 10e:	6a 01                	push   $0x1
 110:	e8 b2 04 00 00       	call   5c7 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 a6 08 00 00       	push   $0x8a6
 11d:	6a 01                	push   $0x1
 11f:	e8 a3 04 00 00       	call   5c7 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 20 0d 00 00    	push   0xd20
 12d:	e8 70 03 00 00       	call   4a2 <kill>
 132:	e8 3b 03 00 00       	call   472 <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 74 08 00 00       	push   $0x874
 13e:	68 7e 08 00 00       	push   $0x87e
 143:	6a 01                	push   $0x1
 145:	e8 7d 04 00 00       	call   5c7 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 c2 08 00 00       	push   $0x8c2
 152:	68 92 08 00 00       	push   $0x892
 157:	6a 01                	push   $0x1
 159:	e8 69 04 00 00       	call   5c7 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 a6 08 00 00       	push   $0x8a6
 166:	6a 01                	push   $0x1
 168:	e8 5a 04 00 00       	call   5c7 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 20 0d 00 00    	push   0xd20
 176:	e8 27 03 00 00       	call   4a2 <kill>
 17b:	e8 f2 02 00 00       	call   472 <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 74 08 00 00       	push   $0x874
 187:	68 7e 08 00 00       	push   $0x87e
 18c:	6a 01                	push   $0x1
 18e:	e8 34 04 00 00       	call   5c7 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 d9 08 00 00       	push   $0x8d9
 19b:	68 92 08 00 00       	push   $0x892
 1a0:	6a 01                	push   $0x1
 1a2:	e8 20 04 00 00       	call   5c7 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 a6 08 00 00       	push   $0x8a6
 1af:	6a 01                	push   $0x1
 1b1:	e8 11 04 00 00       	call   5c7 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 20 0d 00 00    	push   0xd20
 1bf:	e8 de 02 00 00       	call   4a2 <kill>
 1c4:	e8 a9 02 00 00       	call   472 <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 74 08 00 00       	push   $0x874
 1d0:	68 7e 08 00 00       	push   $0x87e
 1d5:	6a 01                	push   $0x1
 1d7:	e8 eb 03 00 00       	call   5c7 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 f4 08 00 00       	push   $0x8f4
 1e4:	68 92 08 00 00       	push   $0x892
 1e9:	6a 01                	push   $0x1
 1eb:	e8 d7 03 00 00       	call   5c7 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 a6 08 00 00       	push   $0x8a6
 1f8:	6a 01                	push   $0x1
 1fa:	e8 c8 03 00 00       	call   5c7 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 20 0d 00 00    	push   0xd20
 208:	e8 95 02 00 00       	call   4a2 <kill>
 20d:	e8 60 02 00 00       	call   472 <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 e5 08 00 00       	push   $0x8e5
 21a:	6a 01                	push   $0x1
 21c:	e8 a6 03 00 00       	call   5c7 <printf>
   exit();
 221:	e8 4c 02 00 00       	call   472 <exit>

00000226 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	56                   	push   %esi
 22a:	53                   	push   %ebx
 22b:	8b 75 08             	mov    0x8(%ebp),%esi
 22e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 231:	89 f0                	mov    %esi,%eax
 233:	89 d1                	mov    %edx,%ecx
 235:	83 c2 01             	add    $0x1,%edx
 238:	89 c3                	mov    %eax,%ebx
 23a:	83 c0 01             	add    $0x1,%eax
 23d:	0f b6 09             	movzbl (%ecx),%ecx
 240:	88 0b                	mov    %cl,(%ebx)
 242:	84 c9                	test   %cl,%cl
 244:	75 ed                	jne    233 <strcpy+0xd>
    ;
  return os;
}
 246:	89 f0                	mov    %esi,%eax
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 252:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 255:	eb 06                	jmp    25d <strcmp+0x11>
    p++, q++;
 257:	83 c1 01             	add    $0x1,%ecx
 25a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 25d:	0f b6 01             	movzbl (%ecx),%eax
 260:	84 c0                	test   %al,%al
 262:	74 04                	je     268 <strcmp+0x1c>
 264:	3a 02                	cmp    (%edx),%al
 266:	74 ef                	je     257 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 268:	0f b6 c0             	movzbl %al,%eax
 26b:	0f b6 12             	movzbl (%edx),%edx
 26e:	29 d0                	sub    %edx,%eax
}
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strlen>:

uint
strlen(const char *s)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 278:	b8 00 00 00 00       	mov    $0x0,%eax
 27d:	eb 03                	jmp    282 <strlen+0x10>
 27f:	83 c0 01             	add    $0x1,%eax
 282:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 286:	75 f7                	jne    27f <strlen+0xd>
    ;
  return n;
}
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <memset>:

void*
memset(void *dst, int c, uint n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	57                   	push   %edi
 28e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 291:	89 d7                	mov    %edx,%edi
 293:	8b 4d 10             	mov    0x10(%ebp),%ecx
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	fc                   	cld    
 29a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 29c:	89 d0                	mov    %edx,%eax
 29e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <strchr>:

char*
strchr(const char *s, char c)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ad:	eb 03                	jmp    2b2 <strchr+0xf>
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	0f b6 10             	movzbl (%eax),%edx
 2b5:	84 d2                	test   %dl,%dl
 2b7:	74 06                	je     2bf <strchr+0x1c>
    if(*s == c)
 2b9:	38 ca                	cmp    %cl,%dl
 2bb:	75 f2                	jne    2af <strchr+0xc>
 2bd:	eb 05                	jmp    2c4 <strchr+0x21>
      return (char*)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	57                   	push   %edi
 2ca:	56                   	push   %esi
 2cb:	53                   	push   %ebx
 2cc:	83 ec 1c             	sub    $0x1c,%esp
 2cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7d 2e                	jge    30f <gets+0x49>
    cc = read(0, &c, 1);
 2e1:	83 ec 04             	sub    $0x4,%esp
 2e4:	6a 01                	push   $0x1
 2e6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e9:	50                   	push   %eax
 2ea:	6a 00                	push   $0x0
 2ec:	e8 99 01 00 00       	call   48a <read>
    if(cc < 1)
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	7e 17                	jle    30f <gets+0x49>
      break;
    buf[i++] = c;
 2f8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2fc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2ff:	3c 0a                	cmp    $0xa,%al
 301:	0f 94 c2             	sete   %dl
 304:	3c 0d                	cmp    $0xd,%al
 306:	0f 94 c0             	sete   %al
 309:	08 c2                	or     %al,%dl
 30b:	74 ca                	je     2d7 <gets+0x11>
    buf[i++] = c;
 30d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 30f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 313:	89 f8                	mov    %edi,%eax
 315:	8d 65 f4             	lea    -0xc(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5f                   	pop    %edi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    

0000031d <stat>:

int
stat(const char *n, struct stat *st)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	56                   	push   %esi
 321:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 322:	83 ec 08             	sub    $0x8,%esp
 325:	6a 00                	push   $0x0
 327:	ff 75 08             	push   0x8(%ebp)
 32a:	e8 83 01 00 00       	call   4b2 <open>
  if(fd < 0)
 32f:	83 c4 10             	add    $0x10,%esp
 332:	85 c0                	test   %eax,%eax
 334:	78 24                	js     35a <stat+0x3d>
 336:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 338:	83 ec 08             	sub    $0x8,%esp
 33b:	ff 75 0c             	push   0xc(%ebp)
 33e:	50                   	push   %eax
 33f:	e8 86 01 00 00       	call   4ca <fstat>
 344:	89 c6                	mov    %eax,%esi
  close(fd);
 346:	89 1c 24             	mov    %ebx,(%esp)
 349:	e8 4c 01 00 00       	call   49a <close>
  return r;
 34e:	83 c4 10             	add    $0x10,%esp
}
 351:	89 f0                	mov    %esi,%eax
 353:	8d 65 f8             	lea    -0x8(%ebp),%esp
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    
    return -1;
 35a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35f:	eb f0                	jmp    351 <stat+0x34>

00000361 <atoi>:

int
atoi(const char *s)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	53                   	push   %ebx
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 368:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 36d:	eb 10                	jmp    37f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 36f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 372:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 375:	83 c1 01             	add    $0x1,%ecx
 378:	0f be c0             	movsbl %al,%eax
 37b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 37f:	0f b6 01             	movzbl (%ecx),%eax
 382:	8d 58 d0             	lea    -0x30(%eax),%ebx
 385:	80 fb 09             	cmp    $0x9,%bl
 388:	76 e5                	jbe    36f <atoi+0xe>
  return n;
}
 38a:	89 d0                	mov    %edx,%eax
 38c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38f:	c9                   	leave  
 390:	c3                   	ret    

00000391 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	8b 75 08             	mov    0x8(%ebp),%esi
 399:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 39c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 39f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3a1:	eb 0d                	jmp    3b0 <memmove+0x1f>
    *dst++ = *src++;
 3a3:	0f b6 01             	movzbl (%ecx),%eax
 3a6:	88 02                	mov    %al,(%edx)
 3a8:	8d 49 01             	lea    0x1(%ecx),%ecx
 3ab:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ae:	89 d8                	mov    %ebx,%eax
 3b0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3b3:	85 c0                	test   %eax,%eax
 3b5:	7f ec                	jg     3a3 <memmove+0x12>
  return vdst;
}
 3b7:	89 f0                	mov    %esi,%eax
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    

000003bd <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 3bd:	55                   	push   %ebp
 3be:	89 e5                	mov    %esp,%ebp
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 3c3:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 3c5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c8:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3ca:	89 d0                	mov    %edx,%eax
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    

000003ce <lock_init>:
void 
lock_init(lock_t *lock){
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3d1:	8b 45 08             	mov    0x8(%ebp),%eax
 3d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3da:	5d                   	pop    %ebp
 3db:	c3                   	ret    

000003dc <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	53                   	push   %ebx
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 3e6:	83 ec 08             	sub    $0x8,%esp
 3e9:	6a 01                	push   $0x1
 3eb:	53                   	push   %ebx
 3ec:	e8 cc ff ff ff       	call   3bd <TestAndSet>
 3f1:	83 c4 10             	add    $0x10,%esp
 3f4:	83 f8 01             	cmp    $0x1,%eax
 3f7:	74 ed                	je     3e6 <lock_acquire+0xa>
    ;
}
 3f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3fc:	c9                   	leave  
 3fd:	c3                   	ret    

000003fe <lock_release>:
void 
lock_release(lock_t *lock){
 3fe:	55                   	push   %ebp
 3ff:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 401:	8b 45 08             	mov    0x8(%ebp),%eax
 404:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 40a:	5d                   	pop    %ebp
 40b:	c3                   	ret    

0000040c <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 412:	68 04 20 00 00       	push   $0x2004
 417:	e8 d1 03 00 00       	call   7ed <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 41c:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 41f:	83 c4 10             	add    $0x10,%esp
 422:	eb 03                	jmp    427 <thread_create+0x1b>
      stack += 1;
 424:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 427:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 42d:	75 f5                	jne    424 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 42f:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 432:	52                   	push   %edx
 433:	ff 75 10             	push   0x10(%ebp)
 436:	ff 75 0c             	push   0xc(%ebp)
 439:	ff 75 08             	push   0x8(%ebp)
 43c:	e8 d1 00 00 00       	call   512 <clone>
 
    return pid;
}
 441:	c9                   	leave  
 442:	c3                   	ret    

00000443 <thread_join>:
int 
thread_join(){
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
 446:	53                   	push   %ebx
 447:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 44a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 44d:	50                   	push   %eax
 44e:	e8 c7 00 00 00       	call   51a <join>
 453:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 455:	83 c4 04             	add    $0x4,%esp
 458:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45b:	ff 70 fc             	push   -0x4(%eax)
 45e:	e8 ca 02 00 00       	call   72d <free>
  return pid;
 463:	89 d8                	mov    %ebx,%eax
 465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 468:	c9                   	leave  
 469:	c3                   	ret    

0000046a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 46a:	b8 01 00 00 00       	mov    $0x1,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <exit>:
SYSCALL(exit)
 472:	b8 02 00 00 00       	mov    $0x2,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <wait>:
SYSCALL(wait)
 47a:	b8 03 00 00 00       	mov    $0x3,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <pipe>:
SYSCALL(pipe)
 482:	b8 04 00 00 00       	mov    $0x4,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <read>:
SYSCALL(read)
 48a:	b8 05 00 00 00       	mov    $0x5,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <write>:
SYSCALL(write)
 492:	b8 10 00 00 00       	mov    $0x10,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <close>:
SYSCALL(close)
 49a:	b8 15 00 00 00       	mov    $0x15,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <kill>:
SYSCALL(kill)
 4a2:	b8 06 00 00 00       	mov    $0x6,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <exec>:
SYSCALL(exec)
 4aa:	b8 07 00 00 00       	mov    $0x7,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <open>:
SYSCALL(open)
 4b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <mknod>:
SYSCALL(mknod)
 4ba:	b8 11 00 00 00       	mov    $0x11,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <unlink>:
SYSCALL(unlink)
 4c2:	b8 12 00 00 00       	mov    $0x12,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <fstat>:
SYSCALL(fstat)
 4ca:	b8 08 00 00 00       	mov    $0x8,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <link>:
SYSCALL(link)
 4d2:	b8 13 00 00 00       	mov    $0x13,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <mkdir>:
SYSCALL(mkdir)
 4da:	b8 14 00 00 00       	mov    $0x14,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <chdir>:
SYSCALL(chdir)
 4e2:	b8 09 00 00 00       	mov    $0x9,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <dup>:
SYSCALL(dup)
 4ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <getpid>:
SYSCALL(getpid)
 4f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <sbrk>:
SYSCALL(sbrk)
 4fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <sleep>:
SYSCALL(sleep)
 502:	b8 0d 00 00 00       	mov    $0xd,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <uptime>:
SYSCALL(uptime)
 50a:	b8 0e 00 00 00       	mov    $0xe,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <clone>:
SYSCALL(clone)
 512:	b8 16 00 00 00       	mov    $0x16,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <join>:
SYSCALL(join)
 51a:	b8 17 00 00 00       	mov    $0x17,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	83 ec 1c             	sub    $0x1c,%esp
 528:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 52b:	6a 01                	push   $0x1
 52d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 530:	52                   	push   %edx
 531:	50                   	push   %eax
 532:	e8 5b ff ff ff       	call   492 <write>
}
 537:	83 c4 10             	add    $0x10,%esp
 53a:	c9                   	leave  
 53b:	c3                   	ret    

0000053c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	57                   	push   %edi
 540:	56                   	push   %esi
 541:	53                   	push   %ebx
 542:	83 ec 2c             	sub    $0x2c,%esp
 545:	89 45 d0             	mov    %eax,-0x30(%ebp)
 548:	89 d0                	mov    %edx,%eax
 54a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 54c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 550:	0f 95 c1             	setne  %cl
 553:	c1 ea 1f             	shr    $0x1f,%edx
 556:	84 d1                	test   %dl,%cl
 558:	74 44                	je     59e <printint+0x62>
    neg = 1;
    x = -xx;
 55a:	f7 d8                	neg    %eax
 55c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 55e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 565:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 56a:	89 c8                	mov    %ecx,%eax
 56c:	ba 00 00 00 00       	mov    $0x0,%edx
 571:	f7 f6                	div    %esi
 573:	89 df                	mov    %ebx,%edi
 575:	83 c3 01             	add    $0x1,%ebx
 578:	0f b6 92 90 09 00 00 	movzbl 0x990(%edx),%edx
 57f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 583:	89 ca                	mov    %ecx,%edx
 585:	89 c1                	mov    %eax,%ecx
 587:	39 d6                	cmp    %edx,%esi
 589:	76 df                	jbe    56a <printint+0x2e>
  if(neg)
 58b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 58f:	74 31                	je     5c2 <printint+0x86>
    buf[i++] = '-';
 591:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 596:	8d 5f 02             	lea    0x2(%edi),%ebx
 599:	8b 75 d0             	mov    -0x30(%ebp),%esi
 59c:	eb 17                	jmp    5b5 <printint+0x79>
    x = xx;
 59e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5a0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5a7:	eb bc                	jmp    565 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5a9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5ae:	89 f0                	mov    %esi,%eax
 5b0:	e8 6d ff ff ff       	call   522 <putc>
  while(--i >= 0)
 5b5:	83 eb 01             	sub    $0x1,%ebx
 5b8:	79 ef                	jns    5a9 <printint+0x6d>
}
 5ba:	83 c4 2c             	add    $0x2c,%esp
 5bd:	5b                   	pop    %ebx
 5be:	5e                   	pop    %esi
 5bf:	5f                   	pop    %edi
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    
 5c2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5c5:	eb ee                	jmp    5b5 <printint+0x79>

000005c7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c7:	55                   	push   %ebp
 5c8:	89 e5                	mov    %esp,%ebp
 5ca:	57                   	push   %edi
 5cb:	56                   	push   %esi
 5cc:	53                   	push   %ebx
 5cd:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5d0:	8d 45 10             	lea    0x10(%ebp),%eax
 5d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5d6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5db:	bb 00 00 00 00       	mov    $0x0,%ebx
 5e0:	eb 14                	jmp    5f6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5e2:	89 fa                	mov    %edi,%edx
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	e8 36 ff ff ff       	call   522 <putc>
 5ec:	eb 05                	jmp    5f3 <printf+0x2c>
      }
    } else if(state == '%'){
 5ee:	83 fe 25             	cmp    $0x25,%esi
 5f1:	74 25                	je     618 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5f3:	83 c3 01             	add    $0x1,%ebx
 5f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5fd:	84 c0                	test   %al,%al
 5ff:	0f 84 20 01 00 00    	je     725 <printf+0x15e>
    c = fmt[i] & 0xff;
 605:	0f be f8             	movsbl %al,%edi
 608:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 60b:	85 f6                	test   %esi,%esi
 60d:	75 df                	jne    5ee <printf+0x27>
      if(c == '%'){
 60f:	83 f8 25             	cmp    $0x25,%eax
 612:	75 ce                	jne    5e2 <printf+0x1b>
        state = '%';
 614:	89 c6                	mov    %eax,%esi
 616:	eb db                	jmp    5f3 <printf+0x2c>
      if(c == 'd'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	0f 84 cf 00 00 00    	je     6f0 <printf+0x129>
 621:	0f 8c dd 00 00 00    	jl     704 <printf+0x13d>
 627:	83 f8 78             	cmp    $0x78,%eax
 62a:	0f 8f d4 00 00 00    	jg     704 <printf+0x13d>
 630:	83 f8 63             	cmp    $0x63,%eax
 633:	0f 8c cb 00 00 00    	jl     704 <printf+0x13d>
 639:	83 e8 63             	sub    $0x63,%eax
 63c:	83 f8 15             	cmp    $0x15,%eax
 63f:	0f 87 bf 00 00 00    	ja     704 <printf+0x13d>
 645:	ff 24 85 38 09 00 00 	jmp    *0x938(,%eax,4)
        printint(fd, *ap, 10, 1);
 64c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 64f:	8b 17                	mov    (%edi),%edx
 651:	83 ec 0c             	sub    $0xc,%esp
 654:	6a 01                	push   $0x1
 656:	b9 0a 00 00 00       	mov    $0xa,%ecx
 65b:	8b 45 08             	mov    0x8(%ebp),%eax
 65e:	e8 d9 fe ff ff       	call   53c <printint>
        ap++;
 663:	83 c7 04             	add    $0x4,%edi
 666:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 669:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 66c:	be 00 00 00 00       	mov    $0x0,%esi
 671:	eb 80                	jmp    5f3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 673:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 676:	8b 17                	mov    (%edi),%edx
 678:	83 ec 0c             	sub    $0xc,%esp
 67b:	6a 00                	push   $0x0
 67d:	b9 10 00 00 00       	mov    $0x10,%ecx
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	e8 b2 fe ff ff       	call   53c <printint>
        ap++;
 68a:	83 c7 04             	add    $0x4,%edi
 68d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 690:	83 c4 10             	add    $0x10,%esp
      state = 0;
 693:	be 00 00 00 00       	mov    $0x0,%esi
 698:	e9 56 ff ff ff       	jmp    5f3 <printf+0x2c>
        s = (char*)*ap;
 69d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a0:	8b 30                	mov    (%eax),%esi
        ap++;
 6a2:	83 c0 04             	add    $0x4,%eax
 6a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6a8:	85 f6                	test   %esi,%esi
 6aa:	75 15                	jne    6c1 <printf+0xfa>
          s = "(null)";
 6ac:	be 30 09 00 00       	mov    $0x930,%esi
 6b1:	eb 0e                	jmp    6c1 <printf+0xfa>
          putc(fd, *s);
 6b3:	0f be d2             	movsbl %dl,%edx
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	e8 64 fe ff ff       	call   522 <putc>
          s++;
 6be:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6c1:	0f b6 16             	movzbl (%esi),%edx
 6c4:	84 d2                	test   %dl,%dl
 6c6:	75 eb                	jne    6b3 <printf+0xec>
      state = 0;
 6c8:	be 00 00 00 00       	mov    $0x0,%esi
 6cd:	e9 21 ff ff ff       	jmp    5f3 <printf+0x2c>
        putc(fd, *ap);
 6d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d5:	0f be 17             	movsbl (%edi),%edx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	e8 42 fe ff ff       	call   522 <putc>
        ap++;
 6e0:	83 c7 04             	add    $0x4,%edi
 6e3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6e6:	be 00 00 00 00       	mov    $0x0,%esi
 6eb:	e9 03 ff ff ff       	jmp    5f3 <printf+0x2c>
        putc(fd, c);
 6f0:	89 fa                	mov    %edi,%edx
 6f2:	8b 45 08             	mov    0x8(%ebp),%eax
 6f5:	e8 28 fe ff ff       	call   522 <putc>
      state = 0;
 6fa:	be 00 00 00 00       	mov    $0x0,%esi
 6ff:	e9 ef fe ff ff       	jmp    5f3 <printf+0x2c>
        putc(fd, '%');
 704:	ba 25 00 00 00       	mov    $0x25,%edx
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	e8 11 fe ff ff       	call   522 <putc>
        putc(fd, c);
 711:	89 fa                	mov    %edi,%edx
 713:	8b 45 08             	mov    0x8(%ebp),%eax
 716:	e8 07 fe ff ff       	call   522 <putc>
      state = 0;
 71b:	be 00 00 00 00       	mov    $0x0,%esi
 720:	e9 ce fe ff ff       	jmp    5f3 <printf+0x2c>
    }
  }
}
 725:	8d 65 f4             	lea    -0xc(%ebp),%esp
 728:	5b                   	pop    %ebx
 729:	5e                   	pop    %esi
 72a:	5f                   	pop    %edi
 72b:	5d                   	pop    %ebp
 72c:	c3                   	ret    

0000072d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72d:	55                   	push   %ebp
 72e:	89 e5                	mov    %esp,%ebp
 730:	57                   	push   %edi
 731:	56                   	push   %esi
 732:	53                   	push   %ebx
 733:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 736:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 739:	a1 24 0d 00 00       	mov    0xd24,%eax
 73e:	eb 02                	jmp    742 <free+0x15>
 740:	89 d0                	mov    %edx,%eax
 742:	39 c8                	cmp    %ecx,%eax
 744:	73 04                	jae    74a <free+0x1d>
 746:	39 08                	cmp    %ecx,(%eax)
 748:	77 12                	ja     75c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74a:	8b 10                	mov    (%eax),%edx
 74c:	39 c2                	cmp    %eax,%edx
 74e:	77 f0                	ja     740 <free+0x13>
 750:	39 c8                	cmp    %ecx,%eax
 752:	72 08                	jb     75c <free+0x2f>
 754:	39 ca                	cmp    %ecx,%edx
 756:	77 04                	ja     75c <free+0x2f>
 758:	89 d0                	mov    %edx,%eax
 75a:	eb e6                	jmp    742 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 75c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 75f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 762:	8b 10                	mov    (%eax),%edx
 764:	39 d7                	cmp    %edx,%edi
 766:	74 19                	je     781 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 768:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 76b:	8b 50 04             	mov    0x4(%eax),%edx
 76e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 771:	39 ce                	cmp    %ecx,%esi
 773:	74 1b                	je     790 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 775:	89 08                	mov    %ecx,(%eax)
  freep = p;
 777:	a3 24 0d 00 00       	mov    %eax,0xd24
}
 77c:	5b                   	pop    %ebx
 77d:	5e                   	pop    %esi
 77e:	5f                   	pop    %edi
 77f:	5d                   	pop    %ebp
 780:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 781:	03 72 04             	add    0x4(%edx),%esi
 784:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 787:	8b 10                	mov    (%eax),%edx
 789:	8b 12                	mov    (%edx),%edx
 78b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 78e:	eb db                	jmp    76b <free+0x3e>
    p->s.size += bp->s.size;
 790:	03 53 fc             	add    -0x4(%ebx),%edx
 793:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 796:	8b 53 f8             	mov    -0x8(%ebx),%edx
 799:	89 10                	mov    %edx,(%eax)
 79b:	eb da                	jmp    777 <free+0x4a>

0000079d <morecore>:

static Header*
morecore(uint nu)
{
 79d:	55                   	push   %ebp
 79e:	89 e5                	mov    %esp,%ebp
 7a0:	53                   	push   %ebx
 7a1:	83 ec 04             	sub    $0x4,%esp
 7a4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7a6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7ab:	77 05                	ja     7b2 <morecore+0x15>
    nu = 4096;
 7ad:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7b2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7b9:	83 ec 0c             	sub    $0xc,%esp
 7bc:	50                   	push   %eax
 7bd:	e8 38 fd ff ff       	call   4fa <sbrk>
  if(p == (char*)-1)
 7c2:	83 c4 10             	add    $0x10,%esp
 7c5:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c8:	74 1c                	je     7e6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7ca:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7cd:	83 c0 08             	add    $0x8,%eax
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	50                   	push   %eax
 7d4:	e8 54 ff ff ff       	call   72d <free>
  return freep;
 7d9:	a1 24 0d 00 00       	mov    0xd24,%eax
 7de:	83 c4 10             	add    $0x10,%esp
}
 7e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7e4:	c9                   	leave  
 7e5:	c3                   	ret    
    return 0;
 7e6:	b8 00 00 00 00       	mov    $0x0,%eax
 7eb:	eb f4                	jmp    7e1 <morecore+0x44>

000007ed <malloc>:

void*
malloc(uint nbytes)
{
 7ed:	55                   	push   %ebp
 7ee:	89 e5                	mov    %esp,%ebp
 7f0:	53                   	push   %ebx
 7f1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	8d 58 07             	lea    0x7(%eax),%ebx
 7fa:	c1 eb 03             	shr    $0x3,%ebx
 7fd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 800:	8b 0d 24 0d 00 00    	mov    0xd24,%ecx
 806:	85 c9                	test   %ecx,%ecx
 808:	74 04                	je     80e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80a:	8b 01                	mov    (%ecx),%eax
 80c:	eb 4a                	jmp    858 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 80e:	c7 05 24 0d 00 00 28 	movl   $0xd28,0xd24
 815:	0d 00 00 
 818:	c7 05 28 0d 00 00 28 	movl   $0xd28,0xd28
 81f:	0d 00 00 
    base.s.size = 0;
 822:	c7 05 2c 0d 00 00 00 	movl   $0x0,0xd2c
 829:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 82c:	b9 28 0d 00 00       	mov    $0xd28,%ecx
 831:	eb d7                	jmp    80a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 833:	74 19                	je     84e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 835:	29 da                	sub    %ebx,%edx
 837:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 83a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 83d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 840:	89 0d 24 0d 00 00    	mov    %ecx,0xd24
      return (void*)(p + 1);
 846:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 849:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 84c:	c9                   	leave  
 84d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 84e:	8b 10                	mov    (%eax),%edx
 850:	89 11                	mov    %edx,(%ecx)
 852:	eb ec                	jmp    840 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 854:	89 c1                	mov    %eax,%ecx
 856:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 858:	8b 50 04             	mov    0x4(%eax),%edx
 85b:	39 da                	cmp    %ebx,%edx
 85d:	73 d4                	jae    833 <malloc+0x46>
    if(p == freep)
 85f:	39 05 24 0d 00 00    	cmp    %eax,0xd24
 865:	75 ed                	jne    854 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 867:	89 d8                	mov    %ebx,%eax
 869:	e8 2f ff ff ff       	call   79d <morecore>
 86e:	85 c0                	test   %eax,%eax
 870:	75 e2                	jne    854 <malloc+0x67>
 872:	eb d5                	jmp    849 <malloc+0x5c>
