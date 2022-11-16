
_test_5:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 24 0e 00 00       	mov    0xe24,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 84 09 00 00       	push   $0x984
  31:	68 8d 09 00 00       	push   $0x98d
  36:	6a 01                	push   $0x1
  38:	e8 9a 06 00 00       	call   6d7 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 cc 09 00 00       	push   $0x9cc
  45:	68 a0 09 00 00       	push   $0x9a0
  4a:	6a 01                	push   $0x1
  4c:	e8 86 06 00 00       	call   6d7 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 b4 09 00 00       	push   $0x9b4
  59:	6a 01                	push   $0x1
  5b:	e8 77 06 00 00       	call   6d7 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 28 0e 00 00    	push   0xe28
  69:	e8 44 05 00 00       	call   5b2 <kill>
  6e:	e8 0f 05 00 00       	call   582 <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 84 09 00 00       	push   $0x984
  7a:	68 8d 09 00 00       	push   $0x98d
  7f:	6a 01                	push   $0x1
  81:	e8 51 06 00 00       	call   6d7 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 95 09 00 00       	push   $0x995
  8e:	68 a0 09 00 00       	push   $0x9a0
  93:	6a 01                	push   $0x1
  95:	e8 3d 06 00 00       	call   6d7 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 b4 09 00 00       	push   $0x9b4
  a2:	6a 01                	push   $0x1
  a4:	e8 2e 06 00 00       	call   6d7 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 28 0e 00 00    	push   0xe28
  b2:	e8 fb 04 00 00       	call   5b2 <kill>
  b7:	e8 c6 04 00 00       	call   582 <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 84 09 00 00       	push   $0x984
  c3:	68 8d 09 00 00       	push   $0x98d
  c8:	6a 01                	push   $0x1
  ca:	e8 08 06 00 00       	call   6d7 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 c1 09 00 00       	push   $0x9c1
  d7:	68 a0 09 00 00       	push   $0x9a0
  dc:	6a 01                	push   $0x1
  de:	e8 f4 05 00 00       	call   6d7 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 b4 09 00 00       	push   $0x9b4
  eb:	6a 01                	push   $0x1
  ed:	e8 e5 05 00 00       	call   6d7 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 28 0e 00 00    	push   0xe28
  fb:	e8 b2 04 00 00       	call   5b2 <kill>
 100:	e8 7d 04 00 00       	call   582 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 24 0e 00 00       	mov    %eax,0xe24
   exit();
 10d:	e8 70 04 00 00       	call   582 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 d7 04 00 00       	call   602 <getpid>
 12b:	a3 28 0e 00 00       	mov    %eax,0xe28
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 c0 07 00 00       	call   8fd <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 84 09 00 00       	push   $0x984
 15f:	68 8d 09 00 00       	push   $0x98d
 164:	6a 01                	push   $0x1
 166:	e8 6c 05 00 00       	call   6d7 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 d8 09 00 00       	push   $0x9d8
 173:	68 a0 09 00 00       	push   $0x9a0
 178:	6a 01                	push   $0x1
 17a:	e8 58 05 00 00       	call   6d7 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 b4 09 00 00       	push   $0x9b4
 187:	6a 01                	push   $0x1
 189:	e8 49 05 00 00       	call   6d7 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 28 0e 00 00    	push   0xe28
 197:	e8 16 04 00 00       	call   5b2 <kill>
 19c:	e8 e1 03 00 00       	call   582 <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 5e 04 00 00       	call   622 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 51 04 00 00       	call   62a <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 84 09 00 00       	push   $0x984
 1f4:	68 8d 09 00 00       	push   $0x98d
 1f9:	6a 01                	push   $0x1
 1fb:	e8 d7 04 00 00       	call   6d7 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 06 0a 00 00       	push   $0xa06
 208:	68 a0 09 00 00       	push   $0x9a0
 20d:	6a 01                	push   $0x1
 20f:	e8 c3 04 00 00       	call   6d7 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 b4 09 00 00       	push   $0x9b4
 21c:	6a 01                	push   $0x1
 21e:	e8 b4 04 00 00       	call   6d7 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 28 0e 00 00    	push   0xe28
 22c:	e8 81 03 00 00       	call   5b2 <kill>
 231:	e8 4c 03 00 00       	call   582 <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 84 09 00 00       	push   $0x984
 23d:	68 8d 09 00 00       	push   $0x98d
 242:	6a 01                	push   $0x1
 244:	e8 8e 04 00 00       	call   6d7 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 e2 09 00 00       	push   $0x9e2
 251:	68 a0 09 00 00       	push   $0x9a0
 256:	6a 01                	push   $0x1
 258:	e8 7a 04 00 00       	call   6d7 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 b4 09 00 00       	push   $0x9b4
 265:	6a 01                	push   $0x1
 267:	e8 6b 04 00 00       	call   6d7 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 28 0e 00 00    	push   0xe28
 275:	e8 38 03 00 00       	call   5b2 <kill>
 27a:	e8 03 03 00 00       	call   582 <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 84 09 00 00       	push   $0x984
 286:	68 8d 09 00 00       	push   $0x98d
 28b:	6a 01                	push   $0x1
 28d:	e8 45 04 00 00       	call   6d7 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 f0 09 00 00       	push   $0x9f0
 29a:	68 a0 09 00 00       	push   $0x9a0
 29f:	6a 01                	push   $0x1
 2a1:	e8 31 04 00 00       	call   6d7 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 b4 09 00 00       	push   $0x9b4
 2ae:	6a 01                	push   $0x1
 2b0:	e8 22 04 00 00       	call   6d7 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 28 0e 00 00    	push   0xe28
 2be:	e8 ef 02 00 00       	call   5b2 <kill>
 2c3:	e8 ba 02 00 00       	call   582 <exit>
   assert(global == 2);
 2c8:	83 3d 24 0e 00 00 02 	cmpl   $0x2,0xe24
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 84 09 00 00       	push   $0x984
 2d8:	68 8d 09 00 00       	push   $0x98d
 2dd:	6a 01                	push   $0x1
 2df:	e8 f3 03 00 00       	call   6d7 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 1a 0a 00 00       	push   $0xa1a
 2ec:	68 a0 09 00 00       	push   $0x9a0
 2f1:	6a 01                	push   $0x1
 2f3:	e8 df 03 00 00       	call   6d7 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 b4 09 00 00       	push   $0x9b4
 300:	6a 01                	push   $0x1
 302:	e8 d0 03 00 00       	call   6d7 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 28 0e 00 00    	push   0xe28
 310:	e8 9d 02 00 00       	call   5b2 <kill>
 315:	e8 68 02 00 00       	call   582 <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 26 0a 00 00       	push   $0xa26
 322:	6a 01                	push   $0x1
 324:	e8 ae 03 00 00       	call   6d7 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 0c 05 00 00       	call   83d <free>
   exit();
 331:	e8 4c 02 00 00       	call   582 <exit>

