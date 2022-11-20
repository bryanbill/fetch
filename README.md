<a href="#">
  <h1 align="center">
    <img alt="Fetchx" src="https://appwrite.internal.namani.co/v1/storage/buckets/6356c646e0a12ac92774/files/637a8a744b0b6c55ce8f/view?project=635573625511a4f3f79c">
  </h1>
</a>

Fetchx is a simple, fast, and secure HTTP client for Dart. It leverages extensions to allow using url-like strings to make http requests.

## Documentation

- [Installation](#installation)
- [How To](#how-to)
- [Experimental](#experimental)
- [Contributing to Fetchx](#contributing)
- [Translations](#translations)
- [License](#license)

[Read in another language](#translations)

## Installation

To use this package add this to your pubspec.yaml

```yaml
dependencies:
  fetchx: ^latest
```

Then import the package

```dart
import 'package:fetchx/fetchx.dart';
```

## How To

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

### Head

```dart
final response = await "https://jsonplaceholder.typicode.com/posts/1".head();
```

### Download

```dart
final file = await "https://jsonplaceholder.typicode.com/posts/1".download();
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

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Translations

This README is available in other languages:

- [English](README.md)
- [简体中文](README_zh_CN.md)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
