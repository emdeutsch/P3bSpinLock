
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
  36:	e8 fb 04 00 00       	call   536 <exit>

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
  8c:	e8 76 04 00 00       	call   507 <thread_join>
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
  af:	e8 d7 05 00 00       	call   68b <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 bc 09 00 00       	push   $0x9bc
  bc:	68 60 09 00 00       	push   $0x960
  c1:	6a 01                	push   $0x1
  c3:	e8 c3 05 00 00       	call   68b <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 74 09 00 00       	push   $0x974
  d0:	6a 01                	push   $0x1
  d2:	e8 b4 05 00 00       	call   68b <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 f4 0d 00 00    	push   0xdf4
  e0:	e8 81 04 00 00       	call   566 <kill>
  e5:	e8 4c 04 00 00       	call   536 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 38 09 00 00       	push   $0x938
  f1:	68 42 09 00 00       	push   $0x942
  f6:	6a 01                	push   $0x1
  f8:	e8 8e 05 00 00       	call   68b <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 4a 09 00 00       	push   $0x94a
 105:	68 60 09 00 00       	push   $0x960
 10a:	6a 01                	push   $0x1
 10c:	e8 7a 05 00 00       	call   68b <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 74 09 00 00       	push   $0x974
 119:	6a 01                	push   $0x1
 11b:	e8 6b 05 00 00       	call   68b <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 f4 0d 00 00    	push   0xdf4
 129:	e8 38 04 00 00       	call   566 <kill>
 12e:	e8 03 04 00 00       	call   536 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 38 09 00 00       	push   $0x938
 13a:	68 42 09 00 00       	push   $0x942
 13f:	6a 01                	push   $0x1
 141:	e8 45 05 00 00       	call   68b <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 81 09 00 00       	push   $0x981
 14e:	68 60 09 00 00       	push   $0x960
 153:	6a 01                	push   $0x1
 155:	e8 31 05 00 00       	call   68b <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 74 09 00 00       	push   $0x974
 162:	6a 01                	push   $0x1
 164:	e8 22 05 00 00       	call   68b <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 f4 0d 00 00    	push   0xdf4
 172:	e8 ef 03 00 00       	call   566 <kill>
 177:	e8 ba 03 00 00       	call   536 <exit>

   exit();
 17c:	e8 b5 03 00 00       	call   536 <exit>

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
 190:	e8 21 04 00 00       	call   5b6 <getpid>
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
 1e2:	e8 a4 04 00 00       	call   68b <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 51 09 00 00       	push   $0x951
 1ef:	68 60 09 00 00       	push   $0x960
 1f4:	6a 01                	push   $0x1
 1f6:	e8 90 04 00 00       	call   68b <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 74 09 00 00       	push   $0x974
 203:	6a 01                	push   $0x1
 205:	e8 81 04 00 00       	call   68b <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 f4 0d 00 00    	push   0xdf4
 213:	e8 4e 03 00 00       	call   566 <kill>
 218:	e8 19 03 00 00       	call   536 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 e8 0d 00 00       	mov    0xde8,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 d7 02 00 00       	call   507 <thread_join>
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
 247:	e8 3f 04 00 00       	call   68b <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 88 09 00 00       	push   $0x988
 254:	68 60 09 00 00       	push   $0x960
 259:	6a 01                	push   $0x1
 25b:	e8 2b 04 00 00       	call   68b <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 74 09 00 00       	push   $0x974
 268:	6a 01                	push   $0x1
 26a:	e8 1c 04 00 00       	call   68b <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 f4 0d 00 00    	push   0xdf4
 278:	e8 e9 02 00 00       	call   566 <kill>
 27d:	e8 b4 02 00 00       	call   536 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 f0 0d 00 00    	cmp    0xdf0,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 38 09 00 00       	push   $0x938
 293:	68 42 09 00 00       	push   $0x942
 298:	6a 01                	push   $0x1
 29a:	e8 ec 03 00 00       	call   68b <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 95 09 00 00       	push   $0x995
 2a7:	68 60 09 00 00       	push   $0x960
 2ac:	6a 01                	push   $0x1
 2ae:	e8 d8 03 00 00       	call   68b <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 74 09 00 00       	push   $0x974
 2bb:	6a 01                	push   $0x1
 2bd:	e8 c9 03 00 00       	call   68b <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 f4 0d 00 00    	push   0xdf4
 2cb:	e8 96 02 00 00       	call   566 <kill>
 2d0:	e8 61 02 00 00       	call   536 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 af 09 00 00       	push   $0x9af
 2dd:	6a 01                	push   $0x1
 2df:	e8 a7 03 00 00       	call   68b <printf>
   exit();
 2e4:	e8 4d 02 00 00       	call   536 <exit>

