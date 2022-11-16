
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
  33:	e8 8e 03 00 00       	call   3c6 <read>
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
  4f:	68 b0 07 00 00       	push   $0x7b0
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
  a4:	68 c6 07 00 00       	push   $0x7c6
  a9:	6a 01                	push   $0x1
  ab:	e8 53 04 00 00       	call   503 <printf>
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
  be:	68 b6 07 00 00       	push   $0x7b6
  c3:	6a 01                	push   $0x1
  c5:	e8 39 04 00 00       	call   503 <printf>
    exit();
  ca:	e8 df 02 00 00       	call   3ae <exit>

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
  fd:	68 c5 07 00 00       	push   $0x7c5
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 a0 02 00 00       	call   3ae <exit>
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
 11c:	e8 b5 02 00 00       	call   3d6 <close>
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
 139:	e8 b0 02 00 00       	call   3ee <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 d3 07 00 00       	push   $0x7d3
 151:	6a 01                	push   $0x1
 153:	e8 ab 03 00 00       	call   503 <printf>
      exit();
 158:	e8 51 02 00 00       	call   3ae <exit>
  }
  exit();
 15d:	e8 4c 02 00 00       	call   3ae <exit>

00000162 <strcpy>:
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
 228:	e8 99 01 00 00       	call   3c6 <read>
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
 266:	e8 83 01 00 00       	call   3ee <open>
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
 27b:	e8 86 01 00 00       	call   406 <fstat>
 280:	89 c6                	mov    %eax,%esi
  close(fd);
 282:	89 1c 24             	mov    %ebx,(%esp)
 285:	e8 4c 01 00 00       	call   3d6 <close>
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
 353:	e8 d1 03 00 00       	call   729 <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 358:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 35b:	83 c4 10             	add    $0x10,%esp
 35e:	eb 03                	jmp    363 <thread_create+0x1b>
      stack += 1;
 360:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 363:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 369:	75 f5                	jne    360 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 36b:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 36e:	52                   	push   %edx
 36f:	ff 75 10             	push   0x10(%ebp)
 372:	ff 75 0c             	push   0xc(%ebp)
 375:	ff 75 08             	push   0x8(%ebp)
 378:	e8 d1 00 00 00       	call   44e <clone>
 
    return pid;
}
 37d:	c9                   	leave  
 37e:	c3                   	ret    

0000037f <thread_join>:
int 
thread_join(){
 37f:	55                   	push   %ebp
 380:	89 e5                	mov    %esp,%ebp
 382:	53                   	push   %ebx
 383:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 386:	8d 45 f4             	lea    -0xc(%ebp),%eax
 389:	50                   	push   %eax
 38a:	e8 c7 00 00 00       	call   456 <join>
 38f:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 391:	83 c4 04             	add    $0x4,%esp
 394:	8b 45 f4             	mov    -0xc(%ebp),%eax
 397:	ff 70 fc             	push   -0x4(%eax)
 39a:	e8 ca 02 00 00       	call   669 <free>
  return pid;
 39f:	89 d8                	mov    %ebx,%eax
 3a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a4:	c9                   	leave  
 3a5:	c3                   	ret    

000003a6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a6:	b8 01 00 00 00       	mov    $0x1,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <exit>:
SYSCALL(exit)
 3ae:	b8 02 00 00 00       	mov    $0x2,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <wait>:
SYSCALL(wait)
 3b6:	b8 03 00 00 00       	mov    $0x3,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <pipe>:
SYSCALL(pipe)
 3be:	b8 04 00 00 00       	mov    $0x4,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <read>:
SYSCALL(read)
 3c6:	b8 05 00 00 00       	mov    $0x5,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <write>:
SYSCALL(write)
 3ce:	b8 10 00 00 00       	mov    $0x10,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <close>:
SYSCALL(close)
 3d6:	b8 15 00 00 00       	mov    $0x15,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <kill>:
SYSCALL(kill)
 3de:	b8 06 00 00 00       	mov    $0x6,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <exec>:
SYSCALL(exec)
 3e6:	b8 07 00 00 00       	mov    $0x7,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <open>:
SYSCALL(open)
 3ee:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <mknod>:
SYSCALL(mknod)
 3f6:	b8 11 00 00 00       	mov    $0x11,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <unlink>:
SYSCALL(unlink)
 3fe:	b8 12 00 00 00       	mov    $0x12,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <fstat>:
SYSCALL(fstat)
 406:	b8 08 00 00 00       	mov    $0x8,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <link>:
SYSCALL(link)
 40e:	b8 13 00 00 00       	mov    $0x13,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <mkdir>:
SYSCALL(mkdir)
 416:	b8 14 00 00 00       	mov    $0x14,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <chdir>:
SYSCALL(chdir)
 41e:	b8 09 00 00 00       	mov    $0x9,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <dup>:
SYSCALL(dup)
 426:	b8 0a 00 00 00       	mov    $0xa,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <getpid>:
SYSCALL(getpid)
 42e:	b8 0b 00 00 00       	mov    $0xb,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <sbrk>:
SYSCALL(sbrk)
 436:	b8 0c 00 00 00       	mov    $0xc,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <sleep>:
SYSCALL(sleep)
 43e:	b8 0d 00 00 00       	mov    $0xd,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <uptime>:
SYSCALL(uptime)
 446:	b8 0e 00 00 00       	mov    $0xe,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <clone>:
SYSCALL(clone)
 44e:	b8 16 00 00 00       	mov    $0x16,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <join>:
SYSCALL(join)
 456:	b8 17 00 00 00       	mov    $0x17,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 45e:	55                   	push   %ebp
 45f:	89 e5                	mov    %esp,%ebp
 461:	83 ec 1c             	sub    $0x1c,%esp
 464:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 467:	6a 01                	push   $0x1
 469:	8d 55 f4             	lea    -0xc(%ebp),%edx
 46c:	52                   	push   %edx
 46d:	50                   	push   %eax
 46e:	e8 5b ff ff ff       	call   3ce <write>
}
 473:	83 c4 10             	add    $0x10,%esp
 476:	c9                   	leave  
 477:	c3                   	ret    

