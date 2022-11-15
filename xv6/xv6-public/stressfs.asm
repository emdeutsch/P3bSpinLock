
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 6c 07 00 00       	push   $0x76c
  2f:	6a 01                	push   $0x1
  31:	e8 88 04 00 00       	call   4be <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 34 01 00 00       	call   180 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 03 03 00 00       	call   361 <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 7f 07 00 00       	push   $0x77f
  70:	6a 01                	push   $0x1
  72:	e8 47 04 00 00       	call   4be <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 1e 03 00 00       	call   3a9 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 dd 02 00 00       	call   389 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 d1 02 00 00       	call   391 <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 89 07 00 00       	push   $0x789
  c8:	6a 01                	push   $0x1
  ca:	e8 ef 03 00 00       	call   4be <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 cc 02 00 00       	call   3a9 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 83 02 00 00       	call   381 <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 7f 02 00 00       	call   391 <close>

  wait();
 112:	e8 5a 02 00 00       	call   371 <wait>

  exit();
 117:	e8 4d 02 00 00       	call   369 <exit>

0000011c <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	56                   	push   %esi
 120:	53                   	push   %ebx
 121:	8b 75 08             	mov    0x8(%ebp),%esi
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 127:	89 f0                	mov    %esi,%eax
 129:	89 d1                	mov    %edx,%ecx
 12b:	83 c2 01             	add    $0x1,%edx
 12e:	89 c3                	mov    %eax,%ebx
 130:	83 c0 01             	add    $0x1,%eax
 133:	0f b6 09             	movzbl (%ecx),%ecx
 136:	88 0b                	mov    %cl,(%ebx)
 138:	84 c9                	test   %cl,%cl
 13a:	75 ed                	jne    129 <strcpy+0xd>
    ;
  return os;
}
 13c:	89 f0                	mov    %esi,%eax
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	8b 4d 08             	mov    0x8(%ebp),%ecx
 148:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14b:	eb 06                	jmp    153 <strcmp+0x11>
    p++, q++;
 14d:	83 c1 01             	add    $0x1,%ecx
 150:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 153:	0f b6 01             	movzbl (%ecx),%eax
 156:	84 c0                	test   %al,%al
 158:	74 04                	je     15e <strcmp+0x1c>
 15a:	3a 02                	cmp    (%edx),%al
 15c:	74 ef                	je     14d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 15e:	0f b6 c0             	movzbl %al,%eax
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	29 d0                	sub    %edx,%eax
}
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    

00000168 <strlen>:

uint
strlen(const char *s)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 16e:	b8 00 00 00 00       	mov    $0x0,%eax
 173:	eb 03                	jmp    178 <strlen+0x10>
 175:	83 c0 01             	add    $0x1,%eax
 178:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 17c:	75 f7                	jne    175 <strlen+0xd>
    ;
  return n;
}
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	89 d7                	mov    %edx,%edi
 189:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18c:	8b 45 0c             	mov    0xc(%ebp),%eax
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	89 d0                	mov    %edx,%eax
 194:	8b 7d fc             	mov    -0x4(%ebp),%edi
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <strchr>:

char*
strchr(const char *s, char c)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1a3:	eb 03                	jmp    1a8 <strchr+0xf>
 1a5:	83 c0 01             	add    $0x1,%eax
 1a8:	0f b6 10             	movzbl (%eax),%edx
 1ab:	84 d2                	test   %dl,%dl
 1ad:	74 06                	je     1b5 <strchr+0x1c>
    if(*s == c)
 1af:	38 ca                	cmp    %cl,%dl
 1b1:	75 f2                	jne    1a5 <strchr+0xc>
 1b3:	eb 05                	jmp    1ba <strchr+0x21>
      return (char*)s;
  return 0;
 1b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <gets>:

