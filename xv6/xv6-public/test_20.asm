
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
  17:	e8 78 06 00 00       	call   694 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 b4 0e 00 00    	cmp    0xeb4,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 10 0a 00 00       	push   $0xa10
  2e:	68 1a 0a 00 00       	push   $0xa1a
  33:	6a 01                	push   $0x1
  35:	e8 27 07 00 00       	call   761 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 22 0a 00 00       	push   $0xa22
  42:	68 40 0a 00 00       	push   $0xa40
  47:	6a 01                	push   $0x1
  49:	e8 13 07 00 00       	call   761 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 54 0a 00 00       	push   $0xa54
  56:	6a 01                	push   $0x1
  58:	e8 04 07 00 00       	call   761 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 bc 0e 00 00    	push   0xebc
  66:	e8 d1 05 00 00       	call   63c <kill>
  6b:	e8 9c 05 00 00       	call   60c <exit>
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
  97:	e8 f8 05 00 00       	call   694 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 b4 0e 00 00    	cmp    0xeb4,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 10 0a 00 00       	push   $0xa10
  ae:	68 1a 0a 00 00       	push   $0xa1a
  b3:	6a 01                	push   $0x1
  b5:	e8 a7 06 00 00       	call   761 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 22 0a 00 00       	push   $0xa22
  c2:	68 40 0a 00 00       	push   $0xa40
  c7:	6a 01                	push   $0x1
  c9:	e8 93 06 00 00       	call   761 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 54 0a 00 00       	push   $0xa54
  d6:	6a 01                	push   $0x1
  d8:	e8 84 06 00 00       	call   761 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 bc 0e 00 00    	push   0xebc
  e6:	e8 51 05 00 00       	call   63c <kill>
  eb:	e8 1c 05 00 00       	call   60c <exit>
   global++;
  f0:	83 05 b8 0e 00 00 01 	addl   $0x1,0xeb8
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 ac 0e 00 00       	push   $0xeac
  ff:	e8 93 04 00 00       	call   597 <lock_release>

   
   exit();
 104:	e8 03 05 00 00       	call   60c <exit>

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
 15a:	e8 35 05 00 00       	call   694 <sbrk>
 15f:	a3 b4 0e 00 00       	mov    %eax,0xeb4

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 10 0a 00 00       	push   $0xa10
 170:	68 1a 0a 00 00       	push   $0xa1a
 175:	6a 01                	push   $0x1
 177:	e8 e5 05 00 00       	call   761 <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 61 0a 00 00       	push   $0xa61
 184:	68 40 0a 00 00       	push   $0xa40
 189:	6a 01                	push   $0x1
 18b:	e8 d1 05 00 00       	call   761 <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 54 0a 00 00       	push   $0xa54
 198:	6a 01                	push   $0x1
 19a:	e8 c2 05 00 00       	call   761 <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 bc 0e 00 00    	push   0xebc
 1a8:	e8 8f 04 00 00       	call   63c <kill>
 1ad:	e8 5a 04 00 00       	call   60c <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 b0 0e 00 00       	push   $0xeb0
 1ba:	e8 d8 03 00 00       	call   597 <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 d1 04 00 00       	call   69c <sleep>
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
 1f9:	e8 96 04 00 00       	call   694 <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 8a 04 00 00       	call   694 <sbrk>
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
 234:	e8 63 04 00 00       	call   69c <sleep>
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
 262:	e8 76 03 00 00       	call   5dd <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 99 03 00 00       	call   60c <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 10 0a 00 00       	push   $0xa10
 27a:	68 1a 0a 00 00       	push   $0xa1a
 27f:	6a 01                	push   $0x1
 281:	e8 db 04 00 00       	call   761 <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 76 0a 00 00       	push   $0xa76
 28e:	68 40 0a 00 00       	push   $0xa40
 293:	6a 01                	push   $0x1
 295:	e8 c7 04 00 00       	call   761 <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 54 0a 00 00       	push   $0xa54
 2a2:	6a 01                	push   $0x1
 2a4:	e8 b8 04 00 00       	call   761 <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 bc 0e 00 00    	push   0xebc
 2b2:	e8 85 03 00 00       	call   63c <kill>
 2b7:	e8 50 03 00 00       	call   60c <exit>

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
 2cd:	e8 ba 03 00 00       	call   68c <getpid>
 2d2:	a3 bc 0e 00 00       	mov    %eax,0xebc
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 a5 03 00 00       	call   694 <sbrk>
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
 310:	e8 c8 02 00 00       	call   5dd <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 99 0a 00 00       	push   $0xa99
 321:	6a 01                	push   $0x1
 323:	e8 39 04 00 00       	call   761 <printf>
   exit();
 328:	e8 df 02 00 00       	call   60c <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 10 0a 00 00       	push   $0xa10
 334:	68 1a 0a 00 00       	push   $0xa1a
 339:	6a 01                	push   $0x1
 33b:	e8 21 04 00 00       	call   761 <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 8a 0a 00 00       	push   $0xa8a
 348:	68 40 0a 00 00       	push   $0xa40
 34d:	6a 01                	push   $0x1
 34f:	e8 0d 04 00 00       	call   761 <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 54 0a 00 00       	push   $0xa54
 35c:	6a 01                	push   $0x1
 35e:	e8 fe 03 00 00       	call   761 <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 bc 0e 00 00    	push   0xebc
 36c:	e8 cb 02 00 00       	call   63c <kill>
 371:	e8 96 02 00 00       	call   60c <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 10 0a 00 00       	push   $0xa10
 37d:	68 1a 0a 00 00       	push   $0xa1a
 382:	6a 01                	push   $0x1
 384:	e8 d8 03 00 00       	call   761 <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 7d 0a 00 00       	push   $0xa7d
 391:	68 40 0a 00 00       	push   $0xa40
 396:	6a 01                	push   $0x1
 398:	e8 c4 03 00 00       	call   761 <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 54 0a 00 00       	push   $0xa54
 3a5:	6a 01                	push   $0x1
 3a7:	e8 b5 03 00 00       	call   761 <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 bc 0e 00 00    	push   0xebc
 3b5:	e8 82 02 00 00       	call   63c <kill>
 3ba:	e8 4d 02 00 00       	call   60c <exit>

