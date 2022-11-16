
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
  31:	e8 87 04 00 00       	call   4bd <printf>
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
  59:	e8 02 03 00 00       	call   360 <fork>
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
  72:	e8 46 04 00 00       	call   4bd <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 1d 03 00 00       	call   3a8 <open>
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
  a7:	e8 dc 02 00 00       	call   388 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 d0 02 00 00       	call   390 <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 89 07 00 00       	push   $0x789
  c8:	6a 01                	push   $0x1
  ca:	e8 ee 03 00 00       	call   4bd <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 cb 02 00 00       	call   3a8 <open>
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
  f9:	e8 82 02 00 00       	call   380 <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 7e 02 00 00       	call   390 <close>

  wait();
 112:	e8 59 02 00 00       	call   370 <wait>

  exit();
 117:	e8 4c 02 00 00       	call   368 <exit>

0000011c <strcpy>:
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
 1e2:	e8 99 01 00 00       	call   380 <read>
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
 220:	e8 83 01 00 00       	call   3a8 <open>
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
 235:	e8 86 01 00 00       	call   3c0 <fstat>
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	89 1c 24             	mov    %ebx,(%esp)
 23f:	e8 4c 01 00 00       	call   390 <close>
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
 30d:	e8 d1 03 00 00       	call   6e3 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 312:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 315:	83 c4 10             	add    $0x10,%esp
 318:	eb 03                	jmp    31d <thread_create+0x1b>
      stack += 1;
 31a:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 31d:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 323:	75 f5                	jne    31a <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 325:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 328:	52                   	push   %edx
 329:	ff 75 10             	push   0x10(%ebp)
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	ff 75 08             	push   0x8(%ebp)
 332:	e8 d1 00 00 00       	call   408 <clone>
 
    return pid;
}
 337:	c9                   	leave  
 338:	c3                   	ret    

00000339 <thread_join>:
int 
thread_join(){
 339:	55                   	push   %ebp
 33a:	89 e5                	mov    %esp,%ebp
 33c:	53                   	push   %ebx
 33d:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 340:	8d 45 f4             	lea    -0xc(%ebp),%eax
 343:	50                   	push   %eax
 344:	e8 c7 00 00 00       	call   410 <join>
 349:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 34b:	83 c4 04             	add    $0x4,%esp
 34e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 351:	ff 70 fc             	push   -0x4(%eax)
 354:	e8 ca 02 00 00       	call   623 <free>
  return pid;
 359:	89 d8                	mov    %ebx,%eax
 35b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 360:	b8 01 00 00 00       	mov    $0x1,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <exit>:
SYSCALL(exit)
 368:	b8 02 00 00 00       	mov    $0x2,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <wait>:
SYSCALL(wait)
 370:	b8 03 00 00 00       	mov    $0x3,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <pipe>:
SYSCALL(pipe)
 378:	b8 04 00 00 00       	mov    $0x4,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <read>:
SYSCALL(read)
 380:	b8 05 00 00 00       	mov    $0x5,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <write>:
SYSCALL(write)
 388:	b8 10 00 00 00       	mov    $0x10,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <close>:
SYSCALL(close)
 390:	b8 15 00 00 00       	mov    $0x15,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <kill>:
SYSCALL(kill)
 398:	b8 06 00 00 00       	mov    $0x6,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <exec>:
SYSCALL(exec)
 3a0:	b8 07 00 00 00       	mov    $0x7,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <open>:
SYSCALL(open)
 3a8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <mknod>:
SYSCALL(mknod)
 3b0:	b8 11 00 00 00       	mov    $0x11,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <unlink>:
SYSCALL(unlink)
 3b8:	b8 12 00 00 00       	mov    $0x12,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <fstat>:
SYSCALL(fstat)
 3c0:	b8 08 00 00 00       	mov    $0x8,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <link>:
SYSCALL(link)
 3c8:	b8 13 00 00 00       	mov    $0x13,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <mkdir>:
SYSCALL(mkdir)
 3d0:	b8 14 00 00 00       	mov    $0x14,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <chdir>:
SYSCALL(chdir)
 3d8:	b8 09 00 00 00       	mov    $0x9,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <dup>:
SYSCALL(dup)
 3e0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <getpid>:
SYSCALL(getpid)
 3e8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <sbrk>:
SYSCALL(sbrk)
 3f0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <sleep>:
SYSCALL(sleep)
 3f8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <uptime>:
SYSCALL(uptime)
 400:	b8 0e 00 00 00       	mov    $0xe,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <clone>:
SYSCALL(clone)
 408:	b8 16 00 00 00       	mov    $0x16,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <join>:
SYSCALL(join)
 410:	b8 17 00 00 00       	mov    $0x17,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 418:	55                   	push   %ebp
 419:	89 e5                	mov    %esp,%ebp
 41b:	83 ec 1c             	sub    $0x1c,%esp
 41e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 421:	6a 01                	push   $0x1
 423:	8d 55 f4             	lea    -0xc(%ebp),%edx
 426:	52                   	push   %edx
 427:	50                   	push   %eax
 428:	e8 5b ff ff ff       	call   388 <write>
}
 42d:	83 c4 10             	add    $0x10,%esp
 430:	c9                   	leave  
 431:	c3                   	ret    

