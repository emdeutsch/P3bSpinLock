
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
   6:	e8 a4 04 00 00       	call   4af <exit>

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
  1e:	e8 0c 05 00 00       	call   52f <getpid>
  23:	a3 50 0d 00 00       	mov    %eax,0xd50
   void *stack, *p = malloc(PGSIZE * 2);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	68 00 20 00 00       	push   $0x2000
  30:	e8 f5 07 00 00       	call   82a <malloc>
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
  52:	e8 f8 04 00 00       	call   54f <clone>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	83 f8 ff             	cmp    $0xffffffff,%eax
  5d:	0f 84 92 00 00 00    	je     f5 <main+0xea>
  63:	6a 21                	push   $0x21
  65:	68 b4 08 00 00       	push   $0x8b4
  6a:	68 bd 08 00 00       	push   $0x8bd
  6f:	6a 01                	push   $0x1
  71:	e8 8e 05 00 00       	call   604 <printf>
  76:	83 c4 0c             	add    $0xc,%esp
  79:	68 18 09 00 00       	push   $0x918
  7e:	68 cf 08 00 00       	push   $0x8cf
  83:	6a 01                	push   $0x1
  85:	e8 7a 05 00 00       	call   604 <printf>
  8a:	83 c4 08             	add    $0x8,%esp
  8d:	68 e3 08 00 00       	push   $0x8e3
  92:	6a 01                	push   $0x1
  94:	e8 6b 05 00 00       	call   604 <printf>
  99:	83 c4 04             	add    $0x4,%esp
  9c:	ff 35 50 0d 00 00    	push   0xd50
  a2:	e8 38 04 00 00       	call   4df <kill>
  a7:	e8 03 04 00 00       	call   4af <exit>
   assert(p != NULL);
  ac:	6a 1b                	push   $0x1b
  ae:	68 b4 08 00 00       	push   $0x8b4
  b3:	68 bd 08 00 00       	push   $0x8bd
  b8:	6a 01                	push   $0x1
  ba:	e8 45 05 00 00       	call   604 <printf>
  bf:	83 c4 0c             	add    $0xc,%esp
  c2:	68 c5 08 00 00       	push   $0x8c5
  c7:	68 cf 08 00 00       	push   $0x8cf
  cc:	6a 01                	push   $0x1
  ce:	e8 31 05 00 00       	call   604 <printf>
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	68 e3 08 00 00       	push   $0x8e3
  db:	6a 01                	push   $0x1
  dd:	e8 22 05 00 00       	call   604 <printf>
  e2:	83 c4 04             	add    $0x4,%esp
  e5:	ff 35 50 0d 00 00    	push   0xd50
  eb:	e8 ef 03 00 00       	call   4df <kill>
  f0:	e8 ba 03 00 00       	call   4af <exit>
   stack = sbrk(0);
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	6a 00                	push   $0x0
  fa:	e8 38 04 00 00       	call   537 <sbrk>
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
 11c:	e8 16 04 00 00       	call   537 <sbrk>
 121:	89 c2                	mov    %eax,%edx
 123:	89 f0                	mov    %esi,%eax
 125:	29 d0                	sub    %edx,%eax
 127:	05 00 08 00 00       	add    $0x800,%eax
 12c:	89 04 24             	mov    %eax,(%esp)
 12f:	e8 03 04 00 00       	call   537 <sbrk>
   assert((uint)stack % PGSIZE == 0);
 134:	83 c4 10             	add    $0x10,%esp
 137:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
 13d:	74 49                	je     188 <main+0x17d>
 13f:	6a 27                	push   $0x27
 141:	68 b4 08 00 00       	push   $0x8b4
 146:	68 bd 08 00 00       	push   $0x8bd
 14b:	6a 01                	push   $0x1
 14d:	e8 b2 04 00 00       	call   604 <printf>
 152:	83 c4 0c             	add    $0xc,%esp
 155:	68 f0 08 00 00       	push   $0x8f0
 15a:	68 cf 08 00 00       	push   $0x8cf
 15f:	6a 01                	push   $0x1
 161:	e8 9e 04 00 00       	call   604 <printf>
 166:	83 c4 08             	add    $0x8,%esp
 169:	68 e3 08 00 00       	push   $0x8e3
 16e:	6a 01                	push   $0x1
 170:	e8 8f 04 00 00       	call   604 <printf>
 175:	83 c4 04             	add    $0x4,%esp
 178:	ff 35 50 0d 00 00    	push   0xd50
 17e:	e8 5c 03 00 00       	call   4df <kill>
 183:	e8 27 03 00 00       	call   4af <exit>
   assert((uint)sbrk(0) - (uint)stack == PGSIZE/2);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	6a 00                	push   $0x0
 18d:	e8 a5 03 00 00       	call   537 <sbrk>
 192:	29 f0                	sub    %esi,%eax
 194:	83 c4 10             	add    $0x10,%esp
 197:	3d 00 08 00 00       	cmp    $0x800,%eax
 19c:	74 49                	je     1e7 <main+0x1dc>
 19e:	6a 28                	push   $0x28
 1a0:	68 b4 08 00 00       	push   $0x8b4
 1a5:	68 bd 08 00 00       	push   $0x8bd
 1aa:	6a 01                	push   $0x1
 1ac:	e8 53 04 00 00       	call   604 <printf>
 1b1:	83 c4 0c             	add    $0xc,%esp
 1b4:	68 3c 09 00 00       	push   $0x93c
 1b9:	68 cf 08 00 00       	push   $0x8cf
 1be:	6a 01                	push   $0x1
 1c0:	e8 3f 04 00 00       	call   604 <printf>
 1c5:	83 c4 08             	add    $0x8,%esp
 1c8:	68 e3 08 00 00       	push   $0x8e3
 1cd:	6a 01                	push   $0x1
 1cf:	e8 30 04 00 00       	call   604 <printf>
 1d4:	83 c4 04             	add    $0x4,%esp
 1d7:	ff 35 50 0d 00 00    	push   0xd50
 1dd:	e8 fd 02 00 00       	call   4df <kill>
 1e2:	e8 c8 02 00 00       	call   4af <exit>
   assert(clone(worker, 0, 0, stack) == -1);
 1e7:	56                   	push   %esi
 1e8:	6a 00                	push   $0x0
 1ea:	6a 00                	push   $0x0
 1ec:	68 00 00 00 00       	push   $0x0
 1f1:	e8 59 03 00 00       	call   54f <clone>
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 1fc:	74 49                	je     247 <main+0x23c>
 1fe:	6a 2a                	push   $0x2a
 200:	68 b4 08 00 00       	push   $0x8b4
 205:	68 bd 08 00 00       	push   $0x8bd
 20a:	6a 01                	push   $0x1
 20c:	e8 f3 03 00 00       	call   604 <printf>
 211:	83 c4 0c             	add    $0xc,%esp
 214:	68 18 09 00 00       	push   $0x918
 219:	68 cf 08 00 00       	push   $0x8cf
 21e:	6a 01                	push   $0x1
 220:	e8 df 03 00 00       	call   604 <printf>
 225:	83 c4 08             	add    $0x8,%esp
 228:	68 e3 08 00 00       	push   $0x8e3
 22d:	6a 01                	push   $0x1
 22f:	e8 d0 03 00 00       	call   604 <printf>
 234:	83 c4 04             	add    $0x4,%esp
 237:	ff 35 50 0d 00 00    	push   0xd50
 23d:	e8 9d 02 00 00       	call   4df <kill>
 242:	e8 68 02 00 00       	call   4af <exit>
   printf(1, "TEST PASSED\n");
 247:	83 ec 08             	sub    $0x8,%esp
 24a:	68 0a 09 00 00       	push   $0x90a
 24f:	6a 01                	push   $0x1
 251:	e8 ae 03 00 00       	call   604 <printf>
   free(p);
 256:	89 1c 24             	mov    %ebx,(%esp)
 259:	e8 0c 05 00 00       	call   76a <free>
   exit();
 25e:	e8 4c 02 00 00       	call   4af <exit>