000002e9 <strcpy>:
#include "x86.h"
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
 3af:	e8 9a 01 00 00       	call   54e <read>
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
 3ed:	e8 84 01 00 00       	call   576 <open>
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
 402:	e8 87 01 00 00       	call   58e <fstat>
 407:	89 c6                	mov    %eax,%esi
  close(fd);
 409:	89 1c 24             	mov    %ebx,(%esp)
 40c:	e8 4d 01 00 00       	call   55e <close>
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
 4da:	e8 d2 03 00 00       	call   8b1 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 4df:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 4e2:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 4e4:	eb 03                	jmp    4e9 <thread_create+0x1a>
      stack += 1;
 4e6:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 4e9:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4ef:	75 f5                	jne    4e6 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 4f1:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 4f3:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4f6:	52                   	push   %edx
 4f7:	ff 75 10             	push   0x10(%ebp)
 4fa:	ff 75 0c             	push   0xc(%ebp)
 4fd:	ff 75 08             	push   0x8(%ebp)
 500:	e8 d1 00 00 00       	call   5d6 <clone>
 
    return pid;
}
 505:	c9                   	leave  
 506:	c3                   	ret    

00000507 <thread_join>:
int 
thread_join(){
 507:	55                   	push   %ebp
 508:	89 e5                	mov    %esp,%ebp
 50a:	53                   	push   %ebx
 50b:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 50e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 511:	50                   	push   %eax
 512:	e8 c7 00 00 00       	call   5de <join>
 517:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 519:	83 c4 04             	add    $0x4,%esp
 51c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51f:	ff 70 fc             	push   -0x4(%eax)
 522:	e8 ca 02 00 00       	call   7f1 <free>
  return waitedForPID;
 527:	89 d8                	mov    %ebx,%eax
 529:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 52c:	c9                   	leave  
 52d:	c3                   	ret    

0000052e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 52e:	b8 01 00 00 00       	mov    $0x1,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <exit>:
SYSCALL(exit)
 536:	b8 02 00 00 00       	mov    $0x2,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <wait>:
SYSCALL(wait)
 53e:	b8 03 00 00 00       	mov    $0x3,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <pipe>:
SYSCALL(pipe)
 546:	b8 04 00 00 00       	mov    $0x4,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <read>:
SYSCALL(read)
 54e:	b8 05 00 00 00       	mov    $0x5,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <write>:
SYSCALL(write)
 556:	b8 10 00 00 00       	mov    $0x10,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <close>:
SYSCALL(close)
 55e:	b8 15 00 00 00       	mov    $0x15,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <kill>:
SYSCALL(kill)
 566:	b8 06 00 00 00       	mov    $0x6,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <exec>:
SYSCALL(exec)
 56e:	b8 07 00 00 00       	mov    $0x7,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <open>:
SYSCALL(open)
 576:	b8 0f 00 00 00       	mov    $0xf,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <mknod>:
SYSCALL(mknod)
 57e:	b8 11 00 00 00       	mov    $0x11,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <unlink>:
SYSCALL(unlink)
 586:	b8 12 00 00 00       	mov    $0x12,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <fstat>:
SYSCALL(fstat)
 58e:	b8 08 00 00 00       	mov    $0x8,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <link>:
SYSCALL(link)
 596:	b8 13 00 00 00       	mov    $0x13,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <mkdir>:
SYSCALL(mkdir)
 59e:	b8 14 00 00 00       	mov    $0x14,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <chdir>:
SYSCALL(chdir)
 5a6:	b8 09 00 00 00       	mov    $0x9,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <dup>:
SYSCALL(dup)
 5ae:	b8 0a 00 00 00       	mov    $0xa,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <getpid>:
SYSCALL(getpid)
 5b6:	b8 0b 00 00 00       	mov    $0xb,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <sbrk>:
SYSCALL(sbrk)
 5be:	b8 0c 00 00 00       	mov    $0xc,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <sleep>:
SYSCALL(sleep)
 5c6:	b8 0d 00 00 00       	mov    $0xd,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <uptime>:
SYSCALL(uptime)
 5ce:	b8 0e 00 00 00       	mov    $0xe,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <clone>:
SYSCALL(clone)
 5d6:	b8 16 00 00 00       	mov    $0x16,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <join>:
SYSCALL(join)
 5de:	b8 17 00 00 00       	mov    $0x17,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5e6:	55                   	push   %ebp
 5e7:	89 e5                	mov    %esp,%ebp
 5e9:	83 ec 1c             	sub    $0x1c,%esp
 5ec:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ef:	6a 01                	push   $0x1
 5f1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5f4:	52                   	push   %edx
 5f5:	50                   	push   %eax
 5f6:	e8 5b ff ff ff       	call   556 <write>
}
 5fb:	83 c4 10             	add    $0x10,%esp
 5fe:	c9                   	leave  
 5ff:	c3                   	ret    

