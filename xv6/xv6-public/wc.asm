
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  10:	be 00 00 00 00       	mov    $0x0,%esi
  15:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  23:	83 ec 04             	sub    $0x4,%esp
  26:	68 00 02 00 00       	push   $0x200
  2b:	68 00 0c 00 00       	push   $0xc00
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 8f 03 00 00       	call   3c7 <read>
  38:	89 c7                	mov    %eax,%edi
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	7e 54                	jle    95 <wc+0x95>
    for(i=0; i<n; i++){
  41:	bb 00 00 00 00       	mov    $0x0,%ebx
  46:	eb 22                	jmp    6a <wc+0x6a>
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	0f be c0             	movsbl %al,%eax
  4e:	50                   	push   %eax
  4f:	68 b4 07 00 00       	push   $0x7b4
  54:	e8 86 01 00 00       	call   1df <strchr>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	85 c0                	test   %eax,%eax
  5e:	74 22                	je     82 <wc+0x82>
        inword = 0;
  60:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  67:	83 c3 01             	add    $0x1,%ebx
  6a:	39 fb                	cmp    %edi,%ebx
  6c:	7d b5                	jge    23 <wc+0x23>
      c++;
  6e:	83 c6 01             	add    $0x1,%esi
      if(buf[i] == '\n')
  71:	0f b6 83 00 0c 00 00 	movzbl 0xc00(%ebx),%eax
  78:	3c 0a                	cmp    $0xa,%al
  7a:	75 cc                	jne    48 <wc+0x48>
        l++;
  7c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  80:	eb c6                	jmp    48 <wc+0x48>
      else if(!inword){
  82:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  86:	75 df                	jne    67 <wc+0x67>
        w++;
  88:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
  8c:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  93:	eb d2                	jmp    67 <wc+0x67>
      }
    }
  }
  if(n < 0){
  95:	78 24                	js     bb <wc+0xbb>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  97:	83 ec 08             	sub    $0x8,%esp
  9a:	ff 75 0c             	push   0xc(%ebp)
  9d:	56                   	push   %esi
  9e:	ff 75 dc             	push   -0x24(%ebp)
  a1:	ff 75 e0             	push   -0x20(%ebp)
  a4:	68 ca 07 00 00       	push   $0x7ca
  a9:	6a 01                	push   $0x1
  ab:	e8 54 04 00 00       	call   504 <printf>
}
  b0:	83 c4 20             	add    $0x20,%esp
  b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  b6:	5b                   	pop    %ebx
  b7:	5e                   	pop    %esi
  b8:	5f                   	pop    %edi
  b9:	5d                   	pop    %ebp
  ba:	c3                   	ret    
    printf(1, "wc: read error\n");
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 ba 07 00 00       	push   $0x7ba
  c3:	6a 01                	push   $0x1
  c5:	e8 3a 04 00 00       	call   504 <printf>
    exit();
  ca:	e8 e0 02 00 00       	call   3af <exit>

000000cf <main>:

int
main(int argc, char *argv[])
{
  cf:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  d3:	83 e4 f0             	and    $0xfffffff0,%esp
  d6:	ff 71 fc             	push   -0x4(%ecx)
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	57                   	push   %edi
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	51                   	push   %ecx
  e0:	83 ec 18             	sub    $0x18,%esp
  e3:	8b 01                	mov    (%ecx),%eax
  e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e8:	8b 51 04             	mov    0x4(%ecx),%edx
  eb:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  ee:	83 f8 01             	cmp    $0x1,%eax
  f1:	7e 07                	jle    fa <main+0x2b>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  f3:	be 01 00 00 00       	mov    $0x1,%esi
  f8:	eb 2d                	jmp    127 <main+0x58>
    wc(0, "");
  fa:	83 ec 08             	sub    $0x8,%esp
  fd:	68 c9 07 00 00       	push   $0x7c9
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 a1 02 00 00       	call   3af <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 10e:	83 ec 08             	sub    $0x8,%esp
 111:	ff 37                	push   (%edi)
 113:	50                   	push   %eax
 114:	e8 e7 fe ff ff       	call   0 <wc>
    close(fd);
 119:	89 1c 24             	mov    %ebx,(%esp)
 11c:	e8 b6 02 00 00       	call   3d7 <close>
  for(i = 1; i < argc; i++){
 121:	83 c6 01             	add    $0x1,%esi
 124:	83 c4 10             	add    $0x10,%esp
 127:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 12a:	7d 31                	jge    15d <main+0x8e>
    if((fd = open(argv[i], 0)) < 0){
 12c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 12f:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 132:	83 ec 08             	sub    $0x8,%esp
 135:	6a 00                	push   $0x0
 137:	ff 37                	push   (%edi)
 139:	e8 b1 02 00 00       	call   3ef <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 d7 07 00 00       	push   $0x7d7
 151:	6a 01                	push   $0x1
 153:	e8 ac 03 00 00       	call   504 <printf>
      exit();
 158:	e8 52 02 00 00       	call   3af <exit>
  }
  exit();
 15d:	e8 4d 02 00 00       	call   3af <exit>

00000162 <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
 165:	56                   	push   %esi
 166:	53                   	push   %ebx
 167:	8b 75 08             	mov    0x8(%ebp),%esi
 16a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16d:	89 f0                	mov    %esi,%eax
 16f:	89 d1                	mov    %edx,%ecx
 171:	83 c2 01             	add    $0x1,%edx
 174:	89 c3                	mov    %eax,%ebx
 176:	83 c0 01             	add    $0x1,%eax
 179:	0f b6 09             	movzbl (%ecx),%ecx
 17c:	88 0b                	mov    %cl,(%ebx)
 17e:	84 c9                	test   %cl,%cl
 180:	75 ed                	jne    16f <strcpy+0xd>
    ;
  return os;
}
 182:	89 f0                	mov    %esi,%eax
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    

00000188 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 191:	eb 06                	jmp    199 <strcmp+0x11>
    p++, q++;
 193:	83 c1 01             	add    $0x1,%ecx
 196:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 199:	0f b6 01             	movzbl (%ecx),%eax
 19c:	84 c0                	test   %al,%al
 19e:	74 04                	je     1a4 <strcmp+0x1c>
 1a0:	3a 02                	cmp    (%edx),%al
 1a2:	74 ef                	je     193 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1a4:	0f b6 c0             	movzbl %al,%eax
 1a7:	0f b6 12             	movzbl (%edx),%edx
 1aa:	29 d0                	sub    %edx,%eax
}
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    

000001ae <strlen>:

uint
strlen(const char *s)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b4:	b8 00 00 00 00       	mov    $0x0,%eax
 1b9:	eb 03                	jmp    1be <strlen+0x10>
 1bb:	83 c0 01             	add    $0x1,%eax
 1be:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1c2:	75 f7                	jne    1bb <strlen+0xd>
    ;
  return n;
}
 1c4:	5d                   	pop    %ebp
 1c5:	c3                   	ret    

000001c6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	57                   	push   %edi
 1ca:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	fc                   	cld    
 1d6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d8:	89 d0                	mov    %edx,%eax
 1da:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <strchr>:

char*
strchr(const char *s, char c)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1e9:	eb 03                	jmp    1ee <strchr+0xf>
 1eb:	83 c0 01             	add    $0x1,%eax
 1ee:	0f b6 10             	movzbl (%eax),%edx
 1f1:	84 d2                	test   %dl,%dl
 1f3:	74 06                	je     1fb <strchr+0x1c>
    if(*s == c)
 1f5:	38 ca                	cmp    %cl,%dl
 1f7:	75 f2                	jne    1eb <strchr+0xc>
 1f9:	eb 05                	jmp    200 <strchr+0x21>
      return (char*)s;
  return 0;
 1fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 200:	5d                   	pop    %ebp
 201:	c3                   	ret    

00000202 <gets>:

char*
gets(char *buf, int max)
{
 202:	55                   	push   %ebp
 203:	89 e5                	mov    %esp,%ebp
 205:	57                   	push   %edi
 206:	56                   	push   %esi
 207:	53                   	push   %ebx
 208:	83 ec 1c             	sub    $0x1c,%esp
 20b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20e:	bb 00 00 00 00       	mov    $0x0,%ebx
 213:	89 de                	mov    %ebx,%esi
 215:	83 c3 01             	add    $0x1,%ebx
 218:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21b:	7d 2e                	jge    24b <gets+0x49>
    cc = read(0, &c, 1);
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	6a 01                	push   $0x1
 222:	8d 45 e7             	lea    -0x19(%ebp),%eax
 225:	50                   	push   %eax
 226:	6a 00                	push   $0x0
 228:	e8 9a 01 00 00       	call   3c7 <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 17                	jle    24b <gets+0x49>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 23b:	3c 0a                	cmp    $0xa,%al
 23d:	0f 94 c2             	sete   %dl
 240:	3c 0d                	cmp    $0xd,%al
 242:	0f 94 c0             	sete   %al
 245:	08 c2                	or     %al,%dl
 247:	74 ca                	je     213 <gets+0x11>
    buf[i++] = c;
 249:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 24b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 24f:	89 f8                	mov    %edi,%eax
 251:	8d 65 f4             	lea    -0xc(%ebp),%esp
 254:	5b                   	pop    %ebx
 255:	5e                   	pop    %esi
 256:	5f                   	pop    %edi
 257:	5d                   	pop    %ebp
 258:	c3                   	ret    

00000259 <stat>:

int
stat(const char *n, struct stat *st)
{
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	56                   	push   %esi
 25d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 25e:	83 ec 08             	sub    $0x8,%esp
 261:	6a 00                	push   $0x0
 263:	ff 75 08             	push   0x8(%ebp)
 266:	e8 84 01 00 00       	call   3ef <open>
  if(fd < 0)
 26b:	83 c4 10             	add    $0x10,%esp
 26e:	85 c0                	test   %eax,%eax
 270:	78 24                	js     296 <stat+0x3d>
 272:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 274:	83 ec 08             	sub    $0x8,%esp
 277:	ff 75 0c             	push   0xc(%ebp)
 27a:	50                   	push   %eax
 27b:	e8 87 01 00 00       	call   407 <fstat>
 280:	89 c6                	mov    %eax,%esi
  close(fd);
 282:	89 1c 24             	mov    %ebx,(%esp)
 285:	e8 4d 01 00 00       	call   3d7 <close>
  return r;
 28a:	83 c4 10             	add    $0x10,%esp
}
 28d:	89 f0                	mov    %esi,%eax
 28f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 292:	5b                   	pop    %ebx
 293:	5e                   	pop    %esi
 294:	5d                   	pop    %ebp
 295:	c3                   	ret    
    return -1;
 296:	be ff ff ff ff       	mov    $0xffffffff,%esi
 29b:	eb f0                	jmp    28d <stat+0x34>

0000029d <atoi>:

int
atoi(const char *s)
{
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	53                   	push   %ebx
 2a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2a4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a9:	eb 10                	jmp    2bb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2ab:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2ae:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2b1:	83 c1 01             	add    $0x1,%ecx
 2b4:	0f be c0             	movsbl %al,%eax
 2b7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2bb:	0f b6 01             	movzbl (%ecx),%eax
 2be:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c1:	80 fb 09             	cmp    $0x9,%bl
 2c4:	76 e5                	jbe    2ab <atoi+0xe>
  return n;
}
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	8b 75 08             	mov    0x8(%ebp),%esi
 2d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d8:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2db:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2dd:	eb 0d                	jmp    2ec <memmove+0x1f>
    *dst++ = *src++;
 2df:	0f b6 01             	movzbl (%ecx),%eax
 2e2:	88 02                	mov    %al,(%edx)
 2e4:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2ea:	89 d8                	mov    %ebx,%eax
 2ec:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2ef:	85 c0                	test   %eax,%eax
 2f1:	7f ec                	jg     2df <memmove+0x12>
  return vdst;
}
 2f3:	89 f0                	mov    %esi,%eax
 2f5:	5b                   	pop    %ebx
 2f6:	5e                   	pop    %esi
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    

