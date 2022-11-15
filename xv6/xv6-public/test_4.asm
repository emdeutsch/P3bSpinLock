
_test_4:     file format elf32-i386


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
   exit();
   6:	e8 a5 04 00 00       	call   4b0 <exit>

0000000b <main>:
{
   b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   f:	83 e4 f0             	and    $0xfffffff0,%esp
  12:	ff 71 fc             	push   -0x4(%ecx)
  15:	55                   	push   %ebp
  16:	89 e5                	mov    %esp,%ebp
  18:	56                   	push   %esi
  19:	53                   	push   %ebx
  1a:	51                   	push   %ecx
  1b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  1e:	e8 0d 05 00 00       	call   530 <getpid>
  23:	a3 50 0d 00 00       	mov    %eax,0xd50
   void *stack, *p = malloc(PGSIZE * 2);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	68 00 20 00 00       	push   $0x2000
  30:	e8 f6 07 00 00       	call   82b <malloc>
   assert(p != NULL);
  35:	83 c4 10             	add    $0x10,%esp
  38:	85 c0                	test   %eax,%eax
  3a:	74 70                	je     ac <main+0xa1>
  3c:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE == 0)
  3e:	a9 ff 0f 00 00       	test   $0xfff,%eax
  43:	75 03                	jne    48 <main+0x3d>
     stack = p + 4;
  45:	8d 40 04             	lea    0x4(%eax),%eax
   assert(clone(worker, 0, 0, stack) == -1);
  48:	50                   	push   %eax
  49:	6a 00                	push   $0x0
  4b:	6a 00                	push   $0x0
  4d:	68 00 00 00 00       	push   $0x0
  52:	e8 f9 04 00 00       	call   550 <clone>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	83 f8 ff             	cmp    $0xffffffff,%eax
  5d:	0f 84 92 00 00 00    	je     f5 <main+0xea>
  63:	6a 21                	push   $0x21
  65:	68 b4 08 00 00       	push   $0x8b4
  6a:	68 bd 08 00 00       	push   $0x8bd
  6f:	6a 01                	push   $0x1
  71:	e8 8f 05 00 00       	call   605 <printf>
  76:	83 c4 0c             	add    $0xc,%esp
  79:	68 18 09 00 00       	push   $0x918
  7e:	68 cf 08 00 00       	push   $0x8cf
  83:	6a 01                	push   $0x1
  85:	e8 7b 05 00 00       	call   605 <printf>
  8a:	83 c4 08             	add    $0x8,%esp
  8d:	68 e3 08 00 00       	push   $0x8e3
  92:	6a 01                	push   $0x1
  94:	e8 6c 05 00 00       	call   605 <printf>
  99:	83 c4 04             	add    $0x4,%esp
  9c:	ff 35 50 0d 00 00    	push   0xd50
  a2:	e8 39 04 00 00       	call   4e0 <kill>
  a7:	e8 04 04 00 00       	call   4b0 <exit>
   assert(p != NULL);
  ac:	6a 1b                	push   $0x1b
  ae:	68 b4 08 00 00       	push   $0x8b4
  b3:	68 bd 08 00 00       	push   $0x8bd
  b8:	6a 01                	push   $0x1
  ba:	e8 46 05 00 00       	call   605 <printf>
  bf:	83 c4 0c             	add    $0xc,%esp
  c2:	68 c5 08 00 00       	push   $0x8c5
  c7:	68 cf 08 00 00       	push   $0x8cf
  cc:	6a 01                	push   $0x1
  ce:	e8 32 05 00 00       	call   605 <printf>
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	68 e3 08 00 00       	push   $0x8e3
  db:	6a 01                	push   $0x1
  dd:	e8 23 05 00 00       	call   605 <printf>
  e2:	83 c4 04             	add    $0x4,%esp
  e5:	ff 35 50 0d 00 00    	push   0xd50
  eb:	e8 f0 03 00 00       	call   4e0 <kill>
  f0:	e8 bb 03 00 00       	call   4b0 <exit>
   stack = sbrk(0);
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	6a 00                	push   $0x0
  fa:	e8 39 04 00 00       	call   538 <sbrk>
  ff:	89 c6                	mov    %eax,%esi
   if((uint)stack % PGSIZE)
 101:	83 c4 10             	add    $0x10,%esp
 104:	89 c2                	mov    %eax,%edx
 106:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 10c:	74 09                	je     117 <main+0x10c>
     stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 10e:	b8 00 10 00 00       	mov    $0x1000,%eax
 113:	29 d0                	sub    %edx,%eax
 115:	01 c6                	add    %eax,%esi
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	6a 00                	push   $0x0
 11c:	e8 17 04 00 00       	call   538 <sbrk>
 121:	89 c2                	mov    %eax,%edx
 123:	89 f0                	mov    %esi,%eax
 125:	29 d0                	sub    %edx,%eax
 127:	05 00 08 00 00       	add    $0x800,%eax
 12c:	89 04 24             	mov    %eax,(%esp)
 12f:	e8 04 04 00 00       	call   538 <sbrk>
   assert((uint)stack % PGSIZE == 0);
 134:	83 c4 10             	add    $0x10,%esp
 137:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
 13d:	74 49                	je     188 <main+0x17d>
 13f:	6a 27                	push   $0x27
 141:	68 b4 08 00 00       	push   $0x8b4
 146:	68 bd 08 00 00       	push   $0x8bd
 14b:	6a 01                	push   $0x1
 14d:	e8 b3 04 00 00       	call   605 <printf>
 152:	83 c4 0c             	add    $0xc,%esp
 155:	68 f0 08 00 00       	push   $0x8f0
 15a:	68 cf 08 00 00       	push   $0x8cf
 15f:	6a 01                	push   $0x1
 161:	e8 9f 04 00 00       	call   605 <printf>
 166:	83 c4 08             	add    $0x8,%esp
 169:	68 e3 08 00 00       	push   $0x8e3
 16e:	6a 01                	push   $0x1
 170:	e8 90 04 00 00       	call   605 <printf>
 175:	83 c4 04             	add    $0x4,%esp
 178:	ff 35 50 0d 00 00    	push   0xd50
 17e:	e8 5d 03 00 00       	call   4e0 <kill>
 183:	e8 28 03 00 00       	call   4b0 <exit>
   assert((uint)sbrk(0) - (uint)stack == PGSIZE/2);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	6a 00                	push   $0x0
 18d:	e8 a6 03 00 00       	call   538 <sbrk>
 192:	29 f0                	sub    %esi,%eax
 194:	83 c4 10             	add    $0x10,%esp
 197:	3d 00 08 00 00       	cmp    $0x800,%eax
 19c:	74 49                	je     1e7 <main+0x1dc>
 19e:	6a 28                	push   $0x28
 1a0:	68 b4 08 00 00       	push   $0x8b4
 1a5:	68 bd 08 00 00       	push   $0x8bd
 1aa:	6a 01                	push   $0x1
 1ac:	e8 54 04 00 00       	call   605 <printf>
 1b1:	83 c4 0c             	add    $0xc,%esp
 1b4:	68 3c 09 00 00       	push   $0x93c
 1b9:	68 cf 08 00 00       	push   $0x8cf
 1be:	6a 01                	push   $0x1
 1c0:	e8 40 04 00 00       	call   605 <printf>
 1c5:	83 c4 08             	add    $0x8,%esp
 1c8:	68 e3 08 00 00       	push   $0x8e3
 1cd:	6a 01                	push   $0x1
 1cf:	e8 31 04 00 00       	call   605 <printf>
 1d4:	83 c4 04             	add    $0x4,%esp
 1d7:	ff 35 50 0d 00 00    	push   0xd50
 1dd:	e8 fe 02 00 00       	call   4e0 <kill>
 1e2:	e8 c9 02 00 00       	call   4b0 <exit>
   assert(clone(worker, 0, 0, stack) == -1);
 1e7:	56                   	push   %esi
 1e8:	6a 00                	push   $0x0
 1ea:	6a 00                	push   $0x0
 1ec:	68 00 00 00 00       	push   $0x0
 1f1:	e8 5a 03 00 00       	call   550 <clone>
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 1fc:	74 49                	je     247 <main+0x23c>
 1fe:	6a 2a                	push   $0x2a
 200:	68 b4 08 00 00       	push   $0x8b4
 205:	68 bd 08 00 00       	push   $0x8bd
 20a:	6a 01                	push   $0x1
 20c:	e8 f4 03 00 00       	call   605 <printf>
 211:	83 c4 0c             	add    $0xc,%esp
 214:	68 18 09 00 00       	push   $0x918
 219:	68 cf 08 00 00       	push   $0x8cf
 21e:	6a 01                	push   $0x1
 220:	e8 e0 03 00 00       	call   605 <printf>
 225:	83 c4 08             	add    $0x8,%esp
 228:	68 e3 08 00 00       	push   $0x8e3
 22d:	6a 01                	push   $0x1
 22f:	e8 d1 03 00 00       	call   605 <printf>
 234:	83 c4 04             	add    $0x4,%esp
 237:	ff 35 50 0d 00 00    	push   0xd50
 23d:	e8 9e 02 00 00       	call   4e0 <kill>
 242:	e8 69 02 00 00       	call   4b0 <exit>
   printf(1, "TEST PASSED\n");
 247:	83 ec 08             	sub    $0x8,%esp
 24a:	68 0a 09 00 00       	push   $0x90a
 24f:	6a 01                	push   $0x1
 251:	e8 af 03 00 00       	call   605 <printf>
   free(p);
 256:	89 1c 24             	mov    %ebx,(%esp)
 259:	e8 0d 05 00 00       	call   76b <free>
   exit();
 25e:	e8 4d 02 00 00       	call   4b0 <exit>

