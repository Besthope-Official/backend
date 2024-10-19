#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold

#let title = [2024奇点后端部面试]
#set text(font: ("Source Han Serif SC"))
#set page(
  header: align(right + horizon, title),
  background: image("backend_logo_opacity_0.25.png", fit: "cover", width: 30%),
  numbering: "1",
  number-align: right,
)

#align(center, text(20pt)[
  *#title*
])

#show link: underline

= 面试题

== 背景

后端的一大任务是将数据*持久化存储*，换句话说，就是将数据存储到*数据库*，以文件的形式存放到服务器的*硬盘*上。

例如，为了存放用户数据，会对“用户”这个概念进行*抽象*，即，用 `user` 的数据结构来记录用户的关键信息，如手机号、用户名、密码等。

在关系型数据库中，我们会用*表格*来存放数据，表中的每一*列*（字段）代表数据的某个属性，每一*行*则代表一个数据记录。每个表都应当有*主键*，作为一条数据的唯一标识，如学生学号。*关系*则用来表示数据对象之间的关联，如：学生和课程之间是多对多关系。

== 任务

设计微信红包的*数据库表结构*，并绘制一张实体关系图。

== 要求

*红包*能够作为*消息*出现在*群聊*中，可以被*用户*发出和接收，可以查看*用户领取的状态*。

*Bonus*：针对红包发放这样的*高并发场景*，在数据库*选用*和*设计*上，你可以做出哪些性能方面的优化？

== 提示

实体关系图可以参考下面这张图绘制：

- 用矩形表示实体、椭圆形表示属性、菱形表示关系。
- 在表示关系的连线上，1:N 表示一对多关系，M:N 表示多对多关系。
- 文字下方加下划线表示作为主键的属性。

#figure(image("example.jpg", height: 35%), caption: "选课系统的数据库表ER图例")

== 绘图区

```
Happy hacking :)
```