00000600 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
 609:	89 45 d0             	mov    %eax,-0x30(%ebp)
 60c:	89 d0                	mov    %edx,%eax
 60e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 610:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 614:	0f 95 c1             	setne  %cl
 617:	c1 ea 1f             	shr    $0x1f,%edx
 61a:	84 d1                	test   %dl,%cl
 61c:	74 44                	je     662 <printint+0x62>
    neg = 1;
    x = -xx;
 61e:	f7 d8                	neg    %eax
 620:	89 c1                	mov    %eax,%ecx
    neg = 1;
 622:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 629:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 62e:	89 c8                	mov    %ecx,%eax
 630:	ba 00 00 00 00       	mov    $0x0,%edx
 635:	f7 f6                	div    %esi
 637:	89 df                	mov    %ebx,%edi
 639:	83 c3 01             	add    $0x1,%ebx
 63c:	0f b6 92 40 0a 00 00 	movzbl 0xa40(%edx),%edx
 643:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 647:	89 ca                	mov    %ecx,%edx
 649:	89 c1                	mov    %eax,%ecx
 64b:	39 d6                	cmp    %edx,%esi
 64d:	76 df                	jbe    62e <printint+0x2e>
  if(neg)
 64f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 653:	74 31                	je     686 <printint+0x86>
    buf[i++] = '-';
 655:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 65a:	8d 5f 02             	lea    0x2(%edi),%ebx
 65d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 660:	eb 17                	jmp    679 <printint+0x79>
    x = xx;
 662:	89 c1                	mov    %eax,%ecx
  neg = 0;
 664:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 66b:	eb bc                	jmp    629 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 66d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 672:	89 f0                	mov    %esi,%eax
 674:	e8 6d ff ff ff       	call   5e6 <putc>
  while(--i >= 0)
 679:	83 eb 01             	sub    $0x1,%ebx
 67c:	79 ef                	jns    66d <printint+0x6d>
}
 67e:	83 c4 2c             	add    $0x2c,%esp
 681:	5b                   	pop    %ebx
 682:	5e                   	pop    %esi
 683:	5f                   	pop    %edi
 684:	5d                   	pop    %ebp
 685:	c3                   	ret    
 686:	8b 75 d0             	mov    -0x30(%ebp),%esi
 689:	eb ee                	jmp    679 <printint+0x79>

