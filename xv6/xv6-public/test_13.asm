
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   8:	85 db                	test   %ebx,%ebx
   a:	74 05                	je     11 <fib+0x11>
      return 0;
   } else if (n == 1) {
   c:	83 fb 01             	cmp    $0x1,%ebx
   f:	75 09                	jne    1a <fib+0x1a>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  11:	89 d8                	mov    %ebx,%eax
  13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  16:	5b                   	pop    %ebx
  17:	5e                   	pop    %esi
  18:	5d                   	pop    %ebp
  19:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	8d 43 ff             	lea    -0x1(%ebx),%eax
  20:	50                   	push   %eax
  21:	e8 da ff ff ff       	call   0 <fib>
  26:	89 c6                	mov    %eax,%esi
  28:	83 eb 02             	sub    $0x2,%ebx
  2b:	89 1c 24             	mov    %ebx,(%esp)
  2e:	e8 cd ff ff ff       	call   0 <fib>
  33:	83 c4 10             	add    $0x10,%esp
  36:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  39:	eb d6                	jmp    11 <fib+0x11>

0000003b <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	83 38 0b             	cmpl   $0xb,(%eax)
  4c:	75 5f                	jne    ad <worker+0x72>
   assert(tmp2 == 22);
  4e:	83 fa 16             	cmp    $0x16,%edx
  51:	0f 85 9f 00 00 00    	jne    f6 <worker+0xbb>
   assert(global == 1);
  57:	83 3d 58 0f 00 00 01 	cmpl   $0x1,0xf58
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 7c 0a 00 00       	push   $0xa7c
  6b:	68 86 0a 00 00       	push   $0xa86
  70:	6a 01                	push   $0x1
  72:	e8 56 07 00 00       	call   7cd <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 c5 0a 00 00       	push   $0xac5
  7f:	68 99 0a 00 00       	push   $0xa99
  84:	6a 01                	push   $0x1
  86:	e8 42 07 00 00       	call   7cd <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 ad 0a 00 00       	push   $0xaad
  93:	6a 01                	push   $0x1
  95:	e8 33 07 00 00       	call   7cd <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 5c 0f 00 00    	push   0xf5c
  a3:	e8 00 06 00 00       	call   6a8 <kill>
  a8:	e8 cb 05 00 00       	call   678 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 7c 0a 00 00       	push   $0xa7c
  b4:	68 86 0a 00 00       	push   $0xa86
  b9:	6a 01                	push   $0x1
  bb:	e8 0d 07 00 00       	call   7cd <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 8e 0a 00 00       	push   $0xa8e
  c8:	68 99 0a 00 00       	push   $0xa99
  cd:	6a 01                	push   $0x1
  cf:	e8 f9 06 00 00       	call   7cd <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 ad 0a 00 00       	push   $0xaad
  dc:	6a 01                	push   $0x1
  de:	e8 ea 06 00 00       	call   7cd <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 5c 0f 00 00    	push   0xf5c
  ec:	e8 b7 05 00 00       	call   6a8 <kill>
  f1:	e8 82 05 00 00       	call   678 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 7c 0a 00 00       	push   $0xa7c
  fd:	68 86 0a 00 00       	push   $0xa86
 102:	6a 01                	push   $0x1
 104:	e8 c4 06 00 00       	call   7cd <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 ba 0a 00 00       	push   $0xaba
 111:	68 99 0a 00 00       	push   $0xa99
 116:	6a 01                	push   $0x1
 118:	e8 b0 06 00 00       	call   7cd <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 ad 0a 00 00       	push   $0xaad
 125:	6a 01                	push   $0x1
 127:	e8 a1 06 00 00       	call   7cd <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 5c 0f 00 00    	push   0xf5c
 135:	e8 6e 05 00 00       	call   6a8 <kill>
 13a:	e8 39 05 00 00       	call   678 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 7c 0a 00 00       	push   $0xa7c
 158:	68 86 0a 00 00       	push   $0xa86
 15d:	6a 01                	push   $0x1
 15f:	e8 69 06 00 00       	call   7cd <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 d1 0a 00 00       	push   $0xad1
 16c:	68 99 0a 00 00       	push   $0xa99
 171:	6a 01                	push   $0x1
 173:	e8 55 06 00 00       	call   7cd <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 ad 0a 00 00       	push   $0xaad
 180:	6a 01                	push   $0x1
 182:	e8 46 06 00 00       	call   7cd <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 5c 0f 00 00    	push   0xf5c
 190:	e8 13 05 00 00       	call   6a8 <kill>
 195:	e8 de 04 00 00       	call   678 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 7c 0a 00 00       	push   $0xa7c
 1b3:	68 86 0a 00 00       	push   $0xa86
 1b8:	6a 01                	push   $0x1
 1ba:	e8 0e 06 00 00       	call   7cd <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 dd 0a 00 00       	push   $0xadd
 1c7:	68 99 0a 00 00       	push   $0xa99
 1cc:	6a 01                	push   $0x1
 1ce:	e8 fa 05 00 00       	call   7cd <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 ad 0a 00 00       	push   $0xaad
 1db:	6a 01                	push   $0x1
 1dd:	e8 eb 05 00 00       	call   7cd <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 5c 0f 00 00    	push   0xf5c
 1eb:	e8 b8 04 00 00       	call   6a8 <kill>
 1f0:	e8 83 04 00 00       	call   678 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 7c 0a 00 00       	push   $0xa7c
 20e:	68 86 0a 00 00       	push   $0xa86
 213:	6a 01                	push   $0x1
 215:	e8 b3 05 00 00       	call   7cd <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 e9 0a 00 00       	push   $0xae9
 222:	68 99 0a 00 00       	push   $0xa99
 227:	6a 01                	push   $0x1
 229:	e8 9f 05 00 00       	call   7cd <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 ad 0a 00 00       	push   $0xaad
 236:	6a 01                	push   $0x1
 238:	e8 90 05 00 00       	call   7cd <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 5c 0f 00 00    	push   0xf5c
 246:	e8 5d 04 00 00       	call   6a8 <kill>
 24b:	e8 28 04 00 00       	call   678 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 7c 0a 00 00       	push   $0xa7c
 26b:	68 86 0a 00 00       	push   $0xa86
 270:	6a 01                	push   $0x1
 272:	e8 56 05 00 00       	call   7cd <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 f6 0a 00 00       	push   $0xaf6
 27f:	68 99 0a 00 00       	push   $0xa99
 284:	6a 01                	push   $0x1
 286:	e8 42 05 00 00       	call   7cd <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 ad 0a 00 00       	push   $0xaad
 293:	6a 01                	push   $0x1
 295:	e8 33 05 00 00       	call   7cd <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 5c 0f 00 00    	push   0xf5c
 2a3:	e8 00 04 00 00       	call   6a8 <kill>
 2a8:	e8 cb 03 00 00       	call   678 <exit>
   exit();
 2ad:	e8 c6 03 00 00       	call   678 <exit>

000002b2 <main>:
{
 2b2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2b6:	83 e4 f0             	and    $0xfffffff0,%esp
 2b9:	ff 71 fc             	push   -0x4(%ecx)
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	51                   	push   %ecx
 2c1:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2c4:	e8 2f 04 00 00       	call   6f8 <getpid>
 2c9:	a3 5c 0f 00 00       	mov    %eax,0xf5c
   assert(fib(28) == 317811);
 2ce:	83 ec 0c             	sub    $0xc,%esp
 2d1:	6a 1c                	push   $0x1c
 2d3:	e8 28 fd ff ff       	call   0 <fib>
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2e0:	75 40                	jne    322 <main+0x70>
   int arg1 = 11, arg2 = 22;
 2e2:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2e9:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f5:	39 1d 54 0f 00 00    	cmp    %ebx,0xf54
 2fb:	0f 8e b3 00 00 00    	jle    3b4 <main+0x102>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 301:	83 ec 04             	sub    $0x4,%esp
 304:	8d 45 f0             	lea    -0x10(%ebp),%eax
 307:	50                   	push   %eax
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	50                   	push   %eax
 30c:	68 3b 00 00 00       	push   $0x3b
 311:	e8 fc 02 00 00       	call   612 <thread_create>
      assert(thread_pid > 0);
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 4e                	jle    36b <main+0xb9>
   for (int i = 0; i < num_threads; i++) {
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	eb d3                	jmp    2f5 <main+0x43>
   assert(fib(28) == 317811);
 322:	6a 28                	push   $0x28
 324:	68 7c 0a 00 00       	push   $0xa7c
 329:	68 86 0a 00 00       	push   $0xa86
 32e:	6a 01                	push   $0x1
 330:	e8 98 04 00 00       	call   7cd <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 05 0b 00 00       	push   $0xb05
 33d:	68 99 0a 00 00       	push   $0xa99
 342:	6a 01                	push   $0x1
 344:	e8 84 04 00 00       	call   7cd <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 ad 0a 00 00       	push   $0xaad
 351:	6a 01                	push   $0x1
 353:	e8 75 04 00 00       	call   7cd <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 5c 0f 00 00    	push   0xf5c
 361:	e8 42 03 00 00       	call   6a8 <kill>
 366:	e8 0d 03 00 00       	call   678 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 7c 0a 00 00       	push   $0xa7c
 372:	68 86 0a 00 00       	push   $0xa86
 377:	6a 01                	push   $0x1
 379:	e8 4f 04 00 00       	call   7cd <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 17 0b 00 00       	push   $0xb17
 386:	68 99 0a 00 00       	push   $0xa99
 38b:	6a 01                	push   $0x1
 38d:	e8 3b 04 00 00       	call   7cd <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 ad 0a 00 00       	push   $0xaad
 39a:	6a 01                	push   $0x1
 39c:	e8 2c 04 00 00       	call   7cd <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 5c 0f 00 00    	push   0xf5c
 3aa:	e8 f9 02 00 00       	call   6a8 <kill>
 3af:	e8 c4 02 00 00       	call   678 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 54 0f 00 00    	cmp    %ebx,0xf54
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 83 02 00 00       	call   649 <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 7c 0a 00 00       	push   $0xa7c
 3d6:	68 86 0a 00 00       	push   $0xa86
 3db:	6a 01                	push   $0x1
 3dd:	e8 eb 03 00 00       	call   7cd <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 26 0b 00 00       	push   $0xb26
 3ea:	68 99 0a 00 00       	push   $0xa99
 3ef:	6a 01                	push   $0x1
 3f1:	e8 d7 03 00 00       	call   7cd <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 ad 0a 00 00       	push   $0xaad
 3fe:	6a 01                	push   $0x1
 400:	e8 c8 03 00 00       	call   7cd <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 5c 0f 00 00    	push   0xf5c
 40e:	e8 95 02 00 00       	call   6a8 <kill>
 413:	e8 60 02 00 00       	call   678 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 33 0b 00 00       	push   $0xb33
 420:	6a 01                	push   $0x1
 422:	e8 a6 03 00 00       	call   7cd <printf>
   exit();
 427:	e8 4c 02 00 00       	call   678 <exit>

0000042c <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	56                   	push   %esi
 430:	53                   	push   %ebx
 431:	8b 75 08             	mov    0x8(%ebp),%esi
 434:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 437:	89 f0                	mov    %esi,%eax
 439:	89 d1                	mov    %edx,%ecx
 43b:	83 c2 01             	add    $0x1,%edx
 43e:	89 c3                	mov    %eax,%ebx
 440:	83 c0 01             	add    $0x1,%eax
 443:	0f b6 09             	movzbl (%ecx),%ecx
 446:	88 0b                	mov    %cl,(%ebx)
 448:	84 c9                	test   %cl,%cl
 44a:	75 ed                	jne    439 <strcpy+0xd>
    ;
  return os;
}
 44c:	89 f0                	mov    %esi,%eax
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    

00000452 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	8b 4d 08             	mov    0x8(%ebp),%ecx
 458:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 45b:	eb 06                	jmp    463 <strcmp+0x11>
    p++, q++;
 45d:	83 c1 01             	add    $0x1,%ecx
 460:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 463:	0f b6 01             	movzbl (%ecx),%eax
 466:	84 c0                	test   %al,%al
 468:	74 04                	je     46e <strcmp+0x1c>
 46a:	3a 02                	cmp    (%edx),%al
 46c:	74 ef                	je     45d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 46e:	0f b6 c0             	movzbl %al,%eax
 471:	0f b6 12             	movzbl (%edx),%edx
 474:	29 d0                	sub    %edx,%eax
}
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    

00000478 <strlen>:

uint
strlen(const char *s)
{
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 47e:	b8 00 00 00 00       	mov    $0x0,%eax
 483:	eb 03                	jmp    488 <strlen+0x10>
 485:	83 c0 01             	add    $0x1,%eax
 488:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 48c:	75 f7                	jne    485 <strlen+0xd>
    ;
  return n;
}
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <memset>:

void*
memset(void *dst, int c, uint n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 497:	89 d7                	mov    %edx,%edi
 499:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49c:	8b 45 0c             	mov    0xc(%ebp),%eax
 49f:	fc                   	cld    
 4a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a7:	c9                   	leave  
 4a8:	c3                   	ret    

000004a9 <strchr>:

char*
strchr(const char *s, char c)
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4b3:	eb 03                	jmp    4b8 <strchr+0xf>
 4b5:	83 c0 01             	add    $0x1,%eax
 4b8:	0f b6 10             	movzbl (%eax),%edx
 4bb:	84 d2                	test   %dl,%dl
 4bd:	74 06                	je     4c5 <strchr+0x1c>
    if(*s == c)
 4bf:	38 ca                	cmp    %cl,%dl
 4c1:	75 f2                	jne    4b5 <strchr+0xc>
 4c3:	eb 05                	jmp    4ca <strchr+0x21>
      return (char*)s;
  return 0;
 4c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <gets>:

char*
gets(char *buf, int max)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	53                   	push   %ebx
 4d2:	83 ec 1c             	sub    $0x1c,%esp
 4d5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4dd:	89 de                	mov    %ebx,%esi
 4df:	83 c3 01             	add    $0x1,%ebx
 4e2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4e5:	7d 2e                	jge    515 <gets+0x49>
    cc = read(0, &c, 1);
 4e7:	83 ec 04             	sub    $0x4,%esp
 4ea:	6a 01                	push   $0x1
 4ec:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ef:	50                   	push   %eax
 4f0:	6a 00                	push   $0x0
 4f2:	e8 99 01 00 00       	call   690 <read>
    if(cc < 1)
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	85 c0                	test   %eax,%eax
 4fc:	7e 17                	jle    515 <gets+0x49>
      break;
    buf[i++] = c;
 4fe:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 502:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 505:	3c 0a                	cmp    $0xa,%al
 507:	0f 94 c2             	sete   %dl
 50a:	3c 0d                	cmp    $0xd,%al
 50c:	0f 94 c0             	sete   %al
 50f:	08 c2                	or     %al,%dl
 511:	74 ca                	je     4dd <gets+0x11>
    buf[i++] = c;
 513:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 515:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 519:	89 f8                	mov    %edi,%eax
 51b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <stat>:

int
stat(const char *n, struct stat *st)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	56                   	push   %esi
 527:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 528:	83 ec 08             	sub    $0x8,%esp
 52b:	6a 00                	push   $0x0
 52d:	ff 75 08             	push   0x8(%ebp)
 530:	e8 83 01 00 00       	call   6b8 <open>
  if(fd < 0)
 535:	83 c4 10             	add    $0x10,%esp
 538:	85 c0                	test   %eax,%eax
 53a:	78 24                	js     560 <stat+0x3d>
 53c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 53e:	83 ec 08             	sub    $0x8,%esp
 541:	ff 75 0c             	push   0xc(%ebp)
 544:	50                   	push   %eax
 545:	e8 86 01 00 00       	call   6d0 <fstat>
 54a:	89 c6                	mov    %eax,%esi
  close(fd);
 54c:	89 1c 24             	mov    %ebx,(%esp)
 54f:	e8 4c 01 00 00       	call   6a0 <close>
  return r;
 554:	83 c4 10             	add    $0x10,%esp
}
 557:	89 f0                	mov    %esi,%eax
 559:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
    return -1;
 560:	be ff ff ff ff       	mov    $0xffffffff,%esi
 565:	eb f0                	jmp    557 <stat+0x34>

00000567 <atoi>:

int
atoi(const char *s)
{
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	53                   	push   %ebx
 56b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 56e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 573:	eb 10                	jmp    585 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 575:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 578:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 57b:	83 c1 01             	add    $0x1,%ecx
 57e:	0f be c0             	movsbl %al,%eax
 581:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 585:	0f b6 01             	movzbl (%ecx),%eax
 588:	8d 58 d0             	lea    -0x30(%eax),%ebx
 58b:	80 fb 09             	cmp    $0x9,%bl
 58e:	76 e5                	jbe    575 <atoi+0xe>
  return n;
}
 590:	89 d0                	mov    %edx,%eax
 592:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
 59a:	56                   	push   %esi
 59b:	53                   	push   %ebx
 59c:	8b 75 08             	mov    0x8(%ebp),%esi
 59f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5a2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5a5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5a7:	eb 0d                	jmp    5b6 <memmove+0x1f>
    *dst++ = *src++;
 5a9:	0f b6 01             	movzbl (%ecx),%eax
 5ac:	88 02                	mov    %al,(%edx)
 5ae:	8d 49 01             	lea    0x1(%ecx),%ecx
 5b1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5b4:	89 d8                	mov    %ebx,%eax
 5b6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5b9:	85 c0                	test   %eax,%eax
 5bb:	7f ec                	jg     5a9 <memmove+0x12>
  return vdst;
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    

000005c3 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 5c3:	55                   	push   %ebp
 5c4:	89 e5                	mov    %esp,%ebp
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 5c9:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 5cb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5ce:	89 08                	mov    %ecx,(%eax)
  return old;
}
 5d0:	89 d0                	mov    %edx,%eax
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    