00000336 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	56                   	push   %esi
 33a:	53                   	push   %ebx
 33b:	8b 75 08             	mov    0x8(%ebp),%esi
 33e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	89 f0                	mov    %esi,%eax
 343:	89 d1                	mov    %edx,%ecx
 345:	83 c2 01             	add    $0x1,%edx
 348:	89 c3                	mov    %eax,%ebx
 34a:	83 c0 01             	add    $0x1,%eax
 34d:	0f b6 09             	movzbl (%ecx),%ecx
 350:	88 0b                	mov    %cl,(%ebx)
 352:	84 c9                	test   %cl,%cl
 354:	75 ed                	jne    343 <strcpy+0xd>
    ;
  return os;
}
 356:	89 f0                	mov    %esi,%eax
 358:	5b                   	pop    %ebx
 359:	5e                   	pop    %esi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 362:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 365:	eb 06                	jmp    36d <strcmp+0x11>
    p++, q++;
 367:	83 c1 01             	add    $0x1,%ecx
 36a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 36d:	0f b6 01             	movzbl (%ecx),%eax
 370:	84 c0                	test   %al,%al
 372:	74 04                	je     378 <strcmp+0x1c>
 374:	3a 02                	cmp    (%edx),%al
 376:	74 ef                	je     367 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 378:	0f b6 c0             	movzbl %al,%eax
 37b:	0f b6 12             	movzbl (%edx),%edx
 37e:	29 d0                	sub    %edx,%eax
}
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    

00000382 <strlen>:

uint
strlen(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 388:	b8 00 00 00 00       	mov    $0x0,%eax
 38d:	eb 03                	jmp    392 <strlen+0x10>
 38f:	83 c0 01             	add    $0x1,%eax
 392:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 396:	75 f7                	jne    38f <strlen+0xd>
    ;
  return n;
}
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <memset>:

void*
memset(void *dst, int c, uint n)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	57                   	push   %edi
 39e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a1:	89 d7                	mov    %edx,%edi
 3a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	fc                   	cld    
 3aa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ac:	89 d0                	mov    %edx,%eax
 3ae:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3b1:	c9                   	leave  
 3b2:	c3                   	ret    

000003b3 <strchr>:

char*
strchr(const char *s, char c)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3bd:	eb 03                	jmp    3c2 <strchr+0xf>
 3bf:	83 c0 01             	add    $0x1,%eax
 3c2:	0f b6 10             	movzbl (%eax),%edx
 3c5:	84 d2                	test   %dl,%dl
 3c7:	74 06                	je     3cf <strchr+0x1c>
    if(*s == c)
 3c9:	38 ca                	cmp    %cl,%dl
 3cb:	75 f2                	jne    3bf <strchr+0xc>
 3cd:	eb 05                	jmp    3d4 <strchr+0x21>
      return (char*)s;
  return 0;
 3cf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    

000003d6 <gets>:

char*
gets(char *buf, int max)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	57                   	push   %edi
 3da:	56                   	push   %esi
 3db:	53                   	push   %ebx
 3dc:	83 ec 1c             	sub    $0x1c,%esp
 3df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e7:	89 de                	mov    %ebx,%esi
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ef:	7d 2e                	jge    41f <gets+0x49>
    cc = read(0, &c, 1);
 3f1:	83 ec 04             	sub    $0x4,%esp
 3f4:	6a 01                	push   $0x1
 3f6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f9:	50                   	push   %eax
 3fa:	6a 00                	push   $0x0
 3fc:	e8 99 01 00 00       	call   59a <read>
    if(cc < 1)
 401:	83 c4 10             	add    $0x10,%esp
 404:	85 c0                	test   %eax,%eax
 406:	7e 17                	jle    41f <gets+0x49>
      break;
    buf[i++] = c;
 408:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 40c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 40f:	3c 0a                	cmp    $0xa,%al
 411:	0f 94 c2             	sete   %dl
 414:	3c 0d                	cmp    $0xd,%al
 416:	0f 94 c0             	sete   %al
 419:	08 c2                	or     %al,%dl
 41b:	74 ca                	je     3e7 <gets+0x11>
    buf[i++] = c;
 41d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 41f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 423:	89 f8                	mov    %edi,%eax
 425:	8d 65 f4             	lea    -0xc(%ebp),%esp
 428:	5b                   	pop    %ebx
 429:	5e                   	pop    %esi
 42a:	5f                   	pop    %edi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    

0000042d <stat>:

int
stat(const char *n, struct stat *st)
{
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	56                   	push   %esi
 431:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 432:	83 ec 08             	sub    $0x8,%esp
 435:	6a 00                	push   $0x0
 437:	ff 75 08             	push   0x8(%ebp)
 43a:	e8 83 01 00 00       	call   5c2 <open>
  if(fd < 0)
 43f:	83 c4 10             	add    $0x10,%esp
 442:	85 c0                	test   %eax,%eax
 444:	78 24                	js     46a <stat+0x3d>
 446:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	ff 75 0c             	push   0xc(%ebp)
 44e:	50                   	push   %eax
 44f:	e8 86 01 00 00       	call   5da <fstat>
 454:	89 c6                	mov    %eax,%esi
  close(fd);
 456:	89 1c 24             	mov    %ebx,(%esp)
 459:	e8 4c 01 00 00       	call   5aa <close>
  return r;
 45e:	83 c4 10             	add    $0x10,%esp
}
 461:	89 f0                	mov    %esi,%eax
 463:	8d 65 f8             	lea    -0x8(%ebp),%esp
 466:	5b                   	pop    %ebx
 467:	5e                   	pop    %esi
 468:	5d                   	pop    %ebp
 469:	c3                   	ret    
    return -1;
 46a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46f:	eb f0                	jmp    461 <stat+0x34>

00000471 <atoi>:

int
atoi(const char *s)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	53                   	push   %ebx
 475:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 478:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 47d:	eb 10                	jmp    48f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 47f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 482:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 485:	83 c1 01             	add    $0x1,%ecx
 488:	0f be c0             	movsbl %al,%eax
 48b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 48f:	0f b6 01             	movzbl (%ecx),%eax
 492:	8d 58 d0             	lea    -0x30(%eax),%ebx
 495:	80 fb 09             	cmp    $0x9,%bl
 498:	76 e5                	jbe    47f <atoi+0xe>
  return n;
}
 49a:	89 d0                	mov    %edx,%eax
 49c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49f:	c9                   	leave  
 4a0:	c3                   	ret    

000004a1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	8b 75 08             	mov    0x8(%ebp),%esi
 4a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ac:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4af:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4b1:	eb 0d                	jmp    4c0 <memmove+0x1f>
    *dst++ = *src++;
 4b3:	0f b6 01             	movzbl (%ecx),%eax
 4b6:	88 02                	mov    %al,(%edx)
 4b8:	8d 49 01             	lea    0x1(%ecx),%ecx
 4bb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4be:	89 d8                	mov    %ebx,%eax
 4c0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4c3:	85 c0                	test   %eax,%eax
 4c5:	7f ec                	jg     4b3 <memmove+0x12>
  return vdst;
}
 4c7:	89 f0                	mov    %esi,%eax
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    

000004cd <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 4cd:	55                   	push   %ebp
 4ce:	89 e5                	mov    %esp,%ebp
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 4d3:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 4d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d8:	89 08                	mov    %ecx,(%eax)
  return old;
}
 4da:	89 d0                	mov    %edx,%eax
 4dc:	5d                   	pop    %ebp
 4dd:	c3                   	ret    

000004de <lock_init>:
void 
lock_init(lock_t *lock){
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret    

000004ec <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 4ec:	55                   	push   %ebp
 4ed:	89 e5                	mov    %esp,%ebp
 4ef:	53                   	push   %ebx
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 4f6:	83 ec 08             	sub    $0x8,%esp
 4f9:	6a 01                	push   $0x1
 4fb:	53                   	push   %ebx
 4fc:	e8 cc ff ff ff       	call   4cd <TestAndSet>
 501:	83 c4 10             	add    $0x10,%esp
 504:	83 f8 01             	cmp    $0x1,%eax
 507:	74 ed                	je     4f6 <lock_acquire+0xa>
    ;
}
 509:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50c:	c9                   	leave  
 50d:	c3                   	ret    

0000050e <lock_release>:
void 
lock_release(lock_t *lock){
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 51a:	5d                   	pop    %ebp
 51b:	c3                   	ret    

0000051c <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 51c:	55                   	push   %ebp
 51d:	89 e5                	mov    %esp,%ebp
 51f:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 522:	68 04 20 00 00       	push   $0x2004
 527:	e8 d1 03 00 00       	call   8fd <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 52c:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 52f:	83 c4 10             	add    $0x10,%esp
 532:	eb 03                	jmp    537 <thread_create+0x1b>
      stack += 1;
 534:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 537:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 53d:	75 f5                	jne    534 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 53f:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 542:	52                   	push   %edx
 543:	ff 75 10             	push   0x10(%ebp)
 546:	ff 75 0c             	push   0xc(%ebp)
 549:	ff 75 08             	push   0x8(%ebp)
 54c:	e8 d1 00 00 00       	call   622 <clone>
 
    return pid;
}
 551:	c9                   	leave  
 552:	c3                   	ret    

