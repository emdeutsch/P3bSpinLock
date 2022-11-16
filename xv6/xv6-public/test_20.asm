
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:
   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1, void *arg2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 b0 0e 00 00       	push   $0xeb0
   b:	e8 65 05 00 00       	call   575 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 77 06 00 00       	call   693 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 b4 0e 00 00    	cmp    0xeb4,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 10 0a 00 00       	push   $0xa10
  2e:	68 1a 0a 00 00       	push   $0xa1a
  33:	6a 01                	push   $0x1
  35:	e8 26 07 00 00       	call   760 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 22 0a 00 00       	push   $0xa22
  42:	68 40 0a 00 00       	push   $0xa40
  47:	6a 01                	push   $0x1
  49:	e8 12 07 00 00       	call   760 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 54 0a 00 00       	push   $0xa54
  56:	6a 01                	push   $0x1
  58:	e8 03 07 00 00       	call   760 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 bc 0e 00 00    	push   0xebc
  66:	e8 d0 05 00 00       	call   63b <kill>
  6b:	e8 9b 05 00 00       	call   60b <exit>
   global++;
  70:	83 05 b8 0e 00 00 01 	addl   $0x1,0xeb8
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 b0 0e 00 00       	push   $0xeb0
  7f:	e8 13 05 00 00       	call   597 <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 ac 0e 00 00 	movl   $0xeac,(%esp)
  8b:	e8 e5 04 00 00       	call   575 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 f7 05 00 00       	call   693 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 b4 0e 00 00    	cmp    0xeb4,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 10 0a 00 00       	push   $0xa10
  ae:	68 1a 0a 00 00       	push   $0xa1a
  b3:	6a 01                	push   $0x1
  b5:	e8 a6 06 00 00       	call   760 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 22 0a 00 00       	push   $0xa22
  c2:	68 40 0a 00 00       	push   $0xa40
  c7:	6a 01                	push   $0x1
  c9:	e8 92 06 00 00       	call   760 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 54 0a 00 00       	push   $0xa54
  d6:	6a 01                	push   $0x1
  d8:	e8 83 06 00 00       	call   760 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 bc 0e 00 00    	push   0xebc
  e6:	e8 50 05 00 00       	call   63b <kill>
  eb:	e8 1b 05 00 00       	call   60b <exit>
   global++;
  f0:	83 05 b8 0e 00 00 01 	addl   $0x1,0xeb8
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 ac 0e 00 00       	push   $0xeac
  ff:	e8 93 04 00 00       	call   597 <lock_release>

   
   exit();
 104:	e8 02 05 00 00       	call   60b <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 b0 0e 00 00       	push   $0xeb0
 114:	e8 4e 04 00 00       	call   567 <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 ac 0e 00 00 	movl   $0xeac,(%esp)
 120:	e8 42 04 00 00       	call   567 <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 b0 0e 00 00 	movl   $0xeb0,(%esp)
 12c:	e8 44 04 00 00       	call   575 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 ac 0e 00 00 	movl   $0xeac,(%esp)
 138:	e8 38 04 00 00       	call   575 <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	6a 00                	push   $0x0
 142:	6a 00                	push   $0x0
 144:	68 00 00 00 00       	push   $0x0
 149:	e8 57 04 00 00       	call   5a5 <thread_create>
    assert(nested_thread_id > 0);
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	7e 14                	jle    169 <worker+0x60>
   size = (unsigned int)sbrk(0);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	6a 00                	push   $0x0
 15a:	e8 34 05 00 00       	call   693 <sbrk>
 15f:	a3 b4 0e 00 00       	mov    %eax,0xeb4

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 10 0a 00 00       	push   $0xa10
 170:	68 1a 0a 00 00       	push   $0xa1a
 175:	6a 01                	push   $0x1
 177:	e8 e4 05 00 00       	call   760 <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 61 0a 00 00       	push   $0xa61
 184:	68 40 0a 00 00       	push   $0xa40
 189:	6a 01                	push   $0x1
 18b:	e8 d0 05 00 00       	call   760 <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 54 0a 00 00       	push   $0xa54
 198:	6a 01                	push   $0x1
 19a:	e8 c1 05 00 00       	call   760 <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 bc 0e 00 00    	push   0xebc
 1a8:	e8 8e 04 00 00       	call   63b <kill>
 1ad:	e8 59 04 00 00       	call   60b <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 b0 0e 00 00       	push   $0xeb0
 1ba:	e8 d8 03 00 00       	call   597 <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 d0 04 00 00       	call   69b <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 b0 0e 00 00 	movl   $0xeb0,(%esp)
 1d2:	e8 9e 03 00 00       	call   575 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 a8 0e 00 00       	mov    0xea8,%eax
 1df:	39 05 b8 0e 00 00    	cmp    %eax,0xeb8
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 b8 0e 00 00 00 	movl   $0x0,0xeb8
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 95 04 00 00       	call   693 <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 89 04 00 00       	call   693 <sbrk>
 20a:	a3 b4 0e 00 00       	mov    %eax,0xeb4
   lock_release(&lock);
 20f:	c7 04 24 b0 0e 00 00 	movl   $0xeb0,(%esp)
 216:	e8 7c 03 00 00       	call   597 <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 ac 0e 00 00       	push   $0xeac
 228:	e8 6a 03 00 00       	call   597 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 62 04 00 00       	call   69b <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 ac 0e 00 00 	movl   $0xeac,(%esp)
 240:	e8 30 03 00 00       	call   575 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 a8 0e 00 00       	mov    0xea8,%eax
 24d:	39 05 b8 0e 00 00    	cmp    %eax,0xeb8
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 ac 0e 00 00       	push   $0xeac
 25d:	e8 35 03 00 00       	call   597 <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 75 03 00 00       	call   5dc <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 98 03 00 00       	call   60b <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 10 0a 00 00       	push   $0xa10
 27a:	68 1a 0a 00 00       	push   $0xa1a
 27f:	6a 01                	push   $0x1
 281:	e8 da 04 00 00       	call   760 <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 76 0a 00 00       	push   $0xa76
 28e:	68 40 0a 00 00       	push   $0xa40
 293:	6a 01                	push   $0x1
 295:	e8 c6 04 00 00       	call   760 <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 54 0a 00 00       	push   $0xa54
 2a2:	6a 01                	push   $0x1
 2a4:	e8 b7 04 00 00       	call   760 <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 bc 0e 00 00    	push   0xebc
 2b2:	e8 84 03 00 00       	call   63b <kill>
 2b7:	e8 4f 03 00 00       	call   60b <exit>