000005d4 <lock_init>:
void 
lock_init(lock_t *lock){
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 5d7:	8b 45 08             	mov    0x8(%ebp),%eax
 5da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5e0:	5d                   	pop    %ebp
 5e1:	c3                   	ret    

000005e2 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 5e2:	55                   	push   %ebp
 5e3:	89 e5                	mov    %esp,%ebp
 5e5:	53                   	push   %ebx
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 5ec:	83 ec 08             	sub    $0x8,%esp
 5ef:	6a 01                	push   $0x1
 5f1:	53                   	push   %ebx
 5f2:	e8 cc ff ff ff       	call   5c3 <TestAndSet>
 5f7:	83 c4 10             	add    $0x10,%esp
 5fa:	83 f8 01             	cmp    $0x1,%eax
 5fd:	74 ed                	je     5ec <lock_acquire+0xa>
    ;
}
 5ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 602:	c9                   	leave  
 603:	c3                   	ret    

00000604 <lock_release>:
void 
lock_release(lock_t *lock){
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 610:	5d                   	pop    %ebp
 611:	c3                   	ret    

00000612 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 612:	55                   	push   %ebp
 613:	89 e5                	mov    %esp,%ebp
 615:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 618:	68 04 20 00 00       	push   $0x2004
 61d:	e8 d1 03 00 00       	call   9f3 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 622:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 625:	83 c4 10             	add    $0x10,%esp
 628:	eb 03                	jmp    62d <thread_create+0x1b>
      stack += 1;
 62a:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 62d:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 633:	75 f5                	jne    62a <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 635:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 638:	52                   	push   %edx
 639:	ff 75 10             	push   0x10(%ebp)
 63c:	ff 75 0c             	push   0xc(%ebp)
 63f:	ff 75 08             	push   0x8(%ebp)
 642:	e8 d1 00 00 00       	call   718 <clone>
 
    return pid;
}
 647:	c9                   	leave  
 648:	c3                   	ret    