char*
gets(char *buf, int max)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	57                   	push   %edi
 1c0:	56                   	push   %esi
 1c1:	53                   	push   %ebx
 1c2:	83 ec 1c             	sub    $0x1c,%esp
 1c5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1cd:	89 de                	mov    %ebx,%esi
 1cf:	83 c3 01             	add    $0x1,%ebx
 1d2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d5:	7d 2e                	jge    205 <gets+0x49>
    cc = read(0, &c, 1);
 1d7:	83 ec 04             	sub    $0x4,%esp
 1da:	6a 01                	push   $0x1
 1dc:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1df:	50                   	push   %eax
 1e0:	6a 00                	push   $0x0
 1e2:	e8 9a 01 00 00       	call   381 <read>
    if(cc < 1)
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	85 c0                	test   %eax,%eax
 1ec:	7e 17                	jle    205 <gets+0x49>
      break;
    buf[i++] = c;
 1ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f2:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1f5:	3c 0a                	cmp    $0xa,%al
 1f7:	0f 94 c2             	sete   %dl
 1fa:	3c 0d                	cmp    $0xd,%al
 1fc:	0f 94 c0             	sete   %al
 1ff:	08 c2                	or     %al,%dl
 201:	74 ca                	je     1cd <gets+0x11>
    buf[i++] = c;
 203:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 205:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 209:	89 f8                	mov    %edi,%eax
 20b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20e:	5b                   	pop    %ebx
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <stat>:

int
stat(const char *n, struct stat *st)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	83 ec 08             	sub    $0x8,%esp
 21b:	6a 00                	push   $0x0
 21d:	ff 75 08             	push   0x8(%ebp)
 220:	e8 84 01 00 00       	call   3a9 <open>
  if(fd < 0)
 225:	83 c4 10             	add    $0x10,%esp
 228:	85 c0                	test   %eax,%eax
 22a:	78 24                	js     250 <stat+0x3d>
 22c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	push   0xc(%ebp)
 234:	50                   	push   %eax
 235:	e8 87 01 00 00       	call   3c1 <fstat>
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	89 1c 24             	mov    %ebx,(%esp)
 23f:	e8 4d 01 00 00       	call   391 <close>
  return r;
 244:	83 c4 10             	add    $0x10,%esp
}
 247:	89 f0                	mov    %esi,%eax
 249:	8d 65 f8             	lea    -0x8(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb f0                	jmp    247 <stat+0x34>

00000257 <atoi>:

int
atoi(const char *s)
{
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	53                   	push   %ebx
 25b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 25e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 263:	eb 10                	jmp    275 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 265:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 268:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 26b:	83 c1 01             	add    $0x1,%ecx
 26e:	0f be c0             	movsbl %al,%eax
 271:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	8d 58 d0             	lea    -0x30(%eax),%ebx
 27b:	80 fb 09             	cmp    $0x9,%bl
 27e:	76 e5                	jbe    265 <atoi+0xe>
  return n;
}
 280:	89 d0                	mov    %edx,%eax
 282:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	56                   	push   %esi
 28b:	53                   	push   %ebx
 28c:	8b 75 08             	mov    0x8(%ebp),%esi
 28f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 292:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 295:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 297:	eb 0d                	jmp    2a6 <memmove+0x1f>
    *dst++ = *src++;
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	88 02                	mov    %al,(%edx)
 29e:	8d 49 01             	lea    0x1(%ecx),%ecx
 2a1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2a4:	89 d8                	mov    %ebx,%eax
 2a6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2a9:	85 c0                	test   %eax,%eax
 2ab:	7f ec                	jg     299 <memmove+0x12>
  return vdst;
}
 2ad:	89 f0                	mov    %esi,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    

000002b3 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 2b9:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 2bb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2be:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2c0:	89 d0                	mov    %edx,%eax
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    

000002c4 <lock_init>:
void 
lock_init(lock_t *lock){
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d0:	5d                   	pop    %ebp
 2d1:	c3                   	ret    

000002d2 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	53                   	push   %ebx
 2d6:	83 ec 04             	sub    $0x4,%esp
 2d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 2dc:	83 ec 08             	sub    $0x8,%esp
 2df:	6a 01                	push   $0x1
 2e1:	53                   	push   %ebx
 2e2:	e8 cc ff ff ff       	call   2b3 <TestAndSet>
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	83 f8 01             	cmp    $0x1,%eax
 2ed:	74 ed                	je     2dc <lock_acquire+0xa>
    ;
}
 2ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f2:	c9                   	leave  
 2f3:	c3                   	ret    

000002f4 <lock_release>:
void 
lock_release(lock_t *lock){
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 300:	5d                   	pop    %ebp
 301:	c3                   	ret    

00000302 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 302:	55                   	push   %ebp
 303:	89 e5                	mov    %esp,%ebp
 305:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 308:	68 04 20 00 00       	push   $0x2004
 30d:	e8 d2 03 00 00       	call   6e4 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 312:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 315:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 317:	eb 03                	jmp    31c <thread_create+0x1a>
      stack += 1;
 319:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 31c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 322:	75 f5                	jne    319 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 324:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 326:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 329:	52                   	push   %edx
 32a:	ff 75 10             	push   0x10(%ebp)
 32d:	ff 75 0c             	push   0xc(%ebp)
 330:	ff 75 08             	push   0x8(%ebp)
 333:	e8 d1 00 00 00       	call   409 <clone>
 
    return pid;
}
 338:	c9                   	leave  
 339:	c3                   	ret    

