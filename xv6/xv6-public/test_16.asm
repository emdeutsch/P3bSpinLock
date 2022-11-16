
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:
   printf(1, "TEST PASSED\n");
   exit();
}


void nested_worker(void *arg1, void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <nested_worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <nested_worker+0xbc>
   assert(global == 2);
  1c:	a1 08 0f 00 00       	mov    0xf08,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 38 0a 00 00       	push   $0xa38
  31:	68 42 0a 00 00       	push   $0xa42
  36:	6a 01                	push   $0x1
  38:	e8 4e 07 00 00       	call   78b <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 89 0a 00 00       	push   $0xa89
  45:	68 59 0a 00 00       	push   $0xa59
  4a:	6a 01                	push   $0x1
  4c:	e8 3a 07 00 00       	call   78b <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 6d 0a 00 00       	push   $0xa6d
  59:	6a 01                	push   $0x1
  5b:	e8 2b 07 00 00       	call   78b <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 0c 0f 00 00    	push   0xf0c
  69:	e8 f8 05 00 00       	call   666 <kill>
  6e:	e8 c3 05 00 00       	call   636 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 38 0a 00 00       	push   $0xa38
  7a:	68 42 0a 00 00       	push   $0xa42
  7f:	6a 01                	push   $0x1
  81:	e8 05 07 00 00       	call   78b <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 4a 0a 00 00       	push   $0xa4a
  8e:	68 59 0a 00 00       	push   $0xa59
  93:	6a 01                	push   $0x1
  95:	e8 f1 06 00 00       	call   78b <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 6d 0a 00 00       	push   $0xa6d
  a2:	6a 01                	push   $0x1
  a4:	e8 e2 06 00 00       	call   78b <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 0c 0f 00 00    	push   0xf0c
  b2:	e8 af 05 00 00       	call   666 <kill>
  b7:	e8 7a 05 00 00       	call   636 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 38 0a 00 00       	push   $0xa38
  c3:	68 42 0a 00 00       	push   $0xa42
  c8:	6a 01                	push   $0x1
  ca:	e8 bc 06 00 00       	call   78b <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 7a 0a 00 00       	push   $0xa7a
  d7:	68 59 0a 00 00       	push   $0xa59
  dc:	6a 01                	push   $0x1
  de:	e8 a8 06 00 00       	call   78b <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 6d 0a 00 00       	push   $0xa6d
  eb:	6a 01                	push   $0x1
  ed:	e8 99 06 00 00       	call   78b <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 0c 0f 00 00    	push   0xf0c
  fb:	e8 66 05 00 00       	call   666 <kill>
 100:	e8 31 05 00 00       	call   636 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 08 0f 00 00       	mov    %eax,0xf08
   exit();
 10d:	e8 24 05 00 00       	call   636 <exit>

00000112 <worker>:
}

