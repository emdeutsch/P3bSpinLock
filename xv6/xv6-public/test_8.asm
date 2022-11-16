
_test_8:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 94 0e 00 00       	mov    0xe94,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 e8 09 00 00       	push   $0x9e8
  31:	68 f1 09 00 00       	push   $0x9f1
  36:	6a 01                	push   $0x1
  38:	e8 fd 06 00 00       	call   73a <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 30 0a 00 00       	push   $0xa30
  45:	68 04 0a 00 00       	push   $0xa04
  4a:	6a 01                	push   $0x1
  4c:	e8 e9 06 00 00       	call   73a <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 18 0a 00 00       	push   $0xa18
  59:	6a 01                	push   $0x1
  5b:	e8 da 06 00 00       	call   73a <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 98 0e 00 00    	push   0xe98
  69:	e8 a7 05 00 00       	call   615 <kill>
  6e:	e8 72 05 00 00       	call   5e5 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 e8 09 00 00       	push   $0x9e8
  7a:	68 f1 09 00 00       	push   $0x9f1
  7f:	6a 01                	push   $0x1
  81:	e8 b4 06 00 00       	call   73a <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 f9 09 00 00       	push   $0x9f9
  8e:	68 04 0a 00 00       	push   $0xa04
  93:	6a 01                	push   $0x1
  95:	e8 a0 06 00 00       	call   73a <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 18 0a 00 00       	push   $0xa18
  a2:	6a 01                	push   $0x1
  a4:	e8 91 06 00 00       	call   73a <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 98 0e 00 00    	push   0xe98
  b2:	e8 5e 05 00 00       	call   615 <kill>
  b7:	e8 29 05 00 00       	call   5e5 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 e8 09 00 00       	push   $0x9e8
  c3:	68 f1 09 00 00       	push   $0x9f1
  c8:	6a 01                	push   $0x1
  ca:	e8 6b 06 00 00       	call   73a <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 25 0a 00 00       	push   $0xa25
  d7:	68 04 0a 00 00       	push   $0xa04
  dc:	6a 01                	push   $0x1
  de:	e8 57 06 00 00       	call   73a <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 18 0a 00 00       	push   $0xa18
  eb:	6a 01                	push   $0x1
  ed:	e8 48 06 00 00       	call   73a <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 98 0e 00 00    	push   0xe98
  fb:	e8 15 05 00 00       	call   615 <kill>
 100:	e8 e0 04 00 00       	call   5e5 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 94 0e 00 00       	mov    %eax,0xe94
   exit();
 10d:	e8 d3 04 00 00       	call   5e5 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 3a 05 00 00       	call   665 <getpid>
 12b:	a3 98 0e 00 00       	mov    %eax,0xe98
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 23 08 00 00       	call   960 <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 e8 09 00 00       	push   $0x9e8
 15f:	68 f1 09 00 00       	push   $0x9f1
 164:	6a 01                	push   $0x1
 166:	e8 cf 05 00 00       	call   73a <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 3c 0a 00 00       	push   $0xa3c
 173:	68 04 0a 00 00       	push   $0xa04
 178:	6a 01                	push   $0x1
 17a:	e8 bb 05 00 00       	call   73a <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 18 0a 00 00       	push   $0xa18
 187:	6a 01                	push   $0x1
 189:	e8 ac 05 00 00       	call   73a <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 98 0e 00 00    	push   0xe98
 197:	e8 79 04 00 00       	call   615 <kill>
 19c:	e8 44 04 00 00       	call   5e5 <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 c1 04 00 00       	call   685 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 9b 04 00 00       	call   675 <sleep>
   assert(wait() == -1);
 1da:	e8 0e 04 00 00       	call   5ed <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 e8 09 00 00       	push   $0x9e8
 1f2:	68 f1 09 00 00       	push   $0x9f1
 1f7:	6a 01                	push   $0x1
 1f9:	e8 3c 05 00 00       	call   73a <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 54 0a 00 00       	push   $0xa54
 206:	68 04 0a 00 00       	push   $0xa04
 20b:	6a 01                	push   $0x1
 20d:	e8 28 05 00 00       	call   73a <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 18 0a 00 00       	push   $0xa18
 21a:	6a 01                	push   $0x1
 21c:	e8 19 05 00 00       	call   73a <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 98 0e 00 00    	push   0xe98
 22a:	e8 e6 03 00 00       	call   615 <kill>
 22f:	e8 b1 03 00 00       	call   5e5 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 e8 09 00 00       	push   $0x9e8
 23b:	68 f1 09 00 00       	push   $0x9f1
 240:	6a 01                	push   $0x1
 242:	e8 f3 04 00 00       	call   73a <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 46 0a 00 00       	push   $0xa46
 24f:	68 04 0a 00 00       	push   $0xa04
 254:	6a 01                	push   $0x1
 256:	e8 df 04 00 00       	call   73a <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 18 0a 00 00       	push   $0xa18
 263:	6a 01                	push   $0x1
 265:	e8 d0 04 00 00       	call   73a <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 98 0e 00 00    	push   0xe98
 273:	e8 9d 03 00 00       	call   615 <kill>
 278:	e8 68 03 00 00       	call   5e5 <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 04 04 00 00       	call   68d <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 e8 09 00 00       	push   $0x9e8
 2a0:	68 f1 09 00 00       	push   $0x9f1
 2a5:	6a 01                	push   $0x1
 2a7:	e8 8e 04 00 00       	call   73a <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 77 0a 00 00       	push   $0xa77
 2b4:	68 04 0a 00 00       	push   $0xa04
 2b9:	6a 01                	push   $0x1
 2bb:	e8 7a 04 00 00       	call   73a <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 18 0a 00 00       	push   $0xa18
 2c8:	6a 01                	push   $0x1
 2ca:	e8 6b 04 00 00       	call   73a <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 98 0e 00 00    	push   0xe98
 2d8:	e8 38 03 00 00       	call   615 <kill>
 2dd:	e8 03 03 00 00       	call   5e5 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 e8 09 00 00       	push   $0x9e8
 2e9:	68 f1 09 00 00       	push   $0x9f1
 2ee:	6a 01                	push   $0x1
 2f0:	e8 45 04 00 00       	call   73a <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 61 0a 00 00       	push   $0xa61
 2fd:	68 04 0a 00 00       	push   $0xa04
 302:	6a 01                	push   $0x1
 304:	e8 31 04 00 00       	call   73a <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 18 0a 00 00       	push   $0xa18
 311:	6a 01                	push   $0x1
 313:	e8 22 04 00 00       	call   73a <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 98 0e 00 00    	push   0xe98
 321:	e8 ef 02 00 00       	call   615 <kill>
 326:	e8 ba 02 00 00       	call   5e5 <exit>
   assert(global == 2);
 32b:	83 3d 94 0e 00 00 02 	cmpl   $0x2,0xe94
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 e8 09 00 00       	push   $0x9e8
 33b:	68 f1 09 00 00       	push   $0x9f1
 340:	6a 01                	push   $0x1
 342:	e8 f3 03 00 00       	call   73a <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 8b 0a 00 00       	push   $0xa8b
 34f:	68 04 0a 00 00       	push   $0xa04
 354:	6a 01                	push   $0x1
 356:	e8 df 03 00 00       	call   73a <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 18 0a 00 00       	push   $0xa18
 363:	6a 01                	push   $0x1
 365:	e8 d0 03 00 00       	call   73a <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 98 0e 00 00    	push   0xe98
 373:	e8 9d 02 00 00       	call   615 <kill>
 378:	e8 68 02 00 00       	call   5e5 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 97 0a 00 00       	push   $0xa97
 385:	6a 01                	push   $0x1
 387:	e8 ae 03 00 00       	call   73a <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 0c 05 00 00       	call   8a0 <free>
   exit();
 394:	e8 4c 02 00 00       	call   5e5 <exit>

