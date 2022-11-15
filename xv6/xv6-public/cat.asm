
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 80 0b 00 00       	push   $0xb80
  15:	56                   	push   %esi
  16:	e8 42 03 00 00       	call   35d <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 80 0b 00 00       	push   $0xb80
  2d:	6a 01                	push   $0x1
  2f:	e8 31 03 00 00       	call   365 <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 48 07 00 00       	push   $0x748
  43:	6a 01                	push   $0x1
  45:	e8 50 04 00 00       	call   49a <printf>
      exit();
  4a:	e8 f6 02 00 00       	call   345 <exit>
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 5a 07 00 00       	push   $0x75a
  60:	6a 01                	push   $0x1
  62:	e8 33 04 00 00       	call   49a <printf>
    exit();
  67:	e8 d9 02 00 00       	call   345 <exit>

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 9f 02 00 00       	call   345 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 b6 02 00 00       	call   36d <close>
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
  cf:	e8 b1 02 00 00       	call   385 <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 6b 07 00 00       	push   $0x76b
  e7:	6a 01                	push   $0x1
  e9:	e8 ac 03 00 00       	call   49a <printf>
      exit();
  ee:	e8 52 02 00 00       	call   345 <exit>
  }
  exit();
  f3:	e8 4d 02 00 00       	call   345 <exit>

000000f8 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	56                   	push   %esi
  fc:	53                   	push   %ebx
  fd:	8b 75 08             	mov    0x8(%ebp),%esi
 100:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 103:	89 f0                	mov    %esi,%eax
 105:	89 d1                	mov    %edx,%ecx
 107:	83 c2 01             	add    $0x1,%edx
 10a:	89 c3                	mov    %eax,%ebx
 10c:	83 c0 01             	add    $0x1,%eax
 10f:	0f b6 09             	movzbl (%ecx),%ecx
 112:	88 0b                	mov    %cl,(%ebx)
 114:	84 c9                	test   %cl,%cl
 116:	75 ed                	jne    105 <strcpy+0xd>
    ;
  return os;
}
 118:	89 f0                	mov    %esi,%eax
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	8b 4d 08             	mov    0x8(%ebp),%ecx
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 127:	eb 06                	jmp    12f <strcmp+0x11>
    p++, q++;
 129:	83 c1 01             	add    $0x1,%ecx
 12c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 12f:	0f b6 01             	movzbl (%ecx),%eax
 132:	84 c0                	test   %al,%al
 134:	74 04                	je     13a <strcmp+0x1c>
 136:	3a 02                	cmp    (%edx),%al
 138:	74 ef                	je     129 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 13a:	0f b6 c0             	movzbl %al,%eax
 13d:	0f b6 12             	movzbl (%edx),%edx
 140:	29 d0                	sub    %edx,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

00000144 <strlen>:

uint
strlen(const char *s)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 14a:	b8 00 00 00 00       	mov    $0x0,%eax
 14f:	eb 03                	jmp    154 <strlen+0x10>
 151:	83 c0 01             	add    $0x1,%eax
 154:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 158:	75 f7                	jne    151 <strlen+0xd>
    ;
  return n;
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <memset>:

void*
memset(void *dst, int c, uint n)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	57                   	push   %edi
 160:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 163:	89 d7                	mov    %edx,%edi
 165:	8b 4d 10             	mov    0x10(%ebp),%ecx
 168:	8b 45 0c             	mov    0xc(%ebp),%eax
 16b:	fc                   	cld    
 16c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 16e:	89 d0                	mov    %edx,%eax
 170:	8b 7d fc             	mov    -0x4(%ebp),%edi
 173:	c9                   	leave  
 174:	c3                   	ret    

00000175 <strchr>:

char*
strchr(const char *s, char c)
{
 175:	55                   	push   %ebp
 176:	89 e5                	mov    %esp,%ebp
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17f:	eb 03                	jmp    184 <strchr+0xf>
 181:	83 c0 01             	add    $0x1,%eax
 184:	0f b6 10             	movzbl (%eax),%edx
 187:	84 d2                	test   %dl,%dl
 189:	74 06                	je     191 <strchr+0x1c>
    if(*s == c)
 18b:	38 ca                	cmp    %cl,%dl
 18d:	75 f2                	jne    181 <strchr+0xc>
 18f:	eb 05                	jmp    196 <strchr+0x21>
      return (char*)s;
  return 0;
 191:	b8 00 00 00 00       	mov    $0x0,%eax
}
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    

00000198 <gets>:

char*
gets(char *buf, int max)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	57                   	push   %edi
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	83 ec 1c             	sub    $0x1c,%esp
 1a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a9:	89 de                	mov    %ebx,%esi
 1ab:	83 c3 01             	add    $0x1,%ebx
 1ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b1:	7d 2e                	jge    1e1 <gets+0x49>
    cc = read(0, &c, 1);
 1b3:	83 ec 04             	sub    $0x4,%esp
 1b6:	6a 01                	push   $0x1
 1b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1bb:	50                   	push   %eax
 1bc:	6a 00                	push   $0x0
 1be:	e8 9a 01 00 00       	call   35d <read>
    if(cc < 1)
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7e 17                	jle    1e1 <gets+0x49>
      break;
    buf[i++] = c;
 1ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ce:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1d1:	3c 0a                	cmp    $0xa,%al
 1d3:	0f 94 c2             	sete   %dl
 1d6:	3c 0d                	cmp    $0xd,%al
 1d8:	0f 94 c0             	sete   %al
 1db:	08 c2                	or     %al,%dl
 1dd:	74 ca                	je     1a9 <gets+0x11>
    buf[i++] = c;
 1df:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1e1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e5:	89 f8                	mov    %edi,%eax
 1e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	6a 00                	push   $0x0
 1f9:	ff 75 08             	push   0x8(%ebp)
 1fc:	e8 84 01 00 00       	call   385 <open>
  if(fd < 0)
 201:	83 c4 10             	add    $0x10,%esp
 204:	85 c0                	test   %eax,%eax
 206:	78 24                	js     22c <stat+0x3d>
 208:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	ff 75 0c             	push   0xc(%ebp)
 210:	50                   	push   %eax
 211:	e8 87 01 00 00       	call   39d <fstat>
 216:	89 c6                	mov    %eax,%esi
  close(fd);
 218:	89 1c 24             	mov    %ebx,(%esp)
 21b:	e8 4d 01 00 00       	call   36d <close>
  return r;
 220:	83 c4 10             	add    $0x10,%esp
}
 223:	89 f0                	mov    %esi,%eax
 225:	8d 65 f8             	lea    -0x8(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    
    return -1;
 22c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 231:	eb f0                	jmp    223 <stat+0x34>

00000233 <atoi>:

int
atoi(const char *s)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	53                   	push   %ebx
 237:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 23a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 23f:	eb 10                	jmp    251 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 241:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 244:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 247:	83 c1 01             	add    $0x1,%ecx
 24a:	0f be c0             	movsbl %al,%eax
 24d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 251:	0f b6 01             	movzbl (%ecx),%eax
 254:	8d 58 d0             	lea    -0x30(%eax),%ebx
 257:	80 fb 09             	cmp    $0x9,%bl
 25a:	76 e5                	jbe    241 <atoi+0xe>
  return n;
}
 25c:	89 d0                	mov    %edx,%eax
 25e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 271:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 273:	eb 0d                	jmp    282 <memmove+0x1f>
    *dst++ = *src++;
 275:	0f b6 01             	movzbl (%ecx),%eax
 278:	88 02                	mov    %al,(%edx)
 27a:	8d 49 01             	lea    0x1(%ecx),%ecx
 27d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 280:	89 d8                	mov    %ebx,%eax
 282:	8d 58 ff             	lea    -0x1(%eax),%ebx
 285:	85 c0                	test   %eax,%eax
 287:	7f ec                	jg     275 <memmove+0x12>
  return vdst;
}
 289:	89 f0                	mov    %esi,%eax
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    

