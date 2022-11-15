
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
  1c:	a1 0c 0f 00 00       	mov    0xf0c,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 3c 0a 00 00       	push   $0xa3c
  31:	68 46 0a 00 00       	push   $0xa46
  36:	6a 01                	push   $0x1
  38:	e8 4f 07 00 00       	call   78c <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 8d 0a 00 00       	push   $0xa8d
  45:	68 5d 0a 00 00       	push   $0xa5d
  4a:	6a 01                	push   $0x1
  4c:	e8 3b 07 00 00       	call   78c <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 71 0a 00 00       	push   $0xa71
  59:	6a 01                	push   $0x1
  5b:	e8 2c 07 00 00       	call   78c <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 10 0f 00 00    	push   0xf10
  69:	e8 f9 05 00 00       	call   667 <kill>
  6e:	e8 c4 05 00 00       	call   637 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 3c 0a 00 00       	push   $0xa3c
  7a:	68 46 0a 00 00       	push   $0xa46
  7f:	6a 01                	push   $0x1
  81:	e8 06 07 00 00       	call   78c <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 4e 0a 00 00       	push   $0xa4e
  8e:	68 5d 0a 00 00       	push   $0xa5d
  93:	6a 01                	push   $0x1
  95:	e8 f2 06 00 00       	call   78c <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 71 0a 00 00       	push   $0xa71
  a2:	6a 01                	push   $0x1
  a4:	e8 e3 06 00 00       	call   78c <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 10 0f 00 00    	push   0xf10
  b2:	e8 b0 05 00 00       	call   667 <kill>
  b7:	e8 7b 05 00 00       	call   637 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 3c 0a 00 00       	push   $0xa3c
  c3:	68 46 0a 00 00       	push   $0xa46
  c8:	6a 01                	push   $0x1
  ca:	e8 bd 06 00 00       	call   78c <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 7e 0a 00 00       	push   $0xa7e
  d7:	68 5d 0a 00 00       	push   $0xa5d
  dc:	6a 01                	push   $0x1
  de:	e8 a9 06 00 00       	call   78c <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 71 0a 00 00       	push   $0xa71
  eb:	6a 01                	push   $0x1
  ed:	e8 9a 06 00 00       	call   78c <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 10 0f 00 00    	push   0xf10
  fb:	e8 67 05 00 00       	call   667 <kill>
 100:	e8 32 05 00 00       	call   637 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 0c 0f 00 00       	mov    %eax,0xf0c
   exit();
 10d:	e8 25 05 00 00       	call   637 <exit>

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
 137:	a1 0c 0f 00 00       	mov    0xf0c,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 3c 0a 00 00       	push   $0xa3c
 14c:	68 46 0a 00 00       	push   $0xa46
 151:	6a 01                	push   $0x1
 153:	e8 34 06 00 00       	call   78c <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 99 0a 00 00       	push   $0xa99
 160:	68 5d 0a 00 00       	push   $0xa5d
 165:	6a 01                	push   $0x1
 167:	e8 20 06 00 00       	call   78c <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 71 0a 00 00       	push   $0xa71
 174:	6a 01                	push   $0x1
 176:	e8 11 06 00 00       	call   78c <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 10 0f 00 00    	push   0xf10
 184:	e8 de 04 00 00       	call   667 <kill>
 189:	e8 a9 04 00 00       	call   637 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 3c 0a 00 00       	push   $0xa3c
 195:	68 46 0a 00 00       	push   $0xa46
 19a:	6a 01                	push   $0x1
 19c:	e8 eb 05 00 00       	call   78c <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 4e 0a 00 00       	push   $0xa4e
 1a9:	68 5d 0a 00 00       	push   $0xa5d
 1ae:	6a 01                	push   $0x1
 1b0:	e8 d7 05 00 00       	call   78c <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 71 0a 00 00       	push   $0xa71
 1bd:	6a 01                	push   $0x1
 1bf:	e8 c8 05 00 00       	call   78c <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 10 0f 00 00    	push   0xf10
 1cd:	e8 95 04 00 00       	call   667 <kill>
 1d2:	e8 60 04 00 00       	call   637 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 3c 0a 00 00       	push   $0xa3c
 1de:	68 46 0a 00 00       	push   $0xa46
 1e3:	6a 01                	push   $0x1
 1e5:	e8 a2 05 00 00       	call   78c <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 7e 0a 00 00       	push   $0xa7e
 1f2:	68 5d 0a 00 00       	push   $0xa5d
 1f7:	6a 01                	push   $0x1
 1f9:	e8 8e 05 00 00       	call   78c <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 71 0a 00 00       	push   $0xa71
 206:	6a 01                	push   $0x1
 208:	e8 7f 05 00 00       	call   78c <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 10 0f 00 00    	push   0xf10
 216:	e8 4c 04 00 00       	call   667 <kill>
 21b:	e8 17 04 00 00       	call   637 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 0c 0f 00 00       	mov    %eax,0xf0c
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
 23f:	e8 c4 03 00 00       	call   608 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 3c 0a 00 00       	push   $0xa3c
 252:	68 46 0a 00 00       	push   $0xa46
 257:	6a 01                	push   $0x1
 259:	e8 2e 05 00 00       	call   78c <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 e4 0a 00 00       	push   $0xae4
 266:	68 5d 0a 00 00       	push   $0xa5d
 26b:	6a 01                	push   $0x1
 26d:	e8 1a 05 00 00       	call   78c <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 71 0a 00 00       	push   $0xa71
 27a:	6a 01                	push   $0x1
 27c:	e8 0b 05 00 00       	call   78c <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 10 0f 00 00    	push   0xf10
 28a:	e8 d8 03 00 00       	call   667 <kill>
 28f:	e8 a3 03 00 00       	call   637 <exit>
   exit();
 294:	e8 9e 03 00 00       	call   637 <exit>

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
 2ab:	e8 07 04 00 00       	call   6b7 <getpid>
 2b0:	a3 10 0f 00 00       	mov    %eax,0xf10
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
 2e1:	e8 22 03 00 00       	call   608 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d 0c 0f 00 00 03 	cmpl   $0x3,0xf0c
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 3c 0a 00 00       	push   $0xa3c
 302:	68 46 0a 00 00       	push   $0xa46
 307:	6a 01                	push   $0x1
 309:	e8 7e 04 00 00       	call   78c <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 cb 0a 00 00       	push   $0xacb
 316:	68 5d 0a 00 00       	push   $0xa5d
 31b:	6a 01                	push   $0x1
 31d:	e8 6a 04 00 00       	call   78c <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 71 0a 00 00       	push   $0xa71
 32a:	6a 01                	push   $0x1
 32c:	e8 5b 04 00 00       	call   78c <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 10 0f 00 00    	push   0xf10
 33a:	e8 28 03 00 00       	call   667 <kill>
 33f:	e8 f3 02 00 00       	call   637 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 3c 0a 00 00       	push   $0xa3c
 34b:	68 46 0a 00 00       	push   $0xa46
 350:	6a 01                	push   $0x1
 352:	e8 35 04 00 00       	call   78c <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 a5 0a 00 00       	push   $0xaa5
 35f:	68 5d 0a 00 00       	push   $0xa5d
 364:	6a 01                	push   $0x1
 366:	e8 21 04 00 00       	call   78c <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 71 0a 00 00       	push   $0xa71
 373:	6a 01                	push   $0x1
 375:	e8 12 04 00 00       	call   78c <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 10 0f 00 00    	push   0xf10
 383:	e8 df 02 00 00       	call   667 <kill>
 388:	e8 aa 02 00 00       	call   637 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 3c 0a 00 00       	push   $0xa3c
 394:	68 46 0a 00 00       	push   $0xa46
 399:	6a 01                	push   $0x1
 39b:	e8 ec 03 00 00       	call   78c <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 b4 0a 00 00       	push   $0xab4
 3a8:	68 5d 0a 00 00       	push   $0xa5d
 3ad:	6a 01                	push   $0x1
 3af:	e8 d8 03 00 00       	call   78c <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 71 0a 00 00       	push   $0xa71
 3bc:	6a 01                	push   $0x1
 3be:	e8 c9 03 00 00       	call   78c <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 10 0f 00 00    	push   0xf10
 3cc:	e8 96 02 00 00       	call   667 <kill>
 3d1:	e8 61 02 00 00       	call   637 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 d7 0a 00 00       	push   $0xad7
 3de:	6a 01                	push   $0x1
 3e0:	e8 a7 03 00 00       	call   78c <printf>
   exit();
 3e5:	e8 4d 02 00 00       	call   637 <exit>