00000649 <thread_join>:
int 
thread_join(){
 649:	55                   	push   %ebp
 64a:	89 e5                	mov    %esp,%ebp
 64c:	53                   	push   %ebx
 64d:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 650:	8d 45 f4             	lea    -0xc(%ebp),%eax
 653:	50                   	push   %eax
 654:	e8 c7 00 00 00       	call   720 <join>
 659:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 65b:	83 c4 04             	add    $0x4,%esp
 65e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 661:	ff 70 fc             	push   -0x4(%eax)
 664:	e8 ca 02 00 00       	call   933 <free>
  return pid;
 669:	89 d8                	mov    %ebx,%eax
 66b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66e:	c9                   	leave  
 66f:	c3                   	ret    

00000670 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 670:	b8 01 00 00 00       	mov    $0x1,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <exit>:
SYSCALL(exit)
 678:	b8 02 00 00 00       	mov    $0x2,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <wait>:
SYSCALL(wait)
 680:	b8 03 00 00 00       	mov    $0x3,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <pipe>:
SYSCALL(pipe)
 688:	b8 04 00 00 00       	mov    $0x4,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <read>:
SYSCALL(read)
 690:	b8 05 00 00 00       	mov    $0x5,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <write>:
SYSCALL(write)
 698:	b8 10 00 00 00       	mov    $0x10,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <close>:
SYSCALL(close)
 6a0:	b8 15 00 00 00       	mov    $0x15,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <kill>:
SYSCALL(kill)
 6a8:	b8 06 00 00 00       	mov    $0x6,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <exec>:
SYSCALL(exec)
 6b0:	b8 07 00 00 00       	mov    $0x7,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <open>:
SYSCALL(open)
 6b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <mknod>:
SYSCALL(mknod)
 6c0:	b8 11 00 00 00       	mov    $0x11,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <unlink>:
SYSCALL(unlink)
 6c8:	b8 12 00 00 00       	mov    $0x12,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <fstat>:
SYSCALL(fstat)
 6d0:	b8 08 00 00 00       	mov    $0x8,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <link>:
SYSCALL(link)
 6d8:	b8 13 00 00 00       	mov    $0x13,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <mkdir>:
SYSCALL(mkdir)
 6e0:	b8 14 00 00 00       	mov    $0x14,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <chdir>:
SYSCALL(chdir)
 6e8:	b8 09 00 00 00       	mov    $0x9,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <dup>:
SYSCALL(dup)
 6f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <getpid>:
SYSCALL(getpid)
 6f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <sbrk>:
SYSCALL(sbrk)
 700:	b8 0c 00 00 00       	mov    $0xc,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <sleep>:
SYSCALL(sleep)
 708:	b8 0d 00 00 00       	mov    $0xd,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <uptime>:
SYSCALL(uptime)
 710:	b8 0e 00 00 00       	mov    $0xe,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <clone>:
SYSCALL(clone)
 718:	b8 16 00 00 00       	mov    $0x16,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <join>:
SYSCALL(join)
 720:	b8 17 00 00 00       	mov    $0x17,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 728:	55                   	push   %ebp
 729:	89 e5                	mov    %esp,%ebp
 72b:	83 ec 1c             	sub    $0x1c,%esp
 72e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 731:	6a 01                	push   $0x1
 733:	8d 55 f4             	lea    -0xc(%ebp),%edx
 736:	52                   	push   %edx
 737:	50                   	push   %eax
 738:	e8 5b ff ff ff       	call   698 <write>
}
 73d:	83 c4 10             	add    $0x10,%esp
 740:	c9                   	leave  
 741:	c3                   	ret    

