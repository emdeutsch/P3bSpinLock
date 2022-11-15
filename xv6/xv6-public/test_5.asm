
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
  1c:	a1 28 0e 00 00       	mov    0xe28,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 88 09 00 00       	push   $0x988
  31:	68 91 09 00 00       	push   $0x991
  36:	6a 01                	push   $0x1
  38:	e8 9b 06 00 00       	call   6d8 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 d0 09 00 00       	push   $0x9d0
  45:	68 a4 09 00 00       	push   $0x9a4
  4a:	6a 01                	push   $0x1
  4c:	e8 87 06 00 00       	call   6d8 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 b8 09 00 00       	push   $0x9b8
  59:	6a 01                	push   $0x1
  5b:	e8 78 06 00 00       	call   6d8 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 2c 0e 00 00    	push   0xe2c
  69:	e8 45 05 00 00       	call   5b3 <kill>
  6e:	e8 10 05 00 00       	call   583 <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 88 09 00 00       	push   $0x988
  7a:	68 91 09 00 00       	push   $0x991
  7f:	6a 01                	push   $0x1
  81:	e8 52 06 00 00       	call   6d8 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 99 09 00 00       	push   $0x999
  8e:	68 a4 09 00 00       	push   $0x9a4
  93:	6a 01                	push   $0x1
  95:	e8 3e 06 00 00       	call   6d8 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 b8 09 00 00       	push   $0x9b8
  a2:	6a 01                	push   $0x1
  a4:	e8 2f 06 00 00       	call   6d8 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 2c 0e 00 00    	push   0xe2c
  b2:	e8 fc 04 00 00       	call   5b3 <kill>
  b7:	e8 c7 04 00 00       	call   583 <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 88 09 00 00       	push   $0x988
  c3:	68 91 09 00 00       	push   $0x991
  c8:	6a 01                	push   $0x1
  ca:	e8 09 06 00 00       	call   6d8 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 c5 09 00 00       	push   $0x9c5
  d7:	68 a4 09 00 00       	push   $0x9a4
  dc:	6a 01                	push   $0x1
  de:	e8 f5 05 00 00       	call   6d8 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 b8 09 00 00       	push   $0x9b8
  eb:	6a 01                	push   $0x1
  ed:	e8 e6 05 00 00       	call   6d8 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 2c 0e 00 00    	push   0xe2c
  fb:	e8 b3 04 00 00       	call   5b3 <kill>
 100:	e8 7e 04 00 00       	call   583 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 28 0e 00 00       	mov    %eax,0xe28
   exit();
 10d:	e8 71 04 00 00       	call   583 <exit>

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
 126:	e8 d8 04 00 00       	call   603 <getpid>
 12b:	a3 2c 0e 00 00       	mov    %eax,0xe2c
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 c1 07 00 00       	call   8fe <malloc>
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
 15a:	68 88 09 00 00       	push   $0x988
 15f:	68 91 09 00 00       	push   $0x991
 164:	6a 01                	push   $0x1
 166:	e8 6d 05 00 00       	call   6d8 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 dc 09 00 00       	push   $0x9dc
 173:	68 a4 09 00 00       	push   $0x9a4
 178:	6a 01                	push   $0x1
 17a:	e8 59 05 00 00       	call   6d8 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 b8 09 00 00       	push   $0x9b8
 187:	6a 01                	push   $0x1
 189:	e8 4a 05 00 00       	call   6d8 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 2c 0e 00 00    	push   0xe2c
 197:	e8 17 04 00 00       	call   5b3 <kill>
 19c:	e8 e2 03 00 00       	call   583 <exit>
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
 1bf:	e8 5f 04 00 00       	call   623 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 52 04 00 00       	call   62b <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 88 09 00 00       	push   $0x988
 1f4:	68 91 09 00 00       	push   $0x991
 1f9:	6a 01                	push   $0x1
 1fb:	e8 d8 04 00 00       	call   6d8 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 0a 0a 00 00       	push   $0xa0a
 208:	68 a4 09 00 00       	push   $0x9a4
 20d:	6a 01                	push   $0x1
 20f:	e8 c4 04 00 00       	call   6d8 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 b8 09 00 00       	push   $0x9b8
 21c:	6a 01                	push   $0x1
 21e:	e8 b5 04 00 00       	call   6d8 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 2c 0e 00 00    	push   0xe2c
 22c:	e8 82 03 00 00       	call   5b3 <kill>
 231:	e8 4d 03 00 00       	call   583 <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 88 09 00 00       	push   $0x988
 23d:	68 91 09 00 00       	push   $0x991
 242:	6a 01                	push   $0x1
 244:	e8 8f 04 00 00       	call   6d8 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 e6 09 00 00       	push   $0x9e6
 251:	68 a4 09 00 00       	push   $0x9a4
 256:	6a 01                	push   $0x1
 258:	e8 7b 04 00 00       	call   6d8 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 b8 09 00 00       	push   $0x9b8
 265:	6a 01                	push   $0x1
 267:	e8 6c 04 00 00       	call   6d8 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 2c 0e 00 00    	push   0xe2c
 275:	e8 39 03 00 00       	call   5b3 <kill>
 27a:	e8 04 03 00 00       	call   583 <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 88 09 00 00       	push   $0x988
 286:	68 91 09 00 00       	push   $0x991
 28b:	6a 01                	push   $0x1
 28d:	e8 46 04 00 00       	call   6d8 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 f4 09 00 00       	push   $0x9f4
 29a:	68 a4 09 00 00       	push   $0x9a4
 29f:	6a 01                	push   $0x1
 2a1:	e8 32 04 00 00       	call   6d8 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 b8 09 00 00       	push   $0x9b8
 2ae:	6a 01                	push   $0x1
 2b0:	e8 23 04 00 00       	call   6d8 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 2c 0e 00 00    	push   0xe2c
 2be:	e8 f0 02 00 00       	call   5b3 <kill>
 2c3:	e8 bb 02 00 00       	call   583 <exit>
   assert(global == 2);
 2c8:	83 3d 28 0e 00 00 02 	cmpl   $0x2,0xe28
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 88 09 00 00       	push   $0x988
 2d8:	68 91 09 00 00       	push   $0x991
 2dd:	6a 01                	push   $0x1
 2df:	e8 f4 03 00 00       	call   6d8 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 1e 0a 00 00       	push   $0xa1e
 2ec:	68 a4 09 00 00       	push   $0x9a4
 2f1:	6a 01                	push   $0x1
 2f3:	e8 e0 03 00 00       	call   6d8 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 b8 09 00 00       	push   $0x9b8
 300:	6a 01                	push   $0x1
 302:	e8 d1 03 00 00       	call   6d8 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 2c 0e 00 00    	push   0xe2c
 310:	e8 9e 02 00 00       	call   5b3 <kill>
 315:	e8 69 02 00 00       	call   583 <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 2a 0a 00 00       	push   $0xa2a
 322:	6a 01                	push   $0x1
 324:	e8 af 03 00 00       	call   6d8 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 0d 05 00 00       	call   83e <free>
   exit();
 331:	e8 4d 02 00 00       	call   583 <exit>

