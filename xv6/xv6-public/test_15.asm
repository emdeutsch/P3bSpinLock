
_test_15:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   7:	bb 00 00 00 00       	mov    $0x0,%ebx
   c:	eb 23                	jmp    31 <worker+0x31>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
   e:	83 c0 01             	add    $0x1,%eax
  11:	83 f8 31             	cmp    $0x31,%eax
  14:	7e f8                	jle    e <worker+0xe>
      global = tmp + 1;
  16:	8d 42 01             	lea    0x1(%edx),%eax
  19:	a3 88 0c 00 00       	mov    %eax,0xc88
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 84 0c 00 00       	push   $0xc84
  26:	e8 75 03 00 00       	call   3a0 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 7c 0c 00 00    	cmp    %ebx,0xc7c
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 84 0c 00 00       	push   $0xc84
  41:	e8 38 03 00 00       	call   37e <lock_acquire>
      tmp = global;
  46:	8b 15 88 0c 00 00    	mov    0xc88,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 ba 03 00 00       	call   415 <exit>

0000005b <main>:
{
  5b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  5f:	83 e4 f0             	and    $0xfffffff0,%esp
  62:	ff 71 fc             	push   -0x4(%ecx)
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	53                   	push   %ebx
  69:	51                   	push   %ecx
   ppid = getpid();
  6a:	e8 26 04 00 00       	call   495 <getpid>
  6f:	a3 8c 0c 00 00       	mov    %eax,0xc8c
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 84 0c 00 00       	push   $0xc84
  7c:	e8 ef 02 00 00       	call   370 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 80 0c 00 00    	cmp    %ebx,0xc80
  94:	7e 61                	jle    f7 <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 00 00 00 00       	push   $0x0
  a2:	e8 07 03 00 00       	call   3ae <thread_create>
      assert(thread_pid > 0);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	7f dd                	jg     8b <main+0x30>
  ae:	6a 25                	push   $0x25
  b0:	68 18 08 00 00       	push   $0x818
  b5:	68 22 08 00 00       	push   $0x822
  ba:	6a 01                	push   $0x1
  bc:	e8 a9 04 00 00       	call   56a <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 2a 08 00 00       	push   $0x82a
  c9:	68 39 08 00 00       	push   $0x839
  ce:	6a 01                	push   $0x1
  d0:	e8 95 04 00 00       	call   56a <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 4d 08 00 00       	push   $0x84d
  dd:	6a 01                	push   $0x1
  df:	e8 86 04 00 00       	call   56a <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 8c 0c 00 00    	push   0xc8c
  ed:	e8 53 03 00 00       	call   445 <kill>
  f2:	e8 1e 03 00 00       	call   415 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 80 0c 00 00       	mov    0xc80,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 dc 02 00 00       	call   3e6 <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 18 08 00 00       	push   $0x818
 11a:	68 22 08 00 00       	push   $0x822
 11f:	6a 01                	push   $0x1
 121:	e8 44 04 00 00       	call   56a <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 5a 08 00 00       	push   $0x85a
 12e:	68 39 08 00 00       	push   $0x839
 133:	6a 01                	push   $0x1
 135:	e8 30 04 00 00       	call   56a <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 4d 08 00 00       	push   $0x84d
 142:	6a 01                	push   $0x1
 144:	e8 21 04 00 00       	call   56a <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 8c 0c 00 00    	push   0xc8c
 152:	e8 ee 02 00 00       	call   445 <kill>
 157:	e8 b9 02 00 00       	call   415 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 7c 0c 00 00 	imul   0xc7c,%eax
 163:	3b 05 88 0c 00 00    	cmp    0xc88,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 18 08 00 00       	push   $0x818
 172:	68 22 08 00 00       	push   $0x822
 177:	6a 01                	push   $0x1
 179:	e8 ec 03 00 00       	call   56a <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 67 08 00 00       	push   $0x867
 186:	68 39 08 00 00       	push   $0x839
 18b:	6a 01                	push   $0x1
 18d:	e8 d8 03 00 00       	call   56a <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 4d 08 00 00       	push   $0x84d
 19a:	6a 01                	push   $0x1
 19c:	e8 c9 03 00 00       	call   56a <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 8c 0c 00 00    	push   0xc8c
 1aa:	e8 96 02 00 00       	call   445 <kill>
 1af:	e8 61 02 00 00       	call   415 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 85 08 00 00       	push   $0x885
 1bc:	6a 01                	push   $0x1
 1be:	e8 a7 03 00 00       	call   56a <printf>
   exit();
 1c3:	e8 4d 02 00 00       	call   415 <exit>

000001c8 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	56                   	push   %esi
 1cc:	53                   	push   %ebx
 1cd:	8b 75 08             	mov    0x8(%ebp),%esi
 1d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d3:	89 f0                	mov    %esi,%eax
 1d5:	89 d1                	mov    %edx,%ecx
 1d7:	83 c2 01             	add    $0x1,%edx
 1da:	89 c3                	mov    %eax,%ebx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	0f b6 09             	movzbl (%ecx),%ecx
 1e2:	88 0b                	mov    %cl,(%ebx)
 1e4:	84 c9                	test   %cl,%cl
 1e6:	75 ed                	jne    1d5 <strcpy+0xd>
    ;
  return os;
}
 1e8:	89 f0                	mov    %esi,%eax
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    