00000399 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	8b 75 08             	mov    0x8(%ebp),%esi
 3a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a4:	89 f0                	mov    %esi,%eax
 3a6:	89 d1                	mov    %edx,%ecx
 3a8:	83 c2 01             	add    $0x1,%edx
 3ab:	89 c3                	mov    %eax,%ebx
 3ad:	83 c0 01             	add    $0x1,%eax
 3b0:	0f b6 09             	movzbl (%ecx),%ecx
 3b3:	88 0b                	mov    %cl,(%ebx)
 3b5:	84 c9                	test   %cl,%cl
 3b7:	75 ed                	jne    3a6 <strcpy+0xd>
    ;
  return os;
}
 3b9:	89 f0                	mov    %esi,%eax
 3bb:	5b                   	pop    %ebx
 3bc:	5e                   	pop    %esi
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    

000003bf <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3c8:	eb 06                	jmp    3d0 <strcmp+0x11>
    p++, q++;
 3ca:	83 c1 01             	add    $0x1,%ecx
 3cd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3d0:	0f b6 01             	movzbl (%ecx),%eax
 3d3:	84 c0                	test   %al,%al
 3d5:	74 04                	je     3db <strcmp+0x1c>
 3d7:	3a 02                	cmp    (%edx),%al
 3d9:	74 ef                	je     3ca <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3db:	0f b6 c0             	movzbl %al,%eax
 3de:	0f b6 12             	movzbl (%edx),%edx
 3e1:	29 d0                	sub    %edx,%eax
}
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strlen>:

uint
strlen(const char *s)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3eb:	b8 00 00 00 00       	mov    $0x0,%eax
 3f0:	eb 03                	jmp    3f5 <strlen+0x10>
 3f2:	83 c0 01             	add    $0x1,%eax
 3f5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3f9:	75 f7                	jne    3f2 <strlen+0xd>
    ;
  return n;
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <memset>:

void*
memset(void *dst, int c, uint n)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	57                   	push   %edi
 401:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 404:	89 d7                	mov    %edx,%edi
 406:	8b 4d 10             	mov    0x10(%ebp),%ecx
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	fc                   	cld    
 40d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 7d fc             	mov    -0x4(%ebp),%edi
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <strchr>:

char*
strchr(const char *s, char c)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 420:	eb 03                	jmp    425 <strchr+0xf>
 422:	83 c0 01             	add    $0x1,%eax
 425:	0f b6 10             	movzbl (%eax),%edx
 428:	84 d2                	test   %dl,%dl
 42a:	74 06                	je     432 <strchr+0x1c>
    if(*s == c)
 42c:	38 ca                	cmp    %cl,%dl
 42e:	75 f2                	jne    422 <strchr+0xc>
 430:	eb 05                	jmp    437 <strchr+0x21>
      return (char*)s;
  return 0;
 432:	b8 00 00 00 00       	mov    $0x0,%eax
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

00000439 <gets>:

char*
gets(char *buf, int max)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	83 ec 1c             	sub    $0x1c,%esp
 442:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 445:	bb 00 00 00 00       	mov    $0x0,%ebx
 44a:	89 de                	mov    %ebx,%esi
 44c:	83 c3 01             	add    $0x1,%ebx
 44f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 452:	7d 2e                	jge    482 <gets+0x49>
    cc = read(0, &c, 1);
 454:	83 ec 04             	sub    $0x4,%esp
 457:	6a 01                	push   $0x1
 459:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45c:	50                   	push   %eax
 45d:	6a 00                	push   $0x0
 45f:	e8 99 01 00 00       	call   5fd <read>
    if(cc < 1)
 464:	83 c4 10             	add    $0x10,%esp
 467:	85 c0                	test   %eax,%eax
 469:	7e 17                	jle    482 <gets+0x49>
      break;
    buf[i++] = c;
 46b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 46f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 472:	3c 0a                	cmp    $0xa,%al
 474:	0f 94 c2             	sete   %dl
 477:	3c 0d                	cmp    $0xd,%al
 479:	0f 94 c0             	sete   %al
 47c:	08 c2                	or     %al,%dl
 47e:	74 ca                	je     44a <gets+0x11>
    buf[i++] = c;
 480:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 482:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 486:	89 f8                	mov    %edi,%eax
 488:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48b:	5b                   	pop    %ebx
 48c:	5e                   	pop    %esi
 48d:	5f                   	pop    %edi
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <stat>:

int
stat(const char *n, struct stat *st)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	56                   	push   %esi
 494:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 495:	83 ec 08             	sub    $0x8,%esp
 498:	6a 00                	push   $0x0
 49a:	ff 75 08             	push   0x8(%ebp)
 49d:	e8 83 01 00 00       	call   625 <open>
  if(fd < 0)
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	85 c0                	test   %eax,%eax
 4a7:	78 24                	js     4cd <stat+0x3d>
 4a9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4ab:	83 ec 08             	sub    $0x8,%esp
 4ae:	ff 75 0c             	push   0xc(%ebp)
 4b1:	50                   	push   %eax
 4b2:	e8 86 01 00 00       	call   63d <fstat>
 4b7:	89 c6                	mov    %eax,%esi
  close(fd);
 4b9:	89 1c 24             	mov    %ebx,(%esp)
 4bc:	e8 4c 01 00 00       	call   60d <close>
  return r;
 4c1:	83 c4 10             	add    $0x10,%esp
}
 4c4:	89 f0                	mov    %esi,%eax
 4c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
    return -1;
 4cd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d2:	eb f0                	jmp    4c4 <stat+0x34>

