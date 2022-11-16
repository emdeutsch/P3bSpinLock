
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
   6:	68 60 0f 00 00       	push   $0xf60
   b:	e8 14 06 00 00       	call   624 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 26 07 00 00       	call   742 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 64 0f 00 00    	cmp    0xf64,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 bc 0a 00 00       	push   $0xabc
  2e:	68 c6 0a 00 00       	push   $0xac6
  33:	6a 01                	push   $0x1
  35:	e8 d5 07 00 00       	call   80f <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 ce 0a 00 00       	push   $0xace
  42:	68 ec 0a 00 00       	push   $0xaec
  47:	6a 01                	push   $0x1
  49:	e8 c1 07 00 00       	call   80f <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 00 0b 00 00       	push   $0xb00
  56:	6a 01                	push   $0x1
  58:	e8 b2 07 00 00       	call   80f <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 6c 0f 00 00    	push   0xf6c
  66:	e8 7f 06 00 00       	call   6ea <kill>
  6b:	e8 4a 06 00 00       	call   6ba <exit>
   global++;
  70:	83 05 68 0f 00 00 01 	addl   $0x1,0xf68
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 60 0f 00 00       	push   $0xf60
  7f:	e8 c2 05 00 00       	call   646 <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
  8b:	e8 94 05 00 00       	call   624 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 a6 06 00 00       	call   742 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 64 0f 00 00    	cmp    0xf64,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 bc 0a 00 00       	push   $0xabc
  ae:	68 c6 0a 00 00       	push   $0xac6
  b3:	6a 01                	push   $0x1
  b5:	e8 55 07 00 00       	call   80f <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 ce 0a 00 00       	push   $0xace
  c2:	68 ec 0a 00 00       	push   $0xaec
  c7:	6a 01                	push   $0x1
  c9:	e8 41 07 00 00       	call   80f <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 00 0b 00 00       	push   $0xb00
  d6:	6a 01                	push   $0x1
  d8:	e8 32 07 00 00       	call   80f <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 6c 0f 00 00    	push   0xf6c
  e6:	e8 ff 05 00 00       	call   6ea <kill>
  eb:	e8 ca 05 00 00       	call   6ba <exit>
   global++;
  f0:	83 05 68 0f 00 00 01 	addl   $0x1,0xf68
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 3e 06 00 00       	call   742 <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 32 06 00 00       	call   742 <sbrk>
 110:	a3 64 0f 00 00       	mov    %eax,0xf64
   lock_release(&lock2);
 115:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
 11c:	e8 25 05 00 00       	call   646 <lock_release>



   exit();
 121:	e8 94 05 00 00       	call   6ba <exit>

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
 138:	e8 fd 05 00 00       	call   73a <getpid>
 13d:	a3 6c 0f 00 00       	mov    %eax,0xf6c
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 60 0f 00 00       	push   $0xf60
 158:	e8 b9 04 00 00       	call   616 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
 164:	e8 ad 04 00 00       	call   616 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
 170:	e8 af 04 00 00       	call   624 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
 17c:	e8 a3 04 00 00       	call   624 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d 58 0f 00 00    	cmp    %ebx,0xf58
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
 1b4:	68 bc 0a 00 00       	push   $0xabc
 1b9:	68 c6 0a 00 00       	push   $0xac6
 1be:	6a 01                	push   $0x1
 1c0:	e8 4a 06 00 00       	call   80f <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 0d 0b 00 00       	push   $0xb0d
 1cd:	68 ec 0a 00 00       	push   $0xaec
 1d2:	6a 01                	push   $0x1
 1d4:	e8 36 06 00 00       	call   80f <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 00 0b 00 00       	push   $0xb00
 1e1:	6a 01                	push   $0x1
 1e3:	e8 27 06 00 00       	call   80f <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 6c 0f 00 00    	push   0xf6c
 1f1:	e8 f4 04 00 00       	call   6ea <kill>
 1f6:	e8 bf 04 00 00       	call   6ba <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 3d 05 00 00       	call   742 <sbrk>
 205:	a3 64 0f 00 00       	mov    %eax,0xf64
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 58 0f 00 00       	mov    0xf58,%eax
 212:	39 05 68 0f 00 00    	cmp    %eax,0xf68
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 60 0f 00 00       	push   $0xf60
 222:	e8 1f 04 00 00       	call   646 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 17 05 00 00       	call   74a <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
 23a:	e8 e5 03 00 00       	call   624 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 e7 04 00 00       	call   742 <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 db 04 00 00       	call   742 <sbrk>
 267:	a3 64 0f 00 00       	mov    %eax,0xf64
   lock_release(&lock);
 26c:	c7 04 24 60 0f 00 00 	movl   $0xf60,(%esp)
 273:	e8 ce 03 00 00       	call   646 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 58 0f 00 00       	mov    0xf58,%eax
 280:	39 05 68 0f 00 00    	cmp    %eax,0xf68
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 5c 0f 00 00       	push   $0xf5c
 290:	e8 b1 03 00 00       	call   646 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 a9 04 00 00       	call   74a <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 5c 0f 00 00 	movl   $0xf5c,(%esp)
 2a8:	e8 77 03 00 00       	call   624 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 5c 0f 00 00       	push   $0xf5c
 2ba:	e8 87 03 00 00       	call   646 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 58 0f 00 00    	cmp    %ebx,0xf58
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 b7 03 00 00       	call   68b <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 bc 0a 00 00       	push   $0xabc
 2e4:	68 c6 0a 00 00       	push   $0xac6
 2e9:	6a 01                	push   $0x1
 2eb:	e8 1f 05 00 00       	call   80f <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 1c 0b 00 00       	push   $0xb1c
 2f8:	68 ec 0a 00 00       	push   $0xaec
 2fd:	6a 01                	push   $0x1
 2ff:	e8 0b 05 00 00       	call   80f <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 00 0b 00 00       	push   $0xb00
 30c:	6a 01                	push   $0x1
 30e:	e8 fc 04 00 00       	call   80f <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 6c 0f 00 00    	push   0xf6c
 31c:	e8 c9 03 00 00       	call   6ea <kill>
 321:	e8 94 03 00 00       	call   6ba <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 29 0b 00 00       	push   $0xb29
 32e:	6a 01                	push   $0x1
 330:	e8 da 04 00 00       	call   80f <printf>
   exit();
 335:	e8 80 03 00 00       	call   6ba <exit>

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
 358:	68 bc 0a 00 00       	push   $0xabc
 35d:	68 c6 0a 00 00       	push   $0xac6
 362:	6a 01                	push   $0x1
 364:	e8 a6 04 00 00       	call   80f <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 45 0b 00 00       	push   $0xb45
 371:	68 ec 0a 00 00       	push   $0xaec
 376:	6a 01                	push   $0x1
 378:	e8 92 04 00 00       	call   80f <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 00 0b 00 00       	push   $0xb00
 385:	6a 01                	push   $0x1
 387:	e8 83 04 00 00       	call   80f <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 6c 0f 00 00    	push   0xf6c
 395:	e8 50 03 00 00       	call   6ea <kill>
 39a:	e8 1b 03 00 00       	call   6ba <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 bc 0a 00 00       	push   $0xabc
 3a6:	68 c6 0a 00 00       	push   $0xac6
 3ab:	6a 01                	push   $0x1
 3ad:	e8 5d 04 00 00       	call   80f <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 36 0b 00 00       	push   $0xb36
 3ba:	68 ec 0a 00 00       	push   $0xaec
 3bf:	6a 01                	push   $0x1
 3c1:	e8 49 04 00 00       	call   80f <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 00 0b 00 00       	push   $0xb00
 3ce:	6a 01                	push   $0x1
 3d0:	e8 3a 04 00 00       	call   80f <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 6c 0f 00 00    	push   0xf6c
 3de:	e8 07 03 00 00       	call   6ea <kill>
 3e3:	e8 d2 02 00 00       	call   6ba <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 5c 0f 00 00       	push   $0xf5c
 3f0:	e8 2f 02 00 00       	call   624 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 41 03 00 00       	call   742 <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 64 0f 00 00    	cmp    0xf64,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 bc 0a 00 00       	push   $0xabc
 413:	68 c6 0a 00 00       	push   $0xac6
 418:	6a 01                	push   $0x1
 41a:	e8 f0 03 00 00       	call   80f <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 ce 0a 00 00       	push   $0xace
 427:	68 ec 0a 00 00       	push   $0xaec
 42c:	6a 01                	push   $0x1
 42e:	e8 dc 03 00 00       	call   80f <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 00 0b 00 00       	push   $0xb00
 43b:	6a 01                	push   $0x1
 43d:	e8 cd 03 00 00       	call   80f <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 6c 0f 00 00    	push   0xf6c
 44b:	e8 9a 02 00 00       	call   6ea <kill>
 450:	e8 65 02 00 00       	call   6ba <exit>
   global++;
 455:	83 05 68 0f 00 00 01 	addl   $0x1,0xf68
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 5c 0f 00 00       	push   $0xf5c
 464:	e8 dd 01 00 00       	call   646 <lock_release>
   exit();
 469:	e8 4c 02 00 00       	call   6ba <exit>

