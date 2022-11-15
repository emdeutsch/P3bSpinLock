
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
  72:	e8 57 07 00 00       	call   7ce <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 c5 0a 00 00       	push   $0xac5
  7f:	68 99 0a 00 00       	push   $0xa99
  84:	6a 01                	push   $0x1
  86:	e8 43 07 00 00       	call   7ce <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 ad 0a 00 00       	push   $0xaad
  93:	6a 01                	push   $0x1
  95:	e8 34 07 00 00       	call   7ce <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 5c 0f 00 00    	push   0xf5c
  a3:	e8 01 06 00 00       	call   6a9 <kill>
  a8:	e8 cc 05 00 00       	call   679 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 7c 0a 00 00       	push   $0xa7c
  b4:	68 86 0a 00 00       	push   $0xa86
  b9:	6a 01                	push   $0x1
  bb:	e8 0e 07 00 00       	call   7ce <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 8e 0a 00 00       	push   $0xa8e
  c8:	68 99 0a 00 00       	push   $0xa99
  cd:	6a 01                	push   $0x1
  cf:	e8 fa 06 00 00       	call   7ce <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 ad 0a 00 00       	push   $0xaad
  dc:	6a 01                	push   $0x1
  de:	e8 eb 06 00 00       	call   7ce <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 5c 0f 00 00    	push   0xf5c
  ec:	e8 b8 05 00 00       	call   6a9 <kill>
  f1:	e8 83 05 00 00       	call   679 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 7c 0a 00 00       	push   $0xa7c
  fd:	68 86 0a 00 00       	push   $0xa86
 102:	6a 01                	push   $0x1
 104:	e8 c5 06 00 00       	call   7ce <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 ba 0a 00 00       	push   $0xaba
 111:	68 99 0a 00 00       	push   $0xa99
 116:	6a 01                	push   $0x1
 118:	e8 b1 06 00 00       	call   7ce <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 ad 0a 00 00       	push   $0xaad
 125:	6a 01                	push   $0x1
 127:	e8 a2 06 00 00       	call   7ce <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 5c 0f 00 00    	push   0xf5c
 135:	e8 6f 05 00 00       	call   6a9 <kill>
 13a:	e8 3a 05 00 00       	call   679 <exit>
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
 15f:	e8 6a 06 00 00       	call   7ce <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 d1 0a 00 00       	push   $0xad1
 16c:	68 99 0a 00 00       	push   $0xa99
 171:	6a 01                	push   $0x1
 173:	e8 56 06 00 00       	call   7ce <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 ad 0a 00 00       	push   $0xaad
 180:	6a 01                	push   $0x1
 182:	e8 47 06 00 00       	call   7ce <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 5c 0f 00 00    	push   0xf5c
 190:	e8 14 05 00 00       	call   6a9 <kill>
 195:	e8 df 04 00 00       	call   679 <exit>
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
 1ba:	e8 0f 06 00 00       	call   7ce <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 dd 0a 00 00       	push   $0xadd
 1c7:	68 99 0a 00 00       	push   $0xa99
 1cc:	6a 01                	push   $0x1
 1ce:	e8 fb 05 00 00       	call   7ce <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 ad 0a 00 00       	push   $0xaad
 1db:	6a 01                	push   $0x1
 1dd:	e8 ec 05 00 00       	call   7ce <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 5c 0f 00 00    	push   0xf5c
 1eb:	e8 b9 04 00 00       	call   6a9 <kill>
 1f0:	e8 84 04 00 00       	call   679 <exit>
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
 215:	e8 b4 05 00 00       	call   7ce <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 e9 0a 00 00       	push   $0xae9
 222:	68 99 0a 00 00       	push   $0xa99
 227:	6a 01                	push   $0x1
 229:	e8 a0 05 00 00       	call   7ce <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 ad 0a 00 00       	push   $0xaad
 236:	6a 01                	push   $0x1
 238:	e8 91 05 00 00       	call   7ce <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 5c 0f 00 00    	push   0xf5c
 246:	e8 5e 04 00 00       	call   6a9 <kill>
 24b:	e8 29 04 00 00       	call   679 <exit>
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
 272:	e8 57 05 00 00       	call   7ce <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 f6 0a 00 00       	push   $0xaf6
 27f:	68 99 0a 00 00       	push   $0xa99
 284:	6a 01                	push   $0x1
 286:	e8 43 05 00 00       	call   7ce <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 ad 0a 00 00       	push   $0xaad
 293:	6a 01                	push   $0x1
 295:	e8 34 05 00 00       	call   7ce <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 5c 0f 00 00    	push   0xf5c
 2a3:	e8 01 04 00 00       	call   6a9 <kill>
 2a8:	e8 cc 03 00 00       	call   679 <exit>
   exit();
 2ad:	e8 c7 03 00 00       	call   679 <exit>

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
 2c4:	e8 30 04 00 00       	call   6f9 <getpid>
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
 330:	e8 99 04 00 00       	call   7ce <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 05 0b 00 00       	push   $0xb05
 33d:	68 99 0a 00 00       	push   $0xa99
 342:	6a 01                	push   $0x1
 344:	e8 85 04 00 00       	call   7ce <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 ad 0a 00 00       	push   $0xaad
 351:	6a 01                	push   $0x1
 353:	e8 76 04 00 00       	call   7ce <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 5c 0f 00 00    	push   0xf5c
 361:	e8 43 03 00 00       	call   6a9 <kill>
 366:	e8 0e 03 00 00       	call   679 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 7c 0a 00 00       	push   $0xa7c
 372:	68 86 0a 00 00       	push   $0xa86
 377:	6a 01                	push   $0x1
 379:	e8 50 04 00 00       	call   7ce <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 17 0b 00 00       	push   $0xb17
 386:	68 99 0a 00 00       	push   $0xa99
 38b:	6a 01                	push   $0x1
 38d:	e8 3c 04 00 00       	call   7ce <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 ad 0a 00 00       	push   $0xaad
 39a:	6a 01                	push   $0x1
 39c:	e8 2d 04 00 00       	call   7ce <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 5c 0f 00 00    	push   0xf5c
 3aa:	e8 fa 02 00 00       	call   6a9 <kill>
 3af:	e8 c5 02 00 00       	call   679 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 54 0f 00 00    	cmp    %ebx,0xf54
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 84 02 00 00       	call   64a <thread_join>
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
 3dd:	e8 ec 03 00 00       	call   7ce <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 26 0b 00 00       	push   $0xb26
 3ea:	68 99 0a 00 00       	push   $0xa99
 3ef:	6a 01                	push   $0x1
 3f1:	e8 d8 03 00 00       	call   7ce <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 ad 0a 00 00       	push   $0xaad
 3fe:	6a 01                	push   $0x1
 400:	e8 c9 03 00 00       	call   7ce <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 5c 0f 00 00    	push   0xf5c
 40e:	e8 96 02 00 00       	call   6a9 <kill>
 413:	e8 61 02 00 00       	call   679 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 33 0b 00 00       	push   $0xb33
 420:	6a 01                	push   $0x1
 422:	e8 a7 03 00 00       	call   7ce <printf>
   exit();
 427:	e8 4d 02 00 00       	call   679 <exit>

