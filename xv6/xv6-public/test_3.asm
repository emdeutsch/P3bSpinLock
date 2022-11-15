
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   6:	6a 06                	push   $0x6
   8:	68 1c 09 00 00       	push   $0x91c
   d:	6a 03                	push   $0x3
   f:	e8 26 05 00 00       	call   53a <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 23 09 00 00       	push   $0x923
  23:	68 2c 09 00 00       	push   $0x92c
  28:	6a 01                	push   $0x1
  2a:	e8 40 06 00 00       	call   66f <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 34 09 00 00       	push   $0x934
  37:	68 50 09 00 00       	push   $0x950
  3c:	6a 01                	push   $0x1
  3e:	e8 2c 06 00 00       	call   66f <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 64 09 00 00       	push   $0x964
  4b:	6a 01                	push   $0x1
  4d:	e8 1d 06 00 00       	call   66f <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 dc 0d 00 00    	push   0xddc
  5b:	e8 ea 04 00 00       	call   54a <kill>
  60:	e8 b5 04 00 00       	call   51a <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 71 09 00 00       	push   $0x971
  72:	e8 e3 04 00 00       	call   55a <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 d8 0d 00 00 	lock xchg %eax,0xdd8
   exit();
  7e:	e8 97 04 00 00       	call   51a <exit>

