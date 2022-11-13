
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
  14:	68 88 08 00 00       	push   $0x888
  19:	e8 1c 04 00 00       	call   43a <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 3f 04 00 00       	call   472 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 33 04 00 00       	call   472 <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 90 08 00 00       	push   $0x890
  50:	6a 01                	push   $0x1
  52:	e8 09 05 00 00       	call   560 <printf>
    pid = fork();
  57:	e8 96 03 00 00       	call   3f2 <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 8d 03 00 00       	call   402 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 cf 08 00 00       	push   $0x8cf
  85:	6a 01                	push   $0x1
  87:	e8 d4 04 00 00       	call   560 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 a3 08 00 00       	push   $0x8a3
  98:	6a 01                	push   $0x1
  9a:	e8 c1 04 00 00       	call   560 <printf>
      exit();
  9f:	e8 56 03 00 00       	call   3fa <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 a8 0c 00 00       	push   $0xca8
  ab:	68 b6 08 00 00       	push   $0x8b6
  b0:	e8 7d 03 00 00       	call   432 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 b9 08 00 00       	push   $0x8b9
  bc:	6a 01                	push   $0x1
  be:	e8 9d 04 00 00       	call   560 <printf>
      exit();
  c3:	e8 32 03 00 00       	call   3fa <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 88 08 00 00       	push   $0x888
  d2:	e8 6b 03 00 00       	call   442 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 88 08 00 00       	push   $0x888
  e0:	e8 55 03 00 00       	call   43a <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
