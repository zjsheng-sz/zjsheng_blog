
[关于iOS多线程，你看我就够了](https://www.jianshu.com/p/0b0d9b1f1f19)

### Thread

```objc
  // 先创建线程类，再启动
  // 创建
  NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
  // 启动
  [thread start];

  //创建并自动启动
  [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:nil];


  //其他方法

  //取消线程
  - (void)cancel;
  //启动线程
  - (void)start;
  //判断某个线程的状态的属性
  @property (readonly, getter=isExecuting) BOOL executing;
  @property (readonly, getter=isFinished) BOOL finished;
  @property (readonly, getter=isCancelled) BOOL cancelled;
  //设置和获取线程名字
  -(void)setName:(NSString \*)name;
  -(NSString \*)name;
  //获取当前线程信息
  + (NSThread \*)currentThread;
  //获取主线程信息
  + (NSThread \*)mainThread;
  //使当前线程暂停一段时间，或者暂停到某个时刻
  + (void)sleepForTimeInterval:(NSTimeInterval)time;
  + (void)sleepUntilDate:(NSDate \*)date;

```