0000028f <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 295:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 297:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 29a:	89 08                	mov    %ecx,(%eax)
  return old;
}
 29c:	89 d0                	mov    %edx,%eax
 29e:	5d                   	pop    %ebp
 29f:	c3                   	ret    

000002a0 <lock_init>:
void 
lock_init(lock_t *lock){
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ac:	5d                   	pop    %ebp
 2ad:	c3                   	ret    

000002ae <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 2ae:	55                   	push   %ebp
 2af:	89 e5                	mov    %esp,%ebp
 2b1:	53                   	push   %ebx
 2b2:	83 ec 04             	sub    $0x4,%esp
 2b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 2b8:	83 ec 08             	sub    $0x8,%esp
 2bb:	6a 01                	push   $0x1
 2bd:	53                   	push   %ebx
 2be:	e8 cc ff ff ff       	call   28f <TestAndSet>
 2c3:	83 c4 10             	add    $0x10,%esp
 2c6:	83 f8 01             	cmp    $0x1,%eax
 2c9:	74 ed                	je     2b8 <lock_acquire+0xa>
    ;
}
 2cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2ce:	c9                   	leave  
 2cf:	c3                   	ret    

000002d0 <lock_release>:
void 
lock_release(lock_t *lock){
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    

000002de <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 2e4:	68 04 20 00 00       	push   $0x2004
 2e9:	e8 d2 03 00 00       	call   6c0 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 2ee:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 2f1:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 2f3:	eb 03                	jmp    2f8 <thread_create+0x1a>
      stack += 1;
 2f5:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 2f8:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 2fe:	75 f5                	jne    2f5 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 300:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 302:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 305:	52                   	push   %edx
 306:	ff 75 10             	push   0x10(%ebp)
 309:	ff 75 0c             	push   0xc(%ebp)
 30c:	ff 75 08             	push   0x8(%ebp)
 30f:	e8 d1 00 00 00       	call   3e5 <clone>
 
    return pid;
}
 314:	c9                   	leave  
 315:	c3                   	ret    

00000316 <thread_join>:
int 
thread_join(){
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	53                   	push   %ebx
 31a:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 31d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 320:	50                   	push   %eax
 321:	e8 c7 00 00 00       	call   3ed <join>
 326:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 328:	83 c4 04             	add    $0x4,%esp
 32b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 32e:	ff 70 fc             	push   -0x4(%eax)
 331:	e8 ca 02 00 00       	call   600 <free>
  return waitedForPID;
 336:	89 d8                	mov    %ebx,%eax
 338:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33b:	c9                   	leave  
 33c:	c3                   	ret    

0000033d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33d:	b8 01 00 00 00       	mov    $0x1,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <exit>:
SYSCALL(exit)
 345:	b8 02 00 00 00       	mov    $0x2,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <wait>:
SYSCALL(wait)
 34d:	b8 03 00 00 00       	mov    $0x3,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <pipe>:
SYSCALL(pipe)
 355:	b8 04 00 00 00       	mov    $0x4,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <read>:
SYSCALL(read)
 35d:	b8 05 00 00 00       	mov    $0x5,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <write>:
SYSCALL(write)
 365:	b8 10 00 00 00       	mov    $0x10,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <close>:
SYSCALL(close)
 36d:	b8 15 00 00 00       	mov    $0x15,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <kill>:
SYSCALL(kill)
 375:	b8 06 00 00 00       	mov    $0x6,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <exec>:
SYSCALL(exec)
 37d:	b8 07 00 00 00       	mov    $0x7,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <open>:
SYSCALL(open)
 385:	b8 0f 00 00 00       	mov    $0xf,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <mknod>:
SYSCALL(mknod)
 38d:	b8 11 00 00 00       	mov    $0x11,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <unlink>:
SYSCALL(unlink)
 395:	b8 12 00 00 00       	mov    $0x12,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <fstat>:
SYSCALL(fstat)
 39d:	b8 08 00 00 00       	mov    $0x8,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <link>:
SYSCALL(link)
 3a5:	b8 13 00 00 00       	mov    $0x13,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <mkdir>:
SYSCALL(mkdir)
 3ad:	b8 14 00 00 00       	mov    $0x14,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <chdir>:
SYSCALL(chdir)
 3b5:	b8 09 00 00 00       	mov    $0x9,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <dup>:
SYSCALL(dup)
 3bd:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <getpid>:
SYSCALL(getpid)
 3c5:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <sbrk>:
SYSCALL(sbrk)
 3cd:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <sleep>:
SYSCALL(sleep)
 3d5:	b8 0d 00 00 00       	mov    $0xd,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <uptime>:
SYSCALL(uptime)
 3dd:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <clone>:
SYSCALL(clone)
 3e5:	b8 16 00 00 00       	mov    $0x16,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <join>:
SYSCALL(join)
 3ed:	b8 17 00 00 00       	mov    $0x17,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f5:	55                   	push   %ebp
 3f6:	89 e5                	mov    %esp,%ebp
 3f8:	83 ec 1c             	sub    $0x1c,%esp
 3fb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3fe:	6a 01                	push   $0x1
 400:	8d 55 f4             	lea    -0xc(%ebp),%edx
 403:	52                   	push   %edx
 404:	50                   	push   %eax
 405:	e8 5b ff ff ff       	call   365 <write>
}
 40a:	83 c4 10             	add    $0x10,%esp
 40d:	c9                   	leave  
 40e:	c3                   	ret    