000001ee <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1f7:	eb 06                	jmp    1ff <strcmp+0x11>
    p++, q++;
 1f9:	83 c1 01             	add    $0x1,%ecx
 1fc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ff:	0f b6 01             	movzbl (%ecx),%eax
 202:	84 c0                	test   %al,%al
 204:	74 04                	je     20a <strcmp+0x1c>
 206:	3a 02                	cmp    (%edx),%al
 208:	74 ef                	je     1f9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 20a:	0f b6 c0             	movzbl %al,%eax
 20d:	0f b6 12             	movzbl (%edx),%edx
 210:	29 d0                	sub    %edx,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <strlen>:

uint
strlen(const char *s)
{
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
 21f:	eb 03                	jmp    224 <strlen+0x10>
 221:	83 c0 01             	add    $0x1,%eax
 224:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 228:	75 f7                	jne    221 <strlen+0xd>
    ;
  return n;
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <memset>:

void*
memset(void *dst, int c, uint n)
{
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	57                   	push   %edi
 230:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 233:	89 d7                	mov    %edx,%edi
 235:	8b 4d 10             	mov    0x10(%ebp),%ecx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	fc                   	cld    
 23c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 23e:	89 d0                	mov    %edx,%eax
 240:	8b 7d fc             	mov    -0x4(%ebp),%edi
 243:	c9                   	leave  
 244:	c3                   	ret    

00000245 <strchr>:

char*
strchr(const char *s, char c)
{
 245:	55                   	push   %ebp
 246:	89 e5                	mov    %esp,%ebp
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 24f:	eb 03                	jmp    254 <strchr+0xf>
 251:	83 c0 01             	add    $0x1,%eax
 254:	0f b6 10             	movzbl (%eax),%edx
 257:	84 d2                	test   %dl,%dl
 259:	74 06                	je     261 <strchr+0x1c>
    if(*s == c)
 25b:	38 ca                	cmp    %cl,%dl
 25d:	75 f2                	jne    251 <strchr+0xc>
 25f:	eb 05                	jmp    266 <strchr+0x21>
      return (char*)s;
  return 0;
 261:	b8 00 00 00 00       	mov    $0x0,%eax
}
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    

00000268 <gets>:

char*
gets(char *buf, int max)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	57                   	push   %edi
 26c:	56                   	push   %esi
 26d:	53                   	push   %ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 274:	bb 00 00 00 00       	mov    $0x0,%ebx
 279:	89 de                	mov    %ebx,%esi
 27b:	83 c3 01             	add    $0x1,%ebx
 27e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 281:	7d 2e                	jge    2b1 <gets+0x49>
    cc = read(0, &c, 1);
 283:	83 ec 04             	sub    $0x4,%esp
 286:	6a 01                	push   $0x1
 288:	8d 45 e7             	lea    -0x19(%ebp),%eax
 28b:	50                   	push   %eax
 28c:	6a 00                	push   $0x0
 28e:	e8 9a 01 00 00       	call   42d <read>
    if(cc < 1)
 293:	83 c4 10             	add    $0x10,%esp
 296:	85 c0                	test   %eax,%eax
 298:	7e 17                	jle    2b1 <gets+0x49>
      break;
    buf[i++] = c;
 29a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	0f 94 c2             	sete   %dl
 2a6:	3c 0d                	cmp    $0xd,%al
 2a8:	0f 94 c0             	sete   %al
 2ab:	08 c2                	or     %al,%dl
 2ad:	74 ca                	je     279 <gets+0x11>
    buf[i++] = c;
 2af:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2b1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2b5:	89 f8                	mov    %edi,%eax
 2b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ba:	5b                   	pop    %ebx
 2bb:	5e                   	pop    %esi
 2bc:	5f                   	pop    %edi
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    

000002bf <stat>:

int
stat(const char *n, struct stat *st)
{
 2bf:	55                   	push   %ebp
 2c0:	89 e5                	mov    %esp,%ebp
 2c2:	56                   	push   %esi
 2c3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c4:	83 ec 08             	sub    $0x8,%esp
 2c7:	6a 00                	push   $0x0
 2c9:	ff 75 08             	push   0x8(%ebp)
 2cc:	e8 84 01 00 00       	call   455 <open>
  if(fd < 0)
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	85 c0                	test   %eax,%eax
 2d6:	78 24                	js     2fc <stat+0x3d>
 2d8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2da:	83 ec 08             	sub    $0x8,%esp
 2dd:	ff 75 0c             	push   0xc(%ebp)
 2e0:	50                   	push   %eax
 2e1:	e8 87 01 00 00       	call   46d <fstat>
 2e6:	89 c6                	mov    %eax,%esi
  close(fd);
 2e8:	89 1c 24             	mov    %ebx,(%esp)
 2eb:	e8 4d 01 00 00       	call   43d <close>
  return r;
 2f0:	83 c4 10             	add    $0x10,%esp
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f8:	5b                   	pop    %ebx
 2f9:	5e                   	pop    %esi
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    
    return -1;
 2fc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 301:	eb f0                	jmp    2f3 <stat+0x34>

00000303 <atoi>:

int
atoi(const char *s)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	53                   	push   %ebx
 307:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 30a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 30f:	eb 10                	jmp    321 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 311:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 314:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 317:	83 c1 01             	add    $0x1,%ecx
 31a:	0f be c0             	movsbl %al,%eax
 31d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 321:	0f b6 01             	movzbl (%ecx),%eax
 324:	8d 58 d0             	lea    -0x30(%eax),%ebx
 327:	80 fb 09             	cmp    $0x9,%bl
 32a:	76 e5                	jbe    311 <atoi+0xe>
  return n;
}
 32c:	89 d0                	mov    %edx,%eax
 32e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 331:	c9                   	leave  
 332:	c3                   	ret    

00000333 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	56                   	push   %esi
 337:	53                   	push   %ebx
 338:	8b 75 08             	mov    0x8(%ebp),%esi
 33b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 33e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 341:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 343:	eb 0d                	jmp    352 <memmove+0x1f>
    *dst++ = *src++;
 345:	0f b6 01             	movzbl (%ecx),%eax
 348:	88 02                	mov    %al,(%edx)
 34a:	8d 49 01             	lea    0x1(%ecx),%ecx
 34d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 350:	89 d8                	mov    %ebx,%eax
 352:	8d 58 ff             	lea    -0x1(%eax),%ebx
 355:	85 c0                	test   %eax,%eax
 357:	7f ec                	jg     345 <memmove+0x12>
  return vdst;
}
 359:	89 f0                	mov    %esi,%eax
 35b:	5b                   	pop    %ebx
 35c:	5e                   	pop    %esi
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    

0000035f <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 365:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 36a:	89 08                	mov    %ecx,(%eax)
  return old;
}
 36c:	89 d0                	mov    %edx,%eax
 36e:	5d                   	pop    %ebp
 36f:	c3                   	ret    