00000263 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 26e:	89 f0                	mov    %esi,%eax
 270:	89 d1                	mov    %edx,%ecx
 272:	83 c2 01             	add    $0x1,%edx
 275:	89 c3                	mov    %eax,%ebx
 277:	83 c0 01             	add    $0x1,%eax
 27a:	0f b6 09             	movzbl (%ecx),%ecx
 27d:	88 0b                	mov    %cl,(%ebx)
 27f:	84 c9                	test   %cl,%cl
 281:	75 ed                	jne    270 <strcpy+0xd>
    ;
  return os;
}
 283:	89 f0                	mov    %esi,%eax
 285:	5b                   	pop    %ebx
 286:	5e                   	pop    %esi
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    

00000289 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 292:	eb 06                	jmp    29a <strcmp+0x11>
    p++, q++;
 294:	83 c1 01             	add    $0x1,%ecx
 297:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 29a:	0f b6 01             	movzbl (%ecx),%eax
 29d:	84 c0                	test   %al,%al
 29f:	74 04                	je     2a5 <strcmp+0x1c>
 2a1:	3a 02                	cmp    (%edx),%al
 2a3:	74 ef                	je     294 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2a5:	0f b6 c0             	movzbl %al,%eax
 2a8:	0f b6 12             	movzbl (%edx),%edx
 2ab:	29 d0                	sub    %edx,%eax
}
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <strlen>:

uint
strlen(const char *s)
{
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2b5:	b8 00 00 00 00       	mov    $0x0,%eax
 2ba:	eb 03                	jmp    2bf <strlen+0x10>
 2bc:	83 c0 01             	add    $0x1,%eax
 2bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2c3:	75 f7                	jne    2bc <strlen+0xd>
    ;
  return n;
}
 2c5:	5d                   	pop    %ebp
 2c6:	c3                   	ret    

000002c7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ce:	89 d7                	mov    %edx,%edi
 2d0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d6:	fc                   	cld    
 2d7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d9:	89 d0                	mov    %edx,%eax
 2db:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2de:	c9                   	leave  
 2df:	c3                   	ret    

000002e0 <strchr>:

char*
strchr(const char *s, char c)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ea:	eb 03                	jmp    2ef <strchr+0xf>
 2ec:	83 c0 01             	add    $0x1,%eax
 2ef:	0f b6 10             	movzbl (%eax),%edx
 2f2:	84 d2                	test   %dl,%dl
 2f4:	74 06                	je     2fc <strchr+0x1c>
    if(*s == c)
 2f6:	38 ca                	cmp    %cl,%dl
 2f8:	75 f2                	jne    2ec <strchr+0xc>
 2fa:	eb 05                	jmp    301 <strchr+0x21>
      return (char*)s;
  return 0;
 2fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    

00000303 <gets>:

char*
gets(char *buf, int max)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	57                   	push   %edi
 307:	56                   	push   %esi
 308:	53                   	push   %ebx
 309:	83 ec 1c             	sub    $0x1c,%esp
 30c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 30f:	bb 00 00 00 00       	mov    $0x0,%ebx
 314:	89 de                	mov    %ebx,%esi
 316:	83 c3 01             	add    $0x1,%ebx
 319:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31c:	7d 2e                	jge    34c <gets+0x49>
    cc = read(0, &c, 1);
 31e:	83 ec 04             	sub    $0x4,%esp
 321:	6a 01                	push   $0x1
 323:	8d 45 e7             	lea    -0x19(%ebp),%eax
 326:	50                   	push   %eax
 327:	6a 00                	push   $0x0
 329:	e8 9a 01 00 00       	call   4c8 <read>
    if(cc < 1)
 32e:	83 c4 10             	add    $0x10,%esp
 331:	85 c0                	test   %eax,%eax
 333:	7e 17                	jle    34c <gets+0x49>
      break;
    buf[i++] = c;
 335:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 339:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 33c:	3c 0a                	cmp    $0xa,%al
 33e:	0f 94 c2             	sete   %dl
 341:	3c 0d                	cmp    $0xd,%al
 343:	0f 94 c0             	sete   %al
 346:	08 c2                	or     %al,%dl
 348:	74 ca                	je     314 <gets+0x11>
    buf[i++] = c;
 34a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 34c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 350:	89 f8                	mov    %edi,%eax
 352:	8d 65 f4             	lea    -0xc(%ebp),%esp
 355:	5b                   	pop    %ebx
 356:	5e                   	pop    %esi
 357:	5f                   	pop    %edi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <stat>:

int
stat(const char *n, struct stat *st)
{
 35a:	55                   	push   %ebp
 35b:	89 e5                	mov    %esp,%ebp
 35d:	56                   	push   %esi
 35e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 35f:	83 ec 08             	sub    $0x8,%esp
 362:	6a 00                	push   $0x0
 364:	ff 75 08             	push   0x8(%ebp)
 367:	e8 84 01 00 00       	call   4f0 <open>
  if(fd < 0)
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	85 c0                	test   %eax,%eax
 371:	78 24                	js     397 <stat+0x3d>
 373:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 375:	83 ec 08             	sub    $0x8,%esp
 378:	ff 75 0c             	push   0xc(%ebp)
 37b:	50                   	push   %eax
 37c:	e8 87 01 00 00       	call   508 <fstat>
 381:	89 c6                	mov    %eax,%esi
  close(fd);
 383:	89 1c 24             	mov    %ebx,(%esp)
 386:	e8 4d 01 00 00       	call   4d8 <close>
  return r;
 38b:	83 c4 10             	add    $0x10,%esp
}
 38e:	89 f0                	mov    %esi,%eax
 390:	8d 65 f8             	lea    -0x8(%ebp),%esp
 393:	5b                   	pop    %ebx
 394:	5e                   	pop    %esi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    
    return -1;
 397:	be ff ff ff ff       	mov    $0xffffffff,%esi
 39c:	eb f0                	jmp    38e <stat+0x34>

0000039e <atoi>:

int
atoi(const char *s)
{
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	53                   	push   %ebx
 3a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3a5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3aa:	eb 10                	jmp    3bc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3b2:	83 c1 01             	add    $0x1,%ecx
 3b5:	0f be c0             	movsbl %al,%eax
 3b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3bc:	0f b6 01             	movzbl (%ecx),%eax
 3bf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c2:	80 fb 09             	cmp    $0x9,%bl
 3c5:	76 e5                	jbe    3ac <atoi+0xe>
  return n;
}
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cc:	c9                   	leave  
 3cd:	c3                   	ret    

000003ce <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	56                   	push   %esi
 3d2:	53                   	push   %ebx
 3d3:	8b 75 08             	mov    0x8(%ebp),%esi
 3d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3de:	eb 0d                	jmp    3ed <memmove+0x1f>
    *dst++ = *src++;
 3e0:	0f b6 01             	movzbl (%ecx),%eax
 3e3:	88 02                	mov    %al,(%edx)
 3e5:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3eb:	89 d8                	mov    %ebx,%eax
 3ed:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3f0:	85 c0                	test   %eax,%eax
 3f2:	7f ec                	jg     3e0 <memmove+0x12>
  return vdst;
}
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret    

000003fa <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 400:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 402:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 405:	89 08                	mov    %ecx,(%eax)
  return old;
}
 407:	89 d0                	mov    %edx,%eax
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <lock_init>:
void 
lock_init(lock_t *lock){
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
 411:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    

00000419 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	53                   	push   %ebx
 41d:	83 ec 04             	sub    $0x4,%esp
 420:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 423:	83 ec 08             	sub    $0x8,%esp
 426:	6a 01                	push   $0x1
 428:	53                   	push   %ebx
 429:	e8 cc ff ff ff       	call   3fa <TestAndSet>
 42e:	83 c4 10             	add    $0x10,%esp
 431:	83 f8 01             	cmp    $0x1,%eax
 434:	74 ed                	je     423 <lock_acquire+0xa>
    ;
}
 436:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 439:	c9                   	leave  
 43a:	c3                   	ret    

