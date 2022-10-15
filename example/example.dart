import 'package:fetchx/fetchx.dart';

const String _baseUrl = "https://jsonplaceholder.typicode.com/";
void main() async {
  // Simple GET request
  final response = await _baseUrl.get(path: "users/1");
  //print(response.json);

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

 ;
}