00000553 <thread_join>:
int 
thread_join(){
 553:	55                   	push   %ebp
 554:	89 e5                	mov    %esp,%ebp
 556:	53                   	push   %ebx
 557:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 55a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 55d:	50                   	push   %eax
 55e:	e8 c7 00 00 00       	call   62a <join>
 563:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 565:	83 c4 04             	add    $0x4,%esp
 568:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56b:	ff 70 fc             	push   -0x4(%eax)
 56e:	e8 ca 02 00 00       	call   83d <free>
  return pid;
 573:	89 d8                	mov    %ebx,%eax
 575:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 578:	c9                   	leave  
 579:	c3                   	ret    

0000057a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57a:	b8 01 00 00 00       	mov    $0x1,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <exit>:
SYSCALL(exit)
 582:	b8 02 00 00 00       	mov    $0x2,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <wait>:
SYSCALL(wait)
 58a:	b8 03 00 00 00       	mov    $0x3,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <pipe>:
SYSCALL(pipe)
 592:	b8 04 00 00 00       	mov    $0x4,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <read>:
SYSCALL(read)
 59a:	b8 05 00 00 00       	mov    $0x5,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <write>:
SYSCALL(write)
 5a2:	b8 10 00 00 00       	mov    $0x10,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <close>:
SYSCALL(close)
 5aa:	b8 15 00 00 00       	mov    $0x15,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <kill>:
SYSCALL(kill)
 5b2:	b8 06 00 00 00       	mov    $0x6,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <exec>:
SYSCALL(exec)
 5ba:	b8 07 00 00 00       	mov    $0x7,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <open>:
SYSCALL(open)
 5c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <mknod>:
SYSCALL(mknod)
 5ca:	b8 11 00 00 00       	mov    $0x11,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <unlink>:
SYSCALL(unlink)
 5d2:	b8 12 00 00 00       	mov    $0x12,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <fstat>:
SYSCALL(fstat)
 5da:	b8 08 00 00 00       	mov    $0x8,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <link>:
SYSCALL(link)
 5e2:	b8 13 00 00 00       	mov    $0x13,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <mkdir>:
SYSCALL(mkdir)
 5ea:	b8 14 00 00 00       	mov    $0x14,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <chdir>:
SYSCALL(chdir)
 5f2:	b8 09 00 00 00       	mov    $0x9,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <dup>:
SYSCALL(dup)
 5fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <getpid>:
SYSCALL(getpid)
 602:	b8 0b 00 00 00       	mov    $0xb,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <sbrk>:
SYSCALL(sbrk)
 60a:	b8 0c 00 00 00       	mov    $0xc,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <sleep>:
SYSCALL(sleep)
 612:	b8 0d 00 00 00       	mov    $0xd,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <uptime>:
SYSCALL(uptime)
 61a:	b8 0e 00 00 00       	mov    $0xe,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <clone>:
SYSCALL(clone)
 622:	b8 16 00 00 00       	mov    $0x16,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <join>:
SYSCALL(join)
 62a:	b8 17 00 00 00       	mov    $0x17,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	83 ec 1c             	sub    $0x1c,%esp
 638:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 63b:	6a 01                	push   $0x1
 63d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 640:	52                   	push   %edx
 641:	50                   	push   %eax
 642:	e8 5b ff ff ff       	call   5a2 <write>
}
 647:	83 c4 10             	add    $0x10,%esp
 64a:	c9                   	leave  
 64b:	c3                   	ret    

0000064c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 64c:	55                   	push   %ebp
 64d:	89 e5                	mov    %esp,%ebp
 64f:	57                   	push   %edi
 650:	56                   	push   %esi
 651:	53                   	push   %ebx
 652:	83 ec 2c             	sub    $0x2c,%esp
 655:	89 45 d0             	mov    %eax,-0x30(%ebp)
 658:	89 d0                	mov    %edx,%eax
 65a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 65c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 660:	0f 95 c1             	setne  %cl
 663:	c1 ea 1f             	shr    $0x1f,%edx
 666:	84 d1                	test   %dl,%cl
 668:	74 44                	je     6ae <printint+0x62>
    neg = 1;
    x = -xx;
 66a:	f7 d8                	neg    %eax
 66c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 66e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 675:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 67a:	89 c8                	mov    %ecx,%eax
 67c:	ba 00 00 00 00       	mov    $0x0,%edx
 681:	f7 f6                	div    %esi
 683:	89 df                	mov    %ebx,%edi
 685:	83 c3 01             	add    $0x1,%ebx
 688:	0f b6 92 94 0a 00 00 	movzbl 0xa94(%edx),%edx
 68f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 693:	89 ca                	mov    %ecx,%edx
 695:	89 c1                	mov    %eax,%ecx
 697:	39 d6                	cmp    %edx,%esi
 699:	76 df                	jbe    67a <printint+0x2e>
  if(neg)
 69b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 69f:	74 31                	je     6d2 <printint+0x86>
    buf[i++] = '-';
 6a1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6a6:	8d 5f 02             	lea    0x2(%edi),%ebx
 6a9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ac:	eb 17                	jmp    6c5 <printint+0x79>
    x = xx;
 6ae:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6b7:	eb bc                	jmp    675 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6b9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6be:	89 f0                	mov    %esi,%eax
 6c0:	e8 6d ff ff ff       	call   632 <putc>
  while(--i >= 0)
 6c5:	83 eb 01             	sub    $0x1,%ebx
 6c8:	79 ef                	jns    6b9 <printint+0x6d>
}
 6ca:	83 c4 2c             	add    $0x2c,%esp
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
 6d2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6d5:	eb ee                	jmp    6c5 <printint+0x79>

