
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 2c 07 00 00       	push   $0x72c
  19:	e8 4b 03 00 00       	call   369 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 72 03 00 00       	call   3a1 <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 66 03 00 00       	call   3a1 <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 2c 07 00 00       	push   $0x72c
  4c:	e8 20 03 00 00       	call   371 <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 2c 07 00 00       	push   $0x72c
  5b:	e8 09 03 00 00       	call   369 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 47 07 00 00       	push   $0x747
  6d:	6a 01                	push   $0x1
  6f:	e8 0a 04 00 00       	call   47e <printf>
      exit();
  74:	e8 b0 02 00 00       	call   329 <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 73 07 00 00       	push   $0x773
  81:	6a 01                	push   $0x1
  83:	e8 f6 03 00 00       	call   47e <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 a1 02 00 00       	call   331 <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 34 07 00 00       	push   $0x734
  a0:	6a 01                	push   $0x1
  a2:	e8 d7 03 00 00       	call   47e <printf>
    pid = fork();
  a7:	e8 75 02 00 00       	call   321 <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 48 0b 00 00       	push   $0xb48
  bf:	68 5a 07 00 00       	push   $0x75a
  c4:	e8 98 02 00 00       	call   361 <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 5d 07 00 00       	push   $0x75d
  d1:	6a 01                	push   $0x1
  d3:	e8 a6 03 00 00       	call   47e <printf>
      exit();
  d8:	e8 4c 02 00 00       	call   329 <exit>

000000dd <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	56                   	push   %esi
  e1:	53                   	push   %ebx
  e2:	8b 75 08             	mov    0x8(%ebp),%esi
  e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e8:	89 f0                	mov    %esi,%eax
  ea:	89 d1                	mov    %edx,%ecx
  ec:	83 c2 01             	add    $0x1,%edx
  ef:	89 c3                	mov    %eax,%ebx
  f1:	83 c0 01             	add    $0x1,%eax
  f4:	0f b6 09             	movzbl (%ecx),%ecx
  f7:	88 0b                	mov    %cl,(%ebx)
  f9:	84 c9                	test   %cl,%cl
  fb:	75 ed                	jne    ea <strcpy+0xd>
    ;
  return os;
}
  fd:	89 f0                	mov    %esi,%eax
  ff:	5b                   	pop    %ebx
 100:	5e                   	pop    %esi
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    

00000103 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 10c:	eb 06                	jmp    114 <strcmp+0x11>
    p++, q++;
 10e:	83 c1 01             	add    $0x1,%ecx
 111:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 114:	0f b6 01             	movzbl (%ecx),%eax
 117:	84 c0                	test   %al,%al
 119:	74 04                	je     11f <strcmp+0x1c>
 11b:	3a 02                	cmp    (%edx),%al
 11d:	74 ef                	je     10e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 11f:	0f b6 c0             	movzbl %al,%eax
 122:	0f b6 12             	movzbl (%edx),%edx
 125:	29 d0                	sub    %edx,%eax
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    

00000129 <strlen>:

uint
strlen(const char *s)
{
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 12f:	b8 00 00 00 00       	mov    $0x0,%eax
 134:	eb 03                	jmp    139 <strlen+0x10>
 136:	83 c0 01             	add    $0x1,%eax
 139:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 13d:	75 f7                	jne    136 <strlen+0xd>
    ;
  return n;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    

00000141 <memset>:

void*
memset(void *dst, int c, uint n)
{
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	57                   	push   %edi
 145:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 148:	89 d7                	mov    %edx,%edi
 14a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14d:	8b 45 0c             	mov    0xc(%ebp),%eax
 150:	fc                   	cld    
 151:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 153:	89 d0                	mov    %edx,%eax
 155:	8b 7d fc             	mov    -0x4(%ebp),%edi
 158:	c9                   	leave  
 159:	c3                   	ret    

0000015a <strchr>:

char*
strchr(const char *s, char c)
{
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 164:	eb 03                	jmp    169 <strchr+0xf>
 166:	83 c0 01             	add    $0x1,%eax
 169:	0f b6 10             	movzbl (%eax),%edx
 16c:	84 d2                	test   %dl,%dl
 16e:	74 06                	je     176 <strchr+0x1c>
    if(*s == c)
 170:	38 ca                	cmp    %cl,%dl
 172:	75 f2                	jne    166 <strchr+0xc>
 174:	eb 05                	jmp    17b <strchr+0x21>
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	57                   	push   %edi
 181:	56                   	push   %esi
 182:	53                   	push   %ebx
 183:	83 ec 1c             	sub    $0x1c,%esp
 186:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	bb 00 00 00 00       	mov    $0x0,%ebx
 18e:	89 de                	mov    %ebx,%esi
 190:	83 c3 01             	add    $0x1,%ebx
 193:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 196:	7d 2e                	jge    1c6 <gets+0x49>
    cc = read(0, &c, 1);
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	6a 01                	push   $0x1
 19d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	6a 00                	push   $0x0
 1a3:	e8 99 01 00 00       	call   341 <read>
    if(cc < 1)
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	85 c0                	test   %eax,%eax
 1ad:	7e 17                	jle    1c6 <gets+0x49>
      break;
    buf[i++] = c;
 1af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1b6:	3c 0a                	cmp    $0xa,%al
 1b8:	0f 94 c2             	sete   %dl
 1bb:	3c 0d                	cmp    $0xd,%al
 1bd:	0f 94 c0             	sete   %al
 1c0:	08 c2                	or     %al,%dl
 1c2:	74 ca                	je     18e <gets+0x11>
    buf[i++] = c;
 1c4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1c6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1ca:	89 f8                	mov    %edi,%eax
 1cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cf:	5b                   	pop    %ebx
 1d0:	5e                   	pop    %esi
 1d1:	5f                   	pop    %edi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	6a 00                	push   $0x0
 1de:	ff 75 08             	push   0x8(%ebp)
 1e1:	e8 83 01 00 00       	call   369 <open>
  if(fd < 0)
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	85 c0                	test   %eax,%eax
 1eb:	78 24                	js     211 <stat+0x3d>
 1ed:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1ef:	83 ec 08             	sub    $0x8,%esp
 1f2:	ff 75 0c             	push   0xc(%ebp)
 1f5:	50                   	push   %eax
 1f6:	e8 86 01 00 00       	call   381 <fstat>
 1fb:	89 c6                	mov    %eax,%esi
  close(fd);
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	e8 4c 01 00 00       	call   351 <close>
  return r;
 205:	83 c4 10             	add    $0x10,%esp
}
 208:	89 f0                	mov    %esi,%eax
 20a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20d:	5b                   	pop    %ebx
 20e:	5e                   	pop    %esi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
    return -1;
 211:	be ff ff ff ff       	mov    $0xffffffff,%esi
 216:	eb f0                	jmp    208 <stat+0x34>

00000218 <atoi>:

int
atoi(const char *s)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	53                   	push   %ebx
 21c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 21f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 224:	eb 10                	jmp    236 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 226:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 229:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 22c:	83 c1 01             	add    $0x1,%ecx
 22f:	0f be c0             	movsbl %al,%eax
 232:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 236:	0f b6 01             	movzbl (%ecx),%eax
 239:	8d 58 d0             	lea    -0x30(%eax),%ebx
 23c:	80 fb 09             	cmp    $0x9,%bl
 23f:	76 e5                	jbe    226 <atoi+0xe>
  return n;
}
 241:	89 d0                	mov    %edx,%eax
 243:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 246:	c9                   	leave  
 247:	c3                   	ret    

00000248 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	56                   	push   %esi
 24c:	53                   	push   %ebx
 24d:	8b 75 08             	mov    0x8(%ebp),%esi
 250:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 253:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 256:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 258:	eb 0d                	jmp    267 <memmove+0x1f>
    *dst++ = *src++;
 25a:	0f b6 01             	movzbl (%ecx),%eax
 25d:	88 02                	mov    %al,(%edx)
 25f:	8d 49 01             	lea    0x1(%ecx),%ecx
 262:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 265:	89 d8                	mov    %ebx,%eax
 267:	8d 58 ff             	lea    -0x1(%eax),%ebx
 26a:	85 c0                	test   %eax,%eax
 26c:	7f ec                	jg     25a <memmove+0x12>
  return vdst;
}
 26e:	89 f0                	mov    %esi,%eax
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 27a:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 27c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 27f:	89 08                	mov    %ecx,(%eax)
  return old;
}
 281:	89 d0                	mov    %edx,%eax
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    

