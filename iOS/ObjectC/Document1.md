
# ObjectC文档

* [文档](https://developer.apple.com/library/prerelease/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210)

[命名规则](#命名规则)  
[Values and Collections](#Values and Collections)  
[Working with Protocols](#Working with Protocols)  
[Customizing Existing Classes](#Customizing Existing Classes)  
[Encapsulating Data](#Encapsulating Data)  

## 命名规则

### 一些名称必须在程序中唯一

  类名应在程序中唯一

      在命名类时使用前缀命名可以保证类名唯一

  类中的方法名应具描述性且唯一

      方法名的第一部分提示方法的主要作用或提示方法调用后的结果

  在框架类的 Categories 中使用前缀命名方法

      当使用 Category 来创建方法到一个已经存在的框架类时，你需要在方法名中使用前缀来避免冲突。

### 同一区域内局部变量名必须唯一

---

##  Values and Collections

### 你可以使用C中的基本数据类型

    像 NSInteger 和 NSUInteger 这样的类型，在不同的系统结构中有不同的定义方式。当为 32 位运行环境(例如 IOS)编程时，他们分别是 32 位的有符号整数和无符号整数;当为 64 位运行环境(例如 modern OS X runti me)编程时，他们分别是 64 位的有符号整数和无符号整数

### 对象可以表示基本数值
    通过NSString类的实例表示Strings

    通过NSNumber类的实例表示数字

    使用NSValue类的实例表示其他值

### 大多数集合都是对象

    数组是有序的集合
    无序集合:Sets
    字典是一种存储键值对的集合
    使用NSNull代替nil

### 使用集合来保存对象的图形

### 使用最有效的集合列举技术


---


## Working with Protocols

### Protocols Define Messaging Contracts

  is used to declare methods and properties that are independent of any specific class

```objc

  @protocol XYZPieChartViewDataSource
  - (NSUInteger)numberOfSegments;
  - (CGFloat)sizeOfSegmentAtIndex:(NSUInteger)segmentIndex;
  @optional
  - (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex;
  - (BOOL)shouldExplodeSegmentAtIndex:(NSUInteger)segmentIndex;
  @required
  - (UIColor *)colorForSegmentAtIndex:(NSUInteger)segmentIndex;
  @end

  //This example defines a protocol with three required methods and two optional methods.

```

  If a method in a protocol is marked as optional, you must check whether an object implements that method before attempting to call it.

### Conforming to Protocols

  Tip: If you find yourself adopting a large number of protocols in a class, it may be a sign that you need to refactor an overly-complex class by splitting the necessary behavior across multiple smaller classes, each with clearly-defined responsibilities.

  Once you’ve indicated conformance to a protocol, the class must at least provide method implementations for each of the required protocol methods, as well as any optional methods you choose. The compiler will warn you if you fail to implement any of the required methods.

### Protocols Are Used for Anonymity

  Protocols are also useful in situations where the class of an object isn’t known, or needs to stay hidden.

```objc

id <XYZFrameworkUtility> utility = [frameworkObject anonymousUtility];

id <NSFetchedResultsSectionInfo> sectionInfo =
[self.fetchedResultsController.sections objectAtIndex:sectionNumber];

NSInteger numberOfRowsInSection = [sectionInfo numberOfObjects];

```

---

## Customizing Existing Classes

### Categories Add Methods to Existing Classes

  As well as just adding methods to existing classes, you can also use categories to split the implementation of a complex class across multiple source code files

  Categories can be used to declare either instance methods or class methods but are not usually suitable for declaring additional properties. It’s valid syntax to include a property declaration in a category interface, but it’s not possible to declare an additional instance variable in a category. This means the compiler won’t synthesize any instance variable, nor will it synthesize any property accessor methods. You can write your own accessor methods in the category implementation, but you won’t be able to keep track of a value for that property unless it’s already stored by the original class.

  The only way to add a traditional property—backed by a new instance variable—to an existing class is to use a class extension

### Avoid Category Method Name Clashes

  In order to avoid undefined behavior, it’s best practice to add a prefix to method names in categories on framework classes, just like you should add a prefix to the names of your own classes

### Class Extensions Extend the Internal Implementation

  A class extension bears some similarity to a category, but it can only be added to a class for which you have the source code at compile time (the class is compiled at the same time as the class extension). The methods declared by a class extension are implemented in the @implementation block for the original class so you can’t, for example, declare a class extension on a framework class, such as a Cocoa or Cocoa Touch class like NSString.

### Use Class Extensions to Hide Private Information

  Class extensions are often used to extend the public interface with additional private methods or properties for use within the implementation of the class itself. It’s common, for example, to define a property as readonly in the interface, but as readwrite in a class extension declared above the implementation, in order that the internal methods of the class can change the property value directly.

  Note: The readwrite attribute is optional, because it’s the default. You may like to use it when redeclaring a property, for clarity.

  类扩展通常用于扩展额外的私有方法或属性的公共接口以便在类本身的实现中使用

### Consider Other Alternatives for Class Customization


---


## Encapsulating Data

### Properties Encapsulate an Object’s Values

#### Declare Public Properties for Exposed Data

#### Use Accessor Methods to Get or Set Property Values

#### Dot Syntax Is a Concise Alternative to Accessor Method Calls

#### Most Properties Are Backed by Instance Variables

  An instance variable is a variable that exists and holds its value for the life of the object. The memory used for instance variables is allocated when the object is first created (through alloc), and freed when the object is deallocated.

  Unless you specify otherwise, the synthesized instance variable has the same name as the property, but with an underscore prefix. For a property called firstName, for example, the synthesized instance variable will be called `_firstName`.

  In general, you should use accessor methods or dot syntax for property access even if you’re accessing an object’s properties from within its own implementation, in which case you should use self:

  ```object
  - (void)someMethod {
      NSString *myString = @"An interesting string";

      self.someString = myString;
    // or
      [self setSomeString:myString];
  }

  ```
  The exception to this rule is when writing initialization, deallocation or custom accessor methods

  >You Can Customize Synthesized Instance Variable Names
  ```object
  /*
  In this case, the property will still be called firstName, and be accessible through firstName and setFirstName: accessor methods or dot syntax, but it will be backed by an instance variable called ivar_firstName.
  */
  @synthesize firstName = ivar_firstName;

  /*the instance variable will bear the same name as the property.*/

  @synthesize firstName;
  ```

  >You Can Define Instance Variables without Properties

#### Access Instance Variables Directly from Initializer Methods

  Setter methods can have additional side-effects. They may trigger KVC notifications, or perform further tasks if you write your own custom methods

  You should always access the instance variables directly from within an initialization method because at the time a property is set, the rest of the object may not yet be completely initialized. Even if you don’t provide custom accessor methods or know of any side effects from within your own class, a future subclass may very well override the behavior.

  >The Designated Initializer is the Primary Initialization Method

  If an object declares one or more initialization methods, you should decide which method is the designated initializer. This is often the method that offers the most options for initialization (such as the method with the most arguments), and is called by other methods you write for convenience. You should also typically override init to call your designated initializer with suitable default values.

  If you need to write an initialization method when subclassing a class that uses multiple init methods, you should either override the superclass’s designated initializer to perform your own initialization, or add your own additional initializer. Either way, you should call the superclass’s designated initializer (in place of [super init];) before doing any of your own initialization.

### You Can Implement Custom Accessor Methods

  Properties don’t always have to be backed by their own instance variables.

  The compiler will automatically synthesize an instance variable in all situations where it’s also synthesizing at least one accessor method. If you implement both a getter and a setter for a readwrite property, or a getter for a readonly property, the compiler will assume that you are taking control over the property implementation and won’t synthesize an instance variable automatically.

  If you still need an instance variable, you’ll need to request that one be synthesized:

```object
  @synthesize property = _property;
```

#### Properties Are Atomic by Default

 Because the internal implementation and synchronization of atomic accessor methods is private, it’s not possible to combine a synthesized accessor with an accessor method that you implement yourself. You’ll get a compiler warning if you try, for example, to provide a custom setter for an atomic, readwrite property but leave the compiler to synthesize the getter.


#### Manage the Object Graph through Ownership and Responsibility

#### Avoid Strong Reference Cycles

#### Use Strong and Weak Declarations to Manage Ownership

#### Use Unsafe Unretained References for Some Classes

#### Copy Properties Maintain Their Own Copies
