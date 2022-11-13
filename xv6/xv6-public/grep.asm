
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
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
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	75 2d                	jne    62 <main+0x62>
  35:	eb 6c                	jmp    a3 <main+0xa3>
  37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	push   -0x20(%ebp)
  4d:	e8 7e 01 00 00       	call   1d0 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 48 06 00 00       	call   6a2 <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	push   (%ebx)
  69:	e8 4c 06 00 00       	call   6ba <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	push   (%ebx)
  7a:	68 28 0b 00 00       	push   $0xb28
  7f:	6a 01                	push   $0x1
  81:	e8 5a 07 00 00       	call   7e0 <printf>
      exit();
  86:	e8 ef 05 00 00       	call   67a <exit>
  }
  exit();
  8b:	e8 ea 05 00 00       	call   67a <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 08 0b 00 00       	push   $0xb08
  97:	6a 02                	push   $0x2
  99:	e8 42 07 00 00       	call   7e0 <printf>
    exit();
  9e:	e8 d7 05 00 00       	call   67a <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 23 01 00 00       	call   1d0 <grep>
    exit();
  ad:	e8 c8 05 00 00       	call   67a <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 0c             	sub    $0xc,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
  cf:	0f b6 06             	movzbl (%esi),%eax
  d2:	84 c0                	test   %al,%al
  d4:	75 2d                	jne    103 <matchhere+0x43>
  d6:	e9 7d 00 00 00       	jmp    158 <matchhere+0x98>
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  e0:	0f b6 0f             	movzbl (%edi),%ecx
  if(re[0] == '$' && re[1] == '\0')
  e3:	80 fb 24             	cmp    $0x24,%bl
  e6:	75 04                	jne    ec <matchhere+0x2c>
  e8:	84 c0                	test   %al,%al
  ea:	74 79                	je     165 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  ec:	84 c9                	test   %cl,%cl
  ee:	74 58                	je     148 <matchhere+0x88>
  f0:	38 d9                	cmp    %bl,%cl
  f2:	74 05                	je     f9 <matchhere+0x39>
  f4:	80 fb 2e             	cmp    $0x2e,%bl
  f7:	75 4f                	jne    148 <matchhere+0x88>
    return matchhere(re+1, text+1);
  f9:	83 c7 01             	add    $0x1,%edi
  fc:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
  ff:	84 c0                	test   %al,%al
 101:	74 55                	je     158 <matchhere+0x98>
  if(re[1] == '*')
 103:	0f be d8             	movsbl %al,%ebx
 106:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 10a:	3c 2a                	cmp    $0x2a,%al
 10c:	75 d2                	jne    e0 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 10e:	83 c6 02             	add    $0x2,%esi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 118:	83 ec 08             	sub    $0x8,%esp
 11b:	57                   	push   %edi
 11c:	56                   	push   %esi
 11d:	e8 9e ff ff ff       	call   c0 <matchhere>
 122:	83 c4 10             	add    $0x10,%esp
 125:	85 c0                	test   %eax,%eax
 127:	75 2f                	jne    158 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 129:	0f be 17             	movsbl (%edi),%edx
 12c:	84 d2                	test   %dl,%dl
 12e:	74 0c                	je     13c <matchhere+0x7c>
 130:	83 c7 01             	add    $0x1,%edi
 133:	83 fb 2e             	cmp    $0x2e,%ebx
 136:	74 e0                	je     118 <matchhere+0x58>
 138:	39 da                	cmp    %ebx,%edx
 13a:	74 dc                	je     118 <matchhere+0x58>
}
 13c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13f:	5b                   	pop    %ebx
 140:	5e                   	pop    %esi
 141:	5f                   	pop    %edi
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14b:	31 c0                	xor    %eax,%eax
}
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 15b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 160:	5b                   	pop    %ebx
 161:	5e                   	pop    %esi
 162:	5f                   	pop    %edi
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
    return *text == '\0';
 165:	31 c0                	xor    %eax,%eax
 167:	84 c9                	test   %cl,%cl
 169:	0f 94 c0             	sete   %al
 16c:	eb ce                	jmp    13c <matchhere+0x7c>
 16e:	66 90                	xchg   %ax,%ax

