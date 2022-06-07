import 'package:fetchx/src/handlers/activator.handler.dart';
import 'package:fetchx/src/models/response.model.dart';

extension ToTypeConverter on Future {
  /// Converts the response to the specified type.
  Future<dynamic> to<T>(creator) {
    return then((value) {
      value = value as Response;
      assert(value.statusCode == 200 && value.body != null, "Request failed");

      if (value.json.runtimeType.toString().contains("Map")) {
        return Activator<T>(creator).createInstance().fromJson(value.json);
      } else {
        throw Exception("The response is not a map");
      }
    });
  }

  /// Converts the response to the specified type.
  /// Returns a list of the specified type.
  Future<List<T>> toList<T>(creator) {
    List<T> _list = [];
    return then((value) {
      assert(value is Response, "Not a Response");
      if (value.statusCode == 200 && value.json.runtimeType == List) {
        value.json.forEach((element) {
          _list.add(Activator<T>(creator).createInstance().fromJson(element));
        });
        return _list;
      } else {
        throw Exception("Response is not a list");
      }
    });
  }
}
