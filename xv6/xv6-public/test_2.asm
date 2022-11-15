
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	8b 55 08             	mov    0x8(%ebp),%edx
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
   d:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
   f:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  11:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  17:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  1d:	a1 78 0d 00 00       	mov    0xd78,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 fc 08 00 00       	push   $0x8fc
  2e:	68 05 09 00 00       	push   $0x905
  33:	6a 01                	push   $0x1
  35:	e8 13 06 00 00       	call   64d <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 0d 09 00 00       	push   $0x90d
  42:	68 19 09 00 00       	push   $0x919
  47:	6a 01                	push   $0x1
  49:	e8 ff 05 00 00       	call   64d <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 2d 09 00 00       	push   $0x92d
  56:	6a 01                	push   $0x1
  58:	e8 f0 05 00 00       	call   64d <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 84 0d 00 00    	push   0xd84
  66:	e8 bd 04 00 00       	call   528 <kill>
  6b:	e8 88 04 00 00       	call   4f8 <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d 78 0d 00 00    	mov    %ecx,0xd78
   exit();
  78:	e8 7b 04 00 00       	call   4f8 <exit>

0000007d <main>:
{
  7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  81:	83 e4 f0             	and    $0xfffffff0,%esp
  84:	ff 71 fc             	push   -0x4(%ecx)
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	56                   	push   %esi
  8b:	53                   	push   %ebx
  8c:	51                   	push   %ecx
  8d:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  90:	e8 e3 04 00 00       	call   578 <getpid>
  95:	a3 84 0d 00 00       	mov    %eax,0xd84
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 cc 07 00 00       	call   873 <malloc>
   assert(p != NULL);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 84 a6 00 00 00    	je     158 <main+0xdb>
  b2:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b4:	89 c2                	mov    %eax,%edx
  b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  bc:	74 09                	je     c7 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  be:	b8 00 10 00 00       	mov    $0x1000,%eax
  c3:	29 d0                	sub    %edx,%eax
  c5:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  c7:	50                   	push   %eax
  c8:	68 7c 0d 00 00       	push   $0xd7c
  cd:	68 80 0d 00 00       	push   $0xd80
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 bc 04 00 00       	call   598 <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 78 0d 00 00       	mov    0xd78,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 80 0d 00 00       	mov    0xd80,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 7c 0d 00 00       	mov    0xd7c,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 fc 08 00 00       	push   $0x8fc
 116:	68 05 09 00 00       	push   $0x905
 11b:	6a 01                	push   $0x1
 11d:	e8 2b 05 00 00       	call   64d <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 5d 09 00 00       	push   $0x95d
 12a:	68 19 09 00 00       	push   $0x919
 12f:	6a 01                	push   $0x1
 131:	e8 17 05 00 00       	call   64d <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 2d 09 00 00       	push   $0x92d
 13e:	6a 01                	push   $0x1
 140:	e8 08 05 00 00       	call   64d <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 84 0d 00 00    	push   0xd84
 14e:	e8 d5 03 00 00       	call   528 <kill>
 153:	e8 a0 03 00 00       	call   4f8 <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 fc 08 00 00       	push   $0x8fc
 15f:	68 05 09 00 00       	push   $0x905
 164:	6a 01                	push   $0x1
 166:	e8 e2 04 00 00       	call   64d <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 3a 09 00 00       	push   $0x93a
 173:	68 19 09 00 00       	push   $0x919
 178:	6a 01                	push   $0x1
 17a:	e8 ce 04 00 00       	call   64d <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 2d 09 00 00       	push   $0x92d
 187:	6a 01                	push   $0x1
 189:	e8 bf 04 00 00       	call   64d <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 84 0d 00 00    	push   0xd84
 197:	e8 8c 03 00 00       	call   528 <kill>
 19c:	e8 57 03 00 00       	call   4f8 <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 fc 08 00 00       	push   $0x8fc
 1a8:	68 05 09 00 00       	push   $0x905
 1ad:	6a 01                	push   $0x1
 1af:	e8 99 04 00 00       	call   64d <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 44 09 00 00       	push   $0x944
 1bc:	68 19 09 00 00       	push   $0x919
 1c1:	6a 01                	push   $0x1
 1c3:	e8 85 04 00 00       	call   64d <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 2d 09 00 00       	push   $0x92d
 1d0:	6a 01                	push   $0x1
 1d2:	e8 76 04 00 00       	call   64d <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 84 0d 00 00    	push   0xd84
 1e0:	e8 43 03 00 00       	call   528 <kill>
 1e5:	e8 0e 03 00 00       	call   4f8 <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 fc 08 00 00       	push   $0x8fc
 1f1:	68 05 09 00 00       	push   $0x905
 1f6:	6a 01                	push   $0x1
 1f8:	e8 50 04 00 00       	call   64d <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 52 09 00 00       	push   $0x952
 205:	68 19 09 00 00       	push   $0x919
 20a:	6a 01                	push   $0x1
 20c:	e8 3c 04 00 00       	call   64d <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 2d 09 00 00       	push   $0x92d
 219:	6a 01                	push   $0x1
 21b:	e8 2d 04 00 00       	call   64d <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 84 0d 00 00    	push   0xd84
 229:	e8 fa 02 00 00       	call   528 <kill>
 22e:	e8 c5 02 00 00       	call   4f8 <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 68 09 00 00       	push   $0x968
 23b:	6a 01                	push   $0x1
 23d:	e8 0b 04 00 00       	call   64d <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 53 03 00 00       	call   5a0 <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 fc 08 00 00       	push   $0x8fc
 25b:	68 05 09 00 00       	push   $0x905
 260:	6a 01                	push   $0x1
 262:	e8 e6 03 00 00       	call   64d <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 75 09 00 00       	push   $0x975
 26f:	68 19 09 00 00       	push   $0x919
 274:	6a 01                	push   $0x1
 276:	e8 d2 03 00 00       	call   64d <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 2d 09 00 00       	push   $0x92d
 283:	6a 01                	push   $0x1
 285:	e8 c3 03 00 00       	call   64d <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 84 0d 00 00    	push   0xd84
 293:	e8 90 02 00 00       	call   528 <kill>
 298:	e8 5b 02 00 00       	call   4f8 <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 0d 05 00 00       	call   7b3 <free>
   exit();
 2a6:	e8 4d 02 00 00       	call   4f8 <exit>

000002ab <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	56                   	push   %esi
 2af:	53                   	push   %ebx
 2b0:	8b 75 08             	mov    0x8(%ebp),%esi
 2b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b6:	89 f0                	mov    %esi,%eax
 2b8:	89 d1                	mov    %edx,%ecx
 2ba:	83 c2 01             	add    $0x1,%edx
 2bd:	89 c3                	mov    %eax,%ebx
 2bf:	83 c0 01             	add    $0x1,%eax
 2c2:	0f b6 09             	movzbl (%ecx),%ecx
 2c5:	88 0b                	mov    %cl,(%ebx)
 2c7:	84 c9                	test   %cl,%cl
 2c9:	75 ed                	jne    2b8 <strcpy+0xd>
    ;
  return os;
}
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    

