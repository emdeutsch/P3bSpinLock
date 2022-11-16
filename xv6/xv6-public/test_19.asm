
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
  18:	a1 e8 0f 00 00       	mov    0xfe8,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 e8 0f 00 00       	mov    %eax,0xfe8
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 e0 0a 00 00       	push   $0xae0
  37:	68 ea 0a 00 00       	push   $0xaea
  3c:	6a 01                	push   $0x1
  3e:	e8 f0 07 00 00       	call   833 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 f2 0a 00 00       	push   $0xaf2
  4b:	68 01 0b 00 00       	push   $0xb01
  50:	6a 01                	push   $0x1
  52:	e8 dc 07 00 00       	call   833 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 15 0b 00 00       	push   $0xb15
  5f:	6a 01                	push   $0x1
  61:	e8 cd 07 00 00       	call   833 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 ec 0f 00 00    	push   0xfec
  6f:	e8 9a 06 00 00       	call   70e <kill>
  74:	e8 65 06 00 00       	call   6de <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 e0 0a 00 00       	push   $0xae0
  80:	68 ea 0a 00 00       	push   $0xaea
  85:	6a 01                	push   $0x1
  87:	e8 a7 07 00 00       	call   833 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 22 0b 00 00       	push   $0xb22
  94:	68 01 0b 00 00       	push   $0xb01
  99:	6a 01                	push   $0x1
  9b:	e8 93 07 00 00       	call   833 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 15 0b 00 00       	push   $0xb15
  a8:	6a 01                	push   $0x1
  aa:	e8 84 07 00 00       	call   833 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 ec 0f 00 00    	push   0xfec
  b8:	e8 51 06 00 00       	call   70e <kill>
  bd:	e8 1c 06 00 00       	call   6de <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 e0 0a 00 00       	push   $0xae0
  c9:	68 ea 0a 00 00       	push   $0xaea
  ce:	6a 01                	push   $0x1
  d0:	e8 5e 07 00 00       	call   833 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 31 0b 00 00       	push   $0xb31
  dd:	68 01 0b 00 00       	push   $0xb01
  e2:	6a 01                	push   $0x1
  e4:	e8 4a 07 00 00       	call   833 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 15 0b 00 00       	push   $0xb15
  f1:	6a 01                	push   $0x1
  f3:	e8 3b 07 00 00       	call   833 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 ec 0f 00 00    	push   0xfec
 101:	e8 08 06 00 00       	call   70e <kill>
 106:	e8 d3 05 00 00       	call   6de <exit>

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
 130:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 e0 0a 00 00       	push   $0xae0
 145:	68 ea 0a 00 00       	push   $0xaea
 14a:	6a 01                	push   $0x1
 14c:	e8 e2 06 00 00       	call   833 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 53 0b 00 00       	push   $0xb53
 159:	68 01 0b 00 00       	push   $0xb01
 15e:	6a 01                	push   $0x1
 160:	e8 ce 06 00 00       	call   833 <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 15 0b 00 00       	push   $0xb15
 16d:	6a 01                	push   $0x1
 16f:	e8 bf 06 00 00       	call   833 <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 ec 0f 00 00    	push   0xfec
 17d:	e8 8c 05 00 00       	call   70e <kill>
 182:	e8 57 05 00 00       	call   6de <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 e0 0a 00 00       	push   $0xae0
 18e:	68 ea 0a 00 00       	push   $0xaea
 193:	6a 01                	push   $0x1
 195:	e8 99 06 00 00       	call   833 <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 3d 0b 00 00       	push   $0xb3d
 1a2:	68 01 0b 00 00       	push   $0xb01
 1a7:	6a 01                	push   $0x1
 1a9:	e8 85 06 00 00       	call   833 <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 15 0b 00 00       	push   $0xb15
 1b6:	6a 01                	push   $0x1
 1b8:	e8 76 06 00 00       	call   833 <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 ec 0f 00 00    	push   0xfec
 1c6:	e8 43 05 00 00       	call   70e <kill>
 1cb:	e8 0e 05 00 00       	call   6de <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 e0 0a 00 00       	push   $0xae0
 1d7:	68 ea 0a 00 00       	push   $0xaea
 1dc:	6a 01                	push   $0x1
 1de:	e8 50 06 00 00       	call   833 <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 48 0b 00 00       	push   $0xb48
 1eb:	68 01 0b 00 00       	push   $0xb01
 1f0:	6a 01                	push   $0x1
 1f2:	e8 3c 06 00 00       	call   833 <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 15 0b 00 00       	push   $0xb15
 1ff:	6a 01                	push   $0x1
 201:	e8 2d 06 00 00       	call   833 <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 ec 0f 00 00    	push   0xfec
 20f:	e8 fa 04 00 00       	call   70e <kill>
 214:	e8 c5 04 00 00       	call   6de <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 e8 0f 00 00       	mov    %eax,0xfe8

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
 248:	68 e0 0a 00 00       	push   $0xae0
 24d:	68 ea 0a 00 00       	push   $0xaea
 252:	6a 01                	push   $0x1
 254:	e8 da 05 00 00       	call   833 <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 5f 0b 00 00       	push   $0xb5f
 261:	68 01 0b 00 00       	push   $0xb01
 266:	6a 01                	push   $0x1
 268:	e8 c6 05 00 00       	call   833 <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 15 0b 00 00       	push   $0xb15
 275:	6a 01                	push   $0x1
 277:	e8 b7 05 00 00       	call   833 <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 ec 0f 00 00    	push   0xfec
 285:	e8 84 04 00 00       	call   70e <kill>
 28a:	e8 4f 04 00 00       	call   6de <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 11 04 00 00       	call   6af <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 e0 0a 00 00       	push   $0xae0
 2b1:	68 ea 0a 00 00       	push   $0xaea
 2b6:	6a 01                	push   $0x1
 2b8:	e8 76 05 00 00       	call   833 <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 b8 0b 00 00       	push   $0xbb8
 2c5:	68 01 0b 00 00       	push   $0xb01
 2ca:	6a 01                	push   $0x1
 2cc:	e8 62 05 00 00       	call   833 <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 15 0b 00 00       	push   $0xb15
 2d9:	6a 01                	push   $0x1
 2db:	e8 53 05 00 00       	call   833 <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 ec 0f 00 00    	push   0xfec
 2e9:	e8 20 04 00 00       	call   70e <kill>
 2ee:	e8 eb 03 00 00       	call   6de <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 e0 0a 00 00       	push   $0xae0
 2fa:	68 ea 0a 00 00       	push   $0xaea
 2ff:	6a 01                	push   $0x1
 301:	e8 2d 05 00 00       	call   833 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 75 0b 00 00       	push   $0xb75
 30e:	68 01 0b 00 00       	push   $0xb01
 313:	6a 01                	push   $0x1
 315:	e8 19 05 00 00       	call   833 <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 15 0b 00 00       	push   $0xb15
 322:	6a 01                	push   $0x1
 324:	e8 0a 05 00 00       	call   833 <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 ec 0f 00 00    	push   0xfec
 332:	e8 d7 03 00 00       	call   70e <kill>
 337:	e8 a2 03 00 00       	call   6de <exit>
   exit();
 33c:	e8 9d 03 00 00       	call   6de <exit>

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
 353:	e8 06 04 00 00       	call   75e <getpid>
 358:	a3 ec 0f 00 00       	mov    %eax,0xfec
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
 389:	e8 21 03 00 00       	call   6af <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d e8 0f 00 00 03 	cmpl   $0x3,0xfe8
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 e0 0a 00 00       	push   $0xae0
 3aa:	68 ea 0a 00 00       	push   $0xaea
 3af:	6a 01                	push   $0x1
 3b1:	e8 7d 04 00 00       	call   833 <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 9c 0b 00 00       	push   $0xb9c
 3be:	68 01 0b 00 00       	push   $0xb01
 3c3:	6a 01                	push   $0x1
 3c5:	e8 69 04 00 00       	call   833 <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 15 0b 00 00       	push   $0xb15
 3d2:	6a 01                	push   $0x1
 3d4:	e8 5a 04 00 00       	call   833 <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 ec 0f 00 00    	push   0xfec
 3e2:	e8 27 03 00 00       	call   70e <kill>
 3e7:	e8 f2 02 00 00       	call   6de <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 e0 0a 00 00       	push   $0xae0
 3f3:	68 ea 0a 00 00       	push   $0xaea
 3f8:	6a 01                	push   $0x1
 3fa:	e8 34 04 00 00       	call   833 <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 66 0b 00 00       	push   $0xb66
 407:	68 01 0b 00 00       	push   $0xb01
 40c:	6a 01                	push   $0x1
 40e:	e8 20 04 00 00       	call   833 <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 15 0b 00 00       	push   $0xb15
 41b:	6a 01                	push   $0x1
 41d:	e8 11 04 00 00       	call   833 <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 ec 0f 00 00    	push   0xfec
 42b:	e8 de 02 00 00       	call   70e <kill>
 430:	e8 a9 02 00 00       	call   6de <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 e0 0a 00 00       	push   $0xae0
 43c:	68 ea 0a 00 00       	push   $0xaea
 441:	6a 01                	push   $0x1
 443:	e8 eb 03 00 00       	call   833 <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 85 0b 00 00       	push   $0xb85
 450:	68 01 0b 00 00       	push   $0xb01
 455:	6a 01                	push   $0x1
 457:	e8 d7 03 00 00       	call   833 <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 15 0b 00 00       	push   $0xb15
 464:	6a 01                	push   $0x1
 466:	e8 c8 03 00 00       	call   833 <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 ec 0f 00 00    	push   0xfec
 474:	e8 95 02 00 00       	call   70e <kill>
 479:	e8 60 02 00 00       	call   6de <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 a8 0b 00 00       	push   $0xba8
 486:	6a 01                	push   $0x1
 488:	e8 a6 03 00 00       	call   833 <printf>
   exit();
 48d:	e8 4c 02 00 00       	call   6de <exit>

