
## 终端使用初级

[终端使用初级教程](https://www.renfei.org/blog/mac-os-x-terminal-101.html)


### 关于 man 命令
上，下移动，空格翻页，／匹配, -k 模糊匹配命令

### 处理特殊字符

果目录中有特殊字符（空格，括号，引号，[]，!，$，&，\*，;，|，\) 那么直接输入空格会造成系统识别困难，
必须使用特殊的语法来表示这些字符。例如上例中，空格前添加反斜杠“\”（back slash）即可：
__$cd Punlic/Drop\ Box/__。
除了反斜杠，也可以用引号的方法：__$cd "Public/Drop Box"__。

### 前往其他卷
> $cd /Volumes/

### 检视文件
* cat,   cat file读取文件输出到terminal窗口, cat file2 >> file1读取file2并输出到file1
* less,  查看长文本文件, 上，下移动，空格翻页，／匹配， v 使用vi来编辑
* which, 这个命令会定位某个命令的文件路径
* file,  这个命令会尝试根据文件的内容输出文件类型
* find   find ./ -name "*.m" ,搜索当前目录下名字符合‘*.m’规则的所以文件

### 使用递归命令
-r或者-R
复制目录下的所以文件，使用cp递归， 删除文件夹下的所有内容，使用rm递归

### 使用su来切换用户
su robert 切换命令
who -m    验证当前登录的身份
