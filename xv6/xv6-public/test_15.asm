
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
  56:	e8 b9 03 00 00       	call   414 <exit>

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
  6a:	e8 25 04 00 00       	call   494 <getpid>
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
  bc:	e8 a8 04 00 00       	call   569 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 2a 08 00 00       	push   $0x82a
  c9:	68 39 08 00 00       	push   $0x839
  ce:	6a 01                	push   $0x1
  d0:	e8 94 04 00 00       	call   569 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 4d 08 00 00       	push   $0x84d
  dd:	6a 01                	push   $0x1
  df:	e8 85 04 00 00       	call   569 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 8c 0c 00 00    	push   0xc8c
  ed:	e8 52 03 00 00       	call   444 <kill>
  f2:	e8 1d 03 00 00       	call   414 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 80 0c 00 00       	mov    0xc80,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 db 02 00 00       	call   3e5 <thread_join>
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
 121:	e8 43 04 00 00       	call   569 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 5a 08 00 00       	push   $0x85a
 12e:	68 39 08 00 00       	push   $0x839
 133:	6a 01                	push   $0x1
 135:	e8 2f 04 00 00       	call   569 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 4d 08 00 00       	push   $0x84d
 142:	6a 01                	push   $0x1
 144:	e8 20 04 00 00       	call   569 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 8c 0c 00 00    	push   0xc8c
 152:	e8 ed 02 00 00       	call   444 <kill>
 157:	e8 b8 02 00 00       	call   414 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 7c 0c 00 00 	imul   0xc7c,%eax
 163:	3b 05 88 0c 00 00    	cmp    0xc88,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 18 08 00 00       	push   $0x818
 172:	68 22 08 00 00       	push   $0x822
 177:	6a 01                	push   $0x1
 179:	e8 eb 03 00 00       	call   569 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 67 08 00 00       	push   $0x867
 186:	68 39 08 00 00       	push   $0x839
 18b:	6a 01                	push   $0x1
 18d:	e8 d7 03 00 00       	call   569 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 4d 08 00 00       	push   $0x84d
 19a:	6a 01                	push   $0x1
 19c:	e8 c8 03 00 00       	call   569 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 8c 0c 00 00    	push   0xc8c
 1aa:	e8 95 02 00 00       	call   444 <kill>
 1af:	e8 60 02 00 00       	call   414 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 85 08 00 00       	push   $0x885
 1bc:	6a 01                	push   $0x1
 1be:	e8 a6 03 00 00       	call   569 <printf>
   exit();
 1c3:	e8 4c 02 00 00       	call   414 <exit>

000001c8 <strcpy>:
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
 28e:	e8 99 01 00 00       	call   42c <read>
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
 2cc:	e8 83 01 00 00       	call   454 <open>
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
 2e1:	e8 86 01 00 00       	call   46c <fstat>
 2e6:	89 c6                	mov    %eax,%esi
  close(fd);
 2e8:	89 1c 24             	mov    %ebx,(%esp)
 2eb:	e8 4c 01 00 00       	call   43c <close>
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
 3b9:	e8 d1 03 00 00       	call   78f <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 3be:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	eb 03                	jmp    3c9 <thread_create+0x1b>
      stack += 1;
 3c6:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 3c9:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 3cf:	75 f5                	jne    3c6 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 3d1:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 3d4:	52                   	push   %edx
 3d5:	ff 75 10             	push   0x10(%ebp)
 3d8:	ff 75 0c             	push   0xc(%ebp)
 3db:	ff 75 08             	push   0x8(%ebp)
 3de:	e8 d1 00 00 00       	call   4b4 <clone>
 
    return pid;
}
 3e3:	c9                   	leave  
 3e4:	c3                   	ret    