00000478 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	57                   	push   %edi
 47c:	56                   	push   %esi
 47d:	53                   	push   %ebx
 47e:	83 ec 2c             	sub    $0x2c,%esp
 481:	89 45 d0             	mov    %eax,-0x30(%ebp)
 484:	89 d0                	mov    %edx,%eax
 486:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 488:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 48c:	0f 95 c1             	setne  %cl
 48f:	c1 ea 1f             	shr    $0x1f,%edx
 492:	84 d1                	test   %dl,%cl
 494:	74 44                	je     4da <printint+0x62>
    neg = 1;
    x = -xx;
 496:	f7 d8                	neg    %eax
 498:	89 c1                	mov    %eax,%ecx
    neg = 1;
 49a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4a1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4a6:	89 c8                	mov    %ecx,%eax
 4a8:	ba 00 00 00 00       	mov    $0x0,%edx
 4ad:	f7 f6                	div    %esi
 4af:	89 df                	mov    %ebx,%edi
 4b1:	83 c3 01             	add    $0x1,%ebx
 4b4:	0f b6 92 48 08 00 00 	movzbl 0x848(%edx),%edx
 4bb:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4bf:	89 ca                	mov    %ecx,%edx
 4c1:	89 c1                	mov    %eax,%ecx
 4c3:	39 d6                	cmp    %edx,%esi
 4c5:	76 df                	jbe    4a6 <printint+0x2e>
  if(neg)
 4c7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4cb:	74 31                	je     4fe <printint+0x86>
    buf[i++] = '-';
 4cd:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4d2:	8d 5f 02             	lea    0x2(%edi),%ebx
 4d5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4d8:	eb 17                	jmp    4f1 <printint+0x79>
    x = xx;
 4da:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4dc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4e3:	eb bc                	jmp    4a1 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4e5:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4ea:	89 f0                	mov    %esi,%eax
 4ec:	e8 6d ff ff ff       	call   45e <putc>
  while(--i >= 0)
 4f1:	83 eb 01             	sub    $0x1,%ebx
 4f4:	79 ef                	jns    4e5 <printint+0x6d>
}
 4f6:	83 c4 2c             	add    $0x2c,%esp
 4f9:	5b                   	pop    %ebx
 4fa:	5e                   	pop    %esi
 4fb:	5f                   	pop    %edi
 4fc:	5d                   	pop    %ebp
 4fd:	c3                   	ret    
 4fe:	8b 75 d0             	mov    -0x30(%ebp),%esi
 501:	eb ee                	jmp    4f1 <printint+0x79>