00000083 <main>:
{
  83:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	ff 71 fc             	push   -0x4(%ecx)
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	51                   	push   %ecx
  93:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  96:	e8 ff 04 00 00       	call   59a <getpid>
  9b:	a3 dc 0d 00 00       	mov    %eax,0xddc
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 e8 07 00 00       	call   895 <malloc>
   assert(p != NULL);
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	74 7d                	je     131 <main+0xae>
  b4:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  bb:	0f 84 b9 00 00 00    	je     17a <main+0xf7>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c1:	be 00 10 00 00       	mov    $0x1000,%esi
  c6:	29 c6                	sub    %eax,%esi
  c8:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  ca:	83 ec 08             	sub    $0x8,%esp
  cd:	68 01 02 00 00       	push   $0x201
  d2:	68 80 09 00 00       	push   $0x980
  d7:	e8 7e 04 00 00       	call   55a <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 23 09 00 00       	push   $0x923
  ef:	68 2c 09 00 00       	push   $0x92c
  f4:	6a 01                	push   $0x1
  f6:	e8 74 05 00 00       	call   66f <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 84 09 00 00       	push   $0x984
 103:	68 50 09 00 00       	push   $0x950
 108:	6a 01                	push   $0x1
 10a:	e8 60 05 00 00       	call   66f <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 64 09 00 00       	push   $0x964
 117:	6a 01                	push   $0x1
 119:	e8 51 05 00 00       	call   66f <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 dc 0d 00 00    	push   0xddc
 127:	e8 1e 04 00 00       	call   54a <kill>
 12c:	e8 e9 03 00 00       	call   51a <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 23 09 00 00       	push   $0x923
 138:	68 2c 09 00 00       	push   $0x92c
 13d:	6a 01                	push   $0x1
 13f:	e8 2b 05 00 00       	call   66f <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 76 09 00 00       	push   $0x976
 14c:	68 50 09 00 00       	push   $0x950
 151:	6a 01                	push   $0x1
 153:	e8 17 05 00 00       	call   66f <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 64 09 00 00       	push   $0x964
 160:	6a 01                	push   $0x1
 162:	e8 08 05 00 00       	call   66f <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 dc 0d 00 00    	push   0xddc
 170:	e8 d5 03 00 00       	call   54a <kill>
 175:	e8 a0 03 00 00       	call   51a <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 2a 04 00 00       	call   5ba <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 d8 0d 00 00       	mov    0xdd8,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 9a 09 00 00       	push   $0x99a
 1b1:	50                   	push   %eax
 1b2:	e8 83 03 00 00       	call   53a <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 23 09 00 00       	push   $0x923
 1ca:	68 2c 09 00 00       	push   $0x92c
 1cf:	6a 01                	push   $0x1
 1d1:	e8 99 04 00 00       	call   66f <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 c8 09 00 00       	push   $0x9c8
 1de:	68 50 09 00 00       	push   $0x950
 1e3:	6a 01                	push   $0x1
 1e5:	e8 85 04 00 00       	call   66f <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 64 09 00 00       	push   $0x964
 1f2:	6a 01                	push   $0x1
 1f4:	e8 76 04 00 00       	call   66f <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 dc 0d 00 00    	push   0xddc
 202:	e8 43 03 00 00       	call   54a <kill>
 207:	e8 0e 03 00 00       	call   51a <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 23 09 00 00       	push   $0x923
 213:	68 2c 09 00 00       	push   $0x92c
 218:	6a 01                	push   $0x1
 21a:	e8 50 04 00 00       	call   66f <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 8c 09 00 00       	push   $0x98c
 227:	68 50 09 00 00       	push   $0x950
 22c:	6a 01                	push   $0x1
 22e:	e8 3c 04 00 00       	call   66f <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 64 09 00 00       	push   $0x964
 23b:	6a 01                	push   $0x1
 23d:	e8 2d 04 00 00       	call   66f <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 dc 0d 00 00    	push   0xddc
 24b:	e8 fa 02 00 00       	call   54a <kill>
 250:	e8 c5 02 00 00       	call   51a <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 a3 09 00 00       	push   $0x9a3
 25d:	6a 01                	push   $0x1
 25f:	e8 0b 04 00 00       	call   66f <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 53 03 00 00       	call   5c2 <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 23 09 00 00       	push   $0x923
 27d:	68 2c 09 00 00       	push   $0x92c
 282:	6a 01                	push   $0x1
 284:	e8 e6 03 00 00       	call   66f <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 b0 09 00 00       	push   $0x9b0
 291:	68 50 09 00 00       	push   $0x950
 296:	6a 01                	push   $0x1
 298:	e8 d2 03 00 00       	call   66f <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 64 09 00 00       	push   $0x964
 2a5:	6a 01                	push   $0x1
 2a7:	e8 c3 03 00 00       	call   66f <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 dc 0d 00 00    	push   0xddc
 2b5:	e8 90 02 00 00       	call   54a <kill>
 2ba:	e8 5b 02 00 00       	call   51a <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 0d 05 00 00       	call   7d5 <free>
   exit();
 2c8:	e8 4d 02 00 00       	call   51a <exit>

000002cd <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2d8:	89 f0                	mov    %esi,%eax
 2da:	89 d1                	mov    %edx,%ecx
 2dc:	83 c2 01             	add    $0x1,%edx
 2df:	89 c3                	mov    %eax,%ebx
 2e1:	83 c0 01             	add    $0x1,%eax
 2e4:	0f b6 09             	movzbl (%ecx),%ecx
 2e7:	88 0b                	mov    %cl,(%ebx)
 2e9:	84 c9                	test   %cl,%cl
 2eb:	75 ed                	jne    2da <strcpy+0xd>
    ;
  return os;
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2fc:	eb 06                	jmp    304 <strcmp+0x11>
    p++, q++;
 2fe:	83 c1 01             	add    $0x1,%ecx
 301:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 304:	0f b6 01             	movzbl (%ecx),%eax
 307:	84 c0                	test   %al,%al
 309:	74 04                	je     30f <strcmp+0x1c>
 30b:	3a 02                	cmp    (%edx),%al
 30d:	74 ef                	je     2fe <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 30f:	0f b6 c0             	movzbl %al,%eax
 312:	0f b6 12             	movzbl (%edx),%edx
 315:	29 d0                	sub    %edx,%eax
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    

00000319 <strlen>:

uint
strlen(const char *s)
{
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 31f:	b8 00 00 00 00       	mov    $0x0,%eax
 324:	eb 03                	jmp    329 <strlen+0x10>
 326:	83 c0 01             	add    $0x1,%eax
 329:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 32d:	75 f7                	jne    326 <strlen+0xd>
    ;
  return n;
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    

00000331 <memset>:

void*
memset(void *dst, int c, uint n)
{
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
 334:	57                   	push   %edi
 335:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 338:	89 d7                	mov    %edx,%edi
 33a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 33d:	8b 45 0c             	mov    0xc(%ebp),%eax
 340:	fc                   	cld    
 341:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 343:	89 d0                	mov    %edx,%eax
 345:	8b 7d fc             	mov    -0x4(%ebp),%edi
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <strchr>:

char*
strchr(const char *s, char c)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 354:	eb 03                	jmp    359 <strchr+0xf>
 356:	83 c0 01             	add    $0x1,%eax
 359:	0f b6 10             	movzbl (%eax),%edx
 35c:	84 d2                	test   %dl,%dl
 35e:	74 06                	je     366 <strchr+0x1c>
    if(*s == c)
 360:	38 ca                	cmp    %cl,%dl
 362:	75 f2                	jne    356 <strchr+0xc>
 364:	eb 05                	jmp    36b <strchr+0x21>
      return (char*)s;
  return 0;
 366:	b8 00 00 00 00       	mov    $0x0,%eax
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    

0000036d <gets>:

char*
gets(char *buf, int max)
{
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	57                   	push   %edi
 371:	56                   	push   %esi
 372:	53                   	push   %ebx
 373:	83 ec 1c             	sub    $0x1c,%esp
 376:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 379:	bb 00 00 00 00       	mov    $0x0,%ebx
 37e:	89 de                	mov    %ebx,%esi
 380:	83 c3 01             	add    $0x1,%ebx
 383:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 386:	7d 2e                	jge    3b6 <gets+0x49>
    cc = read(0, &c, 1);
 388:	83 ec 04             	sub    $0x4,%esp
 38b:	6a 01                	push   $0x1
 38d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 390:	50                   	push   %eax
 391:	6a 00                	push   $0x0
 393:	e8 9a 01 00 00       	call   532 <read>
    if(cc < 1)
 398:	83 c4 10             	add    $0x10,%esp
 39b:	85 c0                	test   %eax,%eax
 39d:	7e 17                	jle    3b6 <gets+0x49>
      break;
    buf[i++] = c;
 39f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3a6:	3c 0a                	cmp    $0xa,%al
 3a8:	0f 94 c2             	sete   %dl
 3ab:	3c 0d                	cmp    $0xd,%al
 3ad:	0f 94 c0             	sete   %al
 3b0:	08 c2                	or     %al,%dl
 3b2:	74 ca                	je     37e <gets+0x11>
    buf[i++] = c;
 3b4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3ba:	89 f8                	mov    %edi,%eax
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    

000003c4 <stat>:

int
stat(const char *n, struct stat *st)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	56                   	push   %esi
 3c8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c9:	83 ec 08             	sub    $0x8,%esp
 3cc:	6a 00                	push   $0x0
 3ce:	ff 75 08             	push   0x8(%ebp)
 3d1:	e8 84 01 00 00       	call   55a <open>
  if(fd < 0)
 3d6:	83 c4 10             	add    $0x10,%esp
 3d9:	85 c0                	test   %eax,%eax
 3db:	78 24                	js     401 <stat+0x3d>
 3dd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3df:	83 ec 08             	sub    $0x8,%esp
 3e2:	ff 75 0c             	push   0xc(%ebp)
 3e5:	50                   	push   %eax
 3e6:	e8 87 01 00 00       	call   572 <fstat>
 3eb:	89 c6                	mov    %eax,%esi
  close(fd);
 3ed:	89 1c 24             	mov    %ebx,(%esp)
 3f0:	e8 4d 01 00 00       	call   542 <close>
  return r;
 3f5:	83 c4 10             	add    $0x10,%esp
}
 3f8:	89 f0                	mov    %esi,%eax
 3fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3fd:	5b                   	pop    %ebx
 3fe:	5e                   	pop    %esi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    
    return -1;
 401:	be ff ff ff ff       	mov    $0xffffffff,%esi
 406:	eb f0                	jmp    3f8 <stat+0x34>

00000408 <atoi>:

int
atoi(const char *s)
{
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	53                   	push   %ebx
 40c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 414:	eb 10                	jmp    426 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 416:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 419:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 41c:	83 c1 01             	add    $0x1,%ecx
 41f:	0f be c0             	movsbl %al,%eax
 422:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 426:	0f b6 01             	movzbl (%ecx),%eax
 429:	8d 58 d0             	lea    -0x30(%eax),%ebx
 42c:	80 fb 09             	cmp    $0x9,%bl
 42f:	76 e5                	jbe    416 <atoi+0xe>
  return n;
}
 431:	89 d0                	mov    %edx,%eax
 433:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 436:	c9                   	leave  
 437:	c3                   	ret    

00000438 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	56                   	push   %esi
 43c:	53                   	push   %ebx
 43d:	8b 75 08             	mov    0x8(%ebp),%esi
 440:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 443:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 446:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 448:	eb 0d                	jmp    457 <memmove+0x1f>
    *dst++ = *src++;
 44a:	0f b6 01             	movzbl (%ecx),%eax
 44d:	88 02                	mov    %al,(%edx)
 44f:	8d 49 01             	lea    0x1(%ecx),%ecx
 452:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 455:	89 d8                	mov    %ebx,%eax
 457:	8d 58 ff             	lea    -0x1(%eax),%ebx
 45a:	85 c0                	test   %eax,%eax
 45c:	7f ec                	jg     44a <memmove+0x12>
  return vdst;
}
 45e:	89 f0                	mov    %esi,%eax
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    

00000464 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 46a:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 46c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 46f:	89 08                	mov    %ecx,(%eax)
  return old;
}
 471:	89 d0                	mov    %edx,%eax
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    

00000475 <lock_init>:
void 
lock_init(lock_t *lock){
 475:	55                   	push   %ebp
 476:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 478:	8b 45 08             	mov    0x8(%ebp),%eax
 47b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 481:	5d                   	pop    %ebp
 482:	c3                   	ret    

00000483 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 483:	55                   	push   %ebp
 484:	89 e5                	mov    %esp,%ebp
 486:	53                   	push   %ebx
 487:	83 ec 04             	sub    $0x4,%esp
 48a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 48d:	83 ec 08             	sub    $0x8,%esp
 490:	6a 01                	push   $0x1
 492:	53                   	push   %ebx
 493:	e8 cc ff ff ff       	call   464 <TestAndSet>
 498:	83 c4 10             	add    $0x10,%esp
 49b:	83 f8 01             	cmp    $0x1,%eax
 49e:	74 ed                	je     48d <lock_acquire+0xa>
    ;
}
 4a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a3:	c9                   	leave  
 4a4:	c3                   	ret    

000004a5 <lock_release>:
void 
lock_release(lock_t *lock){
 4a5:	55                   	push   %ebp
 4a6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
 4ab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4b1:	5d                   	pop    %ebp
 4b2:	c3                   	ret    

000004b3 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 4b9:	68 04 20 00 00       	push   $0x2004
 4be:	e8 d2 03 00 00       	call   895 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 4c3:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 4c6:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 4c8:	eb 03                	jmp    4cd <thread_create+0x1a>
      stack += 1;
 4ca:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 4cd:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4d3:	75 f5                	jne    4ca <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 4d5:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 4d7:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4da:	52                   	push   %edx
 4db:	ff 75 10             	push   0x10(%ebp)
 4de:	ff 75 0c             	push   0xc(%ebp)
 4e1:	ff 75 08             	push   0x8(%ebp)
 4e4:	e8 d1 00 00 00       	call   5ba <clone>
 
    return pid;
}
 4e9:	c9                   	leave  
 4ea:	c3                   	ret    

000004eb <thread_join>:
int 
thread_join(){
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	53                   	push   %ebx
 4ef:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 4f2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f5:	50                   	push   %eax
 4f6:	e8 c7 00 00 00       	call   5c2 <join>
 4fb:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 4fd:	83 c4 04             	add    $0x4,%esp
 500:	8b 45 f4             	mov    -0xc(%ebp),%eax
 503:	ff 70 fc             	push   -0x4(%eax)
 506:	e8 ca 02 00 00       	call   7d5 <free>
  return waitedForPID;
 50b:	89 d8                	mov    %ebx,%eax
 50d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 510:	c9                   	leave  
 511:	c3                   	ret    

00000512 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 512:	b8 01 00 00 00       	mov    $0x1,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <exit>:
SYSCALL(exit)
 51a:	b8 02 00 00 00       	mov    $0x2,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <wait>:
SYSCALL(wait)
 522:	b8 03 00 00 00       	mov    $0x3,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <pipe>:
SYSCALL(pipe)
 52a:	b8 04 00 00 00       	mov    $0x4,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <read>:
SYSCALL(read)
 532:	b8 05 00 00 00       	mov    $0x5,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <write>:
SYSCALL(write)
 53a:	b8 10 00 00 00       	mov    $0x10,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <close>:
SYSCALL(close)
 542:	b8 15 00 00 00       	mov    $0x15,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <kill>:
SYSCALL(kill)
 54a:	b8 06 00 00 00       	mov    $0x6,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <exec>:
SYSCALL(exec)
 552:	b8 07 00 00 00       	mov    $0x7,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <open>:
SYSCALL(open)
 55a:	b8 0f 00 00 00       	mov    $0xf,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <mknod>:
SYSCALL(mknod)
 562:	b8 11 00 00 00       	mov    $0x11,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <unlink>:
SYSCALL(unlink)
 56a:	b8 12 00 00 00       	mov    $0x12,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <fstat>:
SYSCALL(fstat)
 572:	b8 08 00 00 00       	mov    $0x8,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <link>:
SYSCALL(link)
 57a:	b8 13 00 00 00       	mov    $0x13,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <mkdir>:
SYSCALL(mkdir)
 582:	b8 14 00 00 00       	mov    $0x14,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <chdir>:
SYSCALL(chdir)
 58a:	b8 09 00 00 00       	mov    $0x9,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <dup>:
SYSCALL(dup)
 592:	b8 0a 00 00 00       	mov    $0xa,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <getpid>:
SYSCALL(getpid)
 59a:	b8 0b 00 00 00       	mov    $0xb,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <sbrk>:
SYSCALL(sbrk)
 5a2:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <sleep>:
SYSCALL(sleep)
 5aa:	b8 0d 00 00 00       	mov    $0xd,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <uptime>:
SYSCALL(uptime)
 5b2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <clone>:
SYSCALL(clone)
 5ba:	b8 16 00 00 00       	mov    $0x16,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <join>:
SYSCALL(join)
 5c2:	b8 17 00 00 00       	mov    $0x17,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ca:	55                   	push   %ebp
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	83 ec 1c             	sub    $0x1c,%esp
 5d0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5d3:	6a 01                	push   $0x1
 5d5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5d8:	52                   	push   %edx
 5d9:	50                   	push   %eax
 5da:	e8 5b ff ff ff       	call   53a <write>
}
 5df:	83 c4 10             	add    $0x10,%esp
 5e2:	c9                   	leave  
 5e3:	c3                   	ret    

000005e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	57                   	push   %edi
 5e8:	56                   	push   %esi
 5e9:	53                   	push   %ebx
 5ea:	83 ec 2c             	sub    $0x2c,%esp
 5ed:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f0:	89 d0                	mov    %edx,%eax
 5f2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5f4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5f8:	0f 95 c1             	setne  %cl
 5fb:	c1 ea 1f             	shr    $0x1f,%edx
 5fe:	84 d1                	test   %dl,%cl
 600:	74 44                	je     646 <printint+0x62>
    neg = 1;
    x = -xx;
 602:	f7 d8                	neg    %eax
 604:	89 c1                	mov    %eax,%ecx
    neg = 1;
 606:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 60d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 612:	89 c8                	mov    %ecx,%eax
 614:	ba 00 00 00 00       	mov    $0x0,%edx
 619:	f7 f6                	div    %esi
 61b:	89 df                	mov    %ebx,%edi
 61d:	83 c3 01             	add    $0x1,%ebx
 620:	0f b6 92 4c 0a 00 00 	movzbl 0xa4c(%edx),%edx
 627:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 62b:	89 ca                	mov    %ecx,%edx
 62d:	89 c1                	mov    %eax,%ecx
 62f:	39 d6                	cmp    %edx,%esi
 631:	76 df                	jbe    612 <printint+0x2e>
  if(neg)
 633:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 637:	74 31                	je     66a <printint+0x86>
    buf[i++] = '-';
 639:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 63e:	8d 5f 02             	lea    0x2(%edi),%ebx
 641:	8b 75 d0             	mov    -0x30(%ebp),%esi
 644:	eb 17                	jmp    65d <printint+0x79>
    x = xx;
 646:	89 c1                	mov    %eax,%ecx
  neg = 0;
 648:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 64f:	eb bc                	jmp    60d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 651:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 656:	89 f0                	mov    %esi,%eax
 658:	e8 6d ff ff ff       	call   5ca <putc>
  while(--i >= 0)
 65d:	83 eb 01             	sub    $0x1,%ebx
 660:	79 ef                	jns    651 <printint+0x6d>
}
 662:	83 c4 2c             	add    $0x2c,%esp
 665:	5b                   	pop    %ebx
 666:	5e                   	pop    %esi
 667:	5f                   	pop    %edi
 668:	5d                   	pop    %ebp
 669:	c3                   	ret    
 66a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 66d:	eb ee                	jmp    65d <printint+0x79>