00000370 <lock_init>:
void 
lock_init(lock_t *lock){
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    

0000037e <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 37e:	55                   	push   %ebp
 37f:	89 e5                	mov    %esp,%ebp
 381:	53                   	push   %ebx
 382:	83 ec 04             	sub    $0x4,%esp
 385:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 388:	83 ec 08             	sub    $0x8,%esp
 38b:	6a 01                	push   $0x1
 38d:	53                   	push   %ebx
 38e:	e8 cc ff ff ff       	call   35f <TestAndSet>
 393:	83 c4 10             	add    $0x10,%esp
 396:	83 f8 01             	cmp    $0x1,%eax
 399:	74 ed                	je     388 <lock_acquire+0xa>
    ;
}
 39b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 39e:	c9                   	leave  
 39f:	c3                   	ret    

000003a0 <lock_release>:
void 
lock_release(lock_t *lock){
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3ae:	55                   	push   %ebp
 3af:	89 e5                	mov    %esp,%ebp
 3b1:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 3b4:	68 04 20 00 00       	push   $0x2004
 3b9:	e8 d2 03 00 00       	call   790 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 3be:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 3c1:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 3c3:	eb 03                	jmp    3c8 <thread_create+0x1a>
      stack += 1;
 3c5:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 3c8:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 3ce:	75 f5                	jne    3c5 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 3d0:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 3d2:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 3d5:	52                   	push   %edx
 3d6:	ff 75 10             	push   0x10(%ebp)
 3d9:	ff 75 0c             	push   0xc(%ebp)
 3dc:	ff 75 08             	push   0x8(%ebp)
 3df:	e8 d1 00 00 00       	call   4b5 <clone>
 
    return pid;
}
 3e4:	c9                   	leave  
 3e5:	c3                   	ret    