000002bc <main>:
{
 2bc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c0:	83 e4 f0             	and    $0xfffffff0,%esp
 2c3:	ff 71 fc             	push   -0x4(%ecx)
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	51                   	push   %ecx
 2ca:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
 2cd:	e8 b9 03 00 00       	call   68b <getpid>
 2d2:	a3 bc 0e 00 00       	mov    %eax,0xebc
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 a4 03 00 00       	call   693 <sbrk>
 2ef:	a3 b4 0e 00 00       	mov    %eax,0xeb4
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2f4:	83 c4 0c             	add    $0xc,%esp
 2f7:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2fa:	50                   	push   %eax
 2fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	68 09 01 00 00       	push   $0x109
 304:	e8 9c 02 00 00       	call   5a5 <thread_create>
   assert(thread_pid > 0);
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	7e 1d                	jle    32d <main+0x71>
   int join_pid = thread_join();
 310:	e8 c7 02 00 00       	call   5dc <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 99 0a 00 00       	push   $0xa99
 321:	6a 01                	push   $0x1
 323:	e8 38 04 00 00       	call   760 <printf>
   exit();
 328:	e8 de 02 00 00       	call   60b <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 10 0a 00 00       	push   $0xa10
 334:	68 1a 0a 00 00       	push   $0xa1a
 339:	6a 01                	push   $0x1
 33b:	e8 20 04 00 00       	call   760 <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 8a 0a 00 00       	push   $0xa8a
 348:	68 40 0a 00 00       	push   $0xa40
 34d:	6a 01                	push   $0x1
 34f:	e8 0c 04 00 00       	call   760 <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 54 0a 00 00       	push   $0xa54
 35c:	6a 01                	push   $0x1
 35e:	e8 fd 03 00 00       	call   760 <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 bc 0e 00 00    	push   0xebc
 36c:	e8 ca 02 00 00       	call   63b <kill>
 371:	e8 95 02 00 00       	call   60b <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 10 0a 00 00       	push   $0xa10
 37d:	68 1a 0a 00 00       	push   $0xa1a
 382:	6a 01                	push   $0x1
 384:	e8 d7 03 00 00       	call   760 <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 7d 0a 00 00       	push   $0xa7d
 391:	68 40 0a 00 00       	push   $0xa40
 396:	6a 01                	push   $0x1
 398:	e8 c3 03 00 00       	call   760 <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 54 0a 00 00       	push   $0xa54
 3a5:	6a 01                	push   $0x1
 3a7:	e8 b4 03 00 00       	call   760 <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 bc 0e 00 00    	push   0xebc
 3b5:	e8 81 02 00 00       	call   63b <kill>
 3ba:	e8 4c 02 00 00       	call   60b <exit>

000003bf <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	56                   	push   %esi
 3c3:	53                   	push   %ebx
 3c4:	8b 75 08             	mov    0x8(%ebp),%esi
 3c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3ca:	89 f0                	mov    %esi,%eax
 3cc:	89 d1                	mov    %edx,%ecx
 3ce:	83 c2 01             	add    $0x1,%edx
 3d1:	89 c3                	mov    %eax,%ebx
 3d3:	83 c0 01             	add    $0x1,%eax
 3d6:	0f b6 09             	movzbl (%ecx),%ecx
 3d9:	88 0b                	mov    %cl,(%ebx)
 3db:	84 c9                	test   %cl,%cl
 3dd:	75 ed                	jne    3cc <strcpy+0xd>
    ;
  return os;
}
 3df:	89 f0                	mov    %esi,%eax
 3e1:	5b                   	pop    %ebx
 3e2:	5e                   	pop    %esi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3ee:	eb 06                	jmp    3f6 <strcmp+0x11>
    p++, q++;
 3f0:	83 c1 01             	add    $0x1,%ecx
 3f3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f6:	0f b6 01             	movzbl (%ecx),%eax
 3f9:	84 c0                	test   %al,%al
 3fb:	74 04                	je     401 <strcmp+0x1c>
 3fd:	3a 02                	cmp    (%edx),%al
 3ff:	74 ef                	je     3f0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 401:	0f b6 c0             	movzbl %al,%eax
 404:	0f b6 12             	movzbl (%edx),%edx
 407:	29 d0                	sub    %edx,%eax
}
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <strlen>:

uint
strlen(const char *s)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 411:	b8 00 00 00 00       	mov    $0x0,%eax
 416:	eb 03                	jmp    41b <strlen+0x10>
 418:	83 c0 01             	add    $0x1,%eax
 41b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41f:	75 f7                	jne    418 <strlen+0xd>
    ;
  return n;
}
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    

00000423 <memset>:

void*
memset(void *dst, int c, uint n)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	57                   	push   %edi
 427:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 42a:	89 d7                	mov    %edx,%edi
 42c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42f:	8b 45 0c             	mov    0xc(%ebp),%eax
 432:	fc                   	cld    
 433:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 435:	89 d0                	mov    %edx,%eax
 437:	8b 7d fc             	mov    -0x4(%ebp),%edi
 43a:	c9                   	leave  
 43b:	c3                   	ret    

0000043c <strchr>:

char*
strchr(const char *s, char c)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 446:	eb 03                	jmp    44b <strchr+0xf>
 448:	83 c0 01             	add    $0x1,%eax
 44b:	0f b6 10             	movzbl (%eax),%edx
 44e:	84 d2                	test   %dl,%dl
 450:	74 06                	je     458 <strchr+0x1c>
    if(*s == c)
 452:	38 ca                	cmp    %cl,%dl
 454:	75 f2                	jne    448 <strchr+0xc>
 456:	eb 05                	jmp    45d <strchr+0x21>
      return (char*)s;
  return 0;
 458:	b8 00 00 00 00       	mov    $0x0,%eax
}
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    

0000045f <gets>:

char*
gets(char *buf, int max)
{
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	57                   	push   %edi
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
 465:	83 ec 1c             	sub    $0x1c,%esp
 468:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 46b:	bb 00 00 00 00       	mov    $0x0,%ebx
 470:	89 de                	mov    %ebx,%esi
 472:	83 c3 01             	add    $0x1,%ebx
 475:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 478:	7d 2e                	jge    4a8 <gets+0x49>
    cc = read(0, &c, 1);
 47a:	83 ec 04             	sub    $0x4,%esp
 47d:	6a 01                	push   $0x1
 47f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 482:	50                   	push   %eax
 483:	6a 00                	push   $0x0
 485:	e8 99 01 00 00       	call   623 <read>
    if(cc < 1)
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	85 c0                	test   %eax,%eax
 48f:	7e 17                	jle    4a8 <gets+0x49>
      break;
    buf[i++] = c;
 491:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 495:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 498:	3c 0a                	cmp    $0xa,%al
 49a:	0f 94 c2             	sete   %dl
 49d:	3c 0d                	cmp    $0xd,%al
 49f:	0f 94 c0             	sete   %al
 4a2:	08 c2                	or     %al,%dl
 4a4:	74 ca                	je     470 <gets+0x11>
    buf[i++] = c;
 4a6:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4ac:	89 f8                	mov    %edi,%eax
 4ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b1:	5b                   	pop    %ebx
 4b2:	5e                   	pop    %esi
 4b3:	5f                   	pop    %edi
 4b4:	5d                   	pop    %ebp
 4b5:	c3                   	ret    

000004b6 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	56                   	push   %esi
 4ba:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4bb:	83 ec 08             	sub    $0x8,%esp
 4be:	6a 00                	push   $0x0
 4c0:	ff 75 08             	push   0x8(%ebp)
 4c3:	e8 83 01 00 00       	call   64b <open>
  if(fd < 0)
 4c8:	83 c4 10             	add    $0x10,%esp
 4cb:	85 c0                	test   %eax,%eax
 4cd:	78 24                	js     4f3 <stat+0x3d>
 4cf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4d1:	83 ec 08             	sub    $0x8,%esp
 4d4:	ff 75 0c             	push   0xc(%ebp)
 4d7:	50                   	push   %eax
 4d8:	e8 86 01 00 00       	call   663 <fstat>
 4dd:	89 c6                	mov    %eax,%esi
  close(fd);
 4df:	89 1c 24             	mov    %ebx,(%esp)
 4e2:	e8 4c 01 00 00       	call   633 <close>
  return r;
 4e7:	83 c4 10             	add    $0x10,%esp
}
 4ea:	89 f0                	mov    %esi,%eax
 4ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    
    return -1;
 4f3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f8:	eb f0                	jmp    4ea <stat+0x34>