0000046e <strcpy>:
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
 534:	e8 99 01 00 00       	call   6d2 <read>
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
 572:	e8 83 01 00 00       	call   6fa <open>
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
 587:	e8 86 01 00 00       	call   712 <fstat>
 58c:	89 c6                	mov    %eax,%esi
  close(fd);
 58e:	89 1c 24             	mov    %ebx,(%esp)
 591:	e8 4c 01 00 00       	call   6e2 <close>
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
 65f:	e8 d1 03 00 00       	call   a35 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 664:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 667:	83 c4 10             	add    $0x10,%esp
 66a:	eb 03                	jmp    66f <thread_create+0x1b>
      stack += 1;
 66c:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 66f:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 675:	75 f5                	jne    66c <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 677:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 67a:	52                   	push   %edx
 67b:	ff 75 10             	push   0x10(%ebp)
 67e:	ff 75 0c             	push   0xc(%ebp)
 681:	ff 75 08             	push   0x8(%ebp)
 684:	e8 d1 00 00 00       	call   75a <clone>
 
    return pid;
}
 689:	c9                   	leave  
 68a:	c3                   	ret    

0000068b <thread_join>:
int 
thread_join(){
 68b:	55                   	push   %ebp
 68c:	89 e5                	mov    %esp,%ebp
 68e:	53                   	push   %ebx
 68f:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 692:	8d 45 f4             	lea    -0xc(%ebp),%eax
 695:	50                   	push   %eax
 696:	e8 c7 00 00 00       	call   762 <join>
 69b:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 69d:	83 c4 04             	add    $0x4,%esp
 6a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a3:	ff 70 fc             	push   -0x4(%eax)
 6a6:	e8 ca 02 00 00       	call   975 <free>
  return pid;
 6ab:	89 d8                	mov    %ebx,%eax
 6ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b0:	c9                   	leave  
 6b1:	c3                   	ret    

000006b2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6b2:	b8 01 00 00 00       	mov    $0x1,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <exit>:
SYSCALL(exit)
 6ba:	b8 02 00 00 00       	mov    $0x2,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <wait>:
SYSCALL(wait)
 6c2:	b8 03 00 00 00       	mov    $0x3,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <pipe>:
SYSCALL(pipe)
 6ca:	b8 04 00 00 00       	mov    $0x4,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <read>:
SYSCALL(read)
 6d2:	b8 05 00 00 00       	mov    $0x5,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <write>:
SYSCALL(write)
 6da:	b8 10 00 00 00       	mov    $0x10,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <close>:
SYSCALL(close)
 6e2:	b8 15 00 00 00       	mov    $0x15,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <kill>:
SYSCALL(kill)
 6ea:	b8 06 00 00 00       	mov    $0x6,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <exec>:
SYSCALL(exec)
 6f2:	b8 07 00 00 00       	mov    $0x7,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <open>:
SYSCALL(open)
 6fa:	b8 0f 00 00 00       	mov    $0xf,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <mknod>:
SYSCALL(mknod)
 702:	b8 11 00 00 00       	mov    $0x11,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <unlink>:
SYSCALL(unlink)
 70a:	b8 12 00 00 00       	mov    $0x12,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <fstat>:
SYSCALL(fstat)
 712:	b8 08 00 00 00       	mov    $0x8,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <link>:
SYSCALL(link)
 71a:	b8 13 00 00 00       	mov    $0x13,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <mkdir>:
SYSCALL(mkdir)
 722:	b8 14 00 00 00       	mov    $0x14,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <chdir>:
SYSCALL(chdir)
 72a:	b8 09 00 00 00       	mov    $0x9,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <dup>:
SYSCALL(dup)
 732:	b8 0a 00 00 00       	mov    $0xa,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <getpid>:
SYSCALL(getpid)
 73a:	b8 0b 00 00 00       	mov    $0xb,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <sbrk>:
SYSCALL(sbrk)
 742:	b8 0c 00 00 00       	mov    $0xc,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <sleep>:
SYSCALL(sleep)
 74a:	b8 0d 00 00 00       	mov    $0xd,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <uptime>:
SYSCALL(uptime)
 752:	b8 0e 00 00 00       	mov    $0xe,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <clone>:
SYSCALL(clone)
 75a:	b8 16 00 00 00       	mov    $0x16,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <join>:
SYSCALL(join)
 762:	b8 17 00 00 00       	mov    $0x17,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 76a:	55                   	push   %ebp
 76b:	89 e5                	mov    %esp,%ebp
 76d:	83 ec 1c             	sub    $0x1c,%esp
 770:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 773:	6a 01                	push   $0x1
 775:	8d 55 f4             	lea    -0xc(%ebp),%edx
 778:	52                   	push   %edx
 779:	50                   	push   %eax
 77a:	e8 5b ff ff ff       	call   6da <write>
}
 77f:	83 c4 10             	add    $0x10,%esp
 782:	c9                   	leave  
 783:	c3                   	ret    

