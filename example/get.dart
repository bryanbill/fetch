import 'package:fetchx/fetchx.dart';

void main() async {
  String baseUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Response response = await baseUrl.get();
  Simple simple = response.to<Simple>();
  print(simple.body);
}

class Simple {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Simple({this.userId, this.id, this.title, this.body});

  set userId(int? userId) => userId = userId;
  set id(int? id) => id = id;
  set title(String? title) => title = title;
  set body(String? body) => body = body;
}