00000742 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 742:	55                   	push   %ebp
 743:	89 e5                	mov    %esp,%ebp
 745:	57                   	push   %edi
 746:	56                   	push   %esi
 747:	53                   	push   %ebx
 748:	83 ec 2c             	sub    $0x2c,%esp
 74b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 74e:	89 d0                	mov    %edx,%eax
 750:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 752:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 756:	0f 95 c1             	setne  %cl
 759:	c1 ea 1f             	shr    $0x1f,%edx
 75c:	84 d1                	test   %dl,%cl
 75e:	74 44                	je     7a4 <printint+0x62>
    neg = 1;
    x = -xx;
 760:	f7 d8                	neg    %eax
 762:	89 c1                	mov    %eax,%ecx
    neg = 1;
 764:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 76b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 770:	89 c8                	mov    %ecx,%eax
 772:	ba 00 00 00 00       	mov    $0x0,%edx
 777:	f7 f6                	div    %esi
 779:	89 df                	mov    %ebx,%edi
 77b:	83 c3 01             	add    $0x1,%ebx
 77e:	0f b6 92 a0 0b 00 00 	movzbl 0xba0(%edx),%edx
 785:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 789:	89 ca                	mov    %ecx,%edx
 78b:	89 c1                	mov    %eax,%ecx
 78d:	39 d6                	cmp    %edx,%esi
 78f:	76 df                	jbe    770 <printint+0x2e>
  if(neg)
 791:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 795:	74 31                	je     7c8 <printint+0x86>
    buf[i++] = '-';
 797:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 79c:	8d 5f 02             	lea    0x2(%edi),%ebx
 79f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7a2:	eb 17                	jmp    7bb <printint+0x79>
    x = xx;
 7a4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7a6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7ad:	eb bc                	jmp    76b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7af:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7b4:	89 f0                	mov    %esi,%eax
 7b6:	e8 6d ff ff ff       	call   728 <putc>
  while(--i >= 0)
 7bb:	83 eb 01             	sub    $0x1,%ebx
 7be:	79 ef                	jns    7af <printint+0x6d>
}
 7c0:	83 c4 2c             	add    $0x2c,%esp
 7c3:	5b                   	pop    %ebx
 7c4:	5e                   	pop    %esi
 7c5:	5f                   	pop    %edi
 7c6:	5d                   	pop    %ebp
 7c7:	c3                   	ret    
 7c8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7cb:	eb ee                	jmp    7bb <printint+0x79>