void
worker(void *arg1, void *arg2) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 00                	mov    (%eax),%eax
 11e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int arg2_int = *(int*)arg2;
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
 124:	8b 12                	mov    (%edx),%edx
 126:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(arg1_int == 35);
 129:	83 f8 23             	cmp    $0x23,%eax
 12c:	75 60                	jne    18e <worker+0x7c>
   assert(arg2_int == 42);
 12e:	83 fa 2a             	cmp    $0x2a,%edx
 131:	0f 85 a0 00 00 00    	jne    1d7 <worker+0xc5>
   assert(global == 1);
 137:	a1 08 0f 00 00       	mov    0xf08,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 38 0a 00 00       	push   $0xa38
 14c:	68 42 0a 00 00       	push   $0xa42
 151:	6a 01                	push   $0x1
 153:	e8 33 06 00 00       	call   78b <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 95 0a 00 00       	push   $0xa95
 160:	68 59 0a 00 00       	push   $0xa59
 165:	6a 01                	push   $0x1
 167:	e8 1f 06 00 00       	call   78b <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 6d 0a 00 00       	push   $0xa6d
 174:	6a 01                	push   $0x1
 176:	e8 10 06 00 00       	call   78b <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 0c 0f 00 00    	push   0xf0c
 184:	e8 dd 04 00 00       	call   666 <kill>
 189:	e8 a8 04 00 00       	call   636 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 38 0a 00 00       	push   $0xa38
 195:	68 42 0a 00 00       	push   $0xa42
 19a:	6a 01                	push   $0x1
 19c:	e8 ea 05 00 00       	call   78b <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 4a 0a 00 00       	push   $0xa4a
 1a9:	68 59 0a 00 00       	push   $0xa59
 1ae:	6a 01                	push   $0x1
 1b0:	e8 d6 05 00 00       	call   78b <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 6d 0a 00 00       	push   $0xa6d
 1bd:	6a 01                	push   $0x1
 1bf:	e8 c7 05 00 00       	call   78b <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 0c 0f 00 00    	push   0xf0c
 1cd:	e8 94 04 00 00       	call   666 <kill>
 1d2:	e8 5f 04 00 00       	call   636 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 38 0a 00 00       	push   $0xa38
 1de:	68 42 0a 00 00       	push   $0xa42
 1e3:	6a 01                	push   $0x1
 1e5:	e8 a1 05 00 00       	call   78b <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 7a 0a 00 00       	push   $0xa7a
 1f2:	68 59 0a 00 00       	push   $0xa59
 1f7:	6a 01                	push   $0x1
 1f9:	e8 8d 05 00 00       	call   78b <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 6d 0a 00 00       	push   $0xa6d
 206:	6a 01                	push   $0x1
 208:	e8 7e 05 00 00       	call   78b <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 0c 0f 00 00    	push   0xf0c
 216:	e8 4b 04 00 00       	call   666 <kill>
 21b:	e8 16 04 00 00       	call   636 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 08 0f 00 00       	mov    %eax,0xf08
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	68 00 00 00 00       	push   $0x0
 238:	e8 93 03 00 00       	call   5d0 <thread_create>
 23d:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
 23f:	e8 c3 03 00 00       	call   607 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 38 0a 00 00       	push   $0xa38
 252:	68 42 0a 00 00       	push   $0xa42
 257:	6a 01                	push   $0x1
 259:	e8 2d 05 00 00       	call   78b <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 e0 0a 00 00       	push   $0xae0
 266:	68 59 0a 00 00       	push   $0xa59
 26b:	6a 01                	push   $0x1
 26d:	e8 19 05 00 00       	call   78b <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 6d 0a 00 00       	push   $0xa6d
 27a:	6a 01                	push   $0x1
 27c:	e8 0a 05 00 00       	call   78b <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 0c 0f 00 00    	push   0xf0c
 28a:	e8 d7 03 00 00       	call   666 <kill>
 28f:	e8 a2 03 00 00       	call   636 <exit>
   exit();
 294:	e8 9d 03 00 00       	call   636 <exit>

00000299 <main>:
{
 299:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 29d:	83 e4 f0             	and    $0xfffffff0,%esp
 2a0:	ff 71 fc             	push   -0x4(%ecx)
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	51                   	push   %ecx
 2a8:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2ab:	e8 06 04 00 00       	call   6b6 <getpid>
 2b0:	a3 0c 0f 00 00       	mov    %eax,0xf0c
   int arg1 = 35;
 2b5:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 2bc:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2c9:	50                   	push   %eax
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	68 12 01 00 00       	push   $0x112
 2d3:	e8 f8 02 00 00       	call   5d0 <thread_create>
   assert(thread_pid > 0);
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 65                	jle    344 <main+0xab>
 2df:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 2e1:	e8 21 03 00 00       	call   607 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d 08 0f 00 00 03 	cmpl   $0x3,0xf08
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 38 0a 00 00       	push   $0xa38
 302:	68 42 0a 00 00       	push   $0xa42
 307:	6a 01                	push   $0x1
 309:	e8 7d 04 00 00       	call   78b <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 c7 0a 00 00       	push   $0xac7
 316:	68 59 0a 00 00       	push   $0xa59
 31b:	6a 01                	push   $0x1
 31d:	e8 69 04 00 00       	call   78b <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 6d 0a 00 00       	push   $0xa6d
 32a:	6a 01                	push   $0x1
 32c:	e8 5a 04 00 00       	call   78b <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 0c 0f 00 00    	push   0xf0c
 33a:	e8 27 03 00 00       	call   666 <kill>
 33f:	e8 f2 02 00 00       	call   636 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 38 0a 00 00       	push   $0xa38
 34b:	68 42 0a 00 00       	push   $0xa42
 350:	6a 01                	push   $0x1
 352:	e8 34 04 00 00       	call   78b <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 a1 0a 00 00       	push   $0xaa1
 35f:	68 59 0a 00 00       	push   $0xa59
 364:	6a 01                	push   $0x1
 366:	e8 20 04 00 00       	call   78b <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 6d 0a 00 00       	push   $0xa6d
 373:	6a 01                	push   $0x1
 375:	e8 11 04 00 00       	call   78b <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 0c 0f 00 00    	push   0xf0c
 383:	e8 de 02 00 00       	call   666 <kill>
 388:	e8 a9 02 00 00       	call   636 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 38 0a 00 00       	push   $0xa38
 394:	68 42 0a 00 00       	push   $0xa42
 399:	6a 01                	push   $0x1
 39b:	e8 eb 03 00 00       	call   78b <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 b0 0a 00 00       	push   $0xab0
 3a8:	68 59 0a 00 00       	push   $0xa59
 3ad:	6a 01                	push   $0x1
 3af:	e8 d7 03 00 00       	call   78b <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 6d 0a 00 00       	push   $0xa6d
 3bc:	6a 01                	push   $0x1
 3be:	e8 c8 03 00 00       	call   78b <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 0c 0f 00 00    	push   0xf0c
 3cc:	e8 95 02 00 00       	call   666 <kill>
 3d1:	e8 60 02 00 00       	call   636 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 d3 0a 00 00       	push   $0xad3
 3de:	6a 01                	push   $0x1
 3e0:	e8 a6 03 00 00       	call   78b <printf>
   exit();
 3e5:	e8 4c 02 00 00       	call   636 <exit>

000003ea <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	56                   	push   %esi
 3ee:	53                   	push   %ebx
 3ef:	8b 75 08             	mov    0x8(%ebp),%esi
 3f2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3f5:	89 f0                	mov    %esi,%eax
 3f7:	89 d1                	mov    %edx,%ecx
 3f9:	83 c2 01             	add    $0x1,%edx
 3fc:	89 c3                	mov    %eax,%ebx
 3fe:	83 c0 01             	add    $0x1,%eax
 401:	0f b6 09             	movzbl (%ecx),%ecx
 404:	88 0b                	mov    %cl,(%ebx)
 406:	84 c9                	test   %cl,%cl
 408:	75 ed                	jne    3f7 <strcpy+0xd>
    ;
  return os;
}
 40a:	89 f0                	mov    %esi,%eax
 40c:	5b                   	pop    %ebx
 40d:	5e                   	pop    %esi
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    