000002d1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2da:	eb 06                	jmp    2e2 <strcmp+0x11>
    p++, q++;
 2dc:	83 c1 01             	add    $0x1,%ecx
 2df:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2e2:	0f b6 01             	movzbl (%ecx),%eax
 2e5:	84 c0                	test   %al,%al
 2e7:	74 04                	je     2ed <strcmp+0x1c>
 2e9:	3a 02                	cmp    (%edx),%al
 2eb:	74 ef                	je     2dc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2ed:	0f b6 c0             	movzbl %al,%eax
 2f0:	0f b6 12             	movzbl (%edx),%edx
 2f3:	29 d0                	sub    %edx,%eax
}
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    

000002f7 <strlen>:

uint
strlen(const char *s)
{
 2f7:	55                   	push   %ebp
 2f8:	89 e5                	mov    %esp,%ebp
 2fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2fd:	b8 00 00 00 00       	mov    $0x0,%eax
 302:	eb 03                	jmp    307 <strlen+0x10>
 304:	83 c0 01             	add    $0x1,%eax
 307:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 30b:	75 f7                	jne    304 <strlen+0xd>
    ;
  return n;
}
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <memset>:

void*
memset(void *dst, int c, uint n)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	57                   	push   %edi
 313:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 316:	89 d7                	mov    %edx,%edi
 318:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31b:	8b 45 0c             	mov    0xc(%ebp),%eax
 31e:	fc                   	cld    
 31f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 321:	89 d0                	mov    %edx,%eax
 323:	8b 7d fc             	mov    -0x4(%ebp),%edi
 326:	c9                   	leave  
 327:	c3                   	ret    