0000033a <thread_join>:
int 
thread_join(){
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	53                   	push   %ebx
 33e:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 341:	8d 45 f4             	lea    -0xc(%ebp),%eax
 344:	50                   	push   %eax
 345:	e8 c7 00 00 00       	call   411 <join>
 34a:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 34c:	83 c4 04             	add    $0x4,%esp
 34f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 352:	ff 70 fc             	push   -0x4(%eax)
 355:	e8 ca 02 00 00       	call   624 <free>
  return waitedForPID;
 35a:	89 d8                	mov    %ebx,%eax
 35c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 361:	b8 01 00 00 00       	mov    $0x1,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <exit>:
SYSCALL(exit)
 369:	b8 02 00 00 00       	mov    $0x2,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <wait>:
SYSCALL(wait)
 371:	b8 03 00 00 00       	mov    $0x3,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <pipe>:
SYSCALL(pipe)
 379:	b8 04 00 00 00       	mov    $0x4,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <read>:
SYSCALL(read)
 381:	b8 05 00 00 00       	mov    $0x5,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <write>:
SYSCALL(write)
 389:	b8 10 00 00 00       	mov    $0x10,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <close>:
SYSCALL(close)
 391:	b8 15 00 00 00       	mov    $0x15,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <kill>:
SYSCALL(kill)
 399:	b8 06 00 00 00       	mov    $0x6,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <exec>:
SYSCALL(exec)
 3a1:	b8 07 00 00 00       	mov    $0x7,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <open>:
SYSCALL(open)
 3a9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <mknod>:
SYSCALL(mknod)
 3b1:	b8 11 00 00 00       	mov    $0x11,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <unlink>:
SYSCALL(unlink)
 3b9:	b8 12 00 00 00       	mov    $0x12,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <fstat>:
SYSCALL(fstat)
 3c1:	b8 08 00 00 00       	mov    $0x8,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <link>:
SYSCALL(link)
 3c9:	b8 13 00 00 00       	mov    $0x13,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <mkdir>:
SYSCALL(mkdir)
 3d1:	b8 14 00 00 00       	mov    $0x14,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <chdir>:
SYSCALL(chdir)
 3d9:	b8 09 00 00 00       	mov    $0x9,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <dup>:
SYSCALL(dup)
 3e1:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <getpid>:
SYSCALL(getpid)
 3e9:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <sbrk>:
SYSCALL(sbrk)
 3f1:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <sleep>:
SYSCALL(sleep)
 3f9:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <uptime>:
SYSCALL(uptime)
 401:	b8 0e 00 00 00       	mov    $0xe,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <clone>:
SYSCALL(clone)
 409:	b8 16 00 00 00       	mov    $0x16,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <join>:
SYSCALL(join)
 411:	b8 17 00 00 00       	mov    $0x17,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	83 ec 1c             	sub    $0x1c,%esp
 41f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 422:	6a 01                	push   $0x1
 424:	8d 55 f4             	lea    -0xc(%ebp),%edx
 427:	52                   	push   %edx
 428:	50                   	push   %eax
 429:	e8 5b ff ff ff       	call   389 <write>
}
 42e:	83 c4 10             	add    $0x10,%esp
 431:	c9                   	leave  
 432:	c3                   	ret    