000002f9 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 2f9:	55                   	push   %ebp
 2fa:	89 e5                	mov    %esp,%ebp
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 2ff:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 301:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 304:	89 08                	mov    %ecx,(%eax)
  return old;
}
 306:	89 d0                	mov    %edx,%eax
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <lock_init>:
void 
lock_init(lock_t *lock){
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
 310:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    

00000318 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	53                   	push   %ebx
 31c:	83 ec 04             	sub    $0x4,%esp
 31f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 322:	83 ec 08             	sub    $0x8,%esp
 325:	6a 01                	push   $0x1
 327:	53                   	push   %ebx
 328:	e8 cc ff ff ff       	call   2f9 <TestAndSet>
 32d:	83 c4 10             	add    $0x10,%esp
 330:	83 f8 01             	cmp    $0x1,%eax
 333:	74 ed                	je     322 <lock_acquire+0xa>
    ;
}
 335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 338:	c9                   	leave  
 339:	c3                   	ret    

0000033a <lock_release>:
void 
lock_release(lock_t *lock){
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
 340:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    

00000348 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 34e:	68 04 20 00 00       	push   $0x2004
 353:	e8 d2 03 00 00       	call   72a <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 358:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 35b:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 35d:	eb 03                	jmp    362 <thread_create+0x1a>
      stack += 1;
 35f:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 362:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 368:	75 f5                	jne    35f <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 36a:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 36c:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 36f:	52                   	push   %edx
 370:	ff 75 10             	push   0x10(%ebp)
 373:	ff 75 0c             	push   0xc(%ebp)
 376:	ff 75 08             	push   0x8(%ebp)
 379:	e8 d1 00 00 00       	call   44f <clone>
 
    return pid;
}
 37e:	c9                   	leave  
 37f:	c3                   	ret    

00000380 <thread_join>:
int 
thread_join(){
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 387:	8d 45 f4             	lea    -0xc(%ebp),%eax
 38a:	50                   	push   %eax
 38b:	e8 c7 00 00 00       	call   457 <join>
 390:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 392:	83 c4 04             	add    $0x4,%esp
 395:	8b 45 f4             	mov    -0xc(%ebp),%eax
 398:	ff 70 fc             	push   -0x4(%eax)
 39b:	e8 ca 02 00 00       	call   66a <free>
  return waitedForPID;
 3a0:	89 d8                	mov    %ebx,%eax
 3a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a5:	c9                   	leave  
 3a6:	c3                   	ret    

000003a7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a7:	b8 01 00 00 00       	mov    $0x1,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <exit>:
SYSCALL(exit)
 3af:	b8 02 00 00 00       	mov    $0x2,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <wait>:
SYSCALL(wait)
 3b7:	b8 03 00 00 00       	mov    $0x3,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <pipe>:
SYSCALL(pipe)
 3bf:	b8 04 00 00 00       	mov    $0x4,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <read>:
SYSCALL(read)
 3c7:	b8 05 00 00 00       	mov    $0x5,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <write>:
SYSCALL(write)
 3cf:	b8 10 00 00 00       	mov    $0x10,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <close>:
SYSCALL(close)
 3d7:	b8 15 00 00 00       	mov    $0x15,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <kill>:
SYSCALL(kill)
 3df:	b8 06 00 00 00       	mov    $0x6,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <exec>:
SYSCALL(exec)
 3e7:	b8 07 00 00 00       	mov    $0x7,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <open>:
SYSCALL(open)
 3ef:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <mknod>:
SYSCALL(mknod)
 3f7:	b8 11 00 00 00       	mov    $0x11,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <unlink>:
SYSCALL(unlink)
 3ff:	b8 12 00 00 00       	mov    $0x12,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <fstat>:
SYSCALL(fstat)
 407:	b8 08 00 00 00       	mov    $0x8,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <link>:
SYSCALL(link)
 40f:	b8 13 00 00 00       	mov    $0x13,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <mkdir>:
SYSCALL(mkdir)
 417:	b8 14 00 00 00       	mov    $0x14,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <chdir>:
SYSCALL(chdir)
 41f:	b8 09 00 00 00       	mov    $0x9,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <dup>:
SYSCALL(dup)
 427:	b8 0a 00 00 00       	mov    $0xa,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <getpid>:
SYSCALL(getpid)
 42f:	b8 0b 00 00 00       	mov    $0xb,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <sbrk>:
SYSCALL(sbrk)
 437:	b8 0c 00 00 00       	mov    $0xc,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <sleep>:
SYSCALL(sleep)
 43f:	b8 0d 00 00 00       	mov    $0xd,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <uptime>:
SYSCALL(uptime)
 447:	b8 0e 00 00 00       	mov    $0xe,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <clone>:
SYSCALL(clone)
 44f:	b8 16 00 00 00       	mov    $0x16,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <join>:
SYSCALL(join)
 457:	b8 17 00 00 00       	mov    $0x17,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 45f:	55                   	push   %ebp
 460:	89 e5                	mov    %esp,%ebp
 462:	83 ec 1c             	sub    $0x1c,%esp
 465:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 468:	6a 01                	push   $0x1
 46a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 46d:	52                   	push   %edx
 46e:	50                   	push   %eax
 46f:	e8 5b ff ff ff       	call   3cf <write>
}
 474:	83 c4 10             	add    $0x10,%esp
 477:	c9                   	leave  
 478:	c3                   	ret    