00000328 <strchr>:

char*
strchr(const char *s, char c)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 332:	eb 03                	jmp    337 <strchr+0xf>
 334:	83 c0 01             	add    $0x1,%eax
 337:	0f b6 10             	movzbl (%eax),%edx
 33a:	84 d2                	test   %dl,%dl
 33c:	74 06                	je     344 <strchr+0x1c>
    if(*s == c)
 33e:	38 ca                	cmp    %cl,%dl
 340:	75 f2                	jne    334 <strchr+0xc>
 342:	eb 05                	jmp    349 <strchr+0x21>
      return (char*)s;
  return 0;
 344:	b8 00 00 00 00       	mov    $0x0,%eax
}
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    

0000034b <gets>:

char*
gets(char *buf, int max)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	57                   	push   %edi
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	83 ec 1c             	sub    $0x1c,%esp
 354:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 357:	bb 00 00 00 00       	mov    $0x0,%ebx
 35c:	89 de                	mov    %ebx,%esi
 35e:	83 c3 01             	add    $0x1,%ebx
 361:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 364:	7d 2e                	jge    394 <gets+0x49>
    cc = read(0, &c, 1);
 366:	83 ec 04             	sub    $0x4,%esp
 369:	6a 01                	push   $0x1
 36b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 36e:	50                   	push   %eax
 36f:	6a 00                	push   $0x0
 371:	e8 9a 01 00 00       	call   510 <read>
    if(cc < 1)
 376:	83 c4 10             	add    $0x10,%esp
 379:	85 c0                	test   %eax,%eax
 37b:	7e 17                	jle    394 <gets+0x49>
      break;
    buf[i++] = c;
 37d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 381:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 384:	3c 0a                	cmp    $0xa,%al
 386:	0f 94 c2             	sete   %dl
 389:	3c 0d                	cmp    $0xd,%al
 38b:	0f 94 c0             	sete   %al
 38e:	08 c2                	or     %al,%dl
 390:	74 ca                	je     35c <gets+0x11>
    buf[i++] = c;
 392:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 394:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 398:	89 f8                	mov    %edi,%eax
 39a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39d:	5b                   	pop    %ebx
 39e:	5e                   	pop    %esi
 39f:	5f                   	pop    %edi
 3a0:	5d                   	pop    %ebp
 3a1:	c3                   	ret    

000003a2 <stat>:

int
stat(const char *n, struct stat *st)
{
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	56                   	push   %esi
 3a6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a7:	83 ec 08             	sub    $0x8,%esp
 3aa:	6a 00                	push   $0x0
 3ac:	ff 75 08             	push   0x8(%ebp)
 3af:	e8 84 01 00 00       	call   538 <open>
  if(fd < 0)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	78 24                	js     3df <stat+0x3d>
 3bb:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3bd:	83 ec 08             	sub    $0x8,%esp
 3c0:	ff 75 0c             	push   0xc(%ebp)
 3c3:	50                   	push   %eax
 3c4:	e8 87 01 00 00       	call   550 <fstat>
 3c9:	89 c6                	mov    %eax,%esi
  close(fd);
 3cb:	89 1c 24             	mov    %ebx,(%esp)
 3ce:	e8 4d 01 00 00       	call   520 <close>
  return r;
 3d3:	83 c4 10             	add    $0x10,%esp
}
 3d6:	89 f0                	mov    %esi,%eax
 3d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
    return -1;
 3df:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e4:	eb f0                	jmp    3d6 <stat+0x34>

000003e6 <atoi>:

int
atoi(const char *s)
{
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	53                   	push   %ebx
 3ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3ed:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3f2:	eb 10                	jmp    404 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3f4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3f7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3fa:	83 c1 01             	add    $0x1,%ecx
 3fd:	0f be c0             	movsbl %al,%eax
 400:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 404:	0f b6 01             	movzbl (%ecx),%eax
 407:	8d 58 d0             	lea    -0x30(%eax),%ebx
 40a:	80 fb 09             	cmp    $0x9,%bl
 40d:	76 e5                	jbe    3f4 <atoi+0xe>
  return n;
}
 40f:	89 d0                	mov    %edx,%eax
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	56                   	push   %esi
 41a:	53                   	push   %ebx
 41b:	8b 75 08             	mov    0x8(%ebp),%esi
 41e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 421:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 424:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 426:	eb 0d                	jmp    435 <memmove+0x1f>
    *dst++ = *src++;
 428:	0f b6 01             	movzbl (%ecx),%eax
 42b:	88 02                	mov    %al,(%edx)
 42d:	8d 49 01             	lea    0x1(%ecx),%ecx
 430:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 58 ff             	lea    -0x1(%eax),%ebx
 438:	85 c0                	test   %eax,%eax
 43a:	7f ec                	jg     428 <memmove+0x12>
  return vdst;
}
 43c:	89 f0                	mov    %esi,%eax
 43e:	5b                   	pop    %ebx
 43f:	5e                   	pop    %esi
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    

00000442 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 448:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 44a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 44d:	89 08                	mov    %ecx,(%eax)
  return old;
}
 44f:	89 d0                	mov    %edx,%eax
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    

00000453 <lock_init>:
void 
lock_init(lock_t *lock){
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    

00000461 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	53                   	push   %ebx
 465:	83 ec 04             	sub    $0x4,%esp
 468:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 46b:	83 ec 08             	sub    $0x8,%esp
 46e:	6a 01                	push   $0x1
 470:	53                   	push   %ebx
 471:	e8 cc ff ff ff       	call   442 <TestAndSet>
 476:	83 c4 10             	add    $0x10,%esp
 479:	83 f8 01             	cmp    $0x1,%eax
 47c:	74 ed                	je     46b <lock_acquire+0xa>
    ;
}
 47e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 481:	c9                   	leave  
 482:	c3                   	ret    

00000483 <lock_release>:
void 
lock_release(lock_t *lock){
 483:	55                   	push   %ebp
 484:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    

00000491 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 497:	68 04 20 00 00       	push   $0x2004
 49c:	e8 d2 03 00 00       	call   873 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 4a1:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 4a4:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 4a6:	eb 03                	jmp    4ab <thread_create+0x1a>
      stack += 1;
 4a8:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 4ab:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4b1:	75 f5                	jne    4a8 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 4b3:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 4b5:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4b8:	52                   	push   %edx
 4b9:	ff 75 10             	push   0x10(%ebp)
 4bc:	ff 75 0c             	push   0xc(%ebp)
 4bf:	ff 75 08             	push   0x8(%ebp)
 4c2:	e8 d1 00 00 00       	call   598 <clone>
 
    return pid;
}
 4c7:	c9                   	leave  
 4c8:	c3                   	ret    