000003ea <strcpy>:
#include "x86.h"
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
 4b0:	e8 9a 01 00 00       	call   64f <read>
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
 4ee:	e8 84 01 00 00       	call   677 <open>
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
 503:	e8 87 01 00 00       	call   68f <fstat>
 508:	89 c6                	mov    %eax,%esi
  close(fd);
 50a:	89 1c 24             	mov    %ebx,(%esp)
 50d:	e8 4d 01 00 00       	call   65f <close>
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
 5db:	e8 d2 03 00 00       	call   9b2 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 5e0:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 5e3:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 5e5:	eb 03                	jmp    5ea <thread_create+0x1a>
      stack += 1;
 5e7:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 5ea:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 5f0:	75 f5                	jne    5e7 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 5f2:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 5f4:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 5f7:	52                   	push   %edx
 5f8:	ff 75 10             	push   0x10(%ebp)
 5fb:	ff 75 0c             	push   0xc(%ebp)
 5fe:	ff 75 08             	push   0x8(%ebp)
 601:	e8 d1 00 00 00       	call   6d7 <clone>
 
    return pid;
}
 606:	c9                   	leave  
 607:	c3                   	ret    

00000608 <thread_join>:
int 
thread_join(){
 608:	55                   	push   %ebp
 609:	89 e5                	mov    %esp,%ebp
 60b:	53                   	push   %ebx
 60c:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 60f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 612:	50                   	push   %eax
 613:	e8 c7 00 00 00       	call   6df <join>
 618:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 61a:	83 c4 04             	add    $0x4,%esp
 61d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 620:	ff 70 fc             	push   -0x4(%eax)
 623:	e8 ca 02 00 00       	call   8f2 <free>
  return waitedForPID;
 628:	89 d8                	mov    %ebx,%eax
 62a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 62d:	c9                   	leave  
 62e:	c3                   	ret    

0000062f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 62f:	b8 01 00 00 00       	mov    $0x1,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret    

00000637 <exit>:
SYSCALL(exit)
 637:	b8 02 00 00 00       	mov    $0x2,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret    

0000063f <wait>:
SYSCALL(wait)
 63f:	b8 03 00 00 00       	mov    $0x3,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <pipe>:
SYSCALL(pipe)
 647:	b8 04 00 00 00       	mov    $0x4,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <read>:
SYSCALL(read)
 64f:	b8 05 00 00 00       	mov    $0x5,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <write>:
SYSCALL(write)
 657:	b8 10 00 00 00       	mov    $0x10,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <close>:
SYSCALL(close)
 65f:	b8 15 00 00 00       	mov    $0x15,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret    

00000667 <kill>:
SYSCALL(kill)
 667:	b8 06 00 00 00       	mov    $0x6,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret    

0000066f <exec>:
SYSCALL(exec)
 66f:	b8 07 00 00 00       	mov    $0x7,%eax
 674:	cd 40                	int    $0x40
 676:	c3                   	ret    

00000677 <open>:
SYSCALL(open)
 677:	b8 0f 00 00 00       	mov    $0xf,%eax
 67c:	cd 40                	int    $0x40
 67e:	c3                   	ret    

0000067f <mknod>:
SYSCALL(mknod)
 67f:	b8 11 00 00 00       	mov    $0x11,%eax
 684:	cd 40                	int    $0x40
 686:	c3                   	ret    

00000687 <unlink>:
SYSCALL(unlink)
 687:	b8 12 00 00 00       	mov    $0x12,%eax
 68c:	cd 40                	int    $0x40
 68e:	c3                   	ret    

0000068f <fstat>:
SYSCALL(fstat)
 68f:	b8 08 00 00 00       	mov    $0x8,%eax
 694:	cd 40                	int    $0x40
 696:	c3                   	ret    

00000697 <link>:
SYSCALL(link)
 697:	b8 13 00 00 00       	mov    $0x13,%eax
 69c:	cd 40                	int    $0x40
 69e:	c3                   	ret    

0000069f <mkdir>:
SYSCALL(mkdir)
 69f:	b8 14 00 00 00       	mov    $0x14,%eax
 6a4:	cd 40                	int    $0x40
 6a6:	c3                   	ret    

000006a7 <chdir>:
SYSCALL(chdir)
 6a7:	b8 09 00 00 00       	mov    $0x9,%eax
 6ac:	cd 40                	int    $0x40
 6ae:	c3                   	ret    

000006af <dup>:
SYSCALL(dup)
 6af:	b8 0a 00 00 00       	mov    $0xa,%eax
 6b4:	cd 40                	int    $0x40
 6b6:	c3                   	ret    

000006b7 <getpid>:
SYSCALL(getpid)
 6b7:	b8 0b 00 00 00       	mov    $0xb,%eax
 6bc:	cd 40                	int    $0x40
 6be:	c3                   	ret    

000006bf <sbrk>:
SYSCALL(sbrk)
 6bf:	b8 0c 00 00 00       	mov    $0xc,%eax
 6c4:	cd 40                	int    $0x40
 6c6:	c3                   	ret    

000006c7 <sleep>:
SYSCALL(sleep)
 6c7:	b8 0d 00 00 00       	mov    $0xd,%eax
 6cc:	cd 40                	int    $0x40
 6ce:	c3                   	ret    

000006cf <uptime>:
SYSCALL(uptime)
 6cf:	b8 0e 00 00 00       	mov    $0xe,%eax
 6d4:	cd 40                	int    $0x40
 6d6:	c3                   	ret    

000006d7 <clone>:
SYSCALL(clone)
 6d7:	b8 16 00 00 00       	mov    $0x16,%eax
 6dc:	cd 40                	int    $0x40
 6de:	c3                   	ret    

000006df <join>:
SYSCALL(join)
 6df:	b8 17 00 00 00       	mov    $0x17,%eax
 6e4:	cd 40                	int    $0x40
 6e6:	c3                   	ret    

000006e7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6e7:	55                   	push   %ebp
 6e8:	89 e5                	mov    %esp,%ebp
 6ea:	83 ec 1c             	sub    $0x1c,%esp
 6ed:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6f0:	6a 01                	push   $0x1
 6f2:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6f5:	52                   	push   %edx
 6f6:	50                   	push   %eax
 6f7:	e8 5b ff ff ff       	call   657 <write>
}
 6fc:	83 c4 10             	add    $0x10,%esp
 6ff:	c9                   	leave  
 700:	c3                   	ret    