00000492 <strcpy>:
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
 558:	e8 99 01 00 00       	call   6f6 <read>
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
 596:	e8 83 01 00 00       	call   71e <open>
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
 5ab:	e8 86 01 00 00       	call   736 <fstat>
 5b0:	89 c6                	mov    %eax,%esi
  close(fd);
 5b2:	89 1c 24             	mov    %ebx,(%esp)
 5b5:	e8 4c 01 00 00       	call   706 <close>
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
 683:	e8 d1 03 00 00       	call   a59 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 688:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 68b:	83 c4 10             	add    $0x10,%esp
 68e:	eb 03                	jmp    693 <thread_create+0x1b>
      stack += 1;
 690:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 693:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 699:	75 f5                	jne    690 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 69b:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 69e:	52                   	push   %edx
 69f:	ff 75 10             	push   0x10(%ebp)
 6a2:	ff 75 0c             	push   0xc(%ebp)
 6a5:	ff 75 08             	push   0x8(%ebp)
 6a8:	e8 d1 00 00 00       	call   77e <clone>
 
    return pid;
}
 6ad:	c9                   	leave  
 6ae:	c3                   	ret    

000006af <thread_join>:
int 
thread_join(){
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
 6b2:	53                   	push   %ebx
 6b3:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 6b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6b9:	50                   	push   %eax
 6ba:	e8 c7 00 00 00       	call   786 <join>
 6bf:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 6c1:	83 c4 04             	add    $0x4,%esp
 6c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c7:	ff 70 fc             	push   -0x4(%eax)
 6ca:	e8 ca 02 00 00       	call   999 <free>
  return pid;
 6cf:	89 d8                	mov    %ebx,%eax
 6d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d4:	c9                   	leave  
 6d5:	c3                   	ret    

000006d6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6d6:	b8 01 00 00 00       	mov    $0x1,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <exit>:
SYSCALL(exit)
 6de:	b8 02 00 00 00       	mov    $0x2,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <wait>:
SYSCALL(wait)
 6e6:	b8 03 00 00 00       	mov    $0x3,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <pipe>:
SYSCALL(pipe)
 6ee:	b8 04 00 00 00       	mov    $0x4,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <read>:
SYSCALL(read)
 6f6:	b8 05 00 00 00       	mov    $0x5,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <write>:
SYSCALL(write)
 6fe:	b8 10 00 00 00       	mov    $0x10,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <close>:
SYSCALL(close)
 706:	b8 15 00 00 00       	mov    $0x15,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <kill>:
SYSCALL(kill)
 70e:	b8 06 00 00 00       	mov    $0x6,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret    

00000716 <exec>:
SYSCALL(exec)
 716:	b8 07 00 00 00       	mov    $0x7,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret    

0000071e <open>:
SYSCALL(open)
 71e:	b8 0f 00 00 00       	mov    $0xf,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret    

00000726 <mknod>:
SYSCALL(mknod)
 726:	b8 11 00 00 00       	mov    $0x11,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret    

0000072e <unlink>:
SYSCALL(unlink)
 72e:	b8 12 00 00 00       	mov    $0x12,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret    

00000736 <fstat>:
SYSCALL(fstat)
 736:	b8 08 00 00 00       	mov    $0x8,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret    

0000073e <link>:
SYSCALL(link)
 73e:	b8 13 00 00 00       	mov    $0x13,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret    

00000746 <mkdir>:
SYSCALL(mkdir)
 746:	b8 14 00 00 00       	mov    $0x14,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret    

0000074e <chdir>:
SYSCALL(chdir)
 74e:	b8 09 00 00 00       	mov    $0x9,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret    

00000756 <dup>:
SYSCALL(dup)
 756:	b8 0a 00 00 00       	mov    $0xa,%eax
 75b:	cd 40                	int    $0x40
 75d:	c3                   	ret    

0000075e <getpid>:
SYSCALL(getpid)
 75e:	b8 0b 00 00 00       	mov    $0xb,%eax
 763:	cd 40                	int    $0x40
 765:	c3                   	ret    

00000766 <sbrk>:
SYSCALL(sbrk)
 766:	b8 0c 00 00 00       	mov    $0xc,%eax
 76b:	cd 40                	int    $0x40
 76d:	c3                   	ret    

0000076e <sleep>:
SYSCALL(sleep)
 76e:	b8 0d 00 00 00       	mov    $0xd,%eax
 773:	cd 40                	int    $0x40
 775:	c3                   	ret    

00000776 <uptime>:
SYSCALL(uptime)
 776:	b8 0e 00 00 00       	mov    $0xe,%eax
 77b:	cd 40                	int    $0x40
 77d:	c3                   	ret    

0000077e <clone>:
SYSCALL(clone)
 77e:	b8 16 00 00 00       	mov    $0x16,%eax
 783:	cd 40                	int    $0x40
 785:	c3                   	ret    

00000786 <join>:
SYSCALL(join)
 786:	b8 17 00 00 00       	mov    $0x17,%eax
 78b:	cd 40                	int    $0x40
 78d:	c3                   	ret    

0000078e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 78e:	55                   	push   %ebp
 78f:	89 e5                	mov    %esp,%ebp
 791:	83 ec 1c             	sub    $0x1c,%esp
 794:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 797:	6a 01                	push   $0x1
 799:	8d 55 f4             	lea    -0xc(%ebp),%edx
 79c:	52                   	push   %edx
 79d:	50                   	push   %eax
 79e:	e8 5b ff ff ff       	call   6fe <write>
}
 7a3:	83 c4 10             	add    $0x10,%esp
 7a6:	c9                   	leave  
 7a7:	c3                   	ret    

