
[git:fork源仓库、fork仓库副本和local仓库的同步](www.jianshu.com/p/29775d91f536)

### fork源仓库

fork源仓库 --- fork --- fork仓库副本 ---clone --- 本地仓库

### fork仓库副本和local仓库的同步

```shell

  #查看远程仓库信息
  git remote -v

  # 添加fork源仓库的地址
  git remote add upstream ...

  git remote -v

  # 获取fork源仓库的更新， 实现本地同步
  git fetch upstream
  git checkout master
  git merge updsteam/master

  # 提交到fork仓库副本， 实现副本同步
  git push origin master

```