000004c9 <thread_join>:
int 
thread_join(){
 4c9:	55                   	push   %ebp
 4ca:	89 e5                	mov    %esp,%ebp
 4cc:	53                   	push   %ebx
 4cd:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 4d0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4d3:	50                   	push   %eax
 4d4:	e8 c7 00 00 00       	call   5a0 <join>
 4d9:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 4db:	83 c4 04             	add    $0x4,%esp
 4de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e1:	ff 70 fc             	push   -0x4(%eax)
 4e4:	e8 ca 02 00 00       	call   7b3 <free>
  return waitedForPID;
 4e9:	89 d8                	mov    %ebx,%eax
 4eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ee:	c9                   	leave  
 4ef:	c3                   	ret    

000004f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4f0:	b8 01 00 00 00       	mov    $0x1,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <exit>:
SYSCALL(exit)
 4f8:	b8 02 00 00 00       	mov    $0x2,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <wait>:
SYSCALL(wait)
 500:	b8 03 00 00 00       	mov    $0x3,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <pipe>:
SYSCALL(pipe)
 508:	b8 04 00 00 00       	mov    $0x4,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <read>:
SYSCALL(read)
 510:	b8 05 00 00 00       	mov    $0x5,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <write>:
SYSCALL(write)
 518:	b8 10 00 00 00       	mov    $0x10,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <close>:
SYSCALL(close)
 520:	b8 15 00 00 00       	mov    $0x15,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <kill>:
SYSCALL(kill)
 528:	b8 06 00 00 00       	mov    $0x6,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <exec>:
SYSCALL(exec)
 530:	b8 07 00 00 00       	mov    $0x7,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <open>:
SYSCALL(open)
 538:	b8 0f 00 00 00       	mov    $0xf,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <mknod>:
SYSCALL(mknod)
 540:	b8 11 00 00 00       	mov    $0x11,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <unlink>:
SYSCALL(unlink)
 548:	b8 12 00 00 00       	mov    $0x12,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <fstat>:
SYSCALL(fstat)
 550:	b8 08 00 00 00       	mov    $0x8,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <link>:
SYSCALL(link)
 558:	b8 13 00 00 00       	mov    $0x13,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <mkdir>:
SYSCALL(mkdir)
 560:	b8 14 00 00 00       	mov    $0x14,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <chdir>:
SYSCALL(chdir)
 568:	b8 09 00 00 00       	mov    $0x9,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <dup>:
SYSCALL(dup)
 570:	b8 0a 00 00 00       	mov    $0xa,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <getpid>:
SYSCALL(getpid)
 578:	b8 0b 00 00 00       	mov    $0xb,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <sbrk>:
SYSCALL(sbrk)
 580:	b8 0c 00 00 00       	mov    $0xc,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <sleep>:
SYSCALL(sleep)
 588:	b8 0d 00 00 00       	mov    $0xd,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <uptime>:
SYSCALL(uptime)
 590:	b8 0e 00 00 00       	mov    $0xe,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <clone>:
SYSCALL(clone)
 598:	b8 16 00 00 00       	mov    $0x16,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <join>:
SYSCALL(join)
 5a0:	b8 17 00 00 00       	mov    $0x17,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a8:	55                   	push   %ebp
 5a9:	89 e5                	mov    %esp,%ebp
 5ab:	83 ec 1c             	sub    $0x1c,%esp
 5ae:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5b1:	6a 01                	push   $0x1
 5b3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5b6:	52                   	push   %edx
 5b7:	50                   	push   %eax
 5b8:	e8 5b ff ff ff       	call   518 <write>
}
 5bd:	83 c4 10             	add    $0x10,%esp
 5c0:	c9                   	leave  
 5c1:	c3                   	ret    

000005c2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c2:	55                   	push   %ebp
 5c3:	89 e5                	mov    %esp,%ebp
 5c5:	57                   	push   %edi
 5c6:	56                   	push   %esi
 5c7:	53                   	push   %ebx
 5c8:	83 ec 2c             	sub    $0x2c,%esp
 5cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5ce:	89 d0                	mov    %edx,%eax
 5d0:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d6:	0f 95 c1             	setne  %cl
 5d9:	c1 ea 1f             	shr    $0x1f,%edx
 5dc:	84 d1                	test   %dl,%cl
 5de:	74 44                	je     624 <printint+0x62>
    neg = 1;
    x = -xx;
 5e0:	f7 d8                	neg    %eax
 5e2:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5e4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5eb:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5f0:	89 c8                	mov    %ecx,%eax
 5f2:	ba 00 00 00 00       	mov    $0x0,%edx
 5f7:	f7 f6                	div    %esi
 5f9:	89 df                	mov    %ebx,%edi
 5fb:	83 c3 01             	add    $0x1,%ebx
 5fe:	0f b6 92 ec 09 00 00 	movzbl 0x9ec(%edx),%edx
 605:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 609:	89 ca                	mov    %ecx,%edx
 60b:	89 c1                	mov    %eax,%ecx
 60d:	39 d6                	cmp    %edx,%esi
 60f:	76 df                	jbe    5f0 <printint+0x2e>
  if(neg)
 611:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 615:	74 31                	je     648 <printint+0x86>
    buf[i++] = '-';
 617:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 61c:	8d 5f 02             	lea    0x2(%edi),%ebx
 61f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 622:	eb 17                	jmp    63b <printint+0x79>
    x = xx;
 624:	89 c1                	mov    %eax,%ecx
  neg = 0;
 626:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 62d:	eb bc                	jmp    5eb <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 62f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 634:	89 f0                	mov    %esi,%eax
 636:	e8 6d ff ff ff       	call   5a8 <putc>
  while(--i >= 0)
 63b:	83 eb 01             	sub    $0x1,%ebx
 63e:	79 ef                	jns    62f <printint+0x6d>
}
 640:	83 c4 2c             	add    $0x2c,%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
 648:	8b 75 d0             	mov    -0x30(%ebp),%esi
 64b:	eb ee                	jmp    63b <printint+0x79>