0000042c <strcpy>:
#include "x86.h"
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
 4f2:	e8 9a 01 00 00       	call   691 <read>
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
 530:	e8 84 01 00 00       	call   6b9 <open>
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
 545:	e8 87 01 00 00       	call   6d1 <fstat>
 54a:	89 c6                	mov    %eax,%esi
  close(fd);
 54c:	89 1c 24             	mov    %ebx,(%esp)
 54f:	e8 4d 01 00 00       	call   6a1 <close>
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
 61d:	e8 d2 03 00 00       	call   9f4 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 622:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 625:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 627:	eb 03                	jmp    62c <thread_create+0x1a>
      stack += 1;
 629:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 62c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 632:	75 f5                	jne    629 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 634:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 636:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 639:	52                   	push   %edx
 63a:	ff 75 10             	push   0x10(%ebp)
 63d:	ff 75 0c             	push   0xc(%ebp)
 640:	ff 75 08             	push   0x8(%ebp)
 643:	e8 d1 00 00 00       	call   719 <clone>
 
    return pid;
}
 648:	c9                   	leave  
 649:	c3                   	ret    

0000064a <thread_join>:
int 
thread_join(){
 64a:	55                   	push   %ebp
 64b:	89 e5                	mov    %esp,%ebp
 64d:	53                   	push   %ebx
 64e:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 651:	8d 45 f4             	lea    -0xc(%ebp),%eax
 654:	50                   	push   %eax
 655:	e8 c7 00 00 00       	call   721 <join>
 65a:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 65c:	83 c4 04             	add    $0x4,%esp
 65f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 662:	ff 70 fc             	push   -0x4(%eax)
 665:	e8 ca 02 00 00       	call   934 <free>
  return waitedForPID;
 66a:	89 d8                	mov    %ebx,%eax
 66c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66f:	c9                   	leave  
 670:	c3                   	ret    

00000671 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 671:	b8 01 00 00 00       	mov    $0x1,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <exit>:
SYSCALL(exit)
 679:	b8 02 00 00 00       	mov    $0x2,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <wait>:
SYSCALL(wait)
 681:	b8 03 00 00 00       	mov    $0x3,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <pipe>:
SYSCALL(pipe)
 689:	b8 04 00 00 00       	mov    $0x4,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <read>:
SYSCALL(read)
 691:	b8 05 00 00 00       	mov    $0x5,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <write>:
SYSCALL(write)
 699:	b8 10 00 00 00       	mov    $0x10,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <close>:
SYSCALL(close)
 6a1:	b8 15 00 00 00       	mov    $0x15,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <kill>:
SYSCALL(kill)
 6a9:	b8 06 00 00 00       	mov    $0x6,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <exec>:
SYSCALL(exec)
 6b1:	b8 07 00 00 00       	mov    $0x7,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <open>:
SYSCALL(open)
 6b9:	b8 0f 00 00 00       	mov    $0xf,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <mknod>:
SYSCALL(mknod)
 6c1:	b8 11 00 00 00       	mov    $0x11,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <unlink>:
SYSCALL(unlink)
 6c9:	b8 12 00 00 00       	mov    $0x12,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <fstat>:
SYSCALL(fstat)
 6d1:	b8 08 00 00 00       	mov    $0x8,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <link>:
SYSCALL(link)
 6d9:	b8 13 00 00 00       	mov    $0x13,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <mkdir>:
SYSCALL(mkdir)
 6e1:	b8 14 00 00 00       	mov    $0x14,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <chdir>:
SYSCALL(chdir)
 6e9:	b8 09 00 00 00       	mov    $0x9,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    

000006f1 <dup>:
SYSCALL(dup)
 6f1:	b8 0a 00 00 00       	mov    $0xa,%eax
 6f6:	cd 40                	int    $0x40
 6f8:	c3                   	ret    

000006f9 <getpid>:
SYSCALL(getpid)
 6f9:	b8 0b 00 00 00       	mov    $0xb,%eax
 6fe:	cd 40                	int    $0x40
 700:	c3                   	ret    

00000701 <sbrk>:
SYSCALL(sbrk)
 701:	b8 0c 00 00 00       	mov    $0xc,%eax
 706:	cd 40                	int    $0x40
 708:	c3                   	ret    

00000709 <sleep>:
SYSCALL(sleep)
 709:	b8 0d 00 00 00       	mov    $0xd,%eax
 70e:	cd 40                	int    $0x40
 710:	c3                   	ret    

00000711 <uptime>:
SYSCALL(uptime)
 711:	b8 0e 00 00 00       	mov    $0xe,%eax
 716:	cd 40                	int    $0x40
 718:	c3                   	ret    

00000719 <clone>:
SYSCALL(clone)
 719:	b8 16 00 00 00       	mov    $0x16,%eax
 71e:	cd 40                	int    $0x40
 720:	c3                   	ret    

00000721 <join>:
SYSCALL(join)
 721:	b8 17 00 00 00       	mov    $0x17,%eax
 726:	cd 40                	int    $0x40
 728:	c3                   	ret    

00000729 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 729:	55                   	push   %ebp
 72a:	89 e5                	mov    %esp,%ebp
 72c:	83 ec 1c             	sub    $0x1c,%esp
 72f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 732:	6a 01                	push   $0x1
 734:	8d 55 f4             	lea    -0xc(%ebp),%edx
 737:	52                   	push   %edx
 738:	50                   	push   %eax
 739:	e8 5b ff ff ff       	call   699 <write>
}
 73e:	83 c4 10             	add    $0x10,%esp
 741:	c9                   	leave  
 742:	c3                   	ret    

