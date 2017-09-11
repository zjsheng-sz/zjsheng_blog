
# 多项目共用代码

1. 新建工作空间MaxiAP200, 项目MaxiAp200_Diag、MaxiAp200_Platfrom， 框架CommonFoundation

2. CommonFoundation框架 Mach-O Type 配置为Static Libray

3. CommonFoundation框架 配置public头文件

5. MaxiAp200_Diag/MaxiAp200_Platfrom 项目设置 link binaries 添加 CommonFoundation框架

6. MaxiAp200_Diag/MaxiAp200_Platfrom 项目设置 Header search Paths 添加 `$SRCROOT/../CommonFoundation/CommonFoundation/` `$SRCROOT/../CommonFoundation/`

7. 配置pod:  MaxiAp200_Diag, MaxiAp200_Platfrom,CommonFoundation 共用pod:   

``` ruby

source 'https://github.com/CocoaPods/Specs.git'        #官方仓库地址

platform :ios, '8.0'
inhibit_all_warnings!
workspace 'MaxiAP200.xcworkspace'

def shared_pod

  pod 'Bugly', '~> 2.4.8'
  pod 'YYCache', '~> 1.0.4'
  pod 'RNCryptor', '~> 3.0.1'
end

# 诊断工程
target 'MaxiAp200_Diag' do

  project 'MaxiAp200_Diag/MaxiAp200_Diag.xcodeproj'
  shared_pod
end

# 平台工程

target 'MaxiAp200_Platfrom' do

  project 'MaxiAp200_Platfrom/MaxiAp200_Platfrom.xcodeproj'
  shared_pod
end

# 共用库
target 'CommonFoundation' do

    project 'CommonFoundation/CommonFoundation.xcodeproj'
    shared_pod
end

```
