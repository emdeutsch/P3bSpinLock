
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 64 0f 00 00       	push   $0xf64
   b:	e8 14 06 00 00       	call   624 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 27 07 00 00       	call   743 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 68 0f 00 00    	cmp    0xf68,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 c0 0a 00 00       	push   $0xac0
  2e:	68 ca 0a 00 00       	push   $0xaca
  33:	6a 01                	push   $0x1
  35:	e8 d6 07 00 00       	call   810 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 d2 0a 00 00       	push   $0xad2
  42:	68 f0 0a 00 00       	push   $0xaf0
  47:	6a 01                	push   $0x1
  49:	e8 c2 07 00 00       	call   810 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 04 0b 00 00       	push   $0xb04
  56:	6a 01                	push   $0x1
  58:	e8 b3 07 00 00       	call   810 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 70 0f 00 00    	push   0xf70
  66:	e8 80 06 00 00       	call   6eb <kill>
  6b:	e8 4b 06 00 00       	call   6bb <exit>
   global++;
  70:	83 05 6c 0f 00 00 01 	addl   $0x1,0xf6c
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 64 0f 00 00       	push   $0xf64
  7f:	e8 c2 05 00 00       	call   646 <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
  8b:	e8 94 05 00 00       	call   624 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 a7 06 00 00       	call   743 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 68 0f 00 00    	cmp    0xf68,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 c0 0a 00 00       	push   $0xac0
  ae:	68 ca 0a 00 00       	push   $0xaca
  b3:	6a 01                	push   $0x1
  b5:	e8 56 07 00 00       	call   810 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 d2 0a 00 00       	push   $0xad2
  c2:	68 f0 0a 00 00       	push   $0xaf0
  c7:	6a 01                	push   $0x1
  c9:	e8 42 07 00 00       	call   810 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 04 0b 00 00       	push   $0xb04
  d6:	6a 01                	push   $0x1
  d8:	e8 33 07 00 00       	call   810 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 70 0f 00 00    	push   0xf70
  e6:	e8 00 06 00 00       	call   6eb <kill>
  eb:	e8 cb 05 00 00       	call   6bb <exit>
   global++;
  f0:	83 05 6c 0f 00 00 01 	addl   $0x1,0xf6c
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 3f 06 00 00       	call   743 <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 33 06 00 00       	call   743 <sbrk>
 110:	a3 68 0f 00 00       	mov    %eax,0xf68
   lock_release(&lock2);
 115:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
 11c:	e8 25 05 00 00       	call   646 <lock_release>



   exit();
 121:	e8 95 05 00 00       	call   6bb <exit>