0000043b <lock_release>:
void 
lock_release(lock_t *lock){
 43b:	55                   	push   %ebp
 43c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    

00000449 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 449:	55                   	push   %ebp
 44a:	89 e5                	mov    %esp,%ebp
 44c:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 44f:	68 04 20 00 00       	push   $0x2004
 454:	e8 d2 03 00 00       	call   82b <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 459:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 45c:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 45e:	eb 03                	jmp    463 <thread_create+0x1a>
      stack += 1;
 460:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 463:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 469:	75 f5                	jne    460 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 46b:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 46d:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 470:	52                   	push   %edx
 471:	ff 75 10             	push   0x10(%ebp)
 474:	ff 75 0c             	push   0xc(%ebp)
 477:	ff 75 08             	push   0x8(%ebp)
 47a:	e8 d1 00 00 00       	call   550 <clone>
 
    return pid;
}
 47f:	c9                   	leave  
 480:	c3                   	ret    

00000481 <thread_join>:
int 
thread_join(){
 481:	55                   	push   %ebp
 482:	89 e5                	mov    %esp,%ebp
 484:	53                   	push   %ebx
 485:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 488:	8d 45 f4             	lea    -0xc(%ebp),%eax
 48b:	50                   	push   %eax
 48c:	e8 c7 00 00 00       	call   558 <join>
 491:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 493:	83 c4 04             	add    $0x4,%esp
 496:	8b 45 f4             	mov    -0xc(%ebp),%eax
 499:	ff 70 fc             	push   -0x4(%eax)
 49c:	e8 ca 02 00 00       	call   76b <free>
  return waitedForPID;
 4a1:	89 d8                	mov    %ebx,%eax
 4a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a6:	c9                   	leave  
 4a7:	c3                   	ret    

000004a8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a8:	b8 01 00 00 00       	mov    $0x1,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <exit>:
SYSCALL(exit)
 4b0:	b8 02 00 00 00       	mov    $0x2,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <wait>:
SYSCALL(wait)
 4b8:	b8 03 00 00 00       	mov    $0x3,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <pipe>:
SYSCALL(pipe)
 4c0:	b8 04 00 00 00       	mov    $0x4,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <read>:
SYSCALL(read)
 4c8:	b8 05 00 00 00       	mov    $0x5,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <write>:
SYSCALL(write)
 4d0:	b8 10 00 00 00       	mov    $0x10,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <close>:
SYSCALL(close)
 4d8:	b8 15 00 00 00       	mov    $0x15,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <kill>:
SYSCALL(kill)
 4e0:	b8 06 00 00 00       	mov    $0x6,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <exec>:
SYSCALL(exec)
 4e8:	b8 07 00 00 00       	mov    $0x7,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <open>:
SYSCALL(open)
 4f0:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <mknod>:
SYSCALL(mknod)
 4f8:	b8 11 00 00 00       	mov    $0x11,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <unlink>:
SYSCALL(unlink)
 500:	b8 12 00 00 00       	mov    $0x12,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <fstat>:
SYSCALL(fstat)
 508:	b8 08 00 00 00       	mov    $0x8,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <link>:
SYSCALL(link)
 510:	b8 13 00 00 00       	mov    $0x13,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <mkdir>:
SYSCALL(mkdir)
 518:	b8 14 00 00 00       	mov    $0x14,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <chdir>:
SYSCALL(chdir)
 520:	b8 09 00 00 00       	mov    $0x9,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <dup>:
SYSCALL(dup)
 528:	b8 0a 00 00 00       	mov    $0xa,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <getpid>:
SYSCALL(getpid)
 530:	b8 0b 00 00 00       	mov    $0xb,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <sbrk>:
SYSCALL(sbrk)
 538:	b8 0c 00 00 00       	mov    $0xc,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <sleep>:
SYSCALL(sleep)
 540:	b8 0d 00 00 00       	mov    $0xd,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <uptime>:
SYSCALL(uptime)
 548:	b8 0e 00 00 00       	mov    $0xe,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <clone>:
SYSCALL(clone)
 550:	b8 16 00 00 00       	mov    $0x16,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <join>:
SYSCALL(join)
 558:	b8 17 00 00 00       	mov    $0x17,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	83 ec 1c             	sub    $0x1c,%esp
 566:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 569:	6a 01                	push   $0x1
 56b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 56e:	52                   	push   %edx
 56f:	50                   	push   %eax
 570:	e8 5b ff ff ff       	call   4d0 <write>
}
 575:	83 c4 10             	add    $0x10,%esp
 578:	c9                   	leave  
 579:	c3                   	ret    

