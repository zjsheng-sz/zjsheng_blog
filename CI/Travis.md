
# Travis

- [document](https://docs.travis-ci.com/user/getting-started/)
- [官网](https://www.travis-ci.org/)
- [greed blog](https://github.com/greedbell/blog/blob/master/ci/travis.md)
- [廖雪峰教程](https://www.liaoxuefeng.com/article/0014631488240837e3633d3d180476cb684ba7c10fda6f6000)

## 设置personal access token

## 配置环境变量

## 编辑.travis.yml  

```
before_install:
- "./scripts/dependences.sh"
script:
- "travis_wait 120 sh ./scripts/build.sh"
after_success:
- "./scripts/deploy.sh"
```