00000263 <strcpy>:
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
 329:	e8 99 01 00 00       	call   4c7 <read>
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
 367:	e8 83 01 00 00       	call   4ef <open>
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
 37c:	e8 86 01 00 00       	call   507 <fstat>
 381:	89 c6                	mov    %eax,%esi
  close(fd);
 383:	89 1c 24             	mov    %ebx,(%esp)
 386:	e8 4c 01 00 00       	call   4d7 <close>
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
 454:	e8 d1 03 00 00       	call   82a <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 459:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 45c:	83 c4 10             	add    $0x10,%esp
 45f:	eb 03                	jmp    464 <thread_create+0x1b>
      stack += 1;
 461:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 464:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 46a:	75 f5                	jne    461 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 46c:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 46f:	52                   	push   %edx
 470:	ff 75 10             	push   0x10(%ebp)
 473:	ff 75 0c             	push   0xc(%ebp)
 476:	ff 75 08             	push   0x8(%ebp)
 479:	e8 d1 00 00 00       	call   54f <clone>
 
    return pid;
}
 47e:	c9                   	leave  
 47f:	c3                   	ret    

00000480 <thread_join>:
int 
thread_join(){
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 487:	8d 45 f4             	lea    -0xc(%ebp),%eax
 48a:	50                   	push   %eax
 48b:	e8 c7 00 00 00       	call   557 <join>
 490:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 492:	83 c4 04             	add    $0x4,%esp
 495:	8b 45 f4             	mov    -0xc(%ebp),%eax
 498:	ff 70 fc             	push   -0x4(%eax)
 49b:	e8 ca 02 00 00       	call   76a <free>
  return pid;
 4a0:	89 d8                	mov    %ebx,%eax
 4a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a5:	c9                   	leave  
 4a6:	c3                   	ret    

000004a7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4a7:	b8 01 00 00 00       	mov    $0x1,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <exit>:
SYSCALL(exit)
 4af:	b8 02 00 00 00       	mov    $0x2,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <wait>:
SYSCALL(wait)
 4b7:	b8 03 00 00 00       	mov    $0x3,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <pipe>:
SYSCALL(pipe)
 4bf:	b8 04 00 00 00       	mov    $0x4,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <read>:
SYSCALL(read)
 4c7:	b8 05 00 00 00       	mov    $0x5,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <write>:
SYSCALL(write)
 4cf:	b8 10 00 00 00       	mov    $0x10,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <close>:
SYSCALL(close)
 4d7:	b8 15 00 00 00       	mov    $0x15,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <kill>:
SYSCALL(kill)
 4df:	b8 06 00 00 00       	mov    $0x6,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <exec>:
SYSCALL(exec)
 4e7:	b8 07 00 00 00       	mov    $0x7,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <open>:
SYSCALL(open)
 4ef:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <mknod>:
SYSCALL(mknod)
 4f7:	b8 11 00 00 00       	mov    $0x11,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <unlink>:
SYSCALL(unlink)
 4ff:	b8 12 00 00 00       	mov    $0x12,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <fstat>:
SYSCALL(fstat)
 507:	b8 08 00 00 00       	mov    $0x8,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <link>:
SYSCALL(link)
 50f:	b8 13 00 00 00       	mov    $0x13,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <mkdir>:
SYSCALL(mkdir)
 517:	b8 14 00 00 00       	mov    $0x14,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <chdir>:
SYSCALL(chdir)
 51f:	b8 09 00 00 00       	mov    $0x9,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <dup>:
SYSCALL(dup)
 527:	b8 0a 00 00 00       	mov    $0xa,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <getpid>:
SYSCALL(getpid)
 52f:	b8 0b 00 00 00       	mov    $0xb,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <sbrk>:
SYSCALL(sbrk)
 537:	b8 0c 00 00 00       	mov    $0xc,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <sleep>:
SYSCALL(sleep)
 53f:	b8 0d 00 00 00       	mov    $0xd,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <uptime>:
SYSCALL(uptime)
 547:	b8 0e 00 00 00       	mov    $0xe,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <clone>:
SYSCALL(clone)
 54f:	b8 16 00 00 00       	mov    $0x16,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <join>:
SYSCALL(join)
 557:	b8 17 00 00 00       	mov    $0x17,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 55f:	55                   	push   %ebp
 560:	89 e5                	mov    %esp,%ebp
 562:	83 ec 1c             	sub    $0x1c,%esp
 565:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 568:	6a 01                	push   $0x1
 56a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 56d:	52                   	push   %edx
 56e:	50                   	push   %eax
 56f:	e8 5b ff ff ff       	call   4cf <write>
}
 574:	83 c4 10             	add    $0x10,%esp
 577:	c9                   	leave  
 578:	c3                   	ret    