000003e6 <thread_join>:
int 
thread_join(){
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	53                   	push   %ebx
 3ea:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 3ed:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3f0:	50                   	push   %eax
 3f1:	e8 c7 00 00 00       	call   4bd <join>
 3f6:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 3f8:	83 c4 04             	add    $0x4,%esp
 3fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3fe:	ff 70 fc             	push   -0x4(%eax)
 401:	e8 ca 02 00 00       	call   6d0 <free>
  return waitedForPID;
 406:	89 d8                	mov    %ebx,%eax
 408:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40b:	c9                   	leave  
 40c:	c3                   	ret    

0000040d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40d:	b8 01 00 00 00       	mov    $0x1,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <exit>:
SYSCALL(exit)
 415:	b8 02 00 00 00       	mov    $0x2,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <wait>:
SYSCALL(wait)
 41d:	b8 03 00 00 00       	mov    $0x3,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <pipe>:
SYSCALL(pipe)
 425:	b8 04 00 00 00       	mov    $0x4,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <read>:
SYSCALL(read)
 42d:	b8 05 00 00 00       	mov    $0x5,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <write>:
SYSCALL(write)
 435:	b8 10 00 00 00       	mov    $0x10,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <close>:
SYSCALL(close)
 43d:	b8 15 00 00 00       	mov    $0x15,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <kill>:
SYSCALL(kill)
 445:	b8 06 00 00 00       	mov    $0x6,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <exec>:
SYSCALL(exec)
 44d:	b8 07 00 00 00       	mov    $0x7,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <open>:
SYSCALL(open)
 455:	b8 0f 00 00 00       	mov    $0xf,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <mknod>:
SYSCALL(mknod)
 45d:	b8 11 00 00 00       	mov    $0x11,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <unlink>:
SYSCALL(unlink)
 465:	b8 12 00 00 00       	mov    $0x12,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <fstat>:
SYSCALL(fstat)
 46d:	b8 08 00 00 00       	mov    $0x8,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <link>:
SYSCALL(link)
 475:	b8 13 00 00 00       	mov    $0x13,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <mkdir>:
SYSCALL(mkdir)
 47d:	b8 14 00 00 00       	mov    $0x14,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <chdir>:
SYSCALL(chdir)
 485:	b8 09 00 00 00       	mov    $0x9,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <dup>:
SYSCALL(dup)
 48d:	b8 0a 00 00 00       	mov    $0xa,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <getpid>:
SYSCALL(getpid)
 495:	b8 0b 00 00 00       	mov    $0xb,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <sbrk>:
SYSCALL(sbrk)
 49d:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <sleep>:
SYSCALL(sleep)
 4a5:	b8 0d 00 00 00       	mov    $0xd,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <uptime>:
SYSCALL(uptime)
 4ad:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <clone>:
SYSCALL(clone)
 4b5:	b8 16 00 00 00       	mov    $0x16,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <join>:
SYSCALL(join)
 4bd:	b8 17 00 00 00       	mov    $0x17,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	83 ec 1c             	sub    $0x1c,%esp
 4cb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4ce:	6a 01                	push   $0x1
 4d0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4d3:	52                   	push   %edx
 4d4:	50                   	push   %eax
 4d5:	e8 5b ff ff ff       	call   435 <write>
}
 4da:	83 c4 10             	add    $0x10,%esp
 4dd:	c9                   	leave  
 4de:	c3                   	ret    

