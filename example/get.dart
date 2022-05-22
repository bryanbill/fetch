import 'package:fetchx/fetchx.dart';

void main() async {
  String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Response response = await '$baseUrl/1'.get();
  print(response.body);
}