00000579 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	57                   	push   %edi
 57d:	56                   	push   %esi
 57e:	53                   	push   %ebx
 57f:	83 ec 2c             	sub    $0x2c,%esp
 582:	89 45 d0             	mov    %eax,-0x30(%ebp)
 585:	89 d0                	mov    %edx,%eax
 587:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 589:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 58d:	0f 95 c1             	setne  %cl
 590:	c1 ea 1f             	shr    $0x1f,%edx
 593:	84 d1                	test   %dl,%cl
 595:	74 44                	je     5db <printint+0x62>
    neg = 1;
    x = -xx;
 597:	f7 d8                	neg    %eax
 599:	89 c1                	mov    %eax,%ecx
    neg = 1;
 59b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5a2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5a7:	89 c8                	mov    %ecx,%eax
 5a9:	ba 00 00 00 00       	mov    $0x0,%edx
 5ae:	f7 f6                	div    %esi
 5b0:	89 df                	mov    %ebx,%edi
 5b2:	83 c3 01             	add    $0x1,%ebx
 5b5:	0f b6 92 c4 09 00 00 	movzbl 0x9c4(%edx),%edx
 5bc:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5c0:	89 ca                	mov    %ecx,%edx
 5c2:	89 c1                	mov    %eax,%ecx
 5c4:	39 d6                	cmp    %edx,%esi
 5c6:	76 df                	jbe    5a7 <printint+0x2e>
  if(neg)
 5c8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5cc:	74 31                	je     5ff <printint+0x86>
    buf[i++] = '-';
 5ce:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5d3:	8d 5f 02             	lea    0x2(%edi),%ebx
 5d6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5d9:	eb 17                	jmp    5f2 <printint+0x79>
    x = xx;
 5db:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5dd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5e4:	eb bc                	jmp    5a2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5e6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5eb:	89 f0                	mov    %esi,%eax
 5ed:	e8 6d ff ff ff       	call   55f <putc>
  while(--i >= 0)
 5f2:	83 eb 01             	sub    $0x1,%ebx
 5f5:	79 ef                	jns    5e6 <printint+0x6d>
}
 5f7:	83 c4 2c             	add    $0x2c,%esp
 5fa:	5b                   	pop    %ebx
 5fb:	5e                   	pop    %esi
 5fc:	5f                   	pop    %edi
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    
 5ff:	8b 75 d0             	mov    -0x30(%ebp),%esi
 602:	eb ee                	jmp    5f2 <printint+0x79>

