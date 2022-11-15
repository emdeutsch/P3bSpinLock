
_test_6:     file format elf32-i386


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
  1c:	a1 e0 0e 00 00       	mov    0xee0,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 0c 0a 00 00       	push   $0xa0c
  31:	68 15 0a 00 00       	push   $0xa15
  36:	6a 01                	push   $0x1
  38:	e8 1f 07 00 00       	call   75c <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 54 0a 00 00       	push   $0xa54
  45:	68 28 0a 00 00       	push   $0xa28
  4a:	6a 01                	push   $0x1
  4c:	e8 0b 07 00 00       	call   75c <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 3c 0a 00 00       	push   $0xa3c
  59:	6a 01                	push   $0x1
  5b:	e8 fc 06 00 00       	call   75c <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 e4 0e 00 00    	push   0xee4
  69:	e8 c9 05 00 00       	call   637 <kill>
  6e:	e8 94 05 00 00       	call   607 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 0c 0a 00 00       	push   $0xa0c
  7a:	68 15 0a 00 00       	push   $0xa15
  7f:	6a 01                	push   $0x1
  81:	e8 d6 06 00 00       	call   75c <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 1d 0a 00 00       	push   $0xa1d
  8e:	68 28 0a 00 00       	push   $0xa28
  93:	6a 01                	push   $0x1
  95:	e8 c2 06 00 00       	call   75c <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 3c 0a 00 00       	push   $0xa3c
  a2:	6a 01                	push   $0x1
  a4:	e8 b3 06 00 00       	call   75c <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 e4 0e 00 00    	push   0xee4
  b2:	e8 80 05 00 00       	call   637 <kill>
  b7:	e8 4b 05 00 00       	call   607 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 0c 0a 00 00       	push   $0xa0c
  c3:	68 15 0a 00 00       	push   $0xa15
  c8:	6a 01                	push   $0x1
  ca:	e8 8d 06 00 00       	call   75c <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 49 0a 00 00       	push   $0xa49
  d7:	68 28 0a 00 00       	push   $0xa28
  dc:	6a 01                	push   $0x1
  de:	e8 79 06 00 00       	call   75c <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 3c 0a 00 00       	push   $0xa3c
  eb:	6a 01                	push   $0x1
  ed:	e8 6a 06 00 00       	call   75c <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 e4 0e 00 00    	push   0xee4
  fb:	e8 37 05 00 00       	call   637 <kill>
 100:	e8 02 05 00 00       	call   607 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 e0 0e 00 00       	mov    %eax,0xee0
   exit();
 10d:	e8 f5 04 00 00       	call   607 <exit>

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
 123:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
 126:	e8 5c 05 00 00       	call   687 <getpid>
 12b:	a3 e4 0e 00 00       	mov    %eax,0xee4
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 45 08 00 00       	call   982 <malloc>
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
 15a:	68 0c 0a 00 00       	push   $0xa0c
 15f:	68 15 0a 00 00       	push   $0xa15
 164:	6a 01                	push   $0x1
 166:	e8 f1 05 00 00       	call   75c <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 60 0a 00 00       	push   $0xa60
 173:	68 28 0a 00 00       	push   $0xa28
 178:	6a 01                	push   $0x1
 17a:	e8 dd 05 00 00       	call   75c <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 3c 0a 00 00       	push   $0xa3c
 187:	6a 01                	push   $0x1
 189:	e8 ce 05 00 00       	call   75c <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 e4 0e 00 00    	push   0xee4
 197:	e8 9b 04 00 00       	call   637 <kill>
 19c:	e8 66 04 00 00       	call   607 <exit>
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
 1bf:	e8 e3 04 00 00       	call   6a7 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 b1 04 00 00       	call   68f <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 a5 04 00 00       	call   68f <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 b1 04 00 00       	call   6af <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 0c 0a 00 00       	push   $0xa0c
 211:	68 15 0a 00 00       	push   $0xa15
 216:	6a 01                	push   $0x1
 218:	e8 3f 05 00 00       	call   75c <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 c4 0a 00 00       	push   $0xac4
 225:	68 28 0a 00 00       	push   $0xa28
 22a:	6a 01                	push   $0x1
 22c:	e8 2b 05 00 00       	call   75c <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 3c 0a 00 00       	push   $0xa3c
 239:	6a 01                	push   $0x1
 23b:	e8 1c 05 00 00       	call   75c <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 e4 0e 00 00    	push   0xee4
 249:	e8 e9 03 00 00       	call   637 <kill>
 24e:	e8 b4 03 00 00       	call   607 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 0c 0a 00 00       	push   $0xa0c
 25a:	68 15 0a 00 00       	push   $0xa15
 25f:	6a 01                	push   $0x1
 261:	e8 f6 04 00 00       	call   75c <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 6a 0a 00 00       	push   $0xa6a
 26e:	68 28 0a 00 00       	push   $0xa28
 273:	6a 01                	push   $0x1
 275:	e8 e2 04 00 00       	call   75c <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 3c 0a 00 00       	push   $0xa3c
 282:	6a 01                	push   $0x1
 284:	e8 d3 04 00 00       	call   75c <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 e4 0e 00 00    	push   0xee4
 292:	e8 a0 03 00 00       	call   637 <kill>
 297:	e8 6b 03 00 00       	call   607 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 08 04 00 00       	call   6af <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 0c 0a 00 00       	push   $0xa0c
 2c1:	68 15 0a 00 00       	push   $0xa15
 2c6:	6a 01                	push   $0x1
 2c8:	e8 8f 04 00 00       	call   75c <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 96 0a 00 00       	push   $0xa96
 2d5:	68 28 0a 00 00       	push   $0xa28
 2da:	6a 01                	push   $0x1
 2dc:	e8 7b 04 00 00       	call   75c <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 3c 0a 00 00       	push   $0xa3c
 2e9:	6a 01                	push   $0x1
 2eb:	e8 6c 04 00 00       	call   75c <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 e4 0e 00 00    	push   0xee4
 2f9:	e8 39 03 00 00       	call   637 <kill>
 2fe:	e8 04 03 00 00       	call   607 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 0c 0a 00 00       	push   $0xa0c
 30a:	68 15 0a 00 00       	push   $0xa15
 30f:	6a 01                	push   $0x1
 311:	e8 46 04 00 00       	call   75c <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 78 0a 00 00       	push   $0xa78
 31e:	68 28 0a 00 00       	push   $0xa28
 323:	6a 01                	push   $0x1
 325:	e8 32 04 00 00       	call   75c <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 3c 0a 00 00       	push   $0xa3c
 332:	6a 01                	push   $0x1
 334:	e8 23 04 00 00       	call   75c <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 e4 0e 00 00    	push   0xee4
 342:	e8 f0 02 00 00       	call   637 <kill>
 347:	e8 bb 02 00 00       	call   607 <exit>
   assert(global == 2);
 34c:	83 3d e0 0e 00 00 02 	cmpl   $0x2,0xee0
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 0c 0a 00 00       	push   $0xa0c
 35c:	68 15 0a 00 00       	push   $0xa15
 361:	6a 01                	push   $0x1
 363:	e8 f4 03 00 00       	call   75c <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 ab 0a 00 00       	push   $0xaab
 370:	68 28 0a 00 00       	push   $0xa28
 375:	6a 01                	push   $0x1
 377:	e8 e0 03 00 00       	call   75c <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 3c 0a 00 00       	push   $0xa3c
 384:	6a 01                	push   $0x1
 386:	e8 d1 03 00 00       	call   75c <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 e4 0e 00 00    	push   0xee4
 394:	e8 9e 02 00 00       	call   637 <kill>
 399:	e8 69 02 00 00       	call   607 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 b7 0a 00 00       	push   $0xab7
 3a6:	6a 01                	push   $0x1
 3a8:	e8 af 03 00 00       	call   75c <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 0d 05 00 00       	call   8c2 <free>
   exit();
 3b5:	e8 4d 02 00 00       	call   607 <exit>

