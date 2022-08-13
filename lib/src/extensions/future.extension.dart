import 'package:fetchx/src/handlers/activator.handler.dart';
import 'package:fetchx/src/models/request.model.dart';
import 'package:fetchx/src/models/response.model.dart';

// Can't create a quard clause on the "supposed" convertible type.
// The idea is that even "onError", that should be convertible to the provided type
extension ToTypeConverter on Future {
  /// Converts the response to the specified type.

  Future<dynamic> to<T>(creator) {
    return then((value) {
      try {
        value = value as Response;
        if (value.json.runtimeType.toString().contains("Map")) {
          return Activator<T>(creator).createInstance().fromJson(value.json);
        } else {
          throw Exception("The response is not a map");
        }
      } catch (exc) {
        throw Exception(
            "Exception while converting the response to the specified type: ${exc.toString()}");
      }
    }).catchError((err) => throw err);
  }

  /// Converts the response to the specified type.
  /// Returns a list of the specified type.
  Future<List<T>> toList<T>(creator) {
    List<T> _list = [];
    return then((value) {
      try {
        value = value as Response;
        if (value.json.runtimeType != List) {
          throw Exception("The response is not a list");
        }
        value.json.forEach((element) {
          _list.add(Activator<T>(creator).createInstance().fromJson(element));
        });
        return _list;
      } catch (exc) {
        throw Exception(
            "Exception while converting the response to the specified type: ${exc.toString()}");
      }
    }).catchError((err) => throw err);
  }

  @Deprecated("Use Response().request instead")
  Future<Request?> request() {
    return then((value) {
      return (value as Response).request;
    }).catchError((er) => throw er);
  }

  Future<void> cache() {
    return then((value) {
      // Cache the response
      value = value as Response;
      
    }).catchError((er) => throw er);
  }
}