000004df <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
 4e2:	57                   	push   %edi
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
 4e5:	83 ec 2c             	sub    $0x2c,%esp
 4e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4eb:	89 d0                	mov    %edx,%eax
 4ed:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4f3:	0f 95 c1             	setne  %cl
 4f6:	c1 ea 1f             	shr    $0x1f,%edx
 4f9:	84 d1                	test   %dl,%cl
 4fb:	74 44                	je     541 <printint+0x62>
    neg = 1;
    x = -xx;
 4fd:	f7 d8                	neg    %eax
 4ff:	89 c1                	mov    %eax,%ecx
    neg = 1;
 501:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 508:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 50d:	89 c8                	mov    %ecx,%eax
 50f:	ba 00 00 00 00       	mov    $0x0,%edx
 514:	f7 f6                	div    %esi
 516:	89 df                	mov    %ebx,%edi
 518:	83 c3 01             	add    $0x1,%ebx
 51b:	0f b6 92 f4 08 00 00 	movzbl 0x8f4(%edx),%edx
 522:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 526:	89 ca                	mov    %ecx,%edx
 528:	89 c1                	mov    %eax,%ecx
 52a:	39 d6                	cmp    %edx,%esi
 52c:	76 df                	jbe    50d <printint+0x2e>
  if(neg)
 52e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 532:	74 31                	je     565 <printint+0x86>
    buf[i++] = '-';
 534:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 539:	8d 5f 02             	lea    0x2(%edi),%ebx
 53c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 53f:	eb 17                	jmp    558 <printint+0x79>
    x = xx;
 541:	89 c1                	mov    %eax,%ecx
  neg = 0;
 543:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 54a:	eb bc                	jmp    508 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 54c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 551:	89 f0                	mov    %esi,%eax
 553:	e8 6d ff ff ff       	call   4c5 <putc>
  while(--i >= 0)
 558:	83 eb 01             	sub    $0x1,%ebx
 55b:	79 ef                	jns    54c <printint+0x6d>
}
 55d:	83 c4 2c             	add    $0x2c,%esp
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5f                   	pop    %edi
 563:	5d                   	pop    %ebp
 564:	c3                   	ret    
 565:	8b 75 d0             	mov    -0x30(%ebp),%esi
 568:	eb ee                	jmp    558 <printint+0x79>