00000126 <main>:
{
 126:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 12a:	83 e4 f0             	and    $0xfffffff0,%esp
 12d:	ff 71 fc             	push   -0x4(%ecx)
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	51                   	push   %ecx
 135:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 138:	e8 fe 05 00 00       	call   73b <getpid>
 13d:	a3 70 0f 00 00       	mov    %eax,0xf70
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 64 0f 00 00       	push   $0xf64
 158:	e8 b9 04 00 00       	call   616 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
 164:	e8 ad 04 00 00       	call   616 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 64 0f 00 00 	movl   $0xf64,(%esp)
 170:	e8 af 04 00 00       	call   624 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
 17c:	e8 a3 04 00 00       	call   624 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d 5c 0f 00 00    	cmp    %ebx,0xf5c
 194:	7e 65                	jle    1fb <main+0xd5>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	8d 45 f0             	lea    -0x10(%ebp),%eax
 19c:	50                   	push   %eax
 19d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	68 00 00 00 00       	push   $0x0
 1a6:	e8 a9 04 00 00       	call   654 <thread_create>
      assert(thread_pid > 0);
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	85 c0                	test   %eax,%eax
 1b0:	7f d9                	jg     18b <main+0x65>
 1b2:	6a 28                	push   $0x28
 1b4:	68 c0 0a 00 00       	push   $0xac0
 1b9:	68 ca 0a 00 00       	push   $0xaca
 1be:	6a 01                	push   $0x1
 1c0:	e8 4b 06 00 00       	call   810 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 11 0b 00 00       	push   $0xb11
 1cd:	68 f0 0a 00 00       	push   $0xaf0
 1d2:	6a 01                	push   $0x1
 1d4:	e8 37 06 00 00       	call   810 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 04 0b 00 00       	push   $0xb04
 1e1:	6a 01                	push   $0x1
 1e3:	e8 28 06 00 00       	call   810 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 70 0f 00 00    	push   0xf70
 1f1:	e8 f5 04 00 00       	call   6eb <kill>
 1f6:	e8 c0 04 00 00       	call   6bb <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 3e 05 00 00       	call   743 <sbrk>
 205:	a3 68 0f 00 00       	mov    %eax,0xf68
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 5c 0f 00 00       	mov    0xf5c,%eax
 212:	39 05 6c 0f 00 00    	cmp    %eax,0xf6c
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 64 0f 00 00       	push   $0xf64
 222:	e8 1f 04 00 00       	call   646 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 18 05 00 00       	call   74b <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 64 0f 00 00 	movl   $0xf64,(%esp)
 23a:	e8 e5 03 00 00       	call   624 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 6c 0f 00 00 00 	movl   $0x0,0xf6c
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 e8 04 00 00       	call   743 <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 dc 04 00 00       	call   743 <sbrk>
 267:	a3 68 0f 00 00       	mov    %eax,0xf68
   lock_release(&lock);
 26c:	c7 04 24 64 0f 00 00 	movl   $0xf64,(%esp)
 273:	e8 ce 03 00 00       	call   646 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 5c 0f 00 00       	mov    0xf5c,%eax
 280:	39 05 6c 0f 00 00    	cmp    %eax,0xf6c
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 60 0f 00 00       	push   $0xf60
 290:	e8 b1 03 00 00       	call   646 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 aa 04 00 00       	call   74b <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
 2a8:	e8 77 03 00 00       	call   624 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 60 0f 00 00       	push   $0xf60
 2ba:	e8 87 03 00 00       	call   646 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 5c 0f 00 00    	cmp    %ebx,0xf5c
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 b8 03 00 00       	call   68c <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 c0 0a 00 00       	push   $0xac0
 2e4:	68 ca 0a 00 00       	push   $0xaca
 2e9:	6a 01                	push   $0x1
 2eb:	e8 20 05 00 00       	call   810 <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 20 0b 00 00       	push   $0xb20
 2f8:	68 f0 0a 00 00       	push   $0xaf0
 2fd:	6a 01                	push   $0x1
 2ff:	e8 0c 05 00 00       	call   810 <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 04 0b 00 00       	push   $0xb04
 30c:	6a 01                	push   $0x1
 30e:	e8 fd 04 00 00       	call   810 <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 70 0f 00 00    	push   0xf70
 31c:	e8 ca 03 00 00       	call   6eb <kill>
 321:	e8 95 03 00 00       	call   6bb <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 2d 0b 00 00       	push   $0xb2d
 32e:	6a 01                	push   $0x1
 330:	e8 db 04 00 00       	call   810 <printf>
   exit();
 335:	e8 81 03 00 00       	call   6bb <exit>

0000033a <worker2>:
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	83 38 0b             	cmpl   $0xb,(%eax)
 34b:	75 52                	jne    39f <worker2+0x65>
   assert(arg2_int == 22);
 34d:	83 fa 16             	cmp    $0x16,%edx
 350:	0f 84 92 00 00 00    	je     3e8 <worker2+0xae>
 356:	6a 4d                	push   $0x4d
 358:	68 c0 0a 00 00       	push   $0xac0
 35d:	68 ca 0a 00 00       	push   $0xaca
 362:	6a 01                	push   $0x1
 364:	e8 a7 04 00 00       	call   810 <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 49 0b 00 00       	push   $0xb49
 371:	68 f0 0a 00 00       	push   $0xaf0
 376:	6a 01                	push   $0x1
 378:	e8 93 04 00 00       	call   810 <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 04 0b 00 00       	push   $0xb04
 385:	6a 01                	push   $0x1
 387:	e8 84 04 00 00       	call   810 <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 70 0f 00 00    	push   0xf70
 395:	e8 51 03 00 00       	call   6eb <kill>
 39a:	e8 1c 03 00 00       	call   6bb <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 c0 0a 00 00       	push   $0xac0
 3a6:	68 ca 0a 00 00       	push   $0xaca
 3ab:	6a 01                	push   $0x1
 3ad:	e8 5e 04 00 00       	call   810 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 3a 0b 00 00       	push   $0xb3a
 3ba:	68 f0 0a 00 00       	push   $0xaf0
 3bf:	6a 01                	push   $0x1
 3c1:	e8 4a 04 00 00       	call   810 <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 04 0b 00 00       	push   $0xb04
 3ce:	6a 01                	push   $0x1
 3d0:	e8 3b 04 00 00       	call   810 <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 70 0f 00 00    	push   0xf70
 3de:	e8 08 03 00 00       	call   6eb <kill>
 3e3:	e8 d3 02 00 00       	call   6bb <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 60 0f 00 00       	push   $0xf60
 3f0:	e8 2f 02 00 00       	call   624 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 42 03 00 00       	call   743 <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 68 0f 00 00    	cmp    0xf68,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 c0 0a 00 00       	push   $0xac0
 413:	68 ca 0a 00 00       	push   $0xaca
 418:	6a 01                	push   $0x1
 41a:	e8 f1 03 00 00       	call   810 <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 d2 0a 00 00       	push   $0xad2
 427:	68 f0 0a 00 00       	push   $0xaf0
 42c:	6a 01                	push   $0x1
 42e:	e8 dd 03 00 00       	call   810 <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 04 0b 00 00       	push   $0xb04
 43b:	6a 01                	push   $0x1
 43d:	e8 ce 03 00 00       	call   810 <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 70 0f 00 00    	push   0xf70
 44b:	e8 9b 02 00 00       	call   6eb <kill>
 450:	e8 66 02 00 00       	call   6bb <exit>
   global++;
 455:	83 05 6c 0f 00 00 01 	addl   $0x1,0xf6c
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 60 0f 00 00       	push   $0xf60
 464:	e8 dd 01 00 00       	call   646 <lock_release>
   exit();
 469:	e8 4d 02 00 00       	call   6bb <exit>

0000046e <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	56                   	push   %esi
 472:	53                   	push   %ebx
 473:	8b 75 08             	mov    0x8(%ebp),%esi
 476:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 479:	89 f0                	mov    %esi,%eax
 47b:	89 d1                	mov    %edx,%ecx
 47d:	83 c2 01             	add    $0x1,%edx
 480:	89 c3                	mov    %eax,%ebx
 482:	83 c0 01             	add    $0x1,%eax
 485:	0f b6 09             	movzbl (%ecx),%ecx
 488:	88 0b                	mov    %cl,(%ebx)
 48a:	84 c9                	test   %cl,%cl
 48c:	75 ed                	jne    47b <strcpy+0xd>
    ;
  return os;
}
 48e:	89 f0                	mov    %esi,%eax
 490:	5b                   	pop    %ebx
 491:	5e                   	pop    %esi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    