000006d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d7:	55                   	push   %ebp
 6d8:	89 e5                	mov    %esp,%ebp
 6da:	57                   	push   %edi
 6db:	56                   	push   %esi
 6dc:	53                   	push   %ebx
 6dd:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e0:	8d 45 10             	lea    0x10(%ebp),%eax
 6e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6e6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6eb:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f0:	eb 14                	jmp    706 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6f2:	89 fa                	mov    %edi,%edx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	e8 36 ff ff ff       	call   632 <putc>
 6fc:	eb 05                	jmp    703 <printf+0x2c>
      }
    } else if(state == '%'){
 6fe:	83 fe 25             	cmp    $0x25,%esi
 701:	74 25                	je     728 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 703:	83 c3 01             	add    $0x1,%ebx
 706:	8b 45 0c             	mov    0xc(%ebp),%eax
 709:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 70d:	84 c0                	test   %al,%al
 70f:	0f 84 20 01 00 00    	je     835 <printf+0x15e>
    c = fmt[i] & 0xff;
 715:	0f be f8             	movsbl %al,%edi
 718:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 71b:	85 f6                	test   %esi,%esi
 71d:	75 df                	jne    6fe <printf+0x27>
      if(c == '%'){
 71f:	83 f8 25             	cmp    $0x25,%eax
 722:	75 ce                	jne    6f2 <printf+0x1b>
        state = '%';
 724:	89 c6                	mov    %eax,%esi
 726:	eb db                	jmp    703 <printf+0x2c>
      if(c == 'd'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	0f 84 cf 00 00 00    	je     800 <printf+0x129>
 731:	0f 8c dd 00 00 00    	jl     814 <printf+0x13d>
 737:	83 f8 78             	cmp    $0x78,%eax
 73a:	0f 8f d4 00 00 00    	jg     814 <printf+0x13d>
 740:	83 f8 63             	cmp    $0x63,%eax
 743:	0f 8c cb 00 00 00    	jl     814 <printf+0x13d>
 749:	83 e8 63             	sub    $0x63,%eax
 74c:	83 f8 15             	cmp    $0x15,%eax
 74f:	0f 87 bf 00 00 00    	ja     814 <printf+0x13d>
 755:	ff 24 85 3c 0a 00 00 	jmp    *0xa3c(,%eax,4)
        printint(fd, *ap, 10, 1);
 75c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 75f:	8b 17                	mov    (%edi),%edx
 761:	83 ec 0c             	sub    $0xc,%esp
 764:	6a 01                	push   $0x1
 766:	b9 0a 00 00 00       	mov    $0xa,%ecx
 76b:	8b 45 08             	mov    0x8(%ebp),%eax
 76e:	e8 d9 fe ff ff       	call   64c <printint>
        ap++;
 773:	83 c7 04             	add    $0x4,%edi
 776:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 779:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 77c:	be 00 00 00 00       	mov    $0x0,%esi
 781:	eb 80                	jmp    703 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 783:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 786:	8b 17                	mov    (%edi),%edx
 788:	83 ec 0c             	sub    $0xc,%esp
 78b:	6a 00                	push   $0x0
 78d:	b9 10 00 00 00       	mov    $0x10,%ecx
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	e8 b2 fe ff ff       	call   64c <printint>
        ap++;
 79a:	83 c7 04             	add    $0x4,%edi
 79d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7a0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a3:	be 00 00 00 00       	mov    $0x0,%esi
 7a8:	e9 56 ff ff ff       	jmp    703 <printf+0x2c>
        s = (char*)*ap;
 7ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b0:	8b 30                	mov    (%eax),%esi
        ap++;
 7b2:	83 c0 04             	add    $0x4,%eax
 7b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7b8:	85 f6                	test   %esi,%esi
 7ba:	75 15                	jne    7d1 <printf+0xfa>
          s = "(null)";
 7bc:	be 33 0a 00 00       	mov    $0xa33,%esi
 7c1:	eb 0e                	jmp    7d1 <printf+0xfa>
          putc(fd, *s);
 7c3:	0f be d2             	movsbl %dl,%edx
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	e8 64 fe ff ff       	call   632 <putc>
          s++;
 7ce:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7d1:	0f b6 16             	movzbl (%esi),%edx
 7d4:	84 d2                	test   %dl,%dl
 7d6:	75 eb                	jne    7c3 <printf+0xec>
      state = 0;
 7d8:	be 00 00 00 00       	mov    $0x0,%esi
 7dd:	e9 21 ff ff ff       	jmp    703 <printf+0x2c>
        putc(fd, *ap);
 7e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e5:	0f be 17             	movsbl (%edi),%edx
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	e8 42 fe ff ff       	call   632 <putc>
        ap++;
 7f0:	83 c7 04             	add    $0x4,%edi
 7f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7f6:	be 00 00 00 00       	mov    $0x0,%esi
 7fb:	e9 03 ff ff ff       	jmp    703 <printf+0x2c>
        putc(fd, c);
 800:	89 fa                	mov    %edi,%edx
 802:	8b 45 08             	mov    0x8(%ebp),%eax
 805:	e8 28 fe ff ff       	call   632 <putc>
      state = 0;
 80a:	be 00 00 00 00       	mov    $0x0,%esi
 80f:	e9 ef fe ff ff       	jmp    703 <printf+0x2c>
        putc(fd, '%');
 814:	ba 25 00 00 00       	mov    $0x25,%edx
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	e8 11 fe ff ff       	call   632 <putc>
        putc(fd, c);
 821:	89 fa                	mov    %edi,%edx
 823:	8b 45 08             	mov    0x8(%ebp),%eax
 826:	e8 07 fe ff ff       	call   632 <putc>
      state = 0;
 82b:	be 00 00 00 00       	mov    $0x0,%esi
 830:	e9 ce fe ff ff       	jmp    703 <printf+0x2c>
    }
  }
}
 835:	8d 65 f4             	lea    -0xc(%ebp),%esp
 838:	5b                   	pop    %ebx
 839:	5e                   	pop    %esi
 83a:	5f                   	pop    %edi
 83b:	5d                   	pop    %ebp
 83c:	c3                   	ret    