000007cd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7cd:	55                   	push   %ebp
 7ce:	89 e5                	mov    %esp,%ebp
 7d0:	57                   	push   %edi
 7d1:	56                   	push   %esi
 7d2:	53                   	push   %ebx
 7d3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7d6:	8d 45 10             	lea    0x10(%ebp),%eax
 7d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7dc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7e1:	bb 00 00 00 00       	mov    $0x0,%ebx
 7e6:	eb 14                	jmp    7fc <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7e8:	89 fa                	mov    %edi,%edx
 7ea:	8b 45 08             	mov    0x8(%ebp),%eax
 7ed:	e8 36 ff ff ff       	call   728 <putc>
 7f2:	eb 05                	jmp    7f9 <printf+0x2c>
      }
    } else if(state == '%'){
 7f4:	83 fe 25             	cmp    $0x25,%esi
 7f7:	74 25                	je     81e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7f9:	83 c3 01             	add    $0x1,%ebx
 7fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ff:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 803:	84 c0                	test   %al,%al
 805:	0f 84 20 01 00 00    	je     92b <printf+0x15e>
    c = fmt[i] & 0xff;
 80b:	0f be f8             	movsbl %al,%edi
 80e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 811:	85 f6                	test   %esi,%esi
 813:	75 df                	jne    7f4 <printf+0x27>
      if(c == '%'){
 815:	83 f8 25             	cmp    $0x25,%eax
 818:	75 ce                	jne    7e8 <printf+0x1b>
        state = '%';
 81a:	89 c6                	mov    %eax,%esi
 81c:	eb db                	jmp    7f9 <printf+0x2c>
      if(c == 'd'){
 81e:	83 f8 25             	cmp    $0x25,%eax
 821:	0f 84 cf 00 00 00    	je     8f6 <printf+0x129>
 827:	0f 8c dd 00 00 00    	jl     90a <printf+0x13d>
 82d:	83 f8 78             	cmp    $0x78,%eax
 830:	0f 8f d4 00 00 00    	jg     90a <printf+0x13d>
 836:	83 f8 63             	cmp    $0x63,%eax
 839:	0f 8c cb 00 00 00    	jl     90a <printf+0x13d>
 83f:	83 e8 63             	sub    $0x63,%eax
 842:	83 f8 15             	cmp    $0x15,%eax
 845:	0f 87 bf 00 00 00    	ja     90a <printf+0x13d>
 84b:	ff 24 85 48 0b 00 00 	jmp    *0xb48(,%eax,4)
        printint(fd, *ap, 10, 1);
 852:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 855:	8b 17                	mov    (%edi),%edx
 857:	83 ec 0c             	sub    $0xc,%esp
 85a:	6a 01                	push   $0x1
 85c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	e8 d9 fe ff ff       	call   742 <printint>
        ap++;
 869:	83 c7 04             	add    $0x4,%edi
 86c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 86f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 872:	be 00 00 00 00       	mov    $0x0,%esi
 877:	eb 80                	jmp    7f9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 879:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 87c:	8b 17                	mov    (%edi),%edx
 87e:	83 ec 0c             	sub    $0xc,%esp
 881:	6a 00                	push   $0x0
 883:	b9 10 00 00 00       	mov    $0x10,%ecx
 888:	8b 45 08             	mov    0x8(%ebp),%eax
 88b:	e8 b2 fe ff ff       	call   742 <printint>
        ap++;
 890:	83 c7 04             	add    $0x4,%edi
 893:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 896:	83 c4 10             	add    $0x10,%esp
      state = 0;
 899:	be 00 00 00 00       	mov    $0x0,%esi
 89e:	e9 56 ff ff ff       	jmp    7f9 <printf+0x2c>
        s = (char*)*ap;
 8a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a6:	8b 30                	mov    (%eax),%esi
        ap++;
 8a8:	83 c0 04             	add    $0x4,%eax
 8ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8ae:	85 f6                	test   %esi,%esi
 8b0:	75 15                	jne    8c7 <printf+0xfa>
          s = "(null)";
 8b2:	be 40 0b 00 00       	mov    $0xb40,%esi
 8b7:	eb 0e                	jmp    8c7 <printf+0xfa>
          putc(fd, *s);
 8b9:	0f be d2             	movsbl %dl,%edx
 8bc:	8b 45 08             	mov    0x8(%ebp),%eax
 8bf:	e8 64 fe ff ff       	call   728 <putc>
          s++;
 8c4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8c7:	0f b6 16             	movzbl (%esi),%edx
 8ca:	84 d2                	test   %dl,%dl
 8cc:	75 eb                	jne    8b9 <printf+0xec>
      state = 0;
 8ce:	be 00 00 00 00       	mov    $0x0,%esi
 8d3:	e9 21 ff ff ff       	jmp    7f9 <printf+0x2c>
        putc(fd, *ap);
 8d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8db:	0f be 17             	movsbl (%edi),%edx
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	e8 42 fe ff ff       	call   728 <putc>
        ap++;
 8e6:	83 c7 04             	add    $0x4,%edi
 8e9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8ec:	be 00 00 00 00       	mov    $0x0,%esi
 8f1:	e9 03 ff ff ff       	jmp    7f9 <printf+0x2c>
        putc(fd, c);
 8f6:	89 fa                	mov    %edi,%edx
 8f8:	8b 45 08             	mov    0x8(%ebp),%eax
 8fb:	e8 28 fe ff ff       	call   728 <putc>
      state = 0;
 900:	be 00 00 00 00       	mov    $0x0,%esi
 905:	e9 ef fe ff ff       	jmp    7f9 <printf+0x2c>
        putc(fd, '%');
 90a:	ba 25 00 00 00       	mov    $0x25,%edx
 90f:	8b 45 08             	mov    0x8(%ebp),%eax
 912:	e8 11 fe ff ff       	call   728 <putc>
        putc(fd, c);
 917:	89 fa                	mov    %edi,%edx
 919:	8b 45 08             	mov    0x8(%ebp),%eax
 91c:	e8 07 fe ff ff       	call   728 <putc>
      state = 0;
 921:	be 00 00 00 00       	mov    $0x0,%esi
 926:	e9 ce fe ff ff       	jmp    7f9 <printf+0x2c>
    }
  }
}
 92b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 92e:	5b                   	pop    %ebx
 92f:	5e                   	pop    %esi
 930:	5f                   	pop    %edi
 931:	5d                   	pop    %ebp
 932:	c3                   	ret    