000007a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7a8:	55                   	push   %ebp
 7a9:	89 e5                	mov    %esp,%ebp
 7ab:	57                   	push   %edi
 7ac:	56                   	push   %esi
 7ad:	53                   	push   %ebx
 7ae:	83 ec 2c             	sub    $0x2c,%esp
 7b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7b4:	89 d0                	mov    %edx,%eax
 7b6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7b8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7bc:	0f 95 c1             	setne  %cl
 7bf:	c1 ea 1f             	shr    $0x1f,%edx
 7c2:	84 d1                	test   %dl,%cl
 7c4:	74 44                	je     80a <printint+0x62>
    neg = 1;
    x = -xx;
 7c6:	f7 d8                	neg    %eax
 7c8:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7ca:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7d1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7d6:	89 c8                	mov    %ecx,%eax
 7d8:	ba 00 00 00 00       	mov    $0x0,%edx
 7dd:	f7 f6                	div    %esi
 7df:	89 df                	mov    %ebx,%edi
 7e1:	83 c3 01             	add    $0x1,%ebx
 7e4:	0f b6 92 3c 0c 00 00 	movzbl 0xc3c(%edx),%edx
 7eb:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7ef:	89 ca                	mov    %ecx,%edx
 7f1:	89 c1                	mov    %eax,%ecx
 7f3:	39 d6                	cmp    %edx,%esi
 7f5:	76 df                	jbe    7d6 <printint+0x2e>
  if(neg)
 7f7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7fb:	74 31                	je     82e <printint+0x86>
    buf[i++] = '-';
 7fd:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 802:	8d 5f 02             	lea    0x2(%edi),%ebx
 805:	8b 75 d0             	mov    -0x30(%ebp),%esi
 808:	eb 17                	jmp    821 <printint+0x79>
    x = xx;
 80a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 80c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 813:	eb bc                	jmp    7d1 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 815:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 81a:	89 f0                	mov    %esi,%eax
 81c:	e8 6d ff ff ff       	call   78e <putc>
  while(--i >= 0)
 821:	83 eb 01             	sub    $0x1,%ebx
 824:	79 ef                	jns    815 <printint+0x6d>
}
 826:	83 c4 2c             	add    $0x2c,%esp
 829:	5b                   	pop    %ebx
 82a:	5e                   	pop    %esi
 82b:	5f                   	pop    %edi
 82c:	5d                   	pop    %ebp
 82d:	c3                   	ret    
 82e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 831:	eb ee                	jmp    821 <printint+0x79>

