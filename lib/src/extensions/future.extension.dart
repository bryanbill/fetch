import 'dart:isolate';

import 'package:fetchx/src/handlers/activator.handler.dart';
import 'package:fetchx/src/models/request.model.dart';
import 'package:fetchx/src/models/response.model.dart';
import 'package:hive/hive.dart';

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

  /// Caches the response in the local storage.
  /// Caching happens in an isolate.
  /// Example:
  /// ```dart
  /// final response = await "https://example.com/api/v1/users/1".get().cache();
  /// ```
  Future<Response> cache({String? path = "fetchx_cache", int? maxAge}) {
    return then((value) {
      // Cache the response
      var v = value as Response;
      // Cache the response v in an isolate
      final port = ReceivePort();
      Isolate.spawn(_cache, [v, path, maxAge, port.sendPort]);
      return v;
    }).catchError((er) => throw er);
  }

  void _cache(List input) async {
    final SendPort send = input[3];
    final Response v = input[0];
    final String path = input[1];
    final int? maxAge = input[2];
    Hive.init(path);
    final box = await Hive.openBox("cache");
    box.put(v.request!.url, {
      'body': v.body,
      'statusCode': v.statusCode,
    });
    send.send("done");

  }
}