00000336 <strcpy>:
#include "x86.h"
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
 3fc:	e8 9a 01 00 00       	call   59b <read>
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
 43a:	e8 84 01 00 00       	call   5c3 <open>
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
 44f:	e8 87 01 00 00       	call   5db <fstat>
 454:	89 c6                	mov    %eax,%esi
  close(fd);
 456:	89 1c 24             	mov    %ebx,(%esp)
 459:	e8 4d 01 00 00       	call   5ab <close>
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
 527:	e8 d2 03 00 00       	call   8fe <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 52c:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 52f:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 531:	eb 03                	jmp    536 <thread_create+0x1a>
      stack += 1;
 533:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 536:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 53c:	75 f5                	jne    533 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 53e:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 540:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 543:	52                   	push   %edx
 544:	ff 75 10             	push   0x10(%ebp)
 547:	ff 75 0c             	push   0xc(%ebp)
 54a:	ff 75 08             	push   0x8(%ebp)
 54d:	e8 d1 00 00 00       	call   623 <clone>
 
    return pid;
}
 552:	c9                   	leave  
 553:	c3                   	ret    

00000554 <thread_join>:
int 
thread_join(){
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	53                   	push   %ebx
 558:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 55b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 55e:	50                   	push   %eax
 55f:	e8 c7 00 00 00       	call   62b <join>
 564:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 566:	83 c4 04             	add    $0x4,%esp
 569:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56c:	ff 70 fc             	push   -0x4(%eax)
 56f:	e8 ca 02 00 00       	call   83e <free>
  return waitedForPID;
 574:	89 d8                	mov    %ebx,%eax
 576:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 579:	c9                   	leave  
 57a:	c3                   	ret    

0000057b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 57b:	b8 01 00 00 00       	mov    $0x1,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <exit>:
SYSCALL(exit)
 583:	b8 02 00 00 00       	mov    $0x2,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <wait>:
SYSCALL(wait)
 58b:	b8 03 00 00 00       	mov    $0x3,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <pipe>:
SYSCALL(pipe)
 593:	b8 04 00 00 00       	mov    $0x4,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <read>:
SYSCALL(read)
 59b:	b8 05 00 00 00       	mov    $0x5,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <write>:
SYSCALL(write)
 5a3:	b8 10 00 00 00       	mov    $0x10,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <close>:
SYSCALL(close)
 5ab:	b8 15 00 00 00       	mov    $0x15,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <kill>:
SYSCALL(kill)
 5b3:	b8 06 00 00 00       	mov    $0x6,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <exec>:
SYSCALL(exec)
 5bb:	b8 07 00 00 00       	mov    $0x7,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <open>:
SYSCALL(open)
 5c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <mknod>:
SYSCALL(mknod)
 5cb:	b8 11 00 00 00       	mov    $0x11,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <unlink>:
SYSCALL(unlink)
 5d3:	b8 12 00 00 00       	mov    $0x12,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <fstat>:
SYSCALL(fstat)
 5db:	b8 08 00 00 00       	mov    $0x8,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <link>:
SYSCALL(link)
 5e3:	b8 13 00 00 00       	mov    $0x13,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <mkdir>:
SYSCALL(mkdir)
 5eb:	b8 14 00 00 00       	mov    $0x14,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <chdir>:
SYSCALL(chdir)
 5f3:	b8 09 00 00 00       	mov    $0x9,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <dup>:
SYSCALL(dup)
 5fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <getpid>:
SYSCALL(getpid)
 603:	b8 0b 00 00 00       	mov    $0xb,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <sbrk>:
SYSCALL(sbrk)
 60b:	b8 0c 00 00 00       	mov    $0xc,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <sleep>:
SYSCALL(sleep)
 613:	b8 0d 00 00 00       	mov    $0xd,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <uptime>:
SYSCALL(uptime)
 61b:	b8 0e 00 00 00       	mov    $0xe,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <clone>:
SYSCALL(clone)
 623:	b8 16 00 00 00       	mov    $0x16,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <join>:
SYSCALL(join)
 62b:	b8 17 00 00 00       	mov    $0x17,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 633:	55                   	push   %ebp
 634:	89 e5                	mov    %esp,%ebp
 636:	83 ec 1c             	sub    $0x1c,%esp
 639:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 63c:	6a 01                	push   $0x1
 63e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 641:	52                   	push   %edx
 642:	50                   	push   %eax
 643:	e8 5b ff ff ff       	call   5a3 <write>
}
 648:	83 c4 10             	add    $0x10,%esp
 64b:	c9                   	leave  
 64c:	c3                   	ret    

