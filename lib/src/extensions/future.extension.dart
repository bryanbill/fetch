import 'package:fetchx/src/handlers/activator.handler.dart';

extension ToTypeConverter on Future {
  /// Converts the response to the specified type.
  Future<dynamic> to<T>() {
    return then((value) => Activator.createInstance(T).fromJson(value.json));
  }

  Future<List<T>> toList<T>() {
    List<T> _list = [];
    return then((value) {
      value.json.forEach((element) {
        _list.add(Activator.createInstance(T).fromJson(element));
      });
      return _list;
    });
  }
}