000003bf <strcpy>:
#include "x86.h"
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
 485:	e8 9a 01 00 00       	call   624 <read>
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
 4c3:	e8 84 01 00 00       	call   64c <open>
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
 4d8:	e8 87 01 00 00       	call   664 <fstat>
 4dd:	89 c6                	mov    %eax,%esi
  close(fd);
 4df:	89 1c 24             	mov    %ebx,(%esp)
 4e2:	e8 4d 01 00 00       	call   634 <close>
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
 5b0:	e8 d2 03 00 00       	call   987 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 5b5:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 5b8:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 5ba:	eb 03                	jmp    5bf <thread_create+0x1a>
      stack += 1;
 5bc:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 5bf:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 5c5:	75 f5                	jne    5bc <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 5c7:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 5c9:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 5cc:	52                   	push   %edx
 5cd:	ff 75 10             	push   0x10(%ebp)
 5d0:	ff 75 0c             	push   0xc(%ebp)
 5d3:	ff 75 08             	push   0x8(%ebp)
 5d6:	e8 d1 00 00 00       	call   6ac <clone>
 
    return pid;
}
 5db:	c9                   	leave  
 5dc:	c3                   	ret    

000005dd <thread_join>:
int 
thread_join(){
 5dd:	55                   	push   %ebp
 5de:	89 e5                	mov    %esp,%ebp
 5e0:	53                   	push   %ebx
 5e1:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 5e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5e7:	50                   	push   %eax
 5e8:	e8 c7 00 00 00       	call   6b4 <join>
 5ed:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 5ef:	83 c4 04             	add    $0x4,%esp
 5f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f5:	ff 70 fc             	push   -0x4(%eax)
 5f8:	e8 ca 02 00 00       	call   8c7 <free>
  return waitedForPID;
 5fd:	89 d8                	mov    %ebx,%eax
 5ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 602:	c9                   	leave  
 603:	c3                   	ret    

00000604 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 604:	b8 01 00 00 00       	mov    $0x1,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <exit>:
SYSCALL(exit)
 60c:	b8 02 00 00 00       	mov    $0x2,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <wait>:
SYSCALL(wait)
 614:	b8 03 00 00 00       	mov    $0x3,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <pipe>:
SYSCALL(pipe)
 61c:	b8 04 00 00 00       	mov    $0x4,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <read>:
SYSCALL(read)
 624:	b8 05 00 00 00       	mov    $0x5,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <write>:
SYSCALL(write)
 62c:	b8 10 00 00 00       	mov    $0x10,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <close>:
SYSCALL(close)
 634:	b8 15 00 00 00       	mov    $0x15,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <kill>:
SYSCALL(kill)
 63c:	b8 06 00 00 00       	mov    $0x6,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <exec>:
SYSCALL(exec)
 644:	b8 07 00 00 00       	mov    $0x7,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <open>:
SYSCALL(open)
 64c:	b8 0f 00 00 00       	mov    $0xf,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <mknod>:
SYSCALL(mknod)
 654:	b8 11 00 00 00       	mov    $0x11,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <unlink>:
SYSCALL(unlink)
 65c:	b8 12 00 00 00       	mov    $0x12,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <fstat>:
SYSCALL(fstat)
 664:	b8 08 00 00 00       	mov    $0x8,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <link>:
SYSCALL(link)
 66c:	b8 13 00 00 00       	mov    $0x13,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <mkdir>:
SYSCALL(mkdir)
 674:	b8 14 00 00 00       	mov    $0x14,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <chdir>:
SYSCALL(chdir)
 67c:	b8 09 00 00 00       	mov    $0x9,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <dup>:
SYSCALL(dup)
 684:	b8 0a 00 00 00       	mov    $0xa,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <getpid>:
SYSCALL(getpid)
 68c:	b8 0b 00 00 00       	mov    $0xb,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <sbrk>:
SYSCALL(sbrk)
 694:	b8 0c 00 00 00       	mov    $0xc,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <sleep>:
SYSCALL(sleep)
 69c:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <uptime>:
SYSCALL(uptime)
 6a4:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <clone>:
SYSCALL(clone)
 6ac:	b8 16 00 00 00       	mov    $0x16,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <join>:
SYSCALL(join)
 6b4:	b8 17 00 00 00       	mov    $0x17,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6bc:	55                   	push   %ebp
 6bd:	89 e5                	mov    %esp,%ebp
 6bf:	83 ec 1c             	sub    $0x1c,%esp
 6c2:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6c5:	6a 01                	push   $0x1
 6c7:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6ca:	52                   	push   %edx
 6cb:	50                   	push   %eax
 6cc:	e8 5b ff ff ff       	call   62c <write>
}
 6d1:	83 c4 10             	add    $0x10,%esp
 6d4:	c9                   	leave  
 6d5:	c3                   	ret    