0000064d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	57                   	push   %edi
 651:	56                   	push   %esi
 652:	53                   	push   %ebx
 653:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 656:	8d 45 10             	lea    0x10(%ebp),%eax
 659:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 65c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 661:	bb 00 00 00 00       	mov    $0x0,%ebx
 666:	eb 14                	jmp    67c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 668:	89 fa                	mov    %edi,%edx
 66a:	8b 45 08             	mov    0x8(%ebp),%eax
 66d:	e8 36 ff ff ff       	call   5a8 <putc>
 672:	eb 05                	jmp    679 <printf+0x2c>
      }
    } else if(state == '%'){
 674:	83 fe 25             	cmp    $0x25,%esi
 677:	74 25                	je     69e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 679:	83 c3 01             	add    $0x1,%ebx
 67c:	8b 45 0c             	mov    0xc(%ebp),%eax
 67f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 683:	84 c0                	test   %al,%al
 685:	0f 84 20 01 00 00    	je     7ab <printf+0x15e>
    c = fmt[i] & 0xff;
 68b:	0f be f8             	movsbl %al,%edi
 68e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 691:	85 f6                	test   %esi,%esi
 693:	75 df                	jne    674 <printf+0x27>
      if(c == '%'){
 695:	83 f8 25             	cmp    $0x25,%eax
 698:	75 ce                	jne    668 <printf+0x1b>
        state = '%';
 69a:	89 c6                	mov    %eax,%esi
 69c:	eb db                	jmp    679 <printf+0x2c>
      if(c == 'd'){
 69e:	83 f8 25             	cmp    $0x25,%eax
 6a1:	0f 84 cf 00 00 00    	je     776 <printf+0x129>
 6a7:	0f 8c dd 00 00 00    	jl     78a <printf+0x13d>
 6ad:	83 f8 78             	cmp    $0x78,%eax
 6b0:	0f 8f d4 00 00 00    	jg     78a <printf+0x13d>
 6b6:	83 f8 63             	cmp    $0x63,%eax
 6b9:	0f 8c cb 00 00 00    	jl     78a <printf+0x13d>
 6bf:	83 e8 63             	sub    $0x63,%eax
 6c2:	83 f8 15             	cmp    $0x15,%eax
 6c5:	0f 87 bf 00 00 00    	ja     78a <printf+0x13d>
 6cb:	ff 24 85 94 09 00 00 	jmp    *0x994(,%eax,4)
        printint(fd, *ap, 10, 1);
 6d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d5:	8b 17                	mov    (%edi),%edx
 6d7:	83 ec 0c             	sub    $0xc,%esp
 6da:	6a 01                	push   $0x1
 6dc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e1:	8b 45 08             	mov    0x8(%ebp),%eax
 6e4:	e8 d9 fe ff ff       	call   5c2 <printint>
        ap++;
 6e9:	83 c7 04             	add    $0x4,%edi
 6ec:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ef:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f2:	be 00 00 00 00       	mov    $0x0,%esi
 6f7:	eb 80                	jmp    679 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6f9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6fc:	8b 17                	mov    (%edi),%edx
 6fe:	83 ec 0c             	sub    $0xc,%esp
 701:	6a 00                	push   $0x0
 703:	b9 10 00 00 00       	mov    $0x10,%ecx
 708:	8b 45 08             	mov    0x8(%ebp),%eax
 70b:	e8 b2 fe ff ff       	call   5c2 <printint>
        ap++;
 710:	83 c7 04             	add    $0x4,%edi
 713:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 716:	83 c4 10             	add    $0x10,%esp
      state = 0;
 719:	be 00 00 00 00       	mov    $0x0,%esi
 71e:	e9 56 ff ff ff       	jmp    679 <printf+0x2c>
        s = (char*)*ap;
 723:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 726:	8b 30                	mov    (%eax),%esi
        ap++;
 728:	83 c0 04             	add    $0x4,%eax
 72b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 72e:	85 f6                	test   %esi,%esi
 730:	75 15                	jne    747 <printf+0xfa>
          s = "(null)";
 732:	be 8b 09 00 00       	mov    $0x98b,%esi
 737:	eb 0e                	jmp    747 <printf+0xfa>
          putc(fd, *s);
 739:	0f be d2             	movsbl %dl,%edx
 73c:	8b 45 08             	mov    0x8(%ebp),%eax
 73f:	e8 64 fe ff ff       	call   5a8 <putc>
          s++;
 744:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 747:	0f b6 16             	movzbl (%esi),%edx
 74a:	84 d2                	test   %dl,%dl
 74c:	75 eb                	jne    739 <printf+0xec>
      state = 0;
 74e:	be 00 00 00 00       	mov    $0x0,%esi
 753:	e9 21 ff ff ff       	jmp    679 <printf+0x2c>
        putc(fd, *ap);
 758:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 75b:	0f be 17             	movsbl (%edi),%edx
 75e:	8b 45 08             	mov    0x8(%ebp),%eax
 761:	e8 42 fe ff ff       	call   5a8 <putc>
        ap++;
 766:	83 c7 04             	add    $0x4,%edi
 769:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 76c:	be 00 00 00 00       	mov    $0x0,%esi
 771:	e9 03 ff ff ff       	jmp    679 <printf+0x2c>
        putc(fd, c);
 776:	89 fa                	mov    %edi,%edx
 778:	8b 45 08             	mov    0x8(%ebp),%eax
 77b:	e8 28 fe ff ff       	call   5a8 <putc>
      state = 0;
 780:	be 00 00 00 00       	mov    $0x0,%esi
 785:	e9 ef fe ff ff       	jmp    679 <printf+0x2c>
        putc(fd, '%');
 78a:	ba 25 00 00 00       	mov    $0x25,%edx
 78f:	8b 45 08             	mov    0x8(%ebp),%eax
 792:	e8 11 fe ff ff       	call   5a8 <putc>
        putc(fd, c);
 797:	89 fa                	mov    %edi,%edx
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	e8 07 fe ff ff       	call   5a8 <putc>
      state = 0;
 7a1:	be 00 00 00 00       	mov    $0x0,%esi
 7a6:	e9 ce fe ff ff       	jmp    679 <printf+0x2c>
    }
  }
}
 7ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ae:	5b                   	pop    %ebx
 7af:	5e                   	pop    %esi
 7b0:	5f                   	pop    %edi
 7b1:	5d                   	pop    %ebp
 7b2:	c3                   	ret    

