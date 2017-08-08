
###  xx

#### [ios怎么查看内存泄露](https://zhidao.baidu.com/question/136687099497027245.html)
1. 静态分析，初步了解有无内存泄漏
2. instrument，循环操作看有没有内存增加
3. 代码检测，看有没走dealloc方法

#### [导致内存泄漏的主要场景以及解决方法](http://www.cnblogs.com/MasterPeng/p/5620809.html)

1. 循环参照
2. block循环引用
3. 动画时间很长未关闭
4. [VC的定时器未关闭](http://www.cnblogs.com/agger0207/p/4419348.html):如果target引用nstimer并且timer引用target

#### [NSNotificationCenter为什么add remove要成对出现](http://www.07net01.com/2015/08/900423.html)


#### [僵尸模式NSZombieEnabled](http://www.xuebuyuan.com/2174541.html)


#### [一步步调试解决iOS内存泄漏](http://itindex.net/detail/52055-%E8%B0%83%E8%AF%95-ios-%E5%86%85%E5%AD%98%E6%B3%84%E6%BC%8F)