000003ba <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	56                   	push   %esi
 3be:	53                   	push   %ebx
 3bf:	8b 75 08             	mov    0x8(%ebp),%esi
 3c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c5:	89 f0                	mov    %esi,%eax
 3c7:	89 d1                	mov    %edx,%ecx
 3c9:	83 c2 01             	add    $0x1,%edx
 3cc:	89 c3                	mov    %eax,%ebx
 3ce:	83 c0 01             	add    $0x1,%eax
 3d1:	0f b6 09             	movzbl (%ecx),%ecx
 3d4:	88 0b                	mov    %cl,(%ebx)
 3d6:	84 c9                	test   %cl,%cl
 3d8:	75 ed                	jne    3c7 <strcpy+0xd>
    ;
  return os;
}
 3da:	89 f0                	mov    %esi,%eax
 3dc:	5b                   	pop    %ebx
 3dd:	5e                   	pop    %esi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3e9:	eb 06                	jmp    3f1 <strcmp+0x11>
    p++, q++;
 3eb:	83 c1 01             	add    $0x1,%ecx
 3ee:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f1:	0f b6 01             	movzbl (%ecx),%eax
 3f4:	84 c0                	test   %al,%al
 3f6:	74 04                	je     3fc <strcmp+0x1c>
 3f8:	3a 02                	cmp    (%edx),%al
 3fa:	74 ef                	je     3eb <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3fc:	0f b6 c0             	movzbl %al,%eax
 3ff:	0f b6 12             	movzbl (%edx),%edx
 402:	29 d0                	sub    %edx,%eax
}
 404:	5d                   	pop    %ebp
 405:	c3                   	ret    

