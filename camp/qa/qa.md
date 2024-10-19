# 奇点后端部面试题

## 前言

欢迎 24 级的大家加入奇点工作室! 这里是后端部的简单试题, 不用紧张, 面试题考察的是各位的搜索能力以及学习能力.

在 2024 年, 我们相信, 知识再也不会是开发的隔阂

## 免试题

利用 Git 克隆该开源项目 SWUFE-OJ 后端项目

```git
git clone https://github.com/SingularityLab-SWUFE/SWUFE-OJ-Backend.git
```

阅读项目[相关文档](https://github.com/SingularityLab-SWUFE/SWUFE-OJ-Backend/blob/main/README.md), 了解该项目的架构、特性以及部署方式.

### 贡献 1

如果你将来希望向运维方向发展, 可以考虑下面的问题:

为该项目添加 [dockerfile](https://www.runoob.com/docker/docker-dockerfile.html) 以及相应的 shell 脚本, 做到一键部署.

### 贡献 2

在 feature-discussion 分支上进行开发, 完成评论功能的开发, 并发起 PR. 该模块需要实现的接口有

- 对新建帖子 post 的 CRUD 操作
- 对评论 comment 的 CRUD 操作
- 实现评论的点赞, 回复

### 贡献 3

采用另一个你认为更合适的后端框架, 例如 [Java Spring](https://spring.io/projects/spring-boot/), [Golang](https://golang.google.cn/)...对项目整体进行重构.