00000701 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 701:	55                   	push   %ebp
 702:	89 e5                	mov    %esp,%ebp
 704:	57                   	push   %edi
 705:	56                   	push   %esi
 706:	53                   	push   %ebx
 707:	83 ec 2c             	sub    $0x2c,%esp
 70a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 70d:	89 d0                	mov    %edx,%eax
 70f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 711:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 715:	0f 95 c1             	setne  %cl
 718:	c1 ea 1f             	shr    $0x1f,%edx
 71b:	84 d1                	test   %dl,%cl
 71d:	74 44                	je     763 <printint+0x62>
    neg = 1;
    x = -xx;
 71f:	f7 d8                	neg    %eax
 721:	89 c1                	mov    %eax,%ecx
    neg = 1;
 723:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 72a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 72f:	89 c8                	mov    %ecx,%eax
 731:	ba 00 00 00 00       	mov    $0x0,%edx
 736:	f7 f6                	div    %esi
 738:	89 df                	mov    %ebx,%edi
 73a:	83 c3 01             	add    $0x1,%ebx
 73d:	0f b6 92 68 0b 00 00 	movzbl 0xb68(%edx),%edx
 744:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 748:	89 ca                	mov    %ecx,%edx
 74a:	89 c1                	mov    %eax,%ecx
 74c:	39 d6                	cmp    %edx,%esi
 74e:	76 df                	jbe    72f <printint+0x2e>
  if(neg)
 750:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 754:	74 31                	je     787 <printint+0x86>
    buf[i++] = '-';
 756:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 75b:	8d 5f 02             	lea    0x2(%edi),%ebx
 75e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 761:	eb 17                	jmp    77a <printint+0x79>
    x = xx;
 763:	89 c1                	mov    %eax,%ecx
  neg = 0;
 765:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 76c:	eb bc                	jmp    72a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 76e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 773:	89 f0                	mov    %esi,%eax
 775:	e8 6d ff ff ff       	call   6e7 <putc>
  while(--i >= 0)
 77a:	83 eb 01             	sub    $0x1,%ebx
 77d:	79 ef                	jns    76e <printint+0x6d>
}
 77f:	83 c4 2c             	add    $0x2c,%esp
 782:	5b                   	pop    %ebx
 783:	5e                   	pop    %esi
 784:	5f                   	pop    %edi
 785:	5d                   	pop    %ebp
 786:	c3                   	ret    
 787:	8b 75 d0             	mov    -0x30(%ebp),%esi
 78a:	eb ee                	jmp    77a <printint+0x79>

