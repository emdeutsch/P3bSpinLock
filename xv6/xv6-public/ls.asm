
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
  9f:	e8 cd 04 00 00       	call   571 <open>
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
  bc:	e8 c8 04 00 00       	call   589 <fstat>
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
 11f:	e8 62 05 00 00       	call   686 <printf>
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
 12b:	e8 29 04 00 00       	call   559 <close>
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
 146:	e8 3b 05 00 00       	call   686 <printf>
    return;
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	eb e3                	jmp    133 <ls+0xa6>
    printf(2, "ls: cannot stat %s\n", path);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	53                   	push   %ebx
 154:	68 48 09 00 00       	push   $0x948
 159:	6a 02                	push   $0x2
 15b:	e8 26 05 00 00       	call   686 <printf>
    close(fd);
 160:	89 3c 24             	mov    %edi,(%esp)
 163:	e8 f1 03 00 00       	call   559 <close>
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
 18d:	e8 f4 04 00 00       	call   686 <printf>
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
 1d3:	e8 ae 04 00 00       	call   686 <printf>
        continue;
 1d8:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1db:	83 ec 04             	sub    $0x4,%esp
 1de:	6a 10                	push   $0x10
 1e0:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	57                   	push   %edi
 1e8:	e8 5c 03 00 00       	call   549 <read>
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
 286:	e8 fb 03 00 00       	call   686 <printf>
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
 2c5:	e8 67 02 00 00       	call   531 <exit>
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
 2df:	e8 4d 02 00 00       	call   531 <exit>

000002e4 <strcpy>:
#include "x86.h"
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
 3aa:	e8 9a 01 00 00       	call   549 <read>
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
 3e8:	e8 84 01 00 00       	call   571 <open>
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
 3fd:	e8 87 01 00 00       	call   589 <fstat>
 402:	89 c6                	mov    %eax,%esi
  close(fd);
 404:	89 1c 24             	mov    %ebx,(%esp)
 407:	e8 4d 01 00 00       	call   559 <close>
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
 4d5:	e8 d2 03 00 00       	call   8ac <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 4da:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 4dd:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 4df:	eb 03                	jmp    4e4 <thread_create+0x1a>
      stack += 1;
 4e1:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 4e4:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 4ea:	75 f5                	jne    4e1 <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 4ec:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 4ee:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 4f1:	52                   	push   %edx
 4f2:	ff 75 10             	push   0x10(%ebp)
 4f5:	ff 75 0c             	push   0xc(%ebp)
 4f8:	ff 75 08             	push   0x8(%ebp)
 4fb:	e8 d1 00 00 00       	call   5d1 <clone>
 
    return pid;
}
 500:	c9                   	leave  
 501:	c3                   	ret    