00000410 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 4d 08             	mov    0x8(%ebp),%ecx
 416:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 419:	eb 06                	jmp    421 <strcmp+0x11>
    p++, q++;
 41b:	83 c1 01             	add    $0x1,%ecx
 41e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 421:	0f b6 01             	movzbl (%ecx),%eax
 424:	84 c0                	test   %al,%al
 426:	74 04                	je     42c <strcmp+0x1c>
 428:	3a 02                	cmp    (%edx),%al
 42a:	74 ef                	je     41b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 42c:	0f b6 c0             	movzbl %al,%eax
 42f:	0f b6 12             	movzbl (%edx),%edx
 432:	29 d0                	sub    %edx,%eax
}
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <strlen>:

uint
strlen(const char *s)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 43c:	b8 00 00 00 00       	mov    $0x0,%eax
 441:	eb 03                	jmp    446 <strlen+0x10>
 443:	83 c0 01             	add    $0x1,%eax
 446:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 44a:	75 f7                	jne    443 <strlen+0xd>
    ;
  return n;
}
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    

0000044e <memset>:

void*
memset(void *dst, int c, uint n)
{
 44e:	55                   	push   %ebp
 44f:	89 e5                	mov    %esp,%ebp
 451:	57                   	push   %edi
 452:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 455:	89 d7                	mov    %edx,%edi
 457:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	fc                   	cld    
 45e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 460:	89 d0                	mov    %edx,%eax
 462:	8b 7d fc             	mov    -0x4(%ebp),%edi
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <strchr>:

char*
strchr(const char *s, char c)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 471:	eb 03                	jmp    476 <strchr+0xf>
 473:	83 c0 01             	add    $0x1,%eax
 476:	0f b6 10             	movzbl (%eax),%edx
 479:	84 d2                	test   %dl,%dl
 47b:	74 06                	je     483 <strchr+0x1c>
    if(*s == c)
 47d:	38 ca                	cmp    %cl,%dl
 47f:	75 f2                	jne    473 <strchr+0xc>
 481:	eb 05                	jmp    488 <strchr+0x21>
      return (char*)s;
  return 0;
 483:	b8 00 00 00 00       	mov    $0x0,%eax
}
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <gets>:

char*
gets(char *buf, int max)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	57                   	push   %edi
 48e:	56                   	push   %esi
 48f:	53                   	push   %ebx
 490:	83 ec 1c             	sub    $0x1c,%esp
 493:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 496:	bb 00 00 00 00       	mov    $0x0,%ebx
 49b:	89 de                	mov    %ebx,%esi
 49d:	83 c3 01             	add    $0x1,%ebx
 4a0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a3:	7d 2e                	jge    4d3 <gets+0x49>
    cc = read(0, &c, 1);
 4a5:	83 ec 04             	sub    $0x4,%esp
 4a8:	6a 01                	push   $0x1
 4aa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ad:	50                   	push   %eax
 4ae:	6a 00                	push   $0x0
 4b0:	e8 99 01 00 00       	call   64e <read>
    if(cc < 1)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	85 c0                	test   %eax,%eax
 4ba:	7e 17                	jle    4d3 <gets+0x49>
      break;
    buf[i++] = c;
 4bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4c0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4c3:	3c 0a                	cmp    $0xa,%al
 4c5:	0f 94 c2             	sete   %dl
 4c8:	3c 0d                	cmp    $0xd,%al
 4ca:	0f 94 c0             	sete   %al
 4cd:	08 c2                	or     %al,%dl
 4cf:	74 ca                	je     49b <gets+0x11>
    buf[i++] = c;
 4d1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4d3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4d7:	89 f8                	mov    %edi,%eax
 4d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5f                   	pop    %edi
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret    

