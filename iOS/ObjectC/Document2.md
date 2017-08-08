#ObjectC文档

* [文档](https://developer.apple.com/library/prerelease/content/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210)


[Defining Classes](#Defining Classes)  
[Objects Send and Receive Messages](#Objects Send and Receive Messages)  

## Defining Classes



---

## Objects Send and Receive Messages

someObject will be sent the doSomething message.

> Use Pointers to Keep Track of Objects

> You Can Pass Objects for Method Parameters

> Methods Can Return Values

> Objects Can Send Messages to Themselves

> Objects Can Call Methods Implemented by Their Superclasses

## Objects Are Created Dynamically

Notice that the return type of this method is `id`. This is a special keyword used in Objective-C to mean “some kind of object.”

The `alloc` method has one other important task, which is to clear out the memory allocated for the object’s properties by setting them to zero.

The `init` method is used by a class to make sure its properties have suitable initial values at creation, and is covered in more detail in the next chapter.


## Objective-C Is a Dynamic Language

As mentioned earlier, you need to use a pointer to keep track of an object in memory. Because of Objective-C’s dynamic nature, it doesn’t matter what specific class type you use for that pointer—the correct method will always be called on the relevant object when you send it a message.

### Determining Equality of Objects

When dealing with objects, the == operator is used to test whether two separate pointers are pointing to the same object:

```objc

  if (firstPerson == secondPerson) {
       // firstPerson is the same object as secondPerson
   }

```

If you need to test whether two objects represent the same data, you need to call a method like isEqual:, available from NSObject:

```objc

    if ([firstPerson isEqual:secondPerson]) {
        // firstPerson is identical to secondPerson
    }
```


### Working with nil

It’s always a good idea to initialize scalar variables at the time you declare them, otherwise their initial values will contain garbage from the previous stack contents:

```objc
  BOOL success = NO;
  int magicNumber = 42;

```
This isn’t necessary for object pointers, because the compiler will automatically set the variable to nil if you don’t specify any other initial value:

```objc
XYZPerson *somePerson;
  // somePerson is automatically set to nil

```

A nil value is the safest way to initialize an object pointer if you don’t have another value to use, because it’s perfectly acceptable in Objective-C to send a message to nil. If you do send a message to nil, obviously nothing happens.

Note: If you expect a return value from a message sent to nil, the return value will be nil for object return types, 0 for numeric types, and NO for BOOL types. Returned structures have all members initialized to zero.