00000432 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	57                   	push   %edi
 436:	56                   	push   %esi
 437:	53                   	push   %ebx
 438:	83 ec 2c             	sub    $0x2c,%esp
 43b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 43e:	89 d0                	mov    %edx,%eax
 440:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 442:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 446:	0f 95 c1             	setne  %cl
 449:	c1 ea 1f             	shr    $0x1f,%edx
 44c:	84 d1                	test   %dl,%cl
 44e:	74 44                	je     494 <printint+0x62>
    neg = 1;
    x = -xx;
 450:	f7 d8                	neg    %eax
 452:	89 c1                	mov    %eax,%ecx
    neg = 1;
 454:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 45b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 460:	89 c8                	mov    %ecx,%eax
 462:	ba 00 00 00 00       	mov    $0x0,%edx
 467:	f7 f6                	div    %esi
 469:	89 df                	mov    %ebx,%edi
 46b:	83 c3 01             	add    $0x1,%ebx
 46e:	0f b6 92 f0 07 00 00 	movzbl 0x7f0(%edx),%edx
 475:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 479:	89 ca                	mov    %ecx,%edx
 47b:	89 c1                	mov    %eax,%ecx
 47d:	39 d6                	cmp    %edx,%esi
 47f:	76 df                	jbe    460 <printint+0x2e>
  if(neg)
 481:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 485:	74 31                	je     4b8 <printint+0x86>
    buf[i++] = '-';
 487:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 48c:	8d 5f 02             	lea    0x2(%edi),%ebx
 48f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 492:	eb 17                	jmp    4ab <printint+0x79>
    x = xx;
 494:	89 c1                	mov    %eax,%ecx
  neg = 0;
 496:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 49d:	eb bc                	jmp    45b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 49f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4a4:	89 f0                	mov    %esi,%eax
 4a6:	e8 6d ff ff ff       	call   418 <putc>
  while(--i >= 0)
 4ab:	83 eb 01             	sub    $0x1,%ebx
 4ae:	79 ef                	jns    49f <printint+0x6d>
}
 4b0:	83 c4 2c             	add    $0x2c,%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
 4b8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4bb:	eb ee                	jmp    4ab <printint+0x79>