00000784 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 784:	55                   	push   %ebp
 785:	89 e5                	mov    %esp,%ebp
 787:	57                   	push   %edi
 788:	56                   	push   %esi
 789:	53                   	push   %ebx
 78a:	83 ec 2c             	sub    $0x2c,%esp
 78d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 790:	89 d0                	mov    %edx,%eax
 792:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 794:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 798:	0f 95 c1             	setne  %cl
 79b:	c1 ea 1f             	shr    $0x1f,%edx
 79e:	84 d1                	test   %dl,%cl
 7a0:	74 44                	je     7e6 <printint+0x62>
    neg = 1;
    x = -xx;
 7a2:	f7 d8                	neg    %eax
 7a4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7a6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7ad:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7b2:	89 c8                	mov    %ecx,%eax
 7b4:	ba 00 00 00 00       	mov    $0x0,%edx
 7b9:	f7 f6                	div    %esi
 7bb:	89 df                	mov    %ebx,%edi
 7bd:	83 c3 01             	add    $0x1,%ebx
 7c0:	0f b6 92 b4 0b 00 00 	movzbl 0xbb4(%edx),%edx
 7c7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7cb:	89 ca                	mov    %ecx,%edx
 7cd:	89 c1                	mov    %eax,%ecx
 7cf:	39 d6                	cmp    %edx,%esi
 7d1:	76 df                	jbe    7b2 <printint+0x2e>
  if(neg)
 7d3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7d7:	74 31                	je     80a <printint+0x86>
    buf[i++] = '-';
 7d9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7de:	8d 5f 02             	lea    0x2(%edi),%ebx
 7e1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e4:	eb 17                	jmp    7fd <printint+0x79>
    x = xx;
 7e6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7e8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7ef:	eb bc                	jmp    7ad <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7f1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7f6:	89 f0                	mov    %esi,%eax
 7f8:	e8 6d ff ff ff       	call   76a <putc>
  while(--i >= 0)
 7fd:	83 eb 01             	sub    $0x1,%ebx
 800:	79 ef                	jns    7f1 <printint+0x6d>
}
 802:	83 c4 2c             	add    $0x2c,%esp
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret    
 80a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80d:	eb ee                	jmp    7fd <printint+0x79>