000004d4 <atoi>:

int
atoi(const char *s)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	53                   	push   %ebx
 4d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4db:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4e0:	eb 10                	jmp    4f2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4e2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4e5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4e8:	83 c1 01             	add    $0x1,%ecx
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4f2:	0f b6 01             	movzbl (%ecx),%eax
 4f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4f8:	80 fb 09             	cmp    $0x9,%bl
 4fb:	76 e5                	jbe    4e2 <atoi+0xe>
  return n;
}
 4fd:	89 d0                	mov    %edx,%eax
 4ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 502:	c9                   	leave  
 503:	c3                   	ret    

00000504 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	56                   	push   %esi
 508:	53                   	push   %ebx
 509:	8b 75 08             	mov    0x8(%ebp),%esi
 50c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 50f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 512:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 514:	eb 0d                	jmp    523 <memmove+0x1f>
    *dst++ = *src++;
 516:	0f b6 01             	movzbl (%ecx),%eax
 519:	88 02                	mov    %al,(%edx)
 51b:	8d 49 01             	lea    0x1(%ecx),%ecx
 51e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 521:	89 d8                	mov    %ebx,%eax
 523:	8d 58 ff             	lea    -0x1(%eax),%ebx
 526:	85 c0                	test   %eax,%eax
 528:	7f ec                	jg     516 <memmove+0x12>
  return vdst;
}
 52a:	89 f0                	mov    %esi,%eax
 52c:	5b                   	pop    %ebx
 52d:	5e                   	pop    %esi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 536:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 538:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 53b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 53d:	89 d0                	mov    %edx,%eax
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    

00000541 <lock_init>:
void 
lock_init(lock_t *lock){
 541:	55                   	push   %ebp
 542:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 54d:	5d                   	pop    %ebp
 54e:	c3                   	ret    

0000054f <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 54f:	55                   	push   %ebp
 550:	89 e5                	mov    %esp,%ebp
 552:	53                   	push   %ebx
 553:	83 ec 04             	sub    $0x4,%esp
 556:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 559:	83 ec 08             	sub    $0x8,%esp
 55c:	6a 01                	push   $0x1
 55e:	53                   	push   %ebx
 55f:	e8 cc ff ff ff       	call   530 <TestAndSet>
 564:	83 c4 10             	add    $0x10,%esp
 567:	83 f8 01             	cmp    $0x1,%eax
 56a:	74 ed                	je     559 <lock_acquire+0xa>
    ;
}
 56c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 56f:	c9                   	leave  
 570:	c3                   	ret    

00000571 <lock_release>:
void 
lock_release(lock_t *lock){
 571:	55                   	push   %ebp
 572:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 57d:	5d                   	pop    %ebp
 57e:	c3                   	ret    

0000057f <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 57f:	55                   	push   %ebp
 580:	89 e5                	mov    %esp,%ebp
 582:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 585:	68 04 20 00 00       	push   $0x2004
 58a:	e8 d1 03 00 00       	call   960 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 58f:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 592:	83 c4 10             	add    $0x10,%esp
 595:	eb 03                	jmp    59a <thread_create+0x1b>
      stack += 1;
 597:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 59a:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 5a0:	75 f5                	jne    597 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 5a2:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 5a5:	52                   	push   %edx
 5a6:	ff 75 10             	push   0x10(%ebp)
 5a9:	ff 75 0c             	push   0xc(%ebp)
 5ac:	ff 75 08             	push   0x8(%ebp)
 5af:	e8 d1 00 00 00       	call   685 <clone>
 
    return pid;
}
 5b4:	c9                   	leave  
 5b5:	c3                   	ret    

