### fastlane

[简书](https://www.jianshu.com/p/5d836e89d9d1)

#### 安装xcode命令行工具

xcode-select --install

#### 安装Fastlane

sudo gem install fastlane -NV或是brew cask install fastlane

#### 初始化Fastlane

fastlane init

注意可能会卡在 bundle update， 这个时候应该翻墙，

或者修改Gemfile文件中源地址, 将https://rubygems.org,换成https://ruby.taobao.org ：https://blog.csdn.net/kuangdacaikuang/article/details/80445887

再执行bundle update

### 编写Fastfile [MV160脚本](./fastlane)

FastlaneCore::ProvisioningProfile.install(filePath)//安装描述文件

update_project_provisioning //更新描述文件

get_version_number

get_build_number

build_ios_app

### 脚本修改version 和 build

[文档](https://developer.apple.com/library/archive/qa/qa1827/_index.html)

agvtool new-marketing-version ${VERSION_NUM}

agvtool new-version -all ${BUILD_NUM}
