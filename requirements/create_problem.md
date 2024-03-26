# 创建题目

## 设计

自创题目交给自己的评测机

考虑两种情况

### 一般题目

- 题目描述
  - 对应相关 problem 的那些字段
  - 例如题面, 标签, 难度 etc.
- 测试数据 `*.in` 以及 `*.out`

### 特殊评判 spj

- 题目描述同上
- 测试数据只需要 `*.in` 和一个评测程序

### 一些其他考虑的

要生成一个 `info` 传到服务器

看看能不能写一个脚本 利用 `rsync` 实现跨域文件的同步

### 示例

```json
{
    "id": 1,
    "title": "A + B Problem",
    "is_remote": true,
    "remote_id": "",
    "source": "原创",
    "difficulty": "Easy",
    "description": "计算 A + B.\n ",
    "input": "单测试用例, 每行包括两个数字 A 和 B. \n$",
    "output": "对于每个测试用例, 输出 A + B 的结果.\n ",
    "samples": [
        {
            "input": "1 1\r\n ",
            "output": "2\r\n "
        }
    ],
    "hint": "",
    "standard_time_limit": 1000,
    "standard_memory_limit": 32768,
    "other_time_limit": 2000,
    "other_memory_limit": 65536,
    "tag": ["签到题"]
}
```