000004e1 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e6:	83 ec 08             	sub    $0x8,%esp
 4e9:	6a 00                	push   $0x0
 4eb:	ff 75 08             	push   0x8(%ebp)
 4ee:	e8 83 01 00 00       	call   676 <open>
  if(fd < 0)
 4f3:	83 c4 10             	add    $0x10,%esp
 4f6:	85 c0                	test   %eax,%eax
 4f8:	78 24                	js     51e <stat+0x3d>
 4fa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4fc:	83 ec 08             	sub    $0x8,%esp
 4ff:	ff 75 0c             	push   0xc(%ebp)
 502:	50                   	push   %eax
 503:	e8 86 01 00 00       	call   68e <fstat>
 508:	89 c6                	mov    %eax,%esi
  close(fd);
 50a:	89 1c 24             	mov    %ebx,(%esp)
 50d:	e8 4c 01 00 00       	call   65e <close>
  return r;
 512:	83 c4 10             	add    $0x10,%esp
}
 515:	89 f0                	mov    %esi,%eax
 517:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51a:	5b                   	pop    %ebx
 51b:	5e                   	pop    %esi
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    
    return -1;
 51e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 523:	eb f0                	jmp    515 <stat+0x34>

00000525 <atoi>:

int
atoi(const char *s)
{
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	53                   	push   %ebx
 529:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 52c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 531:	eb 10                	jmp    543 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 533:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 536:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 539:	83 c1 01             	add    $0x1,%ecx
 53c:	0f be c0             	movsbl %al,%eax
 53f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 543:	0f b6 01             	movzbl (%ecx),%eax
 546:	8d 58 d0             	lea    -0x30(%eax),%ebx
 549:	80 fb 09             	cmp    $0x9,%bl
 54c:	76 e5                	jbe    533 <atoi+0xe>
  return n;
}
 54e:	89 d0                	mov    %edx,%eax
 550:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 553:	c9                   	leave  
 554:	c3                   	ret    

00000555 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	8b 75 08             	mov    0x8(%ebp),%esi
 55d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 560:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 563:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 565:	eb 0d                	jmp    574 <memmove+0x1f>
    *dst++ = *src++;
 567:	0f b6 01             	movzbl (%ecx),%eax
 56a:	88 02                	mov    %al,(%edx)
 56c:	8d 49 01             	lea    0x1(%ecx),%ecx
 56f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 572:	89 d8                	mov    %ebx,%eax
 574:	8d 58 ff             	lea    -0x1(%eax),%ebx
 577:	85 c0                	test   %eax,%eax
 579:	7f ec                	jg     567 <memmove+0x12>
  return vdst;
}
 57b:	89 f0                	mov    %esi,%eax
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret    

00000581 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 587:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 589:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 58c:	89 08                	mov    %ecx,(%eax)
  return old;
}
 58e:	89 d0                	mov    %edx,%eax
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    

00000592 <lock_init>:
void 
lock_init(lock_t *lock){
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 595:	8b 45 08             	mov    0x8(%ebp),%eax
 598:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    

000005a0 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	83 ec 04             	sub    $0x4,%esp
 5a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 5aa:	83 ec 08             	sub    $0x8,%esp
 5ad:	6a 01                	push   $0x1
 5af:	53                   	push   %ebx
 5b0:	e8 cc ff ff ff       	call   581 <TestAndSet>
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	83 f8 01             	cmp    $0x1,%eax
 5bb:	74 ed                	je     5aa <lock_acquire+0xa>
    ;
}
 5bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5c0:	c9                   	leave  
 5c1:	c3                   	ret    

000005c2 <lock_release>:
void 
lock_release(lock_t *lock){
 5c2:	55                   	push   %ebp
 5c3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    

000005d0 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 5d6:	68 04 20 00 00       	push   $0x2004
 5db:	e8 d1 03 00 00       	call   9b1 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 5e0:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 5e3:	83 c4 10             	add    $0x10,%esp
 5e6:	eb 03                	jmp    5eb <thread_create+0x1b>
      stack += 1;
 5e8:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 5eb:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 5f1:	75 f5                	jne    5e8 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 5f3:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 5f6:	52                   	push   %edx
 5f7:	ff 75 10             	push   0x10(%ebp)
 5fa:	ff 75 0c             	push   0xc(%ebp)
 5fd:	ff 75 08             	push   0x8(%ebp)
 600:	e8 d1 00 00 00       	call   6d6 <clone>
 
    return pid;
}
 605:	c9                   	leave  
 606:	c3                   	ret    