0000057a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 57a:	55                   	push   %ebp
 57b:	89 e5                	mov    %esp,%ebp
 57d:	57                   	push   %edi
 57e:	56                   	push   %esi
 57f:	53                   	push   %ebx
 580:	83 ec 2c             	sub    $0x2c,%esp
 583:	89 45 d0             	mov    %eax,-0x30(%ebp)
 586:	89 d0                	mov    %edx,%eax
 588:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 58a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 58e:	0f 95 c1             	setne  %cl
 591:	c1 ea 1f             	shr    $0x1f,%edx
 594:	84 d1                	test   %dl,%cl
 596:	74 44                	je     5dc <printint+0x62>
    neg = 1;
    x = -xx;
 598:	f7 d8                	neg    %eax
 59a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 59c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5a3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5a8:	89 c8                	mov    %ecx,%eax
 5aa:	ba 00 00 00 00       	mov    $0x0,%edx
 5af:	f7 f6                	div    %esi
 5b1:	89 df                	mov    %ebx,%edi
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	0f b6 92 c4 09 00 00 	movzbl 0x9c4(%edx),%edx
 5bd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5c1:	89 ca                	mov    %ecx,%edx
 5c3:	89 c1                	mov    %eax,%ecx
 5c5:	39 d6                	cmp    %edx,%esi
 5c7:	76 df                	jbe    5a8 <printint+0x2e>
  if(neg)
 5c9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5cd:	74 31                	je     600 <printint+0x86>
    buf[i++] = '-';
 5cf:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5d4:	8d 5f 02             	lea    0x2(%edi),%ebx
 5d7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5da:	eb 17                	jmp    5f3 <printint+0x79>
    x = xx;
 5dc:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5de:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5e5:	eb bc                	jmp    5a3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5e7:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5ec:	89 f0                	mov    %esi,%eax
 5ee:	e8 6d ff ff ff       	call   560 <putc>
  while(--i >= 0)
 5f3:	83 eb 01             	sub    $0x1,%ebx
 5f6:	79 ef                	jns    5e7 <printint+0x6d>
}
 5f8:	83 c4 2c             	add    $0x2c,%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    
 600:	8b 75 d0             	mov    -0x30(%ebp),%esi
 603:	eb ee                	jmp    5f3 <printint+0x79>

