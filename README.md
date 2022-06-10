# Fetchx

Un package per dart/flutter creato per creare richieste HTTP

## Caratteristiche
- Get
- Post
- Put
- Delete
- Patch

## Utilizzo
Per usare il package aggiungi la dipendenza nel tuo file pubspec.yaml

```yaml
dependencies:
  fetchx: ^0.0.4
```

Importa poi il package nel tuo file

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