0000040f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 40f:	55                   	push   %ebp
 410:	89 e5                	mov    %esp,%ebp
 412:	57                   	push   %edi
 413:	56                   	push   %esi
 414:	53                   	push   %ebx
 415:	83 ec 2c             	sub    $0x2c,%esp
 418:	89 45 d0             	mov    %eax,-0x30(%ebp)
 41b:	89 d0                	mov    %edx,%eax
 41d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 423:	0f 95 c1             	setne  %cl
 426:	c1 ea 1f             	shr    $0x1f,%edx
 429:	84 d1                	test   %dl,%cl
 42b:	74 44                	je     471 <printint+0x62>
    neg = 1;
    x = -xx;
 42d:	f7 d8                	neg    %eax
 42f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 431:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 438:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 43d:	89 c8                	mov    %ecx,%eax
 43f:	ba 00 00 00 00       	mov    $0x0,%edx
 444:	f7 f6                	div    %esi
 446:	89 df                	mov    %ebx,%edi
 448:	83 c3 01             	add    $0x1,%ebx
 44b:	0f b6 92 e0 07 00 00 	movzbl 0x7e0(%edx),%edx
 452:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 456:	89 ca                	mov    %ecx,%edx
 458:	89 c1                	mov    %eax,%ecx
 45a:	39 d6                	cmp    %edx,%esi
 45c:	76 df                	jbe    43d <printint+0x2e>
  if(neg)
 45e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 462:	74 31                	je     495 <printint+0x86>
    buf[i++] = '-';
 464:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 469:	8d 5f 02             	lea    0x2(%edi),%ebx
 46c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 46f:	eb 17                	jmp    488 <printint+0x79>
    x = xx;
 471:	89 c1                	mov    %eax,%ecx
  neg = 0;
 473:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 47a:	eb bc                	jmp    438 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 47c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 481:	89 f0                	mov    %esi,%eax
 483:	e8 6d ff ff ff       	call   3f5 <putc>
  while(--i >= 0)
 488:	83 eb 01             	sub    $0x1,%ebx
 48b:	79 ef                	jns    47c <printint+0x6d>
}
 48d:	83 c4 2c             	add    $0x2c,%esp
 490:	5b                   	pop    %ebx
 491:	5e                   	pop    %esi
 492:	5f                   	pop    %edi
 493:	5d                   	pop    %ebp
 494:	c3                   	ret    
 495:	8b 75 d0             	mov    -0x30(%ebp),%esi
 498:	eb ee                	jmp    488 <printint+0x79>