00000502 <thread_join>:
int 
thread_join(){
 502:	55                   	push   %ebp
 503:	89 e5                	mov    %esp,%ebp
 505:	53                   	push   %ebx
 506:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 509:	8d 45 f4             	lea    -0xc(%ebp),%eax
 50c:	50                   	push   %eax
 50d:	e8 c7 00 00 00       	call   5d9 <join>
 512:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 514:	83 c4 04             	add    $0x4,%esp
 517:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51a:	ff 70 fc             	push   -0x4(%eax)
 51d:	e8 ca 02 00 00       	call   7ec <free>
  return waitedForPID;
 522:	89 d8                	mov    %ebx,%eax
 524:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 527:	c9                   	leave  
 528:	c3                   	ret    

00000529 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 529:	b8 01 00 00 00       	mov    $0x1,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <exit>:
SYSCALL(exit)
 531:	b8 02 00 00 00       	mov    $0x2,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <wait>:
SYSCALL(wait)
 539:	b8 03 00 00 00       	mov    $0x3,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <pipe>:
SYSCALL(pipe)
 541:	b8 04 00 00 00       	mov    $0x4,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <read>:
SYSCALL(read)
 549:	b8 05 00 00 00       	mov    $0x5,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <write>:
SYSCALL(write)
 551:	b8 10 00 00 00       	mov    $0x10,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <close>:
SYSCALL(close)
 559:	b8 15 00 00 00       	mov    $0x15,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <kill>:
SYSCALL(kill)
 561:	b8 06 00 00 00       	mov    $0x6,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <exec>:
SYSCALL(exec)
 569:	b8 07 00 00 00       	mov    $0x7,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    

00000571 <open>:
SYSCALL(open)
 571:	b8 0f 00 00 00       	mov    $0xf,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <mknod>:
SYSCALL(mknod)
 579:	b8 11 00 00 00       	mov    $0x11,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <unlink>:
SYSCALL(unlink)
 581:	b8 12 00 00 00       	mov    $0x12,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <fstat>:
SYSCALL(fstat)
 589:	b8 08 00 00 00       	mov    $0x8,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <link>:
SYSCALL(link)
 591:	b8 13 00 00 00       	mov    $0x13,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <mkdir>:
SYSCALL(mkdir)
 599:	b8 14 00 00 00       	mov    $0x14,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <chdir>:
SYSCALL(chdir)
 5a1:	b8 09 00 00 00       	mov    $0x9,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <dup>:
SYSCALL(dup)
 5a9:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <getpid>:
SYSCALL(getpid)
 5b1:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <sbrk>:
SYSCALL(sbrk)
 5b9:	b8 0c 00 00 00       	mov    $0xc,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <sleep>:
SYSCALL(sleep)
 5c1:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <uptime>:
SYSCALL(uptime)
 5c9:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <clone>:
SYSCALL(clone)
 5d1:	b8 16 00 00 00       	mov    $0x16,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <join>:
SYSCALL(join)
 5d9:	b8 17 00 00 00       	mov    $0x17,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5e1:	55                   	push   %ebp
 5e2:	89 e5                	mov    %esp,%ebp
 5e4:	83 ec 1c             	sub    $0x1c,%esp
 5e7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ea:	6a 01                	push   $0x1
 5ec:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5ef:	52                   	push   %edx
 5f0:	50                   	push   %eax
 5f1:	e8 5b ff ff ff       	call   551 <write>
}
 5f6:	83 c4 10             	add    $0x10,%esp
 5f9:	c9                   	leave  
 5fa:	c3                   	ret    

000005fb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5fb:	55                   	push   %ebp
 5fc:	89 e5                	mov    %esp,%ebp
 5fe:	57                   	push   %edi
 5ff:	56                   	push   %esi
 600:	53                   	push   %ebx
 601:	83 ec 2c             	sub    $0x2c,%esp
 604:	89 45 d0             	mov    %eax,-0x30(%ebp)
 607:	89 d0                	mov    %edx,%eax
 609:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 60b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 60f:	0f 95 c1             	setne  %cl
 612:	c1 ea 1f             	shr    $0x1f,%edx
 615:	84 d1                	test   %dl,%cl
 617:	74 44                	je     65d <printint+0x62>
    neg = 1;
    x = -xx;
 619:	f7 d8                	neg    %eax
 61b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 61d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 624:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 629:	89 c8                	mov    %ecx,%eax
 62b:	ba 00 00 00 00       	mov    $0x0,%edx
 630:	f7 f6                	div    %esi
 632:	89 df                	mov    %ebx,%edi
 634:	83 c3 01             	add    $0x1,%ebx
 637:	0f b6 92 e0 09 00 00 	movzbl 0x9e0(%edx),%edx
 63e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 642:	89 ca                	mov    %ecx,%edx
 644:	89 c1                	mov    %eax,%ecx
 646:	39 d6                	cmp    %edx,%esi
 648:	76 df                	jbe    629 <printint+0x2e>
  if(neg)
 64a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 64e:	74 31                	je     681 <printint+0x86>
    buf[i++] = '-';
 650:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 655:	8d 5f 02             	lea    0x2(%edi),%ebx
 658:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65b:	eb 17                	jmp    674 <printint+0x79>
    x = xx;
 65d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 65f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 666:	eb bc                	jmp    624 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 668:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 66d:	89 f0                	mov    %esi,%eax
 66f:	e8 6d ff ff ff       	call   5e1 <putc>
  while(--i >= 0)
 674:	83 eb 01             	sub    $0x1,%ebx
 677:	79 ef                	jns    668 <printint+0x6d>
}
 679:	83 c4 2c             	add    $0x2c,%esp
 67c:	5b                   	pop    %ebx
 67d:	5e                   	pop    %esi
 67e:	5f                   	pop    %edi
 67f:	5d                   	pop    %ebp
 680:	c3                   	ret    
 681:	8b 75 d0             	mov    -0x30(%ebp),%esi
 684:	eb ee                	jmp    674 <printint+0x79>

