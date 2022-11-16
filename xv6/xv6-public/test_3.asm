
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
   f:	e8 25 05 00 00       	call   539 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 23 09 00 00       	push   $0x923
  23:	68 2c 09 00 00       	push   $0x92c
  28:	6a 01                	push   $0x1
  2a:	e8 3f 06 00 00       	call   66e <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 34 09 00 00       	push   $0x934
  37:	68 50 09 00 00       	push   $0x950
  3c:	6a 01                	push   $0x1
  3e:	e8 2b 06 00 00       	call   66e <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 64 09 00 00       	push   $0x964
  4b:	6a 01                	push   $0x1
  4d:	e8 1c 06 00 00       	call   66e <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 dc 0d 00 00    	push   0xddc
  5b:	e8 e9 04 00 00       	call   549 <kill>
  60:	e8 b4 04 00 00       	call   519 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 71 09 00 00       	push   $0x971
  72:	e8 e2 04 00 00       	call   559 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 d8 0d 00 00 	lock xchg %eax,0xdd8
   exit();
  7e:	e8 96 04 00 00       	call   519 <exit>

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
  96:	e8 fe 04 00 00       	call   599 <getpid>
  9b:	a3 dc 0d 00 00       	mov    %eax,0xddc
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 e7 07 00 00       	call   894 <malloc>
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
  d7:	e8 7d 04 00 00       	call   559 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 23 09 00 00       	push   $0x923
  ef:	68 2c 09 00 00       	push   $0x92c
  f4:	6a 01                	push   $0x1
  f6:	e8 73 05 00 00       	call   66e <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 84 09 00 00       	push   $0x984
 103:	68 50 09 00 00       	push   $0x950
 108:	6a 01                	push   $0x1
 10a:	e8 5f 05 00 00       	call   66e <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 64 09 00 00       	push   $0x964
 117:	6a 01                	push   $0x1
 119:	e8 50 05 00 00       	call   66e <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 dc 0d 00 00    	push   0xddc
 127:	e8 1d 04 00 00       	call   549 <kill>
 12c:	e8 e8 03 00 00       	call   519 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 23 09 00 00       	push   $0x923
 138:	68 2c 09 00 00       	push   $0x92c
 13d:	6a 01                	push   $0x1
 13f:	e8 2a 05 00 00       	call   66e <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 76 09 00 00       	push   $0x976
 14c:	68 50 09 00 00       	push   $0x950
 151:	6a 01                	push   $0x1
 153:	e8 16 05 00 00       	call   66e <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 64 09 00 00       	push   $0x964
 160:	6a 01                	push   $0x1
 162:	e8 07 05 00 00       	call   66e <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 dc 0d 00 00    	push   0xddc
 170:	e8 d4 03 00 00       	call   549 <kill>
 175:	e8 9f 03 00 00       	call   519 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 29 04 00 00       	call   5b9 <clone>
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
 1b2:	e8 82 03 00 00       	call   539 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 23 09 00 00       	push   $0x923
 1ca:	68 2c 09 00 00       	push   $0x92c
 1cf:	6a 01                	push   $0x1
 1d1:	e8 98 04 00 00       	call   66e <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 c8 09 00 00       	push   $0x9c8
 1de:	68 50 09 00 00       	push   $0x950
 1e3:	6a 01                	push   $0x1
 1e5:	e8 84 04 00 00       	call   66e <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 64 09 00 00       	push   $0x964
 1f2:	6a 01                	push   $0x1
 1f4:	e8 75 04 00 00       	call   66e <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 dc 0d 00 00    	push   0xddc
 202:	e8 42 03 00 00       	call   549 <kill>
 207:	e8 0d 03 00 00       	call   519 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 23 09 00 00       	push   $0x923
 213:	68 2c 09 00 00       	push   $0x92c
 218:	6a 01                	push   $0x1
 21a:	e8 4f 04 00 00       	call   66e <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 8c 09 00 00       	push   $0x98c
 227:	68 50 09 00 00       	push   $0x950
 22c:	6a 01                	push   $0x1
 22e:	e8 3b 04 00 00       	call   66e <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 64 09 00 00       	push   $0x964
 23b:	6a 01                	push   $0x1
 23d:	e8 2c 04 00 00       	call   66e <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 dc 0d 00 00    	push   0xddc
 24b:	e8 f9 02 00 00       	call   549 <kill>
 250:	e8 c4 02 00 00       	call   519 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 a3 09 00 00       	push   $0x9a3
 25d:	6a 01                	push   $0x1
 25f:	e8 0a 04 00 00       	call   66e <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 52 03 00 00       	call   5c1 <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 23 09 00 00       	push   $0x923
 27d:	68 2c 09 00 00       	push   $0x92c
 282:	6a 01                	push   $0x1
 284:	e8 e5 03 00 00       	call   66e <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 b0 09 00 00       	push   $0x9b0
 291:	68 50 09 00 00       	push   $0x950
 296:	6a 01                	push   $0x1
 298:	e8 d1 03 00 00       	call   66e <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 64 09 00 00       	push   $0x964
 2a5:	6a 01                	push   $0x1
 2a7:	e8 c2 03 00 00       	call   66e <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 dc 0d 00 00    	push   0xddc
 2b5:	e8 8f 02 00 00       	call   549 <kill>
 2ba:	e8 5a 02 00 00       	call   519 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 0c 05 00 00       	call   7d4 <free>
   exit();
 2c8:	e8 4c 02 00 00       	call   519 <exit>

