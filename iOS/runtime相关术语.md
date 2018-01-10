


### [可能碰到的iOS笔试面试题](https://www.jianshu.com/p/82860fd8222c)
### [Objective-C Runtime](https://developer.apple.com/documentation/objectivec/objective_c_runtime)
### [Objective-C Runtime Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Introduction/Introduction.html)


## Runtime的相关术语

* SEL

它是selector在 Objc 中的表示(Swift 中是 Selector 类)。selector 是方法选择器，其实作用就和名字一样，日常生活中，我们通过人名辨别谁是谁，注意 Objc 在相同的类中不会有命名相同的两个方法。selector 对方法名进行包装，以便找到对应的方法实现。它的数据结构是：

```objc
  typedef struct objc_selector \*SEL;
```
我们可以看出它是个映射到方法的 C 字符串，你可以通过 Objc 编译器器命令@selector() 或者 Runtime 系统的 sel_registerName 函数来获取一个 SEL 类型的方法选择器。
注意：不同类中相同名字的方法所对应的 selector 是相同的，由于变量的类型不同，所以不会导致它们调用方法实现混乱。

* id

id 是一个参数类型，它是指向某个类的实例的指针。定义如下：

```objc
  typedef struct objc_object \*id;
  struct objc_object { Class isa; };
```

以上定义，看到 objc_object 结构体包含一个 isa 指针，根据 isa 指针就可以找到对象所属的类。
注意：isa 指针在代码运行时并不总指向实例对象所属的类型，所以不能依靠它来确定类型，要想确定类型还是需要用对象的 -class 方法。PS:KVO 的实现机理就是将被观察对象的 isa 指针指向一个中间类而不是真实类型。

* Class

```objc

  typedef struct objc_class *Class;

```
Class 其实是指向 objc_class 结构体的指针。objc_class 的数据结构如下：

```objc
  struct objc_class {
      Class isa  OBJC_ISA_AVAILABILITY;
  #if !__OBJC2__
      Class super_class                                        OBJC2_UNAVAILABLE;
      const char \*name                                         OBJC2_UNAVAILABLE;
      long version                                             OBJC2_UNAVAILABLE;
      long info                                                OBJC2_UNAVAILABLE;
      long instance_size                                       OBJC2_UNAVAILABLE;
      struct objc_ivar_list \*ivars                             OBJC2_UNAVAILABLE;
      struct objc_method_list \**methodLists                    OBJC2_UNAVAILABLE;
      struct objc_cache \*cache                                 OBJC2_UNAVAILABLE;
      struct objc_protocol_list \*protocols                     OBJC2_UNAVAILABLE;
  #endif
  } OBJC2_UNAVAILABLE;

  // 成员变量列表
  struct objc_ivar_list {
      int ivar_count                                           OBJC2_UNAVAILABLE;
  #ifdef __LP64__
      int space                                                OBJC2_UNAVAILABLE;
  #endif
      /* variable length structure \*/
      struct objc_ivar ivar_list[1]                            OBJC2_UNAVAILABLE;
  }                                                            OBJC2_UNAVAILABLE;

  // 方法列表
  struct objc_method_list {
      struct objc_method_list \*obsolete                        OBJC2_UNAVAILABLE;

      int method_count                                         OBJC2_UNAVAILABLE;
  #ifdef __LP64__
      int space                                                OBJC2_UNAVAILABLE;
  #endif
      /* variable length structure \*/
      struct objc_method method_list[1]                        OBJC2_UNAVAILABLE;
  }

```
由此可见，我们可以动态修改 \*methodList 的值来添加成员方法，这也是 Category 实现的原理，同样解释了 Category 不能添加属性的原因。

objc_ivar_list 结构体用来存储成员变量的列表，而 objc_ivar 则是存储了单个成员变量的信息；同理，objc_method_list 结构体存储着方法数组的列表，而单个方法的信息则由 objc_method 结构体存储。

值得注意的时，objc_class 中也有一个 isa 指针，这说明 Objc 类本身也是一个对象。为了处理类和对象的关系，Runtime 库创建了一种叫做 Meta Class(元类) 的东西，类对象所属的类就叫做元类。Meta Class 表述了类对象本身所具备的元数据。

我们所熟悉的类方法，就源自于 Meta Class。我们可以理解为类方法就是类对象的实例方法。每个类仅有一个类对象，而每个类对象仅有一个与之相关的元类。

当你发出一个类似 [NSObject alloc](类方法) 的消息时，实际上，这个消息被发送给了一个类对象(Class Object)，这个类对象必须是一个元类的实例，而这个元类同时也是一个根元类(Root Meta Class)的实例。所有元类的 isa 指针最终都指向根元类。

