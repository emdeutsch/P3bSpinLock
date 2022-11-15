
_test_17:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void merge_sort(void *array, void *size);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
  12:	e8 e4 05 00 00       	call   5fb <getpid>
  17:	a3 24 0e 00 00       	mov    %eax,0xe24
   3. join both threads
   4. Merge function
   */


    int size = 11;
  1c:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
    global = (int*)malloc(size * sizeof(int));
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 2c                	push   $0x2c
  28:	e8 c9 08 00 00       	call   8f6 <malloc>
  2d:	a3 20 0e 00 00       	mov    %eax,0xe20
    for(int i = 0; i < size; i++){
  32:	83 c4 10             	add    $0x10,%esp
  35:	ba 00 00 00 00       	mov    $0x0,%edx
  3a:	eb 11                	jmp    4d <main+0x4d>
        global[i] = size - i - 1;
  3c:	29 d0                	sub    %edx,%eax
  3e:	83 e8 01             	sub    $0x1,%eax
  41:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
  47:	89 04 91             	mov    %eax,(%ecx,%edx,4)
    for(int i = 0; i < size; i++){
  4a:	83 c2 01             	add    $0x1,%edx
  4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  50:	39 d0                	cmp    %edx,%eax
  52:	7f e8                	jg     3c <main+0x3c>
    }

   int thread_pid = thread_create(merge_sort, global, &size);
  54:	83 ec 04             	sub    $0x4,%esp
  57:	8d 45 f4             	lea    -0xc(%ebp),%eax
  5a:	50                   	push   %eax
  5b:	ff 35 20 0e 00 00    	push   0xe20
  61:	68 a3 02 00 00       	push   $0x2a3
  66:	e8 a9 04 00 00       	call   514 <thread_create>
  6b:	89 c3                	mov    %eax,%ebx
   assert(thread_pid > 0);
  6d:	83 c4 10             	add    $0x10,%esp
  70:	85 c0                	test   %eax,%eax
  72:	7e 6e                	jle    e2 <main+0xe2>

   int join_pid = thread_join();
  74:	e8 d3 04 00 00       	call   54c <thread_join>
   assert(join_pid == thread_pid);
  79:	39 c3                	cmp    %eax,%ebx
  7b:	0f 85 aa 00 00 00    	jne    12b <main+0x12b>
   assert(global[0] == 0);
  81:	a1 20 0e 00 00       	mov    0xe20,%eax
  86:	83 38 00             	cmpl   $0x0,(%eax)
  89:	0f 85 e5 00 00 00    	jne    174 <main+0x174>
   assert(global[10] == 10); 
  8f:	83 78 28 0a          	cmpl   $0xa,0x28(%eax)
  93:	0f 84 24 01 00 00    	je     1bd <main+0x1bd>
  99:	6a 35                	push   $0x35
  9b:	68 80 09 00 00       	push   $0x980
  a0:	68 8a 09 00 00       	push   $0x98a
  a5:	6a 01                	push   $0x1
  a7:	e8 24 06 00 00       	call   6d0 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 e8 09 00 00       	push   $0x9e8
  b4:	68 a1 09 00 00       	push   $0x9a1
  b9:	6a 01                	push   $0x1
  bb:	e8 10 06 00 00       	call   6d0 <printf>
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 b5 09 00 00       	push   $0x9b5
  c8:	6a 01                	push   $0x1
  ca:	e8 01 06 00 00       	call   6d0 <printf>
  cf:	83 c4 04             	add    $0x4,%esp
  d2:	ff 35 24 0e 00 00    	push   0xe24
  d8:	e8 ce 04 00 00       	call   5ab <kill>
  dd:	e8 99 04 00 00       	call   57b <exit>
   assert(thread_pid > 0);
  e2:	6a 30                	push   $0x30
  e4:	68 80 09 00 00       	push   $0x980
  e9:	68 8a 09 00 00       	push   $0x98a
  ee:	6a 01                	push   $0x1
  f0:	e8 db 05 00 00       	call   6d0 <printf>
  f5:	83 c4 0c             	add    $0xc,%esp
  f8:	68 92 09 00 00       	push   $0x992
  fd:	68 a1 09 00 00       	push   $0x9a1
 102:	6a 01                	push   $0x1
 104:	e8 c7 05 00 00       	call   6d0 <printf>
 109:	83 c4 08             	add    $0x8,%esp
 10c:	68 b5 09 00 00       	push   $0x9b5
 111:	6a 01                	push   $0x1
 113:	e8 b8 05 00 00       	call   6d0 <printf>
 118:	83 c4 04             	add    $0x4,%esp
 11b:	ff 35 24 0e 00 00    	push   0xe24
 121:	e8 85 04 00 00       	call   5ab <kill>
 126:	e8 50 04 00 00       	call   57b <exit>
   assert(join_pid == thread_pid);
 12b:	6a 33                	push   $0x33
 12d:	68 80 09 00 00       	push   $0x980
 132:	68 8a 09 00 00       	push   $0x98a
 137:	6a 01                	push   $0x1
 139:	e8 92 05 00 00       	call   6d0 <printf>
 13e:	83 c4 0c             	add    $0xc,%esp
 141:	68 c2 09 00 00       	push   $0x9c2
 146:	68 a1 09 00 00       	push   $0x9a1
 14b:	6a 01                	push   $0x1
 14d:	e8 7e 05 00 00       	call   6d0 <printf>
 152:	83 c4 08             	add    $0x8,%esp
 155:	68 b5 09 00 00       	push   $0x9b5
 15a:	6a 01                	push   $0x1
 15c:	e8 6f 05 00 00       	call   6d0 <printf>
 161:	83 c4 04             	add    $0x4,%esp
 164:	ff 35 24 0e 00 00    	push   0xe24
 16a:	e8 3c 04 00 00       	call   5ab <kill>
 16f:	e8 07 04 00 00       	call   57b <exit>
   assert(global[0] == 0);
 174:	6a 34                	push   $0x34
 176:	68 80 09 00 00       	push   $0x980
 17b:	68 8a 09 00 00       	push   $0x98a
 180:	6a 01                	push   $0x1
 182:	e8 49 05 00 00       	call   6d0 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 d9 09 00 00       	push   $0x9d9
 18f:	68 a1 09 00 00       	push   $0x9a1
 194:	6a 01                	push   $0x1
 196:	e8 35 05 00 00       	call   6d0 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 b5 09 00 00       	push   $0x9b5
 1a3:	6a 01                	push   $0x1
 1a5:	e8 26 05 00 00       	call   6d0 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 24 0e 00 00    	push   0xe24
 1b3:	e8 f3 03 00 00       	call   5ab <kill>
 1b8:	e8 be 03 00 00       	call   57b <exit>

   printf(1, "TEST PASSED\n");
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	68 f9 09 00 00       	push   $0x9f9
 1c5:	6a 01                	push   $0x1
 1c7:	e8 04 05 00 00       	call   6d0 <printf>
   exit();
 1cc:	e8 aa 03 00 00       	call   57b <exit>

000001d1 <merge>:
}