000002cd <strcpy>:
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
 393:	e8 99 01 00 00       	call   531 <read>
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
 3d1:	e8 83 01 00 00       	call   559 <open>
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
 3e6:	e8 86 01 00 00       	call   571 <fstat>
 3eb:	89 c6                	mov    %eax,%esi
  close(fd);
 3ed:	89 1c 24             	mov    %ebx,(%esp)
 3f0:	e8 4c 01 00 00       	call   541 <close>
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
 4be:	e8 d1 03 00 00       	call   894 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 4c3:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 4c6:	83 c4 10             	add    $0x10,%esp
 4c9:	eb 03                	jmp    4ce <thread_create+0x1b>
      stack += 1;
 4cb:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 4ce:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4d4:	75 f5                	jne    4cb <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 4d6:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4d9:	52                   	push   %edx
 4da:	ff 75 10             	push   0x10(%ebp)
 4dd:	ff 75 0c             	push   0xc(%ebp)
 4e0:	ff 75 08             	push   0x8(%ebp)
 4e3:	e8 d1 00 00 00       	call   5b9 <clone>
 
    return pid;
}
 4e8:	c9                   	leave  
 4e9:	c3                   	ret    

000004ea <thread_join>:
int 
thread_join(){
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	53                   	push   %ebx
 4ee:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 4f1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f4:	50                   	push   %eax
 4f5:	e8 c7 00 00 00       	call   5c1 <join>
 4fa:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 4fc:	83 c4 04             	add    $0x4,%esp
 4ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 502:	ff 70 fc             	push   -0x4(%eax)
 505:	e8 ca 02 00 00       	call   7d4 <free>
  return pid;
 50a:	89 d8                	mov    %ebx,%eax
 50c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50f:	c9                   	leave  
 510:	c3                   	ret    

00000511 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 511:	b8 01 00 00 00       	mov    $0x1,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <exit>:
SYSCALL(exit)
 519:	b8 02 00 00 00       	mov    $0x2,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <wait>:
SYSCALL(wait)
 521:	b8 03 00 00 00       	mov    $0x3,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <pipe>:
SYSCALL(pipe)
 529:	b8 04 00 00 00       	mov    $0x4,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <read>:
SYSCALL(read)
 531:	b8 05 00 00 00       	mov    $0x5,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <write>:
SYSCALL(write)
 539:	b8 10 00 00 00       	mov    $0x10,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <close>:
SYSCALL(close)
 541:	b8 15 00 00 00       	mov    $0x15,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <kill>:
SYSCALL(kill)
 549:	b8 06 00 00 00       	mov    $0x6,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <exec>:
SYSCALL(exec)
 551:	b8 07 00 00 00       	mov    $0x7,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <open>:
SYSCALL(open)
 559:	b8 0f 00 00 00       	mov    $0xf,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <mknod>:
SYSCALL(mknod)
 561:	b8 11 00 00 00       	mov    $0x11,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <unlink>:
SYSCALL(unlink)
 569:	b8 12 00 00 00       	mov    $0x12,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <fstat>:
SYSCALL(fstat)
 571:	b8 08 00 00 00       	mov    $0x8,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <link>:
SYSCALL(link)
 579:	b8 13 00 00 00       	mov    $0x13,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <mkdir>:
SYSCALL(mkdir)
 581:	b8 14 00 00 00       	mov    $0x14,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <chdir>:
SYSCALL(chdir)
 589:	b8 09 00 00 00       	mov    $0x9,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <dup>:
SYSCALL(dup)
 591:	b8 0a 00 00 00       	mov    $0xa,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <getpid>:
SYSCALL(getpid)
 599:	b8 0b 00 00 00       	mov    $0xb,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <sbrk>:
SYSCALL(sbrk)
 5a1:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <sleep>:
SYSCALL(sleep)
 5a9:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <uptime>:
SYSCALL(uptime)
 5b1:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <clone>:
SYSCALL(clone)
 5b9:	b8 16 00 00 00       	mov    $0x16,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <join>:
SYSCALL(join)
 5c1:	b8 17 00 00 00       	mov    $0x17,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5c9:	55                   	push   %ebp
 5ca:	89 e5                	mov    %esp,%ebp
 5cc:	83 ec 1c             	sub    $0x1c,%esp
 5cf:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5d2:	6a 01                	push   $0x1
 5d4:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5d7:	52                   	push   %edx
 5d8:	50                   	push   %eax
 5d9:	e8 5b ff ff ff       	call   539 <write>
}
 5de:	83 c4 10             	add    $0x10,%esp
 5e1:	c9                   	leave  
 5e2:	c3                   	ret    