00000933 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 933:	55                   	push   %ebp
 934:	89 e5                	mov    %esp,%ebp
 936:	57                   	push   %edi
 937:	56                   	push   %esi
 938:	53                   	push   %ebx
 939:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 93c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93f:	a1 60 0f 00 00       	mov    0xf60,%eax
 944:	eb 02                	jmp    948 <free+0x15>
 946:	89 d0                	mov    %edx,%eax
 948:	39 c8                	cmp    %ecx,%eax
 94a:	73 04                	jae    950 <free+0x1d>
 94c:	39 08                	cmp    %ecx,(%eax)
 94e:	77 12                	ja     962 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 950:	8b 10                	mov    (%eax),%edx
 952:	39 c2                	cmp    %eax,%edx
 954:	77 f0                	ja     946 <free+0x13>
 956:	39 c8                	cmp    %ecx,%eax
 958:	72 08                	jb     962 <free+0x2f>
 95a:	39 ca                	cmp    %ecx,%edx
 95c:	77 04                	ja     962 <free+0x2f>
 95e:	89 d0                	mov    %edx,%eax
 960:	eb e6                	jmp    948 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 962:	8b 73 fc             	mov    -0x4(%ebx),%esi
 965:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 968:	8b 10                	mov    (%eax),%edx
 96a:	39 d7                	cmp    %edx,%edi
 96c:	74 19                	je     987 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 96e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 971:	8b 50 04             	mov    0x4(%eax),%edx
 974:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 977:	39 ce                	cmp    %ecx,%esi
 979:	74 1b                	je     996 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 97b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 97d:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 982:	5b                   	pop    %ebx
 983:	5e                   	pop    %esi
 984:	5f                   	pop    %edi
 985:	5d                   	pop    %ebp
 986:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 987:	03 72 04             	add    0x4(%edx),%esi
 98a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 98d:	8b 10                	mov    (%eax),%edx
 98f:	8b 12                	mov    (%edx),%edx
 991:	89 53 f8             	mov    %edx,-0x8(%ebx)
 994:	eb db                	jmp    971 <free+0x3e>
    p->s.size += bp->s.size;
 996:	03 53 fc             	add    -0x4(%ebx),%edx
 999:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 99c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 99f:	89 10                	mov    %edx,(%eax)
 9a1:	eb da                	jmp    97d <free+0x4a>