00000743 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 743:	55                   	push   %ebp
 744:	89 e5                	mov    %esp,%ebp
 746:	57                   	push   %edi
 747:	56                   	push   %esi
 748:	53                   	push   %ebx
 749:	83 ec 2c             	sub    $0x2c,%esp
 74c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 74f:	89 d0                	mov    %edx,%eax
 751:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 753:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 757:	0f 95 c1             	setne  %cl
 75a:	c1 ea 1f             	shr    $0x1f,%edx
 75d:	84 d1                	test   %dl,%cl
 75f:	74 44                	je     7a5 <printint+0x62>
    neg = 1;
    x = -xx;
 761:	f7 d8                	neg    %eax
 763:	89 c1                	mov    %eax,%ecx
    neg = 1;
 765:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 76c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 771:	89 c8                	mov    %ecx,%eax
 773:	ba 00 00 00 00       	mov    $0x0,%edx
 778:	f7 f6                	div    %esi
 77a:	89 df                	mov    %ebx,%edi
 77c:	83 c3 01             	add    $0x1,%ebx
 77f:	0f b6 92 a0 0b 00 00 	movzbl 0xba0(%edx),%edx
 786:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 78a:	89 ca                	mov    %ecx,%edx
 78c:	89 c1                	mov    %eax,%ecx
 78e:	39 d6                	cmp    %edx,%esi
 790:	76 df                	jbe    771 <printint+0x2e>
  if(neg)
 792:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 796:	74 31                	je     7c9 <printint+0x86>
    buf[i++] = '-';
 798:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 79d:	8d 5f 02             	lea    0x2(%edi),%ebx
 7a0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7a3:	eb 17                	jmp    7bc <printint+0x79>
    x = xx;
 7a5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7a7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7ae:	eb bc                	jmp    76c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7b0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7b5:	89 f0                	mov    %esi,%eax
 7b7:	e8 6d ff ff ff       	call   729 <putc>
  while(--i >= 0)
 7bc:	83 eb 01             	sub    $0x1,%ebx
 7bf:	79 ef                	jns    7b0 <printint+0x6d>
}
 7c1:	83 c4 2c             	add    $0x2c,%esp
 7c4:	5b                   	pop    %ebx
 7c5:	5e                   	pop    %esi
 7c6:	5f                   	pop    %edi
 7c7:	5d                   	pop    %ebp
 7c8:	c3                   	ret    
 7c9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7cc:	eb ee                	jmp    7bc <printint+0x79>