0000080f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 80f:	55                   	push   %ebp
 810:	89 e5                	mov    %esp,%ebp
 812:	57                   	push   %edi
 813:	56                   	push   %esi
 814:	53                   	push   %ebx
 815:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 818:	8d 45 10             	lea    0x10(%ebp),%eax
 81b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 81e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 823:	bb 00 00 00 00       	mov    $0x0,%ebx
 828:	eb 14                	jmp    83e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 82a:	89 fa                	mov    %edi,%edx
 82c:	8b 45 08             	mov    0x8(%ebp),%eax
 82f:	e8 36 ff ff ff       	call   76a <putc>
 834:	eb 05                	jmp    83b <printf+0x2c>
      }
    } else if(state == '%'){
 836:	83 fe 25             	cmp    $0x25,%esi
 839:	74 25                	je     860 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 83b:	83 c3 01             	add    $0x1,%ebx
 83e:	8b 45 0c             	mov    0xc(%ebp),%eax
 841:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 845:	84 c0                	test   %al,%al
 847:	0f 84 20 01 00 00    	je     96d <printf+0x15e>
    c = fmt[i] & 0xff;
 84d:	0f be f8             	movsbl %al,%edi
 850:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 853:	85 f6                	test   %esi,%esi
 855:	75 df                	jne    836 <printf+0x27>
      if(c == '%'){
 857:	83 f8 25             	cmp    $0x25,%eax
 85a:	75 ce                	jne    82a <printf+0x1b>
        state = '%';
 85c:	89 c6                	mov    %eax,%esi
 85e:	eb db                	jmp    83b <printf+0x2c>
      if(c == 'd'){
 860:	83 f8 25             	cmp    $0x25,%eax
 863:	0f 84 cf 00 00 00    	je     938 <printf+0x129>
 869:	0f 8c dd 00 00 00    	jl     94c <printf+0x13d>
 86f:	83 f8 78             	cmp    $0x78,%eax
 872:	0f 8f d4 00 00 00    	jg     94c <printf+0x13d>
 878:	83 f8 63             	cmp    $0x63,%eax
 87b:	0f 8c cb 00 00 00    	jl     94c <printf+0x13d>
 881:	83 e8 63             	sub    $0x63,%eax
 884:	83 f8 15             	cmp    $0x15,%eax
 887:	0f 87 bf 00 00 00    	ja     94c <printf+0x13d>
 88d:	ff 24 85 5c 0b 00 00 	jmp    *0xb5c(,%eax,4)
        printint(fd, *ap, 10, 1);
 894:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 897:	8b 17                	mov    (%edi),%edx
 899:	83 ec 0c             	sub    $0xc,%esp
 89c:	6a 01                	push   $0x1
 89e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	e8 d9 fe ff ff       	call   784 <printint>
        ap++;
 8ab:	83 c7 04             	add    $0x4,%edi
 8ae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b1:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8b4:	be 00 00 00 00       	mov    $0x0,%esi
 8b9:	eb 80                	jmp    83b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8bb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8be:	8b 17                	mov    (%edi),%edx
 8c0:	83 ec 0c             	sub    $0xc,%esp
 8c3:	6a 00                	push   $0x0
 8c5:	b9 10 00 00 00       	mov    $0x10,%ecx
 8ca:	8b 45 08             	mov    0x8(%ebp),%eax
 8cd:	e8 b2 fe ff ff       	call   784 <printint>
        ap++;
 8d2:	83 c7 04             	add    $0x4,%edi
 8d5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8db:	be 00 00 00 00       	mov    $0x0,%esi
 8e0:	e9 56 ff ff ff       	jmp    83b <printf+0x2c>
        s = (char*)*ap;
 8e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8e8:	8b 30                	mov    (%eax),%esi
        ap++;
 8ea:	83 c0 04             	add    $0x4,%eax
 8ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8f0:	85 f6                	test   %esi,%esi
 8f2:	75 15                	jne    909 <printf+0xfa>
          s = "(null)";
 8f4:	be 54 0b 00 00       	mov    $0xb54,%esi
 8f9:	eb 0e                	jmp    909 <printf+0xfa>
          putc(fd, *s);
 8fb:	0f be d2             	movsbl %dl,%edx
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	e8 64 fe ff ff       	call   76a <putc>
          s++;
 906:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 909:	0f b6 16             	movzbl (%esi),%edx
 90c:	84 d2                	test   %dl,%dl
 90e:	75 eb                	jne    8fb <printf+0xec>
      state = 0;
 910:	be 00 00 00 00       	mov    $0x0,%esi
 915:	e9 21 ff ff ff       	jmp    83b <printf+0x2c>
        putc(fd, *ap);
 91a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 91d:	0f be 17             	movsbl (%edi),%edx
 920:	8b 45 08             	mov    0x8(%ebp),%eax
 923:	e8 42 fe ff ff       	call   76a <putc>
        ap++;
 928:	83 c7 04             	add    $0x4,%edi
 92b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 92e:	be 00 00 00 00       	mov    $0x0,%esi
 933:	e9 03 ff ff ff       	jmp    83b <printf+0x2c>
        putc(fd, c);
 938:	89 fa                	mov    %edi,%edx
 93a:	8b 45 08             	mov    0x8(%ebp),%eax
 93d:	e8 28 fe ff ff       	call   76a <putc>
      state = 0;
 942:	be 00 00 00 00       	mov    $0x0,%esi
 947:	e9 ef fe ff ff       	jmp    83b <printf+0x2c>
        putc(fd, '%');
 94c:	ba 25 00 00 00       	mov    $0x25,%edx
 951:	8b 45 08             	mov    0x8(%ebp),%eax
 954:	e8 11 fe ff ff       	call   76a <putc>
        putc(fd, c);
 959:	89 fa                	mov    %edi,%edx
 95b:	8b 45 08             	mov    0x8(%ebp),%eax
 95e:	e8 07 fe ff ff       	call   76a <putc>
      state = 0;
 963:	be 00 00 00 00       	mov    $0x0,%esi
 968:	e9 ce fe ff ff       	jmp    83b <printf+0x2c>
    }
  }
}
 96d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 970:	5b                   	pop    %ebx
 971:	5e                   	pop    %esi
 972:	5f                   	pop    %edi
 973:	5d                   	pop    %ebp
 974:	c3                   	ret    

