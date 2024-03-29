# 难度设置

## 设计

对于远程爬题得到的题目, 为它自动设置一个难度

默认为简单即可.

不用为它编写策略预测难度了, 没那个必要.

- 或许以后我们写一个预测难度的 AI 模型也说不定(笑).
- 但在那之前, 我们需要可靠的难度评定.
- 如果出题人能给出难度分级就好了.
- 例如 Codeforces 会对题目难度进行一个数值上的标注, 以后再对其标注难度也不迟.
- 之后会加个功能, 让用户评定这道题的难度.
  - 如果可以, 更希望你能给出这个功能实现的逻辑!

## 实现

在 `oj/problem/models.py` 里给 `problem` 的 `difficulty` 字段设置一个默认值.

## 熟悉 Git 工作流

这次的工作比较简单, 主要希望你能熟悉下 Git 的工作流

- 将代码拉取到本地(如果你还没有的话)
- 如果已经拉取了就 `git pull` 更新下
- 切换到 `account` 分支进行开发
- 写完代码就 `commit`
- 然后在 Github 上发起 merge `account -> main` 的 Pull Request
  - 我们 review 一下, 你的代码就提交到我们的主分支了!