0000056a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 56a:	55                   	push   %ebp
 56b:	89 e5                	mov    %esp,%ebp
 56d:	57                   	push   %edi
 56e:	56                   	push   %esi
 56f:	53                   	push   %ebx
 570:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 573:	8d 45 10             	lea    0x10(%ebp),%eax
 576:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 579:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 57e:	bb 00 00 00 00       	mov    $0x0,%ebx
 583:	eb 14                	jmp    599 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 585:	89 fa                	mov    %edi,%edx
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	e8 36 ff ff ff       	call   4c5 <putc>
 58f:	eb 05                	jmp    596 <printf+0x2c>
      }
    } else if(state == '%'){
 591:	83 fe 25             	cmp    $0x25,%esi
 594:	74 25                	je     5bb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 596:	83 c3 01             	add    $0x1,%ebx
 599:	8b 45 0c             	mov    0xc(%ebp),%eax
 59c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5a0:	84 c0                	test   %al,%al
 5a2:	0f 84 20 01 00 00    	je     6c8 <printf+0x15e>
    c = fmt[i] & 0xff;
 5a8:	0f be f8             	movsbl %al,%edi
 5ab:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5ae:	85 f6                	test   %esi,%esi
 5b0:	75 df                	jne    591 <printf+0x27>
      if(c == '%'){
 5b2:	83 f8 25             	cmp    $0x25,%eax
 5b5:	75 ce                	jne    585 <printf+0x1b>
        state = '%';
 5b7:	89 c6                	mov    %eax,%esi
 5b9:	eb db                	jmp    596 <printf+0x2c>
      if(c == 'd'){
 5bb:	83 f8 25             	cmp    $0x25,%eax
 5be:	0f 84 cf 00 00 00    	je     693 <printf+0x129>
 5c4:	0f 8c dd 00 00 00    	jl     6a7 <printf+0x13d>
 5ca:	83 f8 78             	cmp    $0x78,%eax
 5cd:	0f 8f d4 00 00 00    	jg     6a7 <printf+0x13d>
 5d3:	83 f8 63             	cmp    $0x63,%eax
 5d6:	0f 8c cb 00 00 00    	jl     6a7 <printf+0x13d>
 5dc:	83 e8 63             	sub    $0x63,%eax
 5df:	83 f8 15             	cmp    $0x15,%eax
 5e2:	0f 87 bf 00 00 00    	ja     6a7 <printf+0x13d>
 5e8:	ff 24 85 9c 08 00 00 	jmp    *0x89c(,%eax,4)
        printint(fd, *ap, 10, 1);
 5ef:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f2:	8b 17                	mov    (%edi),%edx
 5f4:	83 ec 0c             	sub    $0xc,%esp
 5f7:	6a 01                	push   $0x1
 5f9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	e8 d9 fe ff ff       	call   4df <printint>
        ap++;
 606:	83 c7 04             	add    $0x4,%edi
 609:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 60c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60f:	be 00 00 00 00       	mov    $0x0,%esi
 614:	eb 80                	jmp    596 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 616:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 619:	8b 17                	mov    (%edi),%edx
 61b:	83 ec 0c             	sub    $0xc,%esp
 61e:	6a 00                	push   $0x0
 620:	b9 10 00 00 00       	mov    $0x10,%ecx
 625:	8b 45 08             	mov    0x8(%ebp),%eax
 628:	e8 b2 fe ff ff       	call   4df <printint>
        ap++;
 62d:	83 c7 04             	add    $0x4,%edi
 630:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 633:	83 c4 10             	add    $0x10,%esp
      state = 0;
 636:	be 00 00 00 00       	mov    $0x0,%esi
 63b:	e9 56 ff ff ff       	jmp    596 <printf+0x2c>
        s = (char*)*ap;
 640:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 643:	8b 30                	mov    (%eax),%esi
        ap++;
 645:	83 c0 04             	add    $0x4,%eax
 648:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 64b:	85 f6                	test   %esi,%esi
 64d:	75 15                	jne    664 <printf+0xfa>
          s = "(null)";
 64f:	be 92 08 00 00       	mov    $0x892,%esi
 654:	eb 0e                	jmp    664 <printf+0xfa>
          putc(fd, *s);
 656:	0f be d2             	movsbl %dl,%edx
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	e8 64 fe ff ff       	call   4c5 <putc>
          s++;
 661:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 664:	0f b6 16             	movzbl (%esi),%edx
 667:	84 d2                	test   %dl,%dl
 669:	75 eb                	jne    656 <printf+0xec>
      state = 0;
 66b:	be 00 00 00 00       	mov    $0x0,%esi
 670:	e9 21 ff ff ff       	jmp    596 <printf+0x2c>
        putc(fd, *ap);
 675:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 678:	0f be 17             	movsbl (%edi),%edx
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	e8 42 fe ff ff       	call   4c5 <putc>
        ap++;
 683:	83 c7 04             	add    $0x4,%edi
 686:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 689:	be 00 00 00 00       	mov    $0x0,%esi
 68e:	e9 03 ff ff ff       	jmp    596 <printf+0x2c>
        putc(fd, c);
 693:	89 fa                	mov    %edi,%edx
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	e8 28 fe ff ff       	call   4c5 <putc>
      state = 0;
 69d:	be 00 00 00 00       	mov    $0x0,%esi
 6a2:	e9 ef fe ff ff       	jmp    596 <printf+0x2c>
        putc(fd, '%');
 6a7:	ba 25 00 00 00       	mov    $0x25,%edx
 6ac:	8b 45 08             	mov    0x8(%ebp),%eax
 6af:	e8 11 fe ff ff       	call   4c5 <putc>
        putc(fd, c);
 6b4:	89 fa                	mov    %edi,%edx
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	e8 07 fe ff ff       	call   4c5 <putc>
      state = 0;
 6be:	be 00 00 00 00       	mov    $0x0,%esi
 6c3:	e9 ce fe ff ff       	jmp    596 <printf+0x2c>
    }
  }
}
 6c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6cb:	5b                   	pop    %ebx
 6cc:	5e                   	pop    %esi
 6cd:	5f                   	pop    %edi
 6ce:	5d                   	pop    %ebp
 6cf:	c3                   	ret    

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dc:	a1 90 0c 00 00       	mov    0xc90,%eax
 6e1:	eb 02                	jmp    6e5 <free+0x15>
 6e3:	89 d0                	mov    %edx,%eax
 6e5:	39 c8                	cmp    %ecx,%eax
 6e7:	73 04                	jae    6ed <free+0x1d>
 6e9:	39 08                	cmp    %ecx,(%eax)
 6eb:	77 12                	ja     6ff <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ed:	8b 10                	mov    (%eax),%edx
 6ef:	39 c2                	cmp    %eax,%edx
 6f1:	77 f0                	ja     6e3 <free+0x13>
 6f3:	39 c8                	cmp    %ecx,%eax
 6f5:	72 08                	jb     6ff <free+0x2f>
 6f7:	39 ca                	cmp    %ecx,%edx
 6f9:	77 04                	ja     6ff <free+0x2f>
 6fb:	89 d0                	mov    %edx,%eax
 6fd:	eb e6                	jmp    6e5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ff:	8b 73 fc             	mov    -0x4(%ebx),%esi
 702:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 705:	8b 10                	mov    (%eax),%edx
 707:	39 d7                	cmp    %edx,%edi
 709:	74 19                	je     724 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 70b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70e:	8b 50 04             	mov    0x4(%eax),%edx
 711:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 714:	39 ce                	cmp    %ecx,%esi
 716:	74 1b                	je     733 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 718:	89 08                	mov    %ecx,(%eax)
  freep = p;
 71a:	a3 90 0c 00 00       	mov    %eax,0xc90
}
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5f                   	pop    %edi
 722:	5d                   	pop    %ebp
 723:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 724:	03 72 04             	add    0x4(%edx),%esi
 727:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 72a:	8b 10                	mov    (%eax),%edx
 72c:	8b 12                	mov    (%edx),%edx
 72e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 731:	eb db                	jmp    70e <free+0x3e>
    p->s.size += bp->s.size;
 733:	03 53 fc             	add    -0x4(%ebx),%edx
 736:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 739:	8b 53 f8             	mov    -0x8(%ebx),%edx
 73c:	89 10                	mov    %edx,(%eax)
 73e:	eb da                	jmp    71a <free+0x4a>

