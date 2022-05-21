import 'package:fetchx/fetchx.dart';

void main() async {
  // Get Method
  Response response =
      await 'https://jsonplaceholder.typicode.com/posts/1'.get();
  print(response.body);
  // Post Method
  response = await 'https://jsonplaceholder.typicode.com/posts'.post(
    {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    },
  );
  print(response.body);

  // Put Method
  response = await 'https://jsonplaceholder.typicode.com/posts/1'.put(
    {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    },
  );
  print(response.body);

  // Delete Method
  response = await 'https://jsonplaceholder.typicode.com/posts/1'.delete();
  print(response.body);

  // Patch Method
  response = await 'https://jsonplaceholder.typicode.com/posts/1'.patch(
    {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    },
  );
  print(response.body);
}
