## Effective Objective-C Notes：GCD 实现同步锁


[GCD 实现同步锁](https://www.zybuluo.com/MicroCai/note/64272)

---
> 内置的同步锁

这种写法会根据给定对象，自动创建一个锁，并等待块中的代码执行完毕，才释放锁。这段代码本身没什么问题，但是因为 @synchronized(self) 锁的对象是 self，造成共用此锁的同步块阻塞，降低效率。

```objc
// someString 属性
// 当 someString 开始读时，对其的写入阻塞，这是合理的；
- (NSString *)someString
{
    @synchronized(self) {
        return _someString;
    }
}
- (NSString *)setSomeString:(NSString *)someString
{
    @synchronized(self) {
        _someString = someString;
    }
}
//otherString 属性
// 当线程在对 someString 进行读写时，与之无关的 otherString 也会受到干扰阻塞，这是不合理的；
- (NSString *)otherString
{
    @synchronized(self) {
        return _otherString;
    }
}
- (NSString *)setOtherString:(NSString *)otherString
{
    @synchronized(self) {
        _otherString = otherString;
    }
}
```


* NSLock 对象

递归调用时候可能会出现死锁

```objc
_lock = [[NSLock alloc] init];
- (void)synchronizedMethod
{
    [_lock lock];
    //safe code...
    [_lock unlock];
}
```

* 用 GCD 实现同步机制

```objc

_syncQueue = dispatch_queue_create("com.effectiveObjectiveC.syncQueue", NULL);
- (NSString *)someString
{
    __weak NSString *localSomeString;
    dispatch_sync(_syncQueue, ^{
        localSomeString = _someString;
    });
    return localSomeString;
}
- (void)setSomeString:(NSString *)someString
{
    dispatch_sync(_syncQueue, ^{
        _someString = someString;
    });
}

```