000003e5 <thread_join>:
int 
thread_join(){
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	53                   	push   %ebx
 3e9:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 3ec:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ef:	50                   	push   %eax
 3f0:	e8 c7 00 00 00       	call   4bc <join>
 3f5:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 3f7:	83 c4 04             	add    $0x4,%esp
 3fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3fd:	ff 70 fc             	push   -0x4(%eax)
 400:	e8 ca 02 00 00       	call   6cf <free>
  return pid;
 405:	89 d8                	mov    %ebx,%eax
 407:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40c:	b8 01 00 00 00       	mov    $0x1,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <exit>:
SYSCALL(exit)
 414:	b8 02 00 00 00       	mov    $0x2,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <wait>:
SYSCALL(wait)
 41c:	b8 03 00 00 00       	mov    $0x3,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <pipe>:
SYSCALL(pipe)
 424:	b8 04 00 00 00       	mov    $0x4,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <read>:
SYSCALL(read)
 42c:	b8 05 00 00 00       	mov    $0x5,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <write>:
SYSCALL(write)
 434:	b8 10 00 00 00       	mov    $0x10,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <close>:
SYSCALL(close)
 43c:	b8 15 00 00 00       	mov    $0x15,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <kill>:
SYSCALL(kill)
 444:	b8 06 00 00 00       	mov    $0x6,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <exec>:
SYSCALL(exec)
 44c:	b8 07 00 00 00       	mov    $0x7,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <open>:
SYSCALL(open)
 454:	b8 0f 00 00 00       	mov    $0xf,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <mknod>:
SYSCALL(mknod)
 45c:	b8 11 00 00 00       	mov    $0x11,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <unlink>:
SYSCALL(unlink)
 464:	b8 12 00 00 00       	mov    $0x12,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <fstat>:
SYSCALL(fstat)
 46c:	b8 08 00 00 00       	mov    $0x8,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <link>:
SYSCALL(link)
 474:	b8 13 00 00 00       	mov    $0x13,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <mkdir>:
SYSCALL(mkdir)
 47c:	b8 14 00 00 00       	mov    $0x14,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <chdir>:
SYSCALL(chdir)
 484:	b8 09 00 00 00       	mov    $0x9,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <dup>:
SYSCALL(dup)
 48c:	b8 0a 00 00 00       	mov    $0xa,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <getpid>:
SYSCALL(getpid)
 494:	b8 0b 00 00 00       	mov    $0xb,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <sbrk>:
SYSCALL(sbrk)
 49c:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sleep>:
SYSCALL(sleep)
 4a4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <uptime>:
SYSCALL(uptime)
 4ac:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <clone>:
SYSCALL(clone)
 4b4:	b8 16 00 00 00       	mov    $0x16,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <join>:
SYSCALL(join)
 4bc:	b8 17 00 00 00       	mov    $0x17,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	83 ec 1c             	sub    $0x1c,%esp
 4ca:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4cd:	6a 01                	push   $0x1
 4cf:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4d2:	52                   	push   %edx
 4d3:	50                   	push   %eax
 4d4:	e8 5b ff ff ff       	call   434 <write>
}
 4d9:	83 c4 10             	add    $0x10,%esp
 4dc:	c9                   	leave  
 4dd:	c3                   	ret    

000004de <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	57                   	push   %edi
 4e2:	56                   	push   %esi
 4e3:	53                   	push   %ebx
 4e4:	83 ec 2c             	sub    $0x2c,%esp
 4e7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4ea:	89 d0                	mov    %edx,%eax
 4ec:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4f2:	0f 95 c1             	setne  %cl
 4f5:	c1 ea 1f             	shr    $0x1f,%edx
 4f8:	84 d1                	test   %dl,%cl
 4fa:	74 44                	je     540 <printint+0x62>
    neg = 1;
    x = -xx;
 4fc:	f7 d8                	neg    %eax
 4fe:	89 c1                	mov    %eax,%ecx
    neg = 1;
 500:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 507:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 50c:	89 c8                	mov    %ecx,%eax
 50e:	ba 00 00 00 00       	mov    $0x0,%edx
 513:	f7 f6                	div    %esi
 515:	89 df                	mov    %ebx,%edi
 517:	83 c3 01             	add    $0x1,%ebx
 51a:	0f b6 92 f4 08 00 00 	movzbl 0x8f4(%edx),%edx
 521:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 525:	89 ca                	mov    %ecx,%edx
 527:	89 c1                	mov    %eax,%ecx
 529:	39 d6                	cmp    %edx,%esi
 52b:	76 df                	jbe    50c <printint+0x2e>
  if(neg)
 52d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 531:	74 31                	je     564 <printint+0x86>
    buf[i++] = '-';
 533:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 538:	8d 5f 02             	lea    0x2(%edi),%ebx
 53b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 53e:	eb 17                	jmp    557 <printint+0x79>
    x = xx;
 540:	89 c1                	mov    %eax,%ecx
  neg = 0;
 542:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 549:	eb bc                	jmp    507 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 54b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 550:	89 f0                	mov    %esi,%eax
 552:	e8 6d ff ff ff       	call   4c4 <putc>
  while(--i >= 0)
 557:	83 eb 01             	sub    $0x1,%ebx
 55a:	79 ef                	jns    54b <printint+0x6d>
}
 55c:	83 c4 2c             	add    $0x2c,%esp
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    
 564:	8b 75 d0             	mov    -0x30(%ebp),%esi
 567:	eb ee                	jmp    557 <printint+0x79>

