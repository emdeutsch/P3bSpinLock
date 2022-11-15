
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
   6:	a1 20 0d 00 00       	mov    0xd20,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 78 08 00 00       	push   $0x878
  17:	68 82 08 00 00       	push   $0x882
  1c:	6a 01                	push   $0x1
  1e:	e8 a5 05 00 00       	call   5c8 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 8a 08 00 00       	push   $0x88a
  2b:	68 96 08 00 00       	push   $0x896
  30:	6a 01                	push   $0x1
  32:	e8 91 05 00 00       	call   5c8 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 aa 08 00 00       	push   $0x8aa
  3f:	6a 01                	push   $0x1
  41:	e8 82 05 00 00       	call   5c8 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 24 0d 00 00    	push   0xd24
  4f:	e8 4f 04 00 00       	call   4a3 <kill>
  54:	e8 1a 04 00 00       	call   473 <exit>
   global += 4;
  59:	a1 20 0d 00 00       	mov    0xd20,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 20 0d 00 00       	mov    %eax,0xd20
   exit();
  66:	e8 08 04 00 00       	call   473 <exit>

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
  7e:	e8 70 04 00 00       	call   4f3 <getpid>
  83:	a3 24 0d 00 00       	mov    %eax,0xd24
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 20 0d 00 00 01 	movl   $0x1,0xd20
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
  ba:	e8 85 03 00 00       	call   444 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 20 0d 00 00       	mov    0xd20,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 20 04 00 00       	call   4fb <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 78 08 00 00       	push   $0x878
  f5:	68 82 08 00 00       	push   $0x882
  fa:	6a 01                	push   $0x1
  fc:	e8 c7 04 00 00       	call   5c8 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 b7 08 00 00       	push   $0x8b7
 109:	68 96 08 00 00       	push   $0x896
 10e:	6a 01                	push   $0x1
 110:	e8 b3 04 00 00       	call   5c8 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 aa 08 00 00       	push   $0x8aa
 11d:	6a 01                	push   $0x1
 11f:	e8 a4 04 00 00       	call   5c8 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 24 0d 00 00    	push   0xd24
 12d:	e8 71 03 00 00       	call   4a3 <kill>
 132:	e8 3c 03 00 00       	call   473 <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 78 08 00 00       	push   $0x878
 13e:	68 82 08 00 00       	push   $0x882
 143:	6a 01                	push   $0x1
 145:	e8 7e 04 00 00       	call   5c8 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 c6 08 00 00       	push   $0x8c6
 152:	68 96 08 00 00       	push   $0x896
 157:	6a 01                	push   $0x1
 159:	e8 6a 04 00 00       	call   5c8 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 aa 08 00 00       	push   $0x8aa
 166:	6a 01                	push   $0x1
 168:	e8 5b 04 00 00       	call   5c8 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 24 0d 00 00    	push   0xd24
 176:	e8 28 03 00 00       	call   4a3 <kill>
 17b:	e8 f3 02 00 00       	call   473 <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 78 08 00 00       	push   $0x878
 187:	68 82 08 00 00       	push   $0x882
 18c:	6a 01                	push   $0x1
 18e:	e8 35 04 00 00       	call   5c8 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 dd 08 00 00       	push   $0x8dd
 19b:	68 96 08 00 00       	push   $0x896
 1a0:	6a 01                	push   $0x1
 1a2:	e8 21 04 00 00       	call   5c8 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 aa 08 00 00       	push   $0x8aa
 1af:	6a 01                	push   $0x1
 1b1:	e8 12 04 00 00       	call   5c8 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 24 0d 00 00    	push   0xd24
 1bf:	e8 df 02 00 00       	call   4a3 <kill>
 1c4:	e8 aa 02 00 00       	call   473 <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 78 08 00 00       	push   $0x878
 1d0:	68 82 08 00 00       	push   $0x882
 1d5:	6a 01                	push   $0x1
 1d7:	e8 ec 03 00 00       	call   5c8 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 f8 08 00 00       	push   $0x8f8
 1e4:	68 96 08 00 00       	push   $0x896
 1e9:	6a 01                	push   $0x1
 1eb:	e8 d8 03 00 00       	call   5c8 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 aa 08 00 00       	push   $0x8aa
 1f8:	6a 01                	push   $0x1
 1fa:	e8 c9 03 00 00       	call   5c8 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 24 0d 00 00    	push   0xd24
 208:	e8 96 02 00 00       	call   4a3 <kill>
 20d:	e8 61 02 00 00       	call   473 <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 e9 08 00 00       	push   $0x8e9
 21a:	6a 01                	push   $0x1
 21c:	e8 a7 03 00 00       	call   5c8 <printf>
   exit();
 221:	e8 4d 02 00 00       	call   473 <exit>