000004fa <atoi>:

int
atoi(const char *s)
{
 4fa:	55                   	push   %ebp
 4fb:	89 e5                	mov    %esp,%ebp
 4fd:	53                   	push   %ebx
 4fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 501:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 506:	eb 10                	jmp    518 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 508:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 50b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 50e:	83 c1 01             	add    $0x1,%ecx
 511:	0f be c0             	movsbl %al,%eax
 514:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 518:	0f b6 01             	movzbl (%ecx),%eax
 51b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 51e:	80 fb 09             	cmp    $0x9,%bl
 521:	76 e5                	jbe    508 <atoi+0xe>
  return n;
}
 523:	89 d0                	mov    %edx,%eax
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 528:	c9                   	leave  
 529:	c3                   	ret    

0000052a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 52a:	55                   	push   %ebp
 52b:	89 e5                	mov    %esp,%ebp
 52d:	56                   	push   %esi
 52e:	53                   	push   %ebx
 52f:	8b 75 08             	mov    0x8(%ebp),%esi
 532:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 535:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 538:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 53a:	eb 0d                	jmp    549 <memmove+0x1f>
    *dst++ = *src++;
 53c:	0f b6 01             	movzbl (%ecx),%eax
 53f:	88 02                	mov    %al,(%edx)
 541:	8d 49 01             	lea    0x1(%ecx),%ecx
 544:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 547:	89 d8                	mov    %ebx,%eax
 549:	8d 58 ff             	lea    -0x1(%eax),%ebx
 54c:	85 c0                	test   %eax,%eax
 54e:	7f ec                	jg     53c <memmove+0x12>
  return vdst;
}
 550:	89 f0                	mov    %esi,%eax
 552:	5b                   	pop    %ebx
 553:	5e                   	pop    %esi
 554:	5d                   	pop    %ebp
 555:	c3                   	ret    

00000556 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 55c:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 55e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 561:	89 08                	mov    %ecx,(%eax)
  return old;
}
 563:	89 d0                	mov    %edx,%eax
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    

00000567 <lock_init>:
void 
lock_init(lock_t *lock){
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 573:	5d                   	pop    %ebp
 574:	c3                   	ret    

00000575 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 575:	55                   	push   %ebp
 576:	89 e5                	mov    %esp,%ebp
 578:	53                   	push   %ebx
 579:	83 ec 04             	sub    $0x4,%esp
 57c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 57f:	83 ec 08             	sub    $0x8,%esp
 582:	6a 01                	push   $0x1
 584:	53                   	push   %ebx
 585:	e8 cc ff ff ff       	call   556 <TestAndSet>
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	83 f8 01             	cmp    $0x1,%eax
 590:	74 ed                	je     57f <lock_acquire+0xa>
    ;
}
 592:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 595:	c9                   	leave  
 596:	c3                   	ret    

00000597 <lock_release>:
void 
lock_release(lock_t *lock){
 597:	55                   	push   %ebp
 598:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 59a:	8b 45 08             	mov    0x8(%ebp),%eax
 59d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5a3:	5d                   	pop    %ebp
 5a4:	c3                   	ret    

000005a5 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 5a5:	55                   	push   %ebp
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 5ab:	68 04 20 00 00       	push   $0x2004
 5b0:	e8 d1 03 00 00       	call   986 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 5b5:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	eb 03                	jmp    5c0 <thread_create+0x1b>
      stack += 1;
 5bd:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 5c0:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 5c6:	75 f5                	jne    5bd <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 5c8:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 5cb:	52                   	push   %edx
 5cc:	ff 75 10             	push   0x10(%ebp)
 5cf:	ff 75 0c             	push   0xc(%ebp)
 5d2:	ff 75 08             	push   0x8(%ebp)
 5d5:	e8 d1 00 00 00       	call   6ab <clone>
 
    return pid;
}
 5da:	c9                   	leave  
 5db:	c3                   	ret    

