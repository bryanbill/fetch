# Fetchx

Fetchx is a simple, fast, and secure HTTP client for Dart. It leverages extensions to allow using url-like strings to make http requests.

[Read in another language](#translations)

## Table of contents

## Features

- Get
- Post
- Put
- Delete
- Patch

## Usage

To use this package add this to your pubspec.yaml

```yaml
dependencies:
  fetchx: ^0.0.5
```

Then import the package

```dart
import 'package:fetchx/fetchx.dart';
```

### Get

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".get();

```

### Post

```dart

final response = await "https://jsonplaceholder.typicode.com/posts".post({
  "title": "foo",
  "body": "bar",
  "userId": 1
});

```

### Put

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".put({
  "title": "foo",
  "body": "bar",
  "userId": 1
});

```

### Delete

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".delete();

```

### Patch

```dart

final response = await "https://jsonplaceholder.typicode.com/posts/1".patch({
  "title": "foo"
});

```

## EXPERIMENTAL

These features are still experimental and may change in the future. Any feedback is welcome to improve the package.

### To Model Casting

```dart
class User extends BaseModel{
  final int? id;
  final String? name;
  User({
     this.id,
     this.name
  });

  @override
  User fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"]
      );
}

final response = await "https://jsonplaceholder.typicode.com/users/1".get().to<User>(()=>User());
print(response.name);

```

### Cache

```dart
final response = await "https://jsonplaceholder.typicode.com/posts/1".get().cache();
```

## Translations

This README is available in other languages:

- [English](README.md)
- [简体中文](README_zh_CN.md)
