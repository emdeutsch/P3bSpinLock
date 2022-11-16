
_test_18:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:

   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1,void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
    int j;
    lock_acquire(&lock);
   6:	68 ec 0d 00 00       	push   $0xdec
   b:	e8 8f 04 00 00       	call   49f <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 f0 0d 00 00 01 	addl   $0x1,0xdf0
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 ec 0d 00 00       	push   $0xdec
  31:	e8 8b 04 00 00       	call   4c1 <lock_release>
    exit();
  36:	e8 fa 04 00 00       	call   535 <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 ec 0d 00 00       	push   $0xdec
  47:	e8 53 04 00 00       	call   49f <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 f0 0d 00 00 01 	addl   $0x1,0xdf0
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 ec 0d 00 00       	push   $0xdec
  6d:	e8 4f 04 00 00       	call   4c1 <lock_release>

    int nested_thread_pid = thread_create(worker2, 0, 0);
  72:	83 c4 0c             	add    $0xc,%esp
  75:	6a 00                	push   $0x0
  77:	6a 00                	push   $0x0
  79:	68 00 00 00 00       	push   $0x0
  7e:	e8 4c 04 00 00       	call   4cf <thread_create>
  83:	89 c3                	mov    %eax,%ebx
    assert(nested_thread_pid > 0);
  85:	83 c4 10             	add    $0x10,%esp
  88:	85 c0                	test   %eax,%eax
  8a:	7e 5e                	jle    ea <worker+0xaf>
    int nested_join_pid = thread_join();
  8c:	e8 75 04 00 00       	call   506 <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 38 09 00 00       	push   $0x938
  a8:	68 42 09 00 00       	push   $0x942
  ad:	6a 01                	push   $0x1
  af:	e8 d6 05 00 00       	call   68a <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 bc 09 00 00       	push   $0x9bc
  bc:	68 60 09 00 00       	push   $0x960
  c1:	6a 01                	push   $0x1
  c3:	e8 c2 05 00 00       	call   68a <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 74 09 00 00       	push   $0x974
  d0:	6a 01                	push   $0x1
  d2:	e8 b3 05 00 00       	call   68a <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 f4 0d 00 00    	push   0xdf4
  e0:	e8 80 04 00 00       	call   565 <kill>
  e5:	e8 4b 04 00 00       	call   535 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 38 09 00 00       	push   $0x938
  f1:	68 42 09 00 00       	push   $0x942
  f6:	6a 01                	push   $0x1
  f8:	e8 8d 05 00 00       	call   68a <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 4a 09 00 00       	push   $0x94a
 105:	68 60 09 00 00       	push   $0x960
 10a:	6a 01                	push   $0x1
 10c:	e8 79 05 00 00       	call   68a <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 74 09 00 00       	push   $0x974
 119:	6a 01                	push   $0x1
 11b:	e8 6a 05 00 00       	call   68a <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 f4 0d 00 00    	push   0xdf4
 129:	e8 37 04 00 00       	call   565 <kill>
 12e:	e8 02 04 00 00       	call   535 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 38 09 00 00       	push   $0x938
 13a:	68 42 09 00 00       	push   $0x942
 13f:	6a 01                	push   $0x1
 141:	e8 44 05 00 00       	call   68a <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 81 09 00 00       	push   $0x981
 14e:	68 60 09 00 00       	push   $0x960
 153:	6a 01                	push   $0x1
 155:	e8 30 05 00 00       	call   68a <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 74 09 00 00       	push   $0x974
 162:	6a 01                	push   $0x1
 164:	e8 21 05 00 00       	call   68a <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 f4 0d 00 00    	push   0xdf4
 172:	e8 ee 03 00 00       	call   565 <kill>
 177:	e8 b9 03 00 00       	call   535 <exit>

   exit();
 17c:	e8 b4 03 00 00       	call   535 <exit>