00000833 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 833:	55                   	push   %ebp
 834:	89 e5                	mov    %esp,%ebp
 836:	57                   	push   %edi
 837:	56                   	push   %esi
 838:	53                   	push   %ebx
 839:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 83c:	8d 45 10             	lea    0x10(%ebp),%eax
 83f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 842:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 847:	bb 00 00 00 00       	mov    $0x0,%ebx
 84c:	eb 14                	jmp    862 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 84e:	89 fa                	mov    %edi,%edx
 850:	8b 45 08             	mov    0x8(%ebp),%eax
 853:	e8 36 ff ff ff       	call   78e <putc>
 858:	eb 05                	jmp    85f <printf+0x2c>
      }
    } else if(state == '%'){
 85a:	83 fe 25             	cmp    $0x25,%esi
 85d:	74 25                	je     884 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 85f:	83 c3 01             	add    $0x1,%ebx
 862:	8b 45 0c             	mov    0xc(%ebp),%eax
 865:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 869:	84 c0                	test   %al,%al
 86b:	0f 84 20 01 00 00    	je     991 <printf+0x15e>
    c = fmt[i] & 0xff;
 871:	0f be f8             	movsbl %al,%edi
 874:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 877:	85 f6                	test   %esi,%esi
 879:	75 df                	jne    85a <printf+0x27>
      if(c == '%'){
 87b:	83 f8 25             	cmp    $0x25,%eax
 87e:	75 ce                	jne    84e <printf+0x1b>
        state = '%';
 880:	89 c6                	mov    %eax,%esi
 882:	eb db                	jmp    85f <printf+0x2c>
      if(c == 'd'){
 884:	83 f8 25             	cmp    $0x25,%eax
 887:	0f 84 cf 00 00 00    	je     95c <printf+0x129>
 88d:	0f 8c dd 00 00 00    	jl     970 <printf+0x13d>
 893:	83 f8 78             	cmp    $0x78,%eax
 896:	0f 8f d4 00 00 00    	jg     970 <printf+0x13d>
 89c:	83 f8 63             	cmp    $0x63,%eax
 89f:	0f 8c cb 00 00 00    	jl     970 <printf+0x13d>
 8a5:	83 e8 63             	sub    $0x63,%eax
 8a8:	83 f8 15             	cmp    $0x15,%eax
 8ab:	0f 87 bf 00 00 00    	ja     970 <printf+0x13d>
 8b1:	ff 24 85 e4 0b 00 00 	jmp    *0xbe4(,%eax,4)
        printint(fd, *ap, 10, 1);
 8b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8bb:	8b 17                	mov    (%edi),%edx
 8bd:	83 ec 0c             	sub    $0xc,%esp
 8c0:	6a 01                	push   $0x1
 8c2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8c7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ca:	e8 d9 fe ff ff       	call   7a8 <printint>
        ap++;
 8cf:	83 c7 04             	add    $0x4,%edi
 8d2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8d5:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8d8:	be 00 00 00 00       	mov    $0x0,%esi
 8dd:	eb 80                	jmp    85f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8df:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8e2:	8b 17                	mov    (%edi),%edx
 8e4:	83 ec 0c             	sub    $0xc,%esp
 8e7:	6a 00                	push   $0x0
 8e9:	b9 10 00 00 00       	mov    $0x10,%ecx
 8ee:	8b 45 08             	mov    0x8(%ebp),%eax
 8f1:	e8 b2 fe ff ff       	call   7a8 <printint>
        ap++;
 8f6:	83 c7 04             	add    $0x4,%edi
 8f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ff:	be 00 00 00 00       	mov    $0x0,%esi
 904:	e9 56 ff ff ff       	jmp    85f <printf+0x2c>
        s = (char*)*ap;
 909:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 90c:	8b 30                	mov    (%eax),%esi
        ap++;
 90e:	83 c0 04             	add    $0x4,%eax
 911:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 914:	85 f6                	test   %esi,%esi
 916:	75 15                	jne    92d <printf+0xfa>
          s = "(null)";
 918:	be dd 0b 00 00       	mov    $0xbdd,%esi
 91d:	eb 0e                	jmp    92d <printf+0xfa>
          putc(fd, *s);
 91f:	0f be d2             	movsbl %dl,%edx
 922:	8b 45 08             	mov    0x8(%ebp),%eax
 925:	e8 64 fe ff ff       	call   78e <putc>
          s++;
 92a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 92d:	0f b6 16             	movzbl (%esi),%edx
 930:	84 d2                	test   %dl,%dl
 932:	75 eb                	jne    91f <printf+0xec>
      state = 0;
 934:	be 00 00 00 00       	mov    $0x0,%esi
 939:	e9 21 ff ff ff       	jmp    85f <printf+0x2c>
        putc(fd, *ap);
 93e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 941:	0f be 17             	movsbl (%edi),%edx
 944:	8b 45 08             	mov    0x8(%ebp),%eax
 947:	e8 42 fe ff ff       	call   78e <putc>
        ap++;
 94c:	83 c7 04             	add    $0x4,%edi
 94f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 952:	be 00 00 00 00       	mov    $0x0,%esi
 957:	e9 03 ff ff ff       	jmp    85f <printf+0x2c>
        putc(fd, c);
 95c:	89 fa                	mov    %edi,%edx
 95e:	8b 45 08             	mov    0x8(%ebp),%eax
 961:	e8 28 fe ff ff       	call   78e <putc>
      state = 0;
 966:	be 00 00 00 00       	mov    $0x0,%esi
 96b:	e9 ef fe ff ff       	jmp    85f <printf+0x2c>
        putc(fd, '%');
 970:	ba 25 00 00 00       	mov    $0x25,%edx
 975:	8b 45 08             	mov    0x8(%ebp),%eax
 978:	e8 11 fe ff ff       	call   78e <putc>
        putc(fd, c);
 97d:	89 fa                	mov    %edi,%edx
 97f:	8b 45 08             	mov    0x8(%ebp),%eax
 982:	e8 07 fe ff ff       	call   78e <putc>
      state = 0;
 987:	be 00 00 00 00       	mov    $0x0,%esi
 98c:	e9 ce fe ff ff       	jmp    85f <printf+0x2c>
    }
  }
}
 991:	8d 65 f4             	lea    -0xc(%ebp),%esp
 994:	5b                   	pop    %ebx
 995:	5e                   	pop    %esi
 996:	5f                   	pop    %edi
 997:	5d                   	pop    %ebp
 998:	c3                   	ret    