000007ce <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7ce:	55                   	push   %ebp
 7cf:	89 e5                	mov    %esp,%ebp
 7d1:	57                   	push   %edi
 7d2:	56                   	push   %esi
 7d3:	53                   	push   %ebx
 7d4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7d7:	8d 45 10             	lea    0x10(%ebp),%eax
 7da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7dd:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 7e7:	eb 14                	jmp    7fd <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7e9:	89 fa                	mov    %edi,%edx
 7eb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ee:	e8 36 ff ff ff       	call   729 <putc>
 7f3:	eb 05                	jmp    7fa <printf+0x2c>
      }
    } else if(state == '%'){
 7f5:	83 fe 25             	cmp    $0x25,%esi
 7f8:	74 25                	je     81f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7fa:	83 c3 01             	add    $0x1,%ebx
 7fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 800:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 804:	84 c0                	test   %al,%al
 806:	0f 84 20 01 00 00    	je     92c <printf+0x15e>
    c = fmt[i] & 0xff;
 80c:	0f be f8             	movsbl %al,%edi
 80f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 812:	85 f6                	test   %esi,%esi
 814:	75 df                	jne    7f5 <printf+0x27>
      if(c == '%'){
 816:	83 f8 25             	cmp    $0x25,%eax
 819:	75 ce                	jne    7e9 <printf+0x1b>
        state = '%';
 81b:	89 c6                	mov    %eax,%esi
 81d:	eb db                	jmp    7fa <printf+0x2c>
      if(c == 'd'){
 81f:	83 f8 25             	cmp    $0x25,%eax
 822:	0f 84 cf 00 00 00    	je     8f7 <printf+0x129>
 828:	0f 8c dd 00 00 00    	jl     90b <printf+0x13d>
 82e:	83 f8 78             	cmp    $0x78,%eax
 831:	0f 8f d4 00 00 00    	jg     90b <printf+0x13d>
 837:	83 f8 63             	cmp    $0x63,%eax
 83a:	0f 8c cb 00 00 00    	jl     90b <printf+0x13d>
 840:	83 e8 63             	sub    $0x63,%eax
 843:	83 f8 15             	cmp    $0x15,%eax
 846:	0f 87 bf 00 00 00    	ja     90b <printf+0x13d>
 84c:	ff 24 85 48 0b 00 00 	jmp    *0xb48(,%eax,4)
        printint(fd, *ap, 10, 1);
 853:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 856:	8b 17                	mov    (%edi),%edx
 858:	83 ec 0c             	sub    $0xc,%esp
 85b:	6a 01                	push   $0x1
 85d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 862:	8b 45 08             	mov    0x8(%ebp),%eax
 865:	e8 d9 fe ff ff       	call   743 <printint>
        ap++;
 86a:	83 c7 04             	add    $0x4,%edi
 86d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 870:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 873:	be 00 00 00 00       	mov    $0x0,%esi
 878:	eb 80                	jmp    7fa <printf+0x2c>
        printint(fd, *ap, 16, 0);
 87a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 87d:	8b 17                	mov    (%edi),%edx
 87f:	83 ec 0c             	sub    $0xc,%esp
 882:	6a 00                	push   $0x0
 884:	b9 10 00 00 00       	mov    $0x10,%ecx
 889:	8b 45 08             	mov    0x8(%ebp),%eax
 88c:	e8 b2 fe ff ff       	call   743 <printint>
        ap++;
 891:	83 c7 04             	add    $0x4,%edi
 894:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 897:	83 c4 10             	add    $0x10,%esp
      state = 0;
 89a:	be 00 00 00 00       	mov    $0x0,%esi
 89f:	e9 56 ff ff ff       	jmp    7fa <printf+0x2c>
        s = (char*)*ap;
 8a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a7:	8b 30                	mov    (%eax),%esi
        ap++;
 8a9:	83 c0 04             	add    $0x4,%eax
 8ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8af:	85 f6                	test   %esi,%esi
 8b1:	75 15                	jne    8c8 <printf+0xfa>
          s = "(null)";
 8b3:	be 40 0b 00 00       	mov    $0xb40,%esi
 8b8:	eb 0e                	jmp    8c8 <printf+0xfa>
          putc(fd, *s);
 8ba:	0f be d2             	movsbl %dl,%edx
 8bd:	8b 45 08             	mov    0x8(%ebp),%eax
 8c0:	e8 64 fe ff ff       	call   729 <putc>
          s++;
 8c5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8c8:	0f b6 16             	movzbl (%esi),%edx
 8cb:	84 d2                	test   %dl,%dl
 8cd:	75 eb                	jne    8ba <printf+0xec>
      state = 0;
 8cf:	be 00 00 00 00       	mov    $0x0,%esi
 8d4:	e9 21 ff ff ff       	jmp    7fa <printf+0x2c>
        putc(fd, *ap);
 8d9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8dc:	0f be 17             	movsbl (%edi),%edx
 8df:	8b 45 08             	mov    0x8(%ebp),%eax
 8e2:	e8 42 fe ff ff       	call   729 <putc>
        ap++;
 8e7:	83 c7 04             	add    $0x4,%edi
 8ea:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8ed:	be 00 00 00 00       	mov    $0x0,%esi
 8f2:	e9 03 ff ff ff       	jmp    7fa <printf+0x2c>
        putc(fd, c);
 8f7:	89 fa                	mov    %edi,%edx
 8f9:	8b 45 08             	mov    0x8(%ebp),%eax
 8fc:	e8 28 fe ff ff       	call   729 <putc>
      state = 0;
 901:	be 00 00 00 00       	mov    $0x0,%esi
 906:	e9 ef fe ff ff       	jmp    7fa <printf+0x2c>
        putc(fd, '%');
 90b:	ba 25 00 00 00       	mov    $0x25,%edx
 910:	8b 45 08             	mov    0x8(%ebp),%eax
 913:	e8 11 fe ff ff       	call   729 <putc>
        putc(fd, c);
 918:	89 fa                	mov    %edi,%edx
 91a:	8b 45 08             	mov    0x8(%ebp),%eax
 91d:	e8 07 fe ff ff       	call   729 <putc>
      state = 0;
 922:	be 00 00 00 00       	mov    $0x0,%esi
 927:	e9 ce fe ff ff       	jmp    7fa <printf+0x2c>
    }
  }
}
 92c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 92f:	5b                   	pop    %ebx
 930:	5e                   	pop    %esi
 931:	5f                   	pop    %edi
 932:	5d                   	pop    %ebp
 933:	c3                   	ret    