typedef struct __lock_t {
  int flag;
} lock_t;
char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
    p++, q++;
 146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave  
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave  
 16c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 e5 01 00 00       	call   412 <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 1d                	je     260 <gets+0x50>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 19                	je     260 <gets+0x50>
  for(i=0; i+1 < max; ){
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
  buf[i] = '\0';
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	89 de                	mov    %ebx,%esi
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	push   0x8(%ebp)
 28d:	e8 a8 01 00 00       	call   43a <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 ab 01 00 00       	call   452 <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 71 01 00 00       	call   422 <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
  *oldpointer = new;
 346:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *oldpointer;
 349:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 34b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 34d:	5d                   	pop    %ebp
 34e:	89 d0                	mov    %edx,%eax
 350:	c3                   	ret    
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <lock_init>:
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 36c:	5d                   	pop    %ebp
 36d:	c3                   	ret    
 36e:	66 90                	xchg   %ax,%ax

00000370 <lock_acquire>:
void 
lock_init(lock_t *lock){
  lock->flag = 0;
}
void 
lock_acquire(lock_t *lock){
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 45 08             	mov    0x8(%ebp),%eax
  while(TestAndSet(&lock->flag, 1)==1)
 376:	83 38 01             	cmpl   $0x1,(%eax)
 379:	75 05                	jne    380 <lock_acquire+0x10>
 37b:	eb fe                	jmp    37b <lock_acquire+0xb>
 37d:	8d 76 00             	lea    0x0(%esi),%esi
 380:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 386:	5d                   	pop    %ebp
 387:	c3                   	ret    
 388:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop

00000390 <lock_release>:
void 
lock_release(lock_t *lock){
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
  lock->flag =0;
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 39c:	5d                   	pop    %ebp
 39d:	c3                   	ret    
 39e:	66 90                	xchg   %ax,%ax

000003a0 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    stack = malloc(PGSIZE);
 3a6:	68 00 10 00 00       	push   $0x1000
 3ab:	e8 e0 03 00 00       	call   790 <malloc>
    return clone(start_routine, arg1, arg2, stack);
 3b0:	50                   	push   %eax
 3b1:	ff 75 10             	push   0x10(%ebp)
 3b4:	ff 75 0c             	push   0xc(%ebp)
 3b7:	ff 75 08             	push   0x8(%ebp)
 3ba:	e8 db 00 00 00       	call   49a <clone>
}
 3bf:	c9                   	leave  
 3c0:	c3                   	ret    
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <thread_join>:
int 
thread_join(){
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
  void *stack;
  int waitedForPID = join(&stack);
 3d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
thread_join(){
 3d7:	83 ec 20             	sub    $0x20,%esp
  int waitedForPID = join(&stack);
 3da:	50                   	push   %eax
 3db:	e8 c2 00 00 00       	call   4a2 <join>
 3e0:	89 c3                	mov    %eax,%ebx
  free(stack);
 3e2:	58                   	pop    %eax
 3e3:	ff 75 f4             	push   -0xc(%ebp)
 3e6:	e8 15 03 00 00       	call   700 <free>
  return waitedForPID;
 3eb:	89 d8                	mov    %ebx,%eax
 3ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f0:	c9                   	leave  
 3f1:	c3                   	ret    

000003f2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f2:	b8 01 00 00 00       	mov    $0x1,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <exit>:
SYSCALL(exit)
 3fa:	b8 02 00 00 00       	mov    $0x2,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <wait>:
SYSCALL(wait)
 402:	b8 03 00 00 00       	mov    $0x3,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <pipe>:
SYSCALL(pipe)
 40a:	b8 04 00 00 00       	mov    $0x4,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <read>:
SYSCALL(read)
 412:	b8 05 00 00 00       	mov    $0x5,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <write>:
SYSCALL(write)
 41a:	b8 10 00 00 00       	mov    $0x10,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <close>:
SYSCALL(close)
 422:	b8 15 00 00 00       	mov    $0x15,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <kill>:
SYSCALL(kill)
 42a:	b8 06 00 00 00       	mov    $0x6,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <exec>:
SYSCALL(exec)
 432:	b8 07 00 00 00       	mov    $0x7,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <open>:
SYSCALL(open)
 43a:	b8 0f 00 00 00       	mov    $0xf,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <mknod>:
SYSCALL(mknod)
 442:	b8 11 00 00 00       	mov    $0x11,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <unlink>:
SYSCALL(unlink)
 44a:	b8 12 00 00 00       	mov    $0x12,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <fstat>:
SYSCALL(fstat)
 452:	b8 08 00 00 00       	mov    $0x8,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <link>:
SYSCALL(link)
 45a:	b8 13 00 00 00       	mov    $0x13,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <mkdir>:
SYSCALL(mkdir)
 462:	b8 14 00 00 00       	mov    $0x14,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <chdir>:
SYSCALL(chdir)
 46a:	b8 09 00 00 00       	mov    $0x9,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <dup>:
SYSCALL(dup)
 472:	b8 0a 00 00 00       	mov    $0xa,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <getpid>:
SYSCALL(getpid)
 47a:	b8 0b 00 00 00       	mov    $0xb,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <sbrk>:
SYSCALL(sbrk)
 482:	b8 0c 00 00 00       	mov    $0xc,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <sleep>:
SYSCALL(sleep)
 48a:	b8 0d 00 00 00       	mov    $0xd,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <uptime>:
SYSCALL(uptime)
 492:	b8 0e 00 00 00       	mov    $0xe,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <clone>:
SYSCALL(clone)
 49a:	b8 16 00 00 00       	mov    $0x16,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <join>:
SYSCALL(join)
 4a2:	b8 17 00 00 00       	mov    $0x17,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    
 4aa:	66 90                	xchg   %ax,%ax
 4ac:	66 90                	xchg   %ax,%ax
 4ae:	66 90                	xchg   %ax,%ax

000004b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 3c             	sub    $0x3c,%esp
 4b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4bc:	89 d1                	mov    %edx,%ecx
{
 4be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4c1:	85 d2                	test   %edx,%edx
 4c3:	0f 89 7f 00 00 00    	jns    548 <printint+0x98>
 4c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4cd:	74 79                	je     548 <printint+0x98>
    neg = 1;
 4cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4d8:	31 db                	xor    %ebx,%ebx
 4da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4e0:	89 c8                	mov    %ecx,%eax
 4e2:	31 d2                	xor    %edx,%edx
 4e4:	89 cf                	mov    %ecx,%edi
 4e6:	f7 75 c4             	divl   -0x3c(%ebp)
 4e9:	0f b6 92 38 09 00 00 	movzbl 0x938(%edx),%edx
 4f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4f3:	89 d8                	mov    %ebx,%eax
 4f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 501:	76 dd                	jbe    4e0 <printint+0x30>
  if(neg)
 503:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 506:	85 c9                	test   %ecx,%ecx
 508:	74 0c                	je     516 <printint+0x66>
    buf[i++] = '-';
 50a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 50f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 511:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 516:	8b 7d b8             	mov    -0x48(%ebp),%edi
 519:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 51d:	eb 07                	jmp    526 <printint+0x76>
 51f:	90                   	nop
    putc(fd, buf[i]);
 520:	0f b6 13             	movzbl (%ebx),%edx
 523:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 526:	83 ec 04             	sub    $0x4,%esp
 529:	88 55 d7             	mov    %dl,-0x29(%ebp)
 52c:	6a 01                	push   $0x1
 52e:	56                   	push   %esi
 52f:	57                   	push   %edi
 530:	e8 e5 fe ff ff       	call   41a <write>
  while(--i >= 0)
 535:	83 c4 10             	add    $0x10,%esp
 538:	39 de                	cmp    %ebx,%esi
 53a:	75 e4                	jne    520 <printint+0x70>
}
 53c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53f:	5b                   	pop    %ebx
 540:	5e                   	pop    %esi
 541:	5f                   	pop    %edi
 542:	5d                   	pop    %ebp
 543:	c3                   	ret    
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 548:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 54f:	eb 87                	jmp    4d8 <printint+0x28>
 551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55f:	90                   	nop

00000560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 569:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 56c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 56f:	0f b6 13             	movzbl (%ebx),%edx
 572:	84 d2                	test   %dl,%dl
 574:	74 6a                	je     5e0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 576:	8d 45 10             	lea    0x10(%ebp),%eax
 579:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 57c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 57f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 581:	89 45 d0             	mov    %eax,-0x30(%ebp)
 584:	eb 36                	jmp    5bc <printf+0x5c>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
 590:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 593:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 598:	83 f8 25             	cmp    $0x25,%eax
 59b:	74 15                	je     5b2 <printf+0x52>
  write(fd, &c, 1);
 59d:	83 ec 04             	sub    $0x4,%esp
 5a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5a3:	6a 01                	push   $0x1
 5a5:	57                   	push   %edi
 5a6:	56                   	push   %esi
 5a7:	e8 6e fe ff ff       	call   41a <write>
 5ac:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5af:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5b2:	0f b6 13             	movzbl (%ebx),%edx
 5b5:	83 c3 01             	add    $0x1,%ebx
 5b8:	84 d2                	test   %dl,%dl
 5ba:	74 24                	je     5e0 <printf+0x80>
    c = fmt[i] & 0xff;
 5bc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5bf:	85 c9                	test   %ecx,%ecx
 5c1:	74 cd                	je     590 <printf+0x30>
      }
    } else if(state == '%'){
 5c3:	83 f9 25             	cmp    $0x25,%ecx
 5c6:	75 ea                	jne    5b2 <printf+0x52>
      if(c == 'd'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	0f 84 07 01 00 00    	je     6d8 <printf+0x178>
 5d1:	83 e8 63             	sub    $0x63,%eax
 5d4:	83 f8 15             	cmp    $0x15,%eax
 5d7:	77 17                	ja     5f0 <printf+0x90>
 5d9:	ff 24 85 e0 08 00 00 	jmp    *0x8e0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5f                   	pop    %edi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5f6:	6a 01                	push   $0x1
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5fe:	e8 17 fe ff ff       	call   41a <write>
        putc(fd, c);
 603:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 607:	83 c4 0c             	add    $0xc,%esp
 60a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 60d:	6a 01                	push   $0x1
 60f:	57                   	push   %edi
 610:	56                   	push   %esi
 611:	e8 04 fe ff ff       	call   41a <write>
        putc(fd, c);
 616:	83 c4 10             	add    $0x10,%esp
      state = 0;
 619:	31 c9                	xor    %ecx,%ecx
 61b:	eb 95                	jmp    5b2 <printf+0x52>
 61d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 10 00 00 00       	mov    $0x10,%ecx
 628:	6a 00                	push   $0x0
 62a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 62d:	8b 10                	mov    (%eax),%edx
 62f:	89 f0                	mov    %esi,%eax
 631:	e8 7a fe ff ff       	call   4b0 <printint>
        ap++;
 636:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 63a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63d:	31 c9                	xor    %ecx,%ecx
 63f:	e9 6e ff ff ff       	jmp    5b2 <printf+0x52>
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 648:	8b 45 d0             	mov    -0x30(%ebp),%eax
 64b:	8b 10                	mov    (%eax),%edx
        ap++;
 64d:	83 c0 04             	add    $0x4,%eax
 650:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 653:	85 d2                	test   %edx,%edx
 655:	0f 84 8d 00 00 00    	je     6e8 <printf+0x188>
        while(*s != 0){
 65b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 65e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 660:	84 c0                	test   %al,%al
 662:	0f 84 4a ff ff ff    	je     5b2 <printf+0x52>
 668:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 66b:	89 d3                	mov    %edx,%ebx
 66d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
          s++;
 673:	83 c3 01             	add    $0x1,%ebx
 676:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 679:	6a 01                	push   $0x1
 67b:	57                   	push   %edi
 67c:	56                   	push   %esi
 67d:	e8 98 fd ff ff       	call   41a <write>
        while(*s != 0){
 682:	0f b6 03             	movzbl (%ebx),%eax
 685:	83 c4 10             	add    $0x10,%esp
 688:	84 c0                	test   %al,%al
 68a:	75 e4                	jne    670 <printf+0x110>
      state = 0;
 68c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 68f:	31 c9                	xor    %ecx,%ecx
 691:	e9 1c ff ff ff       	jmp    5b2 <printf+0x52>
 696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6a8:	6a 01                	push   $0x1
 6aa:	e9 7b ff ff ff       	jmp    62a <printf+0xca>
 6af:	90                   	nop
        putc(fd, *ap);
 6b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6b6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6b8:	6a 01                	push   $0x1
 6ba:	57                   	push   %edi
 6bb:	56                   	push   %esi
        putc(fd, *ap);
 6bc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6bf:	e8 56 fd ff ff       	call   41a <write>
        ap++;
 6c4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6c8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6cb:	31 c9                	xor    %ecx,%ecx
 6cd:	e9 e0 fe ff ff       	jmp    5b2 <printf+0x52>
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6d8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6db:	83 ec 04             	sub    $0x4,%esp
 6de:	e9 2a ff ff ff       	jmp    60d <printf+0xad>
 6e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6e7:	90                   	nop
          s = "(null)";
 6e8:	ba d8 08 00 00       	mov    $0x8d8,%edx
        while(*s != 0){
 6ed:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6f0:	b8 28 00 00 00       	mov    $0x28,%eax
 6f5:	89 d3                	mov    %edx,%ebx
 6f7:	e9 74 ff ff ff       	jmp    670 <printf+0x110>
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 b0 0c 00 00       	mov    0xcb0,%eax
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 70e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 718:	89 c2                	mov    %eax,%edx
 71a:	8b 00                	mov    (%eax),%eax
 71c:	39 ca                	cmp    %ecx,%edx
 71e:	73 30                	jae    750 <free+0x50>
 720:	39 c1                	cmp    %eax,%ecx
 722:	72 04                	jb     728 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 724:	39 c2                	cmp    %eax,%edx
 726:	72 f0                	jb     718 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 728:	8b 73 fc             	mov    -0x4(%ebx),%esi
 72b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 72e:	39 f8                	cmp    %edi,%eax
 730:	74 30                	je     762 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 732:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 735:	8b 42 04             	mov    0x4(%edx),%eax
 738:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 73b:	39 f1                	cmp    %esi,%ecx
 73d:	74 3a                	je     779 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 73f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 741:	5b                   	pop    %ebx
  freep = p;
 742:	89 15 b0 0c 00 00    	mov    %edx,0xcb0
}
 748:	5e                   	pop    %esi
 749:	5f                   	pop    %edi
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 750:	39 c2                	cmp    %eax,%edx
 752:	72 c4                	jb     718 <free+0x18>
 754:	39 c1                	cmp    %eax,%ecx
 756:	73 c0                	jae    718 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 758:	8b 73 fc             	mov    -0x4(%ebx),%esi
 75b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75e:	39 f8                	cmp    %edi,%eax
 760:	75 d0                	jne    732 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 762:	03 70 04             	add    0x4(%eax),%esi
 765:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 768:	8b 02                	mov    (%edx),%eax
 76a:	8b 00                	mov    (%eax),%eax
 76c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 76f:	8b 42 04             	mov    0x4(%edx),%eax
 772:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 775:	39 f1                	cmp    %esi,%ecx
 777:	75 c6                	jne    73f <free+0x3f>
    p->s.size += bp->s.size;
 779:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 77c:	89 15 b0 0c 00 00    	mov    %edx,0xcb0
    p->s.size += bp->s.size;
 782:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 785:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 788:	89 0a                	mov    %ecx,(%edx)
}
 78a:	5b                   	pop    %ebx
 78b:	5e                   	pop    %esi
 78c:	5f                   	pop    %edi
 78d:	5d                   	pop    %ebp
 78e:	c3                   	ret    
 78f:	90                   	nop

00000790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 79c:	8b 3d b0 0c 00 00    	mov    0xcb0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	8d 70 07             	lea    0x7(%eax),%esi
 7a5:	c1 ee 03             	shr    $0x3,%esi
 7a8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7ab:	85 ff                	test   %edi,%edi
 7ad:	0f 84 9d 00 00 00    	je     850 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7b5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7b8:	39 f1                	cmp    %esi,%ecx
 7ba:	73 6a                	jae    826 <malloc+0x96>
 7bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7c1:	39 de                	cmp    %ebx,%esi
 7c3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7c6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7d0:	eb 17                	jmp    7e9 <malloc+0x59>
 7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7da:	8b 48 04             	mov    0x4(%eax),%ecx
 7dd:	39 f1                	cmp    %esi,%ecx
 7df:	73 4f                	jae    830 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7e1:	8b 3d b0 0c 00 00    	mov    0xcb0,%edi
 7e7:	89 c2                	mov    %eax,%edx
 7e9:	39 d7                	cmp    %edx,%edi
 7eb:	75 eb                	jne    7d8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7ed:	83 ec 0c             	sub    $0xc,%esp
 7f0:	ff 75 e4             	push   -0x1c(%ebp)
 7f3:	e8 8a fc ff ff       	call   482 <sbrk>
  if(p == (char*)-1)
 7f8:	83 c4 10             	add    $0x10,%esp
 7fb:	83 f8 ff             	cmp    $0xffffffff,%eax
 7fe:	74 1c                	je     81c <malloc+0x8c>
  hp->s.size = nu;
 800:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 803:	83 ec 0c             	sub    $0xc,%esp
 806:	83 c0 08             	add    $0x8,%eax
 809:	50                   	push   %eax
 80a:	e8 f1 fe ff ff       	call   700 <free>
  return freep;
 80f:	8b 15 b0 0c 00 00    	mov    0xcb0,%edx
      if((p = morecore(nunits)) == 0)
 815:	83 c4 10             	add    $0x10,%esp
 818:	85 d2                	test   %edx,%edx
 81a:	75 bc                	jne    7d8 <malloc+0x48>
        return 0;
  }
}
 81c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 81f:	31 c0                	xor    %eax,%eax
}
 821:	5b                   	pop    %ebx
 822:	5e                   	pop    %esi
 823:	5f                   	pop    %edi
 824:	5d                   	pop    %ebp
 825:	c3                   	ret    
    if(p->s.size >= nunits){
 826:	89 d0                	mov    %edx,%eax
 828:	89 fa                	mov    %edi,%edx
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 830:	39 ce                	cmp    %ecx,%esi
 832:	74 4c                	je     880 <malloc+0xf0>
        p->s.size -= nunits;
 834:	29 f1                	sub    %esi,%ecx
 836:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 839:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 83c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 83f:	89 15 b0 0c 00 00    	mov    %edx,0xcb0
}
 845:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 848:	83 c0 08             	add    $0x8,%eax
}
 84b:	5b                   	pop    %ebx
 84c:	5e                   	pop    %esi
 84d:	5f                   	pop    %edi
 84e:	5d                   	pop    %ebp
 84f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 850:	c7 05 b0 0c 00 00 b4 	movl   $0xcb4,0xcb0
 857:	0c 00 00 
    base.s.size = 0;
 85a:	bf b4 0c 00 00       	mov    $0xcb4,%edi
    base.s.ptr = freep = prevp = &base;
 85f:	c7 05 b4 0c 00 00 b4 	movl   $0xcb4,0xcb4
 866:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 869:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 86b:	c7 05 b8 0c 00 00 00 	movl   $0x0,0xcb8
 872:	00 00 00 
    if(p->s.size >= nunits){
 875:	e9 42 ff ff ff       	jmp    7bc <malloc+0x2c>
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 880:	8b 08                	mov    (%eax),%ecx
 882:	89 0a                	mov    %ecx,(%edx)
 884:	eb b9                	jmp    83f <malloc+0xaf>