00000999 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 999:	55                   	push   %ebp
 99a:	89 e5                	mov    %esp,%ebp
 99c:	57                   	push   %edi
 99d:	56                   	push   %esi
 99e:	53                   	push   %ebx
 99f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9a2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a5:	a1 f0 0f 00 00       	mov    0xff0,%eax
 9aa:	eb 02                	jmp    9ae <free+0x15>
 9ac:	89 d0                	mov    %edx,%eax
 9ae:	39 c8                	cmp    %ecx,%eax
 9b0:	73 04                	jae    9b6 <free+0x1d>
 9b2:	39 08                	cmp    %ecx,(%eax)
 9b4:	77 12                	ja     9c8 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b6:	8b 10                	mov    (%eax),%edx
 9b8:	39 c2                	cmp    %eax,%edx
 9ba:	77 f0                	ja     9ac <free+0x13>
 9bc:	39 c8                	cmp    %ecx,%eax
 9be:	72 08                	jb     9c8 <free+0x2f>
 9c0:	39 ca                	cmp    %ecx,%edx
 9c2:	77 04                	ja     9c8 <free+0x2f>
 9c4:	89 d0                	mov    %edx,%eax
 9c6:	eb e6                	jmp    9ae <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ce:	8b 10                	mov    (%eax),%edx
 9d0:	39 d7                	cmp    %edx,%edi
 9d2:	74 19                	je     9ed <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9d4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9d7:	8b 50 04             	mov    0x4(%eax),%edx
 9da:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9dd:	39 ce                	cmp    %ecx,%esi
 9df:	74 1b                	je     9fc <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9e1:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9e3:	a3 f0 0f 00 00       	mov    %eax,0xff0
}
 9e8:	5b                   	pop    %ebx
 9e9:	5e                   	pop    %esi
 9ea:	5f                   	pop    %edi
 9eb:	5d                   	pop    %ebp
 9ec:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9ed:	03 72 04             	add    0x4(%edx),%esi
 9f0:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9f3:	8b 10                	mov    (%eax),%edx
 9f5:	8b 12                	mov    (%edx),%edx
 9f7:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9fa:	eb db                	jmp    9d7 <free+0x3e>
    p->s.size += bp->s.size;
 9fc:	03 53 fc             	add    -0x4(%ebx),%edx
 9ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a02:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a05:	89 10                	mov    %edx,(%eax)
 a07:	eb da                	jmp    9e3 <free+0x4a>