00000285 <lock_init>:
void 
lock_init(lock_t *lock){
 285:	55                   	push   %ebp
 286:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    

00000293 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
 296:	53                   	push   %ebx
 297:	83 ec 04             	sub    $0x4,%esp
 29a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 29d:	83 ec 08             	sub    $0x8,%esp
 2a0:	6a 01                	push   $0x1
 2a2:	53                   	push   %ebx
 2a3:	e8 cc ff ff ff       	call   274 <TestAndSet>
 2a8:	83 c4 10             	add    $0x10,%esp
 2ab:	83 f8 01             	cmp    $0x1,%eax
 2ae:	74 ed                	je     29d <lock_acquire+0xa>
    ;
}
 2b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    

000002b5 <lock_release>:
void 
lock_release(lock_t *lock){
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    

000002c3 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 2c9:	68 04 20 00 00       	push   $0x2004
 2ce:	e8 d1 03 00 00       	call   6a4 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 2d3:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 2d6:	83 c4 10             	add    $0x10,%esp
 2d9:	eb 03                	jmp    2de <thread_create+0x1b>
      stack += 1;
 2db:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 2de:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 2e4:	75 f5                	jne    2db <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 2e6:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 2e9:	52                   	push   %edx
 2ea:	ff 75 10             	push   0x10(%ebp)
 2ed:	ff 75 0c             	push   0xc(%ebp)
 2f0:	ff 75 08             	push   0x8(%ebp)
 2f3:	e8 d1 00 00 00       	call   3c9 <clone>
 
    return pid;
}
 2f8:	c9                   	leave  
 2f9:	c3                   	ret    