00000607 <thread_join>:
int 
thread_join(){
 607:	55                   	push   %ebp
 608:	89 e5                	mov    %esp,%ebp
 60a:	53                   	push   %ebx
 60b:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 60e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 611:	50                   	push   %eax
 612:	e8 c7 00 00 00       	call   6de <join>
 617:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 619:	83 c4 04             	add    $0x4,%esp
 61c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61f:	ff 70 fc             	push   -0x4(%eax)
 622:	e8 ca 02 00 00       	call   8f1 <free>
  return pid;
 627:	89 d8                	mov    %ebx,%eax
 629:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 62c:	c9                   	leave  
 62d:	c3                   	ret    

0000062e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 62e:	b8 01 00 00 00       	mov    $0x1,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <exit>:
SYSCALL(exit)
 636:	b8 02 00 00 00       	mov    $0x2,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <wait>:
SYSCALL(wait)
 63e:	b8 03 00 00 00       	mov    $0x3,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <pipe>:
SYSCALL(pipe)
 646:	b8 04 00 00 00       	mov    $0x4,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <read>:
SYSCALL(read)
 64e:	b8 05 00 00 00       	mov    $0x5,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <write>:
SYSCALL(write)
 656:	b8 10 00 00 00       	mov    $0x10,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <close>:
SYSCALL(close)
 65e:	b8 15 00 00 00       	mov    $0x15,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <kill>:
SYSCALL(kill)
 666:	b8 06 00 00 00       	mov    $0x6,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <exec>:
SYSCALL(exec)
 66e:	b8 07 00 00 00       	mov    $0x7,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <open>:
SYSCALL(open)
 676:	b8 0f 00 00 00       	mov    $0xf,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <mknod>:
SYSCALL(mknod)
 67e:	b8 11 00 00 00       	mov    $0x11,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <unlink>:
SYSCALL(unlink)
 686:	b8 12 00 00 00       	mov    $0x12,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <fstat>:
SYSCALL(fstat)
 68e:	b8 08 00 00 00       	mov    $0x8,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <link>:
SYSCALL(link)
 696:	b8 13 00 00 00       	mov    $0x13,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <mkdir>:
SYSCALL(mkdir)
 69e:	b8 14 00 00 00       	mov    $0x14,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <chdir>:
SYSCALL(chdir)
 6a6:	b8 09 00 00 00       	mov    $0x9,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <dup>:
SYSCALL(dup)
 6ae:	b8 0a 00 00 00       	mov    $0xa,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <getpid>:
SYSCALL(getpid)
 6b6:	b8 0b 00 00 00       	mov    $0xb,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <sbrk>:
SYSCALL(sbrk)
 6be:	b8 0c 00 00 00       	mov    $0xc,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <sleep>:
SYSCALL(sleep)
 6c6:	b8 0d 00 00 00       	mov    $0xd,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <uptime>:
SYSCALL(uptime)
 6ce:	b8 0e 00 00 00       	mov    $0xe,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <clone>:
SYSCALL(clone)
 6d6:	b8 16 00 00 00       	mov    $0x16,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <join>:
SYSCALL(join)
 6de:	b8 17 00 00 00       	mov    $0x17,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6e6:	55                   	push   %ebp
 6e7:	89 e5                	mov    %esp,%ebp
 6e9:	83 ec 1c             	sub    $0x1c,%esp
 6ec:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6ef:	6a 01                	push   $0x1
 6f1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6f4:	52                   	push   %edx
 6f5:	50                   	push   %eax
 6f6:	e8 5b ff ff ff       	call   656 <write>
}
 6fb:	83 c4 10             	add    $0x10,%esp
 6fe:	c9                   	leave  
 6ff:	c3                   	ret    