00000181 <main>:
{
 181:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 185:	83 e4 f0             	and    $0xfffffff0,%esp
 188:	ff 71 fc             	push   -0x4(%ecx)
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	53                   	push   %ebx
 18f:	51                   	push   %ecx
   ppid = getpid();
 190:	e8 20 04 00 00       	call   5b5 <getpid>
 195:	a3 f4 0d 00 00       	mov    %eax,0xdf4
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 ec 0d 00 00       	push   $0xdec
 1a2:	e8 ea 02 00 00       	call   491 <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d e8 0d 00 00    	cmp    %ebx,0xde8
 1ba:	7e 61                	jle    21d <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
 1bc:	83 ec 04             	sub    $0x4,%esp
 1bf:	6a 00                	push   $0x0
 1c1:	6a 00                	push   $0x0
 1c3:	68 3b 00 00 00       	push   $0x3b
 1c8:	e8 02 03 00 00       	call   4cf <thread_create>
      assert(thread_pid > 0);
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7f dd                	jg     1b1 <main+0x30>
 1d4:	6a 26                	push   $0x26
 1d6:	68 38 09 00 00       	push   $0x938
 1db:	68 42 09 00 00       	push   $0x942
 1e0:	6a 01                	push   $0x1
 1e2:	e8 a3 04 00 00       	call   68a <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 51 09 00 00       	push   $0x951
 1ef:	68 60 09 00 00       	push   $0x960
 1f4:	6a 01                	push   $0x1
 1f6:	e8 8f 04 00 00       	call   68a <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 74 09 00 00       	push   $0x974
 203:	6a 01                	push   $0x1
 205:	e8 80 04 00 00       	call   68a <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 f4 0d 00 00    	push   0xdf4
 213:	e8 4d 03 00 00       	call   565 <kill>
 218:	e8 18 03 00 00       	call   535 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 e8 0d 00 00       	mov    0xde8,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 d6 02 00 00       	call   506 <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 38 09 00 00       	push   $0x938
 240:	68 42 09 00 00       	push   $0x942
 245:	6a 01                	push   $0x1
 247:	e8 3e 04 00 00       	call   68a <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 88 09 00 00       	push   $0x988
 254:	68 60 09 00 00       	push   $0x960
 259:	6a 01                	push   $0x1
 25b:	e8 2a 04 00 00       	call   68a <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 74 09 00 00       	push   $0x974
 268:	6a 01                	push   $0x1
 26a:	e8 1b 04 00 00       	call   68a <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 f4 0d 00 00    	push   0xdf4
 278:	e8 e8 02 00 00       	call   565 <kill>
 27d:	e8 b3 02 00 00       	call   535 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 f0 0d 00 00    	cmp    0xdf0,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 38 09 00 00       	push   $0x938
 293:	68 42 09 00 00       	push   $0x942
 298:	6a 01                	push   $0x1
 29a:	e8 eb 03 00 00       	call   68a <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 95 09 00 00       	push   $0x995
 2a7:	68 60 09 00 00       	push   $0x960
 2ac:	6a 01                	push   $0x1
 2ae:	e8 d7 03 00 00       	call   68a <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 74 09 00 00       	push   $0x974
 2bb:	6a 01                	push   $0x1
 2bd:	e8 c8 03 00 00       	call   68a <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 f4 0d 00 00    	push   0xdf4
 2cb:	e8 95 02 00 00       	call   565 <kill>
 2d0:	e8 60 02 00 00       	call   535 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 af 09 00 00       	push   $0x9af
 2dd:	6a 01                	push   $0x1
 2df:	e8 a6 03 00 00       	call   68a <printf>
   exit();
 2e4:	e8 4c 02 00 00       	call   535 <exit>

000002e9 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	56                   	push   %esi
 2ed:	53                   	push   %ebx
 2ee:	8b 75 08             	mov    0x8(%ebp),%esi
 2f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2f4:	89 f0                	mov    %esi,%eax
 2f6:	89 d1                	mov    %edx,%ecx
 2f8:	83 c2 01             	add    $0x1,%edx
 2fb:	89 c3                	mov    %eax,%ebx
 2fd:	83 c0 01             	add    $0x1,%eax
 300:	0f b6 09             	movzbl (%ecx),%ecx
 303:	88 0b                	mov    %cl,(%ebx)
 305:	84 c9                	test   %cl,%cl
 307:	75 ed                	jne    2f6 <strcpy+0xd>
    ;
  return os;
}
 309:	89 f0                	mov    %esi,%eax
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    

0000030f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	8b 4d 08             	mov    0x8(%ebp),%ecx
 315:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 318:	eb 06                	jmp    320 <strcmp+0x11>
    p++, q++;
 31a:	83 c1 01             	add    $0x1,%ecx
 31d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 320:	0f b6 01             	movzbl (%ecx),%eax
 323:	84 c0                	test   %al,%al
 325:	74 04                	je     32b <strcmp+0x1c>
 327:	3a 02                	cmp    (%edx),%al
 329:	74 ef                	je     31a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 32b:	0f b6 c0             	movzbl %al,%eax
 32e:	0f b6 12             	movzbl (%edx),%edx
 331:	29 d0                	sub    %edx,%eax
}
 333:	5d                   	pop    %ebp
 334:	c3                   	ret    