00000226 <strcpy>:
#include "x86.h"
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
 2ec:	e8 9a 01 00 00       	call   48b <read>
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
 32a:	e8 84 01 00 00       	call   4b3 <open>
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
 33f:	e8 87 01 00 00       	call   4cb <fstat>
 344:	89 c6                	mov    %eax,%esi
  close(fd);
 346:	89 1c 24             	mov    %ebx,(%esp)
 349:	e8 4d 01 00 00       	call   49b <close>
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
 417:	e8 d2 03 00 00       	call   7ee <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 41c:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 41f:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 421:	eb 03                	jmp    426 <thread_create+0x1a>
      stack += 1;
 423:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 426:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 42c:	75 f5                	jne    423 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 42e:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 430:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 433:	52                   	push   %edx
 434:	ff 75 10             	push   0x10(%ebp)
 437:	ff 75 0c             	push   0xc(%ebp)
 43a:	ff 75 08             	push   0x8(%ebp)
 43d:	e8 d1 00 00 00       	call   513 <clone>
 
    return pid;
}
 442:	c9                   	leave  
 443:	c3                   	ret    

00000444 <thread_join>:
int 
thread_join(){
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	53                   	push   %ebx
 448:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 44b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 44e:	50                   	push   %eax
 44f:	e8 c7 00 00 00       	call   51b <join>
 454:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 456:	83 c4 04             	add    $0x4,%esp
 459:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45c:	ff 70 fc             	push   -0x4(%eax)
 45f:	e8 ca 02 00 00       	call   72e <free>
  return waitedForPID;
 464:	89 d8                	mov    %ebx,%eax
 466:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 469:	c9                   	leave  
 46a:	c3                   	ret    

0000046b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 46b:	b8 01 00 00 00       	mov    $0x1,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <exit>:
SYSCALL(exit)
 473:	b8 02 00 00 00       	mov    $0x2,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <wait>:
SYSCALL(wait)
 47b:	b8 03 00 00 00       	mov    $0x3,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <pipe>:
SYSCALL(pipe)
 483:	b8 04 00 00 00       	mov    $0x4,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <read>:
SYSCALL(read)
 48b:	b8 05 00 00 00       	mov    $0x5,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <write>:
SYSCALL(write)
 493:	b8 10 00 00 00       	mov    $0x10,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <close>:
SYSCALL(close)
 49b:	b8 15 00 00 00       	mov    $0x15,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <kill>:
SYSCALL(kill)
 4a3:	b8 06 00 00 00       	mov    $0x6,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <exec>:
SYSCALL(exec)
 4ab:	b8 07 00 00 00       	mov    $0x7,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <open>:
SYSCALL(open)
 4b3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <mknod>:
SYSCALL(mknod)
 4bb:	b8 11 00 00 00       	mov    $0x11,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <unlink>:
SYSCALL(unlink)
 4c3:	b8 12 00 00 00       	mov    $0x12,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <fstat>:
SYSCALL(fstat)
 4cb:	b8 08 00 00 00       	mov    $0x8,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <link>:
SYSCALL(link)
 4d3:	b8 13 00 00 00       	mov    $0x13,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <mkdir>:
SYSCALL(mkdir)
 4db:	b8 14 00 00 00       	mov    $0x14,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <chdir>:
SYSCALL(chdir)
 4e3:	b8 09 00 00 00       	mov    $0x9,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <dup>:
SYSCALL(dup)
 4eb:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <getpid>:
SYSCALL(getpid)
 4f3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <sbrk>:
SYSCALL(sbrk)
 4fb:	b8 0c 00 00 00       	mov    $0xc,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <sleep>:
SYSCALL(sleep)
 503:	b8 0d 00 00 00       	mov    $0xd,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <uptime>:
SYSCALL(uptime)
 50b:	b8 0e 00 00 00       	mov    $0xe,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <clone>:
SYSCALL(clone)
 513:	b8 16 00 00 00       	mov    $0x16,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <join>:
SYSCALL(join)
 51b:	b8 17 00 00 00       	mov    $0x17,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	83 ec 1c             	sub    $0x1c,%esp
 529:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 52c:	6a 01                	push   $0x1
 52e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 531:	52                   	push   %edx
 532:	50                   	push   %eax
 533:	e8 5b ff ff ff       	call   493 <write>
}
 538:	83 c4 10             	add    $0x10,%esp
 53b:	c9                   	leave  
 53c:	c3                   	ret    

