## 制作私有Specs

[如何创建私有 CocoaPods 仓库](http://www.jianshu.com/p/ddc2490bff9f)

### 创建一个私有的 Spec Repo

        pod repo add REPO_NAME SOURCE_URL

### 添加私有的 Repo 安装到你的 CocoaPods 中

1. 得到 podspec 文件

2. 检验合法性

        pod lib lint
          pod lib lint --allow-warnings

3. 添加你的 Podspec 到你的 repo

        pod repo push autelSpec autelOBD.podspec

### 测试

podfile文件中应该添加下面两行，否则不会搜索私有仓库地址

        source 'https://github.com/CocoaPods/Specs.git'        #官方仓库地址
        source ‘https://github.com/marklin2012/O2Specs.git’        #私有仓库地址