00000335 <strlen>:

uint
strlen(const char *s)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 33b:	b8 00 00 00 00       	mov    $0x0,%eax
 340:	eb 03                	jmp    345 <strlen+0x10>
 342:	83 c0 01             	add    $0x1,%eax
 345:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 349:	75 f7                	jne    342 <strlen+0xd>
    ;
  return n;
}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <memset>:

void*
memset(void *dst, int c, uint n)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	57                   	push   %edi
 351:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 354:	89 d7                	mov    %edx,%edi
 356:	8b 4d 10             	mov    0x10(%ebp),%ecx
 359:	8b 45 0c             	mov    0xc(%ebp),%eax
 35c:	fc                   	cld    
 35d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35f:	89 d0                	mov    %edx,%eax
 361:	8b 7d fc             	mov    -0x4(%ebp),%edi
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <strchr>:

char*
strchr(const char *s, char c)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 370:	eb 03                	jmp    375 <strchr+0xf>
 372:	83 c0 01             	add    $0x1,%eax
 375:	0f b6 10             	movzbl (%eax),%edx
 378:	84 d2                	test   %dl,%dl
 37a:	74 06                	je     382 <strchr+0x1c>
    if(*s == c)
 37c:	38 ca                	cmp    %cl,%dl
 37e:	75 f2                	jne    372 <strchr+0xc>
 380:	eb 05                	jmp    387 <strchr+0x21>
      return (char*)s;
  return 0;
 382:	b8 00 00 00 00       	mov    $0x0,%eax
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <gets>:

char*
gets(char *buf, int max)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	57                   	push   %edi
 38d:	56                   	push   %esi
 38e:	53                   	push   %ebx
 38f:	83 ec 1c             	sub    $0x1c,%esp
 392:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 395:	bb 00 00 00 00       	mov    $0x0,%ebx
 39a:	89 de                	mov    %ebx,%esi
 39c:	83 c3 01             	add    $0x1,%ebx
 39f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a2:	7d 2e                	jge    3d2 <gets+0x49>
    cc = read(0, &c, 1);
 3a4:	83 ec 04             	sub    $0x4,%esp
 3a7:	6a 01                	push   $0x1
 3a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ac:	50                   	push   %eax
 3ad:	6a 00                	push   $0x0
 3af:	e8 99 01 00 00       	call   54d <read>
    if(cc < 1)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	7e 17                	jle    3d2 <gets+0x49>
      break;
    buf[i++] = c;
 3bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3c2:	3c 0a                	cmp    $0xa,%al
 3c4:	0f 94 c2             	sete   %dl
 3c7:	3c 0d                	cmp    $0xd,%al
 3c9:	0f 94 c0             	sete   %al
 3cc:	08 c2                	or     %al,%dl
 3ce:	74 ca                	je     39a <gets+0x11>
    buf[i++] = c;
 3d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d6:	89 f8                	mov    %edi,%eax
 3d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5f                   	pop    %edi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e5:	83 ec 08             	sub    $0x8,%esp
 3e8:	6a 00                	push   $0x0
 3ea:	ff 75 08             	push   0x8(%ebp)
 3ed:	e8 83 01 00 00       	call   575 <open>
  if(fd < 0)
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	85 c0                	test   %eax,%eax
 3f7:	78 24                	js     41d <stat+0x3d>
 3f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3fb:	83 ec 08             	sub    $0x8,%esp
 3fe:	ff 75 0c             	push   0xc(%ebp)
 401:	50                   	push   %eax
 402:	e8 86 01 00 00       	call   58d <fstat>
 407:	89 c6                	mov    %eax,%esi
  close(fd);
 409:	89 1c 24             	mov    %ebx,(%esp)
 40c:	e8 4c 01 00 00       	call   55d <close>
  return r;
 411:	83 c4 10             	add    $0x10,%esp
}
 414:	89 f0                	mov    %esi,%eax
 416:	8d 65 f8             	lea    -0x8(%ebp),%esp
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
    return -1;
 41d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 422:	eb f0                	jmp    414 <stat+0x34>