00000686 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 686:	55                   	push   %ebp
 687:	89 e5                	mov    %esp,%ebp
 689:	57                   	push   %edi
 68a:	56                   	push   %esi
 68b:	53                   	push   %ebx
 68c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 68f:	8d 45 10             	lea    0x10(%ebp),%eax
 692:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 695:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 69a:	bb 00 00 00 00       	mov    $0x0,%ebx
 69f:	eb 14                	jmp    6b5 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6a1:	89 fa                	mov    %edi,%edx
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	e8 36 ff ff ff       	call   5e1 <putc>
 6ab:	eb 05                	jmp    6b2 <printf+0x2c>
      }
    } else if(state == '%'){
 6ad:	83 fe 25             	cmp    $0x25,%esi
 6b0:	74 25                	je     6d7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6b2:	83 c3 01             	add    $0x1,%ebx
 6b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6bc:	84 c0                	test   %al,%al
 6be:	0f 84 20 01 00 00    	je     7e4 <printf+0x15e>
    c = fmt[i] & 0xff;
 6c4:	0f be f8             	movsbl %al,%edi
 6c7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6ca:	85 f6                	test   %esi,%esi
 6cc:	75 df                	jne    6ad <printf+0x27>
      if(c == '%'){
 6ce:	83 f8 25             	cmp    $0x25,%eax
 6d1:	75 ce                	jne    6a1 <printf+0x1b>
        state = '%';
 6d3:	89 c6                	mov    %eax,%esi
 6d5:	eb db                	jmp    6b2 <printf+0x2c>
      if(c == 'd'){
 6d7:	83 f8 25             	cmp    $0x25,%eax
 6da:	0f 84 cf 00 00 00    	je     7af <printf+0x129>
 6e0:	0f 8c dd 00 00 00    	jl     7c3 <printf+0x13d>
 6e6:	83 f8 78             	cmp    $0x78,%eax
 6e9:	0f 8f d4 00 00 00    	jg     7c3 <printf+0x13d>
 6ef:	83 f8 63             	cmp    $0x63,%eax
 6f2:	0f 8c cb 00 00 00    	jl     7c3 <printf+0x13d>
 6f8:	83 e8 63             	sub    $0x63,%eax
 6fb:	83 f8 15             	cmp    $0x15,%eax
 6fe:	0f 87 bf 00 00 00    	ja     7c3 <printf+0x13d>
 704:	ff 24 85 88 09 00 00 	jmp    *0x988(,%eax,4)
        printint(fd, *ap, 10, 1);
 70b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70e:	8b 17                	mov    (%edi),%edx
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	6a 01                	push   $0x1
 715:	b9 0a 00 00 00       	mov    $0xa,%ecx
 71a:	8b 45 08             	mov    0x8(%ebp),%eax
 71d:	e8 d9 fe ff ff       	call   5fb <printint>
        ap++;
 722:	83 c7 04             	add    $0x4,%edi
 725:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 728:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 72b:	be 00 00 00 00       	mov    $0x0,%esi
 730:	eb 80                	jmp    6b2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 732:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 735:	8b 17                	mov    (%edi),%edx
 737:	83 ec 0c             	sub    $0xc,%esp
 73a:	6a 00                	push   $0x0
 73c:	b9 10 00 00 00       	mov    $0x10,%ecx
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	e8 b2 fe ff ff       	call   5fb <printint>
        ap++;
 749:	83 c7 04             	add    $0x4,%edi
 74c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 74f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 752:	be 00 00 00 00       	mov    $0x0,%esi
 757:	e9 56 ff ff ff       	jmp    6b2 <printf+0x2c>
        s = (char*)*ap;
 75c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 75f:	8b 30                	mov    (%eax),%esi
        ap++;
 761:	83 c0 04             	add    $0x4,%eax
 764:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 767:	85 f6                	test   %esi,%esi
 769:	75 15                	jne    780 <printf+0xfa>
          s = "(null)";
 76b:	be 7e 09 00 00       	mov    $0x97e,%esi
 770:	eb 0e                	jmp    780 <printf+0xfa>
          putc(fd, *s);
 772:	0f be d2             	movsbl %dl,%edx
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	e8 64 fe ff ff       	call   5e1 <putc>
          s++;
 77d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 780:	0f b6 16             	movzbl (%esi),%edx
 783:	84 d2                	test   %dl,%dl
 785:	75 eb                	jne    772 <printf+0xec>
      state = 0;
 787:	be 00 00 00 00       	mov    $0x0,%esi
 78c:	e9 21 ff ff ff       	jmp    6b2 <printf+0x2c>
        putc(fd, *ap);
 791:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 794:	0f be 17             	movsbl (%edi),%edx
 797:	8b 45 08             	mov    0x8(%ebp),%eax
 79a:	e8 42 fe ff ff       	call   5e1 <putc>
        ap++;
 79f:	83 c7 04             	add    $0x4,%edi
 7a2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7a5:	be 00 00 00 00       	mov    $0x0,%esi
 7aa:	e9 03 ff ff ff       	jmp    6b2 <printf+0x2c>
        putc(fd, c);
 7af:	89 fa                	mov    %edi,%edx
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	e8 28 fe ff ff       	call   5e1 <putc>
      state = 0;
 7b9:	be 00 00 00 00       	mov    $0x0,%esi
 7be:	e9 ef fe ff ff       	jmp    6b2 <printf+0x2c>
        putc(fd, '%');
 7c3:	ba 25 00 00 00       	mov    $0x25,%edx
 7c8:	8b 45 08             	mov    0x8(%ebp),%eax
 7cb:	e8 11 fe ff ff       	call   5e1 <putc>
        putc(fd, c);
 7d0:	89 fa                	mov    %edi,%edx
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	e8 07 fe ff ff       	call   5e1 <putc>
      state = 0;
 7da:	be 00 00 00 00       	mov    $0x0,%esi
 7df:	e9 ce fe ff ff       	jmp    6b2 <printf+0x2c>
    }
  }
}
 7e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e7:	5b                   	pop    %ebx
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    

