import 'package:fetchx/fetchx.dart';
import 'package:test/test.dart';

void main() {
  group('Test', () {
    test('Get Method', () async {
      Response response =
          await "https://jsonplaceholder.typicode.com/todos/1".get();
      expect(response.body, isNotNull);
    });

    test("Post Method", () async {
      Response response = await "https://jsonplaceholder.typicode.com/posts"
          .post({'title': 'foo', 'body': 'bar', 'userId': 1});
      expect(response.body, isNotNull);
    });

    test("Put Method", () async {
      Response response = await "https://jsonplaceholder.typicode.com/posts/1"
          .put({"id": 1, 'title': 'foo', 'body': 'bar', 'userId': 1});
      expect(response.statusCode, 200);
    });

    test("Delete Method", () async {
      Response response =
          await "https://jsonplaceholder.typicode.com/posts/1".delete();
      expect(response.statusCode, 200);
    });
  });
}