00000424 <atoi>:

int
atoi(const char *s)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 42b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 430:	eb 10                	jmp    442 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 432:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 435:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 438:	83 c1 01             	add    $0x1,%ecx
 43b:	0f be c0             	movsbl %al,%eax
 43e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 442:	0f b6 01             	movzbl (%ecx),%eax
 445:	8d 58 d0             	lea    -0x30(%eax),%ebx
 448:	80 fb 09             	cmp    $0x9,%bl
 44b:	76 e5                	jbe    432 <atoi+0xe>
  return n;
}
 44d:	89 d0                	mov    %edx,%eax
 44f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 452:	c9                   	leave  
 453:	c3                   	ret    

00000454 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	56                   	push   %esi
 458:	53                   	push   %ebx
 459:	8b 75 08             	mov    0x8(%ebp),%esi
 45c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 462:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 464:	eb 0d                	jmp    473 <memmove+0x1f>
    *dst++ = *src++;
 466:	0f b6 01             	movzbl (%ecx),%eax
 469:	88 02                	mov    %al,(%edx)
 46b:	8d 49 01             	lea    0x1(%ecx),%ecx
 46e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 471:	89 d8                	mov    %ebx,%eax
 473:	8d 58 ff             	lea    -0x1(%eax),%ebx
 476:	85 c0                	test   %eax,%eax
 478:	7f ec                	jg     466 <memmove+0x12>
  return vdst;
}
 47a:	89 f0                	mov    %esi,%eax
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 486:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 488:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 48b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 48d:	89 d0                	mov    %edx,%eax
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    

00000491 <lock_init>:
void 
lock_init(lock_t *lock){
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 494:	8b 45 08             	mov    0x8(%ebp),%eax
 497:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    

0000049f <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 49f:	55                   	push   %ebp
 4a0:	89 e5                	mov    %esp,%ebp
 4a2:	53                   	push   %ebx
 4a3:	83 ec 04             	sub    $0x4,%esp
 4a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 4a9:	83 ec 08             	sub    $0x8,%esp
 4ac:	6a 01                	push   $0x1
 4ae:	53                   	push   %ebx
 4af:	e8 cc ff ff ff       	call   480 <TestAndSet>
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	83 f8 01             	cmp    $0x1,%eax
 4ba:	74 ed                	je     4a9 <lock_acquire+0xa>
    ;
}
 4bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4bf:	c9                   	leave  
 4c0:	c3                   	ret    

000004c1 <lock_release>:
void 
lock_release(lock_t *lock){
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4c4:	8b 45 08             	mov    0x8(%ebp),%eax
 4c7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4cd:	5d                   	pop    %ebp
 4ce:	c3                   	ret    

000004cf <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 4cf:	55                   	push   %ebp
 4d0:	89 e5                	mov    %esp,%ebp
 4d2:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 4d5:	68 04 20 00 00       	push   $0x2004
 4da:	e8 d1 03 00 00       	call   8b0 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 4df:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	eb 03                	jmp    4ea <thread_create+0x1b>
      stack += 1;
 4e7:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 4ea:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4f0:	75 f5                	jne    4e7 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 4f2:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4f5:	52                   	push   %edx
 4f6:	ff 75 10             	push   0x10(%ebp)
 4f9:	ff 75 0c             	push   0xc(%ebp)
 4fc:	ff 75 08             	push   0x8(%ebp)
 4ff:	e8 d1 00 00 00       	call   5d5 <clone>
 
    return pid;
}
 504:	c9                   	leave  
 505:	c3                   	ret    