00000a09 <morecore>:

static Header*
morecore(uint nu)
{
 a09:	55                   	push   %ebp
 a0a:	89 e5                	mov    %esp,%ebp
 a0c:	53                   	push   %ebx
 a0d:	83 ec 04             	sub    $0x4,%esp
 a10:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a12:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a17:	77 05                	ja     a1e <morecore+0x15>
    nu = 4096;
 a19:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a1e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a25:	83 ec 0c             	sub    $0xc,%esp
 a28:	50                   	push   %eax
 a29:	e8 38 fd ff ff       	call   766 <sbrk>
  if(p == (char*)-1)
 a2e:	83 c4 10             	add    $0x10,%esp
 a31:	83 f8 ff             	cmp    $0xffffffff,%eax
 a34:	74 1c                	je     a52 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a36:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a39:	83 c0 08             	add    $0x8,%eax
 a3c:	83 ec 0c             	sub    $0xc,%esp
 a3f:	50                   	push   %eax
 a40:	e8 54 ff ff ff       	call   999 <free>
  return freep;
 a45:	a1 f0 0f 00 00       	mov    0xff0,%eax
 a4a:	83 c4 10             	add    $0x10,%esp
}
 a4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a50:	c9                   	leave  
 a51:	c3                   	ret    
    return 0;
 a52:	b8 00 00 00 00       	mov    $0x0,%eax
 a57:	eb f4                	jmp    a4d <morecore+0x44>