000004bd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	57                   	push   %edi
 4c1:	56                   	push   %esi
 4c2:	53                   	push   %ebx
 4c3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c6:	8d 45 10             	lea    0x10(%ebp),%eax
 4c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4cc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4d1:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d6:	eb 14                	jmp    4ec <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4d8:	89 fa                	mov    %edi,%edx
 4da:	8b 45 08             	mov    0x8(%ebp),%eax
 4dd:	e8 36 ff ff ff       	call   418 <putc>
 4e2:	eb 05                	jmp    4e9 <printf+0x2c>
      }
    } else if(state == '%'){
 4e4:	83 fe 25             	cmp    $0x25,%esi
 4e7:	74 25                	je     50e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4e9:	83 c3 01             	add    $0x1,%ebx
 4ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ef:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4f3:	84 c0                	test   %al,%al
 4f5:	0f 84 20 01 00 00    	je     61b <printf+0x15e>
    c = fmt[i] & 0xff;
 4fb:	0f be f8             	movsbl %al,%edi
 4fe:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 501:	85 f6                	test   %esi,%esi
 503:	75 df                	jne    4e4 <printf+0x27>
      if(c == '%'){
 505:	83 f8 25             	cmp    $0x25,%eax
 508:	75 ce                	jne    4d8 <printf+0x1b>
        state = '%';
 50a:	89 c6                	mov    %eax,%esi
 50c:	eb db                	jmp    4e9 <printf+0x2c>
      if(c == 'd'){
 50e:	83 f8 25             	cmp    $0x25,%eax
 511:	0f 84 cf 00 00 00    	je     5e6 <printf+0x129>
 517:	0f 8c dd 00 00 00    	jl     5fa <printf+0x13d>
 51d:	83 f8 78             	cmp    $0x78,%eax
 520:	0f 8f d4 00 00 00    	jg     5fa <printf+0x13d>
 526:	83 f8 63             	cmp    $0x63,%eax
 529:	0f 8c cb 00 00 00    	jl     5fa <printf+0x13d>
 52f:	83 e8 63             	sub    $0x63,%eax
 532:	83 f8 15             	cmp    $0x15,%eax
 535:	0f 87 bf 00 00 00    	ja     5fa <printf+0x13d>
 53b:	ff 24 85 98 07 00 00 	jmp    *0x798(,%eax,4)
        printint(fd, *ap, 10, 1);
 542:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 545:	8b 17                	mov    (%edi),%edx
 547:	83 ec 0c             	sub    $0xc,%esp
 54a:	6a 01                	push   $0x1
 54c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 551:	8b 45 08             	mov    0x8(%ebp),%eax
 554:	e8 d9 fe ff ff       	call   432 <printint>
        ap++;
 559:	83 c7 04             	add    $0x4,%edi
 55c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 55f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 562:	be 00 00 00 00       	mov    $0x0,%esi
 567:	eb 80                	jmp    4e9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 569:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 56c:	8b 17                	mov    (%edi),%edx
 56e:	83 ec 0c             	sub    $0xc,%esp
 571:	6a 00                	push   $0x0
 573:	b9 10 00 00 00       	mov    $0x10,%ecx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	e8 b2 fe ff ff       	call   432 <printint>
        ap++;
 580:	83 c7 04             	add    $0x4,%edi
 583:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 586:	83 c4 10             	add    $0x10,%esp
      state = 0;
 589:	be 00 00 00 00       	mov    $0x0,%esi
 58e:	e9 56 ff ff ff       	jmp    4e9 <printf+0x2c>
        s = (char*)*ap;
 593:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 596:	8b 30                	mov    (%eax),%esi
        ap++;
 598:	83 c0 04             	add    $0x4,%eax
 59b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 59e:	85 f6                	test   %esi,%esi
 5a0:	75 15                	jne    5b7 <printf+0xfa>
          s = "(null)";
 5a2:	be 8f 07 00 00       	mov    $0x78f,%esi
 5a7:	eb 0e                	jmp    5b7 <printf+0xfa>
          putc(fd, *s);
 5a9:	0f be d2             	movsbl %dl,%edx
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	e8 64 fe ff ff       	call   418 <putc>
          s++;
 5b4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5b7:	0f b6 16             	movzbl (%esi),%edx
 5ba:	84 d2                	test   %dl,%dl
 5bc:	75 eb                	jne    5a9 <printf+0xec>
      state = 0;
 5be:	be 00 00 00 00       	mov    $0x0,%esi
 5c3:	e9 21 ff ff ff       	jmp    4e9 <printf+0x2c>
        putc(fd, *ap);
 5c8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5cb:	0f be 17             	movsbl (%edi),%edx
 5ce:	8b 45 08             	mov    0x8(%ebp),%eax
 5d1:	e8 42 fe ff ff       	call   418 <putc>
        ap++;
 5d6:	83 c7 04             	add    $0x4,%edi
 5d9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5dc:	be 00 00 00 00       	mov    $0x0,%esi
 5e1:	e9 03 ff ff ff       	jmp    4e9 <printf+0x2c>
        putc(fd, c);
 5e6:	89 fa                	mov    %edi,%edx
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	e8 28 fe ff ff       	call   418 <putc>
      state = 0;
 5f0:	be 00 00 00 00       	mov    $0x0,%esi
 5f5:	e9 ef fe ff ff       	jmp    4e9 <printf+0x2c>
        putc(fd, '%');
 5fa:	ba 25 00 00 00       	mov    $0x25,%edx
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	e8 11 fe ff ff       	call   418 <putc>
        putc(fd, c);
 607:	89 fa                	mov    %edi,%edx
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	e8 07 fe ff ff       	call   418 <putc>
      state = 0;
 611:	be 00 00 00 00       	mov    $0x0,%esi
 616:	e9 ce fe ff ff       	jmp    4e9 <printf+0x2c>
    }
  }
}
 61b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    

