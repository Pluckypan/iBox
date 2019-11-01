# iBox
一个 Dart 实现的终端指令盒子，方便日常开发。A Dart Command Box for Developer.

## npm

通过 `ibox npm -s` 即可切换 `npm` 镜像,再也不需要记住哪冗长的网址

## pub

由于中国大陆访问 `pub.dev` 比较慢,所以一般情况下,都会将 `pub` 镜像设置为 ` PUB_HOSTED_URL=https://pub.flutter-io.cn` 。但是发布时,我们必须要设置回来，或者需要手动指定发布服务器比如 `pub publish --server https://pub.dev/` 但是这些都太繁琐了，`ibox` 让一切变得更简单

- 发布预演 `ibox pub -l`
- 正式发布 `ibox pub -p`