00000604 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	57                   	push   %edi
 608:	56                   	push   %esi
 609:	53                   	push   %ebx
 60a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 60d:	8d 45 10             	lea    0x10(%ebp),%eax
 610:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 613:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 618:	bb 00 00 00 00       	mov    $0x0,%ebx
 61d:	eb 14                	jmp    633 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 61f:	89 fa                	mov    %edi,%edx
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	e8 36 ff ff ff       	call   55f <putc>
 629:	eb 05                	jmp    630 <printf+0x2c>
      }
    } else if(state == '%'){
 62b:	83 fe 25             	cmp    $0x25,%esi
 62e:	74 25                	je     655 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 630:	83 c3 01             	add    $0x1,%ebx
 633:	8b 45 0c             	mov    0xc(%ebp),%eax
 636:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 63a:	84 c0                	test   %al,%al
 63c:	0f 84 20 01 00 00    	je     762 <printf+0x15e>
    c = fmt[i] & 0xff;
 642:	0f be f8             	movsbl %al,%edi
 645:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 648:	85 f6                	test   %esi,%esi
 64a:	75 df                	jne    62b <printf+0x27>
      if(c == '%'){
 64c:	83 f8 25             	cmp    $0x25,%eax
 64f:	75 ce                	jne    61f <printf+0x1b>
        state = '%';
 651:	89 c6                	mov    %eax,%esi
 653:	eb db                	jmp    630 <printf+0x2c>
      if(c == 'd'){
 655:	83 f8 25             	cmp    $0x25,%eax
 658:	0f 84 cf 00 00 00    	je     72d <printf+0x129>
 65e:	0f 8c dd 00 00 00    	jl     741 <printf+0x13d>
 664:	83 f8 78             	cmp    $0x78,%eax
 667:	0f 8f d4 00 00 00    	jg     741 <printf+0x13d>
 66d:	83 f8 63             	cmp    $0x63,%eax
 670:	0f 8c cb 00 00 00    	jl     741 <printf+0x13d>
 676:	83 e8 63             	sub    $0x63,%eax
 679:	83 f8 15             	cmp    $0x15,%eax
 67c:	0f 87 bf 00 00 00    	ja     741 <printf+0x13d>
 682:	ff 24 85 6c 09 00 00 	jmp    *0x96c(,%eax,4)
        printint(fd, *ap, 10, 1);
 689:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68c:	8b 17                	mov    (%edi),%edx
 68e:	83 ec 0c             	sub    $0xc,%esp
 691:	6a 01                	push   $0x1
 693:	b9 0a 00 00 00       	mov    $0xa,%ecx
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	e8 d9 fe ff ff       	call   579 <printint>
        ap++;
 6a0:	83 c7 04             	add    $0x4,%edi
 6a3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6a9:	be 00 00 00 00       	mov    $0x0,%esi
 6ae:	eb 80                	jmp    630 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b3:	8b 17                	mov    (%edi),%edx
 6b5:	83 ec 0c             	sub    $0xc,%esp
 6b8:	6a 00                	push   $0x0
 6ba:	b9 10 00 00 00       	mov    $0x10,%ecx
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	e8 b2 fe ff ff       	call   579 <printint>
        ap++;
 6c7:	83 c7 04             	add    $0x4,%edi
 6ca:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6cd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d0:	be 00 00 00 00       	mov    $0x0,%esi
 6d5:	e9 56 ff ff ff       	jmp    630 <printf+0x2c>
        s = (char*)*ap;
 6da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6dd:	8b 30                	mov    (%eax),%esi
        ap++;
 6df:	83 c0 04             	add    $0x4,%eax
 6e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6e5:	85 f6                	test   %esi,%esi
 6e7:	75 15                	jne    6fe <printf+0xfa>
          s = "(null)";
 6e9:	be 64 09 00 00       	mov    $0x964,%esi
 6ee:	eb 0e                	jmp    6fe <printf+0xfa>
          putc(fd, *s);
 6f0:	0f be d2             	movsbl %dl,%edx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 64 fe ff ff       	call   55f <putc>
          s++;
 6fb:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6fe:	0f b6 16             	movzbl (%esi),%edx
 701:	84 d2                	test   %dl,%dl
 703:	75 eb                	jne    6f0 <printf+0xec>
      state = 0;
 705:	be 00 00 00 00       	mov    $0x0,%esi
 70a:	e9 21 ff ff ff       	jmp    630 <printf+0x2c>
        putc(fd, *ap);
 70f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 712:	0f be 17             	movsbl (%edi),%edx
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	e8 42 fe ff ff       	call   55f <putc>
        ap++;
 71d:	83 c7 04             	add    $0x4,%edi
 720:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 723:	be 00 00 00 00       	mov    $0x0,%esi
 728:	e9 03 ff ff ff       	jmp    630 <printf+0x2c>
        putc(fd, c);
 72d:	89 fa                	mov    %edi,%edx
 72f:	8b 45 08             	mov    0x8(%ebp),%eax
 732:	e8 28 fe ff ff       	call   55f <putc>
      state = 0;
 737:	be 00 00 00 00       	mov    $0x0,%esi
 73c:	e9 ef fe ff ff       	jmp    630 <printf+0x2c>
        putc(fd, '%');
 741:	ba 25 00 00 00       	mov    $0x25,%edx
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	e8 11 fe ff ff       	call   55f <putc>
        putc(fd, c);
 74e:	89 fa                	mov    %edi,%edx
 750:	8b 45 08             	mov    0x8(%ebp),%eax
 753:	e8 07 fe ff ff       	call   55f <putc>
      state = 0;
 758:	be 00 00 00 00       	mov    $0x0,%esi
 75d:	e9 ce fe ff ff       	jmp    630 <printf+0x2c>
    }
  }
}
 762:	8d 65 f4             	lea    -0xc(%ebp),%esp
 765:	5b                   	pop    %ebx
 766:	5e                   	pop    %esi
 767:	5f                   	pop    %edi
 768:	5d                   	pop    %ebp
 769:	c3                   	ret    

