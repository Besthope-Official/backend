---
title: Code Review of the week
---

<!-- slide -->

# 正式赛创建

**正式赛**要求题目都是**原创新题**

- 题目在比赛开始前都不可见, 开始中只允许参赛选手可见, 比赛结束了才判断是否公开.
- 外键约束: 每一个 `problem` 唯一绑定一个 `contest`.
- 题单: `GET problem/contest_id?=1` 获取比赛 id 为 1 的题单.
  - 但是, 算法竞赛发展到现在, "*原创*"是无法保证的...
  - 正式赛也只能保证"*新*"
  - 题目重复也好, copy 也好, 至少要求题目不在题库里.
- 同时不能将 remote problem 作为正式赛题目.

**诚信问题**: 如果能有现成的答案, 必然会导致比赛不公平.

理想的应用场景: 期末的上机考试(阻塞外网), 校赛(奇点杯)

- 在上线之前, 得保证这个模块的稳健性.

<!-- vslide -->

# 训练赛创建

**训练赛**则没有以上约束.

- 根据一个题单 `ProblemSet` 创建比赛.
- 也支持添加新题.
- 允许 remote.

应用场景: 课程实验/作业, 算法培训

<!-- vslide -->

# 访问限制

可选比赛是否需要密码访问

<!-- slide -->

# 比赛中排名

两套赛制:

- `ACM` 按用户通过数+罚时排序
- `OI` 按通过得到的总分数排序

<!-- slide -->

# 比赛 VP

虚拟参赛: 模拟过往的比赛, 包括每个时间节点的提交状况, 当时的排名等.