0000053d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	57                   	push   %edi
 541:	56                   	push   %esi
 542:	53                   	push   %ebx
 543:	83 ec 2c             	sub    $0x2c,%esp
 546:	89 45 d0             	mov    %eax,-0x30(%ebp)
 549:	89 d0                	mov    %edx,%eax
 54b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 54d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 551:	0f 95 c1             	setne  %cl
 554:	c1 ea 1f             	shr    $0x1f,%edx
 557:	84 d1                	test   %dl,%cl
 559:	74 44                	je     59f <printint+0x62>
    neg = 1;
    x = -xx;
 55b:	f7 d8                	neg    %eax
 55d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 55f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 566:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 56b:	89 c8                	mov    %ecx,%eax
 56d:	ba 00 00 00 00       	mov    $0x0,%edx
 572:	f7 f6                	div    %esi
 574:	89 df                	mov    %ebx,%edi
 576:	83 c3 01             	add    $0x1,%ebx
 579:	0f b6 92 94 09 00 00 	movzbl 0x994(%edx),%edx
 580:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 584:	89 ca                	mov    %ecx,%edx
 586:	89 c1                	mov    %eax,%ecx
 588:	39 d6                	cmp    %edx,%esi
 58a:	76 df                	jbe    56b <printint+0x2e>
  if(neg)
 58c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 590:	74 31                	je     5c3 <printint+0x86>
    buf[i++] = '-';
 592:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 597:	8d 5f 02             	lea    0x2(%edi),%ebx
 59a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 59d:	eb 17                	jmp    5b6 <printint+0x79>
    x = xx;
 59f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5a1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5a8:	eb bc                	jmp    566 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5aa:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5af:	89 f0                	mov    %esi,%eax
 5b1:	e8 6d ff ff ff       	call   523 <putc>
  while(--i >= 0)
 5b6:	83 eb 01             	sub    $0x1,%ebx
 5b9:	79 ef                	jns    5aa <printint+0x6d>
}
 5bb:	83 c4 2c             	add    $0x2c,%esp
 5be:	5b                   	pop    %ebx
 5bf:	5e                   	pop    %esi
 5c0:	5f                   	pop    %edi
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    
 5c3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5c6:	eb ee                	jmp    5b6 <printint+0x79>

