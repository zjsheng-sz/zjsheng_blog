
## Runtime 使用场景

###[iOS开发探索-Runtime原理解读及实践](https://www.jianshu.com/p/462b88edbe5c)

> lib: Runtime

1. 动态变量控制: object_setIvar

```objc

- (void)changeVariable {

    Student \*student = [Student new];
    student.name = @"乔布斯";
    NSLog(@"%@",student.name);
    unsigned int count;
    Ivar \*ivar = class_copyIvarList([student class], &count);
    for (int i = 0; i< count; i++) {
        Ivar var = ivar[i];
        const char \*varName = ivar_getName(var);
        NSString \*name = [NSString stringWithCString:varName encoding:NSUTF8StringEncoding];
        if ([name isEqualToString:@"\_name"]) {
            object_setIvar(student, var, @"Steve Jobs");
            break;
        }
    }
    NSLog(@"%@",student.name);   
}

```


2. 动态添加方法:class_addMethod

```objc

void happyNewYear(id self, SEL \_cmd){
        NSLog(@"新年快乐");
    }
// 注意:
// 1.void的前面没有+、-号，因为只是C的代码。
// 2.必须有两个指定参数(id self,SEL \_cmd)
    - (void)addMethod
    {
        Student \*student = [Student new];
        student.name = @"乔布斯";
        class_addMethod([student class], @selector(join), (IMP)happyNewYear, "v@:");
        [student performSelector:@selector(join)];
    }

// 参数说明：
// (IMP)happyNewYear 意思是happyNewYear的地址指针;
// "v@:" 意思是，v代表无返回值void，如果是i则代表int；@代表 id sel; : 代表 SEL _cmd;
// “v@:@@” 意思是，两个参数的没有返回值。

//输出结果
// 2016-02-22 11:10:06.379 Day2016-02-04[9296:1003059] 新年快乐

```


3. 动态为Category扩展加属性: objc_setAssociatedObject, objc_getAssociatedObject

```objc

// XCode运行你在Category的.h文件申明@Property，编译通过，但运行时如果没有Runtime处理，进行赋值取值，就马上报错。
//  首先添加分类Student+Category
// Student+Category.h文件
    #import "Student.h"
    @interface Student (Category)
    @property(nonatomic,copy)NSString \*firstName;
    @end
// Student+Category.m文件
    #import "Student+Category.h"
    #import <objc/runtime.h>
    @implementation Student (Category)
    const char name;
    - (void)setFirstName:(NSString \*)firstName  {
        objc_setAssociatedObject(self, &name, firstName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    -(NSString \*)firstName {
       return  objc_getAssociatedObject(self, &name);
    }
    @end

// > 调用实现
    - (void)addExtentionProperty
    {
        Student \*student = [Student new];
        student.firstName = @"Steve";
        NSLog(@"添加属性firstName结果:%@ ",student.firstName);
    }
// > 输出结果:
// ```2016-02-22 11:21:58.765 Day2016-02-04[9354:1010756] 添加属性firstName结果:Steve ```

```

4. 动态交换方法实现: method_exchangeImplementations

```objc
- (void)exchangeMethod
    {
        Student \*student = [Student new];
        student.name = @"乔布斯";
        [student eat];
        [student sleep];

        NSLog(@"----------交换方法实现-----------");
        Method m1 = class_getInstanceMethod([student class], @selector(eat));
        Method m2 = class_getInstanceMethod([student class], @selector(sleep));
        method_exchangeImplementations(m1, m2);

        [student eat];
        [student sleep];
    }

```