000005dc <thread_join>:
int 
thread_join(){
 5dc:	55                   	push   %ebp
 5dd:	89 e5                	mov    %esp,%ebp
 5df:	53                   	push   %ebx
 5e0:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 5e3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5e6:	50                   	push   %eax
 5e7:	e8 c7 00 00 00       	call   6b3 <join>
 5ec:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 5ee:	83 c4 04             	add    $0x4,%esp
 5f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f4:	ff 70 fc             	push   -0x4(%eax)
 5f7:	e8 ca 02 00 00       	call   8c6 <free>
  return pid;
 5fc:	89 d8                	mov    %ebx,%eax
 5fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 601:	c9                   	leave  
 602:	c3                   	ret    

00000603 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 603:	b8 01 00 00 00       	mov    $0x1,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <exit>:
SYSCALL(exit)
 60b:	b8 02 00 00 00       	mov    $0x2,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <wait>:
SYSCALL(wait)
 613:	b8 03 00 00 00       	mov    $0x3,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <pipe>:
SYSCALL(pipe)
 61b:	b8 04 00 00 00       	mov    $0x4,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <read>:
SYSCALL(read)
 623:	b8 05 00 00 00       	mov    $0x5,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <write>:
SYSCALL(write)
 62b:	b8 10 00 00 00       	mov    $0x10,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <close>:
SYSCALL(close)
 633:	b8 15 00 00 00       	mov    $0x15,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <kill>:
SYSCALL(kill)
 63b:	b8 06 00 00 00       	mov    $0x6,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <exec>:
SYSCALL(exec)
 643:	b8 07 00 00 00       	mov    $0x7,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <open>:
SYSCALL(open)
 64b:	b8 0f 00 00 00       	mov    $0xf,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <mknod>:
SYSCALL(mknod)
 653:	b8 11 00 00 00       	mov    $0x11,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <unlink>:
SYSCALL(unlink)
 65b:	b8 12 00 00 00       	mov    $0x12,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <fstat>:
SYSCALL(fstat)
 663:	b8 08 00 00 00       	mov    $0x8,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <link>:
SYSCALL(link)
 66b:	b8 13 00 00 00       	mov    $0x13,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <mkdir>:
SYSCALL(mkdir)
 673:	b8 14 00 00 00       	mov    $0x14,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <chdir>:
SYSCALL(chdir)
 67b:	b8 09 00 00 00       	mov    $0x9,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <dup>:
SYSCALL(dup)
 683:	b8 0a 00 00 00       	mov    $0xa,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <getpid>:
SYSCALL(getpid)
 68b:	b8 0b 00 00 00       	mov    $0xb,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <sbrk>:
SYSCALL(sbrk)
 693:	b8 0c 00 00 00       	mov    $0xc,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <sleep>:
SYSCALL(sleep)
 69b:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <uptime>:
SYSCALL(uptime)
 6a3:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <clone>:
SYSCALL(clone)
 6ab:	b8 16 00 00 00       	mov    $0x16,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <join>:
SYSCALL(join)
 6b3:	b8 17 00 00 00       	mov    $0x17,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6bb:	55                   	push   %ebp
 6bc:	89 e5                	mov    %esp,%ebp
 6be:	83 ec 1c             	sub    $0x1c,%esp
 6c1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6c4:	6a 01                	push   $0x1
 6c6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6c9:	52                   	push   %edx
 6ca:	50                   	push   %eax
 6cb:	e8 5b ff ff ff       	call   62b <write>
}
 6d0:	83 c4 10             	add    $0x10,%esp
 6d3:	c9                   	leave  
 6d4:	c3                   	ret    