00000506 <thread_join>:
int 
thread_join(){
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
 509:	53                   	push   %ebx
 50a:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 50d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 510:	50                   	push   %eax
 511:	e8 c7 00 00 00       	call   5dd <join>
 516:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 518:	83 c4 04             	add    $0x4,%esp
 51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51e:	ff 70 fc             	push   -0x4(%eax)
 521:	e8 ca 02 00 00       	call   7f0 <free>
  return pid;
 526:	89 d8                	mov    %ebx,%eax
 528:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 52b:	c9                   	leave  
 52c:	c3                   	ret    

0000052d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 52d:	b8 01 00 00 00       	mov    $0x1,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <exit>:
SYSCALL(exit)
 535:	b8 02 00 00 00       	mov    $0x2,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <wait>:
SYSCALL(wait)
 53d:	b8 03 00 00 00       	mov    $0x3,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <pipe>:
SYSCALL(pipe)
 545:	b8 04 00 00 00       	mov    $0x4,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <read>:
SYSCALL(read)
 54d:	b8 05 00 00 00       	mov    $0x5,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <write>:
SYSCALL(write)
 555:	b8 10 00 00 00       	mov    $0x10,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <close>:
SYSCALL(close)
 55d:	b8 15 00 00 00       	mov    $0x15,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <kill>:
SYSCALL(kill)
 565:	b8 06 00 00 00       	mov    $0x6,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <exec>:
SYSCALL(exec)
 56d:	b8 07 00 00 00       	mov    $0x7,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <open>:
SYSCALL(open)
 575:	b8 0f 00 00 00       	mov    $0xf,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <mknod>:
SYSCALL(mknod)
 57d:	b8 11 00 00 00       	mov    $0x11,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <unlink>:
SYSCALL(unlink)
 585:	b8 12 00 00 00       	mov    $0x12,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <fstat>:
SYSCALL(fstat)
 58d:	b8 08 00 00 00       	mov    $0x8,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <link>:
SYSCALL(link)
 595:	b8 13 00 00 00       	mov    $0x13,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <mkdir>:
SYSCALL(mkdir)
 59d:	b8 14 00 00 00       	mov    $0x14,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <chdir>:
SYSCALL(chdir)
 5a5:	b8 09 00 00 00       	mov    $0x9,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <dup>:
SYSCALL(dup)
 5ad:	b8 0a 00 00 00       	mov    $0xa,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <getpid>:
SYSCALL(getpid)
 5b5:	b8 0b 00 00 00       	mov    $0xb,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <sbrk>:
SYSCALL(sbrk)
 5bd:	b8 0c 00 00 00       	mov    $0xc,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <sleep>:
SYSCALL(sleep)
 5c5:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <uptime>:
SYSCALL(uptime)
 5cd:	b8 0e 00 00 00       	mov    $0xe,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <clone>:
SYSCALL(clone)
 5d5:	b8 16 00 00 00       	mov    $0x16,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <join>:
SYSCALL(join)
 5dd:	b8 17 00 00 00       	mov    $0x17,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5e5:	55                   	push   %ebp
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	83 ec 1c             	sub    $0x1c,%esp
 5eb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ee:	6a 01                	push   $0x1
 5f0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5f3:	52                   	push   %edx
 5f4:	50                   	push   %eax
 5f5:	e8 5b ff ff ff       	call   555 <write>
}
 5fa:	83 c4 10             	add    $0x10,%esp
 5fd:	c9                   	leave  
 5fe:	c3                   	ret    

000005ff <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5ff:	55                   	push   %ebp
 600:	89 e5                	mov    %esp,%ebp
 602:	57                   	push   %edi
 603:	56                   	push   %esi
 604:	53                   	push   %ebx
 605:	83 ec 2c             	sub    $0x2c,%esp
 608:	89 45 d0             	mov    %eax,-0x30(%ebp)
 60b:	89 d0                	mov    %edx,%eax
 60d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 60f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 613:	0f 95 c1             	setne  %cl
 616:	c1 ea 1f             	shr    $0x1f,%edx
 619:	84 d1                	test   %dl,%cl
 61b:	74 44                	je     661 <printint+0x62>
    neg = 1;
    x = -xx;
 61d:	f7 d8                	neg    %eax
 61f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 621:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 628:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 62d:	89 c8                	mov    %ecx,%eax
 62f:	ba 00 00 00 00       	mov    $0x0,%edx
 634:	f7 f6                	div    %esi
 636:	89 df                	mov    %ebx,%edi
 638:	83 c3 01             	add    $0x1,%ebx
 63b:	0f b6 92 40 0a 00 00 	movzbl 0xa40(%edx),%edx
 642:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 646:	89 ca                	mov    %ecx,%edx
 648:	89 c1                	mov    %eax,%ecx
 64a:	39 d6                	cmp    %edx,%esi
 64c:	76 df                	jbe    62d <printint+0x2e>
  if(neg)
 64e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 652:	74 31                	je     685 <printint+0x86>
    buf[i++] = '-';
 654:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 659:	8d 5f 02             	lea    0x2(%edi),%ebx
 65c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65f:	eb 17                	jmp    678 <printint+0x79>
    x = xx;
 661:	89 c1                	mov    %eax,%ecx
  neg = 0;
 663:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 66a:	eb bc                	jmp    628 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 66c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 671:	89 f0                	mov    %esi,%eax
 673:	e8 6d ff ff ff       	call   5e5 <putc>
  while(--i >= 0)
 678:	83 eb 01             	sub    $0x1,%ebx
 67b:	79 ef                	jns    66c <printint+0x6d>
}
 67d:	83 c4 2c             	add    $0x2c,%esp
 680:	5b                   	pop    %ebx
 681:	5e                   	pop    %esi
 682:	5f                   	pop    %edi
 683:	5d                   	pop    %ebp
 684:	c3                   	ret    
 685:	8b 75 d0             	mov    -0x30(%ebp),%esi
 688:	eb ee                	jmp    678 <printint+0x79>

