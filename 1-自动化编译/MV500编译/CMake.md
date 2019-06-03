
<!-- 看懂cmake的每一行代码 -->

## Cmake基础

### [最简单的Cmake](http://www.cnblogs.com/52php/p/5681745.html)

CmakeLists.txt文件内容：

```shell
PROJECT(HELLO)
SET(SRC_LIST main.c)
MESSAGE(STATUS "This is BINARY dir " ${HELLO_BINARY_DIR})
MESSAGE(STATUS "This is SOURCE dir "${HELLO_SOURCE_DIR})
ADD_EXECUTABLE(hello ${SRC_LIST})

```

* PROJECT  
  PROJECT(projectname [CXX] [C] [Java])
  并隐式定义了两个变量 `<projectname>\_BINARY_DIR` 和 `<projectname>\_SOURCE_DIR`

* <projectname>\_BINARY_DIR = PROJECT_BINARY_DIR
  内部编译，两个变量目前指的都是工程所在路径
  如果是外部编译，指的是外部编译所在目录

* <projectname>\_SOURCE_DIR = PROJECT_SOURCE_DIR
  内部编译，两个变量目前指的都是工程所在路径

* SET
  SET(VAR [VALUE] [CACHE TYPE DOCSTRING [FORCE]])
  用来显式的定义变量

* MESSAGE
  MESSAGE([SEND_ERROR | STATUS | FATAL_ERROR] "message to display"...)
  SEND_ERROR，产生错误，生成过程被跳过。
  SATUS，输出前缀为—的信息。
  FATAL_ERROR，立即终止所有cmake过程。

* ADD_EXECUTABLE
  eg:ADD_EXECUTABLE(hello ${SRC_LIST})
  定义生成执行文件

* ADD_SUBDIRECTORY
  ADD_SUBDIRECTORY(source_dir [binary_dir] [EXCLUDE_FROM_ALL])
  这个指令用于向当前工程添加存放源文件的子目录，并可以指定中间二进制和目标二进制存放的位置

* EXECUTABLE_OUTPUT_PATH / LIBRARY_OUTPUT_PATH
  目标二进制保存目录

```shell

INSTALL(FILES COPYRIGHT README DESTINATION share/doc/cmake/t2)
INSTALL(PROGRAMS runhello.sh DESTINATION bin)
INSTALL(DIRECTORY doc/ DESTINATION share/doc/cmake/t2)

INSTALL(TARGETS hello hello_static
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib)

INSTALL(FILES hello.h DESTINATION include/hello)

cmake -DCMAKE_INSTALL_PREFIX=/tmp/t2/usr

```

* DCMAKE_INSTALL_PREFIX
  指定安装路径
  CMAKE_INSTALL_PREFIX的默认定义是/usr/local


```shell

  ADD_LIBRARY(hello SHARED ${LIBHELLO_SRC})
  ADD_LIBRARY(hello_static STATIC ${LIBHELLO_SRC})
  SET_TARGET_PROPERTIES(target1 target2 ...PROPERTIES prop1 value1prop2 value2 ...)


```

* ADD_LIBRARY
ADD_LIBRARY(libname [SHARED|STATIC|MODULE][EXCLUDE_FROM_ALL]source1 source2 ... sourceN)
SHARED，动态库(扩展名为.so)
STATIC，静态库(扩展名为.a)
MODULE，在使用dyld的系统有效，如果不支持dyld，则被当作SHARED对待。
EXCLUDE_FROM_ALL 参数的意思是这个库不会被默认构建，除非有其他的组件依赖或者手工构建。


* SET_TARGET_PROPERTIES
SET_TARGET_PROPERTIES(target1 target2 ...PROPERTIES prop1 value1prop2 value2 ...)
eg:SET_TARGET_PROPERTIES(hello_static PROPERTIES OUTPUT_NAME "hello")
eg:SET_TARGET_PROPERTIES(hello PROPERTIES VERSION 1.2 SOVERSION 1)


```shell
INSTALL(TARGETS hello hello_static
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib)
INSTALL(FILES hello.h DESTINATION include/hello)

```

* INCLUDE_DIRECTORIES

  INCLUDE_DIRECTORIES([AFTER|BEFORE] [SYSTEM] dir1 dir2 ...)
  eg: INCLUDE_DIRECTORIES(/usr/include/hello)

* LINK_DIRECTORIES

  LINK_DIRECTORIES(directory1 directory2 ...)
  eg:

* TARGET_LINK_LIBRARIES
  TARGET_LINK_LIBRARIES(target library1<debug | optimized> library2...)
  eg: TARGET_LINK_LIBRARIES(main hello)
  eg:TARGET_LINK_LIBRARIES(main libhello.a)

* 特殊的环境变量 CMAKE_INCLUDE_PATH 和 CMAKE_LIBRARY_PATH

```shell

FIND_PATH(myHeader hello.h)
IF(myHeader)
INCLUDE_DIRECTORIES(${myHeader})
ENDIF(myHeader)

```  


###