0000078c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 78c:	55                   	push   %ebp
 78d:	89 e5                	mov    %esp,%ebp
 78f:	57                   	push   %edi
 790:	56                   	push   %esi
 791:	53                   	push   %ebx
 792:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 795:	8d 45 10             	lea    0x10(%ebp),%eax
 798:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 79b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7a0:	bb 00 00 00 00       	mov    $0x0,%ebx
 7a5:	eb 14                	jmp    7bb <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7a7:	89 fa                	mov    %edi,%edx
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ac:	e8 36 ff ff ff       	call   6e7 <putc>
 7b1:	eb 05                	jmp    7b8 <printf+0x2c>
      }
    } else if(state == '%'){
 7b3:	83 fe 25             	cmp    $0x25,%esi
 7b6:	74 25                	je     7dd <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7b8:	83 c3 01             	add    $0x1,%ebx
 7bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 7be:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7c2:	84 c0                	test   %al,%al
 7c4:	0f 84 20 01 00 00    	je     8ea <printf+0x15e>
    c = fmt[i] & 0xff;
 7ca:	0f be f8             	movsbl %al,%edi
 7cd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7d0:	85 f6                	test   %esi,%esi
 7d2:	75 df                	jne    7b3 <printf+0x27>
      if(c == '%'){
 7d4:	83 f8 25             	cmp    $0x25,%eax
 7d7:	75 ce                	jne    7a7 <printf+0x1b>
        state = '%';
 7d9:	89 c6                	mov    %eax,%esi
 7db:	eb db                	jmp    7b8 <printf+0x2c>
      if(c == 'd'){
 7dd:	83 f8 25             	cmp    $0x25,%eax
 7e0:	0f 84 cf 00 00 00    	je     8b5 <printf+0x129>
 7e6:	0f 8c dd 00 00 00    	jl     8c9 <printf+0x13d>
 7ec:	83 f8 78             	cmp    $0x78,%eax
 7ef:	0f 8f d4 00 00 00    	jg     8c9 <printf+0x13d>
 7f5:	83 f8 63             	cmp    $0x63,%eax
 7f8:	0f 8c cb 00 00 00    	jl     8c9 <printf+0x13d>
 7fe:	83 e8 63             	sub    $0x63,%eax
 801:	83 f8 15             	cmp    $0x15,%eax
 804:	0f 87 bf 00 00 00    	ja     8c9 <printf+0x13d>
 80a:	ff 24 85 10 0b 00 00 	jmp    *0xb10(,%eax,4)
        printint(fd, *ap, 10, 1);
 811:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 814:	8b 17                	mov    (%edi),%edx
 816:	83 ec 0c             	sub    $0xc,%esp
 819:	6a 01                	push   $0x1
 81b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 820:	8b 45 08             	mov    0x8(%ebp),%eax
 823:	e8 d9 fe ff ff       	call   701 <printint>
        ap++;
 828:	83 c7 04             	add    $0x4,%edi
 82b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 831:	be 00 00 00 00       	mov    $0x0,%esi
 836:	eb 80                	jmp    7b8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 838:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83b:	8b 17                	mov    (%edi),%edx
 83d:	83 ec 0c             	sub    $0xc,%esp
 840:	6a 00                	push   $0x0
 842:	b9 10 00 00 00       	mov    $0x10,%ecx
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	e8 b2 fe ff ff       	call   701 <printint>
        ap++;
 84f:	83 c7 04             	add    $0x4,%edi
 852:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 855:	83 c4 10             	add    $0x10,%esp
      state = 0;
 858:	be 00 00 00 00       	mov    $0x0,%esi
 85d:	e9 56 ff ff ff       	jmp    7b8 <printf+0x2c>
        s = (char*)*ap;
 862:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 865:	8b 30                	mov    (%eax),%esi
        ap++;
 867:	83 c0 04             	add    $0x4,%eax
 86a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 86d:	85 f6                	test   %esi,%esi
 86f:	75 15                	jne    886 <printf+0xfa>
          s = "(null)";
 871:	be 09 0b 00 00       	mov    $0xb09,%esi
 876:	eb 0e                	jmp    886 <printf+0xfa>
          putc(fd, *s);
 878:	0f be d2             	movsbl %dl,%edx
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	e8 64 fe ff ff       	call   6e7 <putc>
          s++;
 883:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 886:	0f b6 16             	movzbl (%esi),%edx
 889:	84 d2                	test   %dl,%dl
 88b:	75 eb                	jne    878 <printf+0xec>
      state = 0;
 88d:	be 00 00 00 00       	mov    $0x0,%esi
 892:	e9 21 ff ff ff       	jmp    7b8 <printf+0x2c>
        putc(fd, *ap);
 897:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 89a:	0f be 17             	movsbl (%edi),%edx
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	e8 42 fe ff ff       	call   6e7 <putc>
        ap++;
 8a5:	83 c7 04             	add    $0x4,%edi
 8a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8ab:	be 00 00 00 00       	mov    $0x0,%esi
 8b0:	e9 03 ff ff ff       	jmp    7b8 <printf+0x2c>
        putc(fd, c);
 8b5:	89 fa                	mov    %edi,%edx
 8b7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ba:	e8 28 fe ff ff       	call   6e7 <putc>
      state = 0;
 8bf:	be 00 00 00 00       	mov    $0x0,%esi
 8c4:	e9 ef fe ff ff       	jmp    7b8 <printf+0x2c>
        putc(fd, '%');
 8c9:	ba 25 00 00 00       	mov    $0x25,%edx
 8ce:	8b 45 08             	mov    0x8(%ebp),%eax
 8d1:	e8 11 fe ff ff       	call   6e7 <putc>
        putc(fd, c);
 8d6:	89 fa                	mov    %edi,%edx
 8d8:	8b 45 08             	mov    0x8(%ebp),%eax
 8db:	e8 07 fe ff ff       	call   6e7 <putc>
      state = 0;
 8e0:	be 00 00 00 00       	mov    $0x0,%esi
 8e5:	e9 ce fe ff ff       	jmp    7b8 <printf+0x2c>
    }
  }
}
 8ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ed:	5b                   	pop    %ebx
 8ee:	5e                   	pop    %esi
 8ef:	5f                   	pop    %edi
 8f0:	5d                   	pop    %ebp
 8f1:	c3                   	ret    

