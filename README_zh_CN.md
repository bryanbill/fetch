# Fetchx

Fetchx 是一个基本 Dart 语言的 简单, 快速, 以及安全的 HTTP 客户端. 它利用扩展允许使用类似 URL 的字符串来发出 HTTP 请求。

[Read in another language](#translations)

## Table of contents

## Features (功能)

可以发送下列请求

- Get 请求
- Post 请求
- Put 请求
- Delete 请求
- Patch 请求

## Usage (用法)

要使用此插件，请将其添加到您的 pubspec.yaml

```yaml
dependencies:
  fetchx: ^0.0.5
```

然后在您的代码里面导入包

```dart
import 'package:fetchx/fetchx.dart';
```

### Get 请求

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".get();

```

### Post 请求

```dart

final response = await "https://jsonplaceholder.typicode.com/posts".post({
  "title": "foo",
  "body": "bar",
  "userId": 1
});

```

### Put 请求

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".put({
  "title": "foo",
  "body": "bar",
  "userId": 1
});

```

### Delete 请求

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".delete();

```

### Patch 请求

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".patch({
  "title": "foo"
});

```

## Translations (翻译)

This README is available in other languages:

- [English](README.md) 
- [简体中文](README_zh_CN.md)
- 