00000934 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 934:	55                   	push   %ebp
 935:	89 e5                	mov    %esp,%ebp
 937:	57                   	push   %edi
 938:	56                   	push   %esi
 939:	53                   	push   %ebx
 93a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 93d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 940:	a1 60 0f 00 00       	mov    0xf60,%eax
 945:	eb 02                	jmp    949 <free+0x15>
 947:	89 d0                	mov    %edx,%eax
 949:	39 c8                	cmp    %ecx,%eax
 94b:	73 04                	jae    951 <free+0x1d>
 94d:	39 08                	cmp    %ecx,(%eax)
 94f:	77 12                	ja     963 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 951:	8b 10                	mov    (%eax),%edx
 953:	39 c2                	cmp    %eax,%edx
 955:	77 f0                	ja     947 <free+0x13>
 957:	39 c8                	cmp    %ecx,%eax
 959:	72 08                	jb     963 <free+0x2f>
 95b:	39 ca                	cmp    %ecx,%edx
 95d:	77 04                	ja     963 <free+0x2f>
 95f:	89 d0                	mov    %edx,%eax
 961:	eb e6                	jmp    949 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 963:	8b 73 fc             	mov    -0x4(%ebx),%esi
 966:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 969:	8b 10                	mov    (%eax),%edx
 96b:	39 d7                	cmp    %edx,%edi
 96d:	74 19                	je     988 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 96f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 972:	8b 50 04             	mov    0x4(%eax),%edx
 975:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 978:	39 ce                	cmp    %ecx,%esi
 97a:	74 1b                	je     997 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 97c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 97e:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 983:	5b                   	pop    %ebx
 984:	5e                   	pop    %esi
 985:	5f                   	pop    %edi
 986:	5d                   	pop    %ebp
 987:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 988:	03 72 04             	add    0x4(%edx),%esi
 98b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 98e:	8b 10                	mov    (%eax),%edx
 990:	8b 12                	mov    (%edx),%edx
 992:	89 53 f8             	mov    %edx,-0x8(%ebx)
 995:	eb db                	jmp    972 <free+0x3e>
    p->s.size += bp->s.size;
 997:	03 53 fc             	add    -0x4(%ebx),%edx
 99a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 99d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9a0:	89 10                	mov    %edx,(%eax)
 9a2:	eb da                	jmp    97e <free+0x4a>

