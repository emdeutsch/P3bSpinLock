
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   8:	83 ec 0c             	sub    $0xc,%esp
   b:	53                   	push   %ebx
   c:	e8 1f 03 00 00       	call   330 <strlen>
  11:	01 d8                	add    %ebx,%eax
  13:	83 c4 10             	add    $0x10,%esp
  16:	eb 03                	jmp    1b <fmtname+0x1b>
  18:	83 e8 01             	sub    $0x1,%eax
  1b:	39 d8                	cmp    %ebx,%eax
  1d:	72 05                	jb     24 <fmtname+0x24>
  1f:	80 38 2f             	cmpb   $0x2f,(%eax)
  22:	75 f4                	jne    18 <fmtname+0x18>
    ;
  p++;
  24:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	53                   	push   %ebx
  2b:	e8 00 03 00 00       	call   330 <strlen>
  30:	83 c4 10             	add    $0x10,%esp
  33:	83 f8 0d             	cmp    $0xd,%eax
  36:	76 09                	jbe    41 <fmtname+0x41>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  38:	89 d8                	mov    %ebx,%eax
  3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3d:	5b                   	pop    %ebx
  3e:	5e                   	pop    %esi
  3f:	5d                   	pop    %ebp
  40:	c3                   	ret    
  memmove(buf, p, strlen(p));
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	53                   	push   %ebx
  45:	e8 e6 02 00 00       	call   330 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 b0 0d 00 00       	push   $0xdb0
  54:	e8 f6 03 00 00       	call   44f <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 cf 02 00 00       	call   330 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 c5 02 00 00       	call   330 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 b0 0d 00 00       	add    $0xdb0,%eax
  7d:	50                   	push   %eax
  7e:	e8 c5 02 00 00       	call   348 <memset>
  return buf;
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb b0 0d 00 00       	mov    $0xdb0,%ebx
  8b:	eb ab                	jmp    38 <fmtname+0x38>

0000008d <ls>:

void
ls(char *path)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	53                   	push   %ebx
  93:	81 ec 54 02 00 00    	sub    $0x254,%esp
  99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  9c:	6a 00                	push   $0x0
  9e:	53                   	push   %ebx
  9f:	e8 cc 04 00 00       	call   570 <open>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	85 c0                	test   %eax,%eax
  a9:	0f 88 8c 00 00 00    	js     13b <ls+0xae>
  af:	89 c7                	mov    %eax,%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  b1:	83 ec 08             	sub    $0x8,%esp
  b4:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  ba:	50                   	push   %eax
  bb:	57                   	push   %edi
  bc:	e8 c7 04 00 00       	call   588 <fstat>
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	0f 88 84 00 00 00    	js     150 <ls+0xc3>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  cc:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  d3:	0f bf f0             	movswl %ax,%esi
  d6:	66 83 f8 01          	cmp    $0x1,%ax
  da:	0f 84 8d 00 00 00    	je     16d <ls+0xe0>
  e0:	66 83 f8 02          	cmp    $0x2,%ax
  e4:	75 41                	jne    127 <ls+0x9a>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
  e6:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
  ec:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  f2:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
  f8:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
  fe:	83 ec 0c             	sub    $0xc,%esp
 101:	53                   	push   %ebx
 102:	e8 f9 fe ff ff       	call   0 <fmtname>
 107:	83 c4 08             	add    $0x8,%esp
 10a:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 110:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 116:	56                   	push   %esi
 117:	50                   	push   %eax
 118:	68 5c 09 00 00       	push   $0x95c
 11d:	6a 01                	push   $0x1
 11f:	e8 61 05 00 00       	call   685 <printf>
    break;
 124:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 127:	83 ec 0c             	sub    $0xc,%esp
 12a:	57                   	push   %edi
 12b:	e8 28 04 00 00       	call   558 <close>
 130:	83 c4 10             	add    $0x10,%esp
}
 133:	8d 65 f4             	lea    -0xc(%ebp),%esp
 136:	5b                   	pop    %ebx
 137:	5e                   	pop    %esi
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
    printf(2, "ls: cannot open %s\n", path);
 13b:	83 ec 04             	sub    $0x4,%esp
 13e:	53                   	push   %ebx
 13f:	68 34 09 00 00       	push   $0x934
 144:	6a 02                	push   $0x2
 146:	e8 3a 05 00 00       	call   685 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 48 09 00 00       	push   $0x948
 159:	6a 02                	push   $0x2
 15b:	e8 25 05 00 00       	call   685 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 f0 03 00 00       	call   558 <close>
    return;
 168:	83 c4 10             	add    $0x10,%esp
 16b:	eb c6                	jmp    133 <ls+0xa6>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 16d:	83 ec 0c             	sub    $0xc,%esp
 170:	53                   	push   %ebx
 171:	e8 ba 01 00 00       	call   330 <strlen>
 176:	83 c0 10             	add    $0x10,%eax
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3d 00 02 00 00       	cmp    $0x200,%eax
 181:	76 14                	jbe    197 <ls+0x10a>
      printf(1, "ls: path too long\n");
 183:	83 ec 08             	sub    $0x8,%esp
 186:	68 69 09 00 00       	push   $0x969
 18b:	6a 01                	push   $0x1
 18d:	e8 f3 04 00 00       	call   685 <printf>
      break;
 192:	83 c4 10             	add    $0x10,%esp
 195:	eb 90                	jmp    127 <ls+0x9a>
    strcpy(buf, path);
 197:	83 ec 08             	sub    $0x8,%esp
 19a:	53                   	push   %ebx
 19b:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a1:	56                   	push   %esi
 1a2:	e8 3d 01 00 00       	call   2e4 <strcpy>
    p = buf+strlen(buf);
 1a7:	89 34 24             	mov    %esi,(%esp)
 1aa:	e8 81 01 00 00       	call   330 <strlen>
 1af:	01 c6                	add    %eax,%esi
    *p++ = '/';
 1b1:	8d 46 01             	lea    0x1(%esi),%eax
 1b4:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 1ba:	c6 06 2f             	movb   $0x2f,(%esi)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	eb 19                	jmp    1db <ls+0x14e>
        printf(1, "ls: cannot stat %s\n", buf);
 1c2:	83 ec 04             	sub    $0x4,%esp
 1c5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1cb:	50                   	push   %eax
 1cc:	68 48 09 00 00       	push   $0x948
 1d1:	6a 01                	push   $0x1
 1d3:	e8 ad 04 00 00       	call   685 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 5b 03 00 00       	call   548 <read>
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	83 f8 10             	cmp    $0x10,%eax
 1f3:	0f 85 2e ff ff ff    	jne    127 <ls+0x9a>
      if(de.inum == 0)
 1f9:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 200:	00 
 201:	74 d8                	je     1db <ls+0x14e>
      memmove(p, de.name, DIRSIZ);
 203:	83 ec 04             	sub    $0x4,%esp
 206:	6a 0e                	push   $0xe
 208:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 20e:	50                   	push   %eax
 20f:	ff b5 ac fd ff ff    	push   -0x254(%ebp)
 215:	e8 35 02 00 00       	call   44f <memmove>
      p[DIRSIZ] = 0;
 21a:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 21e:	83 c4 08             	add    $0x8,%esp
 221:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	e8 a7 01 00 00       	call   3db <stat>
 234:	83 c4 10             	add    $0x10,%esp
 237:	85 c0                	test   %eax,%eax
 239:	78 87                	js     1c2 <ls+0x135>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 23b:	8b 9d d4 fd ff ff    	mov    -0x22c(%ebp),%ebx
 241:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 247:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24d:	0f b7 8d c4 fd ff ff 	movzwl -0x23c(%ebp),%ecx
 254:	66 89 8d b0 fd ff ff 	mov    %cx,-0x250(%ebp)
 25b:	83 ec 0c             	sub    $0xc,%esp
 25e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 264:	50                   	push   %eax
 265:	e8 96 fd ff ff       	call   0 <fmtname>
 26a:	89 c2                	mov    %eax,%edx
 26c:	83 c4 08             	add    $0x8,%esp
 26f:	53                   	push   %ebx
 270:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 276:	0f bf 85 b0 fd ff ff 	movswl -0x250(%ebp),%eax
 27d:	50                   	push   %eax
 27e:	52                   	push   %edx
 27f:	68 5c 09 00 00       	push   $0x95c
 284:	6a 01                	push   $0x1
 286:	e8 fa 03 00 00       	call   685 <printf>
 28b:	83 c4 20             	add    $0x20,%esp
 28e:	e9 48 ff ff ff       	jmp    1db <ls+0x14e>

00000293 <main>:

int
main(int argc, char *argv[])
{
 293:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 297:	83 e4 f0             	and    $0xfffffff0,%esp
 29a:	ff 71 fc             	push   -0x4(%ecx)
 29d:	55                   	push   %ebp
 29e:	89 e5                	mov    %esp,%ebp
 2a0:	57                   	push   %edi
 2a1:	56                   	push   %esi
 2a2:	53                   	push   %ebx
 2a3:	51                   	push   %ecx
 2a4:	83 ec 08             	sub    $0x8,%esp
 2a7:	8b 31                	mov    (%ecx),%esi
 2a9:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 2ac:	83 fe 01             	cmp    $0x1,%esi
 2af:	7e 07                	jle    2b8 <main+0x25>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 2b1:	bb 01 00 00 00       	mov    $0x1,%ebx
 2b6:	eb 23                	jmp    2db <main+0x48>
    ls(".");
 2b8:	83 ec 0c             	sub    $0xc,%esp
 2bb:	68 7c 09 00 00       	push   $0x97c
 2c0:	e8 c8 fd ff ff       	call   8d <ls>
    exit();
 2c5:	e8 66 02 00 00       	call   530 <exit>
    ls(argv[i]);
 2ca:	83 ec 0c             	sub    $0xc,%esp
 2cd:	ff 34 9f             	push   (%edi,%ebx,4)
 2d0:	e8 b8 fd ff ff       	call   8d <ls>
  for(i=1; i<argc; i++)
 2d5:	83 c3 01             	add    $0x1,%ebx
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	39 f3                	cmp    %esi,%ebx
 2dd:	7c eb                	jl     2ca <main+0x37>
  exit();
 2df:	e8 4c 02 00 00       	call   530 <exit>

000002e4 <strcpy>:
#include "mmu.h"


char*
strcpy(char *s, const char *t)
{
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
 2e9:	8b 75 08             	mov    0x8(%ebp),%esi
 2ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ef:	89 f0                	mov    %esi,%eax
 2f1:	89 d1                	mov    %edx,%ecx
 2f3:	83 c2 01             	add    $0x1,%edx
 2f6:	89 c3                	mov    %eax,%ebx
 2f8:	83 c0 01             	add    $0x1,%eax
 2fb:	0f b6 09             	movzbl (%ecx),%ecx
 2fe:	88 0b                	mov    %cl,(%ebx)
 300:	84 c9                	test   %cl,%cl
 302:	75 ed                	jne    2f1 <strcpy+0xd>
    ;
  return os;
}
 304:	89 f0                	mov    %esi,%eax
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 310:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 313:	eb 06                	jmp    31b <strcmp+0x11>
    p++, q++;
 315:	83 c1 01             	add    $0x1,%ecx
 318:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 31b:	0f b6 01             	movzbl (%ecx),%eax
 31e:	84 c0                	test   %al,%al
 320:	74 04                	je     326 <strcmp+0x1c>
 322:	3a 02                	cmp    (%edx),%al
 324:	74 ef                	je     315 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 326:	0f b6 c0             	movzbl %al,%eax
 329:	0f b6 12             	movzbl (%edx),%edx
 32c:	29 d0                	sub    %edx,%eax
}
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    

00000330 <strlen>:

uint
strlen(const char *s)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 336:	b8 00 00 00 00       	mov    $0x0,%eax
 33b:	eb 03                	jmp    340 <strlen+0x10>
 33d:	83 c0 01             	add    $0x1,%eax
 340:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 344:	75 f7                	jne    33d <strlen+0xd>
    ;
  return n;
}
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    

00000348 <memset>:

void*
memset(void *dst, int c, uint n)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	57                   	push   %edi
 34c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 34f:	89 d7                	mov    %edx,%edi
 351:	8b 4d 10             	mov    0x10(%ebp),%ecx
 354:	8b 45 0c             	mov    0xc(%ebp),%eax
 357:	fc                   	cld    
 358:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35a:	89 d0                	mov    %edx,%eax
 35c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <strchr>:

char*
strchr(const char *s, char c)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36b:	eb 03                	jmp    370 <strchr+0xf>
 36d:	83 c0 01             	add    $0x1,%eax
 370:	0f b6 10             	movzbl (%eax),%edx
 373:	84 d2                	test   %dl,%dl
 375:	74 06                	je     37d <strchr+0x1c>
    if(*s == c)
 377:	38 ca                	cmp    %cl,%dl
 379:	75 f2                	jne    36d <strchr+0xc>
 37b:	eb 05                	jmp    382 <strchr+0x21>
      return (char*)s;
  return 0;
 37d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 382:	5d                   	pop    %ebp
 383:	c3                   	ret    

00000384 <gets>:

char*
gets(char *buf, int max)
{
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	57                   	push   %edi
 388:	56                   	push   %esi
 389:	53                   	push   %ebx
 38a:	83 ec 1c             	sub    $0x1c,%esp
 38d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 390:	bb 00 00 00 00       	mov    $0x0,%ebx
 395:	89 de                	mov    %ebx,%esi
 397:	83 c3 01             	add    $0x1,%ebx
 39a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 39d:	7d 2e                	jge    3cd <gets+0x49>
    cc = read(0, &c, 1);
 39f:	83 ec 04             	sub    $0x4,%esp
 3a2:	6a 01                	push   $0x1
 3a4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a7:	50                   	push   %eax
 3a8:	6a 00                	push   $0x0
 3aa:	e8 99 01 00 00       	call   548 <read>
    if(cc < 1)
 3af:	83 c4 10             	add    $0x10,%esp
 3b2:	85 c0                	test   %eax,%eax
 3b4:	7e 17                	jle    3cd <gets+0x49>
      break;
    buf[i++] = c;
 3b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3ba:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3bd:	3c 0a                	cmp    $0xa,%al
 3bf:	0f 94 c2             	sete   %dl
 3c2:	3c 0d                	cmp    $0xd,%al
 3c4:	0f 94 c0             	sete   %al
 3c7:	08 c2                	or     %al,%dl
 3c9:	74 ca                	je     395 <gets+0x11>
    buf[i++] = c;
 3cb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3cd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d1:	89 f8                	mov    %edi,%eax
 3d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <stat>:

int
stat(const char *n, struct stat *st)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	56                   	push   %esi
 3df:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e0:	83 ec 08             	sub    $0x8,%esp
 3e3:	6a 00                	push   $0x0
 3e5:	ff 75 08             	push   0x8(%ebp)
 3e8:	e8 83 01 00 00       	call   570 <open>
  if(fd < 0)
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	85 c0                	test   %eax,%eax
 3f2:	78 24                	js     418 <stat+0x3d>
 3f4:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3f6:	83 ec 08             	sub    $0x8,%esp
 3f9:	ff 75 0c             	push   0xc(%ebp)
 3fc:	50                   	push   %eax
 3fd:	e8 86 01 00 00       	call   588 <fstat>
 402:	89 c6                	mov    %eax,%esi
  close(fd);
 404:	89 1c 24             	mov    %ebx,(%esp)
 407:	e8 4c 01 00 00       	call   558 <close>
  return r;
 40c:	83 c4 10             	add    $0x10,%esp
}
 40f:	89 f0                	mov    %esi,%eax
 411:	8d 65 f8             	lea    -0x8(%ebp),%esp
 414:	5b                   	pop    %ebx
 415:	5e                   	pop    %esi
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
    return -1;
 418:	be ff ff ff ff       	mov    $0xffffffff,%esi
 41d:	eb f0                	jmp    40f <stat+0x34>

0000041f <atoi>:

int
atoi(const char *s)
{
 41f:	55                   	push   %ebp
 420:	89 e5                	mov    %esp,%ebp
 422:	53                   	push   %ebx
 423:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 426:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 42b:	eb 10                	jmp    43d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 42d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 430:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 433:	83 c1 01             	add    $0x1,%ecx
 436:	0f be c0             	movsbl %al,%eax
 439:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 43d:	0f b6 01             	movzbl (%ecx),%eax
 440:	8d 58 d0             	lea    -0x30(%eax),%ebx
 443:	80 fb 09             	cmp    $0x9,%bl
 446:	76 e5                	jbe    42d <atoi+0xe>
  return n;
}
 448:	89 d0                	mov    %edx,%eax
 44a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	56                   	push   %esi
 453:	53                   	push   %ebx
 454:	8b 75 08             	mov    0x8(%ebp),%esi
 457:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 45d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 45f:	eb 0d                	jmp    46e <memmove+0x1f>
    *dst++ = *src++;
 461:	0f b6 01             	movzbl (%ecx),%eax
 464:	88 02                	mov    %al,(%edx)
 466:	8d 49 01             	lea    0x1(%ecx),%ecx
 469:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 46c:	89 d8                	mov    %ebx,%eax
 46e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 471:	85 c0                	test   %eax,%eax
 473:	7f ec                	jg     461 <memmove+0x12>
  return vdst;
}
 475:	89 f0                	mov    %esi,%eax
 477:	5b                   	pop    %ebx
 478:	5e                   	pop    %esi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    

0000047b <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 47b:	55                   	push   %ebp
 47c:	89 e5                	mov    %esp,%ebp
 47e:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 481:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 483:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 486:	89 08                	mov    %ecx,(%eax)
  return old;
}
 488:	89 d0                	mov    %edx,%eax
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    

0000048c <lock_init>:
void 
lock_init(lock_t *lock){
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 48f:	8b 45 08             	mov    0x8(%ebp),%eax
 492:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    

0000049a <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	53                   	push   %ebx
 49e:	83 ec 04             	sub    $0x4,%esp
 4a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 4a4:	83 ec 08             	sub    $0x8,%esp
 4a7:	6a 01                	push   $0x1
 4a9:	53                   	push   %ebx
 4aa:	e8 cc ff ff ff       	call   47b <TestAndSet>
 4af:	83 c4 10             	add    $0x10,%esp
 4b2:	83 f8 01             	cmp    $0x1,%eax
 4b5:	74 ed                	je     4a4 <lock_acquire+0xa>
    ;
}
 4b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ba:	c9                   	leave  
 4bb:	c3                   	ret    