000006d6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6d6:	55                   	push   %ebp
 6d7:	89 e5                	mov    %esp,%ebp
 6d9:	57                   	push   %edi
 6da:	56                   	push   %esi
 6db:	53                   	push   %ebx
 6dc:	83 ec 2c             	sub    $0x2c,%esp
 6df:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e2:	89 d0                	mov    %edx,%eax
 6e4:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6e6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6ea:	0f 95 c1             	setne  %cl
 6ed:	c1 ea 1f             	shr    $0x1f,%edx
 6f0:	84 d1                	test   %dl,%cl
 6f2:	74 44                	je     738 <printint+0x62>
    neg = 1;
    x = -xx;
 6f4:	f7 d8                	neg    %eax
 6f6:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6f8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6ff:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 704:	89 c8                	mov    %ecx,%eax
 706:	ba 00 00 00 00       	mov    $0x0,%edx
 70b:	f7 f6                	div    %esi
 70d:	89 df                	mov    %ebx,%edi
 70f:	83 c3 01             	add    $0x1,%ebx
 712:	0f b6 92 08 0b 00 00 	movzbl 0xb08(%edx),%edx
 719:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 71d:	89 ca                	mov    %ecx,%edx
 71f:	89 c1                	mov    %eax,%ecx
 721:	39 d6                	cmp    %edx,%esi
 723:	76 df                	jbe    704 <printint+0x2e>
  if(neg)
 725:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 729:	74 31                	je     75c <printint+0x86>
    buf[i++] = '-';
 72b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 730:	8d 5f 02             	lea    0x2(%edi),%ebx
 733:	8b 75 d0             	mov    -0x30(%ebp),%esi
 736:	eb 17                	jmp    74f <printint+0x79>
    x = xx;
 738:	89 c1                	mov    %eax,%ecx
  neg = 0;
 73a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 741:	eb bc                	jmp    6ff <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 743:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 748:	89 f0                	mov    %esi,%eax
 74a:	e8 6d ff ff ff       	call   6bc <putc>
  while(--i >= 0)
 74f:	83 eb 01             	sub    $0x1,%ebx
 752:	79 ef                	jns    743 <printint+0x6d>
}
 754:	83 c4 2c             	add    $0x2c,%esp
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 75f:	eb ee                	jmp    74f <printint+0x79>

