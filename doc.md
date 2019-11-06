## Links
- path: ^1.6.2
- jaguar: ^2.4.30
- [serve](https://github.com/Jaguar-dart/serve)

## Platform
```
  print("操作系统：${Platform.operatingSystem}");
  print("CPU核数：${Platform.numberOfProcessors}");
  print("文件URI：${Platform.script}");
  print("文件路径：${Platform.script.toFilePath()}\n");

  //遍历所有环境变量
  Platform.environment.forEach((k, v) {
    print(k + "=" + v);
  });
```