0000076a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 76a:	55                   	push   %ebp
 76b:	89 e5                	mov    %esp,%ebp
 76d:	57                   	push   %edi
 76e:	56                   	push   %esi
 76f:	53                   	push   %ebx
 770:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 773:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 776:	a1 54 0d 00 00       	mov    0xd54,%eax
 77b:	eb 02                	jmp    77f <free+0x15>
 77d:	89 d0                	mov    %edx,%eax
 77f:	39 c8                	cmp    %ecx,%eax
 781:	73 04                	jae    787 <free+0x1d>
 783:	39 08                	cmp    %ecx,(%eax)
 785:	77 12                	ja     799 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 787:	8b 10                	mov    (%eax),%edx
 789:	39 c2                	cmp    %eax,%edx
 78b:	77 f0                	ja     77d <free+0x13>
 78d:	39 c8                	cmp    %ecx,%eax
 78f:	72 08                	jb     799 <free+0x2f>
 791:	39 ca                	cmp    %ecx,%edx
 793:	77 04                	ja     799 <free+0x2f>
 795:	89 d0                	mov    %edx,%eax
 797:	eb e6                	jmp    77f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 799:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79f:	8b 10                	mov    (%eax),%edx
 7a1:	39 d7                	cmp    %edx,%edi
 7a3:	74 19                	je     7be <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7a5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a8:	8b 50 04             	mov    0x4(%eax),%edx
 7ab:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7ae:	39 ce                	cmp    %ecx,%esi
 7b0:	74 1b                	je     7cd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7b2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7b4:	a3 54 0d 00 00       	mov    %eax,0xd54
}
 7b9:	5b                   	pop    %ebx
 7ba:	5e                   	pop    %esi
 7bb:	5f                   	pop    %edi
 7bc:	5d                   	pop    %ebp
 7bd:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7be:	03 72 04             	add    0x4(%edx),%esi
 7c1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c4:	8b 10                	mov    (%eax),%edx
 7c6:	8b 12                	mov    (%edx),%edx
 7c8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7cb:	eb db                	jmp    7a8 <free+0x3e>
    p->s.size += bp->s.size;
 7cd:	03 53 fc             	add    -0x4(%ebx),%edx
 7d0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7d6:	89 10                	mov    %edx,(%eax)
 7d8:	eb da                	jmp    7b4 <free+0x4a>