00000761 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 761:	55                   	push   %ebp
 762:	89 e5                	mov    %esp,%ebp
 764:	57                   	push   %edi
 765:	56                   	push   %esi
 766:	53                   	push   %ebx
 767:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 76a:	8d 45 10             	lea    0x10(%ebp),%eax
 76d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 770:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 775:	bb 00 00 00 00       	mov    $0x0,%ebx
 77a:	eb 14                	jmp    790 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 77c:	89 fa                	mov    %edi,%edx
 77e:	8b 45 08             	mov    0x8(%ebp),%eax
 781:	e8 36 ff ff ff       	call   6bc <putc>
 786:	eb 05                	jmp    78d <printf+0x2c>
      }
    } else if(state == '%'){
 788:	83 fe 25             	cmp    $0x25,%esi
 78b:	74 25                	je     7b2 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 78d:	83 c3 01             	add    $0x1,%ebx
 790:	8b 45 0c             	mov    0xc(%ebp),%eax
 793:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 797:	84 c0                	test   %al,%al
 799:	0f 84 20 01 00 00    	je     8bf <printf+0x15e>
    c = fmt[i] & 0xff;
 79f:	0f be f8             	movsbl %al,%edi
 7a2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7a5:	85 f6                	test   %esi,%esi
 7a7:	75 df                	jne    788 <printf+0x27>
      if(c == '%'){
 7a9:	83 f8 25             	cmp    $0x25,%eax
 7ac:	75 ce                	jne    77c <printf+0x1b>
        state = '%';
 7ae:	89 c6                	mov    %eax,%esi
 7b0:	eb db                	jmp    78d <printf+0x2c>
      if(c == 'd'){
 7b2:	83 f8 25             	cmp    $0x25,%eax
 7b5:	0f 84 cf 00 00 00    	je     88a <printf+0x129>
 7bb:	0f 8c dd 00 00 00    	jl     89e <printf+0x13d>
 7c1:	83 f8 78             	cmp    $0x78,%eax
 7c4:	0f 8f d4 00 00 00    	jg     89e <printf+0x13d>
 7ca:	83 f8 63             	cmp    $0x63,%eax
 7cd:	0f 8c cb 00 00 00    	jl     89e <printf+0x13d>
 7d3:	83 e8 63             	sub    $0x63,%eax
 7d6:	83 f8 15             	cmp    $0x15,%eax
 7d9:	0f 87 bf 00 00 00    	ja     89e <printf+0x13d>
 7df:	ff 24 85 b0 0a 00 00 	jmp    *0xab0(,%eax,4)
        printint(fd, *ap, 10, 1);
 7e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e9:	8b 17                	mov    (%edi),%edx
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	6a 01                	push   $0x1
 7f0:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	e8 d9 fe ff ff       	call   6d6 <printint>
        ap++;
 7fd:	83 c7 04             	add    $0x4,%edi
 800:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 803:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 806:	be 00 00 00 00       	mov    $0x0,%esi
 80b:	eb 80                	jmp    78d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 80d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 810:	8b 17                	mov    (%edi),%edx
 812:	83 ec 0c             	sub    $0xc,%esp
 815:	6a 00                	push   $0x0
 817:	b9 10 00 00 00       	mov    $0x10,%ecx
 81c:	8b 45 08             	mov    0x8(%ebp),%eax
 81f:	e8 b2 fe ff ff       	call   6d6 <printint>
        ap++;
 824:	83 c7 04             	add    $0x4,%edi
 827:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82d:	be 00 00 00 00       	mov    $0x0,%esi
 832:	e9 56 ff ff ff       	jmp    78d <printf+0x2c>
        s = (char*)*ap;
 837:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83a:	8b 30                	mov    (%eax),%esi
        ap++;
 83c:	83 c0 04             	add    $0x4,%eax
 83f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 842:	85 f6                	test   %esi,%esi
 844:	75 15                	jne    85b <printf+0xfa>
          s = "(null)";
 846:	be a6 0a 00 00       	mov    $0xaa6,%esi
 84b:	eb 0e                	jmp    85b <printf+0xfa>
          putc(fd, *s);
 84d:	0f be d2             	movsbl %dl,%edx
 850:	8b 45 08             	mov    0x8(%ebp),%eax
 853:	e8 64 fe ff ff       	call   6bc <putc>
          s++;
 858:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 85b:	0f b6 16             	movzbl (%esi),%edx
 85e:	84 d2                	test   %dl,%dl
 860:	75 eb                	jne    84d <printf+0xec>
      state = 0;
 862:	be 00 00 00 00       	mov    $0x0,%esi
 867:	e9 21 ff ff ff       	jmp    78d <printf+0x2c>
        putc(fd, *ap);
 86c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86f:	0f be 17             	movsbl (%edi),%edx
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	e8 42 fe ff ff       	call   6bc <putc>
        ap++;
 87a:	83 c7 04             	add    $0x4,%edi
 87d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 880:	be 00 00 00 00       	mov    $0x0,%esi
 885:	e9 03 ff ff ff       	jmp    78d <printf+0x2c>
        putc(fd, c);
 88a:	89 fa                	mov    %edi,%edx
 88c:	8b 45 08             	mov    0x8(%ebp),%eax
 88f:	e8 28 fe ff ff       	call   6bc <putc>
      state = 0;
 894:	be 00 00 00 00       	mov    $0x0,%esi
 899:	e9 ef fe ff ff       	jmp    78d <printf+0x2c>
        putc(fd, '%');
 89e:	ba 25 00 00 00       	mov    $0x25,%edx
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	e8 11 fe ff ff       	call   6bc <putc>
        putc(fd, c);
 8ab:	89 fa                	mov    %edi,%edx
 8ad:	8b 45 08             	mov    0x8(%ebp),%eax
 8b0:	e8 07 fe ff ff       	call   6bc <putc>
      state = 0;
 8b5:	be 00 00 00 00       	mov    $0x0,%esi
 8ba:	e9 ce fe ff ff       	jmp    78d <printf+0x2c>
    }
  }
}
 8bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c2:	5b                   	pop    %ebx
 8c3:	5e                   	pop    %esi
 8c4:	5f                   	pop    %edi
 8c5:	5d                   	pop    %ebp
 8c6:	c3                   	ret    