00000975 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 975:	55                   	push   %ebp
 976:	89 e5                	mov    %esp,%ebp
 978:	57                   	push   %edi
 979:	56                   	push   %esi
 97a:	53                   	push   %ebx
 97b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 97e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 981:	a1 70 0f 00 00       	mov    0xf70,%eax
 986:	eb 02                	jmp    98a <free+0x15>
 988:	89 d0                	mov    %edx,%eax
 98a:	39 c8                	cmp    %ecx,%eax
 98c:	73 04                	jae    992 <free+0x1d>
 98e:	39 08                	cmp    %ecx,(%eax)
 990:	77 12                	ja     9a4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 992:	8b 10                	mov    (%eax),%edx
 994:	39 c2                	cmp    %eax,%edx
 996:	77 f0                	ja     988 <free+0x13>
 998:	39 c8                	cmp    %ecx,%eax
 99a:	72 08                	jb     9a4 <free+0x2f>
 99c:	39 ca                	cmp    %ecx,%edx
 99e:	77 04                	ja     9a4 <free+0x2f>
 9a0:	89 d0                	mov    %edx,%eax
 9a2:	eb e6                	jmp    98a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9aa:	8b 10                	mov    (%eax),%edx
 9ac:	39 d7                	cmp    %edx,%edi
 9ae:	74 19                	je     9c9 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9b0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b3:	8b 50 04             	mov    0x4(%eax),%edx
 9b6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b9:	39 ce                	cmp    %ecx,%esi
 9bb:	74 1b                	je     9d8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9bd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9bf:	a3 70 0f 00 00       	mov    %eax,0xf70
}
 9c4:	5b                   	pop    %ebx
 9c5:	5e                   	pop    %esi
 9c6:	5f                   	pop    %edi
 9c7:	5d                   	pop    %ebp
 9c8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9c9:	03 72 04             	add    0x4(%edx),%esi
 9cc:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9cf:	8b 10                	mov    (%eax),%edx
 9d1:	8b 12                	mov    (%edx),%edx
 9d3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9d6:	eb db                	jmp    9b3 <free+0x3e>
    p->s.size += bp->s.size;
 9d8:	03 53 fc             	add    -0x4(%ebx),%edx
 9db:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9de:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9e1:	89 10                	mov    %edx,(%eax)
 9e3:	eb da                	jmp    9bf <free+0x4a>

