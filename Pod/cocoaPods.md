
## cocoapods的安装与使用



[CocoaPods安装和使用教程](http://blog.csdn.net/iunion/article/details/17010267)

### 常用命令讲解

>pod install

根据Podfile文件指定的内容，安装依赖库，如果有Podfile.lock文件而且对应的Podfile文件未被修改，
则会根据Podfile.lock文件指定的版本安装。

> pod update

若果Podfile中指定的依赖库版本不是写死的，当对应的依赖库有了更新，无论有没有Podfile.lock文件都
会去获取Podfile文件描述的允许获取到的最新依赖库版本。

>pod setup

这条命令用于跟新本地电脑上的保存的Pods依赖库tree。由于每天有很多人会创建或者更新Pods依赖库，这
条命令执行的时候会相当慢，还请耐心等待。我们需要经常执行这条命令，否则有新的Pods依赖库的时候执行
pod search命令是搜不出来的。
'pod install --no-repo-update'
Updating local specs repositories不需要

>pod search


### Podfile基本格式

```ruby
platform :ios, '9.0'
inhibit_all_warnings!

target 'ZJSDemoProjection' do
pod 'AFNetworking', '~> 3.0.4'
...

end

```
