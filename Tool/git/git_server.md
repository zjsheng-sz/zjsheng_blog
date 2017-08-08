
## ssh 方式搭建git服务  
[greed note](https://github.com/greedbell/blog/blob/master/git/git-server.md)

---

> 服务端

### 创建 git 用户

### 初始化 /git 目录

        $ sudo mkdir /git
        $ sudo chown -R git:staff /git/

### 初始化 repo

        $ su - git
        $ git init --bare --shared=group /git/test.git


---
> 客户端

这里都以服务器在本地为例，所以在使用的时候记得把 localhost 换成对应服务器地址。

### 建立 ssh 互信

拷贝本地公钥到服务器的 ~/git/.ssh/authorized_keys

        $ ssh git@10.240.4.93 "mkdir ~/.ssh"

        $ scp ~/.ssh/id_rsa.pub  git@10.240.4.93:~/.ssh/id_rsa.pub.back
        $ ssh git@localhost "cat ~/.ssh/id_rsa.pub.back >> ~/.ssh/authorized_keys"

### 使用

        $ git clone ssh://git@localhost/git/test.git
        $ git remote add ssh ssh://git@localhost/git/test.git
        $ git push ssh master
