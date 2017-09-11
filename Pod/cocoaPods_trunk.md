
### 制作自己的pod

[Using Pod Lib Create 官网](https://guides.cocoapods.org/making/using-pod-lib-create)

[Publish Your Pods on CocoaPods with Trunk 中文博客](http://yulingtianxia.com/blog/2014/05/26/publish-your-pods-on-cocoapods-with-trunk/)

```bash
$pod lib create JSLib  #生成一个模版工程
$pod lib lint JSLib.podspec #检查JSLib.podspec文件
$pod trunk register 770649662@qq.com Zhong Jiasheng --description=macbook proe #注册
$pod trunk me #查看注册信息
$pod trunk push JSLib.podspec #提交
```
