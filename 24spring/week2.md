# 后端部第二周开会

<!-- slide -->

## 在那之前...

<!-- slide vertical=true -->

### Git 的简单操作

<!-- slide vertical=true -->

### 不负责的 django 的开发流程

<!-- slide -->

## SWUFE OJ

<!-- slide -->

## 有关测评机

- 评测机服务器~~探索 ing~~
- ~~可能要自己*参考借鉴*写一套~~
  - 已经成功部署上线啦!
- 简单的介绍下我这一周的 work

<!-- slide vertical=true -->

### 测试数据

- 测试数据放在宿主机上的 test_case 里
- 也就是 docker 配置文件里的 volume
- 默认配置如下

```docker-compose
volumes:
    - $PWD/tests/test_case:/test_case:ro
    - $PWD/log:/log
    # - $PWD/server:/code:ro
    - $PWD/run:/judger
```

举个例子

<!-- slide vertical=true -->

例如 `/www/server/panel/tests/test_case` 就是存放的路径

```plaintext
/www/server/panel/log  --->  /log
/www/server/panel/run  --->  /judger
/www/server/panel/tests/test_case  --->  /test_case
```

测试数据统一放在一个文件夹内

<!-- slide vertical=true -->

```bash
[root@VM-8-4-centos normal]# tree
.
├── 1.in
├── 1.out
└── info

0 directories, 3 files
```

文件目录大概是这样的

<!-- slide vertical=true -->

如果单独拿评测机出来用, `info` 是不可缺的

```json
{
    "spj": false,
    "test_cases": {
        "1": {
            "stripped_output_md5": "eccbc87e4b5ce2fe28308fd9f2a7baf3",
            "output_size": 2,
            "input_name": "1.in",
            "input_size": 4,
            "output_name": "1.out"
        }
    }
}
```

删去了一些文档中的冗余字段. `info` 的自动生成在 `judger_utils/parser.py`

<!-- slide -->

## 我们的下一步...

- 慢慢来, 我们不急
- 把测评机的服务做好
  - 完善好创建题目的接口 `POST /problem`
- 统一好提交 Submission 接口
  - 交题再包装一下
  - 远程提交和本地提交统一起来
- 后端服务可以先部署起来
  - 我们马上要处理跨域, 前后端交互的问题
- 多测评机同步
  - TODO

<!-- slide -->

## 除此以外的

- 创建题单
- 创建比赛
- 讨论

都可以开始做起来了