00000623 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 623:	55                   	push   %ebp
 624:	89 e5                	mov    %esp,%ebp
 626:	57                   	push   %edi
 627:	56                   	push   %esi
 628:	53                   	push   %ebx
 629:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 62c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62f:	a1 60 0b 00 00       	mov    0xb60,%eax
 634:	eb 02                	jmp    638 <free+0x15>
 636:	89 d0                	mov    %edx,%eax
 638:	39 c8                	cmp    %ecx,%eax
 63a:	73 04                	jae    640 <free+0x1d>
 63c:	39 08                	cmp    %ecx,(%eax)
 63e:	77 12                	ja     652 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 640:	8b 10                	mov    (%eax),%edx
 642:	39 c2                	cmp    %eax,%edx
 644:	77 f0                	ja     636 <free+0x13>
 646:	39 c8                	cmp    %ecx,%eax
 648:	72 08                	jb     652 <free+0x2f>
 64a:	39 ca                	cmp    %ecx,%edx
 64c:	77 04                	ja     652 <free+0x2f>
 64e:	89 d0                	mov    %edx,%eax
 650:	eb e6                	jmp    638 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 652:	8b 73 fc             	mov    -0x4(%ebx),%esi
 655:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 658:	8b 10                	mov    (%eax),%edx
 65a:	39 d7                	cmp    %edx,%edi
 65c:	74 19                	je     677 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 65e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 661:	8b 50 04             	mov    0x4(%eax),%edx
 664:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 667:	39 ce                	cmp    %ecx,%esi
 669:	74 1b                	je     686 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 66b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 66d:	a3 60 0b 00 00       	mov    %eax,0xb60
}
 672:	5b                   	pop    %ebx
 673:	5e                   	pop    %esi
 674:	5f                   	pop    %edi
 675:	5d                   	pop    %ebp
 676:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 677:	03 72 04             	add    0x4(%edx),%esi
 67a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 67d:	8b 10                	mov    (%eax),%edx
 67f:	8b 12                	mov    (%edx),%edx
 681:	89 53 f8             	mov    %edx,-0x8(%ebx)
 684:	eb db                	jmp    661 <free+0x3e>
    p->s.size += bp->s.size;
 686:	03 53 fc             	add    -0x4(%ebx),%edx
 689:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 68f:	89 10                	mov    %edx,(%eax)
 691:	eb da                	jmp    66d <free+0x4a>