00000494 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	8b 4d 08             	mov    0x8(%ebp),%ecx
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 49d:	eb 06                	jmp    4a5 <strcmp+0x11>
    p++, q++;
 49f:	83 c1 01             	add    $0x1,%ecx
 4a2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4a5:	0f b6 01             	movzbl (%ecx),%eax
 4a8:	84 c0                	test   %al,%al
 4aa:	74 04                	je     4b0 <strcmp+0x1c>
 4ac:	3a 02                	cmp    (%edx),%al
 4ae:	74 ef                	je     49f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4b0:	0f b6 c0             	movzbl %al,%eax
 4b3:	0f b6 12             	movzbl (%edx),%edx
 4b6:	29 d0                	sub    %edx,%eax
}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <strlen>:

uint
strlen(const char *s)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4c0:	b8 00 00 00 00       	mov    $0x0,%eax
 4c5:	eb 03                	jmp    4ca <strlen+0x10>
 4c7:	83 c0 01             	add    $0x1,%eax
 4ca:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4ce:	75 f7                	jne    4c7 <strlen+0xd>
    ;
  return n;
}
 4d0:	5d                   	pop    %ebp
 4d1:	c3                   	ret    

000004d2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4d2:	55                   	push   %ebp
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	57                   	push   %edi
 4d6:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4d9:	89 d7                	mov    %edx,%edi
 4db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4de:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e1:	fc                   	cld    
 4e2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4e4:	89 d0                	mov    %edx,%eax
 4e6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4e9:	c9                   	leave  
 4ea:	c3                   	ret    

000004eb <strchr>:

char*
strchr(const char *s, char c)
{
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4f5:	eb 03                	jmp    4fa <strchr+0xf>
 4f7:	83 c0 01             	add    $0x1,%eax
 4fa:	0f b6 10             	movzbl (%eax),%edx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	74 06                	je     507 <strchr+0x1c>
    if(*s == c)
 501:	38 ca                	cmp    %cl,%dl
 503:	75 f2                	jne    4f7 <strchr+0xc>
 505:	eb 05                	jmp    50c <strchr+0x21>
      return (char*)s;
  return 0;
 507:	b8 00 00 00 00       	mov    $0x0,%eax
}
 50c:	5d                   	pop    %ebp
 50d:	c3                   	ret    

0000050e <gets>:

char*
gets(char *buf, int max)
{
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
 511:	57                   	push   %edi
 512:	56                   	push   %esi
 513:	53                   	push   %ebx
 514:	83 ec 1c             	sub    $0x1c,%esp
 517:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 51a:	bb 00 00 00 00       	mov    $0x0,%ebx
 51f:	89 de                	mov    %ebx,%esi
 521:	83 c3 01             	add    $0x1,%ebx
 524:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 527:	7d 2e                	jge    557 <gets+0x49>
    cc = read(0, &c, 1);
 529:	83 ec 04             	sub    $0x4,%esp
 52c:	6a 01                	push   $0x1
 52e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 531:	50                   	push   %eax
 532:	6a 00                	push   $0x0
 534:	e8 9a 01 00 00       	call   6d3 <read>
    if(cc < 1)
 539:	83 c4 10             	add    $0x10,%esp
 53c:	85 c0                	test   %eax,%eax
 53e:	7e 17                	jle    557 <gets+0x49>
      break;
    buf[i++] = c;
 540:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 544:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 547:	3c 0a                	cmp    $0xa,%al
 549:	0f 94 c2             	sete   %dl
 54c:	3c 0d                	cmp    $0xd,%al
 54e:	0f 94 c0             	sete   %al
 551:	08 c2                	or     %al,%dl
 553:	74 ca                	je     51f <gets+0x11>
    buf[i++] = c;
 555:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 557:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 55b:	89 f8                	mov    %edi,%eax
 55d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5f                   	pop    %edi
 563:	5d                   	pop    %ebp
 564:	c3                   	ret    

00000565 <stat>:

int
stat(const char *n, struct stat *st)
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 56a:	83 ec 08             	sub    $0x8,%esp
 56d:	6a 00                	push   $0x0
 56f:	ff 75 08             	push   0x8(%ebp)
 572:	e8 84 01 00 00       	call   6fb <open>
  if(fd < 0)
 577:	83 c4 10             	add    $0x10,%esp
 57a:	85 c0                	test   %eax,%eax
 57c:	78 24                	js     5a2 <stat+0x3d>
 57e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 580:	83 ec 08             	sub    $0x8,%esp
 583:	ff 75 0c             	push   0xc(%ebp)
 586:	50                   	push   %eax
 587:	e8 87 01 00 00       	call   713 <fstat>
 58c:	89 c6                	mov    %eax,%esi
  close(fd);
 58e:	89 1c 24             	mov    %ebx,(%esp)
 591:	e8 4d 01 00 00       	call   6e3 <close>
  return r;
 596:	83 c4 10             	add    $0x10,%esp
}
 599:	89 f0                	mov    %esi,%eax
 59b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 59e:	5b                   	pop    %ebx
 59f:	5e                   	pop    %esi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret    
    return -1;
 5a2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5a7:	eb f0                	jmp    599 <stat+0x34>

000005a9 <atoi>:

int
atoi(const char *s)
{
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	53                   	push   %ebx
 5ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5b0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5b5:	eb 10                	jmp    5c7 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5b7:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5ba:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5bd:	83 c1 01             	add    $0x1,%ecx
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5c7:	0f b6 01             	movzbl (%ecx),%eax
 5ca:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5cd:	80 fb 09             	cmp    $0x9,%bl
 5d0:	76 e5                	jbe    5b7 <atoi+0xe>
  return n;
}
 5d2:	89 d0                	mov    %edx,%eax
 5d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d7:	c9                   	leave  
 5d8:	c3                   	ret    

000005d9 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	56                   	push   %esi
 5dd:	53                   	push   %ebx
 5de:	8b 75 08             	mov    0x8(%ebp),%esi
 5e1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5e4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5e7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5e9:	eb 0d                	jmp    5f8 <memmove+0x1f>
    *dst++ = *src++;
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	88 02                	mov    %al,(%edx)
 5f0:	8d 49 01             	lea    0x1(%ecx),%ecx
 5f3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5f6:	89 d8                	mov    %ebx,%eax
 5f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5fb:	85 c0                	test   %eax,%eax
 5fd:	7f ec                	jg     5eb <memmove+0x12>
  return vdst;
}
 5ff:	89 f0                	mov    %esi,%eax
 601:	5b                   	pop    %ebx
 602:	5e                   	pop    %esi
 603:	5d                   	pop    %ebp
 604:	c3                   	ret    

00000605 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 60b:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 60d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 610:	89 08                	mov    %ecx,(%eax)
  return old;
}
 612:	89 d0                	mov    %edx,%eax
 614:	5d                   	pop    %ebp
 615:	c3                   	ret    

00000616 <lock_init>:
void 
lock_init(lock_t *lock){
 616:	55                   	push   %ebp
 617:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 619:	8b 45 08             	mov    0x8(%ebp),%eax
 61c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    

00000624 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	53                   	push   %ebx
 628:	83 ec 04             	sub    $0x4,%esp
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 62e:	83 ec 08             	sub    $0x8,%esp
 631:	6a 01                	push   $0x1
 633:	53                   	push   %ebx
 634:	e8 cc ff ff ff       	call   605 <TestAndSet>
 639:	83 c4 10             	add    $0x10,%esp
 63c:	83 f8 01             	cmp    $0x1,%eax
 63f:	74 ed                	je     62e <lock_acquire+0xa>
    ;
}
 641:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 644:	c9                   	leave  
 645:	c3                   	ret    

00000646 <lock_release>:
void 
lock_release(lock_t *lock){
 646:	55                   	push   %ebp
 647:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 649:	8b 45 08             	mov    0x8(%ebp),%eax
 64c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    

00000654 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 65a:	68 04 20 00 00       	push   $0x2004
 65f:	e8 d2 03 00 00       	call   a36 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 664:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 667:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 669:	eb 03                	jmp    66e <thread_create+0x1a>
      stack += 1;
 66b:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 66e:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 674:	75 f5                	jne    66b <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 676:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 678:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 67b:	52                   	push   %edx
 67c:	ff 75 10             	push   0x10(%ebp)
 67f:	ff 75 0c             	push   0xc(%ebp)
 682:	ff 75 08             	push   0x8(%ebp)
 685:	e8 d1 00 00 00       	call   75b <clone>
 
    return pid;
}
 68a:	c9                   	leave  
 68b:	c3                   	ret    

0000068c <thread_join>:
int 
thread_join(){
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	53                   	push   %ebx
 690:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 693:	8d 45 f4             	lea    -0xc(%ebp),%eax
 696:	50                   	push   %eax
 697:	e8 c7 00 00 00       	call   763 <join>
 69c:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 69e:	83 c4 04             	add    $0x4,%esp
 6a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a4:	ff 70 fc             	push   -0x4(%eax)
 6a7:	e8 ca 02 00 00       	call   976 <free>
  return waitedForPID;
 6ac:	89 d8                	mov    %ebx,%eax
 6ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b1:	c9                   	leave  
 6b2:	c3                   	ret    

000006b3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6b3:	b8 01 00 00 00       	mov    $0x1,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <exit>:
SYSCALL(exit)
 6bb:	b8 02 00 00 00       	mov    $0x2,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <wait>:
SYSCALL(wait)
 6c3:	b8 03 00 00 00       	mov    $0x3,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <pipe>:
SYSCALL(pipe)
 6cb:	b8 04 00 00 00       	mov    $0x4,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <read>:
SYSCALL(read)
 6d3:	b8 05 00 00 00       	mov    $0x5,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <write>:
SYSCALL(write)
 6db:	b8 10 00 00 00       	mov    $0x10,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <close>:
SYSCALL(close)
 6e3:	b8 15 00 00 00       	mov    $0x15,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <kill>:
SYSCALL(kill)
 6eb:	b8 06 00 00 00       	mov    $0x6,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <exec>:
SYSCALL(exec)
 6f3:	b8 07 00 00 00       	mov    $0x7,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <open>:
SYSCALL(open)
 6fb:	b8 0f 00 00 00       	mov    $0xf,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <mknod>:
SYSCALL(mknod)
 703:	b8 11 00 00 00       	mov    $0x11,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <unlink>:
SYSCALL(unlink)
 70b:	b8 12 00 00 00       	mov    $0x12,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <fstat>:
SYSCALL(fstat)
 713:	b8 08 00 00 00       	mov    $0x8,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <link>:
SYSCALL(link)
 71b:	b8 13 00 00 00       	mov    $0x13,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <mkdir>:
SYSCALL(mkdir)
 723:	b8 14 00 00 00       	mov    $0x14,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <chdir>:
SYSCALL(chdir)
 72b:	b8 09 00 00 00       	mov    $0x9,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <dup>:
SYSCALL(dup)
 733:	b8 0a 00 00 00       	mov    $0xa,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <getpid>:
SYSCALL(getpid)
 73b:	b8 0b 00 00 00       	mov    $0xb,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <sbrk>:
SYSCALL(sbrk)
 743:	b8 0c 00 00 00       	mov    $0xc,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <sleep>:
SYSCALL(sleep)
 74b:	b8 0d 00 00 00       	mov    $0xd,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <uptime>:
SYSCALL(uptime)
 753:	b8 0e 00 00 00       	mov    $0xe,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <clone>:
SYSCALL(clone)
 75b:	b8 16 00 00 00       	mov    $0x16,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <join>:
SYSCALL(join)
 763:	b8 17 00 00 00       	mov    $0x17,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 76b:	55                   	push   %ebp
 76c:	89 e5                	mov    %esp,%ebp
 76e:	83 ec 1c             	sub    $0x1c,%esp
 771:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 774:	6a 01                	push   $0x1
 776:	8d 55 f4             	lea    -0xc(%ebp),%edx
 779:	52                   	push   %edx
 77a:	50                   	push   %eax
 77b:	e8 5b ff ff ff       	call   6db <write>
}
 780:	83 c4 10             	add    $0x10,%esp
 783:	c9                   	leave  
 784:	c3                   	ret    

