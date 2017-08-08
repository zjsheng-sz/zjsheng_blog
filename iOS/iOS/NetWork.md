
## Get和Post区别

[浅谈HTTP中Get与Post的区别](http://www.cnblogs.com/hyddd/archive/2009/03/31/1426026.html)

### 根据HTTP规范，GET用于信息获取，而且应该是安全的和幂等的。

* 所谓安全的意味着该操作用于获取信息而非修改信息

* 幂等的意味着对同一URL的多个请求应该返回同样的结果

### 根据HTTP规范，POST表示可能修改变服务器上的资源的请求

...

### 说完原理性的问题，我们再从表面现像上面看看GET和POST的区别

1. `GET` 请求的数据会附在URL之后（就是把数据放置在HTTP协议头中），以?分割URL和传输数据，参数之间以&相连。如果数据是英文字母/数字，原样发送，如果是空格，转换为+，如果是中文/其他字符，则直接把字符串用BASE64加密。 `POST` 把提交的数据则放置在是HTTP包的包体中。

2. GET方式提交的数据最多只能是1024字节，理论上POST没有限制。

  * 首先是"GET方式提交的数据最多只能是1024字节"，因为GET是通过URL提交数据，那么GET可提交的数据量就跟URL的长度有直接关系了。而实际上，URL不存在参数上限的问题，HTTP协议规范没有对URL长度进行限制。这个限制是特定的浏览器及服务器对它的限制。IE对URL长度的限制是2083字节(2K+35)。对于其他浏览器，如Netscape、FireFox等，理论上没有长度限制。
  * .理论上讲，POST是没有大小限制的，HTTP协议规范也没有进行大小限制，说“POST数据量存在80K/100K的大小限制”是不准确的，POST数据是没有限制的，起限制作用的是服务器的处理程序的处理能力

  * POST的安全性要比GET的安全性高

---

## Sockt 和 WebSocket

[Socket 与 WebSocket](http://zengrong.net/post/2199.htm)

### OSI 模型与 TCP/IP¶ http://blog.csdn.net/yaopeng_2005/article/details/7064869

  OSI 七层模型： 物理层、 数据链路层、 网络层、 传输层、 会话层、 表示层、 应用层
  OSI 四层模型： 链路层、 网络层、 传输层、 应用层
  在这里，我们只需要知道，HTTP、WebSocket 等协议都是处于 OSI 模型的最高层： 应用层 。而 IP 协议工作在网络层，TCP 协议工作在传输层

### WebSocket、HTTP 与 TCP

  HTTP、WebSocket 等应用层协议，都是基于 TCP 协议来传输数据的。我们可以把这些高级协议理解成对 TCP 的封装

  既然大家都使用 TCP 协议，那么大家的连接和断开，都要遵循 TCP 协议中的[三次握手和四次握手](http://blog.csdn.net/whuslei/article/details/6667471) ，只是在连接之后发送的内容不同，或者是断开的时间不同。
  注：[syn和ack的理解](http://blog.csdn.net/u014507230/article/details/45310847)

  对于 WebSocket 来说，它必须依赖 HTTP 协议进行一次握手 ，握手成功后，数据就直接从 TCP 通道传输，与 HTTP 无关了。

### Socket 与 WebScoket

  Socket 其实并不是一个协议。它工作在 OSI 模型会话层（第5层），是为了方便大家直接使用更底层协议（一般是 TCP 或 UDP ）而存在的一个抽象层  

### HTML5 与 WebSocket

  WebSocket API 是 HTML5 标准的一部分， 但这并不代表 WebSocket 一定要用在 HTML 中，或者只能在基于浏览器的应用程序中使用


---
