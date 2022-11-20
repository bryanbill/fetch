import 'package:fetchx/fetchx.dart';

const String _baseUrl = "https://jsonplaceholder.typicode.com/";
void main() async {
  // Simple GET request
  final response = await _baseUrl.get(path: "users/1");
  print(response.json);

  // Simple POST request
  final response2 = await _baseUrl.post(
    {"name": "John Doe"},
    path: "users",
  );
  //print(response2.json);

  // Simple PUT request
  final response3 = await _baseUrl.put(
    {"name": "John Doe"},
    path: "users/1",
  );
  //print(response3.json);

  // Simple PATCH request
  final response4 = await _baseUrl.patch(
    {"name": "John Doe"},
    path: "users/1",
  );
  //print(response4.json);

  // Simple DELETE request
  final response5 = await _baseUrl.delete(path: "users/1");
  //print(response5.statusCode);

  // EXPERIMENTAL

  // Simple GET request with cache - {Store the response in a local database - The URI is the key}
  final response6 = await _baseUrl.get(path: "users/1").cache();
  //print(response6.json);

  // Simple GET request with Model object conversion
  final response7 = await "https://jsonplaceholder.typicode.com/users/1"
      .get()
      .to<User>(() => User());
  print(response7.name);

  final file = await "https://images.unsplash.com/photo-1668882488934-544f9363c780?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60".download();
  print(file?.path);
}

class User extends BaseModel {
  final int? id;
  final String? name;
  User({this.id, this.name});

  @override
  User fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name']);
  }
}