0000049a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	57                   	push   %edi
 49e:	56                   	push   %esi
 49f:	53                   	push   %ebx
 4a0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4a3:	8d 45 10             	lea    0x10(%ebp),%eax
 4a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4a9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ae:	bb 00 00 00 00       	mov    $0x0,%ebx
 4b3:	eb 14                	jmp    4c9 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4b5:	89 fa                	mov    %edi,%edx
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ba:	e8 36 ff ff ff       	call   3f5 <putc>
 4bf:	eb 05                	jmp    4c6 <printf+0x2c>
      }
    } else if(state == '%'){
 4c1:	83 fe 25             	cmp    $0x25,%esi
 4c4:	74 25                	je     4eb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4c6:	83 c3 01             	add    $0x1,%ebx
 4c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cc:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4d0:	84 c0                	test   %al,%al
 4d2:	0f 84 20 01 00 00    	je     5f8 <printf+0x15e>
    c = fmt[i] & 0xff;
 4d8:	0f be f8             	movsbl %al,%edi
 4db:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4de:	85 f6                	test   %esi,%esi
 4e0:	75 df                	jne    4c1 <printf+0x27>
      if(c == '%'){
 4e2:	83 f8 25             	cmp    $0x25,%eax
 4e5:	75 ce                	jne    4b5 <printf+0x1b>
        state = '%';
 4e7:	89 c6                	mov    %eax,%esi
 4e9:	eb db                	jmp    4c6 <printf+0x2c>
      if(c == 'd'){
 4eb:	83 f8 25             	cmp    $0x25,%eax
 4ee:	0f 84 cf 00 00 00    	je     5c3 <printf+0x129>
 4f4:	0f 8c dd 00 00 00    	jl     5d7 <printf+0x13d>
 4fa:	83 f8 78             	cmp    $0x78,%eax
 4fd:	0f 8f d4 00 00 00    	jg     5d7 <printf+0x13d>
 503:	83 f8 63             	cmp    $0x63,%eax
 506:	0f 8c cb 00 00 00    	jl     5d7 <printf+0x13d>
 50c:	83 e8 63             	sub    $0x63,%eax
 50f:	83 f8 15             	cmp    $0x15,%eax
 512:	0f 87 bf 00 00 00    	ja     5d7 <printf+0x13d>
 518:	ff 24 85 88 07 00 00 	jmp    *0x788(,%eax,4)
        printint(fd, *ap, 10, 1);
 51f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 522:	8b 17                	mov    (%edi),%edx
 524:	83 ec 0c             	sub    $0xc,%esp
 527:	6a 01                	push   $0x1
 529:	b9 0a 00 00 00       	mov    $0xa,%ecx
 52e:	8b 45 08             	mov    0x8(%ebp),%eax
 531:	e8 d9 fe ff ff       	call   40f <printint>
        ap++;
 536:	83 c7 04             	add    $0x4,%edi
 539:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 53c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 53f:	be 00 00 00 00       	mov    $0x0,%esi
 544:	eb 80                	jmp    4c6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 546:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 549:	8b 17                	mov    (%edi),%edx
 54b:	83 ec 0c             	sub    $0xc,%esp
 54e:	6a 00                	push   $0x0
 550:	b9 10 00 00 00       	mov    $0x10,%ecx
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	e8 b2 fe ff ff       	call   40f <printint>
        ap++;
 55d:	83 c7 04             	add    $0x4,%edi
 560:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 563:	83 c4 10             	add    $0x10,%esp
      state = 0;
 566:	be 00 00 00 00       	mov    $0x0,%esi
 56b:	e9 56 ff ff ff       	jmp    4c6 <printf+0x2c>
        s = (char*)*ap;
 570:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 573:	8b 30                	mov    (%eax),%esi
        ap++;
 575:	83 c0 04             	add    $0x4,%eax
 578:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 57b:	85 f6                	test   %esi,%esi
 57d:	75 15                	jne    594 <printf+0xfa>
          s = "(null)";
 57f:	be 80 07 00 00       	mov    $0x780,%esi
 584:	eb 0e                	jmp    594 <printf+0xfa>
          putc(fd, *s);
 586:	0f be d2             	movsbl %dl,%edx
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	e8 64 fe ff ff       	call   3f5 <putc>
          s++;
 591:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 594:	0f b6 16             	movzbl (%esi),%edx
 597:	84 d2                	test   %dl,%dl
 599:	75 eb                	jne    586 <printf+0xec>
      state = 0;
 59b:	be 00 00 00 00       	mov    $0x0,%esi
 5a0:	e9 21 ff ff ff       	jmp    4c6 <printf+0x2c>
        putc(fd, *ap);
 5a5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a8:	0f be 17             	movsbl (%edi),%edx
 5ab:	8b 45 08             	mov    0x8(%ebp),%eax
 5ae:	e8 42 fe ff ff       	call   3f5 <putc>
        ap++;
 5b3:	83 c7 04             	add    $0x4,%edi
 5b6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5b9:	be 00 00 00 00       	mov    $0x0,%esi
 5be:	e9 03 ff ff ff       	jmp    4c6 <printf+0x2c>
        putc(fd, c);
 5c3:	89 fa                	mov    %edi,%edx
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	e8 28 fe ff ff       	call   3f5 <putc>
      state = 0;
 5cd:	be 00 00 00 00       	mov    $0x0,%esi
 5d2:	e9 ef fe ff ff       	jmp    4c6 <printf+0x2c>
        putc(fd, '%');
 5d7:	ba 25 00 00 00       	mov    $0x25,%edx
 5dc:	8b 45 08             	mov    0x8(%ebp),%eax
 5df:	e8 11 fe ff ff       	call   3f5 <putc>
        putc(fd, c);
 5e4:	89 fa                	mov    %edi,%edx
 5e6:	8b 45 08             	mov    0x8(%ebp),%eax
 5e9:	e8 07 fe ff ff       	call   3f5 <putc>
      state = 0;
 5ee:	be 00 00 00 00       	mov    $0x0,%esi
 5f3:	e9 ce fe ff ff       	jmp    4c6 <printf+0x2c>
    }
  }
}
 5f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 609:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60c:	a1 80 0d 00 00       	mov    0xd80,%eax
 611:	eb 02                	jmp    615 <free+0x15>
 613:	89 d0                	mov    %edx,%eax
 615:	39 c8                	cmp    %ecx,%eax
 617:	73 04                	jae    61d <free+0x1d>
 619:	39 08                	cmp    %ecx,(%eax)
 61b:	77 12                	ja     62f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61d:	8b 10                	mov    (%eax),%edx
 61f:	39 c2                	cmp    %eax,%edx
 621:	77 f0                	ja     613 <free+0x13>
 623:	39 c8                	cmp    %ecx,%eax
 625:	72 08                	jb     62f <free+0x2f>
 627:	39 ca                	cmp    %ecx,%edx
 629:	77 04                	ja     62f <free+0x2f>
 62b:	89 d0                	mov    %edx,%eax
 62d:	eb e6                	jmp    615 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 62f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 632:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 635:	8b 10                	mov    (%eax),%edx
 637:	39 d7                	cmp    %edx,%edi
 639:	74 19                	je     654 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 63b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 63e:	8b 50 04             	mov    0x4(%eax),%edx
 641:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 644:	39 ce                	cmp    %ecx,%esi
 646:	74 1b                	je     663 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 648:	89 08                	mov    %ecx,(%eax)
  freep = p;
 64a:	a3 80 0d 00 00       	mov    %eax,0xd80
}
 64f:	5b                   	pop    %ebx
 650:	5e                   	pop    %esi
 651:	5f                   	pop    %edi
 652:	5d                   	pop    %ebp
 653:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 654:	03 72 04             	add    0x4(%edx),%esi
 657:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 65a:	8b 10                	mov    (%eax),%edx
 65c:	8b 12                	mov    (%edx),%edx
 65e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 661:	eb db                	jmp    63e <free+0x3e>
    p->s.size += bp->s.size;
 663:	03 53 fc             	add    -0x4(%ebx),%edx
 666:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 669:	8b 53 f8             	mov    -0x8(%ebx),%edx
 66c:	89 10                	mov    %edx,(%eax)
 66e:	eb da                	jmp    64a <free+0x4a>