000008f2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f2:	55                   	push   %ebp
 8f3:	89 e5                	mov    %esp,%ebp
 8f5:	57                   	push   %edi
 8f6:	56                   	push   %esi
 8f7:	53                   	push   %ebx
 8f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8fb:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8fe:	a1 14 0f 00 00       	mov    0xf14,%eax
 903:	eb 02                	jmp    907 <free+0x15>
 905:	89 d0                	mov    %edx,%eax
 907:	39 c8                	cmp    %ecx,%eax
 909:	73 04                	jae    90f <free+0x1d>
 90b:	39 08                	cmp    %ecx,(%eax)
 90d:	77 12                	ja     921 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90f:	8b 10                	mov    (%eax),%edx
 911:	39 c2                	cmp    %eax,%edx
 913:	77 f0                	ja     905 <free+0x13>
 915:	39 c8                	cmp    %ecx,%eax
 917:	72 08                	jb     921 <free+0x2f>
 919:	39 ca                	cmp    %ecx,%edx
 91b:	77 04                	ja     921 <free+0x2f>
 91d:	89 d0                	mov    %edx,%eax
 91f:	eb e6                	jmp    907 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 921:	8b 73 fc             	mov    -0x4(%ebx),%esi
 924:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 927:	8b 10                	mov    (%eax),%edx
 929:	39 d7                	cmp    %edx,%edi
 92b:	74 19                	je     946 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 92d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 930:	8b 50 04             	mov    0x4(%eax),%edx
 933:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 936:	39 ce                	cmp    %ecx,%esi
 938:	74 1b                	je     955 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 93a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 93c:	a3 14 0f 00 00       	mov    %eax,0xf14
}
 941:	5b                   	pop    %ebx
 942:	5e                   	pop    %esi
 943:	5f                   	pop    %edi
 944:	5d                   	pop    %ebp
 945:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 946:	03 72 04             	add    0x4(%edx),%esi
 949:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 94c:	8b 10                	mov    (%eax),%edx
 94e:	8b 12                	mov    (%edx),%edx
 950:	89 53 f8             	mov    %edx,-0x8(%ebx)
 953:	eb db                	jmp    930 <free+0x3e>
    p->s.size += bp->s.size;
 955:	03 53 fc             	add    -0x4(%ebx),%edx
 958:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 95e:	89 10                	mov    %edx,(%eax)
 960:	eb da                	jmp    93c <free+0x4a>