00000569 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 569:	55                   	push   %ebp
 56a:	89 e5                	mov    %esp,%ebp
 56c:	57                   	push   %edi
 56d:	56                   	push   %esi
 56e:	53                   	push   %ebx
 56f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 572:	8d 45 10             	lea    0x10(%ebp),%eax
 575:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 578:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 57d:	bb 00 00 00 00       	mov    $0x0,%ebx
 582:	eb 14                	jmp    598 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 584:	89 fa                	mov    %edi,%edx
 586:	8b 45 08             	mov    0x8(%ebp),%eax
 589:	e8 36 ff ff ff       	call   4c4 <putc>
 58e:	eb 05                	jmp    595 <printf+0x2c>
      }
    } else if(state == '%'){
 590:	83 fe 25             	cmp    $0x25,%esi
 593:	74 25                	je     5ba <printf+0x51>
  for(i = 0; fmt[i]; i++){
 595:	83 c3 01             	add    $0x1,%ebx
 598:	8b 45 0c             	mov    0xc(%ebp),%eax
 59b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 59f:	84 c0                	test   %al,%al
 5a1:	0f 84 20 01 00 00    	je     6c7 <printf+0x15e>
    c = fmt[i] & 0xff;
 5a7:	0f be f8             	movsbl %al,%edi
 5aa:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5ad:	85 f6                	test   %esi,%esi
 5af:	75 df                	jne    590 <printf+0x27>
      if(c == '%'){
 5b1:	83 f8 25             	cmp    $0x25,%eax
 5b4:	75 ce                	jne    584 <printf+0x1b>
        state = '%';
 5b6:	89 c6                	mov    %eax,%esi
 5b8:	eb db                	jmp    595 <printf+0x2c>
      if(c == 'd'){
 5ba:	83 f8 25             	cmp    $0x25,%eax
 5bd:	0f 84 cf 00 00 00    	je     692 <printf+0x129>
 5c3:	0f 8c dd 00 00 00    	jl     6a6 <printf+0x13d>
 5c9:	83 f8 78             	cmp    $0x78,%eax
 5cc:	0f 8f d4 00 00 00    	jg     6a6 <printf+0x13d>
 5d2:	83 f8 63             	cmp    $0x63,%eax
 5d5:	0f 8c cb 00 00 00    	jl     6a6 <printf+0x13d>
 5db:	83 e8 63             	sub    $0x63,%eax
 5de:	83 f8 15             	cmp    $0x15,%eax
 5e1:	0f 87 bf 00 00 00    	ja     6a6 <printf+0x13d>
 5e7:	ff 24 85 9c 08 00 00 	jmp    *0x89c(,%eax,4)
        printint(fd, *ap, 10, 1);
 5ee:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f1:	8b 17                	mov    (%edi),%edx
 5f3:	83 ec 0c             	sub    $0xc,%esp
 5f6:	6a 01                	push   $0x1
 5f8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	e8 d9 fe ff ff       	call   4de <printint>
        ap++;
 605:	83 c7 04             	add    $0x4,%edi
 608:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 60b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60e:	be 00 00 00 00       	mov    $0x0,%esi
 613:	eb 80                	jmp    595 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 615:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 618:	8b 17                	mov    (%edi),%edx
 61a:	83 ec 0c             	sub    $0xc,%esp
 61d:	6a 00                	push   $0x0
 61f:	b9 10 00 00 00       	mov    $0x10,%ecx
 624:	8b 45 08             	mov    0x8(%ebp),%eax
 627:	e8 b2 fe ff ff       	call   4de <printint>
        ap++;
 62c:	83 c7 04             	add    $0x4,%edi
 62f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 632:	83 c4 10             	add    $0x10,%esp
      state = 0;
 635:	be 00 00 00 00       	mov    $0x0,%esi
 63a:	e9 56 ff ff ff       	jmp    595 <printf+0x2c>
        s = (char*)*ap;
 63f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 642:	8b 30                	mov    (%eax),%esi
        ap++;
 644:	83 c0 04             	add    $0x4,%eax
 647:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 64a:	85 f6                	test   %esi,%esi
 64c:	75 15                	jne    663 <printf+0xfa>
          s = "(null)";
 64e:	be 92 08 00 00       	mov    $0x892,%esi
 653:	eb 0e                	jmp    663 <printf+0xfa>
          putc(fd, *s);
 655:	0f be d2             	movsbl %dl,%edx
 658:	8b 45 08             	mov    0x8(%ebp),%eax
 65b:	e8 64 fe ff ff       	call   4c4 <putc>
          s++;
 660:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 663:	0f b6 16             	movzbl (%esi),%edx
 666:	84 d2                	test   %dl,%dl
 668:	75 eb                	jne    655 <printf+0xec>
      state = 0;
 66a:	be 00 00 00 00       	mov    $0x0,%esi
 66f:	e9 21 ff ff ff       	jmp    595 <printf+0x2c>
        putc(fd, *ap);
 674:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 677:	0f be 17             	movsbl (%edi),%edx
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	e8 42 fe ff ff       	call   4c4 <putc>
        ap++;
 682:	83 c7 04             	add    $0x4,%edi
 685:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 688:	be 00 00 00 00       	mov    $0x0,%esi
 68d:	e9 03 ff ff ff       	jmp    595 <printf+0x2c>
        putc(fd, c);
 692:	89 fa                	mov    %edi,%edx
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	e8 28 fe ff ff       	call   4c4 <putc>
      state = 0;
 69c:	be 00 00 00 00       	mov    $0x0,%esi
 6a1:	e9 ef fe ff ff       	jmp    595 <printf+0x2c>
        putc(fd, '%');
 6a6:	ba 25 00 00 00       	mov    $0x25,%edx
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	e8 11 fe ff ff       	call   4c4 <putc>
        putc(fd, c);
 6b3:	89 fa                	mov    %edi,%edx
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	e8 07 fe ff ff       	call   4c4 <putc>
      state = 0;
 6bd:	be 00 00 00 00       	mov    $0x0,%esi
 6c2:	e9 ce fe ff ff       	jmp    595 <printf+0x2c>
    }
  }
}
 6c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ca:	5b                   	pop    %ebx
 6cb:	5e                   	pop    %esi
 6cc:	5f                   	pop    %edi
 6cd:	5d                   	pop    %ebp
 6ce:	c3                   	ret    

000006cf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6cf:	55                   	push   %ebp
 6d0:	89 e5                	mov    %esp,%ebp
 6d2:	57                   	push   %edi
 6d3:	56                   	push   %esi
 6d4:	53                   	push   %ebx
 6d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6db:	a1 90 0c 00 00       	mov    0xc90,%eax
 6e0:	eb 02                	jmp    6e4 <free+0x15>
 6e2:	89 d0                	mov    %edx,%eax
 6e4:	39 c8                	cmp    %ecx,%eax
 6e6:	73 04                	jae    6ec <free+0x1d>
 6e8:	39 08                	cmp    %ecx,(%eax)
 6ea:	77 12                	ja     6fe <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ec:	8b 10                	mov    (%eax),%edx
 6ee:	39 c2                	cmp    %eax,%edx
 6f0:	77 f0                	ja     6e2 <free+0x13>
 6f2:	39 c8                	cmp    %ecx,%eax
 6f4:	72 08                	jb     6fe <free+0x2f>
 6f6:	39 ca                	cmp    %ecx,%edx
 6f8:	77 04                	ja     6fe <free+0x2f>
 6fa:	89 d0                	mov    %edx,%eax
 6fc:	eb e6                	jmp    6e4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6fe:	8b 73 fc             	mov    -0x4(%ebx),%esi
 701:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 704:	8b 10                	mov    (%eax),%edx
 706:	39 d7                	cmp    %edx,%edi
 708:	74 19                	je     723 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 70a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70d:	8b 50 04             	mov    0x4(%eax),%edx
 710:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 713:	39 ce                	cmp    %ecx,%esi
 715:	74 1b                	je     732 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 717:	89 08                	mov    %ecx,(%eax)
  freep = p;
 719:	a3 90 0c 00 00       	mov    %eax,0xc90
}
 71e:	5b                   	pop    %ebx
 71f:	5e                   	pop    %esi
 720:	5f                   	pop    %edi
 721:	5d                   	pop    %ebp
 722:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 723:	03 72 04             	add    0x4(%edx),%esi
 726:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 729:	8b 10                	mov    (%eax),%edx
 72b:	8b 12                	mov    (%edx),%edx
 72d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 730:	eb db                	jmp    70d <free+0x3e>
    p->s.size += bp->s.size;
 732:	03 53 fc             	add    -0x4(%ebx),%edx
 735:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 738:	8b 53 f8             	mov    -0x8(%ebx),%edx
 73b:	89 10                	mov    %edx,(%eax)
 73d:	eb da                	jmp    719 <free+0x4a>