00000605 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 60e:	8d 45 10             	lea    0x10(%ebp),%eax
 611:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 614:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 619:	bb 00 00 00 00       	mov    $0x0,%ebx
 61e:	eb 14                	jmp    634 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 620:	89 fa                	mov    %edi,%edx
 622:	8b 45 08             	mov    0x8(%ebp),%eax
 625:	e8 36 ff ff ff       	call   560 <putc>
 62a:	eb 05                	jmp    631 <printf+0x2c>
      }
    } else if(state == '%'){
 62c:	83 fe 25             	cmp    $0x25,%esi
 62f:	74 25                	je     656 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 631:	83 c3 01             	add    $0x1,%ebx
 634:	8b 45 0c             	mov    0xc(%ebp),%eax
 637:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 63b:	84 c0                	test   %al,%al
 63d:	0f 84 20 01 00 00    	je     763 <printf+0x15e>
    c = fmt[i] & 0xff;
 643:	0f be f8             	movsbl %al,%edi
 646:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 649:	85 f6                	test   %esi,%esi
 64b:	75 df                	jne    62c <printf+0x27>
      if(c == '%'){
 64d:	83 f8 25             	cmp    $0x25,%eax
 650:	75 ce                	jne    620 <printf+0x1b>
        state = '%';
 652:	89 c6                	mov    %eax,%esi
 654:	eb db                	jmp    631 <printf+0x2c>
      if(c == 'd'){
 656:	83 f8 25             	cmp    $0x25,%eax
 659:	0f 84 cf 00 00 00    	je     72e <printf+0x129>
 65f:	0f 8c dd 00 00 00    	jl     742 <printf+0x13d>
 665:	83 f8 78             	cmp    $0x78,%eax
 668:	0f 8f d4 00 00 00    	jg     742 <printf+0x13d>
 66e:	83 f8 63             	cmp    $0x63,%eax
 671:	0f 8c cb 00 00 00    	jl     742 <printf+0x13d>
 677:	83 e8 63             	sub    $0x63,%eax
 67a:	83 f8 15             	cmp    $0x15,%eax
 67d:	0f 87 bf 00 00 00    	ja     742 <printf+0x13d>
 683:	ff 24 85 6c 09 00 00 	jmp    *0x96c(,%eax,4)
        printint(fd, *ap, 10, 1);
 68a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68d:	8b 17                	mov    (%edi),%edx
 68f:	83 ec 0c             	sub    $0xc,%esp
 692:	6a 01                	push   $0x1
 694:	b9 0a 00 00 00       	mov    $0xa,%ecx
 699:	8b 45 08             	mov    0x8(%ebp),%eax
 69c:	e8 d9 fe ff ff       	call   57a <printint>
        ap++;
 6a1:	83 c7 04             	add    $0x4,%edi
 6a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6aa:	be 00 00 00 00       	mov    $0x0,%esi
 6af:	eb 80                	jmp    631 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b4:	8b 17                	mov    (%edi),%edx
 6b6:	83 ec 0c             	sub    $0xc,%esp
 6b9:	6a 00                	push   $0x0
 6bb:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	e8 b2 fe ff ff       	call   57a <printint>
        ap++;
 6c8:	83 c7 04             	add    $0x4,%edi
 6cb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ce:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d1:	be 00 00 00 00       	mov    $0x0,%esi
 6d6:	e9 56 ff ff ff       	jmp    631 <printf+0x2c>
        s = (char*)*ap;
 6db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6de:	8b 30                	mov    (%eax),%esi
        ap++;
 6e0:	83 c0 04             	add    $0x4,%eax
 6e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6e6:	85 f6                	test   %esi,%esi
 6e8:	75 15                	jne    6ff <printf+0xfa>
          s = "(null)";
 6ea:	be 64 09 00 00       	mov    $0x964,%esi
 6ef:	eb 0e                	jmp    6ff <printf+0xfa>
          putc(fd, *s);
 6f1:	0f be d2             	movsbl %dl,%edx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	e8 64 fe ff ff       	call   560 <putc>
          s++;
 6fc:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6ff:	0f b6 16             	movzbl (%esi),%edx
 702:	84 d2                	test   %dl,%dl
 704:	75 eb                	jne    6f1 <printf+0xec>
      state = 0;
 706:	be 00 00 00 00       	mov    $0x0,%esi
 70b:	e9 21 ff ff ff       	jmp    631 <printf+0x2c>
        putc(fd, *ap);
 710:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 713:	0f be 17             	movsbl (%edi),%edx
 716:	8b 45 08             	mov    0x8(%ebp),%eax
 719:	e8 42 fe ff ff       	call   560 <putc>
        ap++;
 71e:	83 c7 04             	add    $0x4,%edi
 721:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 724:	be 00 00 00 00       	mov    $0x0,%esi
 729:	e9 03 ff ff ff       	jmp    631 <printf+0x2c>
        putc(fd, c);
 72e:	89 fa                	mov    %edi,%edx
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	e8 28 fe ff ff       	call   560 <putc>
      state = 0;
 738:	be 00 00 00 00       	mov    $0x0,%esi
 73d:	e9 ef fe ff ff       	jmp    631 <printf+0x2c>
        putc(fd, '%');
 742:	ba 25 00 00 00       	mov    $0x25,%edx
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	e8 11 fe ff ff       	call   560 <putc>
        putc(fd, c);
 74f:	89 fa                	mov    %edi,%edx
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	e8 07 fe ff ff       	call   560 <putc>
      state = 0;
 759:	be 00 00 00 00       	mov    $0x0,%esi
 75e:	e9 ce fe ff ff       	jmp    631 <printf+0x2c>
    }
  }
}
 763:	8d 65 f4             	lea    -0xc(%ebp),%esp
 766:	5b                   	pop    %ebx
 767:	5e                   	pop    %esi
 768:	5f                   	pop    %edi
 769:	5d                   	pop    %ebp
 76a:	c3                   	ret    

0000076b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 76b:	55                   	push   %ebp
 76c:	89 e5                	mov    %esp,%ebp
 76e:	57                   	push   %edi
 76f:	56                   	push   %esi
 770:	53                   	push   %ebx
 771:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 774:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 777:	a1 54 0d 00 00       	mov    0xd54,%eax
 77c:	eb 02                	jmp    780 <free+0x15>
 77e:	89 d0                	mov    %edx,%eax
 780:	39 c8                	cmp    %ecx,%eax
 782:	73 04                	jae    788 <free+0x1d>
 784:	39 08                	cmp    %ecx,(%eax)
 786:	77 12                	ja     79a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	8b 10                	mov    (%eax),%edx
 78a:	39 c2                	cmp    %eax,%edx
 78c:	77 f0                	ja     77e <free+0x13>
 78e:	39 c8                	cmp    %ecx,%eax
 790:	72 08                	jb     79a <free+0x2f>
 792:	39 ca                	cmp    %ecx,%edx
 794:	77 04                	ja     79a <free+0x2f>
 796:	89 d0                	mov    %edx,%eax
 798:	eb e6                	jmp    780 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 79a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7a0:	8b 10                	mov    (%eax),%edx
 7a2:	39 d7                	cmp    %edx,%edi
 7a4:	74 19                	je     7bf <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a9:	8b 50 04             	mov    0x4(%eax),%edx
 7ac:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7af:	39 ce                	cmp    %ecx,%esi
 7b1:	74 1b                	je     7ce <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7b3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7b5:	a3 54 0d 00 00       	mov    %eax,0xd54
}
 7ba:	5b                   	pop    %ebx
 7bb:	5e                   	pop    %esi
 7bc:	5f                   	pop    %edi
 7bd:	5d                   	pop    %ebp
 7be:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7bf:	03 72 04             	add    0x4(%edx),%esi
 7c2:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c5:	8b 10                	mov    (%eax),%edx
 7c7:	8b 12                	mov    (%edx),%edx
 7c9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7cc:	eb db                	jmp    7a9 <free+0x3e>
    p->s.size += bp->s.size;
 7ce:	03 53 fc             	add    -0x4(%ebx),%edx
 7d1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7d7:	89 10                	mov    %edx,(%eax)
 7d9:	eb da                	jmp    7b5 <free+0x4a>

