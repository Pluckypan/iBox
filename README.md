# iBox
一个 Dart 实现的终端指令盒子，方便日常开发。A Dart Command Box for Developer.

## Feature
```

-------------- iBox(0.0.1) --------------
$ ibox npm -s, --server    set npm server.
$ ibox pub -l, --lint      pub publish --dry-run.
$ ibox pub -p, --publish   pub publish.

```

## 运行环境
当前指令需要运行在 `Dart VM` 环境下，所以需要正确安装 `Dart SDK` 和 `Pub`.这与 `nodejs` 与 `npm` 是一样的。可以参考 [链接](http://www.echo.engineer/FlutterCN/#/install) 配置你的运行环境。

## Install
```
$ pub global activate ibox
```


## npm

通过 `ibox npm -s` 即可切换 `npm` 镜像,再也不需要记住哪冗长的网址

```
➜  sample ibox npm -s
[1] https://registry.npmjs.org
[2] https://registry.npm.taobao.org
[✓] select a server : 2
registry => https://registry.npm.taobao.org/

```

## pub

由于中国大陆访问 `pub.dev` 比较慢,所以一般情况下,都会将 `pub` 镜像设置为 ` PUB_HOSTED_URL=https://pub.flutter-io.cn` 。但是发布时,我们必须要设置回来，或者需要手动指定发布服务器比如 `pub publish --server https://pub.dev/` 但是这些都太繁琐了，`ibox` 让一切变得更简单

- 发布预演 `ibox pub -l`
- 正式发布 `ibox pub -p`


## 本地调试
如果想下载代码学习，可按以下步骤：

```
$ mkdir dart && cd dart
$ git clone git@github.com:Pluckypan/iBox.git
$ cd iBox

# 启用 ibox
$ pub global activate --source path $PWD

# 测试 ibox
$ ibox

# 或者
$ pub global run ibox:main

# 停用 ibox
$ pub global deactivate ibox

# 查看所有 dart cli
$ pub global list

```

## 目录结构
```
➜  iBox git:(master) ✗ tree
.
├── CHANGELOG.md
├── LICENSE
├── README.md
├── bin
│   ├── helper.dart
│   ├── main.dart
│   ├── npm.dart
│   └── pub.dart
├── pubspec.lock
└── pubspec.yaml

1 directory, 9 files

```

## TODO
- [ ] 修复 `ibox pub -p` 指令 
- [ ] 读取 `pubspec.yaml` 参数,比如版本
- [ ] 添加 `ibox` 配置文件 `ibox.config`
- [ ] 添加 `ibox npm --server --add` 指令,可自己配置 npm 镜像
- [ ] 添加 `ibox ssr -p 1991` 指令

## 参考链接
- [Pub 包管理](http://www.echo.engineer/FlutterCN/#/package)
- [Dart 开发自己的CLI](http://www.echo.engineer/FlutterCN/#/executable)
- [Dart 语言入门](http://www.echo.engineer/FlutterCN/#/dart)

## 说明
1. iBox 目前只在 Mac 环境下进行过验证，不保证其他平台能正常运行
2. 项目初衷只是为了熟悉 Dart 语言,理论上一些功能完全可以通过 `alias` 来 [实现](http://www.echo.engineer/FlutterCN/#/install?id=%e7%8e%af%e5%a2%83%e5%8f%98%e9%87%8f) 