0000073f <morecore>:

static Header*
morecore(uint nu)
{
 73f:	55                   	push   %ebp
 740:	89 e5                	mov    %esp,%ebp
 742:	53                   	push   %ebx
 743:	83 ec 04             	sub    $0x4,%esp
 746:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 748:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 74d:	77 05                	ja     754 <morecore+0x15>
    nu = 4096;
 74f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 754:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 75b:	83 ec 0c             	sub    $0xc,%esp
 75e:	50                   	push   %eax
 75f:	e8 38 fd ff ff       	call   49c <sbrk>
  if(p == (char*)-1)
 764:	83 c4 10             	add    $0x10,%esp
 767:	83 f8 ff             	cmp    $0xffffffff,%eax
 76a:	74 1c                	je     788 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 76c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 76f:	83 c0 08             	add    $0x8,%eax
 772:	83 ec 0c             	sub    $0xc,%esp
 775:	50                   	push   %eax
 776:	e8 54 ff ff ff       	call   6cf <free>
  return freep;
 77b:	a1 90 0c 00 00       	mov    0xc90,%eax
 780:	83 c4 10             	add    $0x10,%esp
}
 783:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 786:	c9                   	leave  
 787:	c3                   	ret    
    return 0;
 788:	b8 00 00 00 00       	mov    $0x0,%eax
 78d:	eb f4                	jmp    783 <morecore+0x44>