00000785 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 785:	55                   	push   %ebp
 786:	89 e5                	mov    %esp,%ebp
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	53                   	push   %ebx
 78b:	83 ec 2c             	sub    $0x2c,%esp
 78e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 791:	89 d0                	mov    %edx,%eax
 793:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 795:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 799:	0f 95 c1             	setne  %cl
 79c:	c1 ea 1f             	shr    $0x1f,%edx
 79f:	84 d1                	test   %dl,%cl
 7a1:	74 44                	je     7e7 <printint+0x62>
    neg = 1;
    x = -xx;
 7a3:	f7 d8                	neg    %eax
 7a5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7a7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7ae:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7b3:	89 c8                	mov    %ecx,%eax
 7b5:	ba 00 00 00 00       	mov    $0x0,%edx
 7ba:	f7 f6                	div    %esi
 7bc:	89 df                	mov    %ebx,%edi
 7be:	83 c3 01             	add    $0x1,%ebx
 7c1:	0f b6 92 b8 0b 00 00 	movzbl 0xbb8(%edx),%edx
 7c8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7cc:	89 ca                	mov    %ecx,%edx
 7ce:	89 c1                	mov    %eax,%ecx
 7d0:	39 d6                	cmp    %edx,%esi
 7d2:	76 df                	jbe    7b3 <printint+0x2e>
  if(neg)
 7d4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7d8:	74 31                	je     80b <printint+0x86>
    buf[i++] = '-';
 7da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7df:	8d 5f 02             	lea    0x2(%edi),%ebx
 7e2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e5:	eb 17                	jmp    7fe <printint+0x79>
    x = xx;
 7e7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7e9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7f0:	eb bc                	jmp    7ae <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7f2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7f7:	89 f0                	mov    %esi,%eax
 7f9:	e8 6d ff ff ff       	call   76b <putc>
  while(--i >= 0)
 7fe:	83 eb 01             	sub    $0x1,%ebx
 801:	79 ef                	jns    7f2 <printint+0x6d>
}
 803:	83 c4 2c             	add    $0x2c,%esp
 806:	5b                   	pop    %ebx
 807:	5e                   	pop    %esi
 808:	5f                   	pop    %edi
 809:	5d                   	pop    %ebp
 80a:	c3                   	ret    
 80b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80e:	eb ee                	jmp    7fe <printint+0x79>

