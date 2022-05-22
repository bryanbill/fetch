import 'package:fetchx/fetchx.dart';

void main() async {
  Response response = await 'https://jsonplaceholder.typicode.com/posts/1'.patch(
    {
      'body': 'bar',
    },
  );
  print(response.body);
}