0000078f <malloc>:

void*
malloc(uint nbytes)
{
 78f:	55                   	push   %ebp
 790:	89 e5                	mov    %esp,%ebp
 792:	53                   	push   %ebx
 793:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	8d 58 07             	lea    0x7(%eax),%ebx
 79c:	c1 eb 03             	shr    $0x3,%ebx
 79f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7a2:	8b 0d 90 0c 00 00    	mov    0xc90,%ecx
 7a8:	85 c9                	test   %ecx,%ecx
 7aa:	74 04                	je     7b0 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ac:	8b 01                	mov    (%ecx),%eax
 7ae:	eb 4a                	jmp    7fa <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7b0:	c7 05 90 0c 00 00 94 	movl   $0xc94,0xc90
 7b7:	0c 00 00 
 7ba:	c7 05 94 0c 00 00 94 	movl   $0xc94,0xc94
 7c1:	0c 00 00 
    base.s.size = 0;
 7c4:	c7 05 98 0c 00 00 00 	movl   $0x0,0xc98
 7cb:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7ce:	b9 94 0c 00 00       	mov    $0xc94,%ecx
 7d3:	eb d7                	jmp    7ac <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7d5:	74 19                	je     7f0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7d7:	29 da                	sub    %ebx,%edx
 7d9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7dc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7df:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7e2:	89 0d 90 0c 00 00    	mov    %ecx,0xc90
      return (void*)(p + 1);
 7e8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7ee:	c9                   	leave  
 7ef:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7f0:	8b 10                	mov    (%eax),%edx
 7f2:	89 11                	mov    %edx,(%ecx)
 7f4:	eb ec                	jmp    7e2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f6:	89 c1                	mov    %eax,%ecx
 7f8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7fa:	8b 50 04             	mov    0x4(%eax),%edx
 7fd:	39 da                	cmp    %ebx,%edx
 7ff:	73 d4                	jae    7d5 <malloc+0x46>
    if(p == freep)
 801:	39 05 90 0c 00 00    	cmp    %eax,0xc90
 807:	75 ed                	jne    7f6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 809:	89 d8                	mov    %ebx,%eax
 80b:	e8 2f ff ff ff       	call   73f <morecore>
 810:	85 c0                	test   %eax,%eax
 812:	75 e2                	jne    7f6 <malloc+0x67>
 814:	eb d5                	jmp    7eb <malloc+0x5c>