00000479 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	57                   	push   %edi
 47d:	56                   	push   %esi
 47e:	53                   	push   %ebx
 47f:	83 ec 2c             	sub    $0x2c,%esp
 482:	89 45 d0             	mov    %eax,-0x30(%ebp)
 485:	89 d0                	mov    %edx,%eax
 487:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 489:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 48d:	0f 95 c1             	setne  %cl
 490:	c1 ea 1f             	shr    $0x1f,%edx
 493:	84 d1                	test   %dl,%cl
 495:	74 44                	je     4db <printint+0x62>
    neg = 1;
    x = -xx;
 497:	f7 d8                	neg    %eax
 499:	89 c1                	mov    %eax,%ecx
    neg = 1;
 49b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4a2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4a7:	89 c8                	mov    %ecx,%eax
 4a9:	ba 00 00 00 00       	mov    $0x0,%edx
 4ae:	f7 f6                	div    %esi
 4b0:	89 df                	mov    %ebx,%edi
 4b2:	83 c3 01             	add    $0x1,%ebx
 4b5:	0f b6 92 4c 08 00 00 	movzbl 0x84c(%edx),%edx
 4bc:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4c0:	89 ca                	mov    %ecx,%edx
 4c2:	89 c1                	mov    %eax,%ecx
 4c4:	39 d6                	cmp    %edx,%esi
 4c6:	76 df                	jbe    4a7 <printint+0x2e>
  if(neg)
 4c8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4cc:	74 31                	je     4ff <printint+0x86>
    buf[i++] = '-';
 4ce:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4d3:	8d 5f 02             	lea    0x2(%edi),%ebx
 4d6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4d9:	eb 17                	jmp    4f2 <printint+0x79>
    x = xx;
 4db:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4dd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4e4:	eb bc                	jmp    4a2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4e6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4eb:	89 f0                	mov    %esi,%eax
 4ed:	e8 6d ff ff ff       	call   45f <putc>
  while(--i >= 0)
 4f2:	83 eb 01             	sub    $0x1,%ebx
 4f5:	79 ef                	jns    4e6 <printint+0x6d>
}
 4f7:	83 c4 2c             	add    $0x2c,%esp
 4fa:	5b                   	pop    %ebx
 4fb:	5e                   	pop    %esi
 4fc:	5f                   	pop    %edi
 4fd:	5d                   	pop    %ebp
 4fe:	c3                   	ret    
 4ff:	8b 75 d0             	mov    -0x30(%ebp),%esi
 502:	eb ee                	jmp    4f2 <printint+0x79>