00000170 <match>:
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 5d 08             	mov    0x8(%ebp),%ebx
 178:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 17b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 17e:	75 11                	jne    191 <match+0x21>
 180:	eb 2e                	jmp    1b0 <match+0x40>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 188:	83 c6 01             	add    $0x1,%esi
 18b:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 18f:	74 16                	je     1a7 <match+0x37>
    if(matchhere(re, text))
 191:	83 ec 08             	sub    $0x8,%esp
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
 196:	e8 25 ff ff ff       	call   c0 <matchhere>
 19b:	83 c4 10             	add    $0x10,%esp
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 e6                	je     188 <match+0x18>
      return 1;
 1a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 1b0:	83 c3 01             	add    $0x1,%ebx
 1b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1bc:	e9 ff fe ff ff       	jmp    c0 <matchhere>
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <grep>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 1c             	sub    $0x1c,%esp
 1d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 1dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
 1e3:	8d 47 01             	lea    0x1(%edi),%eax
 1e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 1f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 1f3:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 1f8:	83 ec 04             	sub    $0x4,%esp
 1fb:	29 c8                	sub    %ecx,%eax
 1fd:	50                   	push   %eax
 1fe:	8d 81 20 10 00 00    	lea    0x1020(%ecx),%eax
 204:	50                   	push   %eax
 205:	ff 75 0c             	push   0xc(%ebp)
 208:	e8 85 04 00 00       	call   692 <read>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	0f 8e e5 00 00 00    	jle    2fd <grep+0x12d>
    m += n;
 218:	01 45 dc             	add    %eax,-0x24(%ebp)
 21b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
 21e:	c7 45 e4 20 10 00 00 	movl   $0x1020,-0x1c(%ebp)
    buf[m] = '\0';
 225:	c6 81 20 10 00 00 00 	movb   $0x0,0x1020(%ecx)
    while((q = strchr(p, '\n')) != 0){
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 0a                	push   $0xa
 235:	ff 75 e4             	push   -0x1c(%ebp)
 238:	e8 13 02 00 00       	call   450 <strchr>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	89 c3                	mov    %eax,%ebx
 242:	85 c0                	test   %eax,%eax
 244:	74 72                	je     2b8 <grep+0xe8>
      *q = 0;
 246:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
 249:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
 24c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
 24f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 252:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
 255:	75 12                	jne    269 <grep+0x99>
 257:	eb 47                	jmp    2a0 <grep+0xd0>
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
 260:	83 c6 01             	add    $0x1,%esi
 263:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 267:	74 2b                	je     294 <grep+0xc4>
    if(matchhere(re, text))
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	56                   	push   %esi
 26d:	57                   	push   %edi
 26e:	e8 4d fe ff ff       	call   c0 <matchhere>
 273:	83 c4 10             	add    $0x10,%esp
 276:	85 c0                	test   %eax,%eax
 278:	74 e6                	je     260 <grep+0x90>
        write(1, p, q+1 - p);
 27a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 27d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 280:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 283:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 286:	29 d0                	sub    %edx,%eax
 288:	50                   	push   %eax
 289:	52                   	push   %edx
 28a:	6a 01                	push   $0x1
 28c:	e8 09 04 00 00       	call   69a <write>
 291:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 294:	8b 45 e0             	mov    -0x20(%ebp),%eax
 297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 29a:	eb 94                	jmp    230 <grep+0x60>
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	56                   	push   %esi
 2a4:	ff 75 d8             	push   -0x28(%ebp)
 2a7:	e8 14 fe ff ff       	call   c0 <matchhere>
 2ac:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
 2af:	85 c0                	test   %eax,%eax
 2b1:	74 e1                	je     294 <grep+0xc4>
 2b3:	eb c5                	jmp    27a <grep+0xaa>
 2b5:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
 2b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2bb:	81 fa 20 10 00 00    	cmp    $0x1020,%edx
 2c1:	74 2e                	je     2f1 <grep+0x121>
    if(m > 0){
 2c3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 2c6:	85 c9                	test   %ecx,%ecx
 2c8:	0f 8e 22 ff ff ff    	jle    1f0 <grep+0x20>
      m -= p - buf;
 2ce:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
 2d0:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2d3:	2d 20 10 00 00       	sub    $0x1020,%eax
 2d8:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2da:	51                   	push   %ecx
 2db:	52                   	push   %edx
 2dc:	68 20 10 00 00       	push   $0x1020
      m -= p - buf;
 2e1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
 2e4:	e8 a7 02 00 00       	call   590 <memmove>
 2e9:	83 c4 10             	add    $0x10,%esp
 2ec:	e9 ff fe ff ff       	jmp    1f0 <grep+0x20>
      m = 0;
 2f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 2f8:	e9 f3 fe ff ff       	jmp    1f0 <grep+0x20>
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <matchstar>:
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	8b 5d 08             	mov    0x8(%ebp),%ebx
 31c:	8b 75 0c             	mov    0xc(%ebp),%esi
 31f:	8b 7d 10             	mov    0x10(%ebp),%edi
 322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 328:	83 ec 08             	sub    $0x8,%esp
 32b:	57                   	push   %edi
 32c:	56                   	push   %esi
 32d:	e8 8e fd ff ff       	call   c0 <matchhere>
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	75 1f                	jne    358 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
 339:	0f be 17             	movsbl (%edi),%edx
 33c:	84 d2                	test   %dl,%dl
 33e:	74 0c                	je     34c <matchstar+0x3c>
 340:	83 c7 01             	add    $0x1,%edi
 343:	39 da                	cmp    %ebx,%edx
 345:	74 e1                	je     328 <matchstar+0x18>
 347:	83 fb 2e             	cmp    $0x2e,%ebx
 34a:	74 dc                	je     328 <matchstar+0x18>
}
 34c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34f:	5b                   	pop    %ebx
 350:	5e                   	pop    %esi
 351:	5f                   	pop    %edi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 358:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 360:	5b                   	pop    %ebx
 361:	5e                   	pop    %esi
 362:	5f                   	pop    %edi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <strcpy>:
typedef struct __lock_t {
  int flag;
} lock_t;
char*
strcpy(char *s, const char *t)
{
 370:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 371:	31 c0                	xor    %eax,%eax
{
 373:	89 e5                	mov    %esp,%ebp
 375:	53                   	push   %ebx
 376:	8b 4d 08             	mov    0x8(%ebp),%ecx
 379:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 380:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 384:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 387:	83 c0 01             	add    $0x1,%eax
 38a:	84 d2                	test   %dl,%dl
 38c:	75 f2                	jne    380 <strcpy+0x10>
    ;
  return os;
}
 38e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 391:	89 c8                	mov    %ecx,%eax
 393:	c9                   	leave  
 394:	c3                   	ret    
 395:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
 3a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3aa:	0f b6 02             	movzbl (%edx),%eax
 3ad:	84 c0                	test   %al,%al
 3af:	75 17                	jne    3c8 <strcmp+0x28>
 3b1:	eb 3a                	jmp    3ed <strcmp+0x4d>
 3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b7:	90                   	nop
 3b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3bc:	83 c2 01             	add    $0x1,%edx
 3bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3c2:	84 c0                	test   %al,%al
 3c4:	74 1a                	je     3e0 <strcmp+0x40>
    p++, q++;
 3c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3c8:	0f b6 19             	movzbl (%ecx),%ebx
 3cb:	38 c3                	cmp    %al,%bl
 3cd:	74 e9                	je     3b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3cf:	29 d8                	sub    %ebx,%eax
}
 3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3e4:	31 c0                	xor    %eax,%eax
 3e6:	29 d8                	sub    %ebx,%eax
}
 3e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3eb:	c9                   	leave  
 3ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3ed:	0f b6 19             	movzbl (%ecx),%ebx
 3f0:	31 c0                	xor    %eax,%eax
 3f2:	eb db                	jmp    3cf <strcmp+0x2f>
 3f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <strlen>:

uint
strlen(const char *s)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 406:	80 3a 00             	cmpb   $0x0,(%edx)
 409:	74 15                	je     420 <strlen+0x20>
 40b:	31 c0                	xor    %eax,%eax
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	83 c0 01             	add    $0x1,%eax
 413:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 417:	89 c1                	mov    %eax,%ecx
 419:	75 f5                	jne    410 <strlen+0x10>
    ;
  return n;
}
 41b:	89 c8                	mov    %ecx,%eax
 41d:	5d                   	pop    %ebp
 41e:	c3                   	ret    
 41f:	90                   	nop
  for(n = 0; s[n]; n++)
 420:	31 c9                	xor    %ecx,%ecx
}
 422:	5d                   	pop    %ebp
 423:	89 c8                	mov    %ecx,%eax
 425:	c3                   	ret    
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <memset>:

void*
memset(void *dst, int c, uint n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 437:	8b 4d 10             	mov    0x10(%ebp),%ecx
 43a:	8b 45 0c             	mov    0xc(%ebp),%eax
 43d:	89 d7                	mov    %edx,%edi
 43f:	fc                   	cld    
 440:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 442:	8b 7d fc             	mov    -0x4(%ebp),%edi
 445:	89 d0                	mov    %edx,%eax
 447:	c9                   	leave  
 448:	c3                   	ret    
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000450 <strchr>:

char*
strchr(const char *s, char c)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 45a:	0f b6 10             	movzbl (%eax),%edx
 45d:	84 d2                	test   %dl,%dl
 45f:	75 12                	jne    473 <strchr+0x23>
 461:	eb 1d                	jmp    480 <strchr+0x30>
 463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 467:	90                   	nop
 468:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 46c:	83 c0 01             	add    $0x1,%eax
 46f:	84 d2                	test   %dl,%dl
 471:	74 0d                	je     480 <strchr+0x30>
    if(*s == c)
 473:	38 d1                	cmp    %dl,%cl
 475:	75 f1                	jne    468 <strchr+0x18>
      return (char*)s;
  return 0;
}
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 480:	31 c0                	xor    %eax,%eax
}
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <gets>:

char*
gets(char *buf, int max)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 495:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 498:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 499:	31 db                	xor    %ebx,%ebx
{
 49b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 49e:	eb 27                	jmp    4c7 <gets+0x37>
    cc = read(0, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	6a 01                	push   $0x1
 4a5:	57                   	push   %edi
 4a6:	6a 00                	push   $0x0
 4a8:	e8 e5 01 00 00       	call   692 <read>
    if(cc < 1)
 4ad:	83 c4 10             	add    $0x10,%esp
 4b0:	85 c0                	test   %eax,%eax
 4b2:	7e 1d                	jle    4d1 <gets+0x41>
      break;
    buf[i++] = c;
 4b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4b8:	8b 55 08             	mov    0x8(%ebp),%edx
 4bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4bf:	3c 0a                	cmp    $0xa,%al
 4c1:	74 1d                	je     4e0 <gets+0x50>
 4c3:	3c 0d                	cmp    $0xd,%al
 4c5:	74 19                	je     4e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4c7:	89 de                	mov    %ebx,%esi
 4c9:	83 c3 01             	add    $0x1,%ebx
 4cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4cf:	7c cf                	jl     4a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4db:	5b                   	pop    %ebx
 4dc:	5e                   	pop    %esi
 4dd:	5f                   	pop    %edi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    
  buf[i] = '\0';
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	89 de                	mov    %ebx,%esi
 4e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ec:	5b                   	pop    %ebx
 4ed:	5e                   	pop    %esi
 4ee:	5f                   	pop    %edi
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret    
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <stat>:

int
stat(const char *n, struct stat *st)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 505:	83 ec 08             	sub    $0x8,%esp
 508:	6a 00                	push   $0x0
 50a:	ff 75 08             	push   0x8(%ebp)
 50d:	e8 a8 01 00 00       	call   6ba <open>
  if(fd < 0)
 512:	83 c4 10             	add    $0x10,%esp
 515:	85 c0                	test   %eax,%eax
 517:	78 27                	js     540 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 519:	83 ec 08             	sub    $0x8,%esp
 51c:	ff 75 0c             	push   0xc(%ebp)
 51f:	89 c3                	mov    %eax,%ebx
 521:	50                   	push   %eax
 522:	e8 ab 01 00 00       	call   6d2 <fstat>
  close(fd);
 527:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 52a:	89 c6                	mov    %eax,%esi
  close(fd);
 52c:	e8 71 01 00 00       	call   6a2 <close>
  return r;
 531:	83 c4 10             	add    $0x10,%esp
}
 534:	8d 65 f8             	lea    -0x8(%ebp),%esp
 537:	89 f0                	mov    %esi,%eax
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 540:	be ff ff ff ff       	mov    $0xffffffff,%esi
 545:	eb ed                	jmp    534 <stat+0x34>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax

00000550 <atoi>:

int
atoi(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 557:	0f be 02             	movsbl (%edx),%eax
 55a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 55d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 560:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 565:	77 1e                	ja     585 <atoi+0x35>
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 570:	83 c2 01             	add    $0x1,%edx
 573:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 576:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 57a:	0f be 02             	movsbl (%edx),%eax
 57d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 580:	80 fb 09             	cmp    $0x9,%bl
 583:	76 eb                	jbe    570 <atoi+0x20>
  return n;
}
 585:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 588:	89 c8                	mov    %ecx,%eax
 58a:	c9                   	leave  
 58b:	c3                   	ret    
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	8b 45 10             	mov    0x10(%ebp),%eax
 597:	8b 55 08             	mov    0x8(%ebp),%edx
 59a:	56                   	push   %esi
 59b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 59e:	85 c0                	test   %eax,%eax
 5a0:	7e 13                	jle    5b5 <memmove+0x25>
 5a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5a4:	89 d7                	mov    %edx,%edi
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5b1:	39 f8                	cmp    %edi,%eax
 5b3:	75 fb                	jne    5b0 <memmove+0x20>
  return vdst;
}
 5b5:	5e                   	pop    %esi
 5b6:	89 d0                	mov    %edx,%eax
 5b8:	5f                   	pop    %edi
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    
 5bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
  *oldpointer = new;
 5c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *oldpointer;
 5c9:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 5cb:	89 08                	mov    %ecx,(%eax)
  return old;
}
 5cd:	5d                   	pop    %ebp
 5ce:	89 d0                	mov    %edx,%eax
 5d0:	c3                   	ret    
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <lock_init>:
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 5ec:	5d                   	pop    %ebp
 5ed:	c3                   	ret    
 5ee:	66 90                	xchg   %ax,%ax