000005b6 <thread_join>:
int 
thread_join(){
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	53                   	push   %ebx
 5ba:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 5bd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5c0:	50                   	push   %eax
 5c1:	e8 c7 00 00 00       	call   68d <join>
 5c6:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 5c8:	83 c4 04             	add    $0x4,%esp
 5cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ce:	ff 70 fc             	push   -0x4(%eax)
 5d1:	e8 ca 02 00 00       	call   8a0 <free>
  return pid;
 5d6:	89 d8                	mov    %ebx,%eax
 5d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5db:	c9                   	leave  
 5dc:	c3                   	ret    

000005dd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5dd:	b8 01 00 00 00       	mov    $0x1,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <exit>:
SYSCALL(exit)
 5e5:	b8 02 00 00 00       	mov    $0x2,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <wait>:
SYSCALL(wait)
 5ed:	b8 03 00 00 00       	mov    $0x3,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <pipe>:
SYSCALL(pipe)
 5f5:	b8 04 00 00 00       	mov    $0x4,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <read>:
SYSCALL(read)
 5fd:	b8 05 00 00 00       	mov    $0x5,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <write>:
SYSCALL(write)
 605:	b8 10 00 00 00       	mov    $0x10,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <close>:
SYSCALL(close)
 60d:	b8 15 00 00 00       	mov    $0x15,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <kill>:
SYSCALL(kill)
 615:	b8 06 00 00 00       	mov    $0x6,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <exec>:
SYSCALL(exec)
 61d:	b8 07 00 00 00       	mov    $0x7,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <open>:
SYSCALL(open)
 625:	b8 0f 00 00 00       	mov    $0xf,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <mknod>:
SYSCALL(mknod)
 62d:	b8 11 00 00 00       	mov    $0x11,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <unlink>:
SYSCALL(unlink)
 635:	b8 12 00 00 00       	mov    $0x12,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <fstat>:
SYSCALL(fstat)
 63d:	b8 08 00 00 00       	mov    $0x8,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <link>:
SYSCALL(link)
 645:	b8 13 00 00 00       	mov    $0x13,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <mkdir>:
SYSCALL(mkdir)
 64d:	b8 14 00 00 00       	mov    $0x14,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <chdir>:
SYSCALL(chdir)
 655:	b8 09 00 00 00       	mov    $0x9,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <dup>:
SYSCALL(dup)
 65d:	b8 0a 00 00 00       	mov    $0xa,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <getpid>:
SYSCALL(getpid)
 665:	b8 0b 00 00 00       	mov    $0xb,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <sbrk>:
SYSCALL(sbrk)
 66d:	b8 0c 00 00 00       	mov    $0xc,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <sleep>:
SYSCALL(sleep)
 675:	b8 0d 00 00 00       	mov    $0xd,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <uptime>:
SYSCALL(uptime)
 67d:	b8 0e 00 00 00       	mov    $0xe,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <clone>:
SYSCALL(clone)
 685:	b8 16 00 00 00       	mov    $0x16,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <join>:
SYSCALL(join)
 68d:	b8 17 00 00 00       	mov    $0x17,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	83 ec 1c             	sub    $0x1c,%esp
 69b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 69e:	6a 01                	push   $0x1
 6a0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a3:	52                   	push   %edx
 6a4:	50                   	push   %eax
 6a5:	e8 5b ff ff ff       	call   605 <write>
}
 6aa:	83 c4 10             	add    $0x10,%esp
 6ad:	c9                   	leave  
 6ae:	c3                   	ret    

000006af <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
 6b2:	57                   	push   %edi
 6b3:	56                   	push   %esi
 6b4:	53                   	push   %ebx
 6b5:	83 ec 2c             	sub    $0x2c,%esp
 6b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6bb:	89 d0                	mov    %edx,%eax
 6bd:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6bf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c3:	0f 95 c1             	setne  %cl
 6c6:	c1 ea 1f             	shr    $0x1f,%edx
 6c9:	84 d1                	test   %dl,%cl
 6cb:	74 44                	je     711 <printint+0x62>
    neg = 1;
    x = -xx;
 6cd:	f7 d8                	neg    %eax
 6cf:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6dd:	89 c8                	mov    %ecx,%eax
 6df:	ba 00 00 00 00       	mov    $0x0,%edx
 6e4:	f7 f6                	div    %esi
 6e6:	89 df                	mov    %ebx,%edi
 6e8:	83 c3 01             	add    $0x1,%ebx
 6eb:	0f b6 92 04 0b 00 00 	movzbl 0xb04(%edx),%edx
 6f2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f6:	89 ca                	mov    %ecx,%edx
 6f8:	89 c1                	mov    %eax,%ecx
 6fa:	39 d6                	cmp    %edx,%esi
 6fc:	76 df                	jbe    6dd <printint+0x2e>
  if(neg)
 6fe:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 702:	74 31                	je     735 <printint+0x86>
    buf[i++] = '-';
 704:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 709:	8d 5f 02             	lea    0x2(%edi),%ebx
 70c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70f:	eb 17                	jmp    728 <printint+0x79>
    x = xx;
 711:	89 c1                	mov    %eax,%ecx
  neg = 0;
 713:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 71a:	eb bc                	jmp    6d8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 71c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 721:	89 f0                	mov    %esi,%eax
 723:	e8 6d ff ff ff       	call   695 <putc>
  while(--i >= 0)
 728:	83 eb 01             	sub    $0x1,%ebx
 72b:	79 ef                	jns    71c <printint+0x6d>
}
 72d:	83 c4 2c             	add    $0x2c,%esp
 730:	5b                   	pop    %ebx
 731:	5e                   	pop    %esi
 732:	5f                   	pop    %edi
 733:	5d                   	pop    %ebp
 734:	c3                   	ret    
 735:	8b 75 d0             	mov    -0x30(%ebp),%esi
 738:	eb ee                	jmp    728 <printint+0x79>