0000083d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 83d:	55                   	push   %ebp
 83e:	89 e5                	mov    %esp,%ebp
 840:	57                   	push   %edi
 841:	56                   	push   %esi
 842:	53                   	push   %ebx
 843:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 846:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 849:	a1 2c 0e 00 00       	mov    0xe2c,%eax
 84e:	eb 02                	jmp    852 <free+0x15>
 850:	89 d0                	mov    %edx,%eax
 852:	39 c8                	cmp    %ecx,%eax
 854:	73 04                	jae    85a <free+0x1d>
 856:	39 08                	cmp    %ecx,(%eax)
 858:	77 12                	ja     86c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 85a:	8b 10                	mov    (%eax),%edx
 85c:	39 c2                	cmp    %eax,%edx
 85e:	77 f0                	ja     850 <free+0x13>
 860:	39 c8                	cmp    %ecx,%eax
 862:	72 08                	jb     86c <free+0x2f>
 864:	39 ca                	cmp    %ecx,%edx
 866:	77 04                	ja     86c <free+0x2f>
 868:	89 d0                	mov    %edx,%eax
 86a:	eb e6                	jmp    852 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 86c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 872:	8b 10                	mov    (%eax),%edx
 874:	39 d7                	cmp    %edx,%edi
 876:	74 19                	je     891 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 878:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 87b:	8b 50 04             	mov    0x4(%eax),%edx
 87e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 881:	39 ce                	cmp    %ecx,%esi
 883:	74 1b                	je     8a0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 885:	89 08                	mov    %ecx,(%eax)
  freep = p;
 887:	a3 2c 0e 00 00       	mov    %eax,0xe2c
}
 88c:	5b                   	pop    %ebx
 88d:	5e                   	pop    %esi
 88e:	5f                   	pop    %edi
 88f:	5d                   	pop    %ebp
 890:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 891:	03 72 04             	add    0x4(%edx),%esi
 894:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 897:	8b 10                	mov    (%eax),%edx
 899:	8b 12                	mov    (%edx),%edx
 89b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 89e:	eb db                	jmp    87b <free+0x3e>
    p->s.size += bp->s.size;
 8a0:	03 53 fc             	add    -0x4(%ebx),%edx
 8a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a9:	89 10                	mov    %edx,(%eax)
 8ab:	eb da                	jmp    887 <free+0x4a>