00000962 <morecore>:

static Header*
morecore(uint nu)
{
 962:	55                   	push   %ebp
 963:	89 e5                	mov    %esp,%ebp
 965:	53                   	push   %ebx
 966:	83 ec 04             	sub    $0x4,%esp
 969:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 96b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 970:	77 05                	ja     977 <morecore+0x15>
    nu = 4096;
 972:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 977:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 97e:	83 ec 0c             	sub    $0xc,%esp
 981:	50                   	push   %eax
 982:	e8 38 fd ff ff       	call   6bf <sbrk>
  if(p == (char*)-1)
 987:	83 c4 10             	add    $0x10,%esp
 98a:	83 f8 ff             	cmp    $0xffffffff,%eax
 98d:	74 1c                	je     9ab <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 98f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 992:	83 c0 08             	add    $0x8,%eax
 995:	83 ec 0c             	sub    $0xc,%esp
 998:	50                   	push   %eax
 999:	e8 54 ff ff ff       	call   8f2 <free>
  return freep;
 99e:	a1 14 0f 00 00       	mov    0xf14,%eax
 9a3:	83 c4 10             	add    $0x10,%esp
}
 9a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9a9:	c9                   	leave  
 9aa:	c3                   	ret    
    return 0;
 9ab:	b8 00 00 00 00       	mov    $0x0,%eax
 9b0:	eb f4                	jmp    9a6 <morecore+0x44>

