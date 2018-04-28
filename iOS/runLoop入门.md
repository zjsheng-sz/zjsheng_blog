

# RunLoop

* [文档](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Multithreading/RunLoopManagement/RunLoopManagement.html)
* [文档翻译](http://www.lxway.com/148204814.htm)  


> [深入理解RunLoop](http://www.cocoachina.com/ios/20150601/11970.html) 内容深刻详细  
> [iOS-RunLoop充满灵性的死循环](https://www.jianshu.com/p/b9426458fcf6)  生动  
> [RunLoop入门 看我就够了](https://www.jianshu.com/p/2d3c8e084205)   上两者的结合，最简洁


## RunLoop简介

从字面上看，就可以看出就是兜圈圈，就是do-while

## 作用

* 保持程序持续运行

* 处理App中的各种事件

* 节省CPU资源，提高程序性能

## 基础知识

###  两个API

Foundation  
NSRunLoop

Core Foundation  
CFRunLoopRef

### RunLoop与线程

1. 每条线程都有唯一的与之对应的RunLoop对象。
2. 主线程的RunLoop已经创建好了，而子线程的需要手动创建。（也就是说子线程的RunLoop默认是关闭的，因为有时候开了个线程但却没有必要开一个RunLoop，不然反而浪费了资源。 ）
3. RunLoop在第一次获取时创建，在线程结束时销毁。（这就相当于 线程是一个类，RunLoop是类里的实例变量，这样便于理解）

### 获取RunLoop对象

```objc
// Foundation
[NSRunLoop currentRunLoop]; // 获得当前线程的RunLoop对象
[NSRunLoop mainRunLoop]; // 获得主线程的RunLoop对象
// Core Foundation
CFRunLoopGetCurrent(); // 获得当前线程的RunLoop对象
CFRunLoopGetMain(); // 获得主线程的RunLoop对象
```

### RunLoop相关类  

在Core Foundation中有RunLoop的五个类

```objc
CFRunLoopRef
CFRunLoopModeRef
CFRunLoopSourceRef
CFRunLoopTimerRef
CFRunLoopObserverRef
```

1. CFRunLoopModeRef代表的是RunLoop的运行模式。  
2. 一个 RunLoop 包含若干个 Mode，每个 Mode 又包含若干个 Source/Timer/Observer。  
3. 每次调用 RunLoop 的主函数时，只能指定其中一个 Mode，这个Mode被称作 CurrentMode。   
4. 如果需要切换 Mode，只能退出 Loop，再重新指定一个 Mode 进入。这样做主要是为了分隔开不同组的   Source/Timer/Observer，让其互不影响。  

系统默认注册了5个mode

```objc
    kCFRunLoopDefaultMode //App的默认Mode，通常主线程是在这个Mode下运行
    UITrackingRunLoopMode //界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
    UIInitializationRunLoopMode // 在刚启动 App 时第进入的第一个 Mode，启动完成后就不再使用
    GSEventReceiveRunLoopMode // 接受系统事件的内部 Mode，通常用不到
    kCFRunLoopCommonModes //这是一个占位用的Mode，不是一种真正的Mode
```

CFRunLoopSourseRef是事件源，分为两种: sourse0、sourse1

CFRunLoopObserver是观察者，可以监听runLoop的状态改变
监听的状态如下：

```objc
typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
kCFRunLoopEntry = (1UL << 0), //即将进入Runloop
kCFRunLoopBeforeTimers = (1UL << 1), //即将处理NSTimer
kCFRunLoopBeforeSources = (1UL << 2), //即将处理Sources
kCFRunLoopBeforeWaiting = (1UL << 5), //即将进入休眠
kCFRunLoopAfterWaiting = (1UL << 6), //刚从休眠中唤醒
kCFRunLoopExit = (1UL << 7), //即将退出runloop
kCFRunLoopAllActivities = 0x0FFFFFFFU //所有状态改变};
```

## 实验讲解

### main函数的实验

### NSTimer的使用

```objc
// scheduledTimer
[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];

// timerWithTime
NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

//scheduledTimer方法会自动添加到当前的runloop里面去，而且runloop的运行模式kCFRunLoopDefaultMode，也就是说实验一已经将timer自动加入到了一个运行模式为kCFRunLoopDefaultMode的runloop中

```

### 有scrollView的情况下使用Timer

```objc

NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
```
### 有关CFRunLoopSourseRef的实验

button的点击是属于sourse0

### CFRunLoopObserverRef

```objc

CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"--------%zd", activity);
    });

CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);  // 添加监听者，关键！
CFRelease(observer); // 释放
}
```
