
## webview清除缓存

[iOS webview清除缓存](http://blog.csdn.net/it_201607/article/details/51822790)


```objc
/**webView退出方法*/  
- (void)closeBtnAction:(UIButton *)button{  
     _webView = nil;  
    [self cleanCacheAndCookie];  
    [self.navigationController popViewControllerAnimated:YES];  
}  

/**清除缓存和cookie*/  
- (void)cleanCacheAndCookie{  
    //清除cookies  
    NSHTTPCookie *cookie;  
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];  
    for (cookie in [storage cookies]){  
        [storage deleteCookie:cookie];  
    }  
   //清除UIWebView的缓存  
    [[NSURLCache sharedURLCache] removeAllCachedResponses];  
    NSURLCache * cache = [NSURLCache sharedURLCache];  
    [cache removeAllCachedResponses];  
    [cache setDiskCapacity:0];  
    [cache setMemoryCapacity:0];  
}  
```

## cookie 和 session

[cookie 和session 的区别详解](http://www.cnblogs.com/shiyangxt/archive/2008/10/07/1305506.html)

Cookie 会帮你在网站上所打的文字或是一些选择，都纪录下来

[cookie和session的的区别以及应用场景有哪些？](https://www.zhihu.com/question/31079651)

cookie存于客户端。  
session存于服务器端。  

服务器鉴别session需要至少从客户端传来一个session_id，session_id通常存于cookie中，或是url（很少用url，主要涉及安全性和SEO的影响）

所以在工程上session离了cookie基本没法用，但是cookie可以单独使用，不过cookies是明文存储，安全性很低，只使用cookie的话盗取了cookie基本就获取了用户所有权限。

另外浏览器每次访问网页都会带上cookie，如果cookie存储内容过多，会严重占用服务器端带宽，影响性能。

所以如果你是简单或且安全不敏感的应用，可以只使用cookie。否则还是需要cookie配合session。
不过现有语言和框架基本都可以让你简单地使用session，而无需考虑session和cookie的关系。



## WebView缓存机制