00000503 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 503:	55                   	push   %ebp
 504:	89 e5                	mov    %esp,%ebp
 506:	57                   	push   %edi
 507:	56                   	push   %esi
 508:	53                   	push   %ebx
 509:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 50c:	8d 45 10             	lea    0x10(%ebp),%eax
 50f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 512:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 517:	bb 00 00 00 00       	mov    $0x0,%ebx
 51c:	eb 14                	jmp    532 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 51e:	89 fa                	mov    %edi,%edx
 520:	8b 45 08             	mov    0x8(%ebp),%eax
 523:	e8 36 ff ff ff       	call   45e <putc>
 528:	eb 05                	jmp    52f <printf+0x2c>
      }
    } else if(state == '%'){
 52a:	83 fe 25             	cmp    $0x25,%esi
 52d:	74 25                	je     554 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 52f:	83 c3 01             	add    $0x1,%ebx
 532:	8b 45 0c             	mov    0xc(%ebp),%eax
 535:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 539:	84 c0                	test   %al,%al
 53b:	0f 84 20 01 00 00    	je     661 <printf+0x15e>
    c = fmt[i] & 0xff;
 541:	0f be f8             	movsbl %al,%edi
 544:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 547:	85 f6                	test   %esi,%esi
 549:	75 df                	jne    52a <printf+0x27>
      if(c == '%'){
 54b:	83 f8 25             	cmp    $0x25,%eax
 54e:	75 ce                	jne    51e <printf+0x1b>
        state = '%';
 550:	89 c6                	mov    %eax,%esi
 552:	eb db                	jmp    52f <printf+0x2c>
      if(c == 'd'){
 554:	83 f8 25             	cmp    $0x25,%eax
 557:	0f 84 cf 00 00 00    	je     62c <printf+0x129>
 55d:	0f 8c dd 00 00 00    	jl     640 <printf+0x13d>
 563:	83 f8 78             	cmp    $0x78,%eax
 566:	0f 8f d4 00 00 00    	jg     640 <printf+0x13d>
 56c:	83 f8 63             	cmp    $0x63,%eax
 56f:	0f 8c cb 00 00 00    	jl     640 <printf+0x13d>
 575:	83 e8 63             	sub    $0x63,%eax
 578:	83 f8 15             	cmp    $0x15,%eax
 57b:	0f 87 bf 00 00 00    	ja     640 <printf+0x13d>
 581:	ff 24 85 f0 07 00 00 	jmp    *0x7f0(,%eax,4)
        printint(fd, *ap, 10, 1);
 588:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58b:	8b 17                	mov    (%edi),%edx
 58d:	83 ec 0c             	sub    $0xc,%esp
 590:	6a 01                	push   $0x1
 592:	b9 0a 00 00 00       	mov    $0xa,%ecx
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	e8 d9 fe ff ff       	call   478 <printint>
        ap++;
 59f:	83 c7 04             	add    $0x4,%edi
 5a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a5:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5a8:	be 00 00 00 00       	mov    $0x0,%esi
 5ad:	eb 80                	jmp    52f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5af:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5b2:	8b 17                	mov    (%edi),%edx
 5b4:	83 ec 0c             	sub    $0xc,%esp
 5b7:	6a 00                	push   $0x0
 5b9:	b9 10 00 00 00       	mov    $0x10,%ecx
 5be:	8b 45 08             	mov    0x8(%ebp),%eax
 5c1:	e8 b2 fe ff ff       	call   478 <printint>
        ap++;
 5c6:	83 c7 04             	add    $0x4,%edi
 5c9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5cc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5cf:	be 00 00 00 00       	mov    $0x0,%esi
 5d4:	e9 56 ff ff ff       	jmp    52f <printf+0x2c>
        s = (char*)*ap;
 5d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5dc:	8b 30                	mov    (%eax),%esi
        ap++;
 5de:	83 c0 04             	add    $0x4,%eax
 5e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5e4:	85 f6                	test   %esi,%esi
 5e6:	75 15                	jne    5fd <printf+0xfa>
          s = "(null)";
 5e8:	be e7 07 00 00       	mov    $0x7e7,%esi
 5ed:	eb 0e                	jmp    5fd <printf+0xfa>
          putc(fd, *s);
 5ef:	0f be d2             	movsbl %dl,%edx
 5f2:	8b 45 08             	mov    0x8(%ebp),%eax
 5f5:	e8 64 fe ff ff       	call   45e <putc>
          s++;
 5fa:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5fd:	0f b6 16             	movzbl (%esi),%edx
 600:	84 d2                	test   %dl,%dl
 602:	75 eb                	jne    5ef <printf+0xec>
      state = 0;
 604:	be 00 00 00 00       	mov    $0x0,%esi
 609:	e9 21 ff ff ff       	jmp    52f <printf+0x2c>
        putc(fd, *ap);
 60e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 611:	0f be 17             	movsbl (%edi),%edx
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	e8 42 fe ff ff       	call   45e <putc>
        ap++;
 61c:	83 c7 04             	add    $0x4,%edi
 61f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 622:	be 00 00 00 00       	mov    $0x0,%esi
 627:	e9 03 ff ff ff       	jmp    52f <printf+0x2c>
        putc(fd, c);
 62c:	89 fa                	mov    %edi,%edx
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	e8 28 fe ff ff       	call   45e <putc>
      state = 0;
 636:	be 00 00 00 00       	mov    $0x0,%esi
 63b:	e9 ef fe ff ff       	jmp    52f <printf+0x2c>
        putc(fd, '%');
 640:	ba 25 00 00 00       	mov    $0x25,%edx
 645:	8b 45 08             	mov    0x8(%ebp),%eax
 648:	e8 11 fe ff ff       	call   45e <putc>
        putc(fd, c);
 64d:	89 fa                	mov    %edi,%edx
 64f:	8b 45 08             	mov    0x8(%ebp),%eax
 652:	e8 07 fe ff ff       	call   45e <putc>
      state = 0;
 657:	be 00 00 00 00       	mov    $0x0,%esi
 65c:	e9 ce fe ff ff       	jmp    52f <printf+0x2c>
    }
  }
}
 661:	8d 65 f4             	lea    -0xc(%ebp),%esp
 664:	5b                   	pop    %ebx
 665:	5e                   	pop    %esi
 666:	5f                   	pop    %edi
 667:	5d                   	pop    %ebp
 668:	c3                   	ret    