000009a3 <morecore>:

static Header*
morecore(uint nu)
{
 9a3:	55                   	push   %ebp
 9a4:	89 e5                	mov    %esp,%ebp
 9a6:	53                   	push   %ebx
 9a7:	83 ec 04             	sub    $0x4,%esp
 9aa:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9ac:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9b1:	77 05                	ja     9b8 <morecore+0x15>
    nu = 4096;
 9b3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9b8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9bf:	83 ec 0c             	sub    $0xc,%esp
 9c2:	50                   	push   %eax
 9c3:	e8 38 fd ff ff       	call   700 <sbrk>
  if(p == (char*)-1)
 9c8:	83 c4 10             	add    $0x10,%esp
 9cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ce:	74 1c                	je     9ec <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9d3:	83 c0 08             	add    $0x8,%eax
 9d6:	83 ec 0c             	sub    $0xc,%esp
 9d9:	50                   	push   %eax
 9da:	e8 54 ff ff ff       	call   933 <free>
  return freep;
 9df:	a1 60 0f 00 00       	mov    0xf60,%eax
 9e4:	83 c4 10             	add    $0x10,%esp
}
 9e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ea:	c9                   	leave  
 9eb:	c3                   	ret    
    return 0;
 9ec:	b8 00 00 00 00       	mov    $0x0,%eax
 9f1:	eb f4                	jmp    9e7 <morecore+0x44>