0000073a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 73a:	55                   	push   %ebp
 73b:	89 e5                	mov    %esp,%ebp
 73d:	57                   	push   %edi
 73e:	56                   	push   %esi
 73f:	53                   	push   %ebx
 740:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 743:	8d 45 10             	lea    0x10(%ebp),%eax
 746:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 749:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 74e:	bb 00 00 00 00       	mov    $0x0,%ebx
 753:	eb 14                	jmp    769 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 755:	89 fa                	mov    %edi,%edx
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	e8 36 ff ff ff       	call   695 <putc>
 75f:	eb 05                	jmp    766 <printf+0x2c>
      }
    } else if(state == '%'){
 761:	83 fe 25             	cmp    $0x25,%esi
 764:	74 25                	je     78b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 766:	83 c3 01             	add    $0x1,%ebx
 769:	8b 45 0c             	mov    0xc(%ebp),%eax
 76c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 770:	84 c0                	test   %al,%al
 772:	0f 84 20 01 00 00    	je     898 <printf+0x15e>
    c = fmt[i] & 0xff;
 778:	0f be f8             	movsbl %al,%edi
 77b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 77e:	85 f6                	test   %esi,%esi
 780:	75 df                	jne    761 <printf+0x27>
      if(c == '%'){
 782:	83 f8 25             	cmp    $0x25,%eax
 785:	75 ce                	jne    755 <printf+0x1b>
        state = '%';
 787:	89 c6                	mov    %eax,%esi
 789:	eb db                	jmp    766 <printf+0x2c>
      if(c == 'd'){
 78b:	83 f8 25             	cmp    $0x25,%eax
 78e:	0f 84 cf 00 00 00    	je     863 <printf+0x129>
 794:	0f 8c dd 00 00 00    	jl     877 <printf+0x13d>
 79a:	83 f8 78             	cmp    $0x78,%eax
 79d:	0f 8f d4 00 00 00    	jg     877 <printf+0x13d>
 7a3:	83 f8 63             	cmp    $0x63,%eax
 7a6:	0f 8c cb 00 00 00    	jl     877 <printf+0x13d>
 7ac:	83 e8 63             	sub    $0x63,%eax
 7af:	83 f8 15             	cmp    $0x15,%eax
 7b2:	0f 87 bf 00 00 00    	ja     877 <printf+0x13d>
 7b8:	ff 24 85 ac 0a 00 00 	jmp    *0xaac(,%eax,4)
        printint(fd, *ap, 10, 1);
 7bf:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c2:	8b 17                	mov    (%edi),%edx
 7c4:	83 ec 0c             	sub    $0xc,%esp
 7c7:	6a 01                	push   $0x1
 7c9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	e8 d9 fe ff ff       	call   6af <printint>
        ap++;
 7d6:	83 c7 04             	add    $0x4,%edi
 7d9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7dc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7df:	be 00 00 00 00       	mov    $0x0,%esi
 7e4:	eb 80                	jmp    766 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e9:	8b 17                	mov    (%edi),%edx
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	6a 00                	push   $0x0
 7f0:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	e8 b2 fe ff ff       	call   6af <printint>
        ap++;
 7fd:	83 c7 04             	add    $0x4,%edi
 800:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 803:	83 c4 10             	add    $0x10,%esp
      state = 0;
 806:	be 00 00 00 00       	mov    $0x0,%esi
 80b:	e9 56 ff ff ff       	jmp    766 <printf+0x2c>
        s = (char*)*ap;
 810:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 813:	8b 30                	mov    (%eax),%esi
        ap++;
 815:	83 c0 04             	add    $0x4,%eax
 818:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 81b:	85 f6                	test   %esi,%esi
 81d:	75 15                	jne    834 <printf+0xfa>
          s = "(null)";
 81f:	be a4 0a 00 00       	mov    $0xaa4,%esi
 824:	eb 0e                	jmp    834 <printf+0xfa>
          putc(fd, *s);
 826:	0f be d2             	movsbl %dl,%edx
 829:	8b 45 08             	mov    0x8(%ebp),%eax
 82c:	e8 64 fe ff ff       	call   695 <putc>
          s++;
 831:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 834:	0f b6 16             	movzbl (%esi),%edx
 837:	84 d2                	test   %dl,%dl
 839:	75 eb                	jne    826 <printf+0xec>
      state = 0;
 83b:	be 00 00 00 00       	mov    $0x0,%esi
 840:	e9 21 ff ff ff       	jmp    766 <printf+0x2c>
        putc(fd, *ap);
 845:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 848:	0f be 17             	movsbl (%edi),%edx
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	e8 42 fe ff ff       	call   695 <putc>
        ap++;
 853:	83 c7 04             	add    $0x4,%edi
 856:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 859:	be 00 00 00 00       	mov    $0x0,%esi
 85e:	e9 03 ff ff ff       	jmp    766 <printf+0x2c>
        putc(fd, c);
 863:	89 fa                	mov    %edi,%edx
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	e8 28 fe ff ff       	call   695 <putc>
      state = 0;
 86d:	be 00 00 00 00       	mov    $0x0,%esi
 872:	e9 ef fe ff ff       	jmp    766 <printf+0x2c>
        putc(fd, '%');
 877:	ba 25 00 00 00       	mov    $0x25,%edx
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	e8 11 fe ff ff       	call   695 <putc>
        putc(fd, c);
 884:	89 fa                	mov    %edi,%edx
 886:	8b 45 08             	mov    0x8(%ebp),%eax
 889:	e8 07 fe ff ff       	call   695 <putc>
      state = 0;
 88e:	be 00 00 00 00       	mov    $0x0,%esi
 893:	e9 ce fe ff ff       	jmp    766 <printf+0x2c>
    }
  }
}
 898:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89b:	5b                   	pop    %ebx
 89c:	5e                   	pop    %esi
 89d:	5f                   	pop    %edi
 89e:	5d                   	pop    %ebp
 89f:	c3                   	ret    