0000064d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	57                   	push   %edi
 651:	56                   	push   %esi
 652:	53                   	push   %ebx
 653:	83 ec 2c             	sub    $0x2c,%esp
 656:	89 45 d0             	mov    %eax,-0x30(%ebp)
 659:	89 d0                	mov    %edx,%eax
 65b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 65d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 661:	0f 95 c1             	setne  %cl
 664:	c1 ea 1f             	shr    $0x1f,%edx
 667:	84 d1                	test   %dl,%cl
 669:	74 44                	je     6af <printint+0x62>
    neg = 1;
    x = -xx;
 66b:	f7 d8                	neg    %eax
 66d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 66f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 676:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 67b:	89 c8                	mov    %ecx,%eax
 67d:	ba 00 00 00 00       	mov    $0x0,%edx
 682:	f7 f6                	div    %esi
 684:	89 df                	mov    %ebx,%edi
 686:	83 c3 01             	add    $0x1,%ebx
 689:	0f b6 92 98 0a 00 00 	movzbl 0xa98(%edx),%edx
 690:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 694:	89 ca                	mov    %ecx,%edx
 696:	89 c1                	mov    %eax,%ecx
 698:	39 d6                	cmp    %edx,%esi
 69a:	76 df                	jbe    67b <printint+0x2e>
  if(neg)
 69c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6a0:	74 31                	je     6d3 <printint+0x86>
    buf[i++] = '-';
 6a2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6a7:	8d 5f 02             	lea    0x2(%edi),%ebx
 6aa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ad:	eb 17                	jmp    6c6 <printint+0x79>
    x = xx;
 6af:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6b1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6b8:	eb bc                	jmp    676 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6ba:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6bf:	89 f0                	mov    %esi,%eax
 6c1:	e8 6d ff ff ff       	call   633 <putc>
  while(--i >= 0)
 6c6:	83 eb 01             	sub    $0x1,%ebx
 6c9:	79 ef                	jns    6ba <printint+0x6d>
}
 6cb:	83 c4 2c             	add    $0x2c,%esp
 6ce:	5b                   	pop    %ebx
 6cf:	5e                   	pop    %esi
 6d0:	5f                   	pop    %edi
 6d1:	5d                   	pop    %ebp
 6d2:	c3                   	ret    
 6d3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6d6:	eb ee                	jmp    6c6 <printint+0x79>