000005c8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c8:	55                   	push   %ebp
 5c9:	89 e5                	mov    %esp,%ebp
 5cb:	57                   	push   %edi
 5cc:	56                   	push   %esi
 5cd:	53                   	push   %ebx
 5ce:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5d1:	8d 45 10             	lea    0x10(%ebp),%eax
 5d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5d7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5dc:	bb 00 00 00 00       	mov    $0x0,%ebx
 5e1:	eb 14                	jmp    5f7 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5e3:	89 fa                	mov    %edi,%edx
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	e8 36 ff ff ff       	call   523 <putc>
 5ed:	eb 05                	jmp    5f4 <printf+0x2c>
      }
    } else if(state == '%'){
 5ef:	83 fe 25             	cmp    $0x25,%esi
 5f2:	74 25                	je     619 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5f4:	83 c3 01             	add    $0x1,%ebx
 5f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 5fa:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5fe:	84 c0                	test   %al,%al
 600:	0f 84 20 01 00 00    	je     726 <printf+0x15e>
    c = fmt[i] & 0xff;
 606:	0f be f8             	movsbl %al,%edi
 609:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 60c:	85 f6                	test   %esi,%esi
 60e:	75 df                	jne    5ef <printf+0x27>
      if(c == '%'){
 610:	83 f8 25             	cmp    $0x25,%eax
 613:	75 ce                	jne    5e3 <printf+0x1b>
        state = '%';
 615:	89 c6                	mov    %eax,%esi
 617:	eb db                	jmp    5f4 <printf+0x2c>
      if(c == 'd'){
 619:	83 f8 25             	cmp    $0x25,%eax
 61c:	0f 84 cf 00 00 00    	je     6f1 <printf+0x129>
 622:	0f 8c dd 00 00 00    	jl     705 <printf+0x13d>
 628:	83 f8 78             	cmp    $0x78,%eax
 62b:	0f 8f d4 00 00 00    	jg     705 <printf+0x13d>
 631:	83 f8 63             	cmp    $0x63,%eax
 634:	0f 8c cb 00 00 00    	jl     705 <printf+0x13d>
 63a:	83 e8 63             	sub    $0x63,%eax
 63d:	83 f8 15             	cmp    $0x15,%eax
 640:	0f 87 bf 00 00 00    	ja     705 <printf+0x13d>
 646:	ff 24 85 3c 09 00 00 	jmp    *0x93c(,%eax,4)
        printint(fd, *ap, 10, 1);
 64d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 650:	8b 17                	mov    (%edi),%edx
 652:	83 ec 0c             	sub    $0xc,%esp
 655:	6a 01                	push   $0x1
 657:	b9 0a 00 00 00       	mov    $0xa,%ecx
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	e8 d9 fe ff ff       	call   53d <printint>
        ap++;
 664:	83 c7 04             	add    $0x4,%edi
 667:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 66a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 66d:	be 00 00 00 00       	mov    $0x0,%esi
 672:	eb 80                	jmp    5f4 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 674:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 677:	8b 17                	mov    (%edi),%edx
 679:	83 ec 0c             	sub    $0xc,%esp
 67c:	6a 00                	push   $0x0
 67e:	b9 10 00 00 00       	mov    $0x10,%ecx
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	e8 b2 fe ff ff       	call   53d <printint>
        ap++;
 68b:	83 c7 04             	add    $0x4,%edi
 68e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 691:	83 c4 10             	add    $0x10,%esp
      state = 0;
 694:	be 00 00 00 00       	mov    $0x0,%esi
 699:	e9 56 ff ff ff       	jmp    5f4 <printf+0x2c>
        s = (char*)*ap;
 69e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a1:	8b 30                	mov    (%eax),%esi
        ap++;
 6a3:	83 c0 04             	add    $0x4,%eax
 6a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6a9:	85 f6                	test   %esi,%esi
 6ab:	75 15                	jne    6c2 <printf+0xfa>
          s = "(null)";
 6ad:	be 34 09 00 00       	mov    $0x934,%esi
 6b2:	eb 0e                	jmp    6c2 <printf+0xfa>
          putc(fd, *s);
 6b4:	0f be d2             	movsbl %dl,%edx
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	e8 64 fe ff ff       	call   523 <putc>
          s++;
 6bf:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6c2:	0f b6 16             	movzbl (%esi),%edx
 6c5:	84 d2                	test   %dl,%dl
 6c7:	75 eb                	jne    6b4 <printf+0xec>
      state = 0;
 6c9:	be 00 00 00 00       	mov    $0x0,%esi
 6ce:	e9 21 ff ff ff       	jmp    5f4 <printf+0x2c>
        putc(fd, *ap);
 6d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d6:	0f be 17             	movsbl (%edi),%edx
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	e8 42 fe ff ff       	call   523 <putc>
        ap++;
 6e1:	83 c7 04             	add    $0x4,%edi
 6e4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6e7:	be 00 00 00 00       	mov    $0x0,%esi
 6ec:	e9 03 ff ff ff       	jmp    5f4 <printf+0x2c>
        putc(fd, c);
 6f1:	89 fa                	mov    %edi,%edx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 28 fe ff ff       	call   523 <putc>
      state = 0;
 6fb:	be 00 00 00 00       	mov    $0x0,%esi
 700:	e9 ef fe ff ff       	jmp    5f4 <printf+0x2c>
        putc(fd, '%');
 705:	ba 25 00 00 00       	mov    $0x25,%edx
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	e8 11 fe ff ff       	call   523 <putc>
        putc(fd, c);
 712:	89 fa                	mov    %edi,%edx
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	e8 07 fe ff ff       	call   523 <putc>
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 ce fe ff ff       	jmp    5f4 <printf+0x2c>
    }
  }
}
 726:	8d 65 f4             	lea    -0xc(%ebp),%esp
 729:	5b                   	pop    %ebx
 72a:	5e                   	pop    %esi
 72b:	5f                   	pop    %edi
 72c:	5d                   	pop    %ebp
 72d:	c3                   	ret    

