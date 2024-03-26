# 提交代码

## 设计

参考 `judger_utils/client.py` 里的示例, 完成

`POST submission/<int:problem_id>` 的接口

- 接口需要传入用户的 request

写一个序列器 `SubmissionSerializer`

## 一些注意项

远程提交 `remote/submission`

抓取了远程的返回状态, 例如 HDU 的

```json
{
  "Run ID": "39203528",
  "Timestamp": "2024-03-03 19:06:46",
  "Status": "Accepted",
  "Problem ID": "1000",
  "Time": "15MS",
  "Memory": "1688K",
  "Code Size": "146B",
  "Language": "G++",
  "User": "swufevj"
}
```

代码实现在 `vjudge/view` 里

统一本地和远程的提交接口, 在 `submission` 模块里对远程返的这些数据都统一下.

## 返回示例

```json
{
  // 提交 id
  "id": "1",
  "created_time": "2024-03-03 19:06:46",
  "result": "Accepted",
  // 和 problem 关联下的字段
  "problem_id": "1000",
  "language": "G++",
  // 如果可以, 其实最希望显示各个测试用例的数据
  "statistic_info": {},
  "username": "test"
}
```