00000433 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	57                   	push   %edi
 437:	56                   	push   %esi
 438:	53                   	push   %ebx
 439:	83 ec 2c             	sub    $0x2c,%esp
 43c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 43f:	89 d0                	mov    %edx,%eax
 441:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 443:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 447:	0f 95 c1             	setne  %cl
 44a:	c1 ea 1f             	shr    $0x1f,%edx
 44d:	84 d1                	test   %dl,%cl
 44f:	74 44                	je     495 <printint+0x62>
    neg = 1;
    x = -xx;
 451:	f7 d8                	neg    %eax
 453:	89 c1                	mov    %eax,%ecx
    neg = 1;
 455:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 45c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 461:	89 c8                	mov    %ecx,%eax
 463:	ba 00 00 00 00       	mov    $0x0,%edx
 468:	f7 f6                	div    %esi
 46a:	89 df                	mov    %ebx,%edi
 46c:	83 c3 01             	add    $0x1,%ebx
 46f:	0f b6 92 f0 07 00 00 	movzbl 0x7f0(%edx),%edx
 476:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 47a:	89 ca                	mov    %ecx,%edx
 47c:	89 c1                	mov    %eax,%ecx
 47e:	39 d6                	cmp    %edx,%esi
 480:	76 df                	jbe    461 <printint+0x2e>
  if(neg)
 482:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 486:	74 31                	je     4b9 <printint+0x86>
    buf[i++] = '-';
 488:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 48d:	8d 5f 02             	lea    0x2(%edi),%ebx
 490:	8b 75 d0             	mov    -0x30(%ebp),%esi
 493:	eb 17                	jmp    4ac <printint+0x79>
    x = xx;
 495:	89 c1                	mov    %eax,%ecx
  neg = 0;
 497:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 49e:	eb bc                	jmp    45c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4a0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4a5:	89 f0                	mov    %esi,%eax
 4a7:	e8 6d ff ff ff       	call   419 <putc>
  while(--i >= 0)
 4ac:	83 eb 01             	sub    $0x1,%ebx
 4af:	79 ef                	jns    4a0 <printint+0x6d>
}
 4b1:	83 c4 2c             	add    $0x2c,%esp
 4b4:	5b                   	pop    %ebx
 4b5:	5e                   	pop    %esi
 4b6:	5f                   	pop    %edi
 4b7:	5d                   	pop    %ebp
 4b8:	c3                   	ret    
 4b9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4bc:	eb ee                	jmp    4ac <printint+0x79>

