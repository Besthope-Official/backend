# 竞赛模块

在 `problem` 模块中创建一个 `ProblemSet` 题集的模型, 和 Problems 做一个多对多关联

- 类似于洛谷的[题单](https://www.luogu.com.cn/training/list)

给 contest 添加一个 `contest_type` 的文本字段: 正式赛或者训练赛

创建正式赛的代码已经写在 `ContestAdminAPI` 里了

训练赛根据一个 `ProblemSet` 题集创建, 在 `ContestAdminAPI` 里做一个判断

## 模型设计

`ProblemSet`

名称, 描述, 创建用户, 创建时间, 最近的更新时间, 包含的题目(ManyToManyField)

## 接口设计

`problem` 底下

`GET training/list`

- 获取所有题集的列表

`POST training/`

- 创建题集, 需要用户登录

然后对 `ContestAdminAPI` 做修改