000007db <morecore>:

static Header*
morecore(uint nu)
{
 7db:	55                   	push   %ebp
 7dc:	89 e5                	mov    %esp,%ebp
 7de:	53                   	push   %ebx
 7df:	83 ec 04             	sub    $0x4,%esp
 7e2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7e4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7e9:	77 05                	ja     7f0 <morecore+0x15>
    nu = 4096;
 7eb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7f0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7f7:	83 ec 0c             	sub    $0xc,%esp
 7fa:	50                   	push   %eax
 7fb:	e8 38 fd ff ff       	call   538 <sbrk>
  if(p == (char*)-1)
 800:	83 c4 10             	add    $0x10,%esp
 803:	83 f8 ff             	cmp    $0xffffffff,%eax
 806:	74 1c                	je     824 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 808:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 80b:	83 c0 08             	add    $0x8,%eax
 80e:	83 ec 0c             	sub    $0xc,%esp
 811:	50                   	push   %eax
 812:	e8 54 ff ff ff       	call   76b <free>
  return freep;
 817:	a1 54 0d 00 00       	mov    0xd54,%eax
 81c:	83 c4 10             	add    $0x10,%esp
}
 81f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 822:	c9                   	leave  
 823:	c3                   	ret    
    return 0;
 824:	b8 00 00 00 00       	mov    $0x0,%eax
 829:	eb f4                	jmp    81f <morecore+0x44>

0000082b <malloc>:

void*
malloc(uint nbytes)
{
 82b:	55                   	push   %ebp
 82c:	89 e5                	mov    %esp,%ebp
 82e:	53                   	push   %ebx
 82f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	8d 58 07             	lea    0x7(%eax),%ebx
 838:	c1 eb 03             	shr    $0x3,%ebx
 83b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 83e:	8b 0d 54 0d 00 00    	mov    0xd54,%ecx
 844:	85 c9                	test   %ecx,%ecx
 846:	74 04                	je     84c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 01                	mov    (%ecx),%eax
 84a:	eb 4a                	jmp    896 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 84c:	c7 05 54 0d 00 00 58 	movl   $0xd58,0xd54
 853:	0d 00 00 
 856:	c7 05 58 0d 00 00 58 	movl   $0xd58,0xd58
 85d:	0d 00 00 
    base.s.size = 0;
 860:	c7 05 5c 0d 00 00 00 	movl   $0x0,0xd5c
 867:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 86a:	b9 58 0d 00 00       	mov    $0xd58,%ecx
 86f:	eb d7                	jmp    848 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 871:	74 19                	je     88c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 873:	29 da                	sub    %ebx,%edx
 875:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 878:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 87b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 87e:	89 0d 54 0d 00 00    	mov    %ecx,0xd54
      return (void*)(p + 1);
 884:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 887:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 88a:	c9                   	leave  
 88b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 88c:	8b 10                	mov    (%eax),%edx
 88e:	89 11                	mov    %edx,(%ecx)
 890:	eb ec                	jmp    87e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 892:	89 c1                	mov    %eax,%ecx
 894:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 896:	8b 50 04             	mov    0x4(%eax),%edx
 899:	39 da                	cmp    %ebx,%edx
 89b:	73 d4                	jae    871 <malloc+0x46>
    if(p == freep)
 89d:	39 05 54 0d 00 00    	cmp    %eax,0xd54
 8a3:	75 ed                	jne    892 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8a5:	89 d8                	mov    %ebx,%eax
 8a7:	e8 2f ff ff ff       	call   7db <morecore>
 8ac:	85 c0                	test   %eax,%eax
 8ae:	75 e2                	jne    892 <malloc+0x67>
 8b0:	eb d5                	jmp    887 <malloc+0x5c>