000006d8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d8:	55                   	push   %ebp
 6d9:	89 e5                	mov    %esp,%ebp
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	53                   	push   %ebx
 6de:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e1:	8d 45 10             	lea    0x10(%ebp),%eax
 6e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6e7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6ec:	bb 00 00 00 00       	mov    $0x0,%ebx
 6f1:	eb 14                	jmp    707 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6f3:	89 fa                	mov    %edi,%edx
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	e8 36 ff ff ff       	call   633 <putc>
 6fd:	eb 05                	jmp    704 <printf+0x2c>
      }
    } else if(state == '%'){
 6ff:	83 fe 25             	cmp    $0x25,%esi
 702:	74 25                	je     729 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 704:	83 c3 01             	add    $0x1,%ebx
 707:	8b 45 0c             	mov    0xc(%ebp),%eax
 70a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 70e:	84 c0                	test   %al,%al
 710:	0f 84 20 01 00 00    	je     836 <printf+0x15e>
    c = fmt[i] & 0xff;
 716:	0f be f8             	movsbl %al,%edi
 719:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 71c:	85 f6                	test   %esi,%esi
 71e:	75 df                	jne    6ff <printf+0x27>
      if(c == '%'){
 720:	83 f8 25             	cmp    $0x25,%eax
 723:	75 ce                	jne    6f3 <printf+0x1b>
        state = '%';
 725:	89 c6                	mov    %eax,%esi
 727:	eb db                	jmp    704 <printf+0x2c>
      if(c == 'd'){
 729:	83 f8 25             	cmp    $0x25,%eax
 72c:	0f 84 cf 00 00 00    	je     801 <printf+0x129>
 732:	0f 8c dd 00 00 00    	jl     815 <printf+0x13d>
 738:	83 f8 78             	cmp    $0x78,%eax
 73b:	0f 8f d4 00 00 00    	jg     815 <printf+0x13d>
 741:	83 f8 63             	cmp    $0x63,%eax
 744:	0f 8c cb 00 00 00    	jl     815 <printf+0x13d>
 74a:	83 e8 63             	sub    $0x63,%eax
 74d:	83 f8 15             	cmp    $0x15,%eax
 750:	0f 87 bf 00 00 00    	ja     815 <printf+0x13d>
 756:	ff 24 85 40 0a 00 00 	jmp    *0xa40(,%eax,4)
        printint(fd, *ap, 10, 1);
 75d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 760:	8b 17                	mov    (%edi),%edx
 762:	83 ec 0c             	sub    $0xc,%esp
 765:	6a 01                	push   $0x1
 767:	b9 0a 00 00 00       	mov    $0xa,%ecx
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	e8 d9 fe ff ff       	call   64d <printint>
        ap++;
 774:	83 c7 04             	add    $0x4,%edi
 777:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 77d:	be 00 00 00 00       	mov    $0x0,%esi
 782:	eb 80                	jmp    704 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 784:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 787:	8b 17                	mov    (%edi),%edx
 789:	83 ec 0c             	sub    $0xc,%esp
 78c:	6a 00                	push   $0x0
 78e:	b9 10 00 00 00       	mov    $0x10,%ecx
 793:	8b 45 08             	mov    0x8(%ebp),%eax
 796:	e8 b2 fe ff ff       	call   64d <printint>
        ap++;
 79b:	83 c7 04             	add    $0x4,%edi
 79e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7a1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
 7a9:	e9 56 ff ff ff       	jmp    704 <printf+0x2c>
        s = (char*)*ap;
 7ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b1:	8b 30                	mov    (%eax),%esi
        ap++;
 7b3:	83 c0 04             	add    $0x4,%eax
 7b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7b9:	85 f6                	test   %esi,%esi
 7bb:	75 15                	jne    7d2 <printf+0xfa>
          s = "(null)";
 7bd:	be 37 0a 00 00       	mov    $0xa37,%esi
 7c2:	eb 0e                	jmp    7d2 <printf+0xfa>
          putc(fd, *s);
 7c4:	0f be d2             	movsbl %dl,%edx
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	e8 64 fe ff ff       	call   633 <putc>
          s++;
 7cf:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7d2:	0f b6 16             	movzbl (%esi),%edx
 7d5:	84 d2                	test   %dl,%dl
 7d7:	75 eb                	jne    7c4 <printf+0xec>
      state = 0;
 7d9:	be 00 00 00 00       	mov    $0x0,%esi
 7de:	e9 21 ff ff ff       	jmp    704 <printf+0x2c>
        putc(fd, *ap);
 7e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e6:	0f be 17             	movsbl (%edi),%edx
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	e8 42 fe ff ff       	call   633 <putc>
        ap++;
 7f1:	83 c7 04             	add    $0x4,%edi
 7f4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7f7:	be 00 00 00 00       	mov    $0x0,%esi
 7fc:	e9 03 ff ff ff       	jmp    704 <printf+0x2c>
        putc(fd, c);
 801:	89 fa                	mov    %edi,%edx
 803:	8b 45 08             	mov    0x8(%ebp),%eax
 806:	e8 28 fe ff ff       	call   633 <putc>
      state = 0;
 80b:	be 00 00 00 00       	mov    $0x0,%esi
 810:	e9 ef fe ff ff       	jmp    704 <printf+0x2c>
        putc(fd, '%');
 815:	ba 25 00 00 00       	mov    $0x25,%edx
 81a:	8b 45 08             	mov    0x8(%ebp),%eax
 81d:	e8 11 fe ff ff       	call   633 <putc>
        putc(fd, c);
 822:	89 fa                	mov    %edi,%edx
 824:	8b 45 08             	mov    0x8(%ebp),%eax
 827:	e8 07 fe ff ff       	call   633 <putc>
      state = 0;
 82c:	be 00 00 00 00       	mov    $0x0,%esi
 831:	e9 ce fe ff ff       	jmp    704 <printf+0x2c>
    }
  }
}
 836:	8d 65 f4             	lea    -0xc(%ebp),%esp
 839:	5b                   	pop    %ebx
 83a:	5e                   	pop    %esi
 83b:	5f                   	pop    %edi
 83c:	5d                   	pop    %ebp
 83d:	c3                   	ret    