000009e5 <morecore>:

static Header*
morecore(uint nu)
{
 9e5:	55                   	push   %ebp
 9e6:	89 e5                	mov    %esp,%ebp
 9e8:	53                   	push   %ebx
 9e9:	83 ec 04             	sub    $0x4,%esp
 9ec:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9ee:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9f3:	77 05                	ja     9fa <morecore+0x15>
    nu = 4096;
 9f5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9fa:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a01:	83 ec 0c             	sub    $0xc,%esp
 a04:	50                   	push   %eax
 a05:	e8 38 fd ff ff       	call   742 <sbrk>
  if(p == (char*)-1)
 a0a:	83 c4 10             	add    $0x10,%esp
 a0d:	83 f8 ff             	cmp    $0xffffffff,%eax
 a10:	74 1c                	je     a2e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a12:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a15:	83 c0 08             	add    $0x8,%eax
 a18:	83 ec 0c             	sub    $0xc,%esp
 a1b:	50                   	push   %eax
 a1c:	e8 54 ff ff ff       	call   975 <free>
  return freep;
 a21:	a1 70 0f 00 00       	mov    0xf70,%eax
 a26:	83 c4 10             	add    $0x10,%esp
}
 a29:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a2c:	c9                   	leave  
 a2d:	c3                   	ret    
    return 0;
 a2e:	b8 00 00 00 00       	mov    $0x0,%eax
 a33:	eb f4                	jmp    a29 <morecore+0x44>