0000066f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 66f:	55                   	push   %ebp
 670:	89 e5                	mov    %esp,%ebp
 672:	57                   	push   %edi
 673:	56                   	push   %esi
 674:	53                   	push   %ebx
 675:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 678:	8d 45 10             	lea    0x10(%ebp),%eax
 67b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 67e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 683:	bb 00 00 00 00       	mov    $0x0,%ebx
 688:	eb 14                	jmp    69e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 68a:	89 fa                	mov    %edi,%edx
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	e8 36 ff ff ff       	call   5ca <putc>
 694:	eb 05                	jmp    69b <printf+0x2c>
      }
    } else if(state == '%'){
 696:	83 fe 25             	cmp    $0x25,%esi
 699:	74 25                	je     6c0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 69b:	83 c3 01             	add    $0x1,%ebx
 69e:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a1:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6a5:	84 c0                	test   %al,%al
 6a7:	0f 84 20 01 00 00    	je     7cd <printf+0x15e>
    c = fmt[i] & 0xff;
 6ad:	0f be f8             	movsbl %al,%edi
 6b0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6b3:	85 f6                	test   %esi,%esi
 6b5:	75 df                	jne    696 <printf+0x27>
      if(c == '%'){
 6b7:	83 f8 25             	cmp    $0x25,%eax
 6ba:	75 ce                	jne    68a <printf+0x1b>
        state = '%';
 6bc:	89 c6                	mov    %eax,%esi
 6be:	eb db                	jmp    69b <printf+0x2c>
      if(c == 'd'){
 6c0:	83 f8 25             	cmp    $0x25,%eax
 6c3:	0f 84 cf 00 00 00    	je     798 <printf+0x129>
 6c9:	0f 8c dd 00 00 00    	jl     7ac <printf+0x13d>
 6cf:	83 f8 78             	cmp    $0x78,%eax
 6d2:	0f 8f d4 00 00 00    	jg     7ac <printf+0x13d>
 6d8:	83 f8 63             	cmp    $0x63,%eax
 6db:	0f 8c cb 00 00 00    	jl     7ac <printf+0x13d>
 6e1:	83 e8 63             	sub    $0x63,%eax
 6e4:	83 f8 15             	cmp    $0x15,%eax
 6e7:	0f 87 bf 00 00 00    	ja     7ac <printf+0x13d>
 6ed:	ff 24 85 f4 09 00 00 	jmp    *0x9f4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f7:	8b 17                	mov    (%edi),%edx
 6f9:	83 ec 0c             	sub    $0xc,%esp
 6fc:	6a 01                	push   $0x1
 6fe:	b9 0a 00 00 00       	mov    $0xa,%ecx
 703:	8b 45 08             	mov    0x8(%ebp),%eax
 706:	e8 d9 fe ff ff       	call   5e4 <printint>
        ap++;
 70b:	83 c7 04             	add    $0x4,%edi
 70e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 711:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 714:	be 00 00 00 00       	mov    $0x0,%esi
 719:	eb 80                	jmp    69b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 71b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71e:	8b 17                	mov    (%edi),%edx
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	6a 00                	push   $0x0
 725:	b9 10 00 00 00       	mov    $0x10,%ecx
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	e8 b2 fe ff ff       	call   5e4 <printint>
        ap++;
 732:	83 c7 04             	add    $0x4,%edi
 735:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 738:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73b:	be 00 00 00 00       	mov    $0x0,%esi
 740:	e9 56 ff ff ff       	jmp    69b <printf+0x2c>
        s = (char*)*ap;
 745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 748:	8b 30                	mov    (%eax),%esi
        ap++;
 74a:	83 c0 04             	add    $0x4,%eax
 74d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 750:	85 f6                	test   %esi,%esi
 752:	75 15                	jne    769 <printf+0xfa>
          s = "(null)";
 754:	be eb 09 00 00       	mov    $0x9eb,%esi
 759:	eb 0e                	jmp    769 <printf+0xfa>
          putc(fd, *s);
 75b:	0f be d2             	movsbl %dl,%edx
 75e:	8b 45 08             	mov    0x8(%ebp),%eax
 761:	e8 64 fe ff ff       	call   5ca <putc>
          s++;
 766:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 769:	0f b6 16             	movzbl (%esi),%edx
 76c:	84 d2                	test   %dl,%dl
 76e:	75 eb                	jne    75b <printf+0xec>
      state = 0;
 770:	be 00 00 00 00       	mov    $0x0,%esi
 775:	e9 21 ff ff ff       	jmp    69b <printf+0x2c>
        putc(fd, *ap);
 77a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 77d:	0f be 17             	movsbl (%edi),%edx
 780:	8b 45 08             	mov    0x8(%ebp),%eax
 783:	e8 42 fe ff ff       	call   5ca <putc>
        ap++;
 788:	83 c7 04             	add    $0x4,%edi
 78b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 78e:	be 00 00 00 00       	mov    $0x0,%esi
 793:	e9 03 ff ff ff       	jmp    69b <printf+0x2c>
        putc(fd, c);
 798:	89 fa                	mov    %edi,%edx
 79a:	8b 45 08             	mov    0x8(%ebp),%eax
 79d:	e8 28 fe ff ff       	call   5ca <putc>
      state = 0;
 7a2:	be 00 00 00 00       	mov    $0x0,%esi
 7a7:	e9 ef fe ff ff       	jmp    69b <printf+0x2c>
        putc(fd, '%');
 7ac:	ba 25 00 00 00       	mov    $0x25,%edx
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	e8 11 fe ff ff       	call   5ca <putc>
        putc(fd, c);
 7b9:	89 fa                	mov    %edi,%edx
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	e8 07 fe ff ff       	call   5ca <putc>
      state = 0;
 7c3:	be 00 00 00 00       	mov    $0x0,%esi
 7c8:	e9 ce fe ff ff       	jmp    69b <printf+0x2c>
    }
  }
}
 7cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d0:	5b                   	pop    %ebx
 7d1:	5e                   	pop    %esi
 7d2:	5f                   	pop    %edi
 7d3:	5d                   	pop    %ebp
 7d4:	c3                   	ret    