000008a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ac:	a1 9c 0e 00 00       	mov    0xe9c,%eax
 8b1:	eb 02                	jmp    8b5 <free+0x15>
 8b3:	89 d0                	mov    %edx,%eax
 8b5:	39 c8                	cmp    %ecx,%eax
 8b7:	73 04                	jae    8bd <free+0x1d>
 8b9:	39 08                	cmp    %ecx,(%eax)
 8bb:	77 12                	ja     8cf <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8bd:	8b 10                	mov    (%eax),%edx
 8bf:	39 c2                	cmp    %eax,%edx
 8c1:	77 f0                	ja     8b3 <free+0x13>
 8c3:	39 c8                	cmp    %ecx,%eax
 8c5:	72 08                	jb     8cf <free+0x2f>
 8c7:	39 ca                	cmp    %ecx,%edx
 8c9:	77 04                	ja     8cf <free+0x2f>
 8cb:	89 d0                	mov    %edx,%eax
 8cd:	eb e6                	jmp    8b5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8cf:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d5:	8b 10                	mov    (%eax),%edx
 8d7:	39 d7                	cmp    %edx,%edi
 8d9:	74 19                	je     8f4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8db:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8de:	8b 50 04             	mov    0x4(%eax),%edx
 8e1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e4:	39 ce                	cmp    %ecx,%esi
 8e6:	74 1b                	je     903 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8ea:	a3 9c 0e 00 00       	mov    %eax,0xe9c
}
 8ef:	5b                   	pop    %ebx
 8f0:	5e                   	pop    %esi
 8f1:	5f                   	pop    %edi
 8f2:	5d                   	pop    %ebp
 8f3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8f4:	03 72 04             	add    0x4(%edx),%esi
 8f7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8fa:	8b 10                	mov    (%eax),%edx
 8fc:	8b 12                	mov    (%edx),%edx
 8fe:	89 53 f8             	mov    %edx,-0x8(%ebx)
 901:	eb db                	jmp    8de <free+0x3e>
    p->s.size += bp->s.size;
 903:	03 53 fc             	add    -0x4(%ebx),%edx
 906:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 909:	8b 53 f8             	mov    -0x8(%ebx),%edx
 90c:	89 10                	mov    %edx,(%eax)
 90e:	eb da                	jmp    8ea <free+0x4a>

