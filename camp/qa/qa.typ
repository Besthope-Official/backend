#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold

#let title = [2024奇点后端部面试]
#set text(font: ("Source Han Serif SC"))
#set page(
  header: align(right + horizon, title),
  background: image("backend_logo_opacity_0.4.png", fit: "cover", width: 30%),
  numbering: "1",
  number-align: right,
)

#align(center, text(20pt)[
  *#title*
])

#show link: underline

= 前情提要

在正式加入部门之前，这一次，我们希望通过一组面试题来了解大家的实际情况：它不是考核性的，面试题并不关注大家的知识储备，毕竟大家都是新生，它更像是一份文档、一个教程——我们希望通过这份材料来了解大家的*自学能力和思维能力*，同时也让大家能对后端开发的工作有大致了解。

我们同时也提供了一份免试题，供那些具有*丰富 Web 开发*经验的同学参考。如果你选择免试任务，我们不妨先来花些时间聊聊。

最后，祝你好运，享受头脑风暴吧！

= 面试题

设计类似微信红包的后端接口架构。

== 逻辑实现

我们把红包系统拆成四步：发红包、包红包、抢红包、拆红包。

发红包只需要指定红包金额和人数。

红包金额的分配算法是一个简单的*取随机数*。一种实现是，下限是一分钱，上限是红包剩余总额平分后的两倍。

抢和拆红包是分开的。经常出现的一种情况，抢了红包——红包被分完了。

== 性能调优

某些游戏公司的服务器经常被人诟病“土豆服务器”，崩溃、卡帧、延迟——另外的一些场景，例如，大麦网抢票、12306抢车票，这些系统在流量访问上的显著特征是什么？你觉得抢红包系统会出现哪些问题？

针对大流量的场景，后端常用的优化方式有：

=== 缓存

*数据库*在后端的任务是*持久化数据*，将一条条数据存放在服务器的*硬盘*上。

但硬盘读写是一个耗时的任务，你看到的服务器卡死，很有可能是因为对应数据库处理不过来而导致的读写锁冲突、死锁，甚至“雪崩”——相比之下，*内存*的读写速度要至少快 100 倍，而这是由*硬件特质*和特殊的*缓存 Cache*机制保证的。

前端会保存静态资源（图片，样式……）作为浏览器缓存；而对于那些实时的数据，在后端的实际应用场景中，通常将缓存数据库（例如 *Redis*）作为中间层：

- 对于*读*操作：先尝试从缓存中读取数据，如果没有（*缓存未命中*），再从数据库中读取。
- 对于*写*操作：先将数据写入缓存，然后*异步*地批量写入数据库。

=== 异步

异步的思想很简单：将耗时的操作（例如网络请求、数据库查询）放到后台*线程*中执行，而不阻塞主线程。

实现异步的重要机制之一是*消息队列*。用食堂取餐来类比，它允许顾客（消息*生产者*）在点单后不必等待，可以去做其他事情（比如找座位、聊天等），同时允许后厨（消息*消费者*）按照消息队列的顺序处理订单、*发布*取餐通知，而顾客只需*订阅*，关注自己有没有叫到号。

#figure(grid(
  rows: 2,
  gutter: 2mm,
  image("no-mq.png", width: 75%),
  image("with-mq.png", width: 75%)
  ), 
  caption: "异步优化接口性能的例子：用户注册"
)

=== 负载均衡

通过*集群（分布式系统）*水平拓展服务器来分摊接口流量。通俗来说就是增加服务器的数量。

通常来说会有一个负载均衡服务器（例如Nginx）来处理请求：它会根据各个服务器的负载情况，或按照某些规则（例如根据数据索引来选择不同数据库，*SET化架构*），将请求分发到不同的服务器上。

=== 其它方式

思考下还有什么办法能够进行性能优化。

== 设计单元测试

至此，你的系统设计完成了。随之而来的是一个我们更希望关注的问题：

你的程序怎样才算是正确的？换言之，你要怎么测试你的代码是否正确、bug-free？

确保你的讨论是充分的。思考一下，你还需要考虑哪些潜在的 corner cases(特例)？怎么设计针对大流量的压力测试？

= \*免试题

SWUFE-OJ 是奇点工作室开发部正在开发的在线 OJ 系统，未来可能会作为本校使用的 OJ 系统。它使用 Python Django 作为后端框架，Vue 3 作为前端框架进行开发。它目前的版本在 GitHub 上开源。

获取项目，利用 Git 工具克隆到本地

```
git clone https://github.com/SingularityLab-SWUFE/SWUFE-OJ-Backend.git
```

在以下任务中任选其一完成，并在新的分支发起 Pull Request 提交。

== 项目部署

为该项目添加 dockerfile，使得项目可以部署到 Docker 容器中。

你需要了解 Docker 的基本概念，以及如何编写 Dockerfile。集成的服务除了本 Python 后端以外，还需要包含: MySQL、Redis，以及一个外部的测评系统（目前采用的是 QDUOJ 使用的 `JudgeServer`）。

== 模块开发

为该项目添加社区系统模块，使得用户可以发帖、回帖、点赞、评论等。

- 你需要提交一份接口文档，描述该模块的功能、各个接口的路由、请求参数、返回结果等。
- 你的代码需要编写功能单元测试，覆盖模块里的路由函数，并通过测试。
- 你的代码应当符合项目的整体编码风格。

= 附录

面试题#link("https://www.zybuluo.com/yulin718/note/93148?spm=a2c6h.12873639.article-detail.27.42947521iiarNM")[参考答案]：微信从财付通拉取金额数据，生成个数/红包类型/金额，放到redis集群里，app端将红包ID的请求放入请求队列中，如果发现超过红包的个数，直接返回。根据红包的逻辑处理成功得到令牌请求，则由财付通进行一致性调用，通过像比特币一样，两边保存交易记录，交易后交给第三方服务审计，如果交易过程中出现不一致就强制回归。