000004bc <lock_release>:
void 
lock_release(lock_t *lock){
 4bc:	55                   	push   %ebp
 4bd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    

000004ca <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 4ca:	55                   	push   %ebp
 4cb:	89 e5                	mov    %esp,%ebp
 4cd:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 4d0:	68 04 20 00 00       	push   $0x2004
 4d5:	e8 d1 03 00 00       	call   8ab <malloc>
    oldstack = stack;
    stack += sizeof(uint);
 4da:	8d 50 04             	lea    0x4(%eax),%edx
    while((uint)stack % PGSIZE !=0){
 4dd:	83 c4 10             	add    $0x10,%esp
 4e0:	eb 03                	jmp    4e5 <thread_create+0x1b>
      stack += 1;
 4e2:	83 c2 01             	add    $0x1,%edx
    while((uint)stack % PGSIZE !=0){
 4e5:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4eb:	75 f5                	jne    4e2 <thread_create+0x18>
    }
    *(uint*)(stack - sizeof(uint)) = (uint)oldstack;
 4ed:	89 42 fc             	mov    %eax,-0x4(%edx)
    
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4f0:	52                   	push   %edx
 4f1:	ff 75 10             	push   0x10(%ebp)
 4f4:	ff 75 0c             	push   0xc(%ebp)
 4f7:	ff 75 08             	push   0x8(%ebp)
 4fa:	e8 d1 00 00 00       	call   5d0 <clone>
 
    return pid;
}
 4ff:	c9                   	leave  
 500:	c3                   	ret    

00000501 <thread_join>:
int 
thread_join(){
 501:	55                   	push   %ebp
 502:	89 e5                	mov    %esp,%ebp
 504:	53                   	push   %ebx
 505:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int pid = join(&newStack);
 508:	8d 45 f4             	lea    -0xc(%ebp),%eax
 50b:	50                   	push   %eax
 50c:	e8 c7 00 00 00       	call   5d8 <join>
 511:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 513:	83 c4 04             	add    $0x4,%esp
 516:	8b 45 f4             	mov    -0xc(%ebp),%eax
 519:	ff 70 fc             	push   -0x4(%eax)
 51c:	e8 ca 02 00 00       	call   7eb <free>
  return pid;
 521:	89 d8                	mov    %ebx,%eax
 523:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 526:	c9                   	leave  
 527:	c3                   	ret    

00000528 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 528:	b8 01 00 00 00       	mov    $0x1,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <exit>:
SYSCALL(exit)
 530:	b8 02 00 00 00       	mov    $0x2,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <wait>:
SYSCALL(wait)
 538:	b8 03 00 00 00       	mov    $0x3,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <pipe>:
SYSCALL(pipe)
 540:	b8 04 00 00 00       	mov    $0x4,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <read>:
SYSCALL(read)
 548:	b8 05 00 00 00       	mov    $0x5,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <write>:
SYSCALL(write)
 550:	b8 10 00 00 00       	mov    $0x10,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <close>:
SYSCALL(close)
 558:	b8 15 00 00 00       	mov    $0x15,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <kill>:
SYSCALL(kill)
 560:	b8 06 00 00 00       	mov    $0x6,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <exec>:
SYSCALL(exec)
 568:	b8 07 00 00 00       	mov    $0x7,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <open>:
SYSCALL(open)
 570:	b8 0f 00 00 00       	mov    $0xf,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <mknod>:
SYSCALL(mknod)
 578:	b8 11 00 00 00       	mov    $0x11,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <unlink>:
SYSCALL(unlink)
 580:	b8 12 00 00 00       	mov    $0x12,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <fstat>:
SYSCALL(fstat)
 588:	b8 08 00 00 00       	mov    $0x8,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <link>:
SYSCALL(link)
 590:	b8 13 00 00 00       	mov    $0x13,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <mkdir>:
SYSCALL(mkdir)
 598:	b8 14 00 00 00       	mov    $0x14,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <chdir>:
SYSCALL(chdir)
 5a0:	b8 09 00 00 00       	mov    $0x9,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <dup>:
SYSCALL(dup)
 5a8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <getpid>:
SYSCALL(getpid)
 5b0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <sbrk>:
SYSCALL(sbrk)
 5b8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <sleep>:
SYSCALL(sleep)
 5c0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <uptime>:
SYSCALL(uptime)
 5c8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <clone>:
SYSCALL(clone)
 5d0:	b8 16 00 00 00       	mov    $0x16,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <join>:
SYSCALL(join)
 5d8:	b8 17 00 00 00       	mov    $0x17,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	83 ec 1c             	sub    $0x1c,%esp
 5e6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5e9:	6a 01                	push   $0x1
 5eb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5ee:	52                   	push   %edx
 5ef:	50                   	push   %eax
 5f0:	e8 5b ff ff ff       	call   550 <write>
}
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	c9                   	leave  
 5f9:	c3                   	ret    

000005fa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	57                   	push   %edi
 5fe:	56                   	push   %esi
 5ff:	53                   	push   %ebx
 600:	83 ec 2c             	sub    $0x2c,%esp
 603:	89 45 d0             	mov    %eax,-0x30(%ebp)
 606:	89 d0                	mov    %edx,%eax
 608:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 60a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 60e:	0f 95 c1             	setne  %cl
 611:	c1 ea 1f             	shr    $0x1f,%edx
 614:	84 d1                	test   %dl,%cl
 616:	74 44                	je     65c <printint+0x62>
    neg = 1;
    x = -xx;
 618:	f7 d8                	neg    %eax
 61a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 61c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 623:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 628:	89 c8                	mov    %ecx,%eax
 62a:	ba 00 00 00 00       	mov    $0x0,%edx
 62f:	f7 f6                	div    %esi
 631:	89 df                	mov    %ebx,%edi
 633:	83 c3 01             	add    $0x1,%ebx
 636:	0f b6 92 e0 09 00 00 	movzbl 0x9e0(%edx),%edx
 63d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 641:	89 ca                	mov    %ecx,%edx
 643:	89 c1                	mov    %eax,%ecx
 645:	39 d6                	cmp    %edx,%esi
 647:	76 df                	jbe    628 <printint+0x2e>
  if(neg)
 649:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 64d:	74 31                	je     680 <printint+0x86>
    buf[i++] = '-';
 64f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 654:	8d 5f 02             	lea    0x2(%edi),%ebx
 657:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65a:	eb 17                	jmp    673 <printint+0x79>
    x = xx;
 65c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 65e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 665:	eb bc                	jmp    623 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 667:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 66c:	89 f0                	mov    %esi,%eax
 66e:	e8 6d ff ff ff       	call   5e0 <putc>
  while(--i >= 0)
 673:	83 eb 01             	sub    $0x1,%ebx
 676:	79 ef                	jns    667 <printint+0x6d>
}
 678:	83 c4 2c             	add    $0x2c,%esp
 67b:	5b                   	pop    %ebx
 67c:	5e                   	pop    %esi
 67d:	5f                   	pop    %edi
 67e:	5d                   	pop    %ebp
 67f:	c3                   	ret    
 680:	8b 75 d0             	mov    -0x30(%ebp),%esi
 683:	eb ee                	jmp    673 <printint+0x79>