000007d5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d5:	55                   	push   %ebp
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	57                   	push   %edi
 7d9:	56                   	push   %esi
 7da:	53                   	push   %ebx
 7db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 e0 0d 00 00       	mov    0xde0,%eax
 7e6:	eb 02                	jmp    7ea <free+0x15>
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	39 c8                	cmp    %ecx,%eax
 7ec:	73 04                	jae    7f2 <free+0x1d>
 7ee:	39 08                	cmp    %ecx,(%eax)
 7f0:	77 12                	ja     804 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	39 c2                	cmp    %eax,%edx
 7f6:	77 f0                	ja     7e8 <free+0x13>
 7f8:	39 c8                	cmp    %ecx,%eax
 7fa:	72 08                	jb     804 <free+0x2f>
 7fc:	39 ca                	cmp    %ecx,%edx
 7fe:	77 04                	ja     804 <free+0x2f>
 800:	89 d0                	mov    %edx,%eax
 802:	eb e6                	jmp    7ea <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 804:	8b 73 fc             	mov    -0x4(%ebx),%esi
 807:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 80a:	8b 10                	mov    (%eax),%edx
 80c:	39 d7                	cmp    %edx,%edi
 80e:	74 19                	je     829 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 810:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 813:	8b 50 04             	mov    0x4(%eax),%edx
 816:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 819:	39 ce                	cmp    %ecx,%esi
 81b:	74 1b                	je     838 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 81d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 81f:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 824:	5b                   	pop    %ebx
 825:	5e                   	pop    %esi
 826:	5f                   	pop    %edi
 827:	5d                   	pop    %ebp
 828:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 829:	03 72 04             	add    0x4(%edx),%esi
 82c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 82f:	8b 10                	mov    (%eax),%edx
 831:	8b 12                	mov    (%edx),%edx
 833:	89 53 f8             	mov    %edx,-0x8(%ebx)
 836:	eb db                	jmp    813 <free+0x3e>
    p->s.size += bp->s.size;
 838:	03 53 fc             	add    -0x4(%ebx),%edx
 83b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 83e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 841:	89 10                	mov    %edx,(%eax)
 843:	eb da                	jmp    81f <free+0x4a>

