# 比赛模块

contest 模块

## 设计

表设计

一些端口

管理员对 contest 的 CRUD
先不管权限的问题, 把功能先实现了

- `GET contests/?` contest_list 竞赛列表
  - 提供可筛选的参数
  - 默认按比赛开始时间排序
- `GET contest/?`
  - 获得比赛信息