00000700 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
 709:	89 45 d0             	mov    %eax,-0x30(%ebp)
 70c:	89 d0                	mov    %edx,%eax
 70e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 710:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 714:	0f 95 c1             	setne  %cl
 717:	c1 ea 1f             	shr    $0x1f,%edx
 71a:	84 d1                	test   %dl,%cl
 71c:	74 44                	je     762 <printint+0x62>
    neg = 1;
    x = -xx;
 71e:	f7 d8                	neg    %eax
 720:	89 c1                	mov    %eax,%ecx
    neg = 1;
 722:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 729:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 72e:	89 c8                	mov    %ecx,%eax
 730:	ba 00 00 00 00       	mov    $0x0,%edx
 735:	f7 f6                	div    %esi
 737:	89 df                	mov    %ebx,%edi
 739:	83 c3 01             	add    $0x1,%ebx
 73c:	0f b6 92 64 0b 00 00 	movzbl 0xb64(%edx),%edx
 743:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 747:	89 ca                	mov    %ecx,%edx
 749:	89 c1                	mov    %eax,%ecx
 74b:	39 d6                	cmp    %edx,%esi
 74d:	76 df                	jbe    72e <printint+0x2e>
  if(neg)
 74f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 753:	74 31                	je     786 <printint+0x86>
    buf[i++] = '-';
 755:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 75a:	8d 5f 02             	lea    0x2(%edi),%ebx
 75d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 760:	eb 17                	jmp    779 <printint+0x79>
    x = xx;
 762:	89 c1                	mov    %eax,%ecx
  neg = 0;
 764:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 76b:	eb bc                	jmp    729 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 76d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 772:	89 f0                	mov    %esi,%eax
 774:	e8 6d ff ff ff       	call   6e6 <putc>
  while(--i >= 0)
 779:	83 eb 01             	sub    $0x1,%ebx
 77c:	79 ef                	jns    76d <printint+0x6d>
}
 77e:	83 c4 2c             	add    $0x2c,%esp
 781:	5b                   	pop    %ebx
 782:	5e                   	pop    %esi
 783:	5f                   	pop    %edi
 784:	5d                   	pop    %ebp
 785:	c3                   	ret    
 786:	8b 75 d0             	mov    -0x30(%ebp),%esi
 789:	eb ee                	jmp    779 <printint+0x79>

0000078b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 78b:	55                   	push   %ebp
 78c:	89 e5                	mov    %esp,%ebp
 78e:	57                   	push   %edi
 78f:	56                   	push   %esi
 790:	53                   	push   %ebx
 791:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 794:	8d 45 10             	lea    0x10(%ebp),%eax
 797:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 79a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 79f:	bb 00 00 00 00       	mov    $0x0,%ebx
 7a4:	eb 14                	jmp    7ba <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7a6:	89 fa                	mov    %edi,%edx
 7a8:	8b 45 08             	mov    0x8(%ebp),%eax
 7ab:	e8 36 ff ff ff       	call   6e6 <putc>
 7b0:	eb 05                	jmp    7b7 <printf+0x2c>
      }
    } else if(state == '%'){
 7b2:	83 fe 25             	cmp    $0x25,%esi
 7b5:	74 25                	je     7dc <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7b7:	83 c3 01             	add    $0x1,%ebx
 7ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 7bd:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7c1:	84 c0                	test   %al,%al
 7c3:	0f 84 20 01 00 00    	je     8e9 <printf+0x15e>
    c = fmt[i] & 0xff;
 7c9:	0f be f8             	movsbl %al,%edi
 7cc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7cf:	85 f6                	test   %esi,%esi
 7d1:	75 df                	jne    7b2 <printf+0x27>
      if(c == '%'){
 7d3:	83 f8 25             	cmp    $0x25,%eax
 7d6:	75 ce                	jne    7a6 <printf+0x1b>
        state = '%';
 7d8:	89 c6                	mov    %eax,%esi
 7da:	eb db                	jmp    7b7 <printf+0x2c>
      if(c == 'd'){
 7dc:	83 f8 25             	cmp    $0x25,%eax
 7df:	0f 84 cf 00 00 00    	je     8b4 <printf+0x129>
 7e5:	0f 8c dd 00 00 00    	jl     8c8 <printf+0x13d>
 7eb:	83 f8 78             	cmp    $0x78,%eax
 7ee:	0f 8f d4 00 00 00    	jg     8c8 <printf+0x13d>
 7f4:	83 f8 63             	cmp    $0x63,%eax
 7f7:	0f 8c cb 00 00 00    	jl     8c8 <printf+0x13d>
 7fd:	83 e8 63             	sub    $0x63,%eax
 800:	83 f8 15             	cmp    $0x15,%eax
 803:	0f 87 bf 00 00 00    	ja     8c8 <printf+0x13d>
 809:	ff 24 85 0c 0b 00 00 	jmp    *0xb0c(,%eax,4)
        printint(fd, *ap, 10, 1);
 810:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 813:	8b 17                	mov    (%edi),%edx
 815:	83 ec 0c             	sub    $0xc,%esp
 818:	6a 01                	push   $0x1
 81a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 81f:	8b 45 08             	mov    0x8(%ebp),%eax
 822:	e8 d9 fe ff ff       	call   700 <printint>
        ap++;
 827:	83 c7 04             	add    $0x4,%edi
 82a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 830:	be 00 00 00 00       	mov    $0x0,%esi
 835:	eb 80                	jmp    7b7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 837:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83a:	8b 17                	mov    (%edi),%edx
 83c:	83 ec 0c             	sub    $0xc,%esp
 83f:	6a 00                	push   $0x0
 841:	b9 10 00 00 00       	mov    $0x10,%ecx
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	e8 b2 fe ff ff       	call   700 <printint>
        ap++;
 84e:	83 c7 04             	add    $0x4,%edi
 851:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 854:	83 c4 10             	add    $0x10,%esp
      state = 0;
 857:	be 00 00 00 00       	mov    $0x0,%esi
 85c:	e9 56 ff ff ff       	jmp    7b7 <printf+0x2c>
        s = (char*)*ap;
 861:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 864:	8b 30                	mov    (%eax),%esi
        ap++;
 866:	83 c0 04             	add    $0x4,%eax
 869:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 86c:	85 f6                	test   %esi,%esi
 86e:	75 15                	jne    885 <printf+0xfa>
          s = "(null)";
 870:	be 05 0b 00 00       	mov    $0xb05,%esi
 875:	eb 0e                	jmp    885 <printf+0xfa>
          putc(fd, *s);
 877:	0f be d2             	movsbl %dl,%edx
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	e8 64 fe ff ff       	call   6e6 <putc>
          s++;
 882:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 885:	0f b6 16             	movzbl (%esi),%edx
 888:	84 d2                	test   %dl,%dl
 88a:	75 eb                	jne    877 <printf+0xec>
      state = 0;
 88c:	be 00 00 00 00       	mov    $0x0,%esi
 891:	e9 21 ff ff ff       	jmp    7b7 <printf+0x2c>
        putc(fd, *ap);
 896:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 899:	0f be 17             	movsbl (%edi),%edx
 89c:	8b 45 08             	mov    0x8(%ebp),%eax
 89f:	e8 42 fe ff ff       	call   6e6 <putc>
        ap++;
 8a4:	83 c7 04             	add    $0x4,%edi
 8a7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8aa:	be 00 00 00 00       	mov    $0x0,%esi
 8af:	e9 03 ff ff ff       	jmp    7b7 <printf+0x2c>
        putc(fd, c);
 8b4:	89 fa                	mov    %edi,%edx
 8b6:	8b 45 08             	mov    0x8(%ebp),%eax
 8b9:	e8 28 fe ff ff       	call   6e6 <putc>
      state = 0;
 8be:	be 00 00 00 00       	mov    $0x0,%esi
 8c3:	e9 ef fe ff ff       	jmp    7b7 <printf+0x2c>
        putc(fd, '%');
 8c8:	ba 25 00 00 00       	mov    $0x25,%edx
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	e8 11 fe ff ff       	call   6e6 <putc>
        putc(fd, c);
 8d5:	89 fa                	mov    %edi,%edx
 8d7:	8b 45 08             	mov    0x8(%ebp),%eax
 8da:	e8 07 fe ff ff       	call   6e6 <putc>
      state = 0;
 8df:	be 00 00 00 00       	mov    $0x0,%esi
 8e4:	e9 ce fe ff ff       	jmp    7b7 <printf+0x2c>
    }
  }
}
 8e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ec:	5b                   	pop    %ebx
 8ed:	5e                   	pop    %esi
 8ee:	5f                   	pop    %edi
 8ef:	5d                   	pop    %ebp
 8f0:	c3                   	ret    

