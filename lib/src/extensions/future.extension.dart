import 'package:fetchx/src/handlers/activator.handler.dart';

extension ToTypeConverter on Future {
  /// Converts the response to the specified type.
  dynamic to<T>() {
    return then((value) => Activator.createInstance(T).fromJson(value.json));
  }
}