00000504 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	57                   	push   %edi
 508:	56                   	push   %esi
 509:	53                   	push   %ebx
 50a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 50d:	8d 45 10             	lea    0x10(%ebp),%eax
 510:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 513:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 518:	bb 00 00 00 00       	mov    $0x0,%ebx
 51d:	eb 14                	jmp    533 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 51f:	89 fa                	mov    %edi,%edx
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	e8 36 ff ff ff       	call   45f <putc>
 529:	eb 05                	jmp    530 <printf+0x2c>
      }
    } else if(state == '%'){
 52b:	83 fe 25             	cmp    $0x25,%esi
 52e:	74 25                	je     555 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 530:	83 c3 01             	add    $0x1,%ebx
 533:	8b 45 0c             	mov    0xc(%ebp),%eax
 536:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 53a:	84 c0                	test   %al,%al
 53c:	0f 84 20 01 00 00    	je     662 <printf+0x15e>
    c = fmt[i] & 0xff;
 542:	0f be f8             	movsbl %al,%edi
 545:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 548:	85 f6                	test   %esi,%esi
 54a:	75 df                	jne    52b <printf+0x27>
      if(c == '%'){
 54c:	83 f8 25             	cmp    $0x25,%eax
 54f:	75 ce                	jne    51f <printf+0x1b>
        state = '%';
 551:	89 c6                	mov    %eax,%esi
 553:	eb db                	jmp    530 <printf+0x2c>
      if(c == 'd'){
 555:	83 f8 25             	cmp    $0x25,%eax
 558:	0f 84 cf 00 00 00    	je     62d <printf+0x129>
 55e:	0f 8c dd 00 00 00    	jl     641 <printf+0x13d>
 564:	83 f8 78             	cmp    $0x78,%eax
 567:	0f 8f d4 00 00 00    	jg     641 <printf+0x13d>
 56d:	83 f8 63             	cmp    $0x63,%eax
 570:	0f 8c cb 00 00 00    	jl     641 <printf+0x13d>
 576:	83 e8 63             	sub    $0x63,%eax
 579:	83 f8 15             	cmp    $0x15,%eax
 57c:	0f 87 bf 00 00 00    	ja     641 <printf+0x13d>
 582:	ff 24 85 f4 07 00 00 	jmp    *0x7f4(,%eax,4)
        printint(fd, *ap, 10, 1);
 589:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58c:	8b 17                	mov    (%edi),%edx
 58e:	83 ec 0c             	sub    $0xc,%esp
 591:	6a 01                	push   $0x1
 593:	b9 0a 00 00 00       	mov    $0xa,%ecx
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	e8 d9 fe ff ff       	call   479 <printint>
        ap++;
 5a0:	83 c7 04             	add    $0x4,%edi
 5a3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a9:	be 00 00 00 00       	mov    $0x0,%esi
 5ae:	eb 80                	jmp    530 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5b3:	8b 17                	mov    (%edi),%edx
 5b5:	83 ec 0c             	sub    $0xc,%esp
 5b8:	6a 00                	push   $0x0
 5ba:	b9 10 00 00 00       	mov    $0x10,%ecx
 5bf:	8b 45 08             	mov    0x8(%ebp),%eax
 5c2:	e8 b2 fe ff ff       	call   479 <printint>
        ap++;
 5c7:	83 c7 04             	add    $0x4,%edi
 5ca:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5cd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5d0:	be 00 00 00 00       	mov    $0x0,%esi
 5d5:	e9 56 ff ff ff       	jmp    530 <printf+0x2c>
        s = (char*)*ap;
 5da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5dd:	8b 30                	mov    (%eax),%esi
        ap++;
 5df:	83 c0 04             	add    $0x4,%eax
 5e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5e5:	85 f6                	test   %esi,%esi
 5e7:	75 15                	jne    5fe <printf+0xfa>
          s = "(null)";
 5e9:	be eb 07 00 00       	mov    $0x7eb,%esi
 5ee:	eb 0e                	jmp    5fe <printf+0xfa>
          putc(fd, *s);
 5f0:	0f be d2             	movsbl %dl,%edx
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	e8 64 fe ff ff       	call   45f <putc>
          s++;
 5fb:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5fe:	0f b6 16             	movzbl (%esi),%edx
 601:	84 d2                	test   %dl,%dl
 603:	75 eb                	jne    5f0 <printf+0xec>
      state = 0;
 605:	be 00 00 00 00       	mov    $0x0,%esi
 60a:	e9 21 ff ff ff       	jmp    530 <printf+0x2c>
        putc(fd, *ap);
 60f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 612:	0f be 17             	movsbl (%edi),%edx
 615:	8b 45 08             	mov    0x8(%ebp),%eax
 618:	e8 42 fe ff ff       	call   45f <putc>
        ap++;
 61d:	83 c7 04             	add    $0x4,%edi
 620:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 623:	be 00 00 00 00       	mov    $0x0,%esi
 628:	e9 03 ff ff ff       	jmp    530 <printf+0x2c>
        putc(fd, c);
 62d:	89 fa                	mov    %edi,%edx
 62f:	8b 45 08             	mov    0x8(%ebp),%eax
 632:	e8 28 fe ff ff       	call   45f <putc>
      state = 0;
 637:	be 00 00 00 00       	mov    $0x0,%esi
 63c:	e9 ef fe ff ff       	jmp    530 <printf+0x2c>
        putc(fd, '%');
 641:	ba 25 00 00 00       	mov    $0x25,%edx
 646:	8b 45 08             	mov    0x8(%ebp),%eax
 649:	e8 11 fe ff ff       	call   45f <putc>
        putc(fd, c);
 64e:	89 fa                	mov    %edi,%edx
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	e8 07 fe ff ff       	call   45f <putc>
      state = 0;
 658:	be 00 00 00 00       	mov    $0x0,%esi
 65d:	e9 ce fe ff ff       	jmp    530 <printf+0x2c>
    }
  }
}
 662:	8d 65 f4             	lea    -0xc(%ebp),%esp
 665:	5b                   	pop    %ebx
 666:	5e                   	pop    %esi
 667:	5f                   	pop    %edi
 668:	5d                   	pop    %ebp
 669:	c3                   	ret    

