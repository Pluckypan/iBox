# iBox
一个 Dart 实现的终端指令盒子，方便日常开发。A Dart Command Box for Developer.

## npm

通过 `ibox npm -s` 即可切换 `npm` 镜像,再也不需要记住哪冗长的网址

## pub

由于中国大陆访问 `pub.dev` 比较慢,所以一般情况下,都会将 `pub` 镜像设置为 ` PUB_HOSTED_URL=https://pub.flutter-io.cn` 。但是发布时,我们必须要设置回来，或者需要手动指定发布服务器比如 `pub publish --server https://pub.dev/` 但是这些都太繁琐了，`ibox` 让一切变得更简单

- 发布预演 `ibox pub -l`
- 正式发布 `ibox pub -p`

## 参考链接
- [Pub 包管理](http://www.echo.engineer/FlutterCN/#/package)
- [Dart 开发自己的CLI](http://www.echo.engineer/FlutterCN/#/executable)
- [Dart 语言入门](http://www.echo.engineer/FlutterCN/#/dart)

## 说明
1. iBox 目前只在 Mac 环境下进行过验证，不保证其他平台能正常运行
2. 项目初衷只是为了熟悉 Dart 语言,理论上一些功能完全可以通过 `alias` 来 [实现](http://www.echo.engineer/FlutterCN/#/install?id=%e7%8e%af%e5%a2%83%e5%8f%98%e9%87%8f) 