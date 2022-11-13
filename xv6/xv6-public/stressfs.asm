
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
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	push   -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2b:	68 d8 08 00 00       	push   $0x8d8
  30:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  39:	74 72 65 
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 65 05 00 00       	call   5b0 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 a5 01 00 00       	call   200 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 df 03 00 00       	call   442 <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  7c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  81:	68 eb 08 00 00       	push   $0x8eb
  86:	6a 01                	push   $0x1
  88:	e8 23 05 00 00       	call   5b0 <printf>
  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  8f:	5f                   	pop    %edi
  path[8] += i;
  90:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 e2 03 00 00       	call   48a <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 ab 03 00 00       	call   46a <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 a2 03 00 00       	call   472 <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 f5 08 00 00       	push   $0x8f5
  d7:	6a 01                	push   $0x1
  d9:	e8 d2 04 00 00       	call   5b0 <printf>

  fd = open(path, O_RDONLY);
  de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e4:	59                   	pop    %ecx
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	bb 14 00 00 00       	mov    $0x14,%ebx
  ed:	50                   	push   %eax
  ee:	e8 97 03 00 00       	call   48a <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
  f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 53 03 00 00       	call   462 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 52 03 00 00       	call   472 <close>

  wait();
 120:	e8 2d 03 00 00       	call   452 <wait>

  exit();
 125:	e8 20 03 00 00       	call   44a <exit>
  path[8] += i;
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
typedef struct __lock_t {
  int flag;
} lock_t;
char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 c0                	xor    %eax,%eax
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	89 c8                	mov    %ecx,%eax
 163:	c9                   	leave  
 164:	c3                   	ret    
 165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	75 17                	jne    198 <strcmp+0x28>
 181:	eb 3a                	jmp    1bd <strcmp+0x4d>
 183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 187:	90                   	nop
 188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 18c:	83 c2 01             	add    $0x1,%edx
 18f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 192:	84 c0                	test   %al,%al
 194:	74 1a                	je     1b0 <strcmp+0x40>
    p++, q++;
 196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 198:	0f b6 19             	movzbl (%ecx),%ebx
 19b:	38 c3                	cmp    %al,%bl
 19d:	74 e9                	je     188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 19f:	29 d8                	sub    %ebx,%eax
}
 1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1b4:	31 c0                	xor    %eax,%eax
 1b6:	29 d8                	sub    %ebx,%eax
}
 1b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	31 c0                	xor    %eax,%eax
 1c2:	eb db                	jmp    19f <strcmp+0x2f>
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 3a 00             	cmpb   $0x0,(%edx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 c0                	xor    %eax,%eax
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c0 01             	add    $0x1,%eax
 1e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1e7:	89 c1                	mov    %eax,%ecx
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	89 c8                	mov    %ecx,%eax
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	8b 7d fc             	mov    -0x4(%ebp),%edi
 215:	89 d0                	mov    %edx,%eax
 217:	c9                   	leave  
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 12                	jne    243 <strchr+0x23>
 231:	eb 1d                	jmp    250 <strchr+0x30>
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 23c:	83 c0 01             	add    $0x1,%eax
 23f:	84 d2                	test   %dl,%dl
 241:	74 0d                	je     250 <strchr+0x30>
    if(*s == c)
 243:	38 d1                	cmp    %dl,%cl
 245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 269:	31 db                	xor    %ebx,%ebx
{
 26b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 26e:	eb 27                	jmp    297 <gets+0x37>
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	57                   	push   %edi
 276:	6a 00                	push   $0x0
 278:	e8 e5 01 00 00       	call   462 <read>
    if(cc < 1)
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 28f:	3c 0a                	cmp    $0xa,%al
 291:	74 1d                	je     2b0 <gets+0x50>
 293:	3c 0d                	cmp    $0xd,%al
 295:	74 19                	je     2b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5f                   	pop    %edi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    
  buf[i] = '\0';
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 de                	mov    %ebx,%esi
 2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 a8 01 00 00       	call   48a <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	push   0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 ab 01 00 00       	call   4a2 <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 71 01 00 00       	call   472 <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 02             	movsbl (%edx),%eax
 32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 32d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 335:	77 1e                	ja     355 <atoi+0x35>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	89 c8                	mov    %ecx,%eax
 35a:	c9                   	leave  
 35b:	c3                   	ret    
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8b 55 08             	mov    0x8(%ebp),%edx
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 c0                	test   %eax,%eax
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 d0                	add    %edx,%eax
  dst = vdst;
 374:	89 d7                	mov    %edx,%edi
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop

00000390 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
  *oldpointer = new;
 396:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *oldpointer;
 399:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 39b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 39d:	5d                   	pop    %ebp
 39e:	89 d0                	mov    %edx,%eax
 3a0:	c3                   	ret    
 3a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3af:	90                   	nop

000003b0 <lock_init>:
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 3bc:	5d                   	pop    %ebp
 3bd:	c3                   	ret    
 3be:	66 90                	xchg   %ax,%ax

000003c0 <lock_acquire>:
void 
lock_init(lock_t *lock){
  lock->flag = 0;
}
void 
lock_acquire(lock_t *lock){
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
  while(TestAndSet(&lock->flag, 1)==1)
 3c6:	83 38 01             	cmpl   $0x1,(%eax)
 3c9:	75 05                	jne    3d0 <lock_acquire+0x10>
 3cb:	eb fe                	jmp    3cb <lock_acquire+0xb>
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 3d6:	5d                   	pop    %ebp
 3d7:	c3                   	ret    
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <lock_release>:
void 
lock_release(lock_t *lock){
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
  lock->flag =0;
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    stack = malloc(PGSIZE);
 3f6:	68 00 10 00 00       	push   $0x1000
 3fb:	e8 e0 03 00 00       	call   7e0 <malloc>
    return clone(start_routine, arg1, arg2, stack);
 400:	50                   	push   %eax
 401:	ff 75 10             	push   0x10(%ebp)
 404:	ff 75 0c             	push   0xc(%ebp)
 407:	ff 75 08             	push   0x8(%ebp)
 40a:	e8 db 00 00 00       	call   4ea <clone>
}
 40f:	c9                   	leave  
 410:	c3                   	ret    
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <thread_join>:
int 
thread_join(){
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
  void *stack;
  int waitedForPID = join(&stack);
 424:	8d 45 f4             	lea    -0xc(%ebp),%eax
thread_join(){
 427:	83 ec 20             	sub    $0x20,%esp
  int waitedForPID = join(&stack);
 42a:	50                   	push   %eax
 42b:	e8 c2 00 00 00       	call   4f2 <join>
 430:	89 c3                	mov    %eax,%ebx
  free(stack);
 432:	58                   	pop    %eax
 433:	ff 75 f4             	push   -0xc(%ebp)
 436:	e8 15 03 00 00       	call   750 <free>
  return waitedForPID;
 43b:	89 d8                	mov    %ebx,%eax
 43d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 440:	c9                   	leave  
 441:	c3                   	ret    

00000442 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 442:	b8 01 00 00 00       	mov    $0x1,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <exit>:
SYSCALL(exit)
 44a:	b8 02 00 00 00       	mov    $0x2,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <wait>:
SYSCALL(wait)
 452:	b8 03 00 00 00       	mov    $0x3,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <pipe>:
SYSCALL(pipe)
 45a:	b8 04 00 00 00       	mov    $0x4,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <read>:
SYSCALL(read)
 462:	b8 05 00 00 00       	mov    $0x5,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <write>:
SYSCALL(write)
 46a:	b8 10 00 00 00       	mov    $0x10,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <close>:
SYSCALL(close)
 472:	b8 15 00 00 00       	mov    $0x15,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <kill>:
SYSCALL(kill)
 47a:	b8 06 00 00 00       	mov    $0x6,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <exec>:
SYSCALL(exec)
 482:	b8 07 00 00 00       	mov    $0x7,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <open>:
SYSCALL(open)
 48a:	b8 0f 00 00 00       	mov    $0xf,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <mknod>:
SYSCALL(mknod)
 492:	b8 11 00 00 00       	mov    $0x11,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <unlink>:
SYSCALL(unlink)
 49a:	b8 12 00 00 00       	mov    $0x12,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <fstat>:
SYSCALL(fstat)
 4a2:	b8 08 00 00 00       	mov    $0x8,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <link>:
SYSCALL(link)
 4aa:	b8 13 00 00 00       	mov    $0x13,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <mkdir>:
SYSCALL(mkdir)
 4b2:	b8 14 00 00 00       	mov    $0x14,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <chdir>:
SYSCALL(chdir)
 4ba:	b8 09 00 00 00       	mov    $0x9,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <dup>:
SYSCALL(dup)
 4c2:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <getpid>:
SYSCALL(getpid)
 4ca:	b8 0b 00 00 00       	mov    $0xb,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <sbrk>:
SYSCALL(sbrk)
 4d2:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <sleep>:
SYSCALL(sleep)
 4da:	b8 0d 00 00 00       	mov    $0xd,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <uptime>:
SYSCALL(uptime)
 4e2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <clone>:
SYSCALL(clone)
 4ea:	b8 16 00 00 00       	mov    $0x16,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <join>:
SYSCALL(join)
 4f2:	b8 17 00 00 00       	mov    $0x17,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    
 4fa:	66 90                	xchg   %ax,%ax
 4fc:	66 90                	xchg   %ax,%ax
 4fe:	66 90                	xchg   %ax,%ax

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 3c             	sub    $0x3c,%esp
 509:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 50c:	89 d1                	mov    %edx,%ecx
{
 50e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 511:	85 d2                	test   %edx,%edx
 513:	0f 89 7f 00 00 00    	jns    598 <printint+0x98>
 519:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51d:	74 79                	je     598 <printint+0x98>
    neg = 1;
 51f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 526:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 528:	31 db                	xor    %ebx,%ebx
 52a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 c8                	mov    %ecx,%eax
 532:	31 d2                	xor    %edx,%edx
 534:	89 cf                	mov    %ecx,%edi
 536:	f7 75 c4             	divl   -0x3c(%ebp)
 539:	0f b6 92 5c 09 00 00 	movzbl 0x95c(%edx),%edx
 540:	89 45 c0             	mov    %eax,-0x40(%ebp)
 543:	89 d8                	mov    %ebx,%eax
 545:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 548:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 54b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 54e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 551:	76 dd                	jbe    530 <printint+0x30>
  if(neg)
 553:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 556:	85 c9                	test   %ecx,%ecx
 558:	74 0c                	je     566 <printint+0x66>
    buf[i++] = '-';
 55a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 55f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 561:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 566:	8b 7d b8             	mov    -0x48(%ebp),%edi
 569:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 56d:	eb 07                	jmp    576 <printint+0x76>
 56f:	90                   	nop
    putc(fd, buf[i]);
 570:	0f b6 13             	movzbl (%ebx),%edx
 573:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 576:	83 ec 04             	sub    $0x4,%esp
 579:	88 55 d7             	mov    %dl,-0x29(%ebp)
 57c:	6a 01                	push   $0x1
 57e:	56                   	push   %esi
 57f:	57                   	push   %edi
 580:	e8 e5 fe ff ff       	call   46a <write>
  while(--i >= 0)
 585:	83 c4 10             	add    $0x10,%esp
 588:	39 de                	cmp    %ebx,%esi
 58a:	75 e4                	jne    570 <printint+0x70>
}
 58c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5f                   	pop    %edi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 598:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 59f:	eb 87                	jmp    528 <printint+0x28>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5bf:	0f b6 13             	movzbl (%ebx),%edx
 5c2:	84 d2                	test   %dl,%dl
 5c4:	74 6a                	je     630 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5c6:	8d 45 10             	lea    0x10(%ebp),%eax
 5c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d4:	eb 36                	jmp    60c <printf+0x5c>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
 5e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	74 15                	je     602 <printf+0x52>
  write(fd, &c, 1);
 5ed:	83 ec 04             	sub    $0x4,%esp
 5f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	56                   	push   %esi
 5f7:	e8 6e fe ff ff       	call   46a <write>
 5fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 602:	0f b6 13             	movzbl (%ebx),%edx
 605:	83 c3 01             	add    $0x1,%ebx
 608:	84 d2                	test   %dl,%dl
 60a:	74 24                	je     630 <printf+0x80>
    c = fmt[i] & 0xff;
 60c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 60f:	85 c9                	test   %ecx,%ecx
 611:	74 cd                	je     5e0 <printf+0x30>
      }
    } else if(state == '%'){
 613:	83 f9 25             	cmp    $0x25,%ecx
 616:	75 ea                	jne    602 <printf+0x52>
      if(c == 'd'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	0f 84 07 01 00 00    	je     728 <printf+0x178>
 621:	83 e8 63             	sub    $0x63,%eax
 624:	83 f8 15             	cmp    $0x15,%eax
 627:	77 17                	ja     640 <printf+0x90>
 629:	ff 24 85 04 09 00 00 	jmp    *0x904(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 630:	8d 65 f4             	lea    -0xc(%ebp),%esp
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
 643:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 646:	6a 01                	push   $0x1
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 64e:	e8 17 fe ff ff       	call   46a <write>
        putc(fd, c);
 653:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 657:	83 c4 0c             	add    $0xc,%esp
 65a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 65d:	6a 01                	push   $0x1
 65f:	57                   	push   %edi
 660:	56                   	push   %esi
 661:	e8 04 fe ff ff       	call   46a <write>
        putc(fd, c);
 666:	83 c4 10             	add    $0x10,%esp
      state = 0;
 669:	31 c9                	xor    %ecx,%ecx
 66b:	eb 95                	jmp    602 <printf+0x52>
 66d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	b9 10 00 00 00       	mov    $0x10,%ecx
 678:	6a 00                	push   $0x0
 67a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 67d:	8b 10                	mov    (%eax),%edx
 67f:	89 f0                	mov    %esi,%eax
 681:	e8 7a fe ff ff       	call   500 <printint>
        ap++;
 686:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 68a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68d:	31 c9                	xor    %ecx,%ecx
 68f:	e9 6e ff ff ff       	jmp    602 <printf+0x52>
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 698:	8b 45 d0             	mov    -0x30(%ebp),%eax
 69b:	8b 10                	mov    (%eax),%edx
        ap++;
 69d:	83 c0 04             	add    $0x4,%eax
 6a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6a3:	85 d2                	test   %edx,%edx
 6a5:	0f 84 8d 00 00 00    	je     738 <printf+0x188>
        while(*s != 0){
 6ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6b0:	84 c0                	test   %al,%al
 6b2:	0f 84 4a ff ff ff    	je     602 <printf+0x52>
 6b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6bb:	89 d3                	mov    %edx,%ebx
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6c3:	83 c3 01             	add    $0x1,%ebx
 6c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6c9:	6a 01                	push   $0x1
 6cb:	57                   	push   %edi
 6cc:	56                   	push   %esi
 6cd:	e8 98 fd ff ff       	call   46a <write>
        while(*s != 0){
 6d2:	0f b6 03             	movzbl (%ebx),%eax
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	84 c0                	test   %al,%al
 6da:	75 e4                	jne    6c0 <printf+0x110>
      state = 0;
 6dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6df:	31 c9                	xor    %ecx,%ecx
 6e1:	e9 1c ff ff ff       	jmp    602 <printf+0x52>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6f0:	83 ec 0c             	sub    $0xc,%esp
 6f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f8:	6a 01                	push   $0x1
 6fa:	e9 7b ff ff ff       	jmp    67a <printf+0xca>
 6ff:	90                   	nop
        putc(fd, *ap);
 700:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 706:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 708:	6a 01                	push   $0x1
 70a:	57                   	push   %edi
 70b:	56                   	push   %esi
        putc(fd, *ap);
 70c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 70f:	e8 56 fd ff ff       	call   46a <write>
        ap++;
 714:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 718:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71b:	31 c9                	xor    %ecx,%ecx
 71d:	e9 e0 fe ff ff       	jmp    602 <printf+0x52>
 722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 728:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 72b:	83 ec 04             	sub    $0x4,%esp
 72e:	e9 2a ff ff ff       	jmp    65d <printf+0xad>
 733:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 737:	90                   	nop
          s = "(null)";
 738:	ba fb 08 00 00       	mov    $0x8fb,%edx
        while(*s != 0){
 73d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 740:	b8 28 00 00 00       	mov    $0x28,%eax
 745:	89 d3                	mov    %edx,%ebx
 747:	e9 74 ff ff ff       	jmp    6c0 <printf+0x110>
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 d8 0c 00 00       	mov    0xcd8,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 768:	89 c2                	mov    %eax,%edx
 76a:	8b 00                	mov    (%eax),%eax
 76c:	39 ca                	cmp    %ecx,%edx
 76e:	73 30                	jae    7a0 <free+0x50>
 770:	39 c1                	cmp    %eax,%ecx
 772:	72 04                	jb     778 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	39 c2                	cmp    %eax,%edx
 776:	72 f0                	jb     768 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77e:	39 f8                	cmp    %edi,%eax
 780:	74 30                	je     7b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 782:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 785:	8b 42 04             	mov    0x4(%edx),%eax
 788:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 78b:	39 f1                	cmp    %esi,%ecx
 78d:	74 3a                	je     7c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 78f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 791:	5b                   	pop    %ebx
  freep = p;
 792:	89 15 d8 0c 00 00    	mov    %edx,0xcd8
}
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 c2                	cmp    %eax,%edx
 7a2:	72 c4                	jb     768 <free+0x18>
 7a4:	39 c1                	cmp    %eax,%ecx
 7a6:	73 c0                	jae    768 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 f8                	cmp    %edi,%eax
 7b0:	75 d0                	jne    782 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7b2:	03 70 04             	add    0x4(%eax),%esi
 7b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b8:	8b 02                	mov    (%edx),%eax
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bf:	8b 42 04             	mov    0x4(%edx),%eax
 7c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7c5:	39 f1                	cmp    %esi,%ecx
 7c7:	75 c6                	jne    78f <free+0x3f>
    p->s.size += bp->s.size;
 7c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7cc:	89 15 d8 0c 00 00    	mov    %edx,0xcd8
    p->s.size += bp->s.size;
 7d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7d8:	89 0a                	mov    %ecx,(%edx)
}
 7da:	5b                   	pop    %ebx
 7db:	5e                   	pop    %esi
 7dc:	5f                   	pop    %edi
 7dd:	5d                   	pop    %ebp
 7de:	c3                   	ret    
 7df:	90                   	nop

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ec:	8b 3d d8 0c 00 00    	mov    0xcd8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f2:	8d 70 07             	lea    0x7(%eax),%esi
 7f5:	c1 ee 03             	shr    $0x3,%esi
 7f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7fb:	85 ff                	test   %edi,%edi
 7fd:	0f 84 9d 00 00 00    	je     8a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 803:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 805:	8b 4a 04             	mov    0x4(%edx),%ecx
 808:	39 f1                	cmp    %esi,%ecx
 80a:	73 6a                	jae    876 <malloc+0x96>
 80c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 811:	39 de                	cmp    %ebx,%esi
 813:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 816:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 81d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 820:	eb 17                	jmp    839 <malloc+0x59>
 822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 828:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 82a:	8b 48 04             	mov    0x4(%eax),%ecx
 82d:	39 f1                	cmp    %esi,%ecx
 82f:	73 4f                	jae    880 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 831:	8b 3d d8 0c 00 00    	mov    0xcd8,%edi
 837:	89 c2                	mov    %eax,%edx
 839:	39 d7                	cmp    %edx,%edi
 83b:	75 eb                	jne    828 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 83d:	83 ec 0c             	sub    $0xc,%esp
 840:	ff 75 e4             	push   -0x1c(%ebp)
 843:	e8 8a fc ff ff       	call   4d2 <sbrk>
  if(p == (char*)-1)
 848:	83 c4 10             	add    $0x10,%esp
 84b:	83 f8 ff             	cmp    $0xffffffff,%eax
 84e:	74 1c                	je     86c <malloc+0x8c>
  hp->s.size = nu;
 850:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	83 c0 08             	add    $0x8,%eax
 859:	50                   	push   %eax
 85a:	e8 f1 fe ff ff       	call   750 <free>
  return freep;
 85f:	8b 15 d8 0c 00 00    	mov    0xcd8,%edx
      if((p = morecore(nunits)) == 0)
 865:	83 c4 10             	add    $0x10,%esp
 868:	85 d2                	test   %edx,%edx
 86a:	75 bc                	jne    828 <malloc+0x48>
        return 0;
  }
}
 86c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 86f:	31 c0                	xor    %eax,%eax
}
 871:	5b                   	pop    %ebx
 872:	5e                   	pop    %esi
 873:	5f                   	pop    %edi
 874:	5d                   	pop    %ebp
 875:	c3                   	ret    
    if(p->s.size >= nunits){
 876:	89 d0                	mov    %edx,%eax
 878:	89 fa                	mov    %edi,%edx
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 880:	39 ce                	cmp    %ecx,%esi
 882:	74 4c                	je     8d0 <malloc+0xf0>
        p->s.size -= nunits;
 884:	29 f1                	sub    %esi,%ecx
 886:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 889:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 88c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 88f:	89 15 d8 0c 00 00    	mov    %edx,0xcd8
}
 895:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 898:	83 c0 08             	add    $0x8,%eax
}
 89b:	5b                   	pop    %ebx
 89c:	5e                   	pop    %esi
 89d:	5f                   	pop    %edi
 89e:	5d                   	pop    %ebp
 89f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 d8 0c 00 00 dc 	movl   $0xcdc,0xcd8
 8a7:	0c 00 00 
    base.s.size = 0;
 8aa:	bf dc 0c 00 00       	mov    $0xcdc,%edi
    base.s.ptr = freep = prevp = &base;
 8af:	c7 05 dc 0c 00 00 dc 	movl   $0xcdc,0xcdc
 8b6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8bb:	c7 05 e0 0c 00 00 00 	movl   $0x0,0xce0
 8c2:	00 00 00 
    if(p->s.size >= nunits){
 8c5:	e9 42 ff ff ff       	jmp    80c <malloc+0x2c>
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb b9                	jmp    88f <malloc+0xaf>