000008ad <morecore>:

static Header*
morecore(uint nu)
{
 8ad:	55                   	push   %ebp
 8ae:	89 e5                	mov    %esp,%ebp
 8b0:	53                   	push   %ebx
 8b1:	83 ec 04             	sub    $0x4,%esp
 8b4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8b6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8bb:	77 05                	ja     8c2 <morecore+0x15>
    nu = 4096;
 8bd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8c2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8c9:	83 ec 0c             	sub    $0xc,%esp
 8cc:	50                   	push   %eax
 8cd:	e8 38 fd ff ff       	call   60a <sbrk>
  if(p == (char*)-1)
 8d2:	83 c4 10             	add    $0x10,%esp
 8d5:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d8:	74 1c                	je     8f6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8da:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8dd:	83 c0 08             	add    $0x8,%eax
 8e0:	83 ec 0c             	sub    $0xc,%esp
 8e3:	50                   	push   %eax
 8e4:	e8 54 ff ff ff       	call   83d <free>
  return freep;
 8e9:	a1 2c 0e 00 00       	mov    0xe2c,%eax
 8ee:	83 c4 10             	add    $0x10,%esp
}
 8f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f4:	c9                   	leave  
 8f5:	c3                   	ret    
    return 0;
 8f6:	b8 00 00 00 00       	mov    $0x0,%eax
 8fb:	eb f4                	jmp    8f1 <morecore+0x44>

000008fd <malloc>:

void*
malloc(uint nbytes)
{
 8fd:	55                   	push   %ebp
 8fe:	89 e5                	mov    %esp,%ebp
 900:	53                   	push   %ebx
 901:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 904:	8b 45 08             	mov    0x8(%ebp),%eax
 907:	8d 58 07             	lea    0x7(%eax),%ebx
 90a:	c1 eb 03             	shr    $0x3,%ebx
 90d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 910:	8b 0d 2c 0e 00 00    	mov    0xe2c,%ecx
 916:	85 c9                	test   %ecx,%ecx
 918:	74 04                	je     91e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91a:	8b 01                	mov    (%ecx),%eax
 91c:	eb 4a                	jmp    968 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 91e:	c7 05 2c 0e 00 00 30 	movl   $0xe30,0xe2c
 925:	0e 00 00 
 928:	c7 05 30 0e 00 00 30 	movl   $0xe30,0xe30
 92f:	0e 00 00 
    base.s.size = 0;
 932:	c7 05 34 0e 00 00 00 	movl   $0x0,0xe34
 939:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 93c:	b9 30 0e 00 00       	mov    $0xe30,%ecx
 941:	eb d7                	jmp    91a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 943:	74 19                	je     95e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 945:	29 da                	sub    %ebx,%edx
 947:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 94a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 94d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 950:	89 0d 2c 0e 00 00    	mov    %ecx,0xe2c
      return (void*)(p + 1);
 956:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 959:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95c:	c9                   	leave  
 95d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 95e:	8b 10                	mov    (%eax),%edx
 960:	89 11                	mov    %edx,(%ecx)
 962:	eb ec                	jmp    950 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 964:	89 c1                	mov    %eax,%ecx
 966:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 968:	8b 50 04             	mov    0x4(%eax),%edx
 96b:	39 da                	cmp    %ebx,%edx
 96d:	73 d4                	jae    943 <malloc+0x46>
    if(p == freep)
 96f:	39 05 2c 0e 00 00    	cmp    %eax,0xe2c
 975:	75 ed                	jne    964 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 977:	89 d8                	mov    %ebx,%eax
 979:	e8 2f ff ff ff       	call   8ad <morecore>
 97e:	85 c0                	test   %eax,%eax
 980:	75 e2                	jne    964 <malloc+0x67>
 982:	eb d5                	jmp    959 <malloc+0x5c>