0000083e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 83e:	55                   	push   %ebp
 83f:	89 e5                	mov    %esp,%ebp
 841:	57                   	push   %edi
 842:	56                   	push   %esi
 843:	53                   	push   %ebx
 844:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 847:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84a:	a1 30 0e 00 00       	mov    0xe30,%eax
 84f:	eb 02                	jmp    853 <free+0x15>
 851:	89 d0                	mov    %edx,%eax
 853:	39 c8                	cmp    %ecx,%eax
 855:	73 04                	jae    85b <free+0x1d>
 857:	39 08                	cmp    %ecx,(%eax)
 859:	77 12                	ja     86d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 85b:	8b 10                	mov    (%eax),%edx
 85d:	39 c2                	cmp    %eax,%edx
 85f:	77 f0                	ja     851 <free+0x13>
 861:	39 c8                	cmp    %ecx,%eax
 863:	72 08                	jb     86d <free+0x2f>
 865:	39 ca                	cmp    %ecx,%edx
 867:	77 04                	ja     86d <free+0x2f>
 869:	89 d0                	mov    %edx,%eax
 86b:	eb e6                	jmp    853 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 86d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 870:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 873:	8b 10                	mov    (%eax),%edx
 875:	39 d7                	cmp    %edx,%edi
 877:	74 19                	je     892 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 879:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 87c:	8b 50 04             	mov    0x4(%eax),%edx
 87f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 882:	39 ce                	cmp    %ecx,%esi
 884:	74 1b                	je     8a1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 886:	89 08                	mov    %ecx,(%eax)
  freep = p;
 888:	a3 30 0e 00 00       	mov    %eax,0xe30
}
 88d:	5b                   	pop    %ebx
 88e:	5e                   	pop    %esi
 88f:	5f                   	pop    %edi
 890:	5d                   	pop    %ebp
 891:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 892:	03 72 04             	add    0x4(%edx),%esi
 895:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 898:	8b 10                	mov    (%eax),%edx
 89a:	8b 12                	mov    (%edx),%edx
 89c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 89f:	eb db                	jmp    87c <free+0x3e>
    p->s.size += bp->s.size;
 8a1:	03 53 fc             	add    -0x4(%ebx),%edx
 8a4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8aa:	89 10                	mov    %edx,(%eax)
 8ac:	eb da                	jmp    888 <free+0x4a>