000008f1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f1:	55                   	push   %ebp
 8f2:	89 e5                	mov    %esp,%ebp
 8f4:	57                   	push   %edi
 8f5:	56                   	push   %esi
 8f6:	53                   	push   %ebx
 8f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8fa:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8fd:	a1 10 0f 00 00       	mov    0xf10,%eax
 902:	eb 02                	jmp    906 <free+0x15>
 904:	89 d0                	mov    %edx,%eax
 906:	39 c8                	cmp    %ecx,%eax
 908:	73 04                	jae    90e <free+0x1d>
 90a:	39 08                	cmp    %ecx,(%eax)
 90c:	77 12                	ja     920 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90e:	8b 10                	mov    (%eax),%edx
 910:	39 c2                	cmp    %eax,%edx
 912:	77 f0                	ja     904 <free+0x13>
 914:	39 c8                	cmp    %ecx,%eax
 916:	72 08                	jb     920 <free+0x2f>
 918:	39 ca                	cmp    %ecx,%edx
 91a:	77 04                	ja     920 <free+0x2f>
 91c:	89 d0                	mov    %edx,%eax
 91e:	eb e6                	jmp    906 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 920:	8b 73 fc             	mov    -0x4(%ebx),%esi
 923:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 926:	8b 10                	mov    (%eax),%edx
 928:	39 d7                	cmp    %edx,%edi
 92a:	74 19                	je     945 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 92c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 92f:	8b 50 04             	mov    0x4(%eax),%edx
 932:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 935:	39 ce                	cmp    %ecx,%esi
 937:	74 1b                	je     954 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 939:	89 08                	mov    %ecx,(%eax)
  freep = p;
 93b:	a3 10 0f 00 00       	mov    %eax,0xf10
}
 940:	5b                   	pop    %ebx
 941:	5e                   	pop    %esi
 942:	5f                   	pop    %edi
 943:	5d                   	pop    %ebp
 944:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 945:	03 72 04             	add    0x4(%edx),%esi
 948:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 94b:	8b 10                	mov    (%eax),%edx
 94d:	8b 12                	mov    (%edx),%edx
 94f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 952:	eb db                	jmp    92f <free+0x3e>
    p->s.size += bp->s.size;
 954:	03 53 fc             	add    -0x4(%ebx),%edx
 957:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 95d:	89 10                	mov    %edx,(%eax)
 95f:	eb da                	jmp    93b <free+0x4a>