00000670 <morecore>:

static Header*
morecore(uint nu)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	53                   	push   %ebx
 674:	83 ec 04             	sub    $0x4,%esp
 677:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 679:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 67e:	77 05                	ja     685 <morecore+0x15>
    nu = 4096;
 680:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 685:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 68c:	83 ec 0c             	sub    $0xc,%esp
 68f:	50                   	push   %eax
 690:	e8 38 fd ff ff       	call   3cd <sbrk>
  if(p == (char*)-1)
 695:	83 c4 10             	add    $0x10,%esp
 698:	83 f8 ff             	cmp    $0xffffffff,%eax
 69b:	74 1c                	je     6b9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 69d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6a0:	83 c0 08             	add    $0x8,%eax
 6a3:	83 ec 0c             	sub    $0xc,%esp
 6a6:	50                   	push   %eax
 6a7:	e8 54 ff ff ff       	call   600 <free>
  return freep;
 6ac:	a1 80 0d 00 00       	mov    0xd80,%eax
 6b1:	83 c4 10             	add    $0x10,%esp
}
 6b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b7:	c9                   	leave  
 6b8:	c3                   	ret    
    return 0;
 6b9:	b8 00 00 00 00       	mov    $0x0,%eax
 6be:	eb f4                	jmp    6b4 <morecore+0x44>