00000693 <morecore>:

static Header*
morecore(uint nu)
{
 693:	55                   	push   %ebp
 694:	89 e5                	mov    %esp,%ebp
 696:	53                   	push   %ebx
 697:	83 ec 04             	sub    $0x4,%esp
 69a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 69c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6a1:	77 05                	ja     6a8 <morecore+0x15>
    nu = 4096;
 6a3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6a8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6af:	83 ec 0c             	sub    $0xc,%esp
 6b2:	50                   	push   %eax
 6b3:	e8 38 fd ff ff       	call   3f0 <sbrk>
  if(p == (char*)-1)
 6b8:	83 c4 10             	add    $0x10,%esp
 6bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6be:	74 1c                	je     6dc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c3:	83 c0 08             	add    $0x8,%eax
 6c6:	83 ec 0c             	sub    $0xc,%esp
 6c9:	50                   	push   %eax
 6ca:	e8 54 ff ff ff       	call   623 <free>
  return freep;
 6cf:	a1 60 0b 00 00       	mov    0xb60,%eax
 6d4:	83 c4 10             	add    $0x10,%esp
}
 6d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6da:	c9                   	leave  
 6db:	c3                   	ret    
    return 0;
 6dc:	b8 00 00 00 00       	mov    $0x0,%eax
 6e1:	eb f4                	jmp    6d7 <morecore+0x44>

000006e3 <malloc>:

void*
malloc(uint nbytes)
{
 6e3:	55                   	push   %ebp
 6e4:	89 e5                	mov    %esp,%ebp
 6e6:	53                   	push   %ebx
 6e7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ea:	8b 45 08             	mov    0x8(%ebp),%eax
 6ed:	8d 58 07             	lea    0x7(%eax),%ebx
 6f0:	c1 eb 03             	shr    $0x3,%ebx
 6f3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6f6:	8b 0d 60 0b 00 00    	mov    0xb60,%ecx
 6fc:	85 c9                	test   %ecx,%ecx
 6fe:	74 04                	je     704 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 700:	8b 01                	mov    (%ecx),%eax
 702:	eb 4a                	jmp    74e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 704:	c7 05 60 0b 00 00 64 	movl   $0xb64,0xb60
 70b:	0b 00 00 
 70e:	c7 05 64 0b 00 00 64 	movl   $0xb64,0xb64
 715:	0b 00 00 
    base.s.size = 0;
 718:	c7 05 68 0b 00 00 00 	movl   $0x0,0xb68
 71f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 722:	b9 64 0b 00 00       	mov    $0xb64,%ecx
 727:	eb d7                	jmp    700 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 729:	74 19                	je     744 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 72b:	29 da                	sub    %ebx,%edx
 72d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 730:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 733:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 736:	89 0d 60 0b 00 00    	mov    %ecx,0xb60
      return (void*)(p + 1);
 73c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 73f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 742:	c9                   	leave  
 743:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 744:	8b 10                	mov    (%eax),%edx
 746:	89 11                	mov    %edx,(%ecx)
 748:	eb ec                	jmp    736 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74a:	89 c1                	mov    %eax,%ecx
 74c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 74e:	8b 50 04             	mov    0x4(%eax),%edx
 751:	39 da                	cmp    %ebx,%edx
 753:	73 d4                	jae    729 <malloc+0x46>
    if(p == freep)
 755:	39 05 60 0b 00 00    	cmp    %eax,0xb60
 75b:	75 ed                	jne    74a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 75d:	89 d8                	mov    %ebx,%eax
 75f:	e8 2f ff ff ff       	call   693 <morecore>
 764:	85 c0                	test   %eax,%eax
 766:	75 e2                	jne    74a <malloc+0x67>
 768:	eb d5                	jmp    73f <malloc+0x5c>