000008c7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c7:	55                   	push   %ebp
 8c8:	89 e5                	mov    %esp,%ebp
 8ca:	57                   	push   %edi
 8cb:	56                   	push   %esi
 8cc:	53                   	push   %ebx
 8cd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d3:	a1 c0 0e 00 00       	mov    0xec0,%eax
 8d8:	eb 02                	jmp    8dc <free+0x15>
 8da:	89 d0                	mov    %edx,%eax
 8dc:	39 c8                	cmp    %ecx,%eax
 8de:	73 04                	jae    8e4 <free+0x1d>
 8e0:	39 08                	cmp    %ecx,(%eax)
 8e2:	77 12                	ja     8f6 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e4:	8b 10                	mov    (%eax),%edx
 8e6:	39 c2                	cmp    %eax,%edx
 8e8:	77 f0                	ja     8da <free+0x13>
 8ea:	39 c8                	cmp    %ecx,%eax
 8ec:	72 08                	jb     8f6 <free+0x2f>
 8ee:	39 ca                	cmp    %ecx,%edx
 8f0:	77 04                	ja     8f6 <free+0x2f>
 8f2:	89 d0                	mov    %edx,%eax
 8f4:	eb e6                	jmp    8dc <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8fc:	8b 10                	mov    (%eax),%edx
 8fe:	39 d7                	cmp    %edx,%edi
 900:	74 19                	je     91b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 902:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 905:	8b 50 04             	mov    0x4(%eax),%edx
 908:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 90b:	39 ce                	cmp    %ecx,%esi
 90d:	74 1b                	je     92a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 90f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 911:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 916:	5b                   	pop    %ebx
 917:	5e                   	pop    %esi
 918:	5f                   	pop    %edi
 919:	5d                   	pop    %ebp
 91a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 91b:	03 72 04             	add    0x4(%edx),%esi
 91e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 921:	8b 10                	mov    (%eax),%edx
 923:	8b 12                	mov    (%edx),%edx
 925:	89 53 f8             	mov    %edx,-0x8(%ebx)
 928:	eb db                	jmp    905 <free+0x3e>
    p->s.size += bp->s.size;
 92a:	03 53 fc             	add    -0x4(%ebx),%edx
 92d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 930:	8b 53 f8             	mov    -0x8(%ebx),%edx
 933:	89 10                	mov    %edx,(%eax)
 935:	eb da                	jmp    911 <free+0x4a>