000009b2 <malloc>:

void*
malloc(uint nbytes)
{
 9b2:	55                   	push   %ebp
 9b3:	89 e5                	mov    %esp,%ebp
 9b5:	53                   	push   %ebx
 9b6:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b9:	8b 45 08             	mov    0x8(%ebp),%eax
 9bc:	8d 58 07             	lea    0x7(%eax),%ebx
 9bf:	c1 eb 03             	shr    $0x3,%ebx
 9c2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9c5:	8b 0d 14 0f 00 00    	mov    0xf14,%ecx
 9cb:	85 c9                	test   %ecx,%ecx
 9cd:	74 04                	je     9d3 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9cf:	8b 01                	mov    (%ecx),%eax
 9d1:	eb 4a                	jmp    a1d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9d3:	c7 05 14 0f 00 00 18 	movl   $0xf18,0xf14
 9da:	0f 00 00 
 9dd:	c7 05 18 0f 00 00 18 	movl   $0xf18,0xf18
 9e4:	0f 00 00 
    base.s.size = 0;
 9e7:	c7 05 1c 0f 00 00 00 	movl   $0x0,0xf1c
 9ee:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9f1:	b9 18 0f 00 00       	mov    $0xf18,%ecx
 9f6:	eb d7                	jmp    9cf <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9f8:	74 19                	je     a13 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9fa:	29 da                	sub    %ebx,%edx
 9fc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ff:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a02:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a05:	89 0d 14 0f 00 00    	mov    %ecx,0xf14
      return (void*)(p + 1);
 a0b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a0e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a11:	c9                   	leave  
 a12:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a13:	8b 10                	mov    (%eax),%edx
 a15:	89 11                	mov    %edx,(%ecx)
 a17:	eb ec                	jmp    a05 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a19:	89 c1                	mov    %eax,%ecx
 a1b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a1d:	8b 50 04             	mov    0x4(%eax),%edx
 a20:	39 da                	cmp    %ebx,%edx
 a22:	73 d4                	jae    9f8 <malloc+0x46>
    if(p == freep)
 a24:	39 05 14 0f 00 00    	cmp    %eax,0xf14
 a2a:	75 ed                	jne    a19 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a2c:	89 d8                	mov    %ebx,%eax
 a2e:	e8 2f ff ff ff       	call   962 <morecore>
 a33:	85 c0                	test   %eax,%eax
 a35:	75 e2                	jne    a19 <malloc+0x67>
 a37:	eb d5                	jmp    a0e <malloc+0x5c>