00000740 <morecore>:

static Header*
morecore(uint nu)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	53                   	push   %ebx
 744:	83 ec 04             	sub    $0x4,%esp
 747:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 749:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 74e:	77 05                	ja     755 <morecore+0x15>
    nu = 4096;
 750:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 755:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 75c:	83 ec 0c             	sub    $0xc,%esp
 75f:	50                   	push   %eax
 760:	e8 38 fd ff ff       	call   49d <sbrk>
  if(p == (char*)-1)
 765:	83 c4 10             	add    $0x10,%esp
 768:	83 f8 ff             	cmp    $0xffffffff,%eax
 76b:	74 1c                	je     789 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 76d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 770:	83 c0 08             	add    $0x8,%eax
 773:	83 ec 0c             	sub    $0xc,%esp
 776:	50                   	push   %eax
 777:	e8 54 ff ff ff       	call   6d0 <free>
  return freep;
 77c:	a1 90 0c 00 00       	mov    0xc90,%eax
 781:	83 c4 10             	add    $0x10,%esp
}
 784:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 787:	c9                   	leave  
 788:	c3                   	ret    
    return 0;
 789:	b8 00 00 00 00       	mov    $0x0,%eax
 78e:	eb f4                	jmp    784 <morecore+0x44>

00000790 <malloc>:

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	53                   	push   %ebx
 794:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 797:	8b 45 08             	mov    0x8(%ebp),%eax
 79a:	8d 58 07             	lea    0x7(%eax),%ebx
 79d:	c1 eb 03             	shr    $0x3,%ebx
 7a0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7a3:	8b 0d 90 0c 00 00    	mov    0xc90,%ecx
 7a9:	85 c9                	test   %ecx,%ecx
 7ab:	74 04                	je     7b1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ad:	8b 01                	mov    (%ecx),%eax
 7af:	eb 4a                	jmp    7fb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7b1:	c7 05 90 0c 00 00 94 	movl   $0xc94,0xc90
 7b8:	0c 00 00 
 7bb:	c7 05 94 0c 00 00 94 	movl   $0xc94,0xc94
 7c2:	0c 00 00 
    base.s.size = 0;
 7c5:	c7 05 98 0c 00 00 00 	movl   $0x0,0xc98
 7cc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7cf:	b9 94 0c 00 00       	mov    $0xc94,%ecx
 7d4:	eb d7                	jmp    7ad <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7d6:	74 19                	je     7f1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7d8:	29 da                	sub    %ebx,%edx
 7da:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7dd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7e0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7e3:	89 0d 90 0c 00 00    	mov    %ecx,0xc90
      return (void*)(p + 1);
 7e9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7ef:	c9                   	leave  
 7f0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7f1:	8b 10                	mov    (%eax),%edx
 7f3:	89 11                	mov    %edx,(%ecx)
 7f5:	eb ec                	jmp    7e3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f7:	89 c1                	mov    %eax,%ecx
 7f9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7fb:	8b 50 04             	mov    0x4(%eax),%edx
 7fe:	39 da                	cmp    %ebx,%edx
 800:	73 d4                	jae    7d6 <malloc+0x46>
    if(p == freep)
 802:	39 05 90 0c 00 00    	cmp    %eax,0xc90
 808:	75 ed                	jne    7f7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 80a:	89 d8                	mov    %ebx,%eax
 80c:	e8 2f ff ff ff       	call   740 <morecore>
 811:	85 c0                	test   %eax,%eax
 813:	75 e2                	jne    7f7 <malloc+0x67>
 815:	eb d5                	jmp    7ec <malloc+0x5c>