00000845 <morecore>:

static Header*
morecore(uint nu)
{
 845:	55                   	push   %ebp
 846:	89 e5                	mov    %esp,%ebp
 848:	53                   	push   %ebx
 849:	83 ec 04             	sub    $0x4,%esp
 84c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 84e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 853:	77 05                	ja     85a <morecore+0x15>
    nu = 4096;
 855:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 85a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 861:	83 ec 0c             	sub    $0xc,%esp
 864:	50                   	push   %eax
 865:	e8 38 fd ff ff       	call   5a2 <sbrk>
  if(p == (char*)-1)
 86a:	83 c4 10             	add    $0x10,%esp
 86d:	83 f8 ff             	cmp    $0xffffffff,%eax
 870:	74 1c                	je     88e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 872:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 875:	83 c0 08             	add    $0x8,%eax
 878:	83 ec 0c             	sub    $0xc,%esp
 87b:	50                   	push   %eax
 87c:	e8 54 ff ff ff       	call   7d5 <free>
  return freep;
 881:	a1 e0 0d 00 00       	mov    0xde0,%eax
 886:	83 c4 10             	add    $0x10,%esp
}
 889:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 88c:	c9                   	leave  
 88d:	c3                   	ret    
    return 0;
 88e:	b8 00 00 00 00       	mov    $0x0,%eax
 893:	eb f4                	jmp    889 <morecore+0x44>

