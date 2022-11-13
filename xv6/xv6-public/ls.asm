
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 1f                	jle    42 <main+0x42>
  23:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  27:	90                   	nop
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ca 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit();
  3d:	e8 08 06 00 00       	call   64a <exit>
    ls(".");
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	68 20 0b 00 00       	push   $0xb20
  4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
  4f:	e8 f6 05 00 00       	call   64a <exit>
  54:	66 90                	xchg   %ax,%ax
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 5f 03 00 00       	call   3d0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 36 03 00 00       	call   3d0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 25 03 00 00       	call   3d0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 78 0f 00 00       	push   $0xf78
  b5:	e8 a6 04 00 00       	call   560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 0e 03 00 00       	call   3d0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 78 0f 00 00       	mov    $0xf78,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ff 02 00 00       	call   3d0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 78 0f 00 00       	add    $0xf78,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 17 03 00 00       	call   400 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	81 ec 64 02 00 00    	sub    $0x264,%esp
 10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 10f:	6a 00                	push   $0x0
 111:	57                   	push   %edi
 112:	e8 73 05 00 00       	call   68a <open>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	85 c0                	test   %eax,%eax
 11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 122:	83 ec 08             	sub    $0x8,%esp
 125:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12b:	89 c3                	mov    %eax,%ebx
 12d:	56                   	push   %esi
 12e:	50                   	push   %eax
 12f:	e8 6e 05 00 00       	call   6a2 <fstat>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 146:	66 83 f8 01          	cmp    $0x1,%ax
 14a:	74 64                	je     1b0 <ls+0xb0>
 14c:	66 83 f8 02          	cmp    $0x2,%ax
 150:	74 1e                	je     170 <ls+0x70>
  close(fd);
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	53                   	push   %ebx
 156:	e8 17 05 00 00       	call   672 <close>
 15b:	83 c4 10             	add    $0x10,%esp
}
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
 166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 00 0b 00 00       	push   $0xb00
 19d:	6a 01                	push   $0x1
 19f:	e8 0c 06 00 00       	call   7b0 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb a9                	jmp    152 <ls+0x52>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 17 02 00 00       	call   3d0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 ee 01 00 00       	call   3d0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 50 04 00 00       	call   662 <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 34 ff ff ff    	jne    152 <ls+0x52>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	push   -0x25c(%ebp)
 23a:	e8 21 03 00 00       	call   560 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 7e 02 00 00       	call   4d0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 00 0b 00 00       	push   $0xb00
 2a7:	6a 01                	push   $0x1
 2a9:	e8 02 05 00 00       	call   7b0 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 d8 0a 00 00       	push   $0xad8
 2c9:	6a 02                	push   $0x2
 2cb:	e8 e0 04 00 00       	call   7b0 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 0d 0b 00 00       	push   $0xb0d
 2e8:	6a 01                	push   $0x1
 2ea:	e8 c1 04 00 00       	call   7b0 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5b fe ff ff       	jmp    152 <ls+0x52>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 ec 0a 00 00       	push   $0xaec
 309:	6a 02                	push   $0x2
 30b:	e8 a0 04 00 00       	call   7b0 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 5a 03 00 00       	call   672 <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 ec 0a 00 00       	push   $0xaec
 331:	6a 01                	push   $0x1
 333:	e8 78 04 00 00       	call   7b0 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
typedef struct __lock_t {
  int flag;
} lock_t;
char*
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	31 c0                	xor    %eax,%eax
{
 343:	89 e5                	mov    %esp,%ebp
 345:	53                   	push   %ebx
 346:	8b 4d 08             	mov    0x8(%ebp),%ecx
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 361:	89 c8                	mov    %ecx,%eax
 363:	c9                   	leave  
 364:	c3                   	ret    
 365:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
 377:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 37a:	0f b6 02             	movzbl (%edx),%eax
 37d:	84 c0                	test   %al,%al
 37f:	75 17                	jne    398 <strcmp+0x28>
 381:	eb 3a                	jmp    3bd <strcmp+0x4d>
 383:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 387:	90                   	nop
 388:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 38c:	83 c2 01             	add    $0x1,%edx
 38f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 392:	84 c0                	test   %al,%al
 394:	74 1a                	je     3b0 <strcmp+0x40>
    p++, q++;
 396:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 398:	0f b6 19             	movzbl (%ecx),%ebx
 39b:	38 c3                	cmp    %al,%bl
 39d:	74 e9                	je     388 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 39f:	29 d8                	sub    %ebx,%eax
}
 3a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a4:	c9                   	leave  
 3a5:	c3                   	ret    
 3a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3b4:	31 c0                	xor    %eax,%eax
 3b6:	29 d8                	sub    %ebx,%eax
}
 3b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3bb:	c9                   	leave  
 3bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3bd:	0f b6 19             	movzbl (%ecx),%ebx
 3c0:	31 c0                	xor    %eax,%eax
 3c2:	eb db                	jmp    39f <strcmp+0x2f>
 3c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <strlen>:

uint
strlen(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3d6:	80 3a 00             	cmpb   $0x0,(%edx)
 3d9:	74 15                	je     3f0 <strlen+0x20>
 3db:	31 c0                	xor    %eax,%eax
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	83 c0 01             	add    $0x1,%eax
 3e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3e7:	89 c1                	mov    %eax,%ecx
 3e9:	75 f5                	jne    3e0 <strlen+0x10>
    ;
  return n;
}
 3eb:	89 c8                	mov    %ecx,%eax
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    
 3ef:	90                   	nop
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld    
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	8b 7d fc             	mov    -0x4(%ebp),%edi
 415:	89 d0                	mov    %edx,%eax
 417:	c9                   	leave  
 418:	c3                   	ret    
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42a:	0f b6 10             	movzbl (%eax),%edx
 42d:	84 d2                	test   %dl,%dl
 42f:	75 12                	jne    443 <strchr+0x23>
 431:	eb 1d                	jmp    450 <strchr+0x30>
 433:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 437:	90                   	nop
 438:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 43c:	83 c0 01             	add    $0x1,%eax
 43f:	84 d2                	test   %dl,%dl
 441:	74 0d                	je     450 <strchr+0x30>
    if(*s == c)
 443:	38 d1                	cmp    %dl,%cl
 445:	75 f1                	jne    438 <strchr+0x18>
      return (char*)s;
  return 0;
}
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 450:	31 c0                	xor    %eax,%eax
}
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    
 454:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 465:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 468:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 469:	31 db                	xor    %ebx,%ebx
{
 46b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 46e:	eb 27                	jmp    497 <gets+0x37>
    cc = read(0, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	6a 00                	push   $0x0
 478:	e8 e5 01 00 00       	call   662 <read>
    if(cc < 1)
 47d:	83 c4 10             	add    $0x10,%esp
 480:	85 c0                	test   %eax,%eax
 482:	7e 1d                	jle    4a1 <gets+0x41>
      break;
    buf[i++] = c;
 484:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 488:	8b 55 08             	mov    0x8(%ebp),%edx
 48b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 48f:	3c 0a                	cmp    $0xa,%al
 491:	74 1d                	je     4b0 <gets+0x50>
 493:	3c 0d                	cmp    $0xd,%al
 495:	74 19                	je     4b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 497:	89 de                	mov    %ebx,%esi
 499:	83 c3 01             	add    $0x1,%ebx
 49c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 49f:	7c cf                	jl     470 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ab:	5b                   	pop    %ebx
 4ac:	5e                   	pop    %esi
 4ad:	5f                   	pop    %edi
 4ae:	5d                   	pop    %ebp
 4af:	c3                   	ret    
  buf[i] = '\0';
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	89 de                	mov    %ebx,%esi
 4b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bc:	5b                   	pop    %ebx
 4bd:	5e                   	pop    %esi
 4be:	5f                   	pop    %edi
 4bf:	5d                   	pop    %ebp
 4c0:	c3                   	ret    
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop

000004d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d5:	83 ec 08             	sub    $0x8,%esp
 4d8:	6a 00                	push   $0x0
 4da:	ff 75 08             	push   0x8(%ebp)
 4dd:	e8 a8 01 00 00       	call   68a <open>
  if(fd < 0)
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	85 c0                	test   %eax,%eax
 4e7:	78 27                	js     510 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	ff 75 0c             	push   0xc(%ebp)
 4ef:	89 c3                	mov    %eax,%ebx
 4f1:	50                   	push   %eax
 4f2:	e8 ab 01 00 00       	call   6a2 <fstat>
  close(fd);
 4f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4fa:	89 c6                	mov    %eax,%esi
  close(fd);
 4fc:	e8 71 01 00 00       	call   672 <close>
  return r;
 501:	83 c4 10             	add    $0x10,%esp
}
 504:	8d 65 f8             	lea    -0x8(%ebp),%esp
 507:	89 f0                	mov    %esi,%eax
 509:	5b                   	pop    %ebx
 50a:	5e                   	pop    %esi
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    
 50d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 510:	be ff ff ff ff       	mov    $0xffffffff,%esi
 515:	eb ed                	jmp    504 <stat+0x34>
 517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51e:	66 90                	xchg   %ax,%ax

00000520 <atoi>:

int
atoi(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	53                   	push   %ebx
 524:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 527:	0f be 02             	movsbl (%edx),%eax
 52a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 52d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 530:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 535:	77 1e                	ja     555 <atoi+0x35>
 537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 540:	83 c2 01             	add    $0x1,%edx
 543:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 546:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 54a:	0f be 02             	movsbl (%edx),%eax
 54d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 550:	80 fb 09             	cmp    $0x9,%bl
 553:	76 eb                	jbe    540 <atoi+0x20>
  return n;
}
 555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 558:	89 c8                	mov    %ecx,%eax
 55a:	c9                   	leave  
 55b:	c3                   	ret    
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	8b 45 10             	mov    0x10(%ebp),%eax
 567:	8b 55 08             	mov    0x8(%ebp),%edx
 56a:	56                   	push   %esi
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56e:	85 c0                	test   %eax,%eax
 570:	7e 13                	jle    585 <memmove+0x25>
 572:	01 d0                	add    %edx,%eax
  dst = vdst;
 574:	89 d7                	mov    %edx,%edi
 576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 580:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 581:	39 f8                	cmp    %edi,%eax
 583:	75 fb                	jne    580 <memmove+0x20>
  return vdst;
}
 585:	5e                   	pop    %esi
 586:	89 d0                	mov    %edx,%eax
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    
 58b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
  *oldpointer = new;
 596:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *oldpointer;
 599:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 59b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 59d:	5d                   	pop    %ebp
 59e:	89 d0                	mov    %edx,%eax
 5a0:	c3                   	ret    
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <lock_init>:
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5bc:	5d                   	pop    %ebp
 5bd:	c3                   	ret    
 5be:	66 90                	xchg   %ax,%ax

