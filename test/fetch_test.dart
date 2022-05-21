import 'package:fetch/src/extensions/string.extension.dart';
import 'package:fetch/src/models/response.model.dart';
import 'package:test/test.dart';

void main() {
  group('Test', () {
    test('Get Method', () async {
      Response response =
          await "https://jsonplaceholder.typicode.com/todos/1".get();
      expect(response.json()['userId'], 1);
    });

    test("Post Method", () async {
      Response response = await "https://jsonplaceholder.typicode.com/posts"
          .post({'title': 'foo', 'body': 'bar', 'userId': 1});
      expect(response.json()['title'], 'foo');
    });

    test("Put Method", () async {
      Response response = await "https://jsonplaceholder.typicode.com/posts/1"
          .put({'title': 'foo', 'body': 'bar', 'userId': 1});
      expect(response.json()['title'], 'foo');
    });

    test("Delete Method", () async {
      Response response =
          await "https://jsonplaceholder.typicode.com/posts/1".delete();
      expect(response.json()['title'], isNull);
    });
  });
}
