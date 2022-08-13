import 'package:fetchx/fetchx.dart';

void main(List<String> args) async {
  print(DateTime.now().second.toString() +
      "," +
      DateTime.now().millisecond.toString());
  Response? response =
      await "https://jsonplaceholder.typicode.com/users/1".get().cache();

  print(response.json);

  print(DateTime.now().second.toString() +
      "," +
      DateTime.now().millisecond.toString());
}
