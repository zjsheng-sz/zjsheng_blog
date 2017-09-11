# gitbook

(Mac环境安装Gitbook，并导出PDF教程)[http://www.jianshu.com/p/4824d216ad10]


### installl

环境: 安装node.js

安装:  

```bash
sudo npm install gitbook -g
sudo npm install -g gitbook-cli

# 一定要用到-g，这个代表全局安装，我去掉-g安装了一次，也成功了，但是在终端使用gitbook -V查看的时候发现根本没安装

```


### useage


```bash
gitbook build
#生成静态网页到_book目录中

gitbook serve
#实现本地预览

```
