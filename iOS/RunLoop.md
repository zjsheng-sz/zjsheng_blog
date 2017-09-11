
# Run Loops

* [文档](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Multithreading/RunLoopManagement/RunLoopManagement.html)
* [文档翻译](http://www.lxway.com/148204814.htm)  
* [简单的介绍](http://www.cnblogs.com/cqb-learner/p/5860425.html)

  1. 手势与定时器事件冲突  
  2. 手势与异步下载  
  3. 切换运行模式 手势与异步下载共存  

## Anatomy of a Run Loop
### Run Loop Modes

run loop mode is a collection of input sources and timers to be monitored and a collection of run loop observers to be notified. Each time you run your run loop, you specify (either explicitly or implicitly) a particular “mode” in which to run. During that pass of the run loop, only sources associated with that mode are monitored and allowed to deliver their events. (Similarly, only observers associated with that mode are notified of the run loop’s progress.) Sources associated with other modes hold on to any new events until subsequent passes through the loop in the appropriate mode.