000007b3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b3:	55                   	push   %ebp
 7b4:	89 e5                	mov    %esp,%ebp
 7b6:	57                   	push   %edi
 7b7:	56                   	push   %esi
 7b8:	53                   	push   %ebx
 7b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7bc:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bf:	a1 88 0d 00 00       	mov    0xd88,%eax
 7c4:	eb 02                	jmp    7c8 <free+0x15>
 7c6:	89 d0                	mov    %edx,%eax
 7c8:	39 c8                	cmp    %ecx,%eax
 7ca:	73 04                	jae    7d0 <free+0x1d>
 7cc:	39 08                	cmp    %ecx,(%eax)
 7ce:	77 12                	ja     7e2 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d0:	8b 10                	mov    (%eax),%edx
 7d2:	39 c2                	cmp    %eax,%edx
 7d4:	77 f0                	ja     7c6 <free+0x13>
 7d6:	39 c8                	cmp    %ecx,%eax
 7d8:	72 08                	jb     7e2 <free+0x2f>
 7da:	39 ca                	cmp    %ecx,%edx
 7dc:	77 04                	ja     7e2 <free+0x2f>
 7de:	89 d0                	mov    %edx,%eax
 7e0:	eb e6                	jmp    7c8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e2:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e5:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	39 d7                	cmp    %edx,%edi
 7ec:	74 19                	je     807 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ee:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f1:	8b 50 04             	mov    0x4(%eax),%edx
 7f4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f7:	39 ce                	cmp    %ecx,%esi
 7f9:	74 1b                	je     816 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7fb:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7fd:	a3 88 0d 00 00       	mov    %eax,0xd88
}
 802:	5b                   	pop    %ebx
 803:	5e                   	pop    %esi
 804:	5f                   	pop    %edi
 805:	5d                   	pop    %ebp
 806:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 807:	03 72 04             	add    0x4(%edx),%esi
 80a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 80d:	8b 10                	mov    (%eax),%edx
 80f:	8b 12                	mov    (%edx),%edx
 811:	89 53 f8             	mov    %edx,-0x8(%ebx)
 814:	eb db                	jmp    7f1 <free+0x3e>
    p->s.size += bp->s.size;
 816:	03 53 fc             	add    -0x4(%ebx),%edx
 819:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 81c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 81f:	89 10                	mov    %edx,(%eax)
 821:	eb da                	jmp    7fd <free+0x4a>