00000669 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 669:	55                   	push   %ebp
 66a:	89 e5                	mov    %esp,%ebp
 66c:	57                   	push   %edi
 66d:	56                   	push   %esi
 66e:	53                   	push   %ebx
 66f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 672:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 675:	a1 00 0e 00 00       	mov    0xe00,%eax
 67a:	eb 02                	jmp    67e <free+0x15>
 67c:	89 d0                	mov    %edx,%eax
 67e:	39 c8                	cmp    %ecx,%eax
 680:	73 04                	jae    686 <free+0x1d>
 682:	39 08                	cmp    %ecx,(%eax)
 684:	77 12                	ja     698 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 686:	8b 10                	mov    (%eax),%edx
 688:	39 c2                	cmp    %eax,%edx
 68a:	77 f0                	ja     67c <free+0x13>
 68c:	39 c8                	cmp    %ecx,%eax
 68e:	72 08                	jb     698 <free+0x2f>
 690:	39 ca                	cmp    %ecx,%edx
 692:	77 04                	ja     698 <free+0x2f>
 694:	89 d0                	mov    %edx,%eax
 696:	eb e6                	jmp    67e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 698:	8b 73 fc             	mov    -0x4(%ebx),%esi
 69b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69e:	8b 10                	mov    (%eax),%edx
 6a0:	39 d7                	cmp    %edx,%edi
 6a2:	74 19                	je     6bd <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6a4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6a7:	8b 50 04             	mov    0x4(%eax),%edx
 6aa:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ad:	39 ce                	cmp    %ecx,%esi
 6af:	74 1b                	je     6cc <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6b1:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6b3:	a3 00 0e 00 00       	mov    %eax,0xe00
}
 6b8:	5b                   	pop    %ebx
 6b9:	5e                   	pop    %esi
 6ba:	5f                   	pop    %edi
 6bb:	5d                   	pop    %ebp
 6bc:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6bd:	03 72 04             	add    0x4(%edx),%esi
 6c0:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c3:	8b 10                	mov    (%eax),%edx
 6c5:	8b 12                	mov    (%edx),%edx
 6c7:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6ca:	eb db                	jmp    6a7 <free+0x3e>
    p->s.size += bp->s.size;
 6cc:	03 53 fc             	add    -0x4(%ebx),%edx
 6cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6d5:	89 10                	mov    %edx,(%eax)
 6d7:	eb da                	jmp    6b3 <free+0x4a>