000004be <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4be:	55                   	push   %ebp
 4bf:	89 e5                	mov    %esp,%ebp
 4c1:	57                   	push   %edi
 4c2:	56                   	push   %esi
 4c3:	53                   	push   %ebx
 4c4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c7:	8d 45 10             	lea    0x10(%ebp),%eax
 4ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4cd:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4d2:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d7:	eb 14                	jmp    4ed <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4d9:	89 fa                	mov    %edi,%edx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	e8 36 ff ff ff       	call   419 <putc>
 4e3:	eb 05                	jmp    4ea <printf+0x2c>
      }
    } else if(state == '%'){
 4e5:	83 fe 25             	cmp    $0x25,%esi
 4e8:	74 25                	je     50f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4ea:	83 c3 01             	add    $0x1,%ebx
 4ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f0:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4f4:	84 c0                	test   %al,%al
 4f6:	0f 84 20 01 00 00    	je     61c <printf+0x15e>
    c = fmt[i] & 0xff;
 4fc:	0f be f8             	movsbl %al,%edi
 4ff:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 502:	85 f6                	test   %esi,%esi
 504:	75 df                	jne    4e5 <printf+0x27>
      if(c == '%'){
 506:	83 f8 25             	cmp    $0x25,%eax
 509:	75 ce                	jne    4d9 <printf+0x1b>
        state = '%';
 50b:	89 c6                	mov    %eax,%esi
 50d:	eb db                	jmp    4ea <printf+0x2c>
      if(c == 'd'){
 50f:	83 f8 25             	cmp    $0x25,%eax
 512:	0f 84 cf 00 00 00    	je     5e7 <printf+0x129>
 518:	0f 8c dd 00 00 00    	jl     5fb <printf+0x13d>
 51e:	83 f8 78             	cmp    $0x78,%eax
 521:	0f 8f d4 00 00 00    	jg     5fb <printf+0x13d>
 527:	83 f8 63             	cmp    $0x63,%eax
 52a:	0f 8c cb 00 00 00    	jl     5fb <printf+0x13d>
 530:	83 e8 63             	sub    $0x63,%eax
 533:	83 f8 15             	cmp    $0x15,%eax
 536:	0f 87 bf 00 00 00    	ja     5fb <printf+0x13d>
 53c:	ff 24 85 98 07 00 00 	jmp    *0x798(,%eax,4)
        printint(fd, *ap, 10, 1);
 543:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 546:	8b 17                	mov    (%edi),%edx
 548:	83 ec 0c             	sub    $0xc,%esp
 54b:	6a 01                	push   $0x1
 54d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 552:	8b 45 08             	mov    0x8(%ebp),%eax
 555:	e8 d9 fe ff ff       	call   433 <printint>
        ap++;
 55a:	83 c7 04             	add    $0x4,%edi
 55d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 560:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 563:	be 00 00 00 00       	mov    $0x0,%esi
 568:	eb 80                	jmp    4ea <printf+0x2c>
        printint(fd, *ap, 16, 0);
 56a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 56d:	8b 17                	mov    (%edi),%edx
 56f:	83 ec 0c             	sub    $0xc,%esp
 572:	6a 00                	push   $0x0
 574:	b9 10 00 00 00       	mov    $0x10,%ecx
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	e8 b2 fe ff ff       	call   433 <printint>
        ap++;
 581:	83 c7 04             	add    $0x4,%edi
 584:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 587:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58a:	be 00 00 00 00       	mov    $0x0,%esi
 58f:	e9 56 ff ff ff       	jmp    4ea <printf+0x2c>
        s = (char*)*ap;
 594:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 597:	8b 30                	mov    (%eax),%esi
        ap++;
 599:	83 c0 04             	add    $0x4,%eax
 59c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 59f:	85 f6                	test   %esi,%esi
 5a1:	75 15                	jne    5b8 <printf+0xfa>
          s = "(null)";
 5a3:	be 8f 07 00 00       	mov    $0x78f,%esi
 5a8:	eb 0e                	jmp    5b8 <printf+0xfa>
          putc(fd, *s);
 5aa:	0f be d2             	movsbl %dl,%edx
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
 5b0:	e8 64 fe ff ff       	call   419 <putc>
          s++;
 5b5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5b8:	0f b6 16             	movzbl (%esi),%edx
 5bb:	84 d2                	test   %dl,%dl
 5bd:	75 eb                	jne    5aa <printf+0xec>
      state = 0;
 5bf:	be 00 00 00 00       	mov    $0x0,%esi
 5c4:	e9 21 ff ff ff       	jmp    4ea <printf+0x2c>
        putc(fd, *ap);
 5c9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5cc:	0f be 17             	movsbl (%edi),%edx
 5cf:	8b 45 08             	mov    0x8(%ebp),%eax
 5d2:	e8 42 fe ff ff       	call   419 <putc>
        ap++;
 5d7:	83 c7 04             	add    $0x4,%edi
 5da:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5dd:	be 00 00 00 00       	mov    $0x0,%esi
 5e2:	e9 03 ff ff ff       	jmp    4ea <printf+0x2c>
        putc(fd, c);
 5e7:	89 fa                	mov    %edi,%edx
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	e8 28 fe ff ff       	call   419 <putc>
      state = 0;
 5f1:	be 00 00 00 00       	mov    $0x0,%esi
 5f6:	e9 ef fe ff ff       	jmp    4ea <printf+0x2c>
        putc(fd, '%');
 5fb:	ba 25 00 00 00       	mov    $0x25,%edx
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	e8 11 fe ff ff       	call   419 <putc>
        putc(fd, c);
 608:	89 fa                	mov    %edi,%edx
 60a:	8b 45 08             	mov    0x8(%ebp),%eax
 60d:	e8 07 fe ff ff       	call   419 <putc>
      state = 0;
 612:	be 00 00 00 00       	mov    $0x0,%esi
 617:	e9 ce fe ff ff       	jmp    4ea <printf+0x2c>
    }
  }
}
 61c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5f                   	pop    %edi
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    

00000624 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	57                   	push   %edi
 628:	56                   	push   %esi
 629:	53                   	push   %ebx
 62a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 62d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 630:	a1 60 0b 00 00       	mov    0xb60,%eax
 635:	eb 02                	jmp    639 <free+0x15>
 637:	89 d0                	mov    %edx,%eax
 639:	39 c8                	cmp    %ecx,%eax
 63b:	73 04                	jae    641 <free+0x1d>
 63d:	39 08                	cmp    %ecx,(%eax)
 63f:	77 12                	ja     653 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 641:	8b 10                	mov    (%eax),%edx
 643:	39 c2                	cmp    %eax,%edx
 645:	77 f0                	ja     637 <free+0x13>
 647:	39 c8                	cmp    %ecx,%eax
 649:	72 08                	jb     653 <free+0x2f>
 64b:	39 ca                	cmp    %ecx,%edx
 64d:	77 04                	ja     653 <free+0x2f>
 64f:	89 d0                	mov    %edx,%eax
 651:	eb e6                	jmp    639 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 653:	8b 73 fc             	mov    -0x4(%ebx),%esi
 656:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 659:	8b 10                	mov    (%eax),%edx
 65b:	39 d7                	cmp    %edx,%edi
 65d:	74 19                	je     678 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 65f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 662:	8b 50 04             	mov    0x4(%eax),%edx
 665:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 668:	39 ce                	cmp    %ecx,%esi
 66a:	74 1b                	je     687 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 66c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 66e:	a3 60 0b 00 00       	mov    %eax,0xb60
}
 673:	5b                   	pop    %ebx
 674:	5e                   	pop    %esi
 675:	5f                   	pop    %edi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 678:	03 72 04             	add    0x4(%edx),%esi
 67b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 67e:	8b 10                	mov    (%eax),%edx
 680:	8b 12                	mov    (%edx),%edx
 682:	89 53 f8             	mov    %edx,-0x8(%ebx)
 685:	eb db                	jmp    662 <free+0x3e>
    p->s.size += bp->s.size;
 687:	03 53 fc             	add    -0x4(%ebx),%edx
 68a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 690:	89 10                	mov    %edx,(%eax)
 692:	eb da                	jmp    66e <free+0x4a>