00000961 <morecore>:

static Header*
morecore(uint nu)
{
 961:	55                   	push   %ebp
 962:	89 e5                	mov    %esp,%ebp
 964:	53                   	push   %ebx
 965:	83 ec 04             	sub    $0x4,%esp
 968:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 96a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 96f:	77 05                	ja     976 <morecore+0x15>
    nu = 4096;
 971:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 976:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 97d:	83 ec 0c             	sub    $0xc,%esp
 980:	50                   	push   %eax
 981:	e8 38 fd ff ff       	call   6be <sbrk>
  if(p == (char*)-1)
 986:	83 c4 10             	add    $0x10,%esp
 989:	83 f8 ff             	cmp    $0xffffffff,%eax
 98c:	74 1c                	je     9aa <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 98e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 991:	83 c0 08             	add    $0x8,%eax
 994:	83 ec 0c             	sub    $0xc,%esp
 997:	50                   	push   %eax
 998:	e8 54 ff ff ff       	call   8f1 <free>
  return freep;
 99d:	a1 10 0f 00 00       	mov    0xf10,%eax
 9a2:	83 c4 10             	add    $0x10,%esp
}
 9a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9a8:	c9                   	leave  
 9a9:	c3                   	ret    
    return 0;
 9aa:	b8 00 00 00 00       	mov    $0x0,%eax
 9af:	eb f4                	jmp    9a5 <morecore+0x44>

000009b1 <malloc>:

void*
malloc(uint nbytes)
{
 9b1:	55                   	push   %ebp
 9b2:	89 e5                	mov    %esp,%ebp
 9b4:	53                   	push   %ebx
 9b5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b8:	8b 45 08             	mov    0x8(%ebp),%eax
 9bb:	8d 58 07             	lea    0x7(%eax),%ebx
 9be:	c1 eb 03             	shr    $0x3,%ebx
 9c1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9c4:	8b 0d 10 0f 00 00    	mov    0xf10,%ecx
 9ca:	85 c9                	test   %ecx,%ecx
 9cc:	74 04                	je     9d2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ce:	8b 01                	mov    (%ecx),%eax
 9d0:	eb 4a                	jmp    a1c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9d2:	c7 05 10 0f 00 00 14 	movl   $0xf14,0xf10
 9d9:	0f 00 00 
 9dc:	c7 05 14 0f 00 00 14 	movl   $0xf14,0xf14
 9e3:	0f 00 00 
    base.s.size = 0;
 9e6:	c7 05 18 0f 00 00 00 	movl   $0x0,0xf18
 9ed:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9f0:	b9 14 0f 00 00       	mov    $0xf14,%ecx
 9f5:	eb d7                	jmp    9ce <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9f7:	74 19                	je     a12 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9f9:	29 da                	sub    %ebx,%edx
 9fb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9fe:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a01:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a04:	89 0d 10 0f 00 00    	mov    %ecx,0xf10
      return (void*)(p + 1);
 a0a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a0d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a10:	c9                   	leave  
 a11:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a12:	8b 10                	mov    (%eax),%edx
 a14:	89 11                	mov    %edx,(%ecx)
 a16:	eb ec                	jmp    a04 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a18:	89 c1                	mov    %eax,%ecx
 a1a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a1c:	8b 50 04             	mov    0x4(%eax),%edx
 a1f:	39 da                	cmp    %ebx,%edx
 a21:	73 d4                	jae    9f7 <malloc+0x46>
    if(p == freep)
 a23:	39 05 10 0f 00 00    	cmp    %eax,0xf10
 a29:	75 ed                	jne    a18 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a2b:	89 d8                	mov    %ebx,%eax
 a2d:	e8 2f ff ff ff       	call   961 <morecore>
 a32:	85 c0                	test   %eax,%eax
 a34:	75 e2                	jne    a18 <malloc+0x67>
 a36:	eb d5                	jmp    a0d <malloc+0x5c>