00000823 <morecore>:

static Header*
morecore(uint nu)
{
 823:	55                   	push   %ebp
 824:	89 e5                	mov    %esp,%ebp
 826:	53                   	push   %ebx
 827:	83 ec 04             	sub    $0x4,%esp
 82a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 82c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 831:	77 05                	ja     838 <morecore+0x15>
    nu = 4096;
 833:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 838:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 83f:	83 ec 0c             	sub    $0xc,%esp
 842:	50                   	push   %eax
 843:	e8 38 fd ff ff       	call   580 <sbrk>
  if(p == (char*)-1)
 848:	83 c4 10             	add    $0x10,%esp
 84b:	83 f8 ff             	cmp    $0xffffffff,%eax
 84e:	74 1c                	je     86c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 850:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 853:	83 c0 08             	add    $0x8,%eax
 856:	83 ec 0c             	sub    $0xc,%esp
 859:	50                   	push   %eax
 85a:	e8 54 ff ff ff       	call   7b3 <free>
  return freep;
 85f:	a1 88 0d 00 00       	mov    0xd88,%eax
 864:	83 c4 10             	add    $0x10,%esp
}
 867:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 86a:	c9                   	leave  
 86b:	c3                   	ret    
    return 0;
 86c:	b8 00 00 00 00       	mov    $0x0,%eax
 871:	eb f4                	jmp    867 <morecore+0x44>

00000873 <malloc>:

void*
malloc(uint nbytes)
{
 873:	55                   	push   %ebp
 874:	89 e5                	mov    %esp,%ebp
 876:	53                   	push   %ebx
 877:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	8d 58 07             	lea    0x7(%eax),%ebx
 880:	c1 eb 03             	shr    $0x3,%ebx
 883:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 886:	8b 0d 88 0d 00 00    	mov    0xd88,%ecx
 88c:	85 c9                	test   %ecx,%ecx
 88e:	74 04                	je     894 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 890:	8b 01                	mov    (%ecx),%eax
 892:	eb 4a                	jmp    8de <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 894:	c7 05 88 0d 00 00 8c 	movl   $0xd8c,0xd88
 89b:	0d 00 00 
 89e:	c7 05 8c 0d 00 00 8c 	movl   $0xd8c,0xd8c
 8a5:	0d 00 00 
    base.s.size = 0;
 8a8:	c7 05 90 0d 00 00 00 	movl   $0x0,0xd90
 8af:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8b2:	b9 8c 0d 00 00       	mov    $0xd8c,%ecx
 8b7:	eb d7                	jmp    890 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8b9:	74 19                	je     8d4 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8bb:	29 da                	sub    %ebx,%edx
 8bd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8c3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8c6:	89 0d 88 0d 00 00    	mov    %ecx,0xd88
      return (void*)(p + 1);
 8cc:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d2:	c9                   	leave  
 8d3:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8d4:	8b 10                	mov    (%eax),%edx
 8d6:	89 11                	mov    %edx,(%ecx)
 8d8:	eb ec                	jmp    8c6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8da:	89 c1                	mov    %eax,%ecx
 8dc:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8de:	8b 50 04             	mov    0x4(%eax),%edx
 8e1:	39 da                	cmp    %ebx,%edx
 8e3:	73 d4                	jae    8b9 <malloc+0x46>
    if(p == freep)
 8e5:	39 05 88 0d 00 00    	cmp    %eax,0xd88
 8eb:	75 ed                	jne    8da <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ed:	89 d8                	mov    %ebx,%eax
 8ef:	e8 2f ff ff ff       	call   823 <morecore>
 8f4:	85 c0                	test   %eax,%eax
 8f6:	75 e2                	jne    8da <malloc+0x67>
 8f8:	eb d5                	jmp    8cf <malloc+0x5c>