00000694 <morecore>:

static Header*
morecore(uint nu)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	53                   	push   %ebx
 698:	83 ec 04             	sub    $0x4,%esp
 69b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 69d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6a2:	77 05                	ja     6a9 <morecore+0x15>
    nu = 4096;
 6a4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6a9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	50                   	push   %eax
 6b4:	e8 38 fd ff ff       	call   3f1 <sbrk>
  if(p == (char*)-1)
 6b9:	83 c4 10             	add    $0x10,%esp
 6bc:	83 f8 ff             	cmp    $0xffffffff,%eax
 6bf:	74 1c                	je     6dd <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6c1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c4:	83 c0 08             	add    $0x8,%eax
 6c7:	83 ec 0c             	sub    $0xc,%esp
 6ca:	50                   	push   %eax
 6cb:	e8 54 ff ff ff       	call   624 <free>
  return freep;
 6d0:	a1 60 0b 00 00       	mov    0xb60,%eax
 6d5:	83 c4 10             	add    $0x10,%esp
}
 6d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6db:	c9                   	leave  
 6dc:	c3                   	ret    
    return 0;
 6dd:	b8 00 00 00 00       	mov    $0x0,%eax
 6e2:	eb f4                	jmp    6d8 <morecore+0x44>

000006e4 <malloc>:

void*
malloc(uint nbytes)
{
 6e4:	55                   	push   %ebp
 6e5:	89 e5                	mov    %esp,%ebp
 6e7:	53                   	push   %ebx
 6e8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6eb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ee:	8d 58 07             	lea    0x7(%eax),%ebx
 6f1:	c1 eb 03             	shr    $0x3,%ebx
 6f4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6f7:	8b 0d 60 0b 00 00    	mov    0xb60,%ecx
 6fd:	85 c9                	test   %ecx,%ecx
 6ff:	74 04                	je     705 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 701:	8b 01                	mov    (%ecx),%eax
 703:	eb 4a                	jmp    74f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 705:	c7 05 60 0b 00 00 64 	movl   $0xb64,0xb60
 70c:	0b 00 00 
 70f:	c7 05 64 0b 00 00 64 	movl   $0xb64,0xb64
 716:	0b 00 00 
    base.s.size = 0;
 719:	c7 05 68 0b 00 00 00 	movl   $0x0,0xb68
 720:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 723:	b9 64 0b 00 00       	mov    $0xb64,%ecx
 728:	eb d7                	jmp    701 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 72a:	74 19                	je     745 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 72c:	29 da                	sub    %ebx,%edx
 72e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 731:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 734:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 737:	89 0d 60 0b 00 00    	mov    %ecx,0xb60
      return (void*)(p + 1);
 73d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 740:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 743:	c9                   	leave  
 744:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 745:	8b 10                	mov    (%eax),%edx
 747:	89 11                	mov    %edx,(%ecx)
 749:	eb ec                	jmp    737 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74b:	89 c1                	mov    %eax,%ecx
 74d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 74f:	8b 50 04             	mov    0x4(%eax),%edx
 752:	39 da                	cmp    %ebx,%edx
 754:	73 d4                	jae    72a <malloc+0x46>
    if(p == freep)
 756:	39 05 60 0b 00 00    	cmp    %eax,0xb60
 75c:	75 ed                	jne    74b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 75e:	89 d8                	mov    %ebx,%eax
 760:	e8 2f ff ff ff       	call   694 <morecore>
 765:	85 c0                	test   %eax,%eax
 767:	75 e2                	jne    74b <malloc+0x67>
 769:	eb d5                	jmp    740 <malloc+0x5c>