000009a4 <morecore>:

static Header*
morecore(uint nu)
{
 9a4:	55                   	push   %ebp
 9a5:	89 e5                	mov    %esp,%ebp
 9a7:	53                   	push   %ebx
 9a8:	83 ec 04             	sub    $0x4,%esp
 9ab:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9ad:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9b2:	77 05                	ja     9b9 <morecore+0x15>
    nu = 4096;
 9b4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9b9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9c0:	83 ec 0c             	sub    $0xc,%esp
 9c3:	50                   	push   %eax
 9c4:	e8 38 fd ff ff       	call   701 <sbrk>
  if(p == (char*)-1)
 9c9:	83 c4 10             	add    $0x10,%esp
 9cc:	83 f8 ff             	cmp    $0xffffffff,%eax
 9cf:	74 1c                	je     9ed <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9d1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9d4:	83 c0 08             	add    $0x8,%eax
 9d7:	83 ec 0c             	sub    $0xc,%esp
 9da:	50                   	push   %eax
 9db:	e8 54 ff ff ff       	call   934 <free>
  return freep;
 9e0:	a1 60 0f 00 00       	mov    0xf60,%eax
 9e5:	83 c4 10             	add    $0x10,%esp
}
 9e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9eb:	c9                   	leave  
 9ec:	c3                   	ret    
    return 0;
 9ed:	b8 00 00 00 00       	mov    $0x0,%eax
 9f2:	eb f4                	jmp    9e8 <morecore+0x44>