00000a35 <malloc>:

void*
malloc(uint nbytes)
{
 a35:	55                   	push   %ebp
 a36:	89 e5                	mov    %esp,%ebp
 a38:	53                   	push   %ebx
 a39:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3c:	8b 45 08             	mov    0x8(%ebp),%eax
 a3f:	8d 58 07             	lea    0x7(%eax),%ebx
 a42:	c1 eb 03             	shr    $0x3,%ebx
 a45:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a48:	8b 0d 70 0f 00 00    	mov    0xf70,%ecx
 a4e:	85 c9                	test   %ecx,%ecx
 a50:	74 04                	je     a56 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a52:	8b 01                	mov    (%ecx),%eax
 a54:	eb 4a                	jmp    aa0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a56:	c7 05 70 0f 00 00 74 	movl   $0xf74,0xf70
 a5d:	0f 00 00 
 a60:	c7 05 74 0f 00 00 74 	movl   $0xf74,0xf74
 a67:	0f 00 00 
    base.s.size = 0;
 a6a:	c7 05 78 0f 00 00 00 	movl   $0x0,0xf78
 a71:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a74:	b9 74 0f 00 00       	mov    $0xf74,%ecx
 a79:	eb d7                	jmp    a52 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a7b:	74 19                	je     a96 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a7d:	29 da                	sub    %ebx,%edx
 a7f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a82:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a85:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a88:	89 0d 70 0f 00 00    	mov    %ecx,0xf70
      return (void*)(p + 1);
 a8e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a94:	c9                   	leave  
 a95:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a96:	8b 10                	mov    (%eax),%edx
 a98:	89 11                	mov    %edx,(%ecx)
 a9a:	eb ec                	jmp    a88 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9c:	89 c1                	mov    %eax,%ecx
 a9e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 aa0:	8b 50 04             	mov    0x4(%eax),%edx
 aa3:	39 da                	cmp    %ebx,%edx
 aa5:	73 d4                	jae    a7b <malloc+0x46>
    if(p == freep)
 aa7:	39 05 70 0f 00 00    	cmp    %eax,0xf70
 aad:	75 ed                	jne    a9c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 aaf:	89 d8                	mov    %ebx,%eax
 ab1:	e8 2f ff ff ff       	call   9e5 <morecore>
 ab6:	85 c0                	test   %eax,%eax
 ab8:	75 e2                	jne    a9c <malloc+0x67>
 aba:	eb d5                	jmp    a91 <malloc+0x5c>