00000685 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 685:	55                   	push   %ebp
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 68e:	8d 45 10             	lea    0x10(%ebp),%eax
 691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 694:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 699:	bb 00 00 00 00       	mov    $0x0,%ebx
 69e:	eb 14                	jmp    6b4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6a0:	89 fa                	mov    %edi,%edx
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	e8 36 ff ff ff       	call   5e0 <putc>
 6aa:	eb 05                	jmp    6b1 <printf+0x2c>
      }
    } else if(state == '%'){
 6ac:	83 fe 25             	cmp    $0x25,%esi
 6af:	74 25                	je     6d6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6b1:	83 c3 01             	add    $0x1,%ebx
 6b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6bb:	84 c0                	test   %al,%al
 6bd:	0f 84 20 01 00 00    	je     7e3 <printf+0x15e>
    c = fmt[i] & 0xff;
 6c3:	0f be f8             	movsbl %al,%edi
 6c6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6c9:	85 f6                	test   %esi,%esi
 6cb:	75 df                	jne    6ac <printf+0x27>
      if(c == '%'){
 6cd:	83 f8 25             	cmp    $0x25,%eax
 6d0:	75 ce                	jne    6a0 <printf+0x1b>
        state = '%';
 6d2:	89 c6                	mov    %eax,%esi
 6d4:	eb db                	jmp    6b1 <printf+0x2c>
      if(c == 'd'){
 6d6:	83 f8 25             	cmp    $0x25,%eax
 6d9:	0f 84 cf 00 00 00    	je     7ae <printf+0x129>
 6df:	0f 8c dd 00 00 00    	jl     7c2 <printf+0x13d>
 6e5:	83 f8 78             	cmp    $0x78,%eax
 6e8:	0f 8f d4 00 00 00    	jg     7c2 <printf+0x13d>
 6ee:	83 f8 63             	cmp    $0x63,%eax
 6f1:	0f 8c cb 00 00 00    	jl     7c2 <printf+0x13d>
 6f7:	83 e8 63             	sub    $0x63,%eax
 6fa:	83 f8 15             	cmp    $0x15,%eax
 6fd:	0f 87 bf 00 00 00    	ja     7c2 <printf+0x13d>
 703:	ff 24 85 88 09 00 00 	jmp    *0x988(,%eax,4)
        printint(fd, *ap, 10, 1);
 70a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70d:	8b 17                	mov    (%edi),%edx
 70f:	83 ec 0c             	sub    $0xc,%esp
 712:	6a 01                	push   $0x1
 714:	b9 0a 00 00 00       	mov    $0xa,%ecx
 719:	8b 45 08             	mov    0x8(%ebp),%eax
 71c:	e8 d9 fe ff ff       	call   5fa <printint>
        ap++;
 721:	83 c7 04             	add    $0x4,%edi
 724:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 727:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 72a:	be 00 00 00 00       	mov    $0x0,%esi
 72f:	eb 80                	jmp    6b1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 731:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 734:	8b 17                	mov    (%edi),%edx
 736:	83 ec 0c             	sub    $0xc,%esp
 739:	6a 00                	push   $0x0
 73b:	b9 10 00 00 00       	mov    $0x10,%ecx
 740:	8b 45 08             	mov    0x8(%ebp),%eax
 743:	e8 b2 fe ff ff       	call   5fa <printint>
        ap++;
 748:	83 c7 04             	add    $0x4,%edi
 74b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 74e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 751:	be 00 00 00 00       	mov    $0x0,%esi
 756:	e9 56 ff ff ff       	jmp    6b1 <printf+0x2c>
        s = (char*)*ap;
 75b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 75e:	8b 30                	mov    (%eax),%esi
        ap++;
 760:	83 c0 04             	add    $0x4,%eax
 763:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 766:	85 f6                	test   %esi,%esi
 768:	75 15                	jne    77f <printf+0xfa>
          s = "(null)";
 76a:	be 7e 09 00 00       	mov    $0x97e,%esi
 76f:	eb 0e                	jmp    77f <printf+0xfa>
          putc(fd, *s);
 771:	0f be d2             	movsbl %dl,%edx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 64 fe ff ff       	call   5e0 <putc>
          s++;
 77c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 77f:	0f b6 16             	movzbl (%esi),%edx
 782:	84 d2                	test   %dl,%dl
 784:	75 eb                	jne    771 <printf+0xec>
      state = 0;
 786:	be 00 00 00 00       	mov    $0x0,%esi
 78b:	e9 21 ff ff ff       	jmp    6b1 <printf+0x2c>
        putc(fd, *ap);
 790:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 793:	0f be 17             	movsbl (%edi),%edx
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	e8 42 fe ff ff       	call   5e0 <putc>
        ap++;
 79e:	83 c7 04             	add    $0x4,%edi
 7a1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
 7a9:	e9 03 ff ff ff       	jmp    6b1 <printf+0x2c>
        putc(fd, c);
 7ae:	89 fa                	mov    %edi,%edx
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	e8 28 fe ff ff       	call   5e0 <putc>
      state = 0;
 7b8:	be 00 00 00 00       	mov    $0x0,%esi
 7bd:	e9 ef fe ff ff       	jmp    6b1 <printf+0x2c>
        putc(fd, '%');
 7c2:	ba 25 00 00 00       	mov    $0x25,%edx
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	e8 11 fe ff ff       	call   5e0 <putc>
        putc(fd, c);
 7cf:	89 fa                	mov    %edi,%edx
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	e8 07 fe ff ff       	call   5e0 <putc>
      state = 0;
 7d9:	be 00 00 00 00       	mov    $0x0,%esi
 7de:	e9 ce fe ff ff       	jmp    6b1 <printf+0x2c>
    }
  }
}
 7e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5f                   	pop    %edi
 7e9:	5d                   	pop    %ebp
 7ea:	c3                   	ret    