000009f4 <malloc>:

void*
malloc(uint nbytes)
{
 9f4:	55                   	push   %ebp
 9f5:	89 e5                	mov    %esp,%ebp
 9f7:	53                   	push   %ebx
 9f8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9fb:	8b 45 08             	mov    0x8(%ebp),%eax
 9fe:	8d 58 07             	lea    0x7(%eax),%ebx
 a01:	c1 eb 03             	shr    $0x3,%ebx
 a04:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a07:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 a0d:	85 c9                	test   %ecx,%ecx
 a0f:	74 04                	je     a15 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a11:	8b 01                	mov    (%ecx),%eax
 a13:	eb 4a                	jmp    a5f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a15:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 a1c:	0f 00 00 
 a1f:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 a26:	0f 00 00 
    base.s.size = 0;
 a29:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 a30:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a33:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 a38:	eb d7                	jmp    a11 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a3a:	74 19                	je     a55 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a3c:	29 da                	sub    %ebx,%edx
 a3e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a41:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a44:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a47:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 a4d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a50:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a53:	c9                   	leave  
 a54:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a55:	8b 10                	mov    (%eax),%edx
 a57:	89 11                	mov    %edx,(%ecx)
 a59:	eb ec                	jmp    a47 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a5b:	89 c1                	mov    %eax,%ecx
 a5d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a5f:	8b 50 04             	mov    0x4(%eax),%edx
 a62:	39 da                	cmp    %ebx,%edx
 a64:	73 d4                	jae    a3a <malloc+0x46>
    if(p == freep)
 a66:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 a6c:	75 ed                	jne    a5b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a6e:	89 d8                	mov    %ebx,%eax
 a70:	e8 2f ff ff ff       	call   9a4 <morecore>
 a75:	85 c0                	test   %eax,%eax
 a77:	75 e2                	jne    a5b <malloc+0x67>
 a79:	eb d5                	jmp    a50 <malloc+0x5c>