000006c0 <malloc>:

void*
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	53                   	push   %ebx
 6c4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ca:	8d 58 07             	lea    0x7(%eax),%ebx
 6cd:	c1 eb 03             	shr    $0x3,%ebx
 6d0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6d3:	8b 0d 80 0d 00 00    	mov    0xd80,%ecx
 6d9:	85 c9                	test   %ecx,%ecx
 6db:	74 04                	je     6e1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6dd:	8b 01                	mov    (%ecx),%eax
 6df:	eb 4a                	jmp    72b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6e1:	c7 05 80 0d 00 00 84 	movl   $0xd84,0xd80
 6e8:	0d 00 00 
 6eb:	c7 05 84 0d 00 00 84 	movl   $0xd84,0xd84
 6f2:	0d 00 00 
    base.s.size = 0;
 6f5:	c7 05 88 0d 00 00 00 	movl   $0x0,0xd88
 6fc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6ff:	b9 84 0d 00 00       	mov    $0xd84,%ecx
 704:	eb d7                	jmp    6dd <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 706:	74 19                	je     721 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 708:	29 da                	sub    %ebx,%edx
 70a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 70d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 710:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 713:	89 0d 80 0d 00 00    	mov    %ecx,0xd80
      return (void*)(p + 1);
 719:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 71c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 71f:	c9                   	leave  
 720:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 721:	8b 10                	mov    (%eax),%edx
 723:	89 11                	mov    %edx,(%ecx)
 725:	eb ec                	jmp    713 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 727:	89 c1                	mov    %eax,%ecx
 729:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 72b:	8b 50 04             	mov    0x4(%eax),%edx
 72e:	39 da                	cmp    %ebx,%edx
 730:	73 d4                	jae    706 <malloc+0x46>
    if(p == freep)
 732:	39 05 80 0d 00 00    	cmp    %eax,0xd80
 738:	75 ed                	jne    727 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 73a:	89 d8                	mov    %ebx,%eax
 73c:	e8 2f ff ff ff       	call   670 <morecore>
 741:	85 c0                	test   %eax,%eax
 743:	75 e2                	jne    727 <malloc+0x67>
 745:	eb d5                	jmp    71c <malloc+0x5c>