000006d5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6d5:	55                   	push   %ebp
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	57                   	push   %edi
 6d9:	56                   	push   %esi
 6da:	53                   	push   %ebx
 6db:	83 ec 2c             	sub    $0x2c,%esp
 6de:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e1:	89 d0                	mov    %edx,%eax
 6e3:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6e5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6e9:	0f 95 c1             	setne  %cl
 6ec:	c1 ea 1f             	shr    $0x1f,%edx
 6ef:	84 d1                	test   %dl,%cl
 6f1:	74 44                	je     737 <printint+0x62>
    neg = 1;
    x = -xx;
 6f3:	f7 d8                	neg    %eax
 6f5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6f7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6fe:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 703:	89 c8                	mov    %ecx,%eax
 705:	ba 00 00 00 00       	mov    $0x0,%edx
 70a:	f7 f6                	div    %esi
 70c:	89 df                	mov    %ebx,%edi
 70e:	83 c3 01             	add    $0x1,%ebx
 711:	0f b6 92 08 0b 00 00 	movzbl 0xb08(%edx),%edx
 718:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 71c:	89 ca                	mov    %ecx,%edx
 71e:	89 c1                	mov    %eax,%ecx
 720:	39 d6                	cmp    %edx,%esi
 722:	76 df                	jbe    703 <printint+0x2e>
  if(neg)
 724:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 728:	74 31                	je     75b <printint+0x86>
    buf[i++] = '-';
 72a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 72f:	8d 5f 02             	lea    0x2(%edi),%ebx
 732:	8b 75 d0             	mov    -0x30(%ebp),%esi
 735:	eb 17                	jmp    74e <printint+0x79>
    x = xx;
 737:	89 c1                	mov    %eax,%ecx
  neg = 0;
 739:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 740:	eb bc                	jmp    6fe <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 742:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 747:	89 f0                	mov    %esi,%eax
 749:	e8 6d ff ff ff       	call   6bb <putc>
  while(--i >= 0)
 74e:	83 eb 01             	sub    $0x1,%ebx
 751:	79 ef                	jns    742 <printint+0x6d>
}
 753:	83 c4 2c             	add    $0x2c,%esp
 756:	5b                   	pop    %ebx
 757:	5e                   	pop    %esi
 758:	5f                   	pop    %edi
 759:	5d                   	pop    %ebp
 75a:	c3                   	ret    
 75b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 75e:	eb ee                	jmp    74e <printint+0x79>