00000810 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 819:	8d 45 10             	lea    0x10(%ebp),%eax
 81c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 81f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 824:	bb 00 00 00 00       	mov    $0x0,%ebx
 829:	eb 14                	jmp    83f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 82b:	89 fa                	mov    %edi,%edx
 82d:	8b 45 08             	mov    0x8(%ebp),%eax
 830:	e8 36 ff ff ff       	call   76b <putc>
 835:	eb 05                	jmp    83c <printf+0x2c>
      }
    } else if(state == '%'){
 837:	83 fe 25             	cmp    $0x25,%esi
 83a:	74 25                	je     861 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 83c:	83 c3 01             	add    $0x1,%ebx
 83f:	8b 45 0c             	mov    0xc(%ebp),%eax
 842:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 846:	84 c0                	test   %al,%al
 848:	0f 84 20 01 00 00    	je     96e <printf+0x15e>
    c = fmt[i] & 0xff;
 84e:	0f be f8             	movsbl %al,%edi
 851:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 854:	85 f6                	test   %esi,%esi
 856:	75 df                	jne    837 <printf+0x27>
      if(c == '%'){
 858:	83 f8 25             	cmp    $0x25,%eax
 85b:	75 ce                	jne    82b <printf+0x1b>
        state = '%';
 85d:	89 c6                	mov    %eax,%esi
 85f:	eb db                	jmp    83c <printf+0x2c>
      if(c == 'd'){
 861:	83 f8 25             	cmp    $0x25,%eax
 864:	0f 84 cf 00 00 00    	je     939 <printf+0x129>
 86a:	0f 8c dd 00 00 00    	jl     94d <printf+0x13d>
 870:	83 f8 78             	cmp    $0x78,%eax
 873:	0f 8f d4 00 00 00    	jg     94d <printf+0x13d>
 879:	83 f8 63             	cmp    $0x63,%eax
 87c:	0f 8c cb 00 00 00    	jl     94d <printf+0x13d>
 882:	83 e8 63             	sub    $0x63,%eax
 885:	83 f8 15             	cmp    $0x15,%eax
 888:	0f 87 bf 00 00 00    	ja     94d <printf+0x13d>
 88e:	ff 24 85 60 0b 00 00 	jmp    *0xb60(,%eax,4)
        printint(fd, *ap, 10, 1);
 895:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 898:	8b 17                	mov    (%edi),%edx
 89a:	83 ec 0c             	sub    $0xc,%esp
 89d:	6a 01                	push   $0x1
 89f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	e8 d9 fe ff ff       	call   785 <printint>
        ap++;
 8ac:	83 c7 04             	add    $0x4,%edi
 8af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b2:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8b5:	be 00 00 00 00       	mov    $0x0,%esi
 8ba:	eb 80                	jmp    83c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8bf:	8b 17                	mov    (%edi),%edx
 8c1:	83 ec 0c             	sub    $0xc,%esp
 8c4:	6a 00                	push   $0x0
 8c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 8cb:	8b 45 08             	mov    0x8(%ebp),%eax
 8ce:	e8 b2 fe ff ff       	call   785 <printint>
        ap++;
 8d3:	83 c7 04             	add    $0x4,%edi
 8d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8dc:	be 00 00 00 00       	mov    $0x0,%esi
 8e1:	e9 56 ff ff ff       	jmp    83c <printf+0x2c>
        s = (char*)*ap;
 8e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8e9:	8b 30                	mov    (%eax),%esi
        ap++;
 8eb:	83 c0 04             	add    $0x4,%eax
 8ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8f1:	85 f6                	test   %esi,%esi
 8f3:	75 15                	jne    90a <printf+0xfa>
          s = "(null)";
 8f5:	be 58 0b 00 00       	mov    $0xb58,%esi
 8fa:	eb 0e                	jmp    90a <printf+0xfa>
          putc(fd, *s);
 8fc:	0f be d2             	movsbl %dl,%edx
 8ff:	8b 45 08             	mov    0x8(%ebp),%eax
 902:	e8 64 fe ff ff       	call   76b <putc>
          s++;
 907:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 90a:	0f b6 16             	movzbl (%esi),%edx
 90d:	84 d2                	test   %dl,%dl
 90f:	75 eb                	jne    8fc <printf+0xec>
      state = 0;
 911:	be 00 00 00 00       	mov    $0x0,%esi
 916:	e9 21 ff ff ff       	jmp    83c <printf+0x2c>
        putc(fd, *ap);
 91b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 91e:	0f be 17             	movsbl (%edi),%edx
 921:	8b 45 08             	mov    0x8(%ebp),%eax
 924:	e8 42 fe ff ff       	call   76b <putc>
        ap++;
 929:	83 c7 04             	add    $0x4,%edi
 92c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 92f:	be 00 00 00 00       	mov    $0x0,%esi
 934:	e9 03 ff ff ff       	jmp    83c <printf+0x2c>
        putc(fd, c);
 939:	89 fa                	mov    %edi,%edx
 93b:	8b 45 08             	mov    0x8(%ebp),%eax
 93e:	e8 28 fe ff ff       	call   76b <putc>
      state = 0;
 943:	be 00 00 00 00       	mov    $0x0,%esi
 948:	e9 ef fe ff ff       	jmp    83c <printf+0x2c>
        putc(fd, '%');
 94d:	ba 25 00 00 00       	mov    $0x25,%edx
 952:	8b 45 08             	mov    0x8(%ebp),%eax
 955:	e8 11 fe ff ff       	call   76b <putc>
        putc(fd, c);
 95a:	89 fa                	mov    %edi,%edx
 95c:	8b 45 08             	mov    0x8(%ebp),%eax
 95f:	e8 07 fe ff ff       	call   76b <putc>
      state = 0;
 964:	be 00 00 00 00       	mov    $0x0,%esi
 969:	e9 ce fe ff ff       	jmp    83c <printf+0x2c>
    }
  }
}
 96e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 971:	5b                   	pop    %ebx
 972:	5e                   	pop    %esi
 973:	5f                   	pop    %edi
 974:	5d                   	pop    %ebp
 975:	c3                   	ret    

00000976 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 976:	55                   	push   %ebp
 977:	89 e5                	mov    %esp,%ebp
 979:	57                   	push   %edi
 97a:	56                   	push   %esi
 97b:	53                   	push   %ebx
 97c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 97f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 982:	a1 74 0f 00 00       	mov    0xf74,%eax
 987:	eb 02                	jmp    98b <free+0x15>
 989:	89 d0                	mov    %edx,%eax
 98b:	39 c8                	cmp    %ecx,%eax
 98d:	73 04                	jae    993 <free+0x1d>
 98f:	39 08                	cmp    %ecx,(%eax)
 991:	77 12                	ja     9a5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 993:	8b 10                	mov    (%eax),%edx
 995:	39 c2                	cmp    %eax,%edx
 997:	77 f0                	ja     989 <free+0x13>
 999:	39 c8                	cmp    %ecx,%eax
 99b:	72 08                	jb     9a5 <free+0x2f>
 99d:	39 ca                	cmp    %ecx,%edx
 99f:	77 04                	ja     9a5 <free+0x2f>
 9a1:	89 d0                	mov    %edx,%eax
 9a3:	eb e6                	jmp    98b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ab:	8b 10                	mov    (%eax),%edx
 9ad:	39 d7                	cmp    %edx,%edi
 9af:	74 19                	je     9ca <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9b1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b4:	8b 50 04             	mov    0x4(%eax),%edx
 9b7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9ba:	39 ce                	cmp    %ecx,%esi
 9bc:	74 1b                	je     9d9 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9be:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9c0:	a3 74 0f 00 00       	mov    %eax,0xf74
}
 9c5:	5b                   	pop    %ebx
 9c6:	5e                   	pop    %esi
 9c7:	5f                   	pop    %edi
 9c8:	5d                   	pop    %ebp
 9c9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9ca:	03 72 04             	add    0x4(%edx),%esi
 9cd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9d0:	8b 10                	mov    (%eax),%edx
 9d2:	8b 12                	mov    (%edx),%edx
 9d4:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9d7:	eb db                	jmp    9b4 <free+0x3e>
    p->s.size += bp->s.size;
 9d9:	03 53 fc             	add    -0x4(%ebx),%edx
 9dc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9df:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9e2:	89 10                	mov    %edx,(%eax)
 9e4:	eb da                	jmp    9c0 <free+0x4a>

