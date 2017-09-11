
[廖雪峰教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
* 分布式式版本控制系统和集中式版本控制系统:

  每个人的电脑上都是一个完整的版本库，这样，你工作的时候，就不需要联网了，因为版本库就在你自己的电脑上  
  Git极其强大的分支管理

* git安装  

  * `git config --global user.name Your Name`
  * `git config --global user.email email@example.com`   
  * `--global`参数，用了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置，当然也可以对某个仓库指定不同的用户名和Email地址


* 创建版本库
  *  初始化一个Git仓库，使用`git init`命令。  
  *  添加文件到Git仓库，分两步：
     第一步，使用命令`git add <file>`，注意，可反复多次使用，添加多个文件；
     第二步，使用命令`git commit`，完成


* 时光穿梭
  *  要随时掌握工作区的状态，使用`git status`命令。如果`git status`告诉你有文件被修改过，用`git diff`可以查看修改内容。
  *  HEAD指向的版本就是当前版本，因此，Git允许我们在版本的历史之间穿梭，使用命令`git reset --hard commit_id`。
  *  穿梭前，用`git log`可以查看提交历史，以便确定要回退到哪个版本。`git log --graph --pretty=oneline --abbrev-commit`
  *  要重返未来，用`git reflog`查看命令历史，以便确定要回到未来的哪个版本。
  * 场景1：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时，用命令`git  checkout -- file`。  
    场景2：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，分两步，
      第一步用命令`git reset HEAD file`，就回到了场景1，第二步按场景1操作。
  * 命令`git rm`用于删除一个文件


* 远程仓库
 * 创建SSH Key。在用户主目录下，看看有没有.ssh目录，如果有，再看看这个目录下有没 有id_rsa和id_rsa.pub这两个文件，如果已经有了，可直接跳到下一步。如果没有，打开Shell（Windows下打开Git Bash），创建SSH Key：$ `ssh-keygen -t rsa -C youremail@example.com`

 * 要关联一个远程库，使用命令`git remote add origin git@server-name:path/repo-name.git`；关联后，使用命令`git push -u origin master`第一次推送master分支的所有内容；此后，每次本地提交后，只要有必要，就可以使用命令`git push origin master`推送最新修改；

 * 要克隆一个仓库，首先必须知道仓库的地址，然后使用`git clone`命令克隆。
   Git支持多种协议，包括https，但通过ssh支持的原生git协议速度最快

* 分支管理
>查看分支：`git branch`
创建分支：`git branch <name>`
切换分支：`git checkout <name>`
创建+切换分支：`git checkout -b <name>`
合并某分支到当前分支：`git merge <name>`
删除分支：`git branch -d <name>`

* 标签管理
>命令`git tag <name>`用于新建一个标签，默认为HEAD，也可以指定一个commit id；
`git tag -a <tagname> -m `blablabla...``可以指定标签信息；
`git tag -s <tagname> -m `blablabla...``可以用PGP签名标签；
`git show <tagname>`查看标签信息
命令`git tag`可以查看所有标签。
命令`git push origin <tagname>`可以推送一个本地标签；
命令`git push origin --tags`可以推送全部未推送过的本地标签；
命令`git tag -d <tagname>`可以删除一个本地标签；
命令`git push origin :refs/tags/<tagname>`可以删除一个远程标签。