0000072e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72e:	55                   	push   %ebp
 72f:	89 e5                	mov    %esp,%ebp
 731:	57                   	push   %edi
 732:	56                   	push   %esi
 733:	53                   	push   %ebx
 734:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 737:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73a:	a1 28 0d 00 00       	mov    0xd28,%eax
 73f:	eb 02                	jmp    743 <free+0x15>
 741:	89 d0                	mov    %edx,%eax
 743:	39 c8                	cmp    %ecx,%eax
 745:	73 04                	jae    74b <free+0x1d>
 747:	39 08                	cmp    %ecx,(%eax)
 749:	77 12                	ja     75d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74b:	8b 10                	mov    (%eax),%edx
 74d:	39 c2                	cmp    %eax,%edx
 74f:	77 f0                	ja     741 <free+0x13>
 751:	39 c8                	cmp    %ecx,%eax
 753:	72 08                	jb     75d <free+0x2f>
 755:	39 ca                	cmp    %ecx,%edx
 757:	77 04                	ja     75d <free+0x2f>
 759:	89 d0                	mov    %edx,%eax
 75b:	eb e6                	jmp    743 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 75d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 760:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 763:	8b 10                	mov    (%eax),%edx
 765:	39 d7                	cmp    %edx,%edi
 767:	74 19                	je     782 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 769:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 76c:	8b 50 04             	mov    0x4(%eax),%edx
 76f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 772:	39 ce                	cmp    %ecx,%esi
 774:	74 1b                	je     791 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 776:	89 08                	mov    %ecx,(%eax)
  freep = p;
 778:	a3 28 0d 00 00       	mov    %eax,0xd28
}
 77d:	5b                   	pop    %ebx
 77e:	5e                   	pop    %esi
 77f:	5f                   	pop    %edi
 780:	5d                   	pop    %ebp
 781:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 782:	03 72 04             	add    0x4(%edx),%esi
 785:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 788:	8b 10                	mov    (%eax),%edx
 78a:	8b 12                	mov    (%edx),%edx
 78c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 78f:	eb db                	jmp    76c <free+0x3e>
    p->s.size += bp->s.size;
 791:	03 53 fc             	add    -0x4(%ebx),%edx
 794:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 797:	8b 53 f8             	mov    -0x8(%ebx),%edx
 79a:	89 10                	mov    %edx,(%eax)
 79c:	eb da                	jmp    778 <free+0x4a>