000007eb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7eb:	55                   	push   %ebp
 7ec:	89 e5                	mov    %esp,%ebp
 7ee:	57                   	push   %edi
 7ef:	56                   	push   %esi
 7f0:	53                   	push   %ebx
 7f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f7:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 7fc:	eb 02                	jmp    800 <free+0x15>
 7fe:	89 d0                	mov    %edx,%eax
 800:	39 c8                	cmp    %ecx,%eax
 802:	73 04                	jae    808 <free+0x1d>
 804:	39 08                	cmp    %ecx,(%eax)
 806:	77 12                	ja     81a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 808:	8b 10                	mov    (%eax),%edx
 80a:	39 c2                	cmp    %eax,%edx
 80c:	77 f0                	ja     7fe <free+0x13>
 80e:	39 c8                	cmp    %ecx,%eax
 810:	72 08                	jb     81a <free+0x2f>
 812:	39 ca                	cmp    %ecx,%edx
 814:	77 04                	ja     81a <free+0x2f>
 816:	89 d0                	mov    %edx,%eax
 818:	eb e6                	jmp    800 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 81a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 820:	8b 10                	mov    (%eax),%edx
 822:	39 d7                	cmp    %edx,%edi
 824:	74 19                	je     83f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 826:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 829:	8b 50 04             	mov    0x4(%eax),%edx
 82c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 82f:	39 ce                	cmp    %ecx,%esi
 831:	74 1b                	je     84e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 833:	89 08                	mov    %ecx,(%eax)
  freep = p;
 835:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 83a:	5b                   	pop    %ebx
 83b:	5e                   	pop    %esi
 83c:	5f                   	pop    %edi
 83d:	5d                   	pop    %ebp
 83e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 83f:	03 72 04             	add    0x4(%edx),%esi
 842:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 845:	8b 10                	mov    (%eax),%edx
 847:	8b 12                	mov    (%edx),%edx
 849:	89 53 f8             	mov    %edx,-0x8(%ebx)
 84c:	eb db                	jmp    829 <free+0x3e>
    p->s.size += bp->s.size;
 84e:	03 53 fc             	add    -0x4(%ebx),%edx
 851:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 854:	8b 53 f8             	mov    -0x8(%ebx),%edx
 857:	89 10                	mov    %edx,(%eax)
 859:	eb da                	jmp    835 <free+0x4a>

