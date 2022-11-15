
_test_19:     file format elf32-i386


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
   assert(arg1_int == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <nested_worker+0x30>
   assert(arg2_int == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <nested_worker+0x79>
   assert(global == 2);
  18:	a1 ec 0f 00 00       	mov    0xfec,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 ec 0f 00 00       	mov    %eax,0xfec
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 e4 0a 00 00       	push   $0xae4
  37:	68 ee 0a 00 00       	push   $0xaee
  3c:	6a 01                	push   $0x1
  3e:	e8 f1 07 00 00       	call   834 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 f6 0a 00 00       	push   $0xaf6
  4b:	68 05 0b 00 00       	push   $0xb05
  50:	6a 01                	push   $0x1
  52:	e8 dd 07 00 00       	call   834 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 19 0b 00 00       	push   $0xb19
  5f:	6a 01                	push   $0x1
  61:	e8 ce 07 00 00       	call   834 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 f0 0f 00 00    	push   0xff0
  6f:	e8 9b 06 00 00       	call   70f <kill>
  74:	e8 66 06 00 00       	call   6df <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 e4 0a 00 00       	push   $0xae4
  80:	68 ee 0a 00 00       	push   $0xaee
  85:	6a 01                	push   $0x1
  87:	e8 a8 07 00 00       	call   834 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 26 0b 00 00       	push   $0xb26
  94:	68 05 0b 00 00       	push   $0xb05
  99:	6a 01                	push   $0x1
  9b:	e8 94 07 00 00       	call   834 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 19 0b 00 00       	push   $0xb19
  a8:	6a 01                	push   $0x1
  aa:	e8 85 07 00 00       	call   834 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 f0 0f 00 00    	push   0xff0
  b8:	e8 52 06 00 00       	call   70f <kill>
  bd:	e8 1d 06 00 00       	call   6df <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 e4 0a 00 00       	push   $0xae4
  c9:	68 ee 0a 00 00       	push   $0xaee
  ce:	6a 01                	push   $0x1
  d0:	e8 5f 07 00 00       	call   834 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 35 0b 00 00       	push   $0xb35
  dd:	68 05 0b 00 00       	push   $0xb05
  e2:	6a 01                	push   $0x1
  e4:	e8 4b 07 00 00       	call   834 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 19 0b 00 00       	push   $0xb19
  f1:	6a 01                	push   $0x1
  f3:	e8 3c 07 00 00       	call   834 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 f0 0f 00 00    	push   0xff0
 101:	e8 09 06 00 00       	call   70f <kill>
 106:	e8 d4 05 00 00       	call   6df <exit>

0000010b <worker>:

void
worker(void *arg1, void *arg2) {
 10b:	55                   	push   %ebp
 10c:	89 e5                	mov    %esp,%ebp
 10e:	53                   	push   %ebx
 10f:	83 ec 14             	sub    $0x14,%esp
   int tmp1 = *(int*)arg1;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
 115:	8b 00                	mov    (%eax),%eax
 117:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int tmp2 = *(int*)arg2;
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
 11d:	8b 12                	mov    (%edx),%edx
 11f:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(tmp1 == 42);
 122:	83 f8 2a             	cmp    $0x2a,%eax
 125:	75 60                	jne    187 <worker+0x7c>
   assert(tmp2 == 24);
 127:	83 fa 18             	cmp    $0x18,%edx
 12a:	0f 85 a0 00 00 00    	jne    1d0 <worker+0xc5>
   assert(global == 1);
 130:	a1 ec 0f 00 00       	mov    0xfec,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 e4 0a 00 00       	push   $0xae4
 145:	68 ee 0a 00 00       	push   $0xaee
 14a:	6a 01                	push   $0x1
 14c:	e8 e3 06 00 00       	call   834 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 57 0b 00 00       	push   $0xb57
 159:	68 05 0b 00 00       	push   $0xb05
 15e:	6a 01                	push   $0x1
 160:	e8 cf 06 00 00       	call   834 <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 19 0b 00 00       	push   $0xb19
 16d:	6a 01                	push   $0x1
 16f:	e8 c0 06 00 00       	call   834 <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 f0 0f 00 00    	push   0xff0
 17d:	e8 8d 05 00 00       	call   70f <kill>
 182:	e8 58 05 00 00       	call   6df <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 e4 0a 00 00       	push   $0xae4
 18e:	68 ee 0a 00 00       	push   $0xaee
 193:	6a 01                	push   $0x1
 195:	e8 9a 06 00 00       	call   834 <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 41 0b 00 00       	push   $0xb41
 1a2:	68 05 0b 00 00       	push   $0xb05
 1a7:	6a 01                	push   $0x1
 1a9:	e8 86 06 00 00       	call   834 <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 19 0b 00 00       	push   $0xb19
 1b6:	6a 01                	push   $0x1
 1b8:	e8 77 06 00 00       	call   834 <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 f0 0f 00 00    	push   0xff0
 1c6:	e8 44 05 00 00       	call   70f <kill>
 1cb:	e8 0f 05 00 00       	call   6df <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 e4 0a 00 00       	push   $0xae4
 1d7:	68 ee 0a 00 00       	push   $0xaee
 1dc:	6a 01                	push   $0x1
 1de:	e8 51 06 00 00       	call   834 <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 4c 0b 00 00       	push   $0xb4c
 1eb:	68 05 0b 00 00       	push   $0xb05
 1f0:	6a 01                	push   $0x1
 1f2:	e8 3d 06 00 00       	call   834 <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 19 0b 00 00       	push   $0xb19
 1ff:	6a 01                	push   $0x1
 201:	e8 2e 06 00 00       	call   834 <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 f0 0f 00 00    	push   0xff0
 20f:	e8 fb 04 00 00       	call   70f <kill>
 214:	e8 c6 04 00 00       	call   6df <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 ec 0f 00 00       	mov    %eax,0xfec

   int nested_thread_pid = thread_create(nested_worker, &tmp1, &tmp2);
 221:	83 ec 04             	sub    $0x4,%esp
 224:	8d 45 f0             	lea    -0x10(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 45 f4             	lea    -0xc(%ebp),%eax
 22b:	50                   	push   %eax
 22c:	68 00 00 00 00       	push   $0x0
 231:	e8 42 04 00 00       	call   678 <thread_create>
 236:	89 c3                	mov    %eax,%ebx
   assert(nested_thread_pid > 0);
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	7e 07                	jle    246 <worker+0x13b>
   for(int j=0;j<10000;j++);
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
 244:	eb 4c                	jmp    292 <worker+0x187>
   assert(nested_thread_pid > 0);
 246:	6a 3c                	push   $0x3c
 248:	68 e4 0a 00 00       	push   $0xae4
 24d:	68 ee 0a 00 00       	push   $0xaee
 252:	6a 01                	push   $0x1
 254:	e8 db 05 00 00       	call   834 <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 63 0b 00 00       	push   $0xb63
 261:	68 05 0b 00 00       	push   $0xb05
 266:	6a 01                	push   $0x1
 268:	e8 c7 05 00 00       	call   834 <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 19 0b 00 00       	push   $0xb19
 275:	6a 01                	push   $0x1
 277:	e8 b8 05 00 00       	call   834 <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 f0 0f 00 00    	push   0xff0
 285:	e8 85 04 00 00       	call   70f <kill>
 28a:	e8 50 04 00 00       	call   6df <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 12 04 00 00       	call   6b0 <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 e4 0a 00 00       	push   $0xae4
 2b1:	68 ee 0a 00 00       	push   $0xaee
 2b6:	6a 01                	push   $0x1
 2b8:	e8 77 05 00 00       	call   834 <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 bc 0b 00 00       	push   $0xbbc
 2c5:	68 05 0b 00 00       	push   $0xb05
 2ca:	6a 01                	push   $0x1
 2cc:	e8 63 05 00 00       	call   834 <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 19 0b 00 00       	push   $0xb19
 2d9:	6a 01                	push   $0x1
 2db:	e8 54 05 00 00       	call   834 <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 f0 0f 00 00    	push   0xff0
 2e9:	e8 21 04 00 00       	call   70f <kill>
 2ee:	e8 ec 03 00 00       	call   6df <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 e4 0a 00 00       	push   $0xae4
 2fa:	68 ee 0a 00 00       	push   $0xaee
 2ff:	6a 01                	push   $0x1
 301:	e8 2e 05 00 00       	call   834 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 79 0b 00 00       	push   $0xb79
 30e:	68 05 0b 00 00       	push   $0xb05
 313:	6a 01                	push   $0x1
 315:	e8 1a 05 00 00       	call   834 <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 19 0b 00 00       	push   $0xb19
 322:	6a 01                	push   $0x1
 324:	e8 0b 05 00 00       	call   834 <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 f0 0f 00 00    	push   0xff0
 332:	e8 d8 03 00 00       	call   70f <kill>
 337:	e8 a3 03 00 00       	call   6df <exit>
   exit();
 33c:	e8 9e 03 00 00       	call   6df <exit>

00000341 <main>:
{
 341:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 345:	83 e4 f0             	and    $0xfffffff0,%esp
 348:	ff 71 fc             	push   -0x4(%ecx)
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	51                   	push   %ecx
 350:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 353:	e8 07 04 00 00       	call   75f <getpid>
 358:	a3 f0 0f 00 00       	mov    %eax,0xff0
   int arg1 = 42, arg2 = 24;
 35d:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 364:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 371:	50                   	push   %eax
 372:	8d 45 f4             	lea    -0xc(%ebp),%eax
 375:	50                   	push   %eax
 376:	68 0b 01 00 00       	push   $0x10b
 37b:	e8 f8 02 00 00       	call   678 <thread_create>
   assert(thread_pid > 0);
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	7e 65                	jle    3ec <main+0xab>
 387:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 389:	e8 22 03 00 00       	call   6b0 <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d ec 0f 00 00 03 	cmpl   $0x3,0xfec
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 e4 0a 00 00       	push   $0xae4
 3aa:	68 ee 0a 00 00       	push   $0xaee
 3af:	6a 01                	push   $0x1
 3b1:	e8 7e 04 00 00       	call   834 <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 a0 0b 00 00       	push   $0xba0
 3be:	68 05 0b 00 00       	push   $0xb05
 3c3:	6a 01                	push   $0x1
 3c5:	e8 6a 04 00 00       	call   834 <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 19 0b 00 00       	push   $0xb19
 3d2:	6a 01                	push   $0x1
 3d4:	e8 5b 04 00 00       	call   834 <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 f0 0f 00 00    	push   0xff0
 3e2:	e8 28 03 00 00       	call   70f <kill>
 3e7:	e8 f3 02 00 00       	call   6df <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 e4 0a 00 00       	push   $0xae4
 3f3:	68 ee 0a 00 00       	push   $0xaee
 3f8:	6a 01                	push   $0x1
 3fa:	e8 35 04 00 00       	call   834 <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 6a 0b 00 00       	push   $0xb6a
 407:	68 05 0b 00 00       	push   $0xb05
 40c:	6a 01                	push   $0x1
 40e:	e8 21 04 00 00       	call   834 <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 19 0b 00 00       	push   $0xb19
 41b:	6a 01                	push   $0x1
 41d:	e8 12 04 00 00       	call   834 <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 f0 0f 00 00    	push   0xff0
 42b:	e8 df 02 00 00       	call   70f <kill>
 430:	e8 aa 02 00 00       	call   6df <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 e4 0a 00 00       	push   $0xae4
 43c:	68 ee 0a 00 00       	push   $0xaee
 441:	6a 01                	push   $0x1
 443:	e8 ec 03 00 00       	call   834 <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 89 0b 00 00       	push   $0xb89
 450:	68 05 0b 00 00       	push   $0xb05
 455:	6a 01                	push   $0x1
 457:	e8 d8 03 00 00       	call   834 <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 19 0b 00 00       	push   $0xb19
 464:	6a 01                	push   $0x1
 466:	e8 c9 03 00 00       	call   834 <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 f0 0f 00 00    	push   0xff0
 474:	e8 96 02 00 00       	call   70f <kill>
 479:	e8 61 02 00 00       	call   6df <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 ac 0b 00 00       	push   $0xbac
 486:	6a 01                	push   $0x1
 488:	e8 a7 03 00 00       	call   834 <printf>
   exit();
 48d:	e8 4d 02 00 00       	call   6df <exit>

00000492 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
 497:	8b 75 08             	mov    0x8(%ebp),%esi
 49a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 49d:	89 f0                	mov    %esi,%eax
 49f:	89 d1                	mov    %edx,%ecx
 4a1:	83 c2 01             	add    $0x1,%edx
 4a4:	89 c3                	mov    %eax,%ebx
 4a6:	83 c0 01             	add    $0x1,%eax
 4a9:	0f b6 09             	movzbl (%ecx),%ecx
 4ac:	88 0b                	mov    %cl,(%ebx)
 4ae:	84 c9                	test   %cl,%cl
 4b0:	75 ed                	jne    49f <strcpy+0xd>
    ;
  return os;
}
 4b2:	89 f0                	mov    %esi,%eax
 4b4:	5b                   	pop    %ebx
 4b5:	5e                   	pop    %esi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    

000004b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4be:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4c1:	eb 06                	jmp    4c9 <strcmp+0x11>
    p++, q++;
 4c3:	83 c1 01             	add    $0x1,%ecx
 4c6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4c9:	0f b6 01             	movzbl (%ecx),%eax
 4cc:	84 c0                	test   %al,%al
 4ce:	74 04                	je     4d4 <strcmp+0x1c>
 4d0:	3a 02                	cmp    (%edx),%al
 4d2:	74 ef                	je     4c3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4d4:	0f b6 c0             	movzbl %al,%eax
 4d7:	0f b6 12             	movzbl (%edx),%edx
 4da:	29 d0                	sub    %edx,%eax
}
 4dc:	5d                   	pop    %ebp
 4dd:	c3                   	ret    

000004de <strlen>:

uint
strlen(const char *s)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4e4:	b8 00 00 00 00       	mov    $0x0,%eax
 4e9:	eb 03                	jmp    4ee <strlen+0x10>
 4eb:	83 c0 01             	add    $0x1,%eax
 4ee:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4f2:	75 f7                	jne    4eb <strlen+0xd>
    ;
  return n;
}
 4f4:	5d                   	pop    %ebp
 4f5:	c3                   	ret    

000004f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4f6:	55                   	push   %ebp
 4f7:	89 e5                	mov    %esp,%ebp
 4f9:	57                   	push   %edi
 4fa:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4fd:	89 d7                	mov    %edx,%edi
 4ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	fc                   	cld    
 506:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 508:	89 d0                	mov    %edx,%eax
 50a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 50d:	c9                   	leave  
 50e:	c3                   	ret    

0000050f <strchr>:

char*
strchr(const char *s, char c)
{
 50f:	55                   	push   %ebp
 510:	89 e5                	mov    %esp,%ebp
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 519:	eb 03                	jmp    51e <strchr+0xf>
 51b:	83 c0 01             	add    $0x1,%eax
 51e:	0f b6 10             	movzbl (%eax),%edx
 521:	84 d2                	test   %dl,%dl
 523:	74 06                	je     52b <strchr+0x1c>
    if(*s == c)
 525:	38 ca                	cmp    %cl,%dl
 527:	75 f2                	jne    51b <strchr+0xc>
 529:	eb 05                	jmp    530 <strchr+0x21>
      return (char*)s;
  return 0;
 52b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    

00000532 <gets>:

char*
gets(char *buf, int max)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	57                   	push   %edi
 536:	56                   	push   %esi
 537:	53                   	push   %ebx
 538:	83 ec 1c             	sub    $0x1c,%esp
 53b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 53e:	bb 00 00 00 00       	mov    $0x0,%ebx
 543:	89 de                	mov    %ebx,%esi
 545:	83 c3 01             	add    $0x1,%ebx
 548:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 54b:	7d 2e                	jge    57b <gets+0x49>
    cc = read(0, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	6a 01                	push   $0x1
 552:	8d 45 e7             	lea    -0x19(%ebp),%eax
 555:	50                   	push   %eax
 556:	6a 00                	push   $0x0
 558:	e8 9a 01 00 00       	call   6f7 <read>
    if(cc < 1)
 55d:	83 c4 10             	add    $0x10,%esp
 560:	85 c0                	test   %eax,%eax
 562:	7e 17                	jle    57b <gets+0x49>
      break;
    buf[i++] = c;
 564:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 568:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 56b:	3c 0a                	cmp    $0xa,%al
 56d:	0f 94 c2             	sete   %dl
 570:	3c 0d                	cmp    $0xd,%al
 572:	0f 94 c0             	sete   %al
 575:	08 c2                	or     %al,%dl
 577:	74 ca                	je     543 <gets+0x11>
    buf[i++] = c;
 579:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 57b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 57f:	89 f8                	mov    %edi,%eax
 581:	8d 65 f4             	lea    -0xc(%ebp),%esp
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret    

00000589 <stat>:

int
stat(const char *n, struct stat *st)
{
 589:	55                   	push   %ebp
 58a:	89 e5                	mov    %esp,%ebp
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 58e:	83 ec 08             	sub    $0x8,%esp
 591:	6a 00                	push   $0x0
 593:	ff 75 08             	push   0x8(%ebp)
 596:	e8 84 01 00 00       	call   71f <open>
  if(fd < 0)
 59b:	83 c4 10             	add    $0x10,%esp
 59e:	85 c0                	test   %eax,%eax
 5a0:	78 24                	js     5c6 <stat+0x3d>
 5a2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5a4:	83 ec 08             	sub    $0x8,%esp
 5a7:	ff 75 0c             	push   0xc(%ebp)
 5aa:	50                   	push   %eax
 5ab:	e8 87 01 00 00       	call   737 <fstat>
 5b0:	89 c6                	mov    %eax,%esi
  close(fd);
 5b2:	89 1c 24             	mov    %ebx,(%esp)
 5b5:	e8 4d 01 00 00       	call   707 <close>
  return r;
 5ba:	83 c4 10             	add    $0x10,%esp
}
 5bd:	89 f0                	mov    %esi,%eax
 5bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c2:	5b                   	pop    %ebx
 5c3:	5e                   	pop    %esi
 5c4:	5d                   	pop    %ebp
 5c5:	c3                   	ret    
    return -1;
 5c6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5cb:	eb f0                	jmp    5bd <stat+0x34>

000005cd <atoi>:

int
atoi(const char *s)
{
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	53                   	push   %ebx
 5d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5d4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5d9:	eb 10                	jmp    5eb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5db:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5de:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5e1:	83 c1 01             	add    $0x1,%ecx
 5e4:	0f be c0             	movsbl %al,%eax
 5e7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5eb:	0f b6 01             	movzbl (%ecx),%eax
 5ee:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f1:	80 fb 09             	cmp    $0x9,%bl
 5f4:	76 e5                	jbe    5db <atoi+0xe>
  return n;
}
 5f6:	89 d0                	mov    %edx,%eax
 5f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5fb:	c9                   	leave  
 5fc:	c3                   	ret    

000005fd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	56                   	push   %esi
 601:	53                   	push   %ebx
 602:	8b 75 08             	mov    0x8(%ebp),%esi
 605:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 608:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 60b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 60d:	eb 0d                	jmp    61c <memmove+0x1f>
    *dst++ = *src++;
 60f:	0f b6 01             	movzbl (%ecx),%eax
 612:	88 02                	mov    %al,(%edx)
 614:	8d 49 01             	lea    0x1(%ecx),%ecx
 617:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 61a:	89 d8                	mov    %ebx,%eax
 61c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 61f:	85 c0                	test   %eax,%eax
 621:	7f ec                	jg     60f <memmove+0x12>
  return vdst;
}
 623:	89 f0                	mov    %esi,%eax
 625:	5b                   	pop    %ebx
 626:	5e                   	pop    %esi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    

00000629 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 629:	55                   	push   %ebp
 62a:	89 e5                	mov    %esp,%ebp
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 62f:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 631:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 634:	89 08                	mov    %ecx,(%eax)
  return old;
}
 636:	89 d0                	mov    %edx,%eax
 638:	5d                   	pop    %ebp
 639:	c3                   	ret    

0000063a <lock_init>:
void 
lock_init(lock_t *lock){
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 63d:	8b 45 08             	mov    0x8(%ebp),%eax
 640:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    

00000648 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 648:	55                   	push   %ebp
 649:	89 e5                	mov    %esp,%ebp
 64b:	53                   	push   %ebx
 64c:	83 ec 04             	sub    $0x4,%esp
 64f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 652:	83 ec 08             	sub    $0x8,%esp
 655:	6a 01                	push   $0x1
 657:	53                   	push   %ebx
 658:	e8 cc ff ff ff       	call   629 <TestAndSet>
 65d:	83 c4 10             	add    $0x10,%esp
 660:	83 f8 01             	cmp    $0x1,%eax
 663:	74 ed                	je     652 <lock_acquire+0xa>
    ;
}
 665:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 668:	c9                   	leave  
 669:	c3                   	ret    

0000066a <lock_release>:
void 
lock_release(lock_t *lock){
 66a:	55                   	push   %ebp
 66b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    

00000678 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 678:	55                   	push   %ebp
 679:	89 e5                	mov    %esp,%ebp
 67b:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 67e:	68 04 20 00 00       	push   $0x2004
 683:	e8 d2 03 00 00       	call   a5a <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 688:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 68b:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 68d:	eb 03                	jmp    692 <thread_create+0x1a>
      stack += 1;
 68f:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 692:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 698:	75 f5                	jne    68f <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 69a:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 69c:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 69f:	52                   	push   %edx
 6a0:	ff 75 10             	push   0x10(%ebp)
 6a3:	ff 75 0c             	push   0xc(%ebp)
 6a6:	ff 75 08             	push   0x8(%ebp)
 6a9:	e8 d1 00 00 00       	call   77f <clone>
 
    return pid;
}
 6ae:	c9                   	leave  
 6af:	c3                   	ret    

000006b0 <thread_join>:
int 
thread_join(){
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	53                   	push   %ebx
 6b4:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 6b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6ba:	50                   	push   %eax
 6bb:	e8 c7 00 00 00       	call   787 <join>
 6c0:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 6c2:	83 c4 04             	add    $0x4,%esp
 6c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c8:	ff 70 fc             	push   -0x4(%eax)
 6cb:	e8 ca 02 00 00       	call   99a <free>
  return waitedForPID;
 6d0:	89 d8                	mov    %ebx,%eax
 6d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d5:	c9                   	leave  
 6d6:	c3                   	ret    

000006d7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6d7:	b8 01 00 00 00       	mov    $0x1,%eax
 6dc:	cd 40                	int    $0x40
 6de:	c3                   	ret    

000006df <exit>:
SYSCALL(exit)
 6df:	b8 02 00 00 00       	mov    $0x2,%eax
 6e4:	cd 40                	int    $0x40
 6e6:	c3                   	ret    

000006e7 <wait>:
SYSCALL(wait)
 6e7:	b8 03 00 00 00       	mov    $0x3,%eax
 6ec:	cd 40                	int    $0x40
 6ee:	c3                   	ret    

000006ef <pipe>:
SYSCALL(pipe)
 6ef:	b8 04 00 00 00       	mov    $0x4,%eax
 6f4:	cd 40                	int    $0x40
 6f6:	c3                   	ret    

000006f7 <read>:
SYSCALL(read)
 6f7:	b8 05 00 00 00       	mov    $0x5,%eax
 6fc:	cd 40                	int    $0x40
 6fe:	c3                   	ret    

000006ff <write>:
SYSCALL(write)
 6ff:	b8 10 00 00 00       	mov    $0x10,%eax
 704:	cd 40                	int    $0x40
 706:	c3                   	ret    

00000707 <close>:
SYSCALL(close)
 707:	b8 15 00 00 00       	mov    $0x15,%eax
 70c:	cd 40                	int    $0x40
 70e:	c3                   	ret    

0000070f <kill>:
SYSCALL(kill)
 70f:	b8 06 00 00 00       	mov    $0x6,%eax
 714:	cd 40                	int    $0x40
 716:	c3                   	ret    

00000717 <exec>:
SYSCALL(exec)
 717:	b8 07 00 00 00       	mov    $0x7,%eax
 71c:	cd 40                	int    $0x40
 71e:	c3                   	ret    

0000071f <open>:
SYSCALL(open)
 71f:	b8 0f 00 00 00       	mov    $0xf,%eax
 724:	cd 40                	int    $0x40
 726:	c3                   	ret    

00000727 <mknod>:
SYSCALL(mknod)
 727:	b8 11 00 00 00       	mov    $0x11,%eax
 72c:	cd 40                	int    $0x40
 72e:	c3                   	ret    

0000072f <unlink>:
SYSCALL(unlink)
 72f:	b8 12 00 00 00       	mov    $0x12,%eax
 734:	cd 40                	int    $0x40
 736:	c3                   	ret    

00000737 <fstat>:
SYSCALL(fstat)
 737:	b8 08 00 00 00       	mov    $0x8,%eax
 73c:	cd 40                	int    $0x40
 73e:	c3                   	ret    

0000073f <link>:
SYSCALL(link)
 73f:	b8 13 00 00 00       	mov    $0x13,%eax
 744:	cd 40                	int    $0x40
 746:	c3                   	ret    

00000747 <mkdir>:
SYSCALL(mkdir)
 747:	b8 14 00 00 00       	mov    $0x14,%eax
 74c:	cd 40                	int    $0x40
 74e:	c3                   	ret    

0000074f <chdir>:
SYSCALL(chdir)
 74f:	b8 09 00 00 00       	mov    $0x9,%eax
 754:	cd 40                	int    $0x40
 756:	c3                   	ret    

00000757 <dup>:
SYSCALL(dup)
 757:	b8 0a 00 00 00       	mov    $0xa,%eax
 75c:	cd 40                	int    $0x40
 75e:	c3                   	ret    

0000075f <getpid>:
SYSCALL(getpid)
 75f:	b8 0b 00 00 00       	mov    $0xb,%eax
 764:	cd 40                	int    $0x40
 766:	c3                   	ret    

00000767 <sbrk>:
SYSCALL(sbrk)
 767:	b8 0c 00 00 00       	mov    $0xc,%eax
 76c:	cd 40                	int    $0x40
 76e:	c3                   	ret    

0000076f <sleep>:
SYSCALL(sleep)
 76f:	b8 0d 00 00 00       	mov    $0xd,%eax
 774:	cd 40                	int    $0x40
 776:	c3                   	ret    

00000777 <uptime>:
SYSCALL(uptime)
 777:	b8 0e 00 00 00       	mov    $0xe,%eax
 77c:	cd 40                	int    $0x40
 77e:	c3                   	ret    

0000077f <clone>:
SYSCALL(clone)
 77f:	b8 16 00 00 00       	mov    $0x16,%eax
 784:	cd 40                	int    $0x40
 786:	c3                   	ret    

00000787 <join>:
SYSCALL(join)
 787:	b8 17 00 00 00       	mov    $0x17,%eax
 78c:	cd 40                	int    $0x40
 78e:	c3                   	ret    

0000078f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 78f:	55                   	push   %ebp
 790:	89 e5                	mov    %esp,%ebp
 792:	83 ec 1c             	sub    $0x1c,%esp
 795:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 798:	6a 01                	push   $0x1
 79a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 79d:	52                   	push   %edx
 79e:	50                   	push   %eax
 79f:	e8 5b ff ff ff       	call   6ff <write>
}
 7a4:	83 c4 10             	add    $0x10,%esp
 7a7:	c9                   	leave  
 7a8:	c3                   	ret    

000007a9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7a9:	55                   	push   %ebp
 7aa:	89 e5                	mov    %esp,%ebp
 7ac:	57                   	push   %edi
 7ad:	56                   	push   %esi
 7ae:	53                   	push   %ebx
 7af:	83 ec 2c             	sub    $0x2c,%esp
 7b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7b5:	89 d0                	mov    %edx,%eax
 7b7:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7b9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7bd:	0f 95 c1             	setne  %cl
 7c0:	c1 ea 1f             	shr    $0x1f,%edx
 7c3:	84 d1                	test   %dl,%cl
 7c5:	74 44                	je     80b <printint+0x62>
    neg = 1;
    x = -xx;
 7c7:	f7 d8                	neg    %eax
 7c9:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7cb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7d2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7d7:	89 c8                	mov    %ecx,%eax
 7d9:	ba 00 00 00 00       	mov    $0x0,%edx
 7de:	f7 f6                	div    %esi
 7e0:	89 df                	mov    %ebx,%edi
 7e2:	83 c3 01             	add    $0x1,%ebx
 7e5:	0f b6 92 40 0c 00 00 	movzbl 0xc40(%edx),%edx
 7ec:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7f0:	89 ca                	mov    %ecx,%edx
 7f2:	89 c1                	mov    %eax,%ecx
 7f4:	39 d6                	cmp    %edx,%esi
 7f6:	76 df                	jbe    7d7 <printint+0x2e>
  if(neg)
 7f8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7fc:	74 31                	je     82f <printint+0x86>
    buf[i++] = '-';
 7fe:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 803:	8d 5f 02             	lea    0x2(%edi),%ebx
 806:	8b 75 d0             	mov    -0x30(%ebp),%esi
 809:	eb 17                	jmp    822 <printint+0x79>
    x = xx;
 80b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 80d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 814:	eb bc                	jmp    7d2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 816:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 81b:	89 f0                	mov    %esi,%eax
 81d:	e8 6d ff ff ff       	call   78f <putc>
  while(--i >= 0)
 822:	83 eb 01             	sub    $0x1,%ebx
 825:	79 ef                	jns    816 <printint+0x6d>
}
 827:	83 c4 2c             	add    $0x2c,%esp
 82a:	5b                   	pop    %ebx
 82b:	5e                   	pop    %esi
 82c:	5f                   	pop    %edi
 82d:	5d                   	pop    %ebp
 82e:	c3                   	ret    
 82f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 832:	eb ee                	jmp    822 <printint+0x79>

00000834 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 834:	55                   	push   %ebp
 835:	89 e5                	mov    %esp,%ebp
 837:	57                   	push   %edi
 838:	56                   	push   %esi
 839:	53                   	push   %ebx
 83a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 83d:	8d 45 10             	lea    0x10(%ebp),%eax
 840:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 843:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 848:	bb 00 00 00 00       	mov    $0x0,%ebx
 84d:	eb 14                	jmp    863 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 84f:	89 fa                	mov    %edi,%edx
 851:	8b 45 08             	mov    0x8(%ebp),%eax
 854:	e8 36 ff ff ff       	call   78f <putc>
 859:	eb 05                	jmp    860 <printf+0x2c>
      }
    } else if(state == '%'){
 85b:	83 fe 25             	cmp    $0x25,%esi
 85e:	74 25                	je     885 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 860:	83 c3 01             	add    $0x1,%ebx
 863:	8b 45 0c             	mov    0xc(%ebp),%eax
 866:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 86a:	84 c0                	test   %al,%al
 86c:	0f 84 20 01 00 00    	je     992 <printf+0x15e>
    c = fmt[i] & 0xff;
 872:	0f be f8             	movsbl %al,%edi
 875:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 878:	85 f6                	test   %esi,%esi
 87a:	75 df                	jne    85b <printf+0x27>
      if(c == '%'){
 87c:	83 f8 25             	cmp    $0x25,%eax
 87f:	75 ce                	jne    84f <printf+0x1b>
        state = '%';
 881:	89 c6                	mov    %eax,%esi
 883:	eb db                	jmp    860 <printf+0x2c>
      if(c == 'd'){
 885:	83 f8 25             	cmp    $0x25,%eax
 888:	0f 84 cf 00 00 00    	je     95d <printf+0x129>
 88e:	0f 8c dd 00 00 00    	jl     971 <printf+0x13d>
 894:	83 f8 78             	cmp    $0x78,%eax
 897:	0f 8f d4 00 00 00    	jg     971 <printf+0x13d>
 89d:	83 f8 63             	cmp    $0x63,%eax
 8a0:	0f 8c cb 00 00 00    	jl     971 <printf+0x13d>
 8a6:	83 e8 63             	sub    $0x63,%eax
 8a9:	83 f8 15             	cmp    $0x15,%eax
 8ac:	0f 87 bf 00 00 00    	ja     971 <printf+0x13d>
 8b2:	ff 24 85 e8 0b 00 00 	jmp    *0xbe8(,%eax,4)
        printint(fd, *ap, 10, 1);
 8b9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8bc:	8b 17                	mov    (%edi),%edx
 8be:	83 ec 0c             	sub    $0xc,%esp
 8c1:	6a 01                	push   $0x1
 8c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8c8:	8b 45 08             	mov    0x8(%ebp),%eax
 8cb:	e8 d9 fe ff ff       	call   7a9 <printint>
        ap++;
 8d0:	83 c7 04             	add    $0x4,%edi
 8d3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8d6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8d9:	be 00 00 00 00       	mov    $0x0,%esi
 8de:	eb 80                	jmp    860 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8e0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8e3:	8b 17                	mov    (%edi),%edx
 8e5:	83 ec 0c             	sub    $0xc,%esp
 8e8:	6a 00                	push   $0x0
 8ea:	b9 10 00 00 00       	mov    $0x10,%ecx
 8ef:	8b 45 08             	mov    0x8(%ebp),%eax
 8f2:	e8 b2 fe ff ff       	call   7a9 <printint>
        ap++;
 8f7:	83 c7 04             	add    $0x4,%edi
 8fa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8fd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 900:	be 00 00 00 00       	mov    $0x0,%esi
 905:	e9 56 ff ff ff       	jmp    860 <printf+0x2c>
        s = (char*)*ap;
 90a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 90d:	8b 30                	mov    (%eax),%esi
        ap++;
 90f:	83 c0 04             	add    $0x4,%eax
 912:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 915:	85 f6                	test   %esi,%esi
 917:	75 15                	jne    92e <printf+0xfa>
          s = "(null)";
 919:	be e1 0b 00 00       	mov    $0xbe1,%esi
 91e:	eb 0e                	jmp    92e <printf+0xfa>
          putc(fd, *s);
 920:	0f be d2             	movsbl %dl,%edx
 923:	8b 45 08             	mov    0x8(%ebp),%eax
 926:	e8 64 fe ff ff       	call   78f <putc>
          s++;
 92b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 92e:	0f b6 16             	movzbl (%esi),%edx
 931:	84 d2                	test   %dl,%dl
 933:	75 eb                	jne    920 <printf+0xec>
      state = 0;
 935:	be 00 00 00 00       	mov    $0x0,%esi
 93a:	e9 21 ff ff ff       	jmp    860 <printf+0x2c>
        putc(fd, *ap);
 93f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 942:	0f be 17             	movsbl (%edi),%edx
 945:	8b 45 08             	mov    0x8(%ebp),%eax
 948:	e8 42 fe ff ff       	call   78f <putc>
        ap++;
 94d:	83 c7 04             	add    $0x4,%edi
 950:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 953:	be 00 00 00 00       	mov    $0x0,%esi
 958:	e9 03 ff ff ff       	jmp    860 <printf+0x2c>
        putc(fd, c);
 95d:	89 fa                	mov    %edi,%edx
 95f:	8b 45 08             	mov    0x8(%ebp),%eax
 962:	e8 28 fe ff ff       	call   78f <putc>
      state = 0;
 967:	be 00 00 00 00       	mov    $0x0,%esi
 96c:	e9 ef fe ff ff       	jmp    860 <printf+0x2c>
        putc(fd, '%');
 971:	ba 25 00 00 00       	mov    $0x25,%edx
 976:	8b 45 08             	mov    0x8(%ebp),%eax
 979:	e8 11 fe ff ff       	call   78f <putc>
        putc(fd, c);
 97e:	89 fa                	mov    %edi,%edx
 980:	8b 45 08             	mov    0x8(%ebp),%eax
 983:	e8 07 fe ff ff       	call   78f <putc>
      state = 0;
 988:	be 00 00 00 00       	mov    $0x0,%esi
 98d:	e9 ce fe ff ff       	jmp    860 <printf+0x2c>
    }
  }
}
 992:	8d 65 f4             	lea    -0xc(%ebp),%esp
 995:	5b                   	pop    %ebx
 996:	5e                   	pop    %esi
 997:	5f                   	pop    %edi
 998:	5d                   	pop    %ebp
 999:	c3                   	ret    