000009f3 <malloc>:

void*
malloc(uint nbytes)
{
 9f3:	55                   	push   %ebp
 9f4:	89 e5                	mov    %esp,%ebp
 9f6:	53                   	push   %ebx
 9f7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9fa:	8b 45 08             	mov    0x8(%ebp),%eax
 9fd:	8d 58 07             	lea    0x7(%eax),%ebx
 a00:	c1 eb 03             	shr    $0x3,%ebx
 a03:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a06:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 a0c:	85 c9                	test   %ecx,%ecx
 a0e:	74 04                	je     a14 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a10:	8b 01                	mov    (%ecx),%eax
 a12:	eb 4a                	jmp    a5e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a14:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 a1b:	0f 00 00 
 a1e:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 a25:	0f 00 00 
    base.s.size = 0;
 a28:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 a2f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a32:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 a37:	eb d7                	jmp    a10 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a39:	74 19                	je     a54 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a3b:	29 da                	sub    %ebx,%edx
 a3d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a40:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a43:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a46:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 a4c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a52:	c9                   	leave  
 a53:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a54:	8b 10                	mov    (%eax),%edx
 a56:	89 11                	mov    %edx,(%ecx)
 a58:	eb ec                	jmp    a46 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a5a:	89 c1                	mov    %eax,%ecx
 a5c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a5e:	8b 50 04             	mov    0x4(%eax),%edx
 a61:	39 da                	cmp    %ebx,%edx
 a63:	73 d4                	jae    a39 <malloc+0x46>
    if(p == freep)
 a65:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 a6b:	75 ed                	jne    a5a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a6d:	89 d8                	mov    %ebx,%eax
 a6f:	e8 2f ff ff ff       	call   9a3 <morecore>
 a74:	85 c0                	test   %eax,%eax
 a76:	75 e2                	jne    a5a <malloc+0x67>
 a78:	eb d5                	jmp    a4f <malloc+0x5c>