0000068a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 68a:	55                   	push   %ebp
 68b:	89 e5                	mov    %esp,%ebp
 68d:	57                   	push   %edi
 68e:	56                   	push   %esi
 68f:	53                   	push   %ebx
 690:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 693:	8d 45 10             	lea    0x10(%ebp),%eax
 696:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 699:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 69e:	bb 00 00 00 00       	mov    $0x0,%ebx
 6a3:	eb 14                	jmp    6b9 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6a5:	89 fa                	mov    %edi,%edx
 6a7:	8b 45 08             	mov    0x8(%ebp),%eax
 6aa:	e8 36 ff ff ff       	call   5e5 <putc>
 6af:	eb 05                	jmp    6b6 <printf+0x2c>
      }
    } else if(state == '%'){
 6b1:	83 fe 25             	cmp    $0x25,%esi
 6b4:	74 25                	je     6db <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6b6:	83 c3 01             	add    $0x1,%ebx
 6b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6bc:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6c0:	84 c0                	test   %al,%al
 6c2:	0f 84 20 01 00 00    	je     7e8 <printf+0x15e>
    c = fmt[i] & 0xff;
 6c8:	0f be f8             	movsbl %al,%edi
 6cb:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ce:	85 f6                	test   %esi,%esi
 6d0:	75 df                	jne    6b1 <printf+0x27>
      if(c == '%'){
 6d2:	83 f8 25             	cmp    $0x25,%eax
 6d5:	75 ce                	jne    6a5 <printf+0x1b>
        state = '%';
 6d7:	89 c6                	mov    %eax,%esi
 6d9:	eb db                	jmp    6b6 <printf+0x2c>
      if(c == 'd'){
 6db:	83 f8 25             	cmp    $0x25,%eax
 6de:	0f 84 cf 00 00 00    	je     7b3 <printf+0x129>
 6e4:	0f 8c dd 00 00 00    	jl     7c7 <printf+0x13d>
 6ea:	83 f8 78             	cmp    $0x78,%eax
 6ed:	0f 8f d4 00 00 00    	jg     7c7 <printf+0x13d>
 6f3:	83 f8 63             	cmp    $0x63,%eax
 6f6:	0f 8c cb 00 00 00    	jl     7c7 <printf+0x13d>
 6fc:	83 e8 63             	sub    $0x63,%eax
 6ff:	83 f8 15             	cmp    $0x15,%eax
 702:	0f 87 bf 00 00 00    	ja     7c7 <printf+0x13d>
 708:	ff 24 85 e8 09 00 00 	jmp    *0x9e8(,%eax,4)
        printint(fd, *ap, 10, 1);
 70f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 712:	8b 17                	mov    (%edi),%edx
 714:	83 ec 0c             	sub    $0xc,%esp
 717:	6a 01                	push   $0x1
 719:	b9 0a 00 00 00       	mov    $0xa,%ecx
 71e:	8b 45 08             	mov    0x8(%ebp),%eax
 721:	e8 d9 fe ff ff       	call   5ff <printint>
        ap++;
 726:	83 c7 04             	add    $0x4,%edi
 729:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 72c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 72f:	be 00 00 00 00       	mov    $0x0,%esi
 734:	eb 80                	jmp    6b6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 736:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 739:	8b 17                	mov    (%edi),%edx
 73b:	83 ec 0c             	sub    $0xc,%esp
 73e:	6a 00                	push   $0x0
 740:	b9 10 00 00 00       	mov    $0x10,%ecx
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	e8 b2 fe ff ff       	call   5ff <printint>
        ap++;
 74d:	83 c7 04             	add    $0x4,%edi
 750:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 753:	83 c4 10             	add    $0x10,%esp
      state = 0;
 756:	be 00 00 00 00       	mov    $0x0,%esi
 75b:	e9 56 ff ff ff       	jmp    6b6 <printf+0x2c>
        s = (char*)*ap;
 760:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 763:	8b 30                	mov    (%eax),%esi
        ap++;
 765:	83 c0 04             	add    $0x4,%eax
 768:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 76b:	85 f6                	test   %esi,%esi
 76d:	75 15                	jne    784 <printf+0xfa>
          s = "(null)";
 76f:	be df 09 00 00       	mov    $0x9df,%esi
 774:	eb 0e                	jmp    784 <printf+0xfa>
          putc(fd, *s);
 776:	0f be d2             	movsbl %dl,%edx
 779:	8b 45 08             	mov    0x8(%ebp),%eax
 77c:	e8 64 fe ff ff       	call   5e5 <putc>
          s++;
 781:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 784:	0f b6 16             	movzbl (%esi),%edx
 787:	84 d2                	test   %dl,%dl
 789:	75 eb                	jne    776 <printf+0xec>
      state = 0;
 78b:	be 00 00 00 00       	mov    $0x0,%esi
 790:	e9 21 ff ff ff       	jmp    6b6 <printf+0x2c>
        putc(fd, *ap);
 795:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 798:	0f be 17             	movsbl (%edi),%edx
 79b:	8b 45 08             	mov    0x8(%ebp),%eax
 79e:	e8 42 fe ff ff       	call   5e5 <putc>
        ap++;
 7a3:	83 c7 04             	add    $0x4,%edi
 7a6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7a9:	be 00 00 00 00       	mov    $0x0,%esi
 7ae:	e9 03 ff ff ff       	jmp    6b6 <printf+0x2c>
        putc(fd, c);
 7b3:	89 fa                	mov    %edi,%edx
 7b5:	8b 45 08             	mov    0x8(%ebp),%eax
 7b8:	e8 28 fe ff ff       	call   5e5 <putc>
      state = 0;
 7bd:	be 00 00 00 00       	mov    $0x0,%esi
 7c2:	e9 ef fe ff ff       	jmp    6b6 <printf+0x2c>
        putc(fd, '%');
 7c7:	ba 25 00 00 00       	mov    $0x25,%edx
 7cc:	8b 45 08             	mov    0x8(%ebp),%eax
 7cf:	e8 11 fe ff ff       	call   5e5 <putc>
        putc(fd, c);
 7d4:	89 fa                	mov    %edi,%edx
 7d6:	8b 45 08             	mov    0x8(%ebp),%eax
 7d9:	e8 07 fe ff ff       	call   5e5 <putc>
      state = 0;
 7de:	be 00 00 00 00       	mov    $0x0,%esi
 7e3:	e9 ce fe ff ff       	jmp    6b6 <printf+0x2c>
    }
  }
}
 7e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7eb:	5b                   	pop    %ebx
 7ec:	5e                   	pop    %esi
 7ed:	5f                   	pop    %edi
 7ee:	5d                   	pop    %ebp
 7ef:	c3                   	ret    