0000099a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 99a:	55                   	push   %ebp
 99b:	89 e5                	mov    %esp,%ebp
 99d:	57                   	push   %edi
 99e:	56                   	push   %esi
 99f:	53                   	push   %ebx
 9a0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9a3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a6:	a1 f4 0f 00 00       	mov    0xff4,%eax
 9ab:	eb 02                	jmp    9af <free+0x15>
 9ad:	89 d0                	mov    %edx,%eax
 9af:	39 c8                	cmp    %ecx,%eax
 9b1:	73 04                	jae    9b7 <free+0x1d>
 9b3:	39 08                	cmp    %ecx,(%eax)
 9b5:	77 12                	ja     9c9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b7:	8b 10                	mov    (%eax),%edx
 9b9:	39 c2                	cmp    %eax,%edx
 9bb:	77 f0                	ja     9ad <free+0x13>
 9bd:	39 c8                	cmp    %ecx,%eax
 9bf:	72 08                	jb     9c9 <free+0x2f>
 9c1:	39 ca                	cmp    %ecx,%edx
 9c3:	77 04                	ja     9c9 <free+0x2f>
 9c5:	89 d0                	mov    %edx,%eax
 9c7:	eb e6                	jmp    9af <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9c9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9cc:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9cf:	8b 10                	mov    (%eax),%edx
 9d1:	39 d7                	cmp    %edx,%edi
 9d3:	74 19                	je     9ee <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9d5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9d8:	8b 50 04             	mov    0x4(%eax),%edx
 9db:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9de:	39 ce                	cmp    %ecx,%esi
 9e0:	74 1b                	je     9fd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9e2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9e4:	a3 f4 0f 00 00       	mov    %eax,0xff4
}
 9e9:	5b                   	pop    %ebx
 9ea:	5e                   	pop    %esi
 9eb:	5f                   	pop    %edi
 9ec:	5d                   	pop    %ebp
 9ed:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9ee:	03 72 04             	add    0x4(%edx),%esi
 9f1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9f4:	8b 10                	mov    (%eax),%edx
 9f6:	8b 12                	mov    (%edx),%edx
 9f8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9fb:	eb db                	jmp    9d8 <free+0x3e>
    p->s.size += bp->s.size;
 9fd:	03 53 fc             	add    -0x4(%ebx),%edx
 a00:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a03:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a06:	89 10                	mov    %edx,(%eax)
 a08:	eb da                	jmp    9e4 <free+0x4a>