000007da <morecore>:

static Header*
morecore(uint nu)
{
 7da:	55                   	push   %ebp
 7db:	89 e5                	mov    %esp,%ebp
 7dd:	53                   	push   %ebx
 7de:	83 ec 04             	sub    $0x4,%esp
 7e1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7e3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7e8:	77 05                	ja     7ef <morecore+0x15>
    nu = 4096;
 7ea:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7ef:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7f6:	83 ec 0c             	sub    $0xc,%esp
 7f9:	50                   	push   %eax
 7fa:	e8 38 fd ff ff       	call   537 <sbrk>
  if(p == (char*)-1)
 7ff:	83 c4 10             	add    $0x10,%esp
 802:	83 f8 ff             	cmp    $0xffffffff,%eax
 805:	74 1c                	je     823 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 807:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 80a:	83 c0 08             	add    $0x8,%eax
 80d:	83 ec 0c             	sub    $0xc,%esp
 810:	50                   	push   %eax
 811:	e8 54 ff ff ff       	call   76a <free>
  return freep;
 816:	a1 54 0d 00 00       	mov    0xd54,%eax
 81b:	83 c4 10             	add    $0x10,%esp
}
 81e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 821:	c9                   	leave  
 822:	c3                   	ret    
    return 0;
 823:	b8 00 00 00 00       	mov    $0x0,%eax
 828:	eb f4                	jmp    81e <morecore+0x44>