00000406 <strlen>:

uint
strlen(const char *s)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 40c:	b8 00 00 00 00       	mov    $0x0,%eax
 411:	eb 03                	jmp    416 <strlen+0x10>
 413:	83 c0 01             	add    $0x1,%eax
 416:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41a:	75 f7                	jne    413 <strlen+0xd>
    ;
  return n;
}
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    

0000041e <memset>:

void*
memset(void *dst, int c, uint n)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	57                   	push   %edi
 422:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 425:	89 d7                	mov    %edx,%edi
 427:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	fc                   	cld    
 42e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 430:	89 d0                	mov    %edx,%eax
 432:	8b 7d fc             	mov    -0x4(%ebp),%edi
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <strchr>:

char*
strchr(const char *s, char c)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 441:	eb 03                	jmp    446 <strchr+0xf>
 443:	83 c0 01             	add    $0x1,%eax
 446:	0f b6 10             	movzbl (%eax),%edx
 449:	84 d2                	test   %dl,%dl
 44b:	74 06                	je     453 <strchr+0x1c>
    if(*s == c)
 44d:	38 ca                	cmp    %cl,%dl
 44f:	75 f2                	jne    443 <strchr+0xc>
 451:	eb 05                	jmp    458 <strchr+0x21>
      return (char*)s;
  return 0;
 453:	b8 00 00 00 00       	mov    $0x0,%eax
}
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <gets>:

char*
gets(char *buf, int max)
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	57                   	push   %edi
 45e:	56                   	push   %esi
 45f:	53                   	push   %ebx
 460:	83 ec 1c             	sub    $0x1c,%esp
 463:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 466:	bb 00 00 00 00       	mov    $0x0,%ebx
 46b:	89 de                	mov    %ebx,%esi
 46d:	83 c3 01             	add    $0x1,%ebx
 470:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 473:	7d 2e                	jge    4a3 <gets+0x49>
    cc = read(0, &c, 1);
 475:	83 ec 04             	sub    $0x4,%esp
 478:	6a 01                	push   $0x1
 47a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47d:	50                   	push   %eax
 47e:	6a 00                	push   $0x0
 480:	e8 9a 01 00 00       	call   61f <read>
    if(cc < 1)
 485:	83 c4 10             	add    $0x10,%esp
 488:	85 c0                	test   %eax,%eax
 48a:	7e 17                	jle    4a3 <gets+0x49>
      break;
    buf[i++] = c;
 48c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 490:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 493:	3c 0a                	cmp    $0xa,%al
 495:	0f 94 c2             	sete   %dl
 498:	3c 0d                	cmp    $0xd,%al
 49a:	0f 94 c0             	sete   %al
 49d:	08 c2                	or     %al,%dl
 49f:	74 ca                	je     46b <gets+0x11>
    buf[i++] = c;
 4a1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a7:	89 f8                	mov    %edi,%eax
 4a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ac:	5b                   	pop    %ebx
 4ad:	5e                   	pop    %esi
 4ae:	5f                   	pop    %edi
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    

000004b1 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b6:	83 ec 08             	sub    $0x8,%esp
 4b9:	6a 00                	push   $0x0
 4bb:	ff 75 08             	push   0x8(%ebp)
 4be:	e8 84 01 00 00       	call   647 <open>
  if(fd < 0)
 4c3:	83 c4 10             	add    $0x10,%esp
 4c6:	85 c0                	test   %eax,%eax
 4c8:	78 24                	js     4ee <stat+0x3d>
 4ca:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4cc:	83 ec 08             	sub    $0x8,%esp
 4cf:	ff 75 0c             	push   0xc(%ebp)
 4d2:	50                   	push   %eax
 4d3:	e8 87 01 00 00       	call   65f <fstat>
 4d8:	89 c6                	mov    %eax,%esi
  close(fd);
 4da:	89 1c 24             	mov    %ebx,(%esp)
 4dd:	e8 4d 01 00 00       	call   62f <close>
  return r;
 4e2:	83 c4 10             	add    $0x10,%esp
}
 4e5:	89 f0                	mov    %esi,%eax
 4e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    
    return -1;
 4ee:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f3:	eb f0                	jmp    4e5 <stat+0x34>

000004f5 <atoi>:

int
atoi(const char *s)
{
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	53                   	push   %ebx
 4f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4fc:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 501:	eb 10                	jmp    513 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 503:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 506:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 509:	83 c1 01             	add    $0x1,%ecx
 50c:	0f be c0             	movsbl %al,%eax
 50f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 513:	0f b6 01             	movzbl (%ecx),%eax
 516:	8d 58 d0             	lea    -0x30(%eax),%ebx
 519:	80 fb 09             	cmp    $0x9,%bl
 51c:	76 e5                	jbe    503 <atoi+0xe>
  return n;
}
 51e:	89 d0                	mov    %edx,%eax
 520:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 523:	c9                   	leave  
 524:	c3                   	ret    

00000525 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
 52a:	8b 75 08             	mov    0x8(%ebp),%esi
 52d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 530:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 533:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 535:	eb 0d                	jmp    544 <memmove+0x1f>
    *dst++ = *src++;
 537:	0f b6 01             	movzbl (%ecx),%eax
 53a:	88 02                	mov    %al,(%edx)
 53c:	8d 49 01             	lea    0x1(%ecx),%ecx
 53f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 542:	89 d8                	mov    %ebx,%eax
 544:	8d 58 ff             	lea    -0x1(%eax),%ebx
 547:	85 c0                	test   %eax,%eax
 549:	7f ec                	jg     537 <memmove+0x12>
  return vdst;
}
 54b:	89 f0                	mov    %esi,%eax
 54d:	5b                   	pop    %ebx
 54e:	5e                   	pop    %esi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    

00000551 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
 554:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 557:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 559:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 55c:	89 08                	mov    %ecx,(%eax)
  return old;
}
 55e:	89 d0                	mov    %edx,%eax
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    

00000562 <lock_init>:
void 
lock_init(lock_t *lock){
 562:	55                   	push   %ebp
 563:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    

00000570 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	53                   	push   %ebx
 574:	83 ec 04             	sub    $0x4,%esp
 577:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 57a:	83 ec 08             	sub    $0x8,%esp
 57d:	6a 01                	push   $0x1
 57f:	53                   	push   %ebx
 580:	e8 cc ff ff ff       	call   551 <TestAndSet>
 585:	83 c4 10             	add    $0x10,%esp
 588:	83 f8 01             	cmp    $0x1,%eax
 58b:	74 ed                	je     57a <lock_acquire+0xa>
    ;
}
 58d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 590:	c9                   	leave  
 591:	c3                   	ret    

00000592 <lock_release>:
void 
lock_release(lock_t *lock){
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 595:	8b 45 08             	mov    0x8(%ebp),%eax
 598:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    

000005a0 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 5a6:	68 04 20 00 00       	push   $0x2004
 5ab:	e8 d2 03 00 00       	call   982 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 5b0:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 5b3:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 5b5:	eb 03                	jmp    5ba <thread_create+0x1a>
      stack += 1;
 5b7:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 5ba:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 5c0:	75 f5                	jne    5b7 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 5c2:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 5c4:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 5c7:	52                   	push   %edx
 5c8:	ff 75 10             	push   0x10(%ebp)
 5cb:	ff 75 0c             	push   0xc(%ebp)
 5ce:	ff 75 08             	push   0x8(%ebp)
 5d1:	e8 d1 00 00 00       	call   6a7 <clone>
 
    return pid;
}
 5d6:	c9                   	leave  
 5d7:	c3                   	ret    

