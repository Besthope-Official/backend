#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/cetz:0.2.2"
#show: show-cn-fakebold

#let title = [Lab 1 实验文档]
#let header = [后端部实验文档]
#set text(font: ("Source Han Serif SC"))
#set page(
  header: [#set text(12pt); #align(right + horizon, header)],
  background: image("images/backend_logo_opacity_0.25.png", fit: "cover", width: 30%),
  numbering: "1",
  number-align: right,
)
#show link: underline

// CONTENTS

#align(center, text(20pt)[
  *#title*
])

= Lab 1: routes and views

== 实验目标

- 了解 HTTP 请求可以包含的内容
- 理解 Flask 的路由规则
- 在 Flask 里编写简单的视图函数
- 在 Flask 里渲染模板、处理请求参数、异常处理

== 实验内容

=== 更新实验仓库

将大家的实验仓库(fork 后的开发者仓库)和源仓库同步

在 Github 的 Web 界面上可以 `sync fork` 对应的分支

```bash
git fetch upstream
```

=== 任务: 编写视图函数

=== index

重定向到 `/game` 页面。

请求方法：`GET`

url: `/`

=== game

渲染 `2048.html` 模板。

请求方法: `GET`

url: `/game`

=== no_url_found

在访问到不存在的 URL 时，访问该视图函数。

返回一个字符串 `Page not found`

=== add_in_url

利用 flask 提供的路由规则，实现：接受 URL 里提供的两个整数，返回它们的相加。

请求方法：`GET`

示例 url: `/add/1/2`

输出：`3`

=== take_url_args

利用 flask 提供的路由规则，实现：接受 URL 里提供的颜色，并返回对应的颜色。

支持的颜色有：`red`, `green`, `blue`

请求方法：`GET`

示例 url: `/color/red`

输出：`red`

`/color/grey`

输出: `Page not found`

=== take_query_str

视图函数接受 URL 里的查询字符串参数 `name`。

如果该参数为空，设置其为 `Anonymous`.

请求方法：`GET`

示例 url: `/query?name=Alice`

输出：`Hello Alice`

=== take_form_data

视图函数接受表单数据.

请求方法：`POST`

表单数据:

- `name`: 字符串类型，默认值为 `Anonymous`

url: `/data`

示例输出：`Hello Alice`

=== Bonus: file_upload

实现一个文件上传功能接口.

请求方法：`POST`

示例 url: `/upload`

请求参数：

- `file`: 文件对象

如果上传成功, 输出字符串 `File uploaded successfully`.

==== 异常处理

文件大小最大设置为 2 MB. 如果超过返回 `File size exceeds limit of 2MB`.

如果没有上传文件, 返回 `No file uploaded`.

=== 运行测试

```bash
pytest
```

Hint: 对单个测试文件的测试, 可以使用如下命令:

```bash
pytest <test_file_path>
```

`-v` 选项可以帮助你看到测试的详细信息.

`-s` 选项允许你看到测试过程中的输出(`print`)信息.

`--tb=line` 选项将 traceback 信息显示为一行.

==== Postman 测试

使用 Postman 测试你的 API.

=== 上传仓库提交 PR

完成编码后提交你的代码, 并创建一个 PR 到源仓库的 `lab1` 分支.
