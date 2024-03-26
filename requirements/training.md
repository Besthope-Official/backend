# 创建训练题单

## 设计

参考洛谷[题单广场](https://www.luogu.com.cn/training/list)

端口设计

`GET /training/list` 显示题单的列表

`GET /problems/<int:id>` 显示题单中的题目
`POST /problems` 创建题单
`PUT /problems/<int:id>` 更新题单中的题目

## 创建题单的参数

表单传入

提供题单标题, 关联的题目 id(是一个 list)