0000082a <malloc>:

void*
malloc(uint nbytes)
{
 82a:	55                   	push   %ebp
 82b:	89 e5                	mov    %esp,%ebp
 82d:	53                   	push   %ebx
 82e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 831:	8b 45 08             	mov    0x8(%ebp),%eax
 834:	8d 58 07             	lea    0x7(%eax),%ebx
 837:	c1 eb 03             	shr    $0x3,%ebx
 83a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 83d:	8b 0d 54 0d 00 00    	mov    0xd54,%ecx
 843:	85 c9                	test   %ecx,%ecx
 845:	74 04                	je     84b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 847:	8b 01                	mov    (%ecx),%eax
 849:	eb 4a                	jmp    895 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 84b:	c7 05 54 0d 00 00 58 	movl   $0xd58,0xd54
 852:	0d 00 00 
 855:	c7 05 58 0d 00 00 58 	movl   $0xd58,0xd58
 85c:	0d 00 00 
    base.s.size = 0;
 85f:	c7 05 5c 0d 00 00 00 	movl   $0x0,0xd5c
 866:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 869:	b9 58 0d 00 00       	mov    $0xd58,%ecx
 86e:	eb d7                	jmp    847 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 870:	74 19                	je     88b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 872:	29 da                	sub    %ebx,%edx
 874:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 877:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 87a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 87d:	89 0d 54 0d 00 00    	mov    %ecx,0xd54
      return (void*)(p + 1);
 883:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 886:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 889:	c9                   	leave  
 88a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 88b:	8b 10                	mov    (%eax),%edx
 88d:	89 11                	mov    %edx,(%ecx)
 88f:	eb ec                	jmp    87d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 891:	89 c1                	mov    %eax,%ecx
 893:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 895:	8b 50 04             	mov    0x4(%eax),%edx
 898:	39 da                	cmp    %ebx,%edx
 89a:	73 d4                	jae    870 <malloc+0x46>
    if(p == freep)
 89c:	39 05 54 0d 00 00    	cmp    %eax,0xd54
 8a2:	75 ed                	jne    891 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8a4:	89 d8                	mov    %ebx,%eax
 8a6:	e8 2f ff ff ff       	call   7da <morecore>
 8ab:	85 c0                	test   %eax,%eax
 8ad:	75 e2                	jne    891 <malloc+0x67>
 8af:	eb d5                	jmp    886 <malloc+0x5c>