000007ec <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ec:	55                   	push   %ebp
 7ed:	89 e5                	mov    %esp,%ebp
 7ef:	57                   	push   %edi
 7f0:	56                   	push   %esi
 7f1:	53                   	push   %ebx
 7f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f8:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 7fd:	eb 02                	jmp    801 <free+0x15>
 7ff:	89 d0                	mov    %edx,%eax
 801:	39 c8                	cmp    %ecx,%eax
 803:	73 04                	jae    809 <free+0x1d>
 805:	39 08                	cmp    %ecx,(%eax)
 807:	77 12                	ja     81b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 809:	8b 10                	mov    (%eax),%edx
 80b:	39 c2                	cmp    %eax,%edx
 80d:	77 f0                	ja     7ff <free+0x13>
 80f:	39 c8                	cmp    %ecx,%eax
 811:	72 08                	jb     81b <free+0x2f>
 813:	39 ca                	cmp    %ecx,%edx
 815:	77 04                	ja     81b <free+0x2f>
 817:	89 d0                	mov    %edx,%eax
 819:	eb e6                	jmp    801 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 81b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 821:	8b 10                	mov    (%eax),%edx
 823:	39 d7                	cmp    %edx,%edi
 825:	74 19                	je     840 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 827:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82a:	8b 50 04             	mov    0x4(%eax),%edx
 82d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 830:	39 ce                	cmp    %ecx,%esi
 832:	74 1b                	je     84f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 834:	89 08                	mov    %ecx,(%eax)
  freep = p;
 836:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 840:	03 72 04             	add    0x4(%edx),%esi
 843:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 846:	8b 10                	mov    (%eax),%edx
 848:	8b 12                	mov    (%edx),%edx
 84a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 84d:	eb db                	jmp    82a <free+0x3e>
    p->s.size += bp->s.size;
 84f:	03 53 fc             	add    -0x4(%ebx),%edx
 852:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 855:	8b 53 f8             	mov    -0x8(%ebx),%edx
 858:	89 10                	mov    %edx,(%eax)
 85a:	eb da                	jmp    836 <free+0x4a>

