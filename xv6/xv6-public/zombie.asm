
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 1c 03 00 00       	call   332 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 a6 03 00 00       	call   3ca <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 0e 03 00 00       	call   33a <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
typedef struct __lock_t {
  int flag;
} lock_t;
char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 c0                	xor    %eax,%eax
{
  33:	89 e5                	mov    %esp,%ebp
  35:	53                   	push   %ebx
  36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  51:	89 c8                	mov    %ecx,%eax
  53:	c9                   	leave  
  54:	c3                   	ret    
  55:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	75 17                	jne    88 <strcmp+0x28>
  71:	eb 3a                	jmp    ad <strcmp+0x4d>
  73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  77:	90                   	nop
  78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  7c:	83 c2 01             	add    $0x1,%edx
  7f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  82:	84 c0                	test   %al,%al
  84:	74 1a                	je     a0 <strcmp+0x40>
    p++, q++;
  86:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  88:	0f b6 19             	movzbl (%ecx),%ebx
  8b:	38 c3                	cmp    %al,%bl
  8d:	74 e9                	je     78 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  8f:	29 d8                	sub    %ebx,%eax
}
  91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  94:	c9                   	leave  
  95:	c3                   	ret    
  96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  a4:	31 c0                	xor    %eax,%eax
  a6:	29 d8                	sub    %ebx,%eax
}
  a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ab:	c9                   	leave  
  ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ad:	0f b6 19             	movzbl (%ecx),%ebx
  b0:	31 c0                	xor    %eax,%eax
  b2:	eb db                	jmp    8f <strcmp+0x2f>
  b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bf:	90                   	nop

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c0 01             	add    $0x1,%eax
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	89 c1                	mov    %eax,%ecx
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	89 c8                	mov    %ecx,%eax
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld    
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	8b 7d fc             	mov    -0x4(%ebp),%edi
 105:	89 d0                	mov    %edx,%eax
 107:	c9                   	leave  
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 12                	jne    133 <strchr+0x23>
 121:	eb 1d                	jmp    140 <strchr+0x30>
 123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 127:	90                   	nop
 128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 12c:	83 c0 01             	add    $0x1,%eax
 12f:	84 d2                	test   %dl,%dl
 131:	74 0d                	je     140 <strchr+0x30>
    if(*s == c)
 133:	38 d1                	cmp    %dl,%cl
 135:	75 f1                	jne    128 <strchr+0x18>
      return (char*)s;
  return 0;
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 140:	31 c0                	xor    %eax,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 155:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 159:	31 db                	xor    %ebx,%ebx
{
 15b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 15e:	eb 27                	jmp    187 <gets+0x37>
    cc = read(0, &c, 1);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	6a 01                	push   $0x1
 165:	57                   	push   %edi
 166:	6a 00                	push   $0x0
 168:	e8 e5 01 00 00       	call   352 <read>
    if(cc < 1)
 16d:	83 c4 10             	add    $0x10,%esp
 170:	85 c0                	test   %eax,%eax
 172:	7e 1d                	jle    191 <gets+0x41>
      break;
    buf[i++] = c;
 174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 178:	8b 55 08             	mov    0x8(%ebp),%edx
 17b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 17f:	3c 0a                	cmp    $0xa,%al
 181:	74 1d                	je     1a0 <gets+0x50>
 183:	3c 0d                	cmp    $0xd,%al
 185:	74 19                	je     1a0 <gets+0x50>
  for(i=0; i+1 < max; ){
 187:	89 de                	mov    %ebx,%esi
 189:	83 c3 01             	add    $0x1,%ebx
 18c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 18f:	7c cf                	jl     160 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 191:	8b 45 08             	mov    0x8(%ebp),%eax
 194:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 198:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19b:	5b                   	pop    %ebx
 19c:	5e                   	pop    %esi
 19d:	5f                   	pop    %edi
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    
  buf[i] = '\0';
 1a0:	8b 45 08             	mov    0x8(%ebp),%eax
 1a3:	89 de                	mov    %ebx,%esi
 1a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ac:	5b                   	pop    %ebx
 1ad:	5e                   	pop    %esi
 1ae:	5f                   	pop    %edi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	push   0x8(%ebp)
 1cd:	e8 a8 01 00 00       	call   37a <open>
  if(fd < 0)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	push   0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 ab 01 00 00       	call   392 <fstat>
  close(fd);
 1e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ea:	89 c6                	mov    %eax,%esi
  close(fd);
 1ec:	e8 71 01 00 00       	call   362 <close>
  return r;
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	0f be 02             	movsbl (%edx),%eax
 21a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 21d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 220:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 225:	77 1e                	ja     245 <atoi+0x35>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 230:	83 c2 01             	add    $0x1,%edx
 233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 23a:	0f be 02             	movsbl (%edx),%eax
 23d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 248:	89 c8                	mov    %ecx,%eax
 24a:	c9                   	leave  
 24b:	c3                   	ret    
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 45 10             	mov    0x10(%ebp),%eax
 257:	8b 55 08             	mov    0x8(%ebp),%edx
 25a:	56                   	push   %esi
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 c0                	test   %eax,%eax
 260:	7e 13                	jle    275 <memmove+0x25>
 262:	01 d0                	add    %edx,%eax
  dst = vdst;
 264:	89 d7                	mov    %edx,%edi
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 271:	39 f8                	cmp    %edi,%eax
 273:	75 fb                	jne    270 <memmove+0x20>
  return vdst;
}
 275:	5e                   	pop    %esi
 276:	89 d0                	mov    %edx,%eax
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
  *oldpointer = new;
 286:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *oldpointer;
 289:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 28b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 28d:	5d                   	pop    %ebp
 28e:	89 d0                	mov    %edx,%eax
 290:	c3                   	ret    
 291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <lock_init>:
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 2ac:	5d                   	pop    %ebp
 2ad:	c3                   	ret    
 2ae:	66 90                	xchg   %ax,%ax

000002b0 <lock_acquire>:
void 
lock_init(lock_t *lock){
  lock->flag = 0;
}
void 
lock_acquire(lock_t *lock){
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
  while(TestAndSet(&lock->flag, 1)==1)
 2b6:	83 38 01             	cmpl   $0x1,(%eax)
 2b9:	75 05                	jne    2c0 <lock_acquire+0x10>
 2bb:	eb fe                	jmp    2bb <lock_acquire+0xb>
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
 2c0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <lock_release>:
void 
lock_release(lock_t *lock){
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
  lock->flag =0;
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    
 2de:	66 90                	xchg   %ax,%ax

000002e0 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    stack = malloc(PGSIZE);
 2e6:	68 00 10 00 00       	push   $0x1000
 2eb:	e8 e0 03 00 00       	call   6d0 <malloc>
    return clone(start_routine, arg1, arg2, stack);
 2f0:	50                   	push   %eax
 2f1:	ff 75 10             	push   0x10(%ebp)
 2f4:	ff 75 0c             	push   0xc(%ebp)
 2f7:	ff 75 08             	push   0x8(%ebp)
 2fa:	e8 db 00 00 00       	call   3da <clone>
}
 2ff:	c9                   	leave  
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <thread_join>:
int 
thread_join(){
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
  void *stack;
  int waitedForPID = join(&stack);
 314:	8d 45 f4             	lea    -0xc(%ebp),%eax
thread_join(){
 317:	83 ec 20             	sub    $0x20,%esp
  int waitedForPID = join(&stack);
 31a:	50                   	push   %eax
 31b:	e8 c2 00 00 00       	call   3e2 <join>
 320:	89 c3                	mov    %eax,%ebx
  free(stack);
 322:	58                   	pop    %eax
 323:	ff 75 f4             	push   -0xc(%ebp)
 326:	e8 15 03 00 00       	call   640 <free>
  return waitedForPID;
 32b:	89 d8                	mov    %ebx,%eax
 32d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 332:	b8 01 00 00 00       	mov    $0x1,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <exit>:
SYSCALL(exit)
 33a:	b8 02 00 00 00       	mov    $0x2,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <wait>:
SYSCALL(wait)
 342:	b8 03 00 00 00       	mov    $0x3,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <pipe>:
SYSCALL(pipe)
 34a:	b8 04 00 00 00       	mov    $0x4,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <read>:
SYSCALL(read)
 352:	b8 05 00 00 00       	mov    $0x5,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <write>:
SYSCALL(write)
 35a:	b8 10 00 00 00       	mov    $0x10,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <close>:
SYSCALL(close)
 362:	b8 15 00 00 00       	mov    $0x15,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <kill>:
SYSCALL(kill)
 36a:	b8 06 00 00 00       	mov    $0x6,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <exec>:
SYSCALL(exec)
 372:	b8 07 00 00 00       	mov    $0x7,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <open>:
SYSCALL(open)
 37a:	b8 0f 00 00 00       	mov    $0xf,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <mknod>:
SYSCALL(mknod)
 382:	b8 11 00 00 00       	mov    $0x11,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <unlink>:
SYSCALL(unlink)
 38a:	b8 12 00 00 00       	mov    $0x12,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <fstat>:
SYSCALL(fstat)
 392:	b8 08 00 00 00       	mov    $0x8,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <link>:
SYSCALL(link)
 39a:	b8 13 00 00 00       	mov    $0x13,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <mkdir>:
SYSCALL(mkdir)
 3a2:	b8 14 00 00 00       	mov    $0x14,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <chdir>:
SYSCALL(chdir)
 3aa:	b8 09 00 00 00       	mov    $0x9,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <dup>:
SYSCALL(dup)
 3b2:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <getpid>:
SYSCALL(getpid)
 3ba:	b8 0b 00 00 00       	mov    $0xb,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <sbrk>:
SYSCALL(sbrk)
 3c2:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <sleep>:
SYSCALL(sleep)
 3ca:	b8 0d 00 00 00       	mov    $0xd,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <uptime>:
SYSCALL(uptime)
 3d2:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <clone>:
SYSCALL(clone)
 3da:	b8 16 00 00 00       	mov    $0x16,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <join>:
SYSCALL(join)
 3e2:	b8 17 00 00 00       	mov    $0x17,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    
 3ea:	66 90                	xchg   %ax,%ax
 3ec:	66 90                	xchg   %ax,%ax
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
 3f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3fc:	89 d1                	mov    %edx,%ecx
{
 3fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 401:	85 d2                	test   %edx,%edx
 403:	0f 89 7f 00 00 00    	jns    488 <printint+0x98>
 409:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 40d:	74 79                	je     488 <printint+0x98>
    neg = 1;
 40f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 416:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 418:	31 db                	xor    %ebx,%ebx
 41a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 420:	89 c8                	mov    %ecx,%eax
 422:	31 d2                	xor    %edx,%edx
 424:	89 cf                	mov    %ecx,%edi
 426:	f7 75 c4             	divl   -0x3c(%ebp)
 429:	0f b6 92 28 08 00 00 	movzbl 0x828(%edx),%edx
 430:	89 45 c0             	mov    %eax,-0x40(%ebp)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 438:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 43b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 43e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 441:	76 dd                	jbe    420 <printint+0x30>
  if(neg)
 443:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 446:	85 c9                	test   %ecx,%ecx
 448:	74 0c                	je     456 <printint+0x66>
    buf[i++] = '-';
 44a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 44f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 451:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 456:	8b 7d b8             	mov    -0x48(%ebp),%edi
 459:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 45d:	eb 07                	jmp    466 <printint+0x76>
 45f:	90                   	nop
    putc(fd, buf[i]);
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	57                   	push   %edi
 470:	e8 e5 fe ff ff       	call   35a <write>
  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 de                	cmp    %ebx,%esi
 47a:	75 e4                	jne    460 <printint+0x70>
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 488:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 48f:	eb 87                	jmp    418 <printint+0x28>
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4af:	0f b6 13             	movzbl (%ebx),%edx
 4b2:	84 d2                	test   %dl,%dl
 4b4:	74 6a                	je     520 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4b6:	8d 45 10             	lea    0x10(%ebp),%eax
 4b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c4:	eb 36                	jmp    4fc <printf+0x5c>
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
 4d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 15                	je     4f2 <printf+0x52>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e3:	6a 01                	push   $0x1
 4e5:	57                   	push   %edi
 4e6:	56                   	push   %esi
 4e7:	e8 6e fe ff ff       	call   35a <write>
 4ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4f2:	0f b6 13             	movzbl (%ebx),%edx
 4f5:	83 c3 01             	add    $0x1,%ebx
 4f8:	84 d2                	test   %dl,%dl
 4fa:	74 24                	je     520 <printf+0x80>
    c = fmt[i] & 0xff;
 4fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4ff:	85 c9                	test   %ecx,%ecx
 501:	74 cd                	je     4d0 <printf+0x30>
      }
    } else if(state == '%'){
 503:	83 f9 25             	cmp    $0x25,%ecx
 506:	75 ea                	jne    4f2 <printf+0x52>
      if(c == 'd'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 07 01 00 00    	je     618 <printf+0x178>
 511:	83 e8 63             	sub    $0x63,%eax
 514:	83 f8 15             	cmp    $0x15,%eax
 517:	77 17                	ja     530 <printf+0x90>
 519:	ff 24 85 d0 07 00 00 	jmp    *0x7d0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 520:	8d 65 f4             	lea    -0xc(%ebp),%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 536:	6a 01                	push   $0x1
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 53e:	e8 17 fe ff ff       	call   35a <write>
        putc(fd, c);
 543:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 547:	83 c4 0c             	add    $0xc,%esp
 54a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 54d:	6a 01                	push   $0x1
 54f:	57                   	push   %edi
 550:	56                   	push   %esi
 551:	e8 04 fe ff ff       	call   35a <write>
        putc(fd, c);
 556:	83 c4 10             	add    $0x10,%esp
      state = 0;
 559:	31 c9                	xor    %ecx,%ecx
 55b:	eb 95                	jmp    4f2 <printf+0x52>
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 10 00 00 00       	mov    $0x10,%ecx
 568:	6a 00                	push   $0x0
 56a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 56d:	8b 10                	mov    (%eax),%edx
 56f:	89 f0                	mov    %esi,%eax
 571:	e8 7a fe ff ff       	call   3f0 <printint>
        ap++;
 576:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 57a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57d:	31 c9                	xor    %ecx,%ecx
 57f:	e9 6e ff ff ff       	jmp    4f2 <printf+0x52>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 588:	8b 45 d0             	mov    -0x30(%ebp),%eax
 58b:	8b 10                	mov    (%eax),%edx
        ap++;
 58d:	83 c0 04             	add    $0x4,%eax
 590:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 593:	85 d2                	test   %edx,%edx
 595:	0f 84 8d 00 00 00    	je     628 <printf+0x188>
        while(*s != 0){
 59b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 59e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5a0:	84 c0                	test   %al,%al
 5a2:	0f 84 4a ff ff ff    	je     4f2 <printf+0x52>
 5a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5ab:	89 d3                	mov    %edx,%ebx
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5b9:	6a 01                	push   $0x1
 5bb:	57                   	push   %edi
 5bc:	56                   	push   %esi
 5bd:	e8 98 fd ff ff       	call   35a <write>
        while(*s != 0){
 5c2:	0f b6 03             	movzbl (%ebx),%eax
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	84 c0                	test   %al,%al
 5ca:	75 e4                	jne    5b0 <printf+0x110>
      state = 0;
 5cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5cf:	31 c9                	xor    %ecx,%ecx
 5d1:	e9 1c ff ff ff       	jmp    4f2 <printf+0x52>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e8:	6a 01                	push   $0x1
 5ea:	e9 7b ff ff ff       	jmp    56a <printf+0xca>
 5ef:	90                   	nop
        putc(fd, *ap);
 5f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5f8:	6a 01                	push   $0x1
 5fa:	57                   	push   %edi
 5fb:	56                   	push   %esi
        putc(fd, *ap);
 5fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5ff:	e8 56 fd ff ff       	call   35a <write>
        ap++;
 604:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 608:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60b:	31 c9                	xor    %ecx,%ecx
 60d:	e9 e0 fe ff ff       	jmp    4f2 <printf+0x52>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 618:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 61b:	83 ec 04             	sub    $0x4,%esp
 61e:	e9 2a ff ff ff       	jmp    54d <printf+0xad>
 623:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 627:	90                   	nop
          s = "(null)";
 628:	ba c8 07 00 00       	mov    $0x7c8,%edx
        while(*s != 0){
 62d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 630:	b8 28 00 00 00       	mov    $0x28,%eax
 635:	89 d3                	mov    %edx,%ebx
 637:	e9 74 ff ff ff       	jmp    5b0 <printf+0x110>
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 94 0b 00 00       	mov    0xb94,%eax
{
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 64e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 658:	89 c2                	mov    %eax,%edx
 65a:	8b 00                	mov    (%eax),%eax
 65c:	39 ca                	cmp    %ecx,%edx
 65e:	73 30                	jae    690 <free+0x50>
 660:	39 c1                	cmp    %eax,%ecx
 662:	72 04                	jb     668 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 664:	39 c2                	cmp    %eax,%edx
 666:	72 f0                	jb     658 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	39 f8                	cmp    %edi,%eax
 670:	74 30                	je     6a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 672:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 675:	8b 42 04             	mov    0x4(%edx),%eax
 678:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 67b:	39 f1                	cmp    %esi,%ecx
 67d:	74 3a                	je     6b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 67f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 681:	5b                   	pop    %ebx
  freep = p;
 682:	89 15 94 0b 00 00    	mov    %edx,0xb94
}
 688:	5e                   	pop    %esi
 689:	5f                   	pop    %edi
 68a:	5d                   	pop    %ebp
 68b:	c3                   	ret    
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 690:	39 c2                	cmp    %eax,%edx
 692:	72 c4                	jb     658 <free+0x18>
 694:	39 c1                	cmp    %eax,%ecx
 696:	73 c0                	jae    658 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 698:	8b 73 fc             	mov    -0x4(%ebx),%esi
 69b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 69e:	39 f8                	cmp    %edi,%eax
 6a0:	75 d0                	jne    672 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6a2:	03 70 04             	add    0x4(%eax),%esi
 6a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a8:	8b 02                	mov    (%edx),%eax
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6af:	8b 42 04             	mov    0x4(%edx),%eax
 6b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6b5:	39 f1                	cmp    %esi,%ecx
 6b7:	75 c6                	jne    67f <free+0x3f>
    p->s.size += bp->s.size;
 6b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6bc:	89 15 94 0b 00 00    	mov    %edx,0xb94
    p->s.size += bp->s.size;
 6c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6c8:	89 0a                	mov    %ecx,(%edx)
}
 6ca:	5b                   	pop    %ebx
 6cb:	5e                   	pop    %esi
 6cc:	5f                   	pop    %edi
 6cd:	5d                   	pop    %ebp
 6ce:	c3                   	ret    
 6cf:	90                   	nop

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6dc:	8b 3d 94 0b 00 00    	mov    0xb94,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e2:	8d 70 07             	lea    0x7(%eax),%esi
 6e5:	c1 ee 03             	shr    $0x3,%esi
 6e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6eb:	85 ff                	test   %edi,%edi
 6ed:	0f 84 9d 00 00 00    	je     790 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6f8:	39 f1                	cmp    %esi,%ecx
 6fa:	73 6a                	jae    766 <malloc+0x96>
 6fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 701:	39 de                	cmp    %ebx,%esi
 703:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 706:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 70d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 710:	eb 17                	jmp    729 <malloc+0x59>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 718:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 71a:	8b 48 04             	mov    0x4(%eax),%ecx
 71d:	39 f1                	cmp    %esi,%ecx
 71f:	73 4f                	jae    770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 721:	8b 3d 94 0b 00 00    	mov    0xb94,%edi
 727:	89 c2                	mov    %eax,%edx
 729:	39 d7                	cmp    %edx,%edi
 72b:	75 eb                	jne    718 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 72d:	83 ec 0c             	sub    $0xc,%esp
 730:	ff 75 e4             	push   -0x1c(%ebp)
 733:	e8 8a fc ff ff       	call   3c2 <sbrk>
  if(p == (char*)-1)
 738:	83 c4 10             	add    $0x10,%esp
 73b:	83 f8 ff             	cmp    $0xffffffff,%eax
 73e:	74 1c                	je     75c <malloc+0x8c>
  hp->s.size = nu;
 740:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 743:	83 ec 0c             	sub    $0xc,%esp
 746:	83 c0 08             	add    $0x8,%eax
 749:	50                   	push   %eax
 74a:	e8 f1 fe ff ff       	call   640 <free>
  return freep;
 74f:	8b 15 94 0b 00 00    	mov    0xb94,%edx
      if((p = morecore(nunits)) == 0)
 755:	83 c4 10             	add    $0x10,%esp
 758:	85 d2                	test   %edx,%edx
 75a:	75 bc                	jne    718 <malloc+0x48>
        return 0;
  }
}
 75c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 75f:	31 c0                	xor    %eax,%eax
}
 761:	5b                   	pop    %ebx
 762:	5e                   	pop    %esi
 763:	5f                   	pop    %edi
 764:	5d                   	pop    %ebp
 765:	c3                   	ret    
    if(p->s.size >= nunits){
 766:	89 d0                	mov    %edx,%eax
 768:	89 fa                	mov    %edi,%edx
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 770:	39 ce                	cmp    %ecx,%esi
 772:	74 4c                	je     7c0 <malloc+0xf0>
        p->s.size -= nunits;
 774:	29 f1                	sub    %esi,%ecx
 776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 77c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 77f:	89 15 94 0b 00 00    	mov    %edx,0xb94
}
 785:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 788:	83 c0 08             	add    $0x8,%eax
}
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 790:	c7 05 94 0b 00 00 98 	movl   $0xb98,0xb94
 797:	0b 00 00 
    base.s.size = 0;
 79a:	bf 98 0b 00 00       	mov    $0xb98,%edi
    base.s.ptr = freep = prevp = &base;
 79f:	c7 05 98 0b 00 00 98 	movl   $0xb98,0xb98
 7a6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7ab:	c7 05 9c 0b 00 00 00 	movl   $0x0,0xb9c
 7b2:	00 00 00 
    if(p->s.size >= nunits){
 7b5:	e9 42 ff ff ff       	jmp    6fc <malloc+0x2c>
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7c0:	8b 08                	mov    (%eax),%ecx
 7c2:	89 0a                	mov    %ecx,(%edx)
 7c4:	eb b9                	jmp    77f <malloc+0xaf>