void merge(int* array, int* array_right,int size_left, int size_right,int*temp_array){
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	57                   	push   %edi
 1d5:	56                   	push   %esi
 1d6:	53                   	push   %ebx
 1d7:	83 ec 04             	sub    $0x4,%esp
    int i = 0;
    int j = 0;
    int k = 0;
 1da:	b8 00 00 00 00       	mov    $0x0,%eax
    int j = 0;
 1df:	ba 00 00 00 00       	mov    $0x0,%edx
    int i = 0;
 1e4:	b9 00 00 00 00       	mov    $0x0,%ecx
    while(i < size_left && j < size_right){
 1e9:	eb 0c                	jmp    1f7 <merge+0x26>
        if(array[i] < array_right[j]){
            temp_array[k] = array[i];
            i++;
        }
        else{
            temp_array[k] = array_right[j];
 1eb:	8b 7d 18             	mov    0x18(%ebp),%edi
 1ee:	89 34 87             	mov    %esi,(%edi,%eax,4)
            j++;
 1f1:	83 c2 01             	add    $0x1,%edx
        }
        k++;
 1f4:	83 c0 01             	add    $0x1,%eax
    while(i < size_left && j < size_right){
 1f7:	3b 4d 10             	cmp    0x10(%ebp),%ecx
 1fa:	0f 9c c3             	setl   %bl
 1fd:	89 de                	mov    %ebx,%esi
 1ff:	3b 55 14             	cmp    0x14(%ebp),%edx
 202:	0f 9c c3             	setl   %bl
 205:	89 df                	mov    %ebx,%edi
 207:	89 f3                	mov    %esi,%ebx
 209:	84 db                	test   %bl,%bl
 20b:	74 50                	je     25d <merge+0x8c>
 20d:	89 fb                	mov    %edi,%ebx
 20f:	84 db                	test   %bl,%bl
 211:	74 1b                	je     22e <merge+0x5d>
        if(array[i] < array_right[j]){
 213:	8b 7d 08             	mov    0x8(%ebp),%edi
 216:	8b 3c 8f             	mov    (%edi,%ecx,4),%edi
 219:	8b 75 0c             	mov    0xc(%ebp),%esi
 21c:	8b 34 96             	mov    (%esi,%edx,4),%esi
 21f:	39 f7                	cmp    %esi,%edi
 221:	7d c8                	jge    1eb <merge+0x1a>
            temp_array[k] = array[i];
 223:	8b 75 18             	mov    0x18(%ebp),%esi
 226:	89 3c 86             	mov    %edi,(%esi,%eax,4)
            i++;
 229:	83 c1 01             	add    $0x1,%ecx
 22c:	eb c6                	jmp    1f4 <merge+0x23>
 22e:	8b 7d 08             	mov    0x8(%ebp),%edi
 231:	8b 5d 18             	mov    0x18(%ebp),%ebx
 234:	89 55 f0             	mov    %edx,-0x10(%ebp)
 237:	8b 75 10             	mov    0x10(%ebp),%esi
 23a:	eb 0c                	jmp    248 <merge+0x77>
    }
    while(i < size_left){
        temp_array[k] = array[i];
 23c:	8b 14 8f             	mov    (%edi,%ecx,4),%edx
 23f:	89 14 83             	mov    %edx,(%ebx,%eax,4)
        i++;
 242:	83 c1 01             	add    $0x1,%ecx
        k++;
 245:	83 c0 01             	add    $0x1,%eax
    while(i < size_left){
 248:	39 f1                	cmp    %esi,%ecx
 24a:	7c f0                	jl     23c <merge+0x6b>
 24c:	8b 55 f0             	mov    -0x10(%ebp),%edx
 24f:	89 75 10             	mov    %esi,0x10(%ebp)
 252:	89 7d 08             	mov    %edi,0x8(%ebp)
 255:	8b 75 0c             	mov    0xc(%ebp),%esi
 258:	8b 4d 14             	mov    0x14(%ebp),%ecx
 25b:	eb 1a                	jmp    277 <merge+0xa6>
 25d:	89 55 f0             	mov    %edx,-0x10(%ebp)
 260:	8b 7d 08             	mov    0x8(%ebp),%edi
 263:	8b 75 10             	mov    0x10(%ebp),%esi
 266:	8b 5d 18             	mov    0x18(%ebp),%ebx
 269:	eb dd                	jmp    248 <merge+0x77>
    }
    while(j < size_right){
        temp_array[k] = array_right[j];
 26b:	8b 3c 96             	mov    (%esi,%edx,4),%edi
 26e:	89 3c 83             	mov    %edi,(%ebx,%eax,4)
        j++;
 271:	83 c2 01             	add    $0x1,%edx
        k++;
 274:	83 c0 01             	add    $0x1,%eax
    while(j < size_right){
 277:	39 ca                	cmp    %ecx,%edx
 279:	7c f0                	jl     26b <merge+0x9a>
    }
    for(int i = 0; i < size_left + size_right; i++){
 27b:	8b 7d 08             	mov    0x8(%ebp),%edi
 27e:	b8 00 00 00 00       	mov    $0x0,%eax
 283:	8b 4d 10             	mov    0x10(%ebp),%ecx
 286:	8b 75 14             	mov    0x14(%ebp),%esi
 289:	eb 09                	jmp    294 <merge+0xc3>
        array[i] = temp_array[i];
 28b:	8b 14 83             	mov    (%ebx,%eax,4),%edx
 28e:	89 14 87             	mov    %edx,(%edi,%eax,4)
    for(int i = 0; i < size_left + size_right; i++){
 291:	83 c0 01             	add    $0x1,%eax
 294:	8d 14 31             	lea    (%ecx,%esi,1),%edx
 297:	39 c2                	cmp    %eax,%edx
 299:	7f f0                	jg     28b <merge+0xba>
    }
   
}
 29b:	83 c4 04             	add    $0x4,%esp
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5f                   	pop    %edi
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    

000002a3 <merge_sort>:

void merge_sort(void *arg1, void *arg2) {
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	57                   	push   %edi
 2a7:	56                   	push   %esi
 2a8:	53                   	push   %ebx
 2a9:	83 ec 1c             	sub    $0x1c,%esp
 2ac:	8b 75 08             	mov    0x8(%ebp),%esi
   int *array = (int*)arg1;
   int size = *(int*)arg2;
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	8b 18                	mov    (%eax),%ebx

   if (size==1){
 2b4:	83 fb 01             	cmp    $0x1,%ebx
 2b7:	74 70                	je     329 <merge_sort+0x86>
       exit();
   }

   
   int size_left = size/2;
 2b9:	b9 02 00 00 00       	mov    $0x2,%ecx
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	99                   	cltd   
 2c1:	f7 f9                	idiv   %ecx
 2c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   int size_right = size-size/2;
 2c6:	89 da                	mov    %ebx,%edx
 2c8:	29 c2                	sub    %eax,%edx
 2ca:	89 55 e0             	mov    %edx,-0x20(%ebp)

   int* array_right = (int*)(array + size_left);
 2cd:	8d 3c 86             	lea    (%esi,%eax,4),%edi
//    merge_sort(array_right, size_right);

//    int nested_thread_pid_l = thread_create(merge_sort, array, &size_left);
//    int nested_thread_pid_r = thread_create(merge_sort, array_right, &size_right);
   
   thread_create(merge_sort, array, &size_left);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 2d6:	50                   	push   %eax
 2d7:	56                   	push   %esi
 2d8:	68 a3 02 00 00       	push   $0x2a3
 2dd:	e8 32 02 00 00       	call   514 <thread_create>
   thread_create(merge_sort, array_right, &size_right);
 2e2:	83 c4 0c             	add    $0xc,%esp
 2e5:	8d 45 e0             	lea    -0x20(%ebp),%eax
 2e8:	50                   	push   %eax
 2e9:	57                   	push   %edi
 2ea:	68 a3 02 00 00       	push   $0x2a3
 2ef:	e8 20 02 00 00       	call   514 <thread_create>

   thread_join();
 2f4:	e8 53 02 00 00       	call   54c <thread_join>
   thread_join();
 2f9:	e8 4e 02 00 00       	call   54c <thread_join>
 

//    int nested_join_pid_1 = thread_join();
//    int nested_join_pid_2 = thread_join();

   int* temp_array = malloc(size*sizeof(int));
 2fe:	c1 e3 02             	shl    $0x2,%ebx
 301:	89 1c 24             	mov    %ebx,(%esp)
 304:	e8 ed 05 00 00       	call   8f6 <malloc>
 309:	89 c3                	mov    %eax,%ebx

   merge(array,array_right,size_left,size_right,temp_array);
 30b:	89 04 24             	mov    %eax,(%esp)
 30e:	ff 75 e0             	push   -0x20(%ebp)
 311:	ff 75 e4             	push   -0x1c(%ebp)
 314:	57                   	push   %edi
 315:	56                   	push   %esi
 316:	e8 b6 fe ff ff       	call   1d1 <merge>

   free(temp_array);
 31b:	83 c4 14             	add    $0x14,%esp
 31e:	53                   	push   %ebx
 31f:	e8 12 05 00 00       	call   836 <free>

//    assert(nested_thread_pid_l == nested_join_pid_1 || nested_thread_pid_l == nested_join_pid_2);
//    assert(nested_thread_pid_r == nested_join_pid_1 || nested_thread_pid_r == nested_join_pid_2);
   exit();
 324:	e8 52 02 00 00       	call   57b <exit>
       exit();
 329:	e8 4d 02 00 00       	call   57b <exit>

0000032e <strcpy>:
#include "x86.h"
#include "mmu.h"

char*
strcpy(char *s, const char *t)
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	56                   	push   %esi
 332:	53                   	push   %ebx
 333:	8b 75 08             	mov    0x8(%ebp),%esi
 336:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 339:	89 f0                	mov    %esi,%eax
 33b:	89 d1                	mov    %edx,%ecx
 33d:	83 c2 01             	add    $0x1,%edx
 340:	89 c3                	mov    %eax,%ebx
 342:	83 c0 01             	add    $0x1,%eax
 345:	0f b6 09             	movzbl (%ecx),%ecx
 348:	88 0b                	mov    %cl,(%ebx)
 34a:	84 c9                	test   %cl,%cl
 34c:	75 ed                	jne    33b <strcpy+0xd>
    ;
  return os;
}
 34e:	89 f0                	mov    %esi,%eax
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    

00000354 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 35d:	eb 06                	jmp    365 <strcmp+0x11>
    p++, q++;
 35f:	83 c1 01             	add    $0x1,%ecx
 362:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 365:	0f b6 01             	movzbl (%ecx),%eax
 368:	84 c0                	test   %al,%al
 36a:	74 04                	je     370 <strcmp+0x1c>
 36c:	3a 02                	cmp    (%edx),%al
 36e:	74 ef                	je     35f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 370:	0f b6 c0             	movzbl %al,%eax
 373:	0f b6 12             	movzbl (%edx),%edx
 376:	29 d0                	sub    %edx,%eax
}
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    

0000037a <strlen>:

uint
strlen(const char *s)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 380:	b8 00 00 00 00       	mov    $0x0,%eax
 385:	eb 03                	jmp    38a <strlen+0x10>
 387:	83 c0 01             	add    $0x1,%eax
 38a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 38e:	75 f7                	jne    387 <strlen+0xd>
    ;
  return n;
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <memset>:

void*
memset(void *dst, int c, uint n)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	57                   	push   %edi
 396:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 399:	89 d7                	mov    %edx,%edi
 39b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	fc                   	cld    
 3a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a4:	89 d0                	mov    %edx,%eax
 3a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a9:	c9                   	leave  
 3aa:	c3                   	ret    

000003ab <strchr>:

char*
strchr(const char *s, char c)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	8b 45 08             	mov    0x8(%ebp),%eax
 3b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3b5:	eb 03                	jmp    3ba <strchr+0xf>
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	0f b6 10             	movzbl (%eax),%edx
 3bd:	84 d2                	test   %dl,%dl
 3bf:	74 06                	je     3c7 <strchr+0x1c>
    if(*s == c)
 3c1:	38 ca                	cmp    %cl,%dl
 3c3:	75 f2                	jne    3b7 <strchr+0xc>
 3c5:	eb 05                	jmp    3cc <strchr+0x21>
      return (char*)s;
  return 0;
 3c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    

000003ce <gets>:

char*
gets(char *buf, int max)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	57                   	push   %edi
 3d2:	56                   	push   %esi
 3d3:	53                   	push   %ebx
 3d4:	83 ec 1c             	sub    $0x1c,%esp
 3d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3da:	bb 00 00 00 00       	mov    $0x0,%ebx
 3df:	89 de                	mov    %ebx,%esi
 3e1:	83 c3 01             	add    $0x1,%ebx
 3e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e7:	7d 2e                	jge    417 <gets+0x49>
    cc = read(0, &c, 1);
 3e9:	83 ec 04             	sub    $0x4,%esp
 3ec:	6a 01                	push   $0x1
 3ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f1:	50                   	push   %eax
 3f2:	6a 00                	push   $0x0
 3f4:	e8 9a 01 00 00       	call   593 <read>
    if(cc < 1)
 3f9:	83 c4 10             	add    $0x10,%esp
 3fc:	85 c0                	test   %eax,%eax
 3fe:	7e 17                	jle    417 <gets+0x49>
      break;
    buf[i++] = c;
 400:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 404:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 407:	3c 0a                	cmp    $0xa,%al
 409:	0f 94 c2             	sete   %dl
 40c:	3c 0d                	cmp    $0xd,%al
 40e:	0f 94 c0             	sete   %al
 411:	08 c2                	or     %al,%dl
 413:	74 ca                	je     3df <gets+0x11>
    buf[i++] = c;
 415:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 417:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 41b:	89 f8                	mov    %edi,%eax
 41d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    

00000425 <stat>:

int
stat(const char *n, struct stat *st)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	56                   	push   %esi
 429:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 42a:	83 ec 08             	sub    $0x8,%esp
 42d:	6a 00                	push   $0x0
 42f:	ff 75 08             	push   0x8(%ebp)
 432:	e8 84 01 00 00       	call   5bb <open>
  if(fd < 0)
 437:	83 c4 10             	add    $0x10,%esp
 43a:	85 c0                	test   %eax,%eax
 43c:	78 24                	js     462 <stat+0x3d>
 43e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 440:	83 ec 08             	sub    $0x8,%esp
 443:	ff 75 0c             	push   0xc(%ebp)
 446:	50                   	push   %eax
 447:	e8 87 01 00 00       	call   5d3 <fstat>
 44c:	89 c6                	mov    %eax,%esi
  close(fd);
 44e:	89 1c 24             	mov    %ebx,(%esp)
 451:	e8 4d 01 00 00       	call   5a3 <close>
  return r;
 456:	83 c4 10             	add    $0x10,%esp
}
 459:	89 f0                	mov    %esi,%eax
 45b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    
    return -1;
 462:	be ff ff ff ff       	mov    $0xffffffff,%esi
 467:	eb f0                	jmp    459 <stat+0x34>

00000469 <atoi>:

int
atoi(const char *s)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	53                   	push   %ebx
 46d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 470:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 475:	eb 10                	jmp    487 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 477:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 47a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 47d:	83 c1 01             	add    $0x1,%ecx
 480:	0f be c0             	movsbl %al,%eax
 483:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 487:	0f b6 01             	movzbl (%ecx),%eax
 48a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 48d:	80 fb 09             	cmp    $0x9,%bl
 490:	76 e5                	jbe    477 <atoi+0xe>
  return n;
}
 492:	89 d0                	mov    %edx,%eax
 494:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	8b 75 08             	mov    0x8(%ebp),%esi
 4a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a9:	eb 0d                	jmp    4b8 <memmove+0x1f>
    *dst++ = *src++;
 4ab:	0f b6 01             	movzbl (%ecx),%eax
 4ae:	88 02                	mov    %al,(%edx)
 4b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 4b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4bb:	85 c0                	test   %eax,%eax
 4bd:	7f ec                	jg     4ab <memmove+0x12>
  return vdst;
}
 4bf:	89 f0                	mov    %esi,%eax
 4c1:	5b                   	pop    %ebx
 4c2:	5e                   	pop    %esi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    

000004c5 <TestAndSet>:
int TestAndSet(int *oldpointer, int new){
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *oldpointer;
 4cb:	8b 10                	mov    (%eax),%edx
  *oldpointer = new;
 4cd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d0:	89 08                	mov    %ecx,(%eax)
  return old;
}
 4d2:	89 d0                	mov    %edx,%eax
 4d4:	5d                   	pop    %ebp
 4d5:	c3                   	ret    

000004d6 <lock_init>:
void 
lock_init(lock_t *lock){
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    

000004e4 <lock_acquire>:
void 
lock_acquire(lock_t *lock){
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	53                   	push   %ebx
 4e8:	83 ec 04             	sub    $0x4,%esp
 4eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(TestAndSet(&lock->flag, 1)==1)
 4ee:	83 ec 08             	sub    $0x8,%esp
 4f1:	6a 01                	push   $0x1
 4f3:	53                   	push   %ebx
 4f4:	e8 cc ff ff ff       	call   4c5 <TestAndSet>
 4f9:	83 c4 10             	add    $0x10,%esp
 4fc:	83 f8 01             	cmp    $0x1,%eax
 4ff:	74 ed                	je     4ee <lock_acquire+0xa>
    ;
}
 501:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 504:	c9                   	leave  
 505:	c3                   	ret    

00000506 <lock_release>:
void 
lock_release(lock_t *lock){
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 509:	8b 45 08             	mov    0x8(%ebp),%eax
 50c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    

00000514 <thread_create>:
int 
thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2){
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 14             	sub    $0x14,%esp
    void *stack;
    void *oldstack;
    stack = malloc(PGSIZE*2 + sizeof(uint));
 51a:	68 04 20 00 00       	push   $0x2004
 51f:	e8 d2 03 00 00       	call   8f6 <malloc>
    oldstack = stack;
    while((int)stack % PGSIZE !=0){
 524:	83 c4 10             	add    $0x10,%esp
    stack = malloc(PGSIZE*2 + sizeof(uint));
 527:	89 c2                	mov    %eax,%edx
    while((int)stack % PGSIZE !=0){
 529:	eb 03                	jmp    52e <thread_create+0x1a>
      stack += 1;
 52b:	83 c2 01             	add    $0x1,%edx
    while((int)stack % PGSIZE !=0){
 52e:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
 534:	75 f5                	jne    52b <thread_create+0x17>
    }
    *(uint*)stack = (uint)oldstack;
 536:	89 02                	mov    %eax,(%edx)
    stack += sizeof(uint);
 538:	83 c2 04             	add    $0x4,%edx
   /* int extra;
    extra = (int)stack % PGSIZE;
    newstack = stack + PGSIZE - extra;*/

    int pid = clone(start_routine, arg1, arg2, stack);
 53b:	52                   	push   %edx
 53c:	ff 75 10             	push   0x10(%ebp)
 53f:	ff 75 0c             	push   0xc(%ebp)
 542:	ff 75 08             	push   0x8(%ebp)
 545:	e8 d1 00 00 00       	call   61b <clone>
 
    return pid;
}
 54a:	c9                   	leave  
 54b:	c3                   	ret    

0000054c <thread_join>:
int 
thread_join(){
 54c:	55                   	push   %ebp
 54d:	89 e5                	mov    %esp,%ebp
 54f:	53                   	push   %ebx
 550:	83 ec 20             	sub    $0x20,%esp
  void *newStack;
  int waitedForPID = join(&newStack);
 553:	8d 45 f4             	lea    -0xc(%ebp),%eax
 556:	50                   	push   %eax
 557:	e8 c7 00 00 00       	call   623 <join>
 55c:	89 c3                	mov    %eax,%ebx
  void *stack = *(void**)(newStack-sizeof(uint));
  free(stack);
 55e:	83 c4 04             	add    $0x4,%esp
 561:	8b 45 f4             	mov    -0xc(%ebp),%eax
 564:	ff 70 fc             	push   -0x4(%eax)
 567:	e8 ca 02 00 00       	call   836 <free>
  return waitedForPID;
 56c:	89 d8                	mov    %ebx,%eax
 56e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 571:	c9                   	leave  
 572:	c3                   	ret    

00000573 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 573:	b8 01 00 00 00       	mov    $0x1,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <exit>:
SYSCALL(exit)
 57b:	b8 02 00 00 00       	mov    $0x2,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <wait>:
SYSCALL(wait)
 583:	b8 03 00 00 00       	mov    $0x3,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <pipe>:
SYSCALL(pipe)
 58b:	b8 04 00 00 00       	mov    $0x4,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <read>:
SYSCALL(read)
 593:	b8 05 00 00 00       	mov    $0x5,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <write>:
SYSCALL(write)
 59b:	b8 10 00 00 00       	mov    $0x10,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <close>:
SYSCALL(close)
 5a3:	b8 15 00 00 00       	mov    $0x15,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <kill>:
SYSCALL(kill)
 5ab:	b8 06 00 00 00       	mov    $0x6,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <exec>:
SYSCALL(exec)
 5b3:	b8 07 00 00 00       	mov    $0x7,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <open>:
SYSCALL(open)
 5bb:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <mknod>:
SYSCALL(mknod)
 5c3:	b8 11 00 00 00       	mov    $0x11,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <unlink>:
SYSCALL(unlink)
 5cb:	b8 12 00 00 00       	mov    $0x12,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <fstat>:
SYSCALL(fstat)
 5d3:	b8 08 00 00 00       	mov    $0x8,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <link>:
SYSCALL(link)
 5db:	b8 13 00 00 00       	mov    $0x13,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <mkdir>:
SYSCALL(mkdir)
 5e3:	b8 14 00 00 00       	mov    $0x14,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <chdir>:
SYSCALL(chdir)
 5eb:	b8 09 00 00 00       	mov    $0x9,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <dup>:
SYSCALL(dup)
 5f3:	b8 0a 00 00 00       	mov    $0xa,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <getpid>:
SYSCALL(getpid)
 5fb:	b8 0b 00 00 00       	mov    $0xb,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <sbrk>:
SYSCALL(sbrk)
 603:	b8 0c 00 00 00       	mov    $0xc,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <sleep>:
SYSCALL(sleep)
 60b:	b8 0d 00 00 00       	mov    $0xd,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <uptime>:
SYSCALL(uptime)
 613:	b8 0e 00 00 00       	mov    $0xe,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <clone>:
SYSCALL(clone)
 61b:	b8 16 00 00 00       	mov    $0x16,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <join>:
SYSCALL(join)
 623:	b8 17 00 00 00       	mov    $0x17,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 62b:	55                   	push   %ebp
 62c:	89 e5                	mov    %esp,%ebp
 62e:	83 ec 1c             	sub    $0x1c,%esp
 631:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 634:	6a 01                	push   $0x1
 636:	8d 55 f4             	lea    -0xc(%ebp),%edx
 639:	52                   	push   %edx
 63a:	50                   	push   %eax
 63b:	e8 5b ff ff ff       	call   59b <write>
}
 640:	83 c4 10             	add    $0x10,%esp
 643:	c9                   	leave  
 644:	c3                   	ret    

00000645 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 645:	55                   	push   %ebp
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	83 ec 2c             	sub    $0x2c,%esp
 64e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 651:	89 d0                	mov    %edx,%eax
 653:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 655:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 659:	0f 95 c1             	setne  %cl
 65c:	c1 ea 1f             	shr    $0x1f,%edx
 65f:	84 d1                	test   %dl,%cl
 661:	74 44                	je     6a7 <printint+0x62>
    neg = 1;
    x = -xx;
 663:	f7 d8                	neg    %eax
 665:	89 c1                	mov    %eax,%ecx
    neg = 1;
 667:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 66e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 673:	89 c8                	mov    %ecx,%eax
 675:	ba 00 00 00 00       	mov    $0x0,%edx
 67a:	f7 f6                	div    %esi
 67c:	89 df                	mov    %ebx,%edi
 67e:	83 c3 01             	add    $0x1,%ebx
 681:	0f b6 92 68 0a 00 00 	movzbl 0xa68(%edx),%edx
 688:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 68c:	89 ca                	mov    %ecx,%edx
 68e:	89 c1                	mov    %eax,%ecx
 690:	39 d6                	cmp    %edx,%esi
 692:	76 df                	jbe    673 <printint+0x2e>
  if(neg)
 694:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 698:	74 31                	je     6cb <printint+0x86>
    buf[i++] = '-';
 69a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 69f:	8d 5f 02             	lea    0x2(%edi),%ebx
 6a2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6a5:	eb 17                	jmp    6be <printint+0x79>
    x = xx;
 6a7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6a9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6b0:	eb bc                	jmp    66e <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6b2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6b7:	89 f0                	mov    %esi,%eax
 6b9:	e8 6d ff ff ff       	call   62b <putc>
  while(--i >= 0)
 6be:	83 eb 01             	sub    $0x1,%ebx
 6c1:	79 ef                	jns    6b2 <printint+0x6d>
}
 6c3:	83 c4 2c             	add    $0x2c,%esp
 6c6:	5b                   	pop    %ebx
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    
 6cb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ce:	eb ee                	jmp    6be <printint+0x79>

000006d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6d9:	8d 45 10             	lea    0x10(%ebp),%eax
 6dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6df:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6e4:	bb 00 00 00 00       	mov    $0x0,%ebx
 6e9:	eb 14                	jmp    6ff <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6eb:	89 fa                	mov    %edi,%edx
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	e8 36 ff ff ff       	call   62b <putc>
 6f5:	eb 05                	jmp    6fc <printf+0x2c>
      }
    } else if(state == '%'){
 6f7:	83 fe 25             	cmp    $0x25,%esi
 6fa:	74 25                	je     721 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6fc:	83 c3 01             	add    $0x1,%ebx
 6ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 702:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 706:	84 c0                	test   %al,%al
 708:	0f 84 20 01 00 00    	je     82e <printf+0x15e>
    c = fmt[i] & 0xff;
 70e:	0f be f8             	movsbl %al,%edi
 711:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 714:	85 f6                	test   %esi,%esi
 716:	75 df                	jne    6f7 <printf+0x27>
      if(c == '%'){
 718:	83 f8 25             	cmp    $0x25,%eax
 71b:	75 ce                	jne    6eb <printf+0x1b>
        state = '%';
 71d:	89 c6                	mov    %eax,%esi
 71f:	eb db                	jmp    6fc <printf+0x2c>
      if(c == 'd'){
 721:	83 f8 25             	cmp    $0x25,%eax
 724:	0f 84 cf 00 00 00    	je     7f9 <printf+0x129>
 72a:	0f 8c dd 00 00 00    	jl     80d <printf+0x13d>
 730:	83 f8 78             	cmp    $0x78,%eax
 733:	0f 8f d4 00 00 00    	jg     80d <printf+0x13d>
 739:	83 f8 63             	cmp    $0x63,%eax
 73c:	0f 8c cb 00 00 00    	jl     80d <printf+0x13d>
 742:	83 e8 63             	sub    $0x63,%eax
 745:	83 f8 15             	cmp    $0x15,%eax
 748:	0f 87 bf 00 00 00    	ja     80d <printf+0x13d>
 74e:	ff 24 85 10 0a 00 00 	jmp    *0xa10(,%eax,4)
        printint(fd, *ap, 10, 1);
 755:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 758:	8b 17                	mov    (%edi),%edx
 75a:	83 ec 0c             	sub    $0xc,%esp
 75d:	6a 01                	push   $0x1
 75f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	e8 d9 fe ff ff       	call   645 <printint>
        ap++;
 76c:	83 c7 04             	add    $0x4,%edi
 76f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 772:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 775:	be 00 00 00 00       	mov    $0x0,%esi
 77a:	eb 80                	jmp    6fc <printf+0x2c>
        printint(fd, *ap, 16, 0);
 77c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 77f:	8b 17                	mov    (%edi),%edx
 781:	83 ec 0c             	sub    $0xc,%esp
 784:	6a 00                	push   $0x0
 786:	b9 10 00 00 00       	mov    $0x10,%ecx
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	e8 b2 fe ff ff       	call   645 <printint>
        ap++;
 793:	83 c7 04             	add    $0x4,%edi
 796:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 799:	83 c4 10             	add    $0x10,%esp
      state = 0;
 79c:	be 00 00 00 00       	mov    $0x0,%esi
 7a1:	e9 56 ff ff ff       	jmp    6fc <printf+0x2c>
        s = (char*)*ap;
 7a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a9:	8b 30                	mov    (%eax),%esi
        ap++;
 7ab:	83 c0 04             	add    $0x4,%eax
 7ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7b1:	85 f6                	test   %esi,%esi
 7b3:	75 15                	jne    7ca <printf+0xfa>
          s = "(null)";
 7b5:	be 06 0a 00 00       	mov    $0xa06,%esi
 7ba:	eb 0e                	jmp    7ca <printf+0xfa>
          putc(fd, *s);
 7bc:	0f be d2             	movsbl %dl,%edx
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	e8 64 fe ff ff       	call   62b <putc>
          s++;
 7c7:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7ca:	0f b6 16             	movzbl (%esi),%edx
 7cd:	84 d2                	test   %dl,%dl
 7cf:	75 eb                	jne    7bc <printf+0xec>
      state = 0;
 7d1:	be 00 00 00 00       	mov    $0x0,%esi
 7d6:	e9 21 ff ff ff       	jmp    6fc <printf+0x2c>
        putc(fd, *ap);
 7db:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7de:	0f be 17             	movsbl (%edi),%edx
 7e1:	8b 45 08             	mov    0x8(%ebp),%eax
 7e4:	e8 42 fe ff ff       	call   62b <putc>
        ap++;
 7e9:	83 c7 04             	add    $0x4,%edi
 7ec:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7ef:	be 00 00 00 00       	mov    $0x0,%esi
 7f4:	e9 03 ff ff ff       	jmp    6fc <printf+0x2c>
        putc(fd, c);
 7f9:	89 fa                	mov    %edi,%edx
 7fb:	8b 45 08             	mov    0x8(%ebp),%eax
 7fe:	e8 28 fe ff ff       	call   62b <putc>
      state = 0;
 803:	be 00 00 00 00       	mov    $0x0,%esi
 808:	e9 ef fe ff ff       	jmp    6fc <printf+0x2c>
        putc(fd, '%');
 80d:	ba 25 00 00 00       	mov    $0x25,%edx
 812:	8b 45 08             	mov    0x8(%ebp),%eax
 815:	e8 11 fe ff ff       	call   62b <putc>
        putc(fd, c);
 81a:	89 fa                	mov    %edi,%edx
 81c:	8b 45 08             	mov    0x8(%ebp),%eax
 81f:	e8 07 fe ff ff       	call   62b <putc>
      state = 0;
 824:	be 00 00 00 00       	mov    $0x0,%esi
 829:	e9 ce fe ff ff       	jmp    6fc <printf+0x2c>
    }
  }
}
 82e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 831:	5b                   	pop    %ebx
 832:	5e                   	pop    %esi
 833:	5f                   	pop    %edi
 834:	5d                   	pop    %ebp
 835:	c3                   	ret    

00000836 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 836:	55                   	push   %ebp
 837:	89 e5                	mov    %esp,%ebp
 839:	57                   	push   %edi
 83a:	56                   	push   %esi
 83b:	53                   	push   %ebx
 83c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 83f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 842:	a1 28 0e 00 00       	mov    0xe28,%eax
 847:	eb 02                	jmp    84b <free+0x15>
 849:	89 d0                	mov    %edx,%eax
 84b:	39 c8                	cmp    %ecx,%eax
 84d:	73 04                	jae    853 <free+0x1d>
 84f:	39 08                	cmp    %ecx,(%eax)
 851:	77 12                	ja     865 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 853:	8b 10                	mov    (%eax),%edx
 855:	39 c2                	cmp    %eax,%edx
 857:	77 f0                	ja     849 <free+0x13>
 859:	39 c8                	cmp    %ecx,%eax
 85b:	72 08                	jb     865 <free+0x2f>
 85d:	39 ca                	cmp    %ecx,%edx
 85f:	77 04                	ja     865 <free+0x2f>
 861:	89 d0                	mov    %edx,%eax
 863:	eb e6                	jmp    84b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 865:	8b 73 fc             	mov    -0x4(%ebx),%esi
 868:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86b:	8b 10                	mov    (%eax),%edx
 86d:	39 d7                	cmp    %edx,%edi
 86f:	74 19                	je     88a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 871:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 874:	8b 50 04             	mov    0x4(%eax),%edx
 877:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 87a:	39 ce                	cmp    %ecx,%esi
 87c:	74 1b                	je     899 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 87e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 880:	a3 28 0e 00 00       	mov    %eax,0xe28
}
 885:	5b                   	pop    %ebx
 886:	5e                   	pop    %esi
 887:	5f                   	pop    %edi
 888:	5d                   	pop    %ebp
 889:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 88a:	03 72 04             	add    0x4(%edx),%esi
 88d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 890:	8b 10                	mov    (%eax),%edx
 892:	8b 12                	mov    (%edx),%edx
 894:	89 53 f8             	mov    %edx,-0x8(%ebx)
 897:	eb db                	jmp    874 <free+0x3e>
    p->s.size += bp->s.size;
 899:	03 53 fc             	add    -0x4(%ebx),%edx
 89c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 89f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a2:	89 10                	mov    %edx,(%eax)
 8a4:	eb da                	jmp    880 <free+0x4a>