000005d8 <thread_join>:
int 
thread_join(){
 5d8:	55                   	push   %ebp
 5d9:	89 e5                	mov    %esp,%ebp
 5db:	53                   	push   %ebx
 5dc:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 5df:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5e2:	50                   	push   %eax
 5e3:	e8 c7 00 00 00       	call   6af <join>
 5e8:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 5ea:	83 c4 04             	add    $0x4,%esp
 5ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f0:	ff 70 fc             	push   -0x4(%eax)
 5f3:	e8 ca 02 00 00       	call   8c2 <free>
  return waitedForPID;
 5f8:	89 d8                	mov    %ebx,%eax
 5fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5fd:	c9                   	leave  
 5fe:	c3                   	ret    

000005ff <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ff:	b8 01 00 00 00       	mov    $0x1,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <exit>:
SYSCALL(exit)
 607:	b8 02 00 00 00       	mov    $0x2,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <wait>:
SYSCALL(wait)
 60f:	b8 03 00 00 00       	mov    $0x3,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret    

00000617 <pipe>:
SYSCALL(pipe)
 617:	b8 04 00 00 00       	mov    $0x4,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret    

0000061f <read>:
SYSCALL(read)
 61f:	b8 05 00 00 00       	mov    $0x5,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret    

00000627 <write>:
SYSCALL(write)
 627:	b8 10 00 00 00       	mov    $0x10,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret    

0000062f <close>:
SYSCALL(close)
 62f:	b8 15 00 00 00       	mov    $0x15,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret    

00000637 <kill>:
SYSCALL(kill)
 637:	b8 06 00 00 00       	mov    $0x6,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret    

0000063f <exec>:
SYSCALL(exec)
 63f:	b8 07 00 00 00       	mov    $0x7,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <open>:
SYSCALL(open)
 647:	b8 0f 00 00 00       	mov    $0xf,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <mknod>:
SYSCALL(mknod)
 64f:	b8 11 00 00 00       	mov    $0x11,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <unlink>:
SYSCALL(unlink)
 657:	b8 12 00 00 00       	mov    $0x12,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <fstat>:
SYSCALL(fstat)
 65f:	b8 08 00 00 00       	mov    $0x8,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret    

00000667 <link>:
SYSCALL(link)
 667:	b8 13 00 00 00       	mov    $0x13,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret    

0000066f <mkdir>:
SYSCALL(mkdir)
 66f:	b8 14 00 00 00       	mov    $0x14,%eax
 674:	cd 40                	int    $0x40
 676:	c3                   	ret    

00000677 <chdir>:
SYSCALL(chdir)
 677:	b8 09 00 00 00       	mov    $0x9,%eax
 67c:	cd 40                	int    $0x40
 67e:	c3                   	ret    

0000067f <dup>:
SYSCALL(dup)
 67f:	b8 0a 00 00 00       	mov    $0xa,%eax
 684:	cd 40                	int    $0x40
 686:	c3                   	ret    

00000687 <getpid>:
SYSCALL(getpid)
 687:	b8 0b 00 00 00       	mov    $0xb,%eax
 68c:	cd 40                	int    $0x40
 68e:	c3                   	ret    

0000068f <sbrk>:
SYSCALL(sbrk)
 68f:	b8 0c 00 00 00       	mov    $0xc,%eax
 694:	cd 40                	int    $0x40
 696:	c3                   	ret    

00000697 <sleep>:
SYSCALL(sleep)
 697:	b8 0d 00 00 00       	mov    $0xd,%eax
 69c:	cd 40                	int    $0x40
 69e:	c3                   	ret    

0000069f <uptime>:
SYSCALL(uptime)
 69f:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a4:	cd 40                	int    $0x40
 6a6:	c3                   	ret    

000006a7 <clone>:
SYSCALL(clone)
 6a7:	b8 16 00 00 00       	mov    $0x16,%eax
 6ac:	cd 40                	int    $0x40
 6ae:	c3                   	ret    

000006af <join>:
SYSCALL(join)
 6af:	b8 17 00 00 00       	mov    $0x17,%eax
 6b4:	cd 40                	int    $0x40
 6b6:	c3                   	ret    

000006b7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6b7:	55                   	push   %ebp
 6b8:	89 e5                	mov    %esp,%ebp
 6ba:	83 ec 1c             	sub    $0x1c,%esp
 6bd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6c0:	6a 01                	push   $0x1
 6c2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6c5:	52                   	push   %edx
 6c6:	50                   	push   %eax
 6c7:	e8 5b ff ff ff       	call   627 <write>
}
 6cc:	83 c4 10             	add    $0x10,%esp
 6cf:	c9                   	leave  
 6d0:	c3                   	ret    

000006d1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6d1:	55                   	push   %ebp
 6d2:	89 e5                	mov    %esp,%ebp
 6d4:	57                   	push   %edi
 6d5:	56                   	push   %esi
 6d6:	53                   	push   %ebx
 6d7:	83 ec 2c             	sub    $0x2c,%esp
 6da:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6dd:	89 d0                	mov    %edx,%eax
 6df:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6e1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6e5:	0f 95 c1             	setne  %cl
 6e8:	c1 ea 1f             	shr    $0x1f,%edx
 6eb:	84 d1                	test   %dl,%cl
 6ed:	74 44                	je     733 <printint+0x62>
    neg = 1;
    x = -xx;
 6ef:	f7 d8                	neg    %eax
 6f1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6f3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6fa:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6ff:	89 c8                	mov    %ecx,%eax
 701:	ba 00 00 00 00       	mov    $0x0,%edx
 706:	f7 f6                	div    %esi
 708:	89 df                	mov    %ebx,%edi
 70a:	83 c3 01             	add    $0x1,%ebx
 70d:	0f b6 92 50 0b 00 00 	movzbl 0xb50(%edx),%edx
 714:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 718:	89 ca                	mov    %ecx,%edx
 71a:	89 c1                	mov    %eax,%ecx
 71c:	39 d6                	cmp    %edx,%esi
 71e:	76 df                	jbe    6ff <printint+0x2e>
  if(neg)
 720:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 724:	74 31                	je     757 <printint+0x86>
    buf[i++] = '-';
 726:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 72b:	8d 5f 02             	lea    0x2(%edi),%ebx
 72e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 731:	eb 17                	jmp    74a <printint+0x79>
    x = xx;
 733:	89 c1                	mov    %eax,%ecx
  neg = 0;
 735:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 73c:	eb bc                	jmp    6fa <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 73e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 743:	89 f0                	mov    %esi,%eax
 745:	e8 6d ff ff ff       	call   6b7 <putc>
  while(--i >= 0)
 74a:	83 eb 01             	sub    $0x1,%ebx
 74d:	79 ef                	jns    73e <printint+0x6d>
}
 74f:	83 c4 2c             	add    $0x2c,%esp
 752:	5b                   	pop    %ebx
 753:	5e                   	pop    %esi
 754:	5f                   	pop    %edi
 755:	5d                   	pop    %ebp
 756:	c3                   	ret    
 757:	8b 75 d0             	mov    -0x30(%ebp),%esi
 75a:	eb ee                	jmp    74a <printint+0x79>