0000079e <morecore>:

static Header*
morecore(uint nu)
{
 79e:	55                   	push   %ebp
 79f:	89 e5                	mov    %esp,%ebp
 7a1:	53                   	push   %ebx
 7a2:	83 ec 04             	sub    $0x4,%esp
 7a5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7a7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7ac:	77 05                	ja     7b3 <morecore+0x15>
    nu = 4096;
 7ae:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7b3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ba:	83 ec 0c             	sub    $0xc,%esp
 7bd:	50                   	push   %eax
 7be:	e8 38 fd ff ff       	call   4fb <sbrk>
  if(p == (char*)-1)
 7c3:	83 c4 10             	add    $0x10,%esp
 7c6:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c9:	74 1c                	je     7e7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7cb:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ce:	83 c0 08             	add    $0x8,%eax
 7d1:	83 ec 0c             	sub    $0xc,%esp
 7d4:	50                   	push   %eax
 7d5:	e8 54 ff ff ff       	call   72e <free>
  return freep;
 7da:	a1 28 0d 00 00       	mov    0xd28,%eax
 7df:	83 c4 10             	add    $0x10,%esp
}
 7e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7e5:	c9                   	leave  
 7e6:	c3                   	ret    
    return 0;
 7e7:	b8 00 00 00 00       	mov    $0x0,%eax
 7ec:	eb f4                	jmp    7e2 <morecore+0x44>

000007ee <malloc>:

void*
malloc(uint nbytes)
{
 7ee:	55                   	push   %ebp
 7ef:	89 e5                	mov    %esp,%ebp
 7f1:	53                   	push   %ebx
 7f2:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	8d 58 07             	lea    0x7(%eax),%ebx
 7fb:	c1 eb 03             	shr    $0x3,%ebx
 7fe:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 801:	8b 0d 28 0d 00 00    	mov    0xd28,%ecx
 807:	85 c9                	test   %ecx,%ecx
 809:	74 04                	je     80f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80b:	8b 01                	mov    (%ecx),%eax
 80d:	eb 4a                	jmp    859 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 80f:	c7 05 28 0d 00 00 2c 	movl   $0xd2c,0xd28
 816:	0d 00 00 
 819:	c7 05 2c 0d 00 00 2c 	movl   $0xd2c,0xd2c
 820:	0d 00 00 
    base.s.size = 0;
 823:	c7 05 30 0d 00 00 00 	movl   $0x0,0xd30
 82a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 82d:	b9 2c 0d 00 00       	mov    $0xd2c,%ecx
 832:	eb d7                	jmp    80b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 834:	74 19                	je     84f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 836:	29 da                	sub    %ebx,%edx
 838:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 83b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 83e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 841:	89 0d 28 0d 00 00    	mov    %ecx,0xd28
      return (void*)(p + 1);
 847:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 84a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 84d:	c9                   	leave  
 84e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 84f:	8b 10                	mov    (%eax),%edx
 851:	89 11                	mov    %edx,(%ecx)
 853:	eb ec                	jmp    841 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 855:	89 c1                	mov    %eax,%ecx
 857:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 859:	8b 50 04             	mov    0x4(%eax),%edx
 85c:	39 da                	cmp    %ebx,%edx
 85e:	73 d4                	jae    834 <malloc+0x46>
    if(p == freep)
 860:	39 05 28 0d 00 00    	cmp    %eax,0xd28
 866:	75 ed                	jne    855 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 868:	89 d8                	mov    %ebx,%eax
 86a:	e8 2f ff ff ff       	call   79e <morecore>
 86f:	85 c0                	test   %eax,%eax
 871:	75 e2                	jne    855 <malloc+0x67>
 873:	eb d5                	jmp    84a <malloc+0x5c>