000008a6 <morecore>:

static Header*
morecore(uint nu)
{
 8a6:	55                   	push   %ebp
 8a7:	89 e5                	mov    %esp,%ebp
 8a9:	53                   	push   %ebx
 8aa:	83 ec 04             	sub    $0x4,%esp
 8ad:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8af:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8b4:	77 05                	ja     8bb <morecore+0x15>
    nu = 4096;
 8b6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8bb:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8c2:	83 ec 0c             	sub    $0xc,%esp
 8c5:	50                   	push   %eax
 8c6:	e8 38 fd ff ff       	call   603 <sbrk>
  if(p == (char*)-1)
 8cb:	83 c4 10             	add    $0x10,%esp
 8ce:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d1:	74 1c                	je     8ef <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8d3:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8d6:	83 c0 08             	add    $0x8,%eax
 8d9:	83 ec 0c             	sub    $0xc,%esp
 8dc:	50                   	push   %eax
 8dd:	e8 54 ff ff ff       	call   836 <free>
  return freep;
 8e2:	a1 28 0e 00 00       	mov    0xe28,%eax
 8e7:	83 c4 10             	add    $0x10,%esp
}
 8ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ed:	c9                   	leave  
 8ee:	c3                   	ret    
    return 0;
 8ef:	b8 00 00 00 00       	mov    $0x0,%eax
 8f4:	eb f4                	jmp    8ea <morecore+0x44>