00000910 <morecore>:

static Header*
morecore(uint nu)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	53                   	push   %ebx
 914:	83 ec 04             	sub    $0x4,%esp
 917:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 919:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 91e:	77 05                	ja     925 <morecore+0x15>
    nu = 4096;
 920:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 925:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 92c:	83 ec 0c             	sub    $0xc,%esp
 92f:	50                   	push   %eax
 930:	e8 38 fd ff ff       	call   66d <sbrk>
  if(p == (char*)-1)
 935:	83 c4 10             	add    $0x10,%esp
 938:	83 f8 ff             	cmp    $0xffffffff,%eax
 93b:	74 1c                	je     959 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 93d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 940:	83 c0 08             	add    $0x8,%eax
 943:	83 ec 0c             	sub    $0xc,%esp
 946:	50                   	push   %eax
 947:	e8 54 ff ff ff       	call   8a0 <free>
  return freep;
 94c:	a1 9c 0e 00 00       	mov    0xe9c,%eax
 951:	83 c4 10             	add    $0x10,%esp
}
 954:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 957:	c9                   	leave  
 958:	c3                   	ret    
    return 0;
 959:	b8 00 00 00 00       	mov    $0x0,%eax
 95e:	eb f4                	jmp    954 <morecore+0x44>

00000960 <malloc>:

void*
malloc(uint nbytes)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	53                   	push   %ebx
 964:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 967:	8b 45 08             	mov    0x8(%ebp),%eax
 96a:	8d 58 07             	lea    0x7(%eax),%ebx
 96d:	c1 eb 03             	shr    $0x3,%ebx
 970:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 973:	8b 0d 9c 0e 00 00    	mov    0xe9c,%ecx
 979:	85 c9                	test   %ecx,%ecx
 97b:	74 04                	je     981 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97d:	8b 01                	mov    (%ecx),%eax
 97f:	eb 4a                	jmp    9cb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 981:	c7 05 9c 0e 00 00 a0 	movl   $0xea0,0xe9c
 988:	0e 00 00 
 98b:	c7 05 a0 0e 00 00 a0 	movl   $0xea0,0xea0
 992:	0e 00 00 
    base.s.size = 0;
 995:	c7 05 a4 0e 00 00 00 	movl   $0x0,0xea4
 99c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 99f:	b9 a0 0e 00 00       	mov    $0xea0,%ecx
 9a4:	eb d7                	jmp    97d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a6:	74 19                	je     9c1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a8:	29 da                	sub    %ebx,%edx
 9aa:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ad:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9b0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9b3:	89 0d 9c 0e 00 00    	mov    %ecx,0xe9c
      return (void*)(p + 1);
 9b9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9bf:	c9                   	leave  
 9c0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c1:	8b 10                	mov    (%eax),%edx
 9c3:	89 11                	mov    %edx,(%ecx)
 9c5:	eb ec                	jmp    9b3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c7:	89 c1                	mov    %eax,%ecx
 9c9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9cb:	8b 50 04             	mov    0x4(%eax),%edx
 9ce:	39 da                	cmp    %ebx,%edx
 9d0:	73 d4                	jae    9a6 <malloc+0x46>
    if(p == freep)
 9d2:	39 05 9c 0e 00 00    	cmp    %eax,0xe9c
 9d8:	75 ed                	jne    9c7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9da:	89 d8                	mov    %ebx,%eax
 9dc:	e8 2f ff ff ff       	call   910 <morecore>
 9e1:	85 c0                	test   %eax,%eax
 9e3:	75 e2                	jne    9c7 <malloc+0x67>
 9e5:	eb d5                	jmp    9bc <malloc+0x5c>
