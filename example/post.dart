import 'package:fetchx/fetchx.dart';

void main() async{

  Response response = await 'https://jsonplaceholder.typicode.com/posts'.post(
    {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    },
  );
  print(response.body);

}