000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fc:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 801:	eb 02                	jmp    805 <free+0x15>
 803:	89 d0                	mov    %edx,%eax
 805:	39 c8                	cmp    %ecx,%eax
 807:	73 04                	jae    80d <free+0x1d>
 809:	39 08                	cmp    %ecx,(%eax)
 80b:	77 12                	ja     81f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80d:	8b 10                	mov    (%eax),%edx
 80f:	39 c2                	cmp    %eax,%edx
 811:	77 f0                	ja     803 <free+0x13>
 813:	39 c8                	cmp    %ecx,%eax
 815:	72 08                	jb     81f <free+0x2f>
 817:	39 ca                	cmp    %ecx,%edx
 819:	77 04                	ja     81f <free+0x2f>
 81b:	89 d0                	mov    %edx,%eax
 81d:	eb e6                	jmp    805 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 81f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 822:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 825:	8b 10                	mov    (%eax),%edx
 827:	39 d7                	cmp    %edx,%edi
 829:	74 19                	je     844 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 82b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82e:	8b 50 04             	mov    0x4(%eax),%edx
 831:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 834:	39 ce                	cmp    %ecx,%esi
 836:	74 1b                	je     853 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 838:	89 08                	mov    %ecx,(%eax)
  freep = p;
 83a:	a3 f8 0d 00 00       	mov    %eax,0xdf8
}
 83f:	5b                   	pop    %ebx
 840:	5e                   	pop    %esi
 841:	5f                   	pop    %edi
 842:	5d                   	pop    %ebp
 843:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 844:	03 72 04             	add    0x4(%edx),%esi
 847:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 84a:	8b 10                	mov    (%eax),%edx
 84c:	8b 12                	mov    (%edx),%edx
 84e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 851:	eb db                	jmp    82e <free+0x3e>
    p->s.size += bp->s.size;
 853:	03 53 fc             	add    -0x4(%ebx),%edx
 856:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 859:	8b 53 f8             	mov    -0x8(%ebx),%edx
 85c:	89 10                	mov    %edx,(%eax)
 85e:	eb da                	jmp    83a <free+0x4a>