00000895 <malloc>:

void*
malloc(uint nbytes)
{
 895:	55                   	push   %ebp
 896:	89 e5                	mov    %esp,%ebp
 898:	53                   	push   %ebx
 899:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89c:	8b 45 08             	mov    0x8(%ebp),%eax
 89f:	8d 58 07             	lea    0x7(%eax),%ebx
 8a2:	c1 eb 03             	shr    $0x3,%ebx
 8a5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8a8:	8b 0d e0 0d 00 00    	mov    0xde0,%ecx
 8ae:	85 c9                	test   %ecx,%ecx
 8b0:	74 04                	je     8b6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b2:	8b 01                	mov    (%ecx),%eax
 8b4:	eb 4a                	jmp    900 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8b6:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 8bd:	0d 00 00 
 8c0:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 8c7:	0d 00 00 
    base.s.size = 0;
 8ca:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 8d1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8d4:	b9 e4 0d 00 00       	mov    $0xde4,%ecx
 8d9:	eb d7                	jmp    8b2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8db:	74 19                	je     8f6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8dd:	29 da                	sub    %ebx,%edx
 8df:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8e5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8e8:	89 0d e0 0d 00 00    	mov    %ecx,0xde0
      return (void*)(p + 1);
 8ee:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f4:	c9                   	leave  
 8f5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	89 11                	mov    %edx,(%ecx)
 8fa:	eb ec                	jmp    8e8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fc:	89 c1                	mov    %eax,%ecx
 8fe:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 900:	8b 50 04             	mov    0x4(%eax),%edx
 903:	39 da                	cmp    %ebx,%edx
 905:	73 d4                	jae    8db <malloc+0x46>
    if(p == freep)
 907:	39 05 e0 0d 00 00    	cmp    %eax,0xde0
 90d:	75 ed                	jne    8fc <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 90f:	89 d8                	mov    %ebx,%eax
 911:	e8 2f ff ff ff       	call   845 <morecore>
 916:	85 c0                	test   %eax,%eax
 918:	75 e2                	jne    8fc <malloc+0x67>
 91a:	eb d5                	jmp    8f1 <malloc+0x5c>
