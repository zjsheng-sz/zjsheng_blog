### Swift学习笔记 - 访问权限

* [Swift 学习指引](http://www.swiftguide.cn/)
* Swift 文档


#### for循环 和 输出

```Swift
  for index in 1...5{
    print(index)
    print("index \(index)")
  }
```

#### 访问控制

如果只是开发一个单一目标的应用程序，我们完全可以不用显式声明代码的访 问级别

模块指的是独立的代码单元，框架或应用程序会作为一个独立的模块来构建和发布

源文件就是 Swift 中的源代码文件，它通常属于一个模块，即一个应用程序或者框架

#### 5大访问级别

  * 开放访问
  * 公开访问
  * 内部访问
  * 文件私有访问
  * 私有访问

#### 基本原则

No entity can be defined in terms of another entity that has a lower (more restrictive) access level


#### Custom Types

If you define a type’s access level as private or file private, the default access level of its members will also be private or file private. If you define a type’s access level as internal or public (or use the default access level of internal without specifying an access level explicitly), the default access level of the type’s members will be internal.

#### Tuple Types

The access level for a tuple type is the most restrictive access level of all types used in that tuple


#### Function Types

The access level for a function type is calculated as the most restrictive access level of the function’s parameter types and return type

You must specify the access level explicitly as part of the function’s definition if the function’s calculated access level does not match the contextual default

#### Enumeration Types

The individual cases of an enumeration automatically receive the same access level as the enumeration they belong to. You cannot specify a different access level for individual enumeration cases

The types used for any raw values or associated values in an enumeration definition must have an access level at least as high as the enumeration’s access level


#### Nested Types

as(#Custom Types)

Nested types defined within a private type have an automatic access level of private. Nested types defined within a file-private type have an automatic access level of file private. Nested types defined within a public type or an internal type have an automatic access level of internal. If you want a nested type within a public type to be publicly available, you must explicitly declare the nested type as public.


#### Subclassing

You can subclass any class that can be accessed in the current access context

A subclass cannot have a higher access level than its superclass

An override can make an inherited class member more accessible than its superclass version

#### Constants, Variables, Properties, and Subscripts

A constant, variable, or property cannot be more public than its type  

If a constant, variable, property, or subscript makes use of a private type, the constant, variable, property, or subscript must also be marked as private

#### Getters and Setters

Getters and setters for constants, variables, properties, and subscripts automatically receive the same access level as the constant, variable, property, or subscript they belong to

You can give a setter a lower access level than its corresponding getter, You assign a lower access level by writing fileprivate(set), private(set), or internal(set) before the var or subscript introducer.

#### Initializers

Custom initializers can be assigned an access level less than or equal to the type that they initialize

A required initializer must have the same access level as the class it belongs to.

  * Default Initializers

    A default initializer has the same access level as the type it initializes, unless that type is defined as public. For a type that is defined as public, the default initializer is considered internal. If you want a public type to be initializable with a no-argument initializer when used in another module, you must explicitly provide a public no-argument initializer yourself as part of the type’s definition

  * Default Memberwise Initializers for Structure Types

    The default memberwise initializer for a structure type is considered private if any of the structure’s stored properties are private. Likewise, if any of the structure’s stored properties are file private, the initializer is file private. Otherwise, the initializer has an access level of internal.

    As with the default initializer above, if you want a public structure type to be initializable with a memberwise initializer when used in another module, you must provide a public memberwise initializer yourself as part of the type’s definition.

#### Protocols

  The access level of each requirement within a protocol definition is automatically set to the same access level as the protocol

  * Protocol Inheritance

  If you define a new protocol that inherits from an existing protocol, the new protocol can have at most the same access level as the protocol it inherits from

  * Protocol Conformance

  A type can conform to a protocol with a lower access level than the type itself


#### Extensions
#### Generics
#### Type Aliases