0000075c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 75c:	55                   	push   %ebp
 75d:	89 e5                	mov    %esp,%ebp
 75f:	57                   	push   %edi
 760:	56                   	push   %esi
 761:	53                   	push   %ebx
 762:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 765:	8d 45 10             	lea    0x10(%ebp),%eax
 768:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 76b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 770:	bb 00 00 00 00       	mov    $0x0,%ebx
 775:	eb 14                	jmp    78b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 777:	89 fa                	mov    %edi,%edx
 779:	8b 45 08             	mov    0x8(%ebp),%eax
 77c:	e8 36 ff ff ff       	call   6b7 <putc>
 781:	eb 05                	jmp    788 <printf+0x2c>
      }
    } else if(state == '%'){
 783:	83 fe 25             	cmp    $0x25,%esi
 786:	74 25                	je     7ad <printf+0x51>
  for(i = 0; fmt[i]; i++){
 788:	83 c3 01             	add    $0x1,%ebx
 78b:	8b 45 0c             	mov    0xc(%ebp),%eax
 78e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 792:	84 c0                	test   %al,%al
 794:	0f 84 20 01 00 00    	je     8ba <printf+0x15e>
    c = fmt[i] & 0xff;
 79a:	0f be f8             	movsbl %al,%edi
 79d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7a0:	85 f6                	test   %esi,%esi
 7a2:	75 df                	jne    783 <printf+0x27>
      if(c == '%'){
 7a4:	83 f8 25             	cmp    $0x25,%eax
 7a7:	75 ce                	jne    777 <printf+0x1b>
        state = '%';
 7a9:	89 c6                	mov    %eax,%esi
 7ab:	eb db                	jmp    788 <printf+0x2c>
      if(c == 'd'){
 7ad:	83 f8 25             	cmp    $0x25,%eax
 7b0:	0f 84 cf 00 00 00    	je     885 <printf+0x129>
 7b6:	0f 8c dd 00 00 00    	jl     899 <printf+0x13d>
 7bc:	83 f8 78             	cmp    $0x78,%eax
 7bf:	0f 8f d4 00 00 00    	jg     899 <printf+0x13d>
 7c5:	83 f8 63             	cmp    $0x63,%eax
 7c8:	0f 8c cb 00 00 00    	jl     899 <printf+0x13d>
 7ce:	83 e8 63             	sub    $0x63,%eax
 7d1:	83 f8 15             	cmp    $0x15,%eax
 7d4:	0f 87 bf 00 00 00    	ja     899 <printf+0x13d>
 7da:	ff 24 85 f8 0a 00 00 	jmp    *0xaf8(,%eax,4)
        printint(fd, *ap, 10, 1);
 7e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e4:	8b 17                	mov    (%edi),%edx
 7e6:	83 ec 0c             	sub    $0xc,%esp
 7e9:	6a 01                	push   $0x1
 7eb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f0:	8b 45 08             	mov    0x8(%ebp),%eax
 7f3:	e8 d9 fe ff ff       	call   6d1 <printint>
        ap++;
 7f8:	83 c7 04             	add    $0x4,%edi
 7fb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7fe:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 801:	be 00 00 00 00       	mov    $0x0,%esi
 806:	eb 80                	jmp    788 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 808:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 80b:	8b 17                	mov    (%edi),%edx
 80d:	83 ec 0c             	sub    $0xc,%esp
 810:	6a 00                	push   $0x0
 812:	b9 10 00 00 00       	mov    $0x10,%ecx
 817:	8b 45 08             	mov    0x8(%ebp),%eax
 81a:	e8 b2 fe ff ff       	call   6d1 <printint>
        ap++;
 81f:	83 c7 04             	add    $0x4,%edi
 822:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 825:	83 c4 10             	add    $0x10,%esp
      state = 0;
 828:	be 00 00 00 00       	mov    $0x0,%esi
 82d:	e9 56 ff ff ff       	jmp    788 <printf+0x2c>
        s = (char*)*ap;
 832:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 835:	8b 30                	mov    (%eax),%esi
        ap++;
 837:	83 c0 04             	add    $0x4,%eax
 83a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 83d:	85 f6                	test   %esi,%esi
 83f:	75 15                	jne    856 <printf+0xfa>
          s = "(null)";
 841:	be ef 0a 00 00       	mov    $0xaef,%esi
 846:	eb 0e                	jmp    856 <printf+0xfa>
          putc(fd, *s);
 848:	0f be d2             	movsbl %dl,%edx
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	e8 64 fe ff ff       	call   6b7 <putc>
          s++;
 853:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 856:	0f b6 16             	movzbl (%esi),%edx
 859:	84 d2                	test   %dl,%dl
 85b:	75 eb                	jne    848 <printf+0xec>
      state = 0;
 85d:	be 00 00 00 00       	mov    $0x0,%esi
 862:	e9 21 ff ff ff       	jmp    788 <printf+0x2c>
        putc(fd, *ap);
 867:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86a:	0f be 17             	movsbl (%edi),%edx
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	e8 42 fe ff ff       	call   6b7 <putc>
        ap++;
 875:	83 c7 04             	add    $0x4,%edi
 878:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 87b:	be 00 00 00 00       	mov    $0x0,%esi
 880:	e9 03 ff ff ff       	jmp    788 <printf+0x2c>
        putc(fd, c);
 885:	89 fa                	mov    %edi,%edx
 887:	8b 45 08             	mov    0x8(%ebp),%eax
 88a:	e8 28 fe ff ff       	call   6b7 <putc>
      state = 0;
 88f:	be 00 00 00 00       	mov    $0x0,%esi
 894:	e9 ef fe ff ff       	jmp    788 <printf+0x2c>
        putc(fd, '%');
 899:	ba 25 00 00 00       	mov    $0x25,%edx
 89e:	8b 45 08             	mov    0x8(%ebp),%eax
 8a1:	e8 11 fe ff ff       	call   6b7 <putc>
        putc(fd, c);
 8a6:	89 fa                	mov    %edi,%edx
 8a8:	8b 45 08             	mov    0x8(%ebp),%eax
 8ab:	e8 07 fe ff ff       	call   6b7 <putc>
      state = 0;
 8b0:	be 00 00 00 00       	mov    $0x0,%esi
 8b5:	e9 ce fe ff ff       	jmp    788 <printf+0x2c>
    }
  }
}
 8ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8bd:	5b                   	pop    %ebx
 8be:	5e                   	pop    %esi
 8bf:	5f                   	pop    %edi
 8c0:	5d                   	pop    %ebp
 8c1:	c3                   	ret    

000008c2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c2:	55                   	push   %ebp
 8c3:	89 e5                	mov    %esp,%ebp
 8c5:	57                   	push   %edi
 8c6:	56                   	push   %esi
 8c7:	53                   	push   %ebx
 8c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8cb:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ce:	a1 e8 0e 00 00       	mov    0xee8,%eax
 8d3:	eb 02                	jmp    8d7 <free+0x15>
 8d5:	89 d0                	mov    %edx,%eax
 8d7:	39 c8                	cmp    %ecx,%eax
 8d9:	73 04                	jae    8df <free+0x1d>
 8db:	39 08                	cmp    %ecx,(%eax)
 8dd:	77 12                	ja     8f1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8df:	8b 10                	mov    (%eax),%edx
 8e1:	39 c2                	cmp    %eax,%edx
 8e3:	77 f0                	ja     8d5 <free+0x13>
 8e5:	39 c8                	cmp    %ecx,%eax
 8e7:	72 08                	jb     8f1 <free+0x2f>
 8e9:	39 ca                	cmp    %ecx,%edx
 8eb:	77 04                	ja     8f1 <free+0x2f>
 8ed:	89 d0                	mov    %edx,%eax
 8ef:	eb e6                	jmp    8d7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8f4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8f7:	8b 10                	mov    (%eax),%edx
 8f9:	39 d7                	cmp    %edx,%edi
 8fb:	74 19                	je     916 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 900:	8b 50 04             	mov    0x4(%eax),%edx
 903:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 906:	39 ce                	cmp    %ecx,%esi
 908:	74 1b                	je     925 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 90a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 90c:	a3 e8 0e 00 00       	mov    %eax,0xee8
}
 911:	5b                   	pop    %ebx
 912:	5e                   	pop    %esi
 913:	5f                   	pop    %edi
 914:	5d                   	pop    %ebp
 915:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 916:	03 72 04             	add    0x4(%edx),%esi
 919:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 91c:	8b 10                	mov    (%eax),%edx
 91e:	8b 12                	mov    (%edx),%edx
 920:	89 53 f8             	mov    %edx,-0x8(%ebx)
 923:	eb db                	jmp    900 <free+0x3e>
    p->s.size += bp->s.size;
 925:	03 53 fc             	add    -0x4(%ebx),%edx
 928:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 92b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 92e:	89 10                	mov    %edx,(%eax)
 930:	eb da                	jmp    90c <free+0x4a>