000008f6 <malloc>:

void*
malloc(uint nbytes)
{
 8f6:	55                   	push   %ebp
 8f7:	89 e5                	mov    %esp,%ebp
 8f9:	53                   	push   %ebx
 8fa:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8fd:	8b 45 08             	mov    0x8(%ebp),%eax
 900:	8d 58 07             	lea    0x7(%eax),%ebx
 903:	c1 eb 03             	shr    $0x3,%ebx
 906:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 909:	8b 0d 28 0e 00 00    	mov    0xe28,%ecx
 90f:	85 c9                	test   %ecx,%ecx
 911:	74 04                	je     917 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 913:	8b 01                	mov    (%ecx),%eax
 915:	eb 4a                	jmp    961 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 917:	c7 05 28 0e 00 00 2c 	movl   $0xe2c,0xe28
 91e:	0e 00 00 
 921:	c7 05 2c 0e 00 00 2c 	movl   $0xe2c,0xe2c
 928:	0e 00 00 
    base.s.size = 0;
 92b:	c7 05 30 0e 00 00 00 	movl   $0x0,0xe30
 932:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 935:	b9 2c 0e 00 00       	mov    $0xe2c,%ecx
 93a:	eb d7                	jmp    913 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 93c:	74 19                	je     957 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 93e:	29 da                	sub    %ebx,%edx
 940:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 943:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 946:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 949:	89 0d 28 0e 00 00    	mov    %ecx,0xe28
      return (void*)(p + 1);
 94f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 952:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 955:	c9                   	leave  
 956:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 957:	8b 10                	mov    (%eax),%edx
 959:	89 11                	mov    %edx,(%ecx)
 95b:	eb ec                	jmp    949 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95d:	89 c1                	mov    %eax,%ecx
 95f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 961:	8b 50 04             	mov    0x4(%eax),%edx
 964:	39 da                	cmp    %ebx,%edx
 966:	73 d4                	jae    93c <malloc+0x46>
    if(p == freep)
 968:	39 05 28 0e 00 00    	cmp    %eax,0xe28
 96e:	75 ed                	jne    95d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 970:	89 d8                	mov    %ebx,%eax
 972:	e8 2f ff ff ff       	call   8a6 <morecore>
 977:	85 c0                	test   %eax,%eax
 979:	75 e2                	jne    95d <malloc+0x67>
 97b:	eb d5                	jmp    952 <malloc+0x5c>