000008ae <morecore>:

static Header*
morecore(uint nu)
{
 8ae:	55                   	push   %ebp
 8af:	89 e5                	mov    %esp,%ebp
 8b1:	53                   	push   %ebx
 8b2:	83 ec 04             	sub    $0x4,%esp
 8b5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8b7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8bc:	77 05                	ja     8c3 <morecore+0x15>
    nu = 4096;
 8be:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8c3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8ca:	83 ec 0c             	sub    $0xc,%esp
 8cd:	50                   	push   %eax
 8ce:	e8 38 fd ff ff       	call   60b <sbrk>
  if(p == (char*)-1)
 8d3:	83 c4 10             	add    $0x10,%esp
 8d6:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d9:	74 1c                	je     8f7 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8db:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8de:	83 c0 08             	add    $0x8,%eax
 8e1:	83 ec 0c             	sub    $0xc,%esp
 8e4:	50                   	push   %eax
 8e5:	e8 54 ff ff ff       	call   83e <free>
  return freep;
 8ea:	a1 30 0e 00 00       	mov    0xe30,%eax
 8ef:	83 c4 10             	add    $0x10,%esp
}
 8f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f5:	c9                   	leave  
 8f6:	c3                   	ret    
    return 0;
 8f7:	b8 00 00 00 00       	mov    $0x0,%eax
 8fc:	eb f4                	jmp    8f2 <morecore+0x44>

000008fe <malloc>:

void*
malloc(uint nbytes)
{
 8fe:	55                   	push   %ebp
 8ff:	89 e5                	mov    %esp,%ebp
 901:	53                   	push   %ebx
 902:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 905:	8b 45 08             	mov    0x8(%ebp),%eax
 908:	8d 58 07             	lea    0x7(%eax),%ebx
 90b:	c1 eb 03             	shr    $0x3,%ebx
 90e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 911:	8b 0d 30 0e 00 00    	mov    0xe30,%ecx
 917:	85 c9                	test   %ecx,%ecx
 919:	74 04                	je     91f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91b:	8b 01                	mov    (%ecx),%eax
 91d:	eb 4a                	jmp    969 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 91f:	c7 05 30 0e 00 00 34 	movl   $0xe34,0xe30
 926:	0e 00 00 
 929:	c7 05 34 0e 00 00 34 	movl   $0xe34,0xe34
 930:	0e 00 00 
    base.s.size = 0;
 933:	c7 05 38 0e 00 00 00 	movl   $0x0,0xe38
 93a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 93d:	b9 34 0e 00 00       	mov    $0xe34,%ecx
 942:	eb d7                	jmp    91b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 944:	74 19                	je     95f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 946:	29 da                	sub    %ebx,%edx
 948:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 94b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 94e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 951:	89 0d 30 0e 00 00    	mov    %ecx,0xe30
      return (void*)(p + 1);
 957:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 95a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95d:	c9                   	leave  
 95e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 95f:	8b 10                	mov    (%eax),%edx
 961:	89 11                	mov    %edx,(%ecx)
 963:	eb ec                	jmp    951 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 965:	89 c1                	mov    %eax,%ecx
 967:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 969:	8b 50 04             	mov    0x4(%eax),%edx
 96c:	39 da                	cmp    %ebx,%edx
 96e:	73 d4                	jae    944 <malloc+0x46>
    if(p == freep)
 970:	39 05 30 0e 00 00    	cmp    %eax,0xe30
 976:	75 ed                	jne    965 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 978:	89 d8                	mov    %ebx,%eax
 97a:	e8 2f ff ff ff       	call   8ae <morecore>
 97f:	85 c0                	test   %eax,%eax
 981:	75 e2                	jne    965 <malloc+0x67>
 983:	eb d5                	jmp    95a <malloc+0x5c>