000005f0 <lock_acquire>:
void 
lock_init(lock_t *lock){
  lock->flag = 0;
}
void 
lock_acquire(lock_t *lock){
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
  while(TestAndSet(&lock->flag, 1)==1)
 5f6:	83 38 01             	cmpl   $0x1,(%eax)
 5f9:	75 05                	jne    600 <lock_acquire+0x10>
 5fb:	eb fe                	jmp    5fb <lock_acquire+0xb>
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
 600:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    
 608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <lock_release>:
void 
lock_release(lock_t *lock){
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
  lock->flag =0;
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 61c:	5d                   	pop    %ebp
 61d:	c3                   	ret    
 61e:	66 90                	xchg   %ax,%ax

00000620 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    stack = malloc(PGSIZE);
 626:	68 00 10 00 00       	push   $0x1000
 62b:	e8 e0 03 00 00       	call   a10 <malloc>
    return clone(start_routine, arg1, arg2, stack);
 630:	50                   	push   %eax
 631:	ff 75 10             	push   0x10(%ebp)
 634:	ff 75 0c             	push   0xc(%ebp)
 637:	ff 75 08             	push   0x8(%ebp)
 63a:	e8 db 00 00 00       	call   71a <clone>
}
 63f:	c9                   	leave  
 640:	c3                   	ret    
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <thread_join>:
int 
thread_join(){
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	53                   	push   %ebx
  void *stack;
  int waitedForPID = join(&stack);
 654:	8d 45 f4             	lea    -0xc(%ebp),%eax
thread_join(){
 657:	83 ec 20             	sub    $0x20,%esp
  int waitedForPID = join(&stack);
 65a:	50                   	push   %eax
 65b:	e8 c2 00 00 00       	call   722 <join>
 660:	89 c3                	mov    %eax,%ebx
  free(stack);
 662:	58                   	pop    %eax
 663:	ff 75 f4             	push   -0xc(%ebp)
 666:	e8 15 03 00 00       	call   980 <free>
  return waitedForPID;
 66b:	89 d8                	mov    %ebx,%eax
 66d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 670:	c9                   	leave  
 671:	c3                   	ret    

00000672 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 672:	b8 01 00 00 00       	mov    $0x1,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <exit>:
SYSCALL(exit)
 67a:	b8 02 00 00 00       	mov    $0x2,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <wait>:
SYSCALL(wait)
 682:	b8 03 00 00 00       	mov    $0x3,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <pipe>:
SYSCALL(pipe)
 68a:	b8 04 00 00 00       	mov    $0x4,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <read>:
SYSCALL(read)
 692:	b8 05 00 00 00       	mov    $0x5,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <write>:
SYSCALL(write)
 69a:	b8 10 00 00 00       	mov    $0x10,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <close>:
SYSCALL(close)
 6a2:	b8 15 00 00 00       	mov    $0x15,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <kill>:
SYSCALL(kill)
 6aa:	b8 06 00 00 00       	mov    $0x6,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <exec>:
SYSCALL(exec)
 6b2:	b8 07 00 00 00       	mov    $0x7,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <open>:
SYSCALL(open)
 6ba:	b8 0f 00 00 00       	mov    $0xf,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <mknod>:
SYSCALL(mknod)
 6c2:	b8 11 00 00 00       	mov    $0x11,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <unlink>:
SYSCALL(unlink)
 6ca:	b8 12 00 00 00       	mov    $0x12,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <fstat>:
SYSCALL(fstat)
 6d2:	b8 08 00 00 00       	mov    $0x8,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <link>:
SYSCALL(link)
 6da:	b8 13 00 00 00       	mov    $0x13,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <mkdir>:
SYSCALL(mkdir)
 6e2:	b8 14 00 00 00       	mov    $0x14,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <chdir>:
SYSCALL(chdir)
 6ea:	b8 09 00 00 00       	mov    $0x9,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <dup>:
SYSCALL(dup)
 6f2:	b8 0a 00 00 00       	mov    $0xa,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <getpid>:
SYSCALL(getpid)
 6fa:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <sbrk>:
SYSCALL(sbrk)
 702:	b8 0c 00 00 00       	mov    $0xc,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <sleep>:
SYSCALL(sleep)
 70a:	b8 0d 00 00 00       	mov    $0xd,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <uptime>:
SYSCALL(uptime)
 712:	b8 0e 00 00 00       	mov    $0xe,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <clone>:
SYSCALL(clone)
 71a:	b8 16 00 00 00       	mov    $0x16,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <join>:
SYSCALL(join)
 722:	b8 17 00 00 00       	mov    $0x17,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    
 72a:	66 90                	xchg   %ax,%ax
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 3c             	sub    $0x3c,%esp
 739:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 73c:	89 d1                	mov    %edx,%ecx
{
 73e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 741:	85 d2                	test   %edx,%edx
 743:	0f 89 7f 00 00 00    	jns    7c8 <printint+0x98>
 749:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 74d:	74 79                	je     7c8 <printint+0x98>
    neg = 1;
 74f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 756:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 758:	31 db                	xor    %ebx,%ebx
 75a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 760:	89 c8                	mov    %ecx,%eax
 762:	31 d2                	xor    %edx,%edx
 764:	89 cf                	mov    %ecx,%edi
 766:	f7 75 c4             	divl   -0x3c(%ebp)
 769:	0f b6 92 a0 0b 00 00 	movzbl 0xba0(%edx),%edx
 770:	89 45 c0             	mov    %eax,-0x40(%ebp)
 773:	89 d8                	mov    %ebx,%eax
 775:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 778:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 77b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 77e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 781:	76 dd                	jbe    760 <printint+0x30>
  if(neg)
 783:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 786:	85 c9                	test   %ecx,%ecx
 788:	74 0c                	je     796 <printint+0x66>
    buf[i++] = '-';
 78a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 78f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 791:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 796:	8b 7d b8             	mov    -0x48(%ebp),%edi
 799:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 79d:	eb 07                	jmp    7a6 <printint+0x76>
 79f:	90                   	nop
    putc(fd, buf[i]);
 7a0:	0f b6 13             	movzbl (%ebx),%edx
 7a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7a6:	83 ec 04             	sub    $0x4,%esp
 7a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7ac:	6a 01                	push   $0x1
 7ae:	56                   	push   %esi
 7af:	57                   	push   %edi
 7b0:	e8 e5 fe ff ff       	call   69a <write>
  while(--i >= 0)
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	39 de                	cmp    %ebx,%esi
 7ba:	75 e4                	jne    7a0 <printint+0x70>
}
 7bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7bf:	5b                   	pop    %ebx
 7c0:	5e                   	pop    %esi
 7c1:	5f                   	pop    %edi
 7c2:	5d                   	pop    %ebp
 7c3:	c3                   	ret    
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7cf:	eb 87                	jmp    758 <printint+0x28>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop

000007e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7ef:	0f b6 13             	movzbl (%ebx),%edx
 7f2:	84 d2                	test   %dl,%dl
 7f4:	74 6a                	je     860 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7f6:	8d 45 10             	lea    0x10(%ebp),%eax
 7f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 801:	89 45 d0             	mov    %eax,-0x30(%ebp)
 804:	eb 36                	jmp    83c <printf+0x5c>
 806:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80d:	8d 76 00             	lea    0x0(%esi),%esi
 810:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 813:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	74 15                	je     832 <printf+0x52>
  write(fd, &c, 1);
 81d:	83 ec 04             	sub    $0x4,%esp
 820:	88 55 e7             	mov    %dl,-0x19(%ebp)
 823:	6a 01                	push   $0x1
 825:	57                   	push   %edi
 826:	56                   	push   %esi
 827:	e8 6e fe ff ff       	call   69a <write>
 82c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 82f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 832:	0f b6 13             	movzbl (%ebx),%edx
 835:	83 c3 01             	add    $0x1,%ebx
 838:	84 d2                	test   %dl,%dl
 83a:	74 24                	je     860 <printf+0x80>
    c = fmt[i] & 0xff;
 83c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 83f:	85 c9                	test   %ecx,%ecx
 841:	74 cd                	je     810 <printf+0x30>
      }
    } else if(state == '%'){
 843:	83 f9 25             	cmp    $0x25,%ecx
 846:	75 ea                	jne    832 <printf+0x52>
      if(c == 'd'){
 848:	83 f8 25             	cmp    $0x25,%eax
 84b:	0f 84 07 01 00 00    	je     958 <printf+0x178>
 851:	83 e8 63             	sub    $0x63,%eax
 854:	83 f8 15             	cmp    $0x15,%eax
 857:	77 17                	ja     870 <printf+0x90>
 859:	ff 24 85 48 0b 00 00 	jmp    *0xb48(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 860:	8d 65 f4             	lea    -0xc(%ebp),%esp
 863:	5b                   	pop    %ebx
 864:	5e                   	pop    %esi
 865:	5f                   	pop    %edi
 866:	5d                   	pop    %ebp
 867:	c3                   	ret    
 868:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 86f:	90                   	nop
  write(fd, &c, 1);
 870:	83 ec 04             	sub    $0x4,%esp
 873:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 876:	6a 01                	push   $0x1
 878:	57                   	push   %edi
 879:	56                   	push   %esi
 87a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 87e:	e8 17 fe ff ff       	call   69a <write>
        putc(fd, c);
 883:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 887:	83 c4 0c             	add    $0xc,%esp
 88a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 88d:	6a 01                	push   $0x1
 88f:	57                   	push   %edi
 890:	56                   	push   %esi
 891:	e8 04 fe ff ff       	call   69a <write>
        putc(fd, c);
 896:	83 c4 10             	add    $0x10,%esp
      state = 0;
 899:	31 c9                	xor    %ecx,%ecx
 89b:	eb 95                	jmp    832 <printf+0x52>
 89d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a8:	6a 00                	push   $0x0
 8aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8ad:	8b 10                	mov    (%eax),%edx
 8af:	89 f0                	mov    %esi,%eax
 8b1:	e8 7a fe ff ff       	call   730 <printint>
        ap++;
 8b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8bd:	31 c9                	xor    %ecx,%ecx
 8bf:	e9 6e ff ff ff       	jmp    832 <printf+0x52>
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8cb:	8b 10                	mov    (%eax),%edx
        ap++;
 8cd:	83 c0 04             	add    $0x4,%eax
 8d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8d3:	85 d2                	test   %edx,%edx
 8d5:	0f 84 8d 00 00 00    	je     968 <printf+0x188>
        while(*s != 0){
 8db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8e0:	84 c0                	test   %al,%al
 8e2:	0f 84 4a ff ff ff    	je     832 <printf+0x52>
 8e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8eb:	89 d3                	mov    %edx,%ebx
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8f3:	83 c3 01             	add    $0x1,%ebx
 8f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8f9:	6a 01                	push   $0x1
 8fb:	57                   	push   %edi
 8fc:	56                   	push   %esi
 8fd:	e8 98 fd ff ff       	call   69a <write>
        while(*s != 0){
 902:	0f b6 03             	movzbl (%ebx),%eax
 905:	83 c4 10             	add    $0x10,%esp
 908:	84 c0                	test   %al,%al
 90a:	75 e4                	jne    8f0 <printf+0x110>
      state = 0;
 90c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 90f:	31 c9                	xor    %ecx,%ecx
 911:	e9 1c ff ff ff       	jmp    832 <printf+0x52>
 916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 920:	83 ec 0c             	sub    $0xc,%esp
 923:	b9 0a 00 00 00       	mov    $0xa,%ecx
 928:	6a 01                	push   $0x1
 92a:	e9 7b ff ff ff       	jmp    8aa <printf+0xca>
 92f:	90                   	nop
        putc(fd, *ap);
 930:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 933:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 936:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 938:	6a 01                	push   $0x1
 93a:	57                   	push   %edi
 93b:	56                   	push   %esi
        putc(fd, *ap);
 93c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 93f:	e8 56 fd ff ff       	call   69a <write>
        ap++;
 944:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 948:	83 c4 10             	add    $0x10,%esp
      state = 0;
 94b:	31 c9                	xor    %ecx,%ecx
 94d:	e9 e0 fe ff ff       	jmp    832 <printf+0x52>
 952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 958:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 95b:	83 ec 04             	sub    $0x4,%esp
 95e:	e9 2a ff ff ff       	jmp    88d <printf+0xad>
 963:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 967:	90                   	nop
          s = "(null)";
 968:	ba 3e 0b 00 00       	mov    $0xb3e,%edx
        while(*s != 0){
 96d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 970:	b8 28 00 00 00       	mov    $0x28,%eax
 975:	89 d3                	mov    %edx,%ebx
 977:	e9 74 ff ff ff       	jmp    8f0 <printf+0x110>
 97c:	66 90                	xchg   %ax,%ax
 97e:	66 90                	xchg   %ax,%ax

00000980 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 980:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 981:	a1 20 14 00 00       	mov    0x1420,%eax
{
 986:	89 e5                	mov    %esp,%ebp
 988:	57                   	push   %edi
 989:	56                   	push   %esi
 98a:	53                   	push   %ebx
 98b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 98e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 998:	89 c2                	mov    %eax,%edx
 99a:	8b 00                	mov    (%eax),%eax
 99c:	39 ca                	cmp    %ecx,%edx
 99e:	73 30                	jae    9d0 <free+0x50>
 9a0:	39 c1                	cmp    %eax,%ecx
 9a2:	72 04                	jb     9a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a4:	39 c2                	cmp    %eax,%edx
 9a6:	72 f0                	jb     998 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ae:	39 f8                	cmp    %edi,%eax
 9b0:	74 30                	je     9e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9b5:	8b 42 04             	mov    0x4(%edx),%eax
 9b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9bb:	39 f1                	cmp    %esi,%ecx
 9bd:	74 3a                	je     9f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9c1:	5b                   	pop    %ebx
  freep = p;
 9c2:	89 15 20 14 00 00    	mov    %edx,0x1420
}
 9c8:	5e                   	pop    %esi
 9c9:	5f                   	pop    %edi
 9ca:	5d                   	pop    %ebp
 9cb:	c3                   	ret    
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d0:	39 c2                	cmp    %eax,%edx
 9d2:	72 c4                	jb     998 <free+0x18>
 9d4:	39 c1                	cmp    %eax,%ecx
 9d6:	73 c0                	jae    998 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9de:	39 f8                	cmp    %edi,%eax
 9e0:	75 d0                	jne    9b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9e2:	03 70 04             	add    0x4(%eax),%esi
 9e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e8:	8b 02                	mov    (%edx),%eax
 9ea:	8b 00                	mov    (%eax),%eax
 9ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ef:	8b 42 04             	mov    0x4(%edx),%eax
 9f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9f5:	39 f1                	cmp    %esi,%ecx
 9f7:	75 c6                	jne    9bf <free+0x3f>
    p->s.size += bp->s.size;
 9f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9fc:	89 15 20 14 00 00    	mov    %edx,0x1420
    p->s.size += bp->s.size;
 a02:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a05:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a08:	89 0a                	mov    %ecx,(%edx)
}
 a0a:	5b                   	pop    %ebx
 a0b:	5e                   	pop    %esi
 a0c:	5f                   	pop    %edi
 a0d:	5d                   	pop    %ebp
 a0e:	c3                   	ret    
 a0f:	90                   	nop

00000a10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	57                   	push   %edi
 a14:	56                   	push   %esi
 a15:	53                   	push   %ebx
 a16:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a19:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a1c:	8b 3d 20 14 00 00    	mov    0x1420,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a22:	8d 70 07             	lea    0x7(%eax),%esi
 a25:	c1 ee 03             	shr    $0x3,%esi
 a28:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a2b:	85 ff                	test   %edi,%edi
 a2d:	0f 84 9d 00 00 00    	je     ad0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a33:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a35:	8b 4a 04             	mov    0x4(%edx),%ecx
 a38:	39 f1                	cmp    %esi,%ecx
 a3a:	73 6a                	jae    aa6 <malloc+0x96>
 a3c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a41:	39 de                	cmp    %ebx,%esi
 a43:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a46:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a50:	eb 17                	jmp    a69 <malloc+0x59>
 a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a5a:	8b 48 04             	mov    0x4(%eax),%ecx
 a5d:	39 f1                	cmp    %esi,%ecx
 a5f:	73 4f                	jae    ab0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a61:	8b 3d 20 14 00 00    	mov    0x1420,%edi
 a67:	89 c2                	mov    %eax,%edx
 a69:	39 d7                	cmp    %edx,%edi
 a6b:	75 eb                	jne    a58 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a6d:	83 ec 0c             	sub    $0xc,%esp
 a70:	ff 75 e4             	push   -0x1c(%ebp)
 a73:	e8 8a fc ff ff       	call   702 <sbrk>
  if(p == (char*)-1)
 a78:	83 c4 10             	add    $0x10,%esp
 a7b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a7e:	74 1c                	je     a9c <malloc+0x8c>
  hp->s.size = nu;
 a80:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a83:	83 ec 0c             	sub    $0xc,%esp
 a86:	83 c0 08             	add    $0x8,%eax
 a89:	50                   	push   %eax
 a8a:	e8 f1 fe ff ff       	call   980 <free>
  return freep;
 a8f:	8b 15 20 14 00 00    	mov    0x1420,%edx
      if((p = morecore(nunits)) == 0)
 a95:	83 c4 10             	add    $0x10,%esp
 a98:	85 d2                	test   %edx,%edx
 a9a:	75 bc                	jne    a58 <malloc+0x48>
        return 0;
  }
}
 a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a9f:	31 c0                	xor    %eax,%eax
}
 aa1:	5b                   	pop    %ebx
 aa2:	5e                   	pop    %esi
 aa3:	5f                   	pop    %edi
 aa4:	5d                   	pop    %ebp
 aa5:	c3                   	ret    
    if(p->s.size >= nunits){
 aa6:	89 d0                	mov    %edx,%eax
 aa8:	89 fa                	mov    %edi,%edx
 aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 ab0:	39 ce                	cmp    %ecx,%esi
 ab2:	74 4c                	je     b00 <malloc+0xf0>
        p->s.size -= nunits;
 ab4:	29 f1                	sub    %esi,%ecx
 ab6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ab9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 abc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 abf:	89 15 20 14 00 00    	mov    %edx,0x1420
}
 ac5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ac8:	83 c0 08             	add    $0x8,%eax
}
 acb:	5b                   	pop    %ebx
 acc:	5e                   	pop    %esi
 acd:	5f                   	pop    %edi
 ace:	5d                   	pop    %ebp
 acf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 ad0:	c7 05 20 14 00 00 24 	movl   $0x1424,0x1420
 ad7:	14 00 00 
    base.s.size = 0;
 ada:	bf 24 14 00 00       	mov    $0x1424,%edi
    base.s.ptr = freep = prevp = &base;
 adf:	c7 05 24 14 00 00 24 	movl   $0x1424,0x1424
 ae6:	14 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 aeb:	c7 05 28 14 00 00 00 	movl   $0x0,0x1428
 af2:	00 00 00 
    if(p->s.size >= nunits){
 af5:	e9 42 ff ff ff       	jmp    a3c <malloc+0x2c>
 afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b00:	8b 08                	mov    (%eax),%ecx
 b02:	89 0a                	mov    %ecx,(%edx)
 b04:	eb b9                	jmp    abf <malloc+0xaf>