0000068b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 68b:	55                   	push   %ebp
 68c:	89 e5                	mov    %esp,%ebp
 68e:	57                   	push   %edi
 68f:	56                   	push   %esi
 690:	53                   	push   %ebx
 691:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 694:	8d 45 10             	lea    0x10(%ebp),%eax
 697:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 69a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 69f:	bb 00 00 00 00       	mov    $0x0,%ebx
 6a4:	eb 14                	jmp    6ba <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6a6:	89 fa                	mov    %edi,%edx
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	e8 36 ff ff ff       	call   5e6 <putc>
 6b0:	eb 05                	jmp    6b7 <printf+0x2c>
      }
    } else if(state == '%'){
 6b2:	83 fe 25             	cmp    $0x25,%esi
 6b5:	74 25                	je     6dc <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6b7:	83 c3 01             	add    $0x1,%ebx
 6ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 6bd:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6c1:	84 c0                	test   %al,%al
 6c3:	0f 84 20 01 00 00    	je     7e9 <printf+0x15e>
    c = fmt[i] & 0xff;
 6c9:	0f be f8             	movsbl %al,%edi
 6cc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6cf:	85 f6                	test   %esi,%esi
 6d1:	75 df                	jne    6b2 <printf+0x27>
      if(c == '%'){
 6d3:	83 f8 25             	cmp    $0x25,%eax
 6d6:	75 ce                	jne    6a6 <printf+0x1b>
        state = '%';
 6d8:	89 c6                	mov    %eax,%esi
 6da:	eb db                	jmp    6b7 <printf+0x2c>
      if(c == 'd'){
 6dc:	83 f8 25             	cmp    $0x25,%eax
 6df:	0f 84 cf 00 00 00    	je     7b4 <printf+0x129>
 6e5:	0f 8c dd 00 00 00    	jl     7c8 <printf+0x13d>
 6eb:	83 f8 78             	cmp    $0x78,%eax
 6ee:	0f 8f d4 00 00 00    	jg     7c8 <printf+0x13d>
 6f4:	83 f8 63             	cmp    $0x63,%eax
 6f7:	0f 8c cb 00 00 00    	jl     7c8 <printf+0x13d>
 6fd:	83 e8 63             	sub    $0x63,%eax
 700:	83 f8 15             	cmp    $0x15,%eax
 703:	0f 87 bf 00 00 00    	ja     7c8 <printf+0x13d>
 709:	ff 24 85 e8 09 00 00 	jmp    *0x9e8(,%eax,4)
        printint(fd, *ap, 10, 1);
 710:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 713:	8b 17                	mov    (%edi),%edx
 715:	83 ec 0c             	sub    $0xc,%esp
 718:	6a 01                	push   $0x1
 71a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 71f:	8b 45 08             	mov    0x8(%ebp),%eax
 722:	e8 d9 fe ff ff       	call   600 <printint>
        ap++;
 727:	83 c7 04             	add    $0x4,%edi
 72a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 72d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 730:	be 00 00 00 00       	mov    $0x0,%esi
 735:	eb 80                	jmp    6b7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 737:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73a:	8b 17                	mov    (%edi),%edx
 73c:	83 ec 0c             	sub    $0xc,%esp
 73f:	6a 00                	push   $0x0
 741:	b9 10 00 00 00       	mov    $0x10,%ecx
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	e8 b2 fe ff ff       	call   600 <printint>
        ap++;
 74e:	83 c7 04             	add    $0x4,%edi
 751:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 754:	83 c4 10             	add    $0x10,%esp
      state = 0;
 757:	be 00 00 00 00       	mov    $0x0,%esi
 75c:	e9 56 ff ff ff       	jmp    6b7 <printf+0x2c>
        s = (char*)*ap;
 761:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 764:	8b 30                	mov    (%eax),%esi
        ap++;
 766:	83 c0 04             	add    $0x4,%eax
 769:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 76c:	85 f6                	test   %esi,%esi
 76e:	75 15                	jne    785 <printf+0xfa>
          s = "(null)";
 770:	be df 09 00 00       	mov    $0x9df,%esi
 775:	eb 0e                	jmp    785 <printf+0xfa>
          putc(fd, *s);
 777:	0f be d2             	movsbl %dl,%edx
 77a:	8b 45 08             	mov    0x8(%ebp),%eax
 77d:	e8 64 fe ff ff       	call   5e6 <putc>
          s++;
 782:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 785:	0f b6 16             	movzbl (%esi),%edx
 788:	84 d2                	test   %dl,%dl
 78a:	75 eb                	jne    777 <printf+0xec>
      state = 0;
 78c:	be 00 00 00 00       	mov    $0x0,%esi
 791:	e9 21 ff ff ff       	jmp    6b7 <printf+0x2c>
        putc(fd, *ap);
 796:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 799:	0f be 17             	movsbl (%edi),%edx
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	e8 42 fe ff ff       	call   5e6 <putc>
        ap++;
 7a4:	83 c7 04             	add    $0x4,%edi
 7a7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7aa:	be 00 00 00 00       	mov    $0x0,%esi
 7af:	e9 03 ff ff ff       	jmp    6b7 <printf+0x2c>
        putc(fd, c);
 7b4:	89 fa                	mov    %edi,%edx
 7b6:	8b 45 08             	mov    0x8(%ebp),%eax
 7b9:	e8 28 fe ff ff       	call   5e6 <putc>
      state = 0;
 7be:	be 00 00 00 00       	mov    $0x0,%esi
 7c3:	e9 ef fe ff ff       	jmp    6b7 <printf+0x2c>
        putc(fd, '%');
 7c8:	ba 25 00 00 00       	mov    $0x25,%edx
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	e8 11 fe ff ff       	call   5e6 <putc>
        putc(fd, c);
 7d5:	89 fa                	mov    %edi,%edx
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	e8 07 fe ff ff       	call   5e6 <putc>
      state = 0;
 7df:	be 00 00 00 00       	mov    $0x0,%esi
 7e4:	e9 ce fe ff ff       	jmp    6b7 <printf+0x2c>
    }
  }
}
 7e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ec:	5b                   	pop    %ebx
 7ed:	5e                   	pop    %esi
 7ee:	5f                   	pop    %edi
 7ef:	5d                   	pop    %ebp
 7f0:	c3                   	ret    