000009e6 <morecore>:

static Header*
morecore(uint nu)
{
 9e6:	55                   	push   %ebp
 9e7:	89 e5                	mov    %esp,%ebp
 9e9:	53                   	push   %ebx
 9ea:	83 ec 04             	sub    $0x4,%esp
 9ed:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9ef:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9f4:	77 05                	ja     9fb <morecore+0x15>
    nu = 4096;
 9f6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9fb:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a02:	83 ec 0c             	sub    $0xc,%esp
 a05:	50                   	push   %eax
 a06:	e8 38 fd ff ff       	call   743 <sbrk>
  if(p == (char*)-1)
 a0b:	83 c4 10             	add    $0x10,%esp
 a0e:	83 f8 ff             	cmp    $0xffffffff,%eax
 a11:	74 1c                	je     a2f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a13:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a16:	83 c0 08             	add    $0x8,%eax
 a19:	83 ec 0c             	sub    $0xc,%esp
 a1c:	50                   	push   %eax
 a1d:	e8 54 ff ff ff       	call   976 <free>
  return freep;
 a22:	a1 74 0f 00 00       	mov    0xf74,%eax
 a27:	83 c4 10             	add    $0x10,%esp
}
 a2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a2d:	c9                   	leave  
 a2e:	c3                   	ret    
    return 0;
 a2f:	b8 00 00 00 00       	mov    $0x0,%eax
 a34:	eb f4                	jmp    a2a <morecore+0x44>

00000a36 <malloc>:

void*
malloc(uint nbytes)
{
 a36:	55                   	push   %ebp
 a37:	89 e5                	mov    %esp,%ebp
 a39:	53                   	push   %ebx
 a3a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3d:	8b 45 08             	mov    0x8(%ebp),%eax
 a40:	8d 58 07             	lea    0x7(%eax),%ebx
 a43:	c1 eb 03             	shr    $0x3,%ebx
 a46:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a49:	8b 0d 74 0f 00 00    	mov    0xf74,%ecx
 a4f:	85 c9                	test   %ecx,%ecx
 a51:	74 04                	je     a57 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a53:	8b 01                	mov    (%ecx),%eax
 a55:	eb 4a                	jmp    aa1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a57:	c7 05 74 0f 00 00 78 	movl   $0xf78,0xf74
 a5e:	0f 00 00 
 a61:	c7 05 78 0f 00 00 78 	movl   $0xf78,0xf78
 a68:	0f 00 00 
    base.s.size = 0;
 a6b:	c7 05 7c 0f 00 00 00 	movl   $0x0,0xf7c
 a72:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a75:	b9 78 0f 00 00       	mov    $0xf78,%ecx
 a7a:	eb d7                	jmp    a53 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a7c:	74 19                	je     a97 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a7e:	29 da                	sub    %ebx,%edx
 a80:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a83:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a86:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a89:	89 0d 74 0f 00 00    	mov    %ecx,0xf74
      return (void*)(p + 1);
 a8f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a95:	c9                   	leave  
 a96:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a97:	8b 10                	mov    (%eax),%edx
 a99:	89 11                	mov    %edx,(%ecx)
 a9b:	eb ec                	jmp    a89 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9d:	89 c1                	mov    %eax,%ecx
 a9f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 aa1:	8b 50 04             	mov    0x4(%eax),%edx
 aa4:	39 da                	cmp    %ebx,%edx
 aa6:	73 d4                	jae    a7c <malloc+0x46>
    if(p == freep)
 aa8:	39 05 74 0f 00 00    	cmp    %eax,0xf74
 aae:	75 ed                	jne    a9d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ab0:	89 d8                	mov    %ebx,%eax
 ab2:	e8 2f ff ff ff       	call   9e6 <morecore>
 ab7:	85 c0                	test   %eax,%eax
 ab9:	75 e2                	jne    a9d <malloc+0x67>
 abb:	eb d5                	jmp    a92 <malloc+0x5c>
