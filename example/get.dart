import 'package:fetchx/fetchx.dart';

void main() async {
  String baseUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Response response = await baseUrl.get();
  Simple simple = response.to<Simple>();
  print(simple.id);
}

class Simple {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Simple({this.userId, this.id, this.title, this.body});

  Simple fromJson(Map<String, dynamic> json) {
    return Simple(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