0000085b <morecore>:

static Header*
morecore(uint nu)
{
 85b:	55                   	push   %ebp
 85c:	89 e5                	mov    %esp,%ebp
 85e:	53                   	push   %ebx
 85f:	83 ec 04             	sub    $0x4,%esp
 862:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 864:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 869:	77 05                	ja     870 <morecore+0x15>
    nu = 4096;
 86b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 870:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 877:	83 ec 0c             	sub    $0xc,%esp
 87a:	50                   	push   %eax
 87b:	e8 38 fd ff ff       	call   5b8 <sbrk>
  if(p == (char*)-1)
 880:	83 c4 10             	add    $0x10,%esp
 883:	83 f8 ff             	cmp    $0xffffffff,%eax
 886:	74 1c                	je     8a4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 888:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88b:	83 c0 08             	add    $0x8,%eax
 88e:	83 ec 0c             	sub    $0xc,%esp
 891:	50                   	push   %eax
 892:	e8 54 ff ff ff       	call   7eb <free>
  return freep;
 897:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 89c:	83 c4 10             	add    $0x10,%esp
}
 89f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a2:	c9                   	leave  
 8a3:	c3                   	ret    
    return 0;
 8a4:	b8 00 00 00 00       	mov    $0x0,%eax
 8a9:	eb f4                	jmp    89f <morecore+0x44>

000008ab <malloc>:

void*
malloc(uint nbytes)
{
 8ab:	55                   	push   %ebp
 8ac:	89 e5                	mov    %esp,%ebp
 8ae:	53                   	push   %ebx
 8af:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8b 45 08             	mov    0x8(%ebp),%eax
 8b5:	8d 58 07             	lea    0x7(%eax),%ebx
 8b8:	c1 eb 03             	shr    $0x3,%ebx
 8bb:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8be:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 8c4:	85 c9                	test   %ecx,%ecx
 8c6:	74 04                	je     8cc <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	8b 01                	mov    (%ecx),%eax
 8ca:	eb 4a                	jmp    916 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8cc:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 8d3:	0d 00 00 
 8d6:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 8dd:	0d 00 00 
    base.s.size = 0;
 8e0:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 8e7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ea:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 8ef:	eb d7                	jmp    8c8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8f1:	74 19                	je     90c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8f3:	29 da                	sub    %ebx,%edx
 8f5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8fb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8fe:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 904:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 907:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 90a:	c9                   	leave  
 90b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 90c:	8b 10                	mov    (%eax),%edx
 90e:	89 11                	mov    %edx,(%ecx)
 910:	eb ec                	jmp    8fe <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 912:	89 c1                	mov    %eax,%ecx
 914:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 916:	8b 50 04             	mov    0x4(%eax),%edx
 919:	39 da                	cmp    %ebx,%edx
 91b:	73 d4                	jae    8f1 <malloc+0x46>
    if(p == freep)
 91d:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 923:	75 ed                	jne    912 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 925:	89 d8                	mov    %ebx,%eax
 927:	e8 2f ff ff ff       	call   85b <morecore>
 92c:	85 c0                	test   %eax,%eax
 92e:	75 e2                	jne    912 <malloc+0x67>
 930:	eb d5                	jmp    907 <malloc+0x5c>