00000a0a <morecore>:

static Header*
morecore(uint nu)
{
 a0a:	55                   	push   %ebp
 a0b:	89 e5                	mov    %esp,%ebp
 a0d:	53                   	push   %ebx
 a0e:	83 ec 04             	sub    $0x4,%esp
 a11:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a13:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a18:	77 05                	ja     a1f <morecore+0x15>
    nu = 4096;
 a1a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a1f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a26:	83 ec 0c             	sub    $0xc,%esp
 a29:	50                   	push   %eax
 a2a:	e8 38 fd ff ff       	call   767 <sbrk>
  if(p == (char*)-1)
 a2f:	83 c4 10             	add    $0x10,%esp
 a32:	83 f8 ff             	cmp    $0xffffffff,%eax
 a35:	74 1c                	je     a53 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a37:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a3a:	83 c0 08             	add    $0x8,%eax
 a3d:	83 ec 0c             	sub    $0xc,%esp
 a40:	50                   	push   %eax
 a41:	e8 54 ff ff ff       	call   99a <free>
  return freep;
 a46:	a1 f4 0f 00 00       	mov    0xff4,%eax
 a4b:	83 c4 10             	add    $0x10,%esp
}
 a4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a51:	c9                   	leave  
 a52:	c3                   	ret    
    return 0;
 a53:	b8 00 00 00 00       	mov    $0x0,%eax
 a58:	eb f4                	jmp    a4e <morecore+0x44>

