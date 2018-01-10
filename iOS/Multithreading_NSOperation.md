[关于iOS多线程，你看我就够了](https://www.jianshu.com/p/0b0d9b1f1f19)

## NSOperationQueue

NSOperation 和 NSOperationQueue 分别对应 GCD 的 任务 和 队列

### 添加任务

方法一: NSInvocationOperation

```objc
 //1.创建NSInvocationOperation对象
  NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];

  //2.开始执行
  [operation start];

```

方法二：NSBlockOperation

```objc

 //1.创建NSBlockOperation对象
  NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
      NSLog(@"%@", [NSThread currentThread]);
  }];

  //2.开始任务
  [operation start];

```

 添加并发任务：addExecutionBlock: ，通过这个方法可以给 Operation 添加多个执行 Block。这样 Operation 中的任务 会并发执行

 > NOTE：addExecutionBlock 方法必须在 start() 方法之前执行，否则就会报错：

```objc
//1.创建NSBlockOperation对象
      NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
          NSLog(@"%@", [NSThread currentThread]);
      }];

      //添加多个Block
      for (NSInteger i = 0; i < 5; i++) {
          [operation addExecutionBlock:^{
              NSLog(@"第%ld次：%@", i, [NSThread currentThread]);
          }];
      }

      //2.开始任务
      [operation start];
```

### 创建队列

* 主队列

```objc

NSOperationQueue *queue = [NSOperationQueue mainQueue];

```

* 其他队列

```objc

//1.创建一个其他队列    
NSOperationQueue *queue = [[NSOperationQueue alloc] init];

```
将 NSOperationQueue 与 GCD的队列 相比较就会发现，这里没有串行队列，那如果我想要10个任务在其他线程串行的执行怎么办？
参数 maxConcurrentOperationCount 最大并发数，用来设置最多可以让多少个任务同时执行。当你把它设置为 1 的时候，他不就是串行了嘛！


* 直接队列添加任务

NSOperationQueue 还有一个添加任务的方法，- (void)addOperationWithBlock:(void (^)(void))block; ，这是不是和 GCD 差不多？这样就可以添加一个任务到队列中了，十分方便


### 任务依赖

```objc
//1.任务一：下载图片
NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
    NSLog(@"下载图片 - %@", [NSThread currentThread]);
    [NSThread sleepForTimeInterval:1.0];
}];

//2.任务二：打水印
NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
    NSLog(@"打水印   - %@", [NSThread currentThread]);
    [NSThread sleepForTimeInterval:1.0];
}];

//3.任务三：上传图片
NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
    NSLog(@"上传图片 - %@", [NSThread currentThread]);
    [NSThread sleepForTimeInterval:1.0];
}];

//4.设置依赖
[operation2 addDependency:operation1];      //任务二依赖任务一
[operation3 addDependency:operation2];      //任务三依赖任务二

//5.创建队列并加入任务
NSOperationQueue *queue = [[NSOperationQueue alloc] init];
[queue addOperations:@[operation3, operation2, operation1] waitUntilFinished:NO];

```


### 其他方法

* NSOperation

        BOOL executing; //判断任务是否正在执行

        BOOL finished; //判断任务是否完成

        void (^completionBlock)(void); //用来设置完成后需要执行的操作

        - (void)cancel; //取消任务

        - (void)waitUntilFinished; //阻塞当前线程直到此任务执行完毕


* NSOperationQueue

        NSUInteger operationCount; //获取队列的任务数

        - (void)cancelAllOperations; //取消队列中所有的任务

        - (void)waitUntilAllOperationsAreFinished; //阻塞当前线程直到此队列中的所有任务执行完毕

        [queue setSuspended:YES]; // 暂停queue

        [queue setSuspended:NO]; // 继续queue
