## 多线程

[五个案例让你明白GCD死锁](http://www.superqq.com/blog/2015/10/16/five-case-know-gcd/)

[dispatch_sync(dispatch_get_main_queue(), ^{NSLog(@"Hello ?");}); 死锁的原因
](https://www.zhihu.com/question/23338200)


>Queue（队列）队列分为串行和并行队列：

* 串行队列上面依次添加A、B、C、D4个任务，这4个任务按顺序执行，结束顺序也是A,B,C,D。  
* 并行队列上面依次添加A、B、C、D4个任务，这4个任务同时执行，完成的顺序是随机的。  

>Async VS Sync（异步执行和同步执行）

* dispatch_Async调用1个Block，会把这个Block放到指定的队列尾等待执行，dispatch_Async会马上返回执行下面的内容。
* dispatch_sync调用1个Block，会把这个Block放到指定的队列尾等待执行,dispatch_sync会等待Block执行完毕才会返回，阻塞当前Queue直到Sync返回。

串行与并行针对的是队列，而同步与异步，针对的则是线程


### GCD API
> 系统标准提供的两个队列

```objc
// 全局队列，也是一个并行队列
dispatch_get_global_queue

// 主队列，在主线程中运行，因为主线程只有一个，所以这是一个串行队列
dispatch_get_main_queue
```

> 除此之外，还可以自己生成队列

```objc
// 从DISPATCH_QUEUE_SERIAL看出，这是串行队列

 dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL)

 // 同理，这是一个并行队列

 dispatch_queue_create("com.demo.concurrentQueue", DISPATCH_QUEUE_CONCURRENT)

```

> 同步与异步线程的创建

```objc
dispatch_sync(..., ^(block)) // 同步线程

dispatch_async(..., ^(block)) // 异步线程
```

### 五个案例


> 案例一

```objc

NSLog(@"1"); // 任务1

dispatch_sync(dispatch_get_main_queue(), ^{

    NSLog(@"2"); // 任务2

});
NSLog(@"3"); // 任务3

```

> 案例二

```objc
NSLog(@"1"); // 任务1

dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{

    NSLog(@"2"); // 任务2

});

NSLog(@"3"); // 任务3

```


> 案例三

```objc

dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);

NSLog(@"1"); // 任务1

dispatch_async(queue, ^{

    NSLog(@"2"); // 任务2

    dispatch_sync(queue, ^{  

        NSLog(@"3"); // 任务3

    });

    NSLog(@"4"); // 任务4

});

NSLog(@"5"); // 任务5

```


> 案例四

```objc
NSLog(@"1"); // 任务1

dispatch_async(dispatch_get_global_queue(0, 0), ^{

    NSLog(@"2"); // 任务2

    dispatch_sync(dispatch_get_main_queue(), ^{

        NSLog(@"3"); // 任务3

    });

    NSLog(@"4"); // 任务4

});

NSLog(@"5"); // 任务5

```


> 案例五

```objc

dispatch_async(dispatch_get_global_queue(0, 0), ^{

    NSLog(@"1"); // 任务1

    dispatch_sync(dispatch_get_main_queue(), ^{

        NSLog(@"2"); // 任务2

    });

    NSLog(@"3"); // 任务3

});

NSLog(@"4"); // 任务4

while (1) {

}

NSLog(@"5"); // 任务5

```