00000a5a <malloc>:

void*
malloc(uint nbytes)
{
 a5a:	55                   	push   %ebp
 a5b:	89 e5                	mov    %esp,%ebp
 a5d:	53                   	push   %ebx
 a5e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a61:	8b 45 08             	mov    0x8(%ebp),%eax
 a64:	8d 58 07             	lea    0x7(%eax),%ebx
 a67:	c1 eb 03             	shr    $0x3,%ebx
 a6a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a6d:	8b 0d f4 0f 00 00    	mov    0xff4,%ecx
 a73:	85 c9                	test   %ecx,%ecx
 a75:	74 04                	je     a7b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a77:	8b 01                	mov    (%ecx),%eax
 a79:	eb 4a                	jmp    ac5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a7b:	c7 05 f4 0f 00 00 f8 	movl   $0xff8,0xff4
 a82:	0f 00 00 
 a85:	c7 05 f8 0f 00 00 f8 	movl   $0xff8,0xff8
 a8c:	0f 00 00 
    base.s.size = 0;
 a8f:	c7 05 fc 0f 00 00 00 	movl   $0x0,0xffc
 a96:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a99:	b9 f8 0f 00 00       	mov    $0xff8,%ecx
 a9e:	eb d7                	jmp    a77 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 aa0:	74 19                	je     abb <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 aa2:	29 da                	sub    %ebx,%edx
 aa4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aa7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 aaa:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 aad:	89 0d f4 0f 00 00    	mov    %ecx,0xff4
      return (void*)(p + 1);
 ab3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ab6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ab9:	c9                   	leave  
 aba:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 abb:	8b 10                	mov    (%eax),%edx
 abd:	89 11                	mov    %edx,(%ecx)
 abf:	eb ec                	jmp    aad <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac1:	89 c1                	mov    %eax,%ecx
 ac3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 ac5:	8b 50 04             	mov    0x4(%eax),%edx
 ac8:	39 da                	cmp    %ebx,%edx
 aca:	73 d4                	jae    aa0 <malloc+0x46>
    if(p == freep)
 acc:	39 05 f4 0f 00 00    	cmp    %eax,0xff4
 ad2:	75 ed                	jne    ac1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ad4:	89 d8                	mov    %ebx,%eax
 ad6:	e8 2f ff ff ff       	call   a0a <morecore>
 adb:	85 c0                	test   %eax,%eax
 add:	75 e2                	jne    ac1 <malloc+0x67>
 adf:	eb d5                	jmp    ab6 <malloc+0x5c>