0000066a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 66a:	55                   	push   %ebp
 66b:	89 e5                	mov    %esp,%ebp
 66d:	57                   	push   %edi
 66e:	56                   	push   %esi
 66f:	53                   	push   %ebx
 670:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 673:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 676:	a1 00 0e 00 00       	mov    0xe00,%eax
 67b:	eb 02                	jmp    67f <free+0x15>
 67d:	89 d0                	mov    %edx,%eax
 67f:	39 c8                	cmp    %ecx,%eax
 681:	73 04                	jae    687 <free+0x1d>
 683:	39 08                	cmp    %ecx,(%eax)
 685:	77 12                	ja     699 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 687:	8b 10                	mov    (%eax),%edx
 689:	39 c2                	cmp    %eax,%edx
 68b:	77 f0                	ja     67d <free+0x13>
 68d:	39 c8                	cmp    %ecx,%eax
 68f:	72 08                	jb     699 <free+0x2f>
 691:	39 ca                	cmp    %ecx,%edx
 693:	77 04                	ja     699 <free+0x2f>
 695:	89 d0                	mov    %edx,%eax
 697:	eb e6                	jmp    67f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 699:	8b 73 fc             	mov    -0x4(%ebx),%esi
 69c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69f:	8b 10                	mov    (%eax),%edx
 6a1:	39 d7                	cmp    %edx,%edi
 6a3:	74 19                	je     6be <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6a5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6a8:	8b 50 04             	mov    0x4(%eax),%edx
 6ab:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ae:	39 ce                	cmp    %ecx,%esi
 6b0:	74 1b                	je     6cd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6b2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6b4:	a3 00 0e 00 00       	mov    %eax,0xe00
}
 6b9:	5b                   	pop    %ebx
 6ba:	5e                   	pop    %esi
 6bb:	5f                   	pop    %edi
 6bc:	5d                   	pop    %ebp
 6bd:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6be:	03 72 04             	add    0x4(%edx),%esi
 6c1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c4:	8b 10                	mov    (%eax),%edx
 6c6:	8b 12                	mov    (%edx),%edx
 6c8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6cb:	eb db                	jmp    6a8 <free+0x3e>
    p->s.size += bp->s.size;
 6cd:	03 53 fc             	add    -0x4(%ebx),%edx
 6d0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d6:	89 10                	mov    %edx,(%eax)
 6d8:	eb da                	jmp    6b4 <free+0x4a>

