
### iOS性能优化

[iOS应用性能调优的25个建议和技巧](http://www.cocoachina.com/ios/20150408/11501.html)

> 初级性能提升

1. 在正确的地方使用reuseIdentifier

2. 避免庞大的XIB

3. 不要阻塞主线程

4. 在Image Views中调整图片大小

5. 选择正确的Collection


> 中级性能提升

6. 重用和延迟加载(lazy load) Views

  不要一次创建所有的subview，而是当需要时才创建，当它们完成了使命，把他们放进一个可重用的队列中

7. Cache

  一个极好的原则就是，缓存所需要的，也就是那些不大可能改变但是需要经常读取的东西。

8. 权衡渲染方法


9. 重用大开销对象

  NSDateFormatter . NSCalendar  可以通过添加属性到你的class里或者创建静态变量来实现

10. 选择是否缓存图片