00000a59 <malloc>:

void*
malloc(uint nbytes)
{
 a59:	55                   	push   %ebp
 a5a:	89 e5                	mov    %esp,%ebp
 a5c:	53                   	push   %ebx
 a5d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a60:	8b 45 08             	mov    0x8(%ebp),%eax
 a63:	8d 58 07             	lea    0x7(%eax),%ebx
 a66:	c1 eb 03             	shr    $0x3,%ebx
 a69:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a6c:	8b 0d f0 0f 00 00    	mov    0xff0,%ecx
 a72:	85 c9                	test   %ecx,%ecx
 a74:	74 04                	je     a7a <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a76:	8b 01                	mov    (%ecx),%eax
 a78:	eb 4a                	jmp    ac4 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a7a:	c7 05 f0 0f 00 00 f4 	movl   $0xff4,0xff0
 a81:	0f 00 00 
 a84:	c7 05 f4 0f 00 00 f4 	movl   $0xff4,0xff4
 a8b:	0f 00 00 
    base.s.size = 0;
 a8e:	c7 05 f8 0f 00 00 00 	movl   $0x0,0xff8
 a95:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a98:	b9 f4 0f 00 00       	mov    $0xff4,%ecx
 a9d:	eb d7                	jmp    a76 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a9f:	74 19                	je     aba <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 aa1:	29 da                	sub    %ebx,%edx
 aa3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aa6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 aa9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 aac:	89 0d f0 0f 00 00    	mov    %ecx,0xff0
      return (void*)(p + 1);
 ab2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ab5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ab8:	c9                   	leave  
 ab9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 aba:	8b 10                	mov    (%eax),%edx
 abc:	89 11                	mov    %edx,(%ecx)
 abe:	eb ec                	jmp    aac <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac0:	89 c1                	mov    %eax,%ecx
 ac2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 ac4:	8b 50 04             	mov    0x4(%eax),%edx
 ac7:	39 da                	cmp    %ebx,%edx
 ac9:	73 d4                	jae    a9f <malloc+0x46>
    if(p == freep)
 acb:	39 05 f0 0f 00 00    	cmp    %eax,0xff0
 ad1:	75 ed                	jne    ac0 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ad3:	89 d8                	mov    %ebx,%eax
 ad5:	e8 2f ff ff ff       	call   a09 <morecore>
 ada:	85 c0                	test   %eax,%eax
 adc:	75 e2                	jne    ac0 <malloc+0x67>
 ade:	eb d5                	jmp    ab5 <malloc+0x5c>