000005c0 <lock_acquire>:
void 
lock_init(lock_t *lock){
  lock->flag = 0;
}
void 
lock_acquire(lock_t *lock){
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
  while(TestAndSet(&lock->flag, 1)==1)
 5c6:	83 38 01             	cmpl   $0x1,(%eax)
 5c9:	75 05                	jne    5d0 <lock_acquire+0x10>
 5cb:	eb fe                	jmp    5cb <lock_acquire+0xb>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
 5d0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret    
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <lock_release>:
void 
lock_release(lock_t *lock){
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
  lock->flag =0;
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 5ec:	5d                   	pop    %ebp
 5ed:	c3                   	ret    
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    stack = malloc(PGSIZE);
 5f6:	68 00 10 00 00       	push   $0x1000
 5fb:	e8 e0 03 00 00       	call   9e0 <malloc>
    return clone(start_routine, arg1, arg2, stack);
 600:	50                   	push   %eax
 601:	ff 75 10             	push   0x10(%ebp)
 604:	ff 75 0c             	push   0xc(%ebp)
 607:	ff 75 08             	push   0x8(%ebp)
 60a:	e8 db 00 00 00       	call   6ea <clone>
}
 60f:	c9                   	leave  
 610:	c3                   	ret    
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <thread_join>:
int 
thread_join(){
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	53                   	push   %ebx
  void *stack;
  int waitedForPID = join(&stack);
 624:	8d 45 f4             	lea    -0xc(%ebp),%eax
thread_join(){
 627:	83 ec 20             	sub    $0x20,%esp
  int waitedForPID = join(&stack);
 62a:	50                   	push   %eax
 62b:	e8 c2 00 00 00       	call   6f2 <join>
 630:	89 c3                	mov    %eax,%ebx
  free(stack);
 632:	58                   	pop    %eax
 633:	ff 75 f4             	push   -0xc(%ebp)
 636:	e8 15 03 00 00       	call   950 <free>
  return waitedForPID;
 63b:	89 d8                	mov    %ebx,%eax
 63d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 640:	c9                   	leave  
 641:	c3                   	ret    

00000642 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 642:	b8 01 00 00 00       	mov    $0x1,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <exit>:
SYSCALL(exit)
 64a:	b8 02 00 00 00       	mov    $0x2,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <wait>:
SYSCALL(wait)
 652:	b8 03 00 00 00       	mov    $0x3,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <pipe>:
SYSCALL(pipe)
 65a:	b8 04 00 00 00       	mov    $0x4,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <read>:
SYSCALL(read)
 662:	b8 05 00 00 00       	mov    $0x5,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <write>:
SYSCALL(write)
 66a:	b8 10 00 00 00       	mov    $0x10,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <close>:
SYSCALL(close)
 672:	b8 15 00 00 00       	mov    $0x15,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <kill>:
SYSCALL(kill)
 67a:	b8 06 00 00 00       	mov    $0x6,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <exec>:
SYSCALL(exec)
 682:	b8 07 00 00 00       	mov    $0x7,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <open>:
SYSCALL(open)
 68a:	b8 0f 00 00 00       	mov    $0xf,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <mknod>:
SYSCALL(mknod)
 692:	b8 11 00 00 00       	mov    $0x11,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <unlink>:
SYSCALL(unlink)
 69a:	b8 12 00 00 00       	mov    $0x12,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <fstat>:
SYSCALL(fstat)
 6a2:	b8 08 00 00 00       	mov    $0x8,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <link>:
SYSCALL(link)
 6aa:	b8 13 00 00 00       	mov    $0x13,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <mkdir>:
SYSCALL(mkdir)
 6b2:	b8 14 00 00 00       	mov    $0x14,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <chdir>:
SYSCALL(chdir)
 6ba:	b8 09 00 00 00       	mov    $0x9,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <dup>:
SYSCALL(dup)
 6c2:	b8 0a 00 00 00       	mov    $0xa,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <getpid>:
SYSCALL(getpid)
 6ca:	b8 0b 00 00 00       	mov    $0xb,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <sbrk>:
SYSCALL(sbrk)
 6d2:	b8 0c 00 00 00       	mov    $0xc,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <sleep>:
SYSCALL(sleep)
 6da:	b8 0d 00 00 00       	mov    $0xd,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <uptime>:
SYSCALL(uptime)
 6e2:	b8 0e 00 00 00       	mov    $0xe,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <clone>:
SYSCALL(clone)
 6ea:	b8 16 00 00 00       	mov    $0x16,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <join>:
SYSCALL(join)
 6f2:	b8 17 00 00 00       	mov    $0x17,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    
 6fa:	66 90                	xchg   %ax,%ax
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 3c             	sub    $0x3c,%esp
 709:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 70c:	89 d1                	mov    %edx,%ecx
{
 70e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 711:	85 d2                	test   %edx,%edx
 713:	0f 89 7f 00 00 00    	jns    798 <printint+0x98>
 719:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 71d:	74 79                	je     798 <printint+0x98>
    neg = 1;
 71f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 726:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 728:	31 db                	xor    %ebx,%ebx
 72a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 730:	89 c8                	mov    %ecx,%eax
 732:	31 d2                	xor    %edx,%edx
 734:	89 cf                	mov    %ecx,%edi
 736:	f7 75 c4             	divl   -0x3c(%ebp)
 739:	0f b6 92 84 0b 00 00 	movzbl 0xb84(%edx),%edx
 740:	89 45 c0             	mov    %eax,-0x40(%ebp)
 743:	89 d8                	mov    %ebx,%eax
 745:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 748:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 74b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 74e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 751:	76 dd                	jbe    730 <printint+0x30>
  if(neg)
 753:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 756:	85 c9                	test   %ecx,%ecx
 758:	74 0c                	je     766 <printint+0x66>
    buf[i++] = '-';
 75a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 75f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 761:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 766:	8b 7d b8             	mov    -0x48(%ebp),%edi
 769:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 76d:	eb 07                	jmp    776 <printint+0x76>
 76f:	90                   	nop
    putc(fd, buf[i]);
 770:	0f b6 13             	movzbl (%ebx),%edx
 773:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 776:	83 ec 04             	sub    $0x4,%esp
 779:	88 55 d7             	mov    %dl,-0x29(%ebp)
 77c:	6a 01                	push   $0x1
 77e:	56                   	push   %esi
 77f:	57                   	push   %edi
 780:	e8 e5 fe ff ff       	call   66a <write>
  while(--i >= 0)
 785:	83 c4 10             	add    $0x10,%esp
 788:	39 de                	cmp    %ebx,%esi
 78a:	75 e4                	jne    770 <printint+0x70>
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 798:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 79f:	eb 87                	jmp    728 <printint+0x28>
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop

000007b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7bf:	0f b6 13             	movzbl (%ebx),%edx
 7c2:	84 d2                	test   %dl,%dl
 7c4:	74 6a                	je     830 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7c6:	8d 45 10             	lea    0x10(%ebp),%eax
 7c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 7d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7d4:	eb 36                	jmp    80c <printf+0x5c>
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
 7e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 7e8:	83 f8 25             	cmp    $0x25,%eax
 7eb:	74 15                	je     802 <printf+0x52>
  write(fd, &c, 1);
 7ed:	83 ec 04             	sub    $0x4,%esp
 7f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7f3:	6a 01                	push   $0x1
 7f5:	57                   	push   %edi
 7f6:	56                   	push   %esi
 7f7:	e8 6e fe ff ff       	call   66a <write>
 7fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 7ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 802:	0f b6 13             	movzbl (%ebx),%edx
 805:	83 c3 01             	add    $0x1,%ebx
 808:	84 d2                	test   %dl,%dl
 80a:	74 24                	je     830 <printf+0x80>
    c = fmt[i] & 0xff;
 80c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 80f:	85 c9                	test   %ecx,%ecx
 811:	74 cd                	je     7e0 <printf+0x30>
      }
    } else if(state == '%'){
 813:	83 f9 25             	cmp    $0x25,%ecx
 816:	75 ea                	jne    802 <printf+0x52>
      if(c == 'd'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	0f 84 07 01 00 00    	je     928 <printf+0x178>
 821:	83 e8 63             	sub    $0x63,%eax
 824:	83 f8 15             	cmp    $0x15,%eax
 827:	77 17                	ja     840 <printf+0x90>
 829:	ff 24 85 2c 0b 00 00 	jmp    *0xb2c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 830:	8d 65 f4             	lea    -0xc(%ebp),%esp
 833:	5b                   	pop    %ebx
 834:	5e                   	pop    %esi
 835:	5f                   	pop    %edi
 836:	5d                   	pop    %ebp
 837:	c3                   	ret    
 838:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83f:	90                   	nop
  write(fd, &c, 1);
 840:	83 ec 04             	sub    $0x4,%esp
 843:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 846:	6a 01                	push   $0x1
 848:	57                   	push   %edi
 849:	56                   	push   %esi
 84a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 84e:	e8 17 fe ff ff       	call   66a <write>
        putc(fd, c);
 853:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 857:	83 c4 0c             	add    $0xc,%esp
 85a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 85d:	6a 01                	push   $0x1
 85f:	57                   	push   %edi
 860:	56                   	push   %esi
 861:	e8 04 fe ff ff       	call   66a <write>
        putc(fd, c);
 866:	83 c4 10             	add    $0x10,%esp
      state = 0;
 869:	31 c9                	xor    %ecx,%ecx
 86b:	eb 95                	jmp    802 <printf+0x52>
 86d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	b9 10 00 00 00       	mov    $0x10,%ecx
 878:	6a 00                	push   $0x0
 87a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 87d:	8b 10                	mov    (%eax),%edx
 87f:	89 f0                	mov    %esi,%eax
 881:	e8 7a fe ff ff       	call   700 <printint>
        ap++;
 886:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 88a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 88d:	31 c9                	xor    %ecx,%ecx
 88f:	e9 6e ff ff ff       	jmp    802 <printf+0x52>
 894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 898:	8b 45 d0             	mov    -0x30(%ebp),%eax
 89b:	8b 10                	mov    (%eax),%edx
        ap++;
 89d:	83 c0 04             	add    $0x4,%eax
 8a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8a3:	85 d2                	test   %edx,%edx
 8a5:	0f 84 8d 00 00 00    	je     938 <printf+0x188>
        while(*s != 0){
 8ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8b0:	84 c0                	test   %al,%al
 8b2:	0f 84 4a ff ff ff    	je     802 <printf+0x52>
 8b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8bb:	89 d3                	mov    %edx,%ebx
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8c3:	83 c3 01             	add    $0x1,%ebx
 8c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8c9:	6a 01                	push   $0x1
 8cb:	57                   	push   %edi
 8cc:	56                   	push   %esi
 8cd:	e8 98 fd ff ff       	call   66a <write>
        while(*s != 0){
 8d2:	0f b6 03             	movzbl (%ebx),%eax
 8d5:	83 c4 10             	add    $0x10,%esp
 8d8:	84 c0                	test   %al,%al
 8da:	75 e4                	jne    8c0 <printf+0x110>
      state = 0;
 8dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 8df:	31 c9                	xor    %ecx,%ecx
 8e1:	e9 1c ff ff ff       	jmp    802 <printf+0x52>
 8e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f8:	6a 01                	push   $0x1
 8fa:	e9 7b ff ff ff       	jmp    87a <printf+0xca>
 8ff:	90                   	nop
        putc(fd, *ap);
 900:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 906:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 908:	6a 01                	push   $0x1
 90a:	57                   	push   %edi
 90b:	56                   	push   %esi
        putc(fd, *ap);
 90c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 90f:	e8 56 fd ff ff       	call   66a <write>
        ap++;
 914:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 918:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91b:	31 c9                	xor    %ecx,%ecx
 91d:	e9 e0 fe ff ff       	jmp    802 <printf+0x52>
 922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 928:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 92b:	83 ec 04             	sub    $0x4,%esp
 92e:	e9 2a ff ff ff       	jmp    85d <printf+0xad>
 933:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 937:	90                   	nop
          s = "(null)";
 938:	ba 22 0b 00 00       	mov    $0xb22,%edx
        while(*s != 0){
 93d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 940:	b8 28 00 00 00       	mov    $0x28,%eax
 945:	89 d3                	mov    %edx,%ebx
 947:	e9 74 ff ff ff       	jmp    8c0 <printf+0x110>
 94c:	66 90                	xchg   %ax,%ax
 94e:	66 90                	xchg   %ax,%ax

00000950 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 950:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	a1 88 0f 00 00       	mov    0xf88,%eax
{
 956:	89 e5                	mov    %esp,%ebp
 958:	57                   	push   %edi
 959:	56                   	push   %esi
 95a:	53                   	push   %ebx
 95b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 95e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 968:	89 c2                	mov    %eax,%edx
 96a:	8b 00                	mov    (%eax),%eax
 96c:	39 ca                	cmp    %ecx,%edx
 96e:	73 30                	jae    9a0 <free+0x50>
 970:	39 c1                	cmp    %eax,%ecx
 972:	72 04                	jb     978 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 974:	39 c2                	cmp    %eax,%edx
 976:	72 f0                	jb     968 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 978:	8b 73 fc             	mov    -0x4(%ebx),%esi
 97b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 97e:	39 f8                	cmp    %edi,%eax
 980:	74 30                	je     9b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 982:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 985:	8b 42 04             	mov    0x4(%edx),%eax
 988:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 98b:	39 f1                	cmp    %esi,%ecx
 98d:	74 3a                	je     9c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 98f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 991:	5b                   	pop    %ebx
  freep = p;
 992:	89 15 88 0f 00 00    	mov    %edx,0xf88
}
 998:	5e                   	pop    %esi
 999:	5f                   	pop    %edi
 99a:	5d                   	pop    %ebp
 99b:	c3                   	ret    
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a0:	39 c2                	cmp    %eax,%edx
 9a2:	72 c4                	jb     968 <free+0x18>
 9a4:	39 c1                	cmp    %eax,%ecx
 9a6:	73 c0                	jae    968 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ae:	39 f8                	cmp    %edi,%eax
 9b0:	75 d0                	jne    982 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9b2:	03 70 04             	add    0x4(%eax),%esi
 9b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b8:	8b 02                	mov    (%edx),%eax
 9ba:	8b 00                	mov    (%eax),%eax
 9bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9bf:	8b 42 04             	mov    0x4(%edx),%eax
 9c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9c5:	39 f1                	cmp    %esi,%ecx
 9c7:	75 c6                	jne    98f <free+0x3f>
    p->s.size += bp->s.size;
 9c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9cc:	89 15 88 0f 00 00    	mov    %edx,0xf88
    p->s.size += bp->s.size;
 9d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9d8:	89 0a                	mov    %ecx,(%edx)
}
 9da:	5b                   	pop    %ebx
 9db:	5e                   	pop    %esi
 9dc:	5f                   	pop    %edi
 9dd:	5d                   	pop    %ebp
 9de:	c3                   	ret    
 9df:	90                   	nop

000009e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	57                   	push   %edi
 9e4:	56                   	push   %esi
 9e5:	53                   	push   %ebx
 9e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9ec:	8b 3d 88 0f 00 00    	mov    0xf88,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f2:	8d 70 07             	lea    0x7(%eax),%esi
 9f5:	c1 ee 03             	shr    $0x3,%esi
 9f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9fb:	85 ff                	test   %edi,%edi
 9fd:	0f 84 9d 00 00 00    	je     aa0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a03:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a05:	8b 4a 04             	mov    0x4(%edx),%ecx
 a08:	39 f1                	cmp    %esi,%ecx
 a0a:	73 6a                	jae    a76 <malloc+0x96>
 a0c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a11:	39 de                	cmp    %ebx,%esi
 a13:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a16:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a20:	eb 17                	jmp    a39 <malloc+0x59>
 a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a28:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a2a:	8b 48 04             	mov    0x4(%eax),%ecx
 a2d:	39 f1                	cmp    %esi,%ecx
 a2f:	73 4f                	jae    a80 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a31:	8b 3d 88 0f 00 00    	mov    0xf88,%edi
 a37:	89 c2                	mov    %eax,%edx
 a39:	39 d7                	cmp    %edx,%edi
 a3b:	75 eb                	jne    a28 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a3d:	83 ec 0c             	sub    $0xc,%esp
 a40:	ff 75 e4             	push   -0x1c(%ebp)
 a43:	e8 8a fc ff ff       	call   6d2 <sbrk>
  if(p == (char*)-1)
 a48:	83 c4 10             	add    $0x10,%esp
 a4b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a4e:	74 1c                	je     a6c <malloc+0x8c>
  hp->s.size = nu;
 a50:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a53:	83 ec 0c             	sub    $0xc,%esp
 a56:	83 c0 08             	add    $0x8,%eax
 a59:	50                   	push   %eax
 a5a:	e8 f1 fe ff ff       	call   950 <free>
  return freep;
 a5f:	8b 15 88 0f 00 00    	mov    0xf88,%edx
      if((p = morecore(nunits)) == 0)
 a65:	83 c4 10             	add    $0x10,%esp
 a68:	85 d2                	test   %edx,%edx
 a6a:	75 bc                	jne    a28 <malloc+0x48>
        return 0;
  }
}
 a6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a6f:	31 c0                	xor    %eax,%eax
}
 a71:	5b                   	pop    %ebx
 a72:	5e                   	pop    %esi
 a73:	5f                   	pop    %edi
 a74:	5d                   	pop    %ebp
 a75:	c3                   	ret    
    if(p->s.size >= nunits){
 a76:	89 d0                	mov    %edx,%eax
 a78:	89 fa                	mov    %edi,%edx
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a80:	39 ce                	cmp    %ecx,%esi
 a82:	74 4c                	je     ad0 <malloc+0xf0>
        p->s.size -= nunits;
 a84:	29 f1                	sub    %esi,%ecx
 a86:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a89:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a8c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a8f:	89 15 88 0f 00 00    	mov    %edx,0xf88
}
 a95:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a98:	83 c0 08             	add    $0x8,%eax
}
 a9b:	5b                   	pop    %ebx
 a9c:	5e                   	pop    %esi
 a9d:	5f                   	pop    %edi
 a9e:	5d                   	pop    %ebp
 a9f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 aa0:	c7 05 88 0f 00 00 8c 	movl   $0xf8c,0xf88
 aa7:	0f 00 00 
    base.s.size = 0;
 aaa:	bf 8c 0f 00 00       	mov    $0xf8c,%edi
    base.s.ptr = freep = prevp = &base;
 aaf:	c7 05 8c 0f 00 00 8c 	movl   $0xf8c,0xf8c
 ab6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 abb:	c7 05 90 0f 00 00 00 	movl   $0x0,0xf90
 ac2:	00 00 00 
    if(p->s.size >= nunits){
 ac5:	e9 42 ff ff ff       	jmp    a0c <malloc+0x2c>
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ad0:	8b 08                	mov    (%eax),%ecx
 ad2:	89 0a                	mov    %ecx,(%edx)
 ad4:	eb b9                	jmp    a8f <malloc+0xaf>