000002fa <thread_join>:
int 
thread_join(){
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	53                   	push   %ebx
 2fe:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 301:	8d 45 f4             	lea    -0xc(%ebp),%eax
 304:	50                   	push   %eax
 305:	e8 c7 00 00 00       	call   3d1 <join>
 30a:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 30c:	83 c4 04             	add    $0x4,%esp
 30f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 312:	ff 70 fc             	push   -0x4(%eax)
 315:	e8 ca 02 00 00       	call   5e4 <free>
  return pid;
 31a:	89 d8                	mov    %ebx,%eax
 31c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 321:	b8 01 00 00 00       	mov    $0x1,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <exit>:
SYSCALL(exit)
 329:	b8 02 00 00 00       	mov    $0x2,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <wait>:
SYSCALL(wait)
 331:	b8 03 00 00 00       	mov    $0x3,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <pipe>:
SYSCALL(pipe)
 339:	b8 04 00 00 00       	mov    $0x4,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <read>:
SYSCALL(read)
 341:	b8 05 00 00 00       	mov    $0x5,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <write>:
SYSCALL(write)
 349:	b8 10 00 00 00       	mov    $0x10,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <close>:
SYSCALL(close)
 351:	b8 15 00 00 00       	mov    $0x15,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <kill>:
SYSCALL(kill)
 359:	b8 06 00 00 00       	mov    $0x6,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <exec>:
SYSCALL(exec)
 361:	b8 07 00 00 00       	mov    $0x7,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <open>:
SYSCALL(open)
 369:	b8 0f 00 00 00       	mov    $0xf,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <mknod>:
SYSCALL(mknod)
 371:	b8 11 00 00 00       	mov    $0x11,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <unlink>:
SYSCALL(unlink)
 379:	b8 12 00 00 00       	mov    $0x12,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <fstat>:
SYSCALL(fstat)
 381:	b8 08 00 00 00       	mov    $0x8,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <link>:
SYSCALL(link)
 389:	b8 13 00 00 00       	mov    $0x13,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <mkdir>:
SYSCALL(mkdir)
 391:	b8 14 00 00 00       	mov    $0x14,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <chdir>:
SYSCALL(chdir)
 399:	b8 09 00 00 00       	mov    $0x9,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <dup>:
SYSCALL(dup)
 3a1:	b8 0a 00 00 00       	mov    $0xa,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <getpid>:
SYSCALL(getpid)
 3a9:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <sbrk>:
SYSCALL(sbrk)
 3b1:	b8 0c 00 00 00       	mov    $0xc,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <sleep>:
SYSCALL(sleep)
 3b9:	b8 0d 00 00 00       	mov    $0xd,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <uptime>:
SYSCALL(uptime)
 3c1:	b8 0e 00 00 00       	mov    $0xe,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <clone>:
SYSCALL(clone)
 3c9:	b8 16 00 00 00       	mov    $0x16,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <join>:
SYSCALL(join)
 3d1:	b8 17 00 00 00       	mov    $0x17,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	83 ec 1c             	sub    $0x1c,%esp
 3df:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3e2:	6a 01                	push   $0x1
 3e4:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3e7:	52                   	push   %edx
 3e8:	50                   	push   %eax
 3e9:	e8 5b ff ff ff       	call   349 <write>
}
 3ee:	83 c4 10             	add    $0x10,%esp
 3f1:	c9                   	leave  
 3f2:	c3                   	ret    

000003f3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	57                   	push   %edi
 3f7:	56                   	push   %esi
 3f8:	53                   	push   %ebx
 3f9:	83 ec 2c             	sub    $0x2c,%esp
 3fc:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ff:	89 d0                	mov    %edx,%eax
 401:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 403:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 407:	0f 95 c1             	setne  %cl
 40a:	c1 ea 1f             	shr    $0x1f,%edx
 40d:	84 d1                	test   %dl,%cl
 40f:	74 44                	je     455 <printint+0x62>
    neg = 1;
    x = -xx;
 411:	f7 d8                	neg    %eax
 413:	89 c1                	mov    %eax,%ecx
    neg = 1;
 415:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 41c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 421:	89 c8                	mov    %ecx,%eax
 423:	ba 00 00 00 00       	mov    $0x0,%edx
 428:	f7 f6                	div    %esi
 42a:	89 df                	mov    %ebx,%edi
 42c:	83 c3 01             	add    $0x1,%ebx
 42f:	0f b6 92 dc 07 00 00 	movzbl 0x7dc(%edx),%edx
 436:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 43a:	89 ca                	mov    %ecx,%edx
 43c:	89 c1                	mov    %eax,%ecx
 43e:	39 d6                	cmp    %edx,%esi
 440:	76 df                	jbe    421 <printint+0x2e>
  if(neg)
 442:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 446:	74 31                	je     479 <printint+0x86>
    buf[i++] = '-';
 448:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 44d:	8d 5f 02             	lea    0x2(%edi),%ebx
 450:	8b 75 d0             	mov    -0x30(%ebp),%esi
 453:	eb 17                	jmp    46c <printint+0x79>
    x = xx;
 455:	89 c1                	mov    %eax,%ecx
  neg = 0;
 457:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 45e:	eb bc                	jmp    41c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 460:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 465:	89 f0                	mov    %esi,%eax
 467:	e8 6d ff ff ff       	call   3d9 <putc>
  while(--i >= 0)
 46c:	83 eb 01             	sub    $0x1,%ebx
 46f:	79 ef                	jns    460 <printint+0x6d>
}
 471:	83 c4 2c             	add    $0x2c,%esp
 474:	5b                   	pop    %ebx
 475:	5e                   	pop    %esi
 476:	5f                   	pop    %edi
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    
 479:	8b 75 d0             	mov    -0x30(%ebp),%esi
 47c:	eb ee                	jmp    46c <printint+0x79>