000006da <morecore>:

static Header*
morecore(uint nu)
{
 6da:	55                   	push   %ebp
 6db:	89 e5                	mov    %esp,%ebp
 6dd:	53                   	push   %ebx
 6de:	83 ec 04             	sub    $0x4,%esp
 6e1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6e3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6e8:	77 05                	ja     6ef <morecore+0x15>
    nu = 4096;
 6ea:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6ef:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6f6:	83 ec 0c             	sub    $0xc,%esp
 6f9:	50                   	push   %eax
 6fa:	e8 38 fd ff ff       	call   437 <sbrk>
  if(p == (char*)-1)
 6ff:	83 c4 10             	add    $0x10,%esp
 702:	83 f8 ff             	cmp    $0xffffffff,%eax
 705:	74 1c                	je     723 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 707:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 70a:	83 c0 08             	add    $0x8,%eax
 70d:	83 ec 0c             	sub    $0xc,%esp
 710:	50                   	push   %eax
 711:	e8 54 ff ff ff       	call   66a <free>
  return freep;
 716:	a1 00 0e 00 00       	mov    0xe00,%eax
 71b:	83 c4 10             	add    $0x10,%esp
}
 71e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 721:	c9                   	leave  
 722:	c3                   	ret    
    return 0;
 723:	b8 00 00 00 00       	mov    $0x0,%eax
 728:	eb f4                	jmp    71e <morecore+0x44>

0000072a <malloc>:

void*
malloc(uint nbytes)
{
 72a:	55                   	push   %ebp
 72b:	89 e5                	mov    %esp,%ebp
 72d:	53                   	push   %ebx
 72e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	8d 58 07             	lea    0x7(%eax),%ebx
 737:	c1 eb 03             	shr    $0x3,%ebx
 73a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 73d:	8b 0d 00 0e 00 00    	mov    0xe00,%ecx
 743:	85 c9                	test   %ecx,%ecx
 745:	74 04                	je     74b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 747:	8b 01                	mov    (%ecx),%eax
 749:	eb 4a                	jmp    795 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 74b:	c7 05 00 0e 00 00 04 	movl   $0xe04,0xe00
 752:	0e 00 00 
 755:	c7 05 04 0e 00 00 04 	movl   $0xe04,0xe04
 75c:	0e 00 00 
    base.s.size = 0;
 75f:	c7 05 08 0e 00 00 00 	movl   $0x0,0xe08
 766:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 769:	b9 04 0e 00 00       	mov    $0xe04,%ecx
 76e:	eb d7                	jmp    747 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 770:	74 19                	je     78b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 772:	29 da                	sub    %ebx,%edx
 774:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 777:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 77a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 77d:	89 0d 00 0e 00 00    	mov    %ecx,0xe00
      return (void*)(p + 1);
 783:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 786:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 789:	c9                   	leave  
 78a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 78b:	8b 10                	mov    (%eax),%edx
 78d:	89 11                	mov    %edx,(%ecx)
 78f:	eb ec                	jmp    77d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 791:	89 c1                	mov    %eax,%ecx
 793:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	39 da                	cmp    %ebx,%edx
 79a:	73 d4                	jae    770 <malloc+0x46>
    if(p == freep)
 79c:	39 05 00 0e 00 00    	cmp    %eax,0xe00
 7a2:	75 ed                	jne    791 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7a4:	89 d8                	mov    %ebx,%eax
 7a6:	e8 2f ff ff ff       	call   6da <morecore>
 7ab:	85 c0                	test   %eax,%eax
 7ad:	75 e2                	jne    791 <malloc+0x67>
 7af:	eb d5                	jmp    786 <malloc+0x5c>