00000937 <morecore>:

static Header*
morecore(uint nu)
{
 937:	55                   	push   %ebp
 938:	89 e5                	mov    %esp,%ebp
 93a:	53                   	push   %ebx
 93b:	83 ec 04             	sub    $0x4,%esp
 93e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 940:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 945:	77 05                	ja     94c <morecore+0x15>
    nu = 4096;
 947:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 94c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 953:	83 ec 0c             	sub    $0xc,%esp
 956:	50                   	push   %eax
 957:	e8 38 fd ff ff       	call   694 <sbrk>
  if(p == (char*)-1)
 95c:	83 c4 10             	add    $0x10,%esp
 95f:	83 f8 ff             	cmp    $0xffffffff,%eax
 962:	74 1c                	je     980 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 964:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 967:	83 c0 08             	add    $0x8,%eax
 96a:	83 ec 0c             	sub    $0xc,%esp
 96d:	50                   	push   %eax
 96e:	e8 54 ff ff ff       	call   8c7 <free>
  return freep;
 973:	a1 c0 0e 00 00       	mov    0xec0,%eax
 978:	83 c4 10             	add    $0x10,%esp
}
 97b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 97e:	c9                   	leave  
 97f:	c3                   	ret    
    return 0;
 980:	b8 00 00 00 00       	mov    $0x0,%eax
 985:	eb f4                	jmp    97b <morecore+0x44>

00000987 <malloc>:

void*
malloc(uint nbytes)
{
 987:	55                   	push   %ebp
 988:	89 e5                	mov    %esp,%ebp
 98a:	53                   	push   %ebx
 98b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 98e:	8b 45 08             	mov    0x8(%ebp),%eax
 991:	8d 58 07             	lea    0x7(%eax),%ebx
 994:	c1 eb 03             	shr    $0x3,%ebx
 997:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 99a:	8b 0d c0 0e 00 00    	mov    0xec0,%ecx
 9a0:	85 c9                	test   %ecx,%ecx
 9a2:	74 04                	je     9a8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a4:	8b 01                	mov    (%ecx),%eax
 9a6:	eb 4a                	jmp    9f2 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9a8:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 9af:	0e 00 00 
 9b2:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 9b9:	0e 00 00 
    base.s.size = 0;
 9bc:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 9c3:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9c6:	b9 c4 0e 00 00       	mov    $0xec4,%ecx
 9cb:	eb d7                	jmp    9a4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9cd:	74 19                	je     9e8 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9cf:	29 da                	sub    %ebx,%edx
 9d1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9d4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9d7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9da:	89 0d c0 0e 00 00    	mov    %ecx,0xec0
      return (void*)(p + 1);
 9e0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9e6:	c9                   	leave  
 9e7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9e8:	8b 10                	mov    (%eax),%edx
 9ea:	89 11                	mov    %edx,(%ecx)
 9ec:	eb ec                	jmp    9da <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ee:	89 c1                	mov    %eax,%ecx
 9f0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9f2:	8b 50 04             	mov    0x4(%eax),%edx
 9f5:	39 da                	cmp    %ebx,%edx
 9f7:	73 d4                	jae    9cd <malloc+0x46>
    if(p == freep)
 9f9:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 9ff:	75 ed                	jne    9ee <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a01:	89 d8                	mov    %ebx,%eax
 a03:	e8 2f ff ff ff       	call   937 <morecore>
 a08:	85 c0                	test   %eax,%eax
 a0a:	75 e2                	jne    9ee <malloc+0x67>
 a0c:	eb d5                	jmp    9e3 <malloc+0x5c>