0000047e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 47e:	55                   	push   %ebp
 47f:	89 e5                	mov    %esp,%ebp
 481:	57                   	push   %edi
 482:	56                   	push   %esi
 483:	53                   	push   %ebx
 484:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 487:	8d 45 10             	lea    0x10(%ebp),%eax
 48a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 48d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 492:	bb 00 00 00 00       	mov    $0x0,%ebx
 497:	eb 14                	jmp    4ad <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 499:	89 fa                	mov    %edi,%edx
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	e8 36 ff ff ff       	call   3d9 <putc>
 4a3:	eb 05                	jmp    4aa <printf+0x2c>
      }
    } else if(state == '%'){
 4a5:	83 fe 25             	cmp    $0x25,%esi
 4a8:	74 25                	je     4cf <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4aa:	83 c3 01             	add    $0x1,%ebx
 4ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b0:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4b4:	84 c0                	test   %al,%al
 4b6:	0f 84 20 01 00 00    	je     5dc <printf+0x15e>
    c = fmt[i] & 0xff;
 4bc:	0f be f8             	movsbl %al,%edi
 4bf:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4c2:	85 f6                	test   %esi,%esi
 4c4:	75 df                	jne    4a5 <printf+0x27>
      if(c == '%'){
 4c6:	83 f8 25             	cmp    $0x25,%eax
 4c9:	75 ce                	jne    499 <printf+0x1b>
        state = '%';
 4cb:	89 c6                	mov    %eax,%esi
 4cd:	eb db                	jmp    4aa <printf+0x2c>
      if(c == 'd'){
 4cf:	83 f8 25             	cmp    $0x25,%eax
 4d2:	0f 84 cf 00 00 00    	je     5a7 <printf+0x129>
 4d8:	0f 8c dd 00 00 00    	jl     5bb <printf+0x13d>
 4de:	83 f8 78             	cmp    $0x78,%eax
 4e1:	0f 8f d4 00 00 00    	jg     5bb <printf+0x13d>
 4e7:	83 f8 63             	cmp    $0x63,%eax
 4ea:	0f 8c cb 00 00 00    	jl     5bb <printf+0x13d>
 4f0:	83 e8 63             	sub    $0x63,%eax
 4f3:	83 f8 15             	cmp    $0x15,%eax
 4f6:	0f 87 bf 00 00 00    	ja     5bb <printf+0x13d>
 4fc:	ff 24 85 84 07 00 00 	jmp    *0x784(,%eax,4)
        printint(fd, *ap, 10, 1);
 503:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 506:	8b 17                	mov    (%edi),%edx
 508:	83 ec 0c             	sub    $0xc,%esp
 50b:	6a 01                	push   $0x1
 50d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	e8 d9 fe ff ff       	call   3f3 <printint>
        ap++;
 51a:	83 c7 04             	add    $0x4,%edi
 51d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 520:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 523:	be 00 00 00 00       	mov    $0x0,%esi
 528:	eb 80                	jmp    4aa <printf+0x2c>
        printint(fd, *ap, 16, 0);
 52a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 52d:	8b 17                	mov    (%edi),%edx
 52f:	83 ec 0c             	sub    $0xc,%esp
 532:	6a 00                	push   $0x0
 534:	b9 10 00 00 00       	mov    $0x10,%ecx
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	e8 b2 fe ff ff       	call   3f3 <printint>
        ap++;
 541:	83 c7 04             	add    $0x4,%edi
 544:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 547:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54a:	be 00 00 00 00       	mov    $0x0,%esi
 54f:	e9 56 ff ff ff       	jmp    4aa <printf+0x2c>
        s = (char*)*ap;
 554:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 557:	8b 30                	mov    (%eax),%esi
        ap++;
 559:	83 c0 04             	add    $0x4,%eax
 55c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 55f:	85 f6                	test   %esi,%esi
 561:	75 15                	jne    578 <printf+0xfa>
          s = "(null)";
 563:	be 7c 07 00 00       	mov    $0x77c,%esi
 568:	eb 0e                	jmp    578 <printf+0xfa>
          putc(fd, *s);
 56a:	0f be d2             	movsbl %dl,%edx
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	e8 64 fe ff ff       	call   3d9 <putc>
          s++;
 575:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 578:	0f b6 16             	movzbl (%esi),%edx
 57b:	84 d2                	test   %dl,%dl
 57d:	75 eb                	jne    56a <printf+0xec>
      state = 0;
 57f:	be 00 00 00 00       	mov    $0x0,%esi
 584:	e9 21 ff ff ff       	jmp    4aa <printf+0x2c>
        putc(fd, *ap);
 589:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58c:	0f be 17             	movsbl (%edi),%edx
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	e8 42 fe ff ff       	call   3d9 <putc>
        ap++;
 597:	83 c7 04             	add    $0x4,%edi
 59a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 59d:	be 00 00 00 00       	mov    $0x0,%esi
 5a2:	e9 03 ff ff ff       	jmp    4aa <printf+0x2c>
        putc(fd, c);
 5a7:	89 fa                	mov    %edi,%edx
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	e8 28 fe ff ff       	call   3d9 <putc>
      state = 0;
 5b1:	be 00 00 00 00       	mov    $0x0,%esi
 5b6:	e9 ef fe ff ff       	jmp    4aa <printf+0x2c>
        putc(fd, '%');
 5bb:	ba 25 00 00 00       	mov    $0x25,%edx
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	e8 11 fe ff ff       	call   3d9 <putc>
        putc(fd, c);
 5c8:	89 fa                	mov    %edi,%edx
 5ca:	8b 45 08             	mov    0x8(%ebp),%eax
 5cd:	e8 07 fe ff ff       	call   3d9 <putc>
      state = 0;
 5d2:	be 00 00 00 00       	mov    $0x0,%esi
 5d7:	e9 ce fe ff ff       	jmp    4aa <printf+0x2c>
    }
  }
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    

000005e4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	57                   	push   %edi
 5e8:	56                   	push   %esi
 5e9:	53                   	push   %ebx
 5ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ed:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f0:	a1 50 0b 00 00       	mov    0xb50,%eax
 5f5:	eb 02                	jmp    5f9 <free+0x15>
 5f7:	89 d0                	mov    %edx,%eax
 5f9:	39 c8                	cmp    %ecx,%eax
 5fb:	73 04                	jae    601 <free+0x1d>
 5fd:	39 08                	cmp    %ecx,(%eax)
 5ff:	77 12                	ja     613 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 601:	8b 10                	mov    (%eax),%edx
 603:	39 c2                	cmp    %eax,%edx
 605:	77 f0                	ja     5f7 <free+0x13>
 607:	39 c8                	cmp    %ecx,%eax
 609:	72 08                	jb     613 <free+0x2f>
 60b:	39 ca                	cmp    %ecx,%edx
 60d:	77 04                	ja     613 <free+0x2f>
 60f:	89 d0                	mov    %edx,%eax
 611:	eb e6                	jmp    5f9 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 613:	8b 73 fc             	mov    -0x4(%ebx),%esi
 616:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 619:	8b 10                	mov    (%eax),%edx
 61b:	39 d7                	cmp    %edx,%edi
 61d:	74 19                	je     638 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 61f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 622:	8b 50 04             	mov    0x4(%eax),%edx
 625:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 628:	39 ce                	cmp    %ecx,%esi
 62a:	74 1b                	je     647 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 62c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 62e:	a3 50 0b 00 00       	mov    %eax,0xb50
}
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 638:	03 72 04             	add    0x4(%edx),%esi
 63b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 63e:	8b 10                	mov    (%eax),%edx
 640:	8b 12                	mov    (%edx),%edx
 642:	89 53 f8             	mov    %edx,-0x8(%ebx)
 645:	eb db                	jmp    622 <free+0x3e>
    p->s.size += bp->s.size;
 647:	03 53 fc             	add    -0x4(%ebx),%edx
 64a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 64d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 650:	89 10                	mov    %edx,(%eax)
 652:	eb da                	jmp    62e <free+0x4a>