00000932 <morecore>:

static Header*
morecore(uint nu)
{
 932:	55                   	push   %ebp
 933:	89 e5                	mov    %esp,%ebp
 935:	53                   	push   %ebx
 936:	83 ec 04             	sub    $0x4,%esp
 939:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 93b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 940:	77 05                	ja     947 <morecore+0x15>
    nu = 4096;
 942:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 947:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 94e:	83 ec 0c             	sub    $0xc,%esp
 951:	50                   	push   %eax
 952:	e8 38 fd ff ff       	call   68f <sbrk>
  if(p == (char*)-1)
 957:	83 c4 10             	add    $0x10,%esp
 95a:	83 f8 ff             	cmp    $0xffffffff,%eax
 95d:	74 1c                	je     97b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 95f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 962:	83 c0 08             	add    $0x8,%eax
 965:	83 ec 0c             	sub    $0xc,%esp
 968:	50                   	push   %eax
 969:	e8 54 ff ff ff       	call   8c2 <free>
  return freep;
 96e:	a1 e8 0e 00 00       	mov    0xee8,%eax
 973:	83 c4 10             	add    $0x10,%esp
}
 976:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 979:	c9                   	leave  
 97a:	c3                   	ret    
    return 0;
 97b:	b8 00 00 00 00       	mov    $0x0,%eax
 980:	eb f4                	jmp    976 <morecore+0x44>

