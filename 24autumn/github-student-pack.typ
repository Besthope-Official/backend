#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/cetz:0.2.2"
#show: show-cn-fakebold

#let title = [申请 Github 学生认证]
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

== Github 学生认证

注: 如果你实在无法获取 Github 学生认证, 可以仅在 Jetbrains 官网申请 JetBrains 教育许可证, 然后安装 PyCharm. JetBrains 的审核会比 Github 宽松而且更快.

我们参考这篇#link("https://hetong-re4per.com/posts/how-students-get-github-student-pack/")[博客].

=== 准备

理论上, 准备材料在申请页面里写的很详细:

#figure(image("images/requirements.png", width: 80%))

- 支持的浏览器: Edge 或 Chorme 浏览器
- 教育邮箱 (`.edu.cn` 后缀, 西财的#link("https://info.swufe.edu.cn/info/1016/1006.htm")[学生邮箱])
- 学信网在线学籍在线验证报告 (进入#link("https://my.chsi.com.cn/archive/bab/xj/show.action")[学信网学信档案]获取 PDF, 再转为 PNG 格式备用)
- Github 帐号
- *人在学校或者是手机定位在学校(关闭代理)*

=== 2FA 验证

通过 #link("https://docs.github.com/zh/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication")[2FA 双重身份验证]: GitHub 要求所有在 GitHub.com 上贡献代码的用户启用一种或多种形式的双因素身份验证, 如果你没有通过 2FA 验证, 很有可能会被 Github 认为是不可靠的账户.

我们推荐你使用 TOTP 应用来完成 2FA 验证: 在手机上安装 Authenticator 应用(应用商城或者网上搜索), 在 #link("https://github.com/settings/security")[安全]页面下找到 Two-Factor methods

#figure(image("images/2fa.png"), caption: [我这里配置好了所以有 configured 字样])

之后按照指示来添加 Github 账户(需要你扫码)到手机 Authenticator 应用中. 详细步骤你可以参考这篇 #link("https://www.cnblogs.com/johnnyzen/p/17880870.html")[blog].

#figure(image("images/authenticator.png", width: 75%))

=== 配置好你的个人简介

在 #link("https://github.com/settings/profile")[Github Profile] 查看你的个人简介.

如果你的简介为空, 我们推荐你在主页编辑一下 README.md. 你可以尝试下 #link("https://profilinator.rishav.dev/")[Github Profilinator].

=== 申请

进入 #link("https://github.com/settings/emails")[Github 邮箱设置], 添加自己的教育邮箱为候选邮箱(主邮箱是你注册用的).

#figure(image("images/verified-email.png"))

如果出现 Unverified 的字样, 尝试重发邮件. 如果出现错误, 检查代理环境以及是否通过 2FA 验证.

进入#link("https://education.github.com/discount_requests/application")[Benefits application] 页面后, 如果你的教育邮箱绑定成功以后, 它会自动识别学校, 点击 Continue 进入

#figure(image("images/school.png", width: 80%))

在 Github 获取你的位置信息时, 记得人在学校, 同时关闭代理.

之后你需要上传你准备好的学信网在线验证的图, 推荐采用 AI 翻译工具将其转换成英文版本, 同时将图像重命名为 `student_id_card.png` 这样的文件, 然后再提交.

如果成功以后, 在 Benefits application 页面的右边就会显示你成功的申请.

#figure(image("images/approved.png"))

等待一会儿时间, 你就可以拥有 Student Developer Pack. 在 3 天内能够搞定. 详情见这篇 #link("https://github.com/orgs/community/discussions/111352#user-content-how-long-after-ive-been-approved-will-i-receive-my-academic-benefits")[discussion].