00000654 <morecore>:

static Header*
morecore(uint nu)
{
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	53                   	push   %ebx
 658:	83 ec 04             	sub    $0x4,%esp
 65b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 65d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 662:	77 05                	ja     669 <morecore+0x15>
    nu = 4096;
 664:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 669:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	50                   	push   %eax
 674:	e8 38 fd ff ff       	call   3b1 <sbrk>
  if(p == (char*)-1)
 679:	83 c4 10             	add    $0x10,%esp
 67c:	83 f8 ff             	cmp    $0xffffffff,%eax
 67f:	74 1c                	je     69d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 681:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 684:	83 c0 08             	add    $0x8,%eax
 687:	83 ec 0c             	sub    $0xc,%esp
 68a:	50                   	push   %eax
 68b:	e8 54 ff ff ff       	call   5e4 <free>
  return freep;
 690:	a1 50 0b 00 00       	mov    0xb50,%eax
 695:	83 c4 10             	add    $0x10,%esp
}
 698:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 69b:	c9                   	leave  
 69c:	c3                   	ret    
    return 0;
 69d:	b8 00 00 00 00       	mov    $0x0,%eax
 6a2:	eb f4                	jmp    698 <morecore+0x44>

000006a4 <malloc>:

void*
malloc(uint nbytes)
{
 6a4:	55                   	push   %ebp
 6a5:	89 e5                	mov    %esp,%ebp
 6a7:	53                   	push   %ebx
 6a8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	8d 58 07             	lea    0x7(%eax),%ebx
 6b1:	c1 eb 03             	shr    $0x3,%ebx
 6b4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6b7:	8b 0d 50 0b 00 00    	mov    0xb50,%ecx
 6bd:	85 c9                	test   %ecx,%ecx
 6bf:	74 04                	je     6c5 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c1:	8b 01                	mov    (%ecx),%eax
 6c3:	eb 4a                	jmp    70f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6c5:	c7 05 50 0b 00 00 54 	movl   $0xb54,0xb50
 6cc:	0b 00 00 
 6cf:	c7 05 54 0b 00 00 54 	movl   $0xb54,0xb54
 6d6:	0b 00 00 
    base.s.size = 0;
 6d9:	c7 05 58 0b 00 00 00 	movl   $0x0,0xb58
 6e0:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6e3:	b9 54 0b 00 00       	mov    $0xb54,%ecx
 6e8:	eb d7                	jmp    6c1 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6ea:	74 19                	je     705 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6ec:	29 da                	sub    %ebx,%edx
 6ee:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6f1:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6f4:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6f7:	89 0d 50 0b 00 00    	mov    %ecx,0xb50
      return (void*)(p + 1);
 6fd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 700:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 703:	c9                   	leave  
 704:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 705:	8b 10                	mov    (%eax),%edx
 707:	89 11                	mov    %edx,(%ecx)
 709:	eb ec                	jmp    6f7 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 70b:	89 c1                	mov    %eax,%ecx
 70d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 70f:	8b 50 04             	mov    0x4(%eax),%edx
 712:	39 da                	cmp    %ebx,%edx
 714:	73 d4                	jae    6ea <malloc+0x46>
    if(p == freep)
 716:	39 05 50 0b 00 00    	cmp    %eax,0xb50
 71c:	75 ed                	jne    70b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 71e:	89 d8                	mov    %ebx,%eax
 720:	e8 2f ff ff ff       	call   654 <morecore>
 725:	85 c0                	test   %eax,%eax
 727:	75 e2                	jne    70b <malloc+0x67>
 729:	eb d5                	jmp    700 <malloc+0x5c>