00000982 <malloc>:

void*
malloc(uint nbytes)
{
 982:	55                   	push   %ebp
 983:	89 e5                	mov    %esp,%ebp
 985:	53                   	push   %ebx
 986:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 989:	8b 45 08             	mov    0x8(%ebp),%eax
 98c:	8d 58 07             	lea    0x7(%eax),%ebx
 98f:	c1 eb 03             	shr    $0x3,%ebx
 992:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 995:	8b 0d e8 0e 00 00    	mov    0xee8,%ecx
 99b:	85 c9                	test   %ecx,%ecx
 99d:	74 04                	je     9a3 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 99f:	8b 01                	mov    (%ecx),%eax
 9a1:	eb 4a                	jmp    9ed <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9a3:	c7 05 e8 0e 00 00 ec 	movl   $0xeec,0xee8
 9aa:	0e 00 00 
 9ad:	c7 05 ec 0e 00 00 ec 	movl   $0xeec,0xeec
 9b4:	0e 00 00 
    base.s.size = 0;
 9b7:	c7 05 f0 0e 00 00 00 	movl   $0x0,0xef0
 9be:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9c1:	b9 ec 0e 00 00       	mov    $0xeec,%ecx
 9c6:	eb d7                	jmp    99f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9c8:	74 19                	je     9e3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9ca:	29 da                	sub    %ebx,%edx
 9cc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9cf:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9d2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9d5:	89 0d e8 0e 00 00    	mov    %ecx,0xee8
      return (void*)(p + 1);
 9db:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9e1:	c9                   	leave  
 9e2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9e3:	8b 10                	mov    (%eax),%edx
 9e5:	89 11                	mov    %edx,(%ecx)
 9e7:	eb ec                	jmp    9d5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e9:	89 c1                	mov    %eax,%ecx
 9eb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9ed:	8b 50 04             	mov    0x4(%eax),%edx
 9f0:	39 da                	cmp    %ebx,%edx
 9f2:	73 d4                	jae    9c8 <malloc+0x46>
    if(p == freep)
 9f4:	39 05 e8 0e 00 00    	cmp    %eax,0xee8
 9fa:	75 ed                	jne    9e9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9fc:	89 d8                	mov    %ebx,%eax
 9fe:	e8 2f ff ff ff       	call   932 <morecore>
 a03:	85 c0                	test   %eax,%eax
 a05:	75 e2                	jne    9e9 <malloc+0x67>
 a07:	eb d5                	jmp    9de <malloc+0x5c>