00000760 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 769:	8d 45 10             	lea    0x10(%ebp),%eax
 76c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 76f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 774:	bb 00 00 00 00       	mov    $0x0,%ebx
 779:	eb 14                	jmp    78f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 77b:	89 fa                	mov    %edi,%edx
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	e8 36 ff ff ff       	call   6bb <putc>
 785:	eb 05                	jmp    78c <printf+0x2c>
      }
    } else if(state == '%'){
 787:	83 fe 25             	cmp    $0x25,%esi
 78a:	74 25                	je     7b1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 78c:	83 c3 01             	add    $0x1,%ebx
 78f:	8b 45 0c             	mov    0xc(%ebp),%eax
 792:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 796:	84 c0                	test   %al,%al
 798:	0f 84 20 01 00 00    	je     8be <printf+0x15e>
    c = fmt[i] & 0xff;
 79e:	0f be f8             	movsbl %al,%edi
 7a1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7a4:	85 f6                	test   %esi,%esi
 7a6:	75 df                	jne    787 <printf+0x27>
      if(c == '%'){
 7a8:	83 f8 25             	cmp    $0x25,%eax
 7ab:	75 ce                	jne    77b <printf+0x1b>
        state = '%';
 7ad:	89 c6                	mov    %eax,%esi
 7af:	eb db                	jmp    78c <printf+0x2c>
      if(c == 'd'){
 7b1:	83 f8 25             	cmp    $0x25,%eax
 7b4:	0f 84 cf 00 00 00    	je     889 <printf+0x129>
 7ba:	0f 8c dd 00 00 00    	jl     89d <printf+0x13d>
 7c0:	83 f8 78             	cmp    $0x78,%eax
 7c3:	0f 8f d4 00 00 00    	jg     89d <printf+0x13d>
 7c9:	83 f8 63             	cmp    $0x63,%eax
 7cc:	0f 8c cb 00 00 00    	jl     89d <printf+0x13d>
 7d2:	83 e8 63             	sub    $0x63,%eax
 7d5:	83 f8 15             	cmp    $0x15,%eax
 7d8:	0f 87 bf 00 00 00    	ja     89d <printf+0x13d>
 7de:	ff 24 85 b0 0a 00 00 	jmp    *0xab0(,%eax,4)
        printint(fd, *ap, 10, 1);
 7e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e8:	8b 17                	mov    (%edi),%edx
 7ea:	83 ec 0c             	sub    $0xc,%esp
 7ed:	6a 01                	push   $0x1
 7ef:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	e8 d9 fe ff ff       	call   6d5 <printint>
        ap++;
 7fc:	83 c7 04             	add    $0x4,%edi
 7ff:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 802:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 805:	be 00 00 00 00       	mov    $0x0,%esi
 80a:	eb 80                	jmp    78c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 80c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 80f:	8b 17                	mov    (%edi),%edx
 811:	83 ec 0c             	sub    $0xc,%esp
 814:	6a 00                	push   $0x0
 816:	b9 10 00 00 00       	mov    $0x10,%ecx
 81b:	8b 45 08             	mov    0x8(%ebp),%eax
 81e:	e8 b2 fe ff ff       	call   6d5 <printint>
        ap++;
 823:	83 c7 04             	add    $0x4,%edi
 826:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 829:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82c:	be 00 00 00 00       	mov    $0x0,%esi
 831:	e9 56 ff ff ff       	jmp    78c <printf+0x2c>
        s = (char*)*ap;
 836:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 839:	8b 30                	mov    (%eax),%esi
        ap++;
 83b:	83 c0 04             	add    $0x4,%eax
 83e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 841:	85 f6                	test   %esi,%esi
 843:	75 15                	jne    85a <printf+0xfa>
          s = "(null)";
 845:	be a6 0a 00 00       	mov    $0xaa6,%esi
 84a:	eb 0e                	jmp    85a <printf+0xfa>
          putc(fd, *s);
 84c:	0f be d2             	movsbl %dl,%edx
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	e8 64 fe ff ff       	call   6bb <putc>
          s++;
 857:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 85a:	0f b6 16             	movzbl (%esi),%edx
 85d:	84 d2                	test   %dl,%dl
 85f:	75 eb                	jne    84c <printf+0xec>
      state = 0;
 861:	be 00 00 00 00       	mov    $0x0,%esi
 866:	e9 21 ff ff ff       	jmp    78c <printf+0x2c>
        putc(fd, *ap);
 86b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86e:	0f be 17             	movsbl (%edi),%edx
 871:	8b 45 08             	mov    0x8(%ebp),%eax
 874:	e8 42 fe ff ff       	call   6bb <putc>
        ap++;
 879:	83 c7 04             	add    $0x4,%edi
 87c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 87f:	be 00 00 00 00       	mov    $0x0,%esi
 884:	e9 03 ff ff ff       	jmp    78c <printf+0x2c>
        putc(fd, c);
 889:	89 fa                	mov    %edi,%edx
 88b:	8b 45 08             	mov    0x8(%ebp),%eax
 88e:	e8 28 fe ff ff       	call   6bb <putc>
      state = 0;
 893:	be 00 00 00 00       	mov    $0x0,%esi
 898:	e9 ef fe ff ff       	jmp    78c <printf+0x2c>
        putc(fd, '%');
 89d:	ba 25 00 00 00       	mov    $0x25,%edx
 8a2:	8b 45 08             	mov    0x8(%ebp),%eax
 8a5:	e8 11 fe ff ff       	call   6bb <putc>
        putc(fd, c);
 8aa:	89 fa                	mov    %edi,%edx
 8ac:	8b 45 08             	mov    0x8(%ebp),%eax
 8af:	e8 07 fe ff ff       	call   6bb <putc>
      state = 0;
 8b4:	be 00 00 00 00       	mov    $0x0,%esi
 8b9:	e9 ce fe ff ff       	jmp    78c <printf+0x2c>
    }
  }
}
 8be:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c1:	5b                   	pop    %ebx
 8c2:	5e                   	pop    %esi
 8c3:	5f                   	pop    %edi
 8c4:	5d                   	pop    %ebp
 8c5:	c3                   	ret    

000008c6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c6:	55                   	push   %ebp
 8c7:	89 e5                	mov    %esp,%ebp
 8c9:	57                   	push   %edi
 8ca:	56                   	push   %esi
 8cb:	53                   	push   %ebx
 8cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8cf:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d2:	a1 c0 0e 00 00       	mov    0xec0,%eax
 8d7:	eb 02                	jmp    8db <free+0x15>
 8d9:	89 d0                	mov    %edx,%eax
 8db:	39 c8                	cmp    %ecx,%eax
 8dd:	73 04                	jae    8e3 <free+0x1d>
 8df:	39 08                	cmp    %ecx,(%eax)
 8e1:	77 12                	ja     8f5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e3:	8b 10                	mov    (%eax),%edx
 8e5:	39 c2                	cmp    %eax,%edx
 8e7:	77 f0                	ja     8d9 <free+0x13>
 8e9:	39 c8                	cmp    %ecx,%eax
 8eb:	72 08                	jb     8f5 <free+0x2f>
 8ed:	39 ca                	cmp    %ecx,%edx
 8ef:	77 04                	ja     8f5 <free+0x2f>
 8f1:	89 d0                	mov    %edx,%eax
 8f3:	eb e6                	jmp    8db <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8f8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8fb:	8b 10                	mov    (%eax),%edx
 8fd:	39 d7                	cmp    %edx,%edi
 8ff:	74 19                	je     91a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 901:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 904:	8b 50 04             	mov    0x4(%eax),%edx
 907:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 90a:	39 ce                	cmp    %ecx,%esi
 90c:	74 1b                	je     929 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 90e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 910:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 915:	5b                   	pop    %ebx
 916:	5e                   	pop    %esi
 917:	5f                   	pop    %edi
 918:	5d                   	pop    %ebp
 919:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 91a:	03 72 04             	add    0x4(%edx),%esi
 91d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 920:	8b 10                	mov    (%eax),%edx
 922:	8b 12                	mov    (%edx),%edx
 924:	89 53 f8             	mov    %edx,-0x8(%ebx)
 927:	eb db                	jmp    904 <free+0x3e>
    p->s.size += bp->s.size;
 929:	03 53 fc             	add    -0x4(%ebx),%edx
 92c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 92f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 932:	89 10                	mov    %edx,(%eax)
 934:	eb da                	jmp    910 <free+0x4a>