000005e3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e3:	55                   	push   %ebp
 5e4:	89 e5                	mov    %esp,%ebp
 5e6:	57                   	push   %edi
 5e7:	56                   	push   %esi
 5e8:	53                   	push   %ebx
 5e9:	83 ec 2c             	sub    $0x2c,%esp
 5ec:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ef:	89 d0                	mov    %edx,%eax
 5f1:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5f3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5f7:	0f 95 c1             	setne  %cl
 5fa:	c1 ea 1f             	shr    $0x1f,%edx
 5fd:	84 d1                	test   %dl,%cl
 5ff:	74 44                	je     645 <printint+0x62>
    neg = 1;
    x = -xx;
 601:	f7 d8                	neg    %eax
 603:	89 c1                	mov    %eax,%ecx
    neg = 1;
 605:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 60c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 611:	89 c8                	mov    %ecx,%eax
 613:	ba 00 00 00 00       	mov    $0x0,%edx
 618:	f7 f6                	div    %esi
 61a:	89 df                	mov    %ebx,%edi
 61c:	83 c3 01             	add    $0x1,%ebx
 61f:	0f b6 92 4c 0a 00 00 	movzbl 0xa4c(%edx),%edx
 626:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 62a:	89 ca                	mov    %ecx,%edx
 62c:	89 c1                	mov    %eax,%ecx
 62e:	39 d6                	cmp    %edx,%esi
 630:	76 df                	jbe    611 <printint+0x2e>
  if(neg)
 632:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 636:	74 31                	je     669 <printint+0x86>
    buf[i++] = '-';
 638:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 63d:	8d 5f 02             	lea    0x2(%edi),%ebx
 640:	8b 75 d0             	mov    -0x30(%ebp),%esi
 643:	eb 17                	jmp    65c <printint+0x79>
    x = xx;
 645:	89 c1                	mov    %eax,%ecx
  neg = 0;
 647:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 64e:	eb bc                	jmp    60c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 650:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 655:	89 f0                	mov    %esi,%eax
 657:	e8 6d ff ff ff       	call   5c9 <putc>
  while(--i >= 0)
 65c:	83 eb 01             	sub    $0x1,%ebx
 65f:	79 ef                	jns    650 <printint+0x6d>
}
 661:	83 c4 2c             	add    $0x2c,%esp
 664:	5b                   	pop    %ebx
 665:	5e                   	pop    %esi
 666:	5f                   	pop    %edi
 667:	5d                   	pop    %ebp
 668:	c3                   	ret    
 669:	8b 75 d0             	mov    -0x30(%ebp),%esi
 66c:	eb ee                	jmp    65c <printint+0x79>

