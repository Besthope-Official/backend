# 题目列表返回

## 设计

搜索数据库中的题目

端口: `/problem/list`

## 简略的实现思路

在 `problem` 模块里编写代码

对题目序列化: 只返回实例中出现的字段. 在 `serializers.py` 里新建一个序列化器.

在 `views` 编写查询数据库的相关代码.

注意: 标签查询会涉及到多表联合的问题.

## 参数

- `page`: 页数. 为空默认为 1.
  - 一页有 30 道题目
- `tagID`: 标签 id. 支持多个 tag 搜索.
- `source`: 题目来源. 例如 "HDU", "origin"(自创)

## 返回示例

```json
[
  {
    "id": 1,
    "title": "我是温柔的签到题目",
    "source": "原创",
    "difficulty": "简单",
    "tags": ["签到"],
    "solved_submission_number": 5002,
    "total_submission_number": 10103
  },
  {
    "id": 2,
    "title": "This is a medium problem",
    "source": "Atcoder",
    "difficulty": "中等",
    "tags": [],
    "solved_submission_number": 302,
    "total_submission_number": 1200
  },
  {
    "id": 3,
    "title": "这是一道难题",
    "source": "原创",
    "difficulty": "困难",
    "tags": [],
    "solved_submission_number": 2,
    "total_submission_number": 3002
  }
]
```