000007f1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f1:	55                   	push   %ebp
 7f2:	89 e5                	mov    %esp,%ebp
 7f4:	57                   	push   %edi
 7f5:	56                   	push   %esi
 7f6:	53                   	push   %ebx
 7f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7fa:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fd:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 802:	eb 02                	jmp    806 <free+0x15>
 804:	89 d0                	mov    %edx,%eax
 806:	39 c8                	cmp    %ecx,%eax
 808:	73 04                	jae    80e <free+0x1d>
 80a:	39 08                	cmp    %ecx,(%eax)
 80c:	77 12                	ja     820 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80e:	8b 10                	mov    (%eax),%edx
 810:	39 c2                	cmp    %eax,%edx
 812:	77 f0                	ja     804 <free+0x13>
 814:	39 c8                	cmp    %ecx,%eax
 816:	72 08                	jb     820 <free+0x2f>
 818:	39 ca                	cmp    %ecx,%edx
 81a:	77 04                	ja     820 <free+0x2f>
 81c:	89 d0                	mov    %edx,%eax
 81e:	eb e6                	jmp    806 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 820:	8b 73 fc             	mov    -0x4(%ebx),%esi
 823:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 826:	8b 10                	mov    (%eax),%edx
 828:	39 d7                	cmp    %edx,%edi
 82a:	74 19                	je     845 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 82c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82f:	8b 50 04             	mov    0x4(%eax),%edx
 832:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 835:	39 ce                	cmp    %ecx,%esi
 837:	74 1b                	je     854 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 839:	89 08                	mov    %ecx,(%eax)
  freep = p;
 83b:	a3 f8 0d 00 00       	mov    %eax,0xdf8
}
 840:	5b                   	pop    %ebx
 841:	5e                   	pop    %esi
 842:	5f                   	pop    %edi
 843:	5d                   	pop    %ebp
 844:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 845:	03 72 04             	add    0x4(%edx),%esi
 848:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 84b:	8b 10                	mov    (%eax),%edx
 84d:	8b 12                	mov    (%edx),%edx
 84f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 852:	eb db                	jmp    82f <free+0x3e>
    p->s.size += bp->s.size;
 854:	03 53 fc             	add    -0x4(%ebx),%edx
 857:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 85d:	89 10                	mov    %edx,(%eax)
 85f:	eb da                	jmp    83b <free+0x4a>