0000085c <morecore>:

static Header*
morecore(uint nu)
{
 85c:	55                   	push   %ebp
 85d:	89 e5                	mov    %esp,%ebp
 85f:	53                   	push   %ebx
 860:	83 ec 04             	sub    $0x4,%esp
 863:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 865:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 86a:	77 05                	ja     871 <morecore+0x15>
    nu = 4096;
 86c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 871:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 878:	83 ec 0c             	sub    $0xc,%esp
 87b:	50                   	push   %eax
 87c:	e8 38 fd ff ff       	call   5b9 <sbrk>
  if(p == (char*)-1)
 881:	83 c4 10             	add    $0x10,%esp
 884:	83 f8 ff             	cmp    $0xffffffff,%eax
 887:	74 1c                	je     8a5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 889:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88c:	83 c0 08             	add    $0x8,%eax
 88f:	83 ec 0c             	sub    $0xc,%esp
 892:	50                   	push   %eax
 893:	e8 54 ff ff ff       	call   7ec <free>
  return freep;
 898:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 89d:	83 c4 10             	add    $0x10,%esp
}
 8a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a3:	c9                   	leave  
 8a4:	c3                   	ret    
    return 0;
 8a5:	b8 00 00 00 00       	mov    $0x0,%eax
 8aa:	eb f4                	jmp    8a0 <morecore+0x44>

000008ac <malloc>:

void*
malloc(uint nbytes)
{
 8ac:	55                   	push   %ebp
 8ad:	89 e5                	mov    %esp,%ebp
 8af:	53                   	push   %ebx
 8b0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax
 8b6:	8d 58 07             	lea    0x7(%eax),%ebx
 8b9:	c1 eb 03             	shr    $0x3,%ebx
 8bc:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8bf:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 8c5:	85 c9                	test   %ecx,%ecx
 8c7:	74 04                	je     8cd <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	8b 01                	mov    (%ecx),%eax
 8cb:	eb 4a                	jmp    917 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8cd:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 8d4:	0d 00 00 
 8d7:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 8de:	0d 00 00 
    base.s.size = 0;
 8e1:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 8e8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8eb:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 8f0:	eb d7                	jmp    8c9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8f2:	74 19                	je     90d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8f4:	29 da                	sub    %ebx,%edx
 8f6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8fc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8ff:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 905:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 908:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 90b:	c9                   	leave  
 90c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 90d:	8b 10                	mov    (%eax),%edx
 90f:	89 11                	mov    %edx,(%ecx)
 911:	eb ec                	jmp    8ff <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 913:	89 c1                	mov    %eax,%ecx
 915:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 917:	8b 50 04             	mov    0x4(%eax),%edx
 91a:	39 da                	cmp    %ebx,%edx
 91c:	73 d4                	jae    8f2 <malloc+0x46>
    if(p == freep)
 91e:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 924:	75 ed                	jne    913 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 926:	89 d8                	mov    %ebx,%eax
 928:	e8 2f ff ff ff       	call   85c <morecore>
 92d:	85 c0                	test   %eax,%eax
 92f:	75 e2                	jne    913 <malloc+0x67>
 931:	eb d5                	jmp    908 <malloc+0x5c>