000006d9 <morecore>:

static Header*
morecore(uint nu)
{
 6d9:	55                   	push   %ebp
 6da:	89 e5                	mov    %esp,%ebp
 6dc:	53                   	push   %ebx
 6dd:	83 ec 04             	sub    $0x4,%esp
 6e0:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6e2:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6e7:	77 05                	ja     6ee <morecore+0x15>
    nu = 4096;
 6e9:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6ee:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6f5:	83 ec 0c             	sub    $0xc,%esp
 6f8:	50                   	push   %eax
 6f9:	e8 38 fd ff ff       	call   436 <sbrk>
  if(p == (char*)-1)
 6fe:	83 c4 10             	add    $0x10,%esp
 701:	83 f8 ff             	cmp    $0xffffffff,%eax
 704:	74 1c                	je     722 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 706:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 709:	83 c0 08             	add    $0x8,%eax
 70c:	83 ec 0c             	sub    $0xc,%esp
 70f:	50                   	push   %eax
 710:	e8 54 ff ff ff       	call   669 <free>
  return freep;
 715:	a1 00 0e 00 00       	mov    0xe00,%eax
 71a:	83 c4 10             	add    $0x10,%esp
}
 71d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 720:	c9                   	leave  
 721:	c3                   	ret    
    return 0;
 722:	b8 00 00 00 00       	mov    $0x0,%eax
 727:	eb f4                	jmp    71d <morecore+0x44>

00000729 <malloc>:

void*
malloc(uint nbytes)
{
 729:	55                   	push   %ebp
 72a:	89 e5                	mov    %esp,%ebp
 72c:	53                   	push   %ebx
 72d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	8d 58 07             	lea    0x7(%eax),%ebx
 736:	c1 eb 03             	shr    $0x3,%ebx
 739:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 73c:	8b 0d 00 0e 00 00    	mov    0xe00,%ecx
 742:	85 c9                	test   %ecx,%ecx
 744:	74 04                	je     74a <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 746:	8b 01                	mov    (%ecx),%eax
 748:	eb 4a                	jmp    794 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 74a:	c7 05 00 0e 00 00 04 	movl   $0xe04,0xe00
 751:	0e 00 00 
 754:	c7 05 04 0e 00 00 04 	movl   $0xe04,0xe04
 75b:	0e 00 00 
    base.s.size = 0;
 75e:	c7 05 08 0e 00 00 00 	movl   $0x0,0xe08
 765:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 768:	b9 04 0e 00 00       	mov    $0xe04,%ecx
 76d:	eb d7                	jmp    746 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 76f:	74 19                	je     78a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 771:	29 da                	sub    %ebx,%edx
 773:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 776:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 779:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 77c:	89 0d 00 0e 00 00    	mov    %ecx,0xe00
      return (void*)(p + 1);
 782:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 785:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 788:	c9                   	leave  
 789:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 78a:	8b 10                	mov    (%eax),%edx
 78c:	89 11                	mov    %edx,(%ecx)
 78e:	eb ec                	jmp    77c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 790:	89 c1                	mov    %eax,%ecx
 792:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 794:	8b 50 04             	mov    0x4(%eax),%edx
 797:	39 da                	cmp    %ebx,%edx
 799:	73 d4                	jae    76f <malloc+0x46>
    if(p == freep)
 79b:	39 05 00 0e 00 00    	cmp    %eax,0xe00
 7a1:	75 ed                	jne    790 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7a3:	89 d8                	mov    %ebx,%eax
 7a5:	e8 2f ff ff ff       	call   6d9 <morecore>
 7aa:	85 c0                	test   %eax,%eax
 7ac:	75 e2                	jne    790 <malloc+0x67>
 7ae:	eb d5                	jmp    785 <malloc+0x5c>