00000936 <morecore>:

static Header*
morecore(uint nu)
{
 936:	55                   	push   %ebp
 937:	89 e5                	mov    %esp,%ebp
 939:	53                   	push   %ebx
 93a:	83 ec 04             	sub    $0x4,%esp
 93d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 93f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 944:	77 05                	ja     94b <morecore+0x15>
    nu = 4096;
 946:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 94b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 952:	83 ec 0c             	sub    $0xc,%esp
 955:	50                   	push   %eax
 956:	e8 38 fd ff ff       	call   693 <sbrk>
  if(p == (char*)-1)
 95b:	83 c4 10             	add    $0x10,%esp
 95e:	83 f8 ff             	cmp    $0xffffffff,%eax
 961:	74 1c                	je     97f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 963:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 966:	83 c0 08             	add    $0x8,%eax
 969:	83 ec 0c             	sub    $0xc,%esp
 96c:	50                   	push   %eax
 96d:	e8 54 ff ff ff       	call   8c6 <free>
  return freep;
 972:	a1 c0 0e 00 00       	mov    0xec0,%eax
 977:	83 c4 10             	add    $0x10,%esp
}
 97a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 97d:	c9                   	leave  
 97e:	c3                   	ret    
    return 0;
 97f:	b8 00 00 00 00       	mov    $0x0,%eax
 984:	eb f4                	jmp    97a <morecore+0x44>

00000986 <malloc>:

void*
malloc(uint nbytes)
{
 986:	55                   	push   %ebp
 987:	89 e5                	mov    %esp,%ebp
 989:	53                   	push   %ebx
 98a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
 990:	8d 58 07             	lea    0x7(%eax),%ebx
 993:	c1 eb 03             	shr    $0x3,%ebx
 996:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 999:	8b 0d c0 0e 00 00    	mov    0xec0,%ecx
 99f:	85 c9                	test   %ecx,%ecx
 9a1:	74 04                	je     9a7 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a3:	8b 01                	mov    (%ecx),%eax
 9a5:	eb 4a                	jmp    9f1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9a7:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 9ae:	0e 00 00 
 9b1:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 9b8:	0e 00 00 
    base.s.size = 0;
 9bb:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 9c2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9c5:	b9 c4 0e 00 00       	mov    $0xec4,%ecx
 9ca:	eb d7                	jmp    9a3 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9cc:	74 19                	je     9e7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9ce:	29 da                	sub    %ebx,%edx
 9d0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9d3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9d6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9d9:	89 0d c0 0e 00 00    	mov    %ecx,0xec0
      return (void*)(p + 1);
 9df:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9e5:	c9                   	leave  
 9e6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9e7:	8b 10                	mov    (%eax),%edx
 9e9:	89 11                	mov    %edx,(%ecx)
 9eb:	eb ec                	jmp    9d9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ed:	89 c1                	mov    %eax,%ecx
 9ef:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9f1:	8b 50 04             	mov    0x4(%eax),%edx
 9f4:	39 da                	cmp    %ebx,%edx
 9f6:	73 d4                	jae    9cc <malloc+0x46>
    if(p == freep)
 9f8:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 9fe:	75 ed                	jne    9ed <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a00:	89 d8                	mov    %ebx,%eax
 a02:	e8 2f ff ff ff       	call   936 <morecore>
 a07:	85 c0                	test   %eax,%eax
 a09:	75 e2                	jne    9ed <malloc+0x67>
 a0b:	eb d5                	jmp    9e2 <malloc+0x5c>
