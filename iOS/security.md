## security

### iOS常用的几种加密方式

[http://www.jianshu.com/p/422e97e60f2d](http://www.jianshu.com/p/422e97e60f2d)

#### base64

```bash
   # 将文件 meinv.jpg 进行 base64运算之后存储为 meinv.txt
   $base64 meinv.jpg -o meinv.txt

   # 讲meinv.txt 解码生成 meinv.png
   $base64 -D meinv.txt -o meinv.png

   # 将字符串 "hello" 进行 base 64 编码 结果:aGVsbG8K
   $echo "hello" | base64

   # 将 base64编码之后的结果 aGVsbG8= 反编码为字符串
   $echo aGVsbG8K | base64 -D
```

####  [Token值介绍]

token 值有失效时间:

一般的 app ,token值得失效时间都在 1 年以上.
特殊的 app :银行类 app /支付类 app :token值失效时间 15 分钟左右.  

一旦用户信息改变(密码改变),会在服务器生成新的 token 值,原来的 token值就会失效.需要再次输入账号和密码,以得到生成的新的 token 值.

APP登录的时候发送加密的用户名和密码到服务器，服务器验证用户名和密码，如果成功，以某种方式比如随机生成32位的字符串作为token，存储到服务器中，并返回token到APP，以后APP请求时，凡是需要验证的地方都要带上该token，然后服务器端验证token，成功返回所需要的结果，失败返回错误信息，让他重新登录。其中服务器上token设置一个有效期，每次APP请求的时候都验证token和有效期

https://github.com/bigmeow/JWT
https://www.zhihu.com/question/30267006

####  Md5 和 加盐

```bash

$ md5 -s "abc"      给字符串abc加密
$ echo -n abc|openssl md5        给字符串abc加密  

```



### [加密、摘要、签名、证书、SSL、HTTPS](http://www.cnblogs.com/chenzhanxun/articles/4630743.html)

#### 安全领域的技术众多，但是归根结底，他们都是为了保障如下三个方面：

1. 认证用户和服务器，确保数据发送到正确的客户机和服务器   
2. 加密数据以防止数据中途被窃取    
3. 维护数据的完整性，确保数据在传输过程中不被改变。


#### 对称加密和非对称密钥加解密 :

 加密和解密采用的密钥是否相同来区分  
 对称加密速度快，但加密和解密的钥匙必须相同，只有通信双方才能知道钥匙  
 非对称加密速度慢，加密和解密的钥匙不相同，某一个人持有私钥，任何人都可以知道公钥  

#### 数字摘要--数据完整性的校验

  供下载者验证下载后的文件是否完整，或者说是否和服务器上的文件”一模一样“

#### 数字签名--水到渠成的技术

  由“非对称密钥加解密”和“数字摘要“组成  
  发送方： 要发送的数据（无论是否加密）Data +  Data的摘要再用私钥加密的  
  接收方： Data摘要 和 公钥解密的数据 进行对比  

  数字签名有两种功效：一是能确定消息确实是由发送方签名并发出来的，因为别人假冒不了发送方的签名。二是数字签名能确定消息的完整性

#### 数字证书--值得信赖的公钥

  该证书内包含用户的个人信息和他的公钥信息，同时还附有认证中心的签名信息

#### SSL

#### https