0000066e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 66e:	55                   	push   %ebp
 66f:	89 e5                	mov    %esp,%ebp
 671:	57                   	push   %edi
 672:	56                   	push   %esi
 673:	53                   	push   %ebx
 674:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 677:	8d 45 10             	lea    0x10(%ebp),%eax
 67a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 67d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 682:	bb 00 00 00 00       	mov    $0x0,%ebx
 687:	eb 14                	jmp    69d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 689:	89 fa                	mov    %edi,%edx
 68b:	8b 45 08             	mov    0x8(%ebp),%eax
 68e:	e8 36 ff ff ff       	call   5c9 <putc>
 693:	eb 05                	jmp    69a <printf+0x2c>
      }
    } else if(state == '%'){
 695:	83 fe 25             	cmp    $0x25,%esi
 698:	74 25                	je     6bf <printf+0x51>
  for(i = 0; fmt[i]; i++){
 69a:	83 c3 01             	add    $0x1,%ebx
 69d:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a0:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6a4:	84 c0                	test   %al,%al
 6a6:	0f 84 20 01 00 00    	je     7cc <printf+0x15e>
    c = fmt[i] & 0xff;
 6ac:	0f be f8             	movsbl %al,%edi
 6af:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6b2:	85 f6                	test   %esi,%esi
 6b4:	75 df                	jne    695 <printf+0x27>
      if(c == '%'){
 6b6:	83 f8 25             	cmp    $0x25,%eax
 6b9:	75 ce                	jne    689 <printf+0x1b>
        state = '%';
 6bb:	89 c6                	mov    %eax,%esi
 6bd:	eb db                	jmp    69a <printf+0x2c>
      if(c == 'd'){
 6bf:	83 f8 25             	cmp    $0x25,%eax
 6c2:	0f 84 cf 00 00 00    	je     797 <printf+0x129>
 6c8:	0f 8c dd 00 00 00    	jl     7ab <printf+0x13d>
 6ce:	83 f8 78             	cmp    $0x78,%eax
 6d1:	0f 8f d4 00 00 00    	jg     7ab <printf+0x13d>
 6d7:	83 f8 63             	cmp    $0x63,%eax
 6da:	0f 8c cb 00 00 00    	jl     7ab <printf+0x13d>
 6e0:	83 e8 63             	sub    $0x63,%eax
 6e3:	83 f8 15             	cmp    $0x15,%eax
 6e6:	0f 87 bf 00 00 00    	ja     7ab <printf+0x13d>
 6ec:	ff 24 85 f4 09 00 00 	jmp    *0x9f4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f6:	8b 17                	mov    (%edi),%edx
 6f8:	83 ec 0c             	sub    $0xc,%esp
 6fb:	6a 01                	push   $0x1
 6fd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 702:	8b 45 08             	mov    0x8(%ebp),%eax
 705:	e8 d9 fe ff ff       	call   5e3 <printint>
        ap++;
 70a:	83 c7 04             	add    $0x4,%edi
 70d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 710:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 713:	be 00 00 00 00       	mov    $0x0,%esi
 718:	eb 80                	jmp    69a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 71a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71d:	8b 17                	mov    (%edi),%edx
 71f:	83 ec 0c             	sub    $0xc,%esp
 722:	6a 00                	push   $0x0
 724:	b9 10 00 00 00       	mov    $0x10,%ecx
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	e8 b2 fe ff ff       	call   5e3 <printint>
        ap++;
 731:	83 c7 04             	add    $0x4,%edi
 734:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 737:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73a:	be 00 00 00 00       	mov    $0x0,%esi
 73f:	e9 56 ff ff ff       	jmp    69a <printf+0x2c>
        s = (char*)*ap;
 744:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 747:	8b 30                	mov    (%eax),%esi
        ap++;
 749:	83 c0 04             	add    $0x4,%eax
 74c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 74f:	85 f6                	test   %esi,%esi
 751:	75 15                	jne    768 <printf+0xfa>
          s = "(null)";
 753:	be eb 09 00 00       	mov    $0x9eb,%esi
 758:	eb 0e                	jmp    768 <printf+0xfa>
          putc(fd, *s);
 75a:	0f be d2             	movsbl %dl,%edx
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	e8 64 fe ff ff       	call   5c9 <putc>
          s++;
 765:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 768:	0f b6 16             	movzbl (%esi),%edx
 76b:	84 d2                	test   %dl,%dl
 76d:	75 eb                	jne    75a <printf+0xec>
      state = 0;
 76f:	be 00 00 00 00       	mov    $0x0,%esi
 774:	e9 21 ff ff ff       	jmp    69a <printf+0x2c>
        putc(fd, *ap);
 779:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 77c:	0f be 17             	movsbl (%edi),%edx
 77f:	8b 45 08             	mov    0x8(%ebp),%eax
 782:	e8 42 fe ff ff       	call   5c9 <putc>
        ap++;
 787:	83 c7 04             	add    $0x4,%edi
 78a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 78d:	be 00 00 00 00       	mov    $0x0,%esi
 792:	e9 03 ff ff ff       	jmp    69a <printf+0x2c>
        putc(fd, c);
 797:	89 fa                	mov    %edi,%edx
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	e8 28 fe ff ff       	call   5c9 <putc>
      state = 0;
 7a1:	be 00 00 00 00       	mov    $0x0,%esi
 7a6:	e9 ef fe ff ff       	jmp    69a <printf+0x2c>
        putc(fd, '%');
 7ab:	ba 25 00 00 00       	mov    $0x25,%edx
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	e8 11 fe ff ff       	call   5c9 <putc>
        putc(fd, c);
 7b8:	89 fa                	mov    %edi,%edx
 7ba:	8b 45 08             	mov    0x8(%ebp),%eax
 7bd:	e8 07 fe ff ff       	call   5c9 <putc>
      state = 0;
 7c2:	be 00 00 00 00       	mov    $0x0,%esi
 7c7:	e9 ce fe ff ff       	jmp    69a <printf+0x2c>
    }
  }
}
 7cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cf:	5b                   	pop    %ebx
 7d0:	5e                   	pop    %esi
 7d1:	5f                   	pop    %edi
 7d2:	5d                   	pop    %ebp
 7d3:	c3                   	ret    

000007d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d4:	55                   	push   %ebp
 7d5:	89 e5                	mov    %esp,%ebp
 7d7:	57                   	push   %edi
 7d8:	56                   	push   %esi
 7d9:	53                   	push   %ebx
 7da:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7dd:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e0:	a1 e0 0d 00 00       	mov    0xde0,%eax
 7e5:	eb 02                	jmp    7e9 <free+0x15>
 7e7:	89 d0                	mov    %edx,%eax
 7e9:	39 c8                	cmp    %ecx,%eax
 7eb:	73 04                	jae    7f1 <free+0x1d>
 7ed:	39 08                	cmp    %ecx,(%eax)
 7ef:	77 12                	ja     803 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f1:	8b 10                	mov    (%eax),%edx
 7f3:	39 c2                	cmp    %eax,%edx
 7f5:	77 f0                	ja     7e7 <free+0x13>
 7f7:	39 c8                	cmp    %ecx,%eax
 7f9:	72 08                	jb     803 <free+0x2f>
 7fb:	39 ca                	cmp    %ecx,%edx
 7fd:	77 04                	ja     803 <free+0x2f>
 7ff:	89 d0                	mov    %edx,%eax
 801:	eb e6                	jmp    7e9 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 803:	8b 73 fc             	mov    -0x4(%ebx),%esi
 806:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 809:	8b 10                	mov    (%eax),%edx
 80b:	39 d7                	cmp    %edx,%edi
 80d:	74 19                	je     828 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 80f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 812:	8b 50 04             	mov    0x4(%eax),%edx
 815:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 818:	39 ce                	cmp    %ecx,%esi
 81a:	74 1b                	je     837 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 81c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 81e:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 823:	5b                   	pop    %ebx
 824:	5e                   	pop    %esi
 825:	5f                   	pop    %edi
 826:	5d                   	pop    %ebp
 827:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 828:	03 72 04             	add    0x4(%edx),%esi
 82b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 82e:	8b 10                	mov    (%eax),%edx
 830:	8b 12                	mov    (%edx),%edx
 832:	89 53 f8             	mov    %edx,-0x8(%ebx)
 835:	eb db                	jmp    812 <free+0x3e>
    p->s.size += bp->s.size;
 837:	03 53 fc             	add    -0x4(%ebx),%edx
 83a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 83d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 840:	89 10                	mov    %edx,(%eax)
 842:	eb da                	jmp    81e <free+0x4a>

00000844 <morecore>:

static Header*
morecore(uint nu)
{
 844:	55                   	push   %ebp
 845:	89 e5                	mov    %esp,%ebp
 847:	53                   	push   %ebx
 848:	83 ec 04             	sub    $0x4,%esp
 84b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 84d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 852:	77 05                	ja     859 <morecore+0x15>
    nu = 4096;
 854:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 859:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	50                   	push   %eax
 864:	e8 38 fd ff ff       	call   5a1 <sbrk>
  if(p == (char*)-1)
 869:	83 c4 10             	add    $0x10,%esp
 86c:	83 f8 ff             	cmp    $0xffffffff,%eax
 86f:	74 1c                	je     88d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 871:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 874:	83 c0 08             	add    $0x8,%eax
 877:	83 ec 0c             	sub    $0xc,%esp
 87a:	50                   	push   %eax
 87b:	e8 54 ff ff ff       	call   7d4 <free>
  return freep;
 880:	a1 e0 0d 00 00       	mov    0xde0,%eax
 885:	83 c4 10             	add    $0x10,%esp
}
 888:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 88b:	c9                   	leave  
 88c:	c3                   	ret    
    return 0;
 88d:	b8 00 00 00 00       	mov    $0x0,%eax
 892:	eb f4                	jmp    888 <morecore+0x44>

00000894 <malloc>:

void*
malloc(uint nbytes)
{
 894:	55                   	push   %ebp
 895:	89 e5                	mov    %esp,%ebp
 897:	53                   	push   %ebx
 898:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89b:	8b 45 08             	mov    0x8(%ebp),%eax
 89e:	8d 58 07             	lea    0x7(%eax),%ebx
 8a1:	c1 eb 03             	shr    $0x3,%ebx
 8a4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8a7:	8b 0d e0 0d 00 00    	mov    0xde0,%ecx
 8ad:	85 c9                	test   %ecx,%ecx
 8af:	74 04                	je     8b5 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b1:	8b 01                	mov    (%ecx),%eax
 8b3:	eb 4a                	jmp    8ff <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8b5:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 8bc:	0d 00 00 
 8bf:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 8c6:	0d 00 00 
    base.s.size = 0;
 8c9:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 8d0:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8d3:	b9 e4 0d 00 00       	mov    $0xde4,%ecx
 8d8:	eb d7                	jmp    8b1 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8da:	74 19                	je     8f5 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8dc:	29 da                	sub    %ebx,%edx
 8de:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e1:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8e4:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8e7:	89 0d e0 0d 00 00    	mov    %ecx,0xde0
      return (void*)(p + 1);
 8ed:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f3:	c9                   	leave  
 8f4:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8f5:	8b 10                	mov    (%eax),%edx
 8f7:	89 11                	mov    %edx,(%ecx)
 8f9:	eb ec                	jmp    8e7 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fb:	89 c1                	mov    %eax,%ecx
 8fd:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ff:	8b 50 04             	mov    0x4(%eax),%edx
 902:	39 da                	cmp    %ebx,%edx
 904:	73 d4                	jae    8da <malloc+0x46>
    if(p == freep)
 906:	39 05 e0 0d 00 00    	cmp    %eax,0xde0
 90c:	75 ed                	jne    8fb <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 90e:	89 d8                	mov    %ebx,%eax
 910:	e8 2f ff ff ff       	call   844 <morecore>
 915:	85 c0                	test   %eax,%eax
 917:	75 e2                	jne    8fb <malloc+0x67>
 919:	eb d5                	jmp    8f0 <malloc+0x5c>