00000861 <morecore>:

static Header*
morecore(uint nu)
{
 861:	55                   	push   %ebp
 862:	89 e5                	mov    %esp,%ebp
 864:	53                   	push   %ebx
 865:	83 ec 04             	sub    $0x4,%esp
 868:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 86a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 86f:	77 05                	ja     876 <morecore+0x15>
    nu = 4096;
 871:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 876:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 87d:	83 ec 0c             	sub    $0xc,%esp
 880:	50                   	push   %eax
 881:	e8 38 fd ff ff       	call   5be <sbrk>
  if(p == (char*)-1)
 886:	83 c4 10             	add    $0x10,%esp
 889:	83 f8 ff             	cmp    $0xffffffff,%eax
 88c:	74 1c                	je     8aa <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 88e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 891:	83 c0 08             	add    $0x8,%eax
 894:	83 ec 0c             	sub    $0xc,%esp
 897:	50                   	push   %eax
 898:	e8 54 ff ff ff       	call   7f1 <free>
  return freep;
 89d:	a1 f8 0d 00 00       	mov    0xdf8,%eax
 8a2:	83 c4 10             	add    $0x10,%esp
}
 8a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a8:	c9                   	leave  
 8a9:	c3                   	ret    
    return 0;
 8aa:	b8 00 00 00 00       	mov    $0x0,%eax
 8af:	eb f4                	jmp    8a5 <morecore+0x44>

000008b1 <malloc>:

void*
malloc(uint nbytes)
{
 8b1:	55                   	push   %ebp
 8b2:	89 e5                	mov    %esp,%ebp
 8b4:	53                   	push   %ebx
 8b5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b8:	8b 45 08             	mov    0x8(%ebp),%eax
 8bb:	8d 58 07             	lea    0x7(%eax),%ebx
 8be:	c1 eb 03             	shr    $0x3,%ebx
 8c1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8c4:	8b 0d f8 0d 00 00    	mov    0xdf8,%ecx
 8ca:	85 c9                	test   %ecx,%ecx
 8cc:	74 04                	je     8d2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ce:	8b 01                	mov    (%ecx),%eax
 8d0:	eb 4a                	jmp    91c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8d2:	c7 05 f8 0d 00 00 fc 	movl   $0xdfc,0xdf8
 8d9:	0d 00 00 
 8dc:	c7 05 fc 0d 00 00 fc 	movl   $0xdfc,0xdfc
 8e3:	0d 00 00 
    base.s.size = 0;
 8e6:	c7 05 00 0e 00 00 00 	movl   $0x0,0xe00
 8ed:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8f0:	b9 fc 0d 00 00       	mov    $0xdfc,%ecx
 8f5:	eb d7                	jmp    8ce <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8f7:	74 19                	je     912 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8f9:	29 da                	sub    %ebx,%edx
 8fb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8fe:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 901:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 904:	89 0d f8 0d 00 00    	mov    %ecx,0xdf8
      return (void*)(p + 1);
 90a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 90d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 910:	c9                   	leave  
 911:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 912:	8b 10                	mov    (%eax),%edx
 914:	89 11                	mov    %edx,(%ecx)
 916:	eb ec                	jmp    904 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 918:	89 c1                	mov    %eax,%ecx
 91a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 91c:	8b 50 04             	mov    0x4(%eax),%edx
 91f:	39 da                	cmp    %ebx,%edx
 921:	73 d4                	jae    8f7 <malloc+0x46>
    if(p == freep)
 923:	39 05 f8 0d 00 00    	cmp    %eax,0xdf8
 929:	75 ed                	jne    918 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 92b:	89 d8                	mov    %ebx,%eax
 92d:	e8 2f ff ff ff       	call   861 <morecore>
 932:	85 c0                	test   %eax,%eax
 934:	75 e2                	jne    918 <malloc+0x67>
 936:	eb d5                	jmp    90d <malloc+0x5c>