00000860 <morecore>:

static Header*
morecore(uint nu)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	53                   	push   %ebx
 864:	83 ec 04             	sub    $0x4,%esp
 867:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 869:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 86e:	77 05                	ja     875 <morecore+0x15>
    nu = 4096;
 870:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 875:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 87c:	83 ec 0c             	sub    $0xc,%esp
 87f:	50                   	push   %eax
 880:	e8 38 fd ff ff       	call   5bd <sbrk>
  if(p == (char*)-1)
 885:	83 c4 10             	add    $0x10,%esp
 888:	83 f8 ff             	cmp    $0xffffffff,%eax
 88b:	74 1c                	je     8a9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 88d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 890:	83 c0 08             	add    $0x8,%eax
 893:	83 ec 0c             	sub    $0xc,%esp
 896:	50                   	push   %eax
 897:	e8 54 ff ff ff       	call   7f0 <free>
  return freep;
 89c:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 8a1:	83 c4 10             	add    $0x10,%esp
}
 8a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a7:	c9                   	leave  
 8a8:	c3                   	ret    
    return 0;
 8a9:	b8 00 00 00 00       	mov    $0x0,%eax
 8ae:	eb f4                	jmp    8a4 <morecore+0x44>

000008b0 <malloc>:

void*
malloc(uint nbytes)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	53                   	push   %ebx
 8b4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ba:	8d 58 07             	lea    0x7(%eax),%ebx
 8bd:	c1 eb 03             	shr    $0x3,%ebx
 8c0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8c3:	8b 0d f8 0d 00 00    	mov    0xdf8,%ecx
 8c9:	85 c9                	test   %ecx,%ecx
 8cb:	74 04                	je     8d1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8cd:	8b 01                	mov    (%ecx),%eax
 8cf:	eb 4a                	jmp    91b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8d1:	c7 05 f8 0d 00 00 fc 	movl   $0xdfc,0xdf8
 8d8:	0d 00 00 
 8db:	c7 05 fc 0d 00 00 fc 	movl   $0xdfc,0xdfc
 8e2:	0d 00 00 
    base.s.size = 0;
 8e5:	c7 05 00 0e 00 00 00 	movl   $0x0,0xe00
 8ec:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ef:	b9 fc 0d 00 00       	mov    $0xdfc,%ecx
 8f4:	eb d7                	jmp    8cd <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8f6:	74 19                	je     911 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8f8:	29 da                	sub    %ebx,%edx
 8fa:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8fd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 900:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 903:	89 0d f8 0d 00 00    	mov    %ecx,0xdf8
      return (void*)(p + 1);
 909:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 90c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 90f:	c9                   	leave  
 910:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 911:	8b 10                	mov    (%eax),%edx
 913:	89 11                	mov    %edx,(%ecx)
 915:	eb ec                	jmp    903 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 917:	89 c1                	mov    %eax,%ecx
 919:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 91b:	8b 50 04             	mov    0x4(%eax),%edx
 91e:	39 da                	cmp    %ebx,%edx
 920:	73 d4                	jae    8f6 <malloc+0x46>
    if(p == freep)
 922:	39 05 f8 0d 00 00    	cmp    %eax,0xdf8
 928:	75 ed                	jne    917 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 92a:	89 d8                	mov    %ebx,%eax
 92c:	e8 2f ff ff ff       	call   860 <morecore>
 931:	85 c0                	test   %eax,%eax
 933:	75 e2                	jne    917 <malloc+0x67>
 935:	eb d5                	jmp    90c <malloc+0x5c>
