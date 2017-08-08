## Swift学习笔记 -Initialization

* [Swift 学习指引](http://www.swiftguide.cn/)
* Swift 文档

### Setting Initial Values for Stored Properties

### Customizing Initialization

### Default Initializers
Swift provides a default initializer for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself

  * Memberwise Initializers for Structure Types

  Structure types automatically receive a memberwise initializer if they do not define any of their own custom initializers

### Initializer Delegation for Value Types

  You can call self.init only from within an initializer

  Note that if you define a custom initializer for a value type, you will no longer have access to the default initializer (or the memberwise initializer, if it is a structure) for that type


### Class Inheritance and Initialization

* Designated Initializers and Convenience Initializers

  Every class must have at least one designated initializer. In some cases, this requirement is satisfied by inheriting one or more designated initializers from a superclass, as described in Automatic Initializer Inheritance below.

  Classes tend to have very few designated initializers, and it is quite common for a class to have only one

  You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values


* Syntax for Designated and Convenience Initializers

  ```swift

  init(parameters) {
    statements
  }

  convenience init(parameters) {
      statements
  }

  ```

* Initializer Delegation for Class Types

  * Rule 1
  A designated initializer must call a designated initializer from its immediate superclass.

  * Rule 2
  A convenience initializer must call another initializer from the same class.

  * Rule 3
  A convenience initializer must ultimately call a designated initializer.

  A simple way to remember this is:

  * Designated initializers must always delegate up.
  * Convenience initializers must always delegate across.


* Two-Phase Initialization

  In the first phase, each stored property is assigned an initial value by the class that introduced it. Once the initial state for every stored property has been determined, the second phase begins, and each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use

  Swift’s compiler performs four helpful safety-checks to make sure that two-phase initialization is completed without error:

  *  __Safety check 1__

   A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a superclass initializer.

  * __Safety check 2__

   A designated initializer must delegate up to a superclass initializer before assigning a value to an inherited property. If it doesn’t, the new value the designated initializer assigns will be overwritten by the superclass as part of its own initialization.

  * __Safety check 3__

    A convenience initializer must delegate to another initializer before assigning a value to any property (including properties defined by the same class). If it doesn’t, the new value the convenience initializer assigns will be overwritten by its own class’s designated initializer.

  * __Safety check 4__

    An initializer cannot call any instance methods, read the values of any instance properties, or refer to self as a value until after the first phase of initialization is complete.


* Initializer Inheritance and Overriding

When you write a subclass initializer that matches a superclass designated initializer, you are effectively providing an override of that designated initializer. Therefore, you must write the override modifier before the subclass’s initializer definition.

Conversely, if you write a subclass initializer that matches a superclass convenience initializer, that superclass convenience initializer can never be called directly by your subclass, as per the rules described above in Initializer Delegation for Class Types. Therefore, your subclass is not (strictly speaking) providing an override of the superclass initializer. As a result, you do not write the override modifier when providing a matching implementation of a superclass convenience initializer.


* Automatic Initializer Inheritance

  Assuming that you provide default values for any new properties you introduce in a subclass, the following two rules apply:
  * __rule 1__

  If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers.

  * __rule 2__

  If your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers.

* Designated and Convenience Initializers in Action


### Failable Initializers

  * Failable Initializers for Enumerations

  * Failable Initializers for Enumerations with Raw Values

  * Propagation of Initialization Failure

  * Overriding a Failable Initializer

```swift
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

```
  * The init! Failable Initializer


### Required Initializers

```swift

class SomeClass {
  required init() {
      // initializer implementation goes here
  }
}

class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}

```


### Setting a Default Property Value with a Closure or Function

```swift
class SomeClass {
      let someProperty: SomeType = {
  // 在这个闭包中给 someProperty 创建一个默认值 // someValue 必须和 SomeType 类型相同
  return someValue
  }()
}
```