所以当 [NSObject alloc] 这条消息发送给类对象的时候，运行时代码 objc_msgSend() 会去它元类中查找能够响应消息的方法实现，如果找到了，就会对这个类对象执行方法调用。

最后 objc_class 中还有一个 objc_cache ，缓存，它的作用很重要，后面会提到。


* Method

```objc

typedef struct objc_method *Method;
struct objc_method {
    SEL method_name                                          OBJC2_UNAVAILABLE;
    char \*method_types                                       OBJC2_UNAVAILABLE;
    IMP method_imp                                           OBJC2_UNAVAILABLE;
}

```

* Ivar

```objc

typedef struct objc_ivar *Ivar;
struct objc_ivar {
    char \*ivar_name                                          OBJC2_UNAVAILABLE;
    char \*ivar_type                                          OBJC2_UNAVAILABLE;
    int ivar_offset                                          OBJC2_UNAVAILABLE;
#ifdef __LP64__
    int space                                                OBJC2_UNAVAILABLE;
#endif
}

```

* IMP

IMP在objc.h中的定义是：

```objc
        typedef id (\*IMP)(id, SEL, ...);
```

它就是一个函数指针，这是由编译器生成的。当你发起一个 ObjC 消息之后，最终它会执行的那段代码，就是由这个函数指针指定的。而 IMP 这个函数指针就指向了这个方法的实现。

如果得到了执行某个实例某个方法的入口，我们就可以绕开消息传递阶段，直接执行方法，这在后面 Cache 中会提到。

你会发现 IMP 指向的方法与 objc_msgSend 函数类型相同，参数都包含 id 和 SEL 类型。每个方法名都对应一个 SEL 类型的方法选择器，而每个实例对象中的 SEL 对应的方法实现肯定是唯一的，通过一组 id和 SEL 参数就能确定唯一的方法实现地址。

而一个确定的方法也只有唯一的一组 id 和 SEL 参数。


* Cache

Cache 定义如下：

```objc
typedef struct objc_cache \*Cache
struct objc_cache {
    unsigned int mask /* total = mask + 1 \*/                 OBJC2_UNAVAILABLE;
    unsigned int occupied                                    OBJC2_UNAVAILABLE;
    Method buckets[1]                                        OBJC2_UNAVAILABLE;
};
```

Cache 为方法调用的性能进行优化，每当实例对象接收到一个消息时，它不会直接在 isa 指针指向的类的方法列表中遍历查找能够响应的方法，因为每次都要查找效率太低了，而是优先在 Cache 中查找。

Runtime 系统会把被调用的方法存到 Cache 中，如果一个方法被调用，那么它有可能今后还会被调用，下次查找的时候就会效率更高。就像计算机组成原理中 CPU 绕过主存先访问 Cache 一样。

* Property

```objc
typedef struct objc_property *Property;
typedef struct objc_property *objc_property_t;//这个更常用
可以通过class_copyPropertyList 和 protocol_copyPropertyList 方法获取类和协议中的属性：

objc_property_t *class_copyPropertyList(Class cls, unsigned int *outCount)
objc_property_t *protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
注意：
返回的是属性列表，列表中每个元素都是一个 objc_property_t 指针
#import <Foundation/Foundation.h>
@interface Person : NSObject
/** 姓名 \*/
@property (strong, nonatomic) NSString *name;
/** age \*/
@property (assign, nonatomic) int age;
/** weight \*/
@property (assign, nonatomic) double weight;
@end
以上是一个 Person 类，有3个属性。让我们用上述方法获取类的运行时属性。

    unsigned int outCount = 0;

    objc_property_t *properties = class_copyPropertyList([Person class], &outCount);

    NSLog(@"%d", outCount);

    for (NSInteger i = 0; i < outCount; i++) {
        NSString \*name = @(property_getName(properties[i]));
        NSString \*attributes = @(property_getAttributes(properties[i]));
        NSLog(@"%@--------%@", name, attributes);
    }
打印结果如下：

test[2321:451525] 3
test[2321:451525] name--------T@"NSString",&,N,V_name
test[2321:451525] age--------Ti,N,V_age
test[2321:451525] weight--------Td,N,V_weight
property_getName 用来查找属性的名称，返回 c 字符串。property_getAttributes 函数挖掘属性的真实名称和 @encode 类型，返回 c 字符串。

objc_property_t class_getProperty(Class cls, const char *name)
objc_property_t protocol_getProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
class_getProperty 和 protocol_getProperty 通过给出属性名在类和协议中获得属性的引用。

```
