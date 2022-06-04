import "dart:mirrors";

import '../models/base.model.dart';

class Activator {
  /// Creates an instance of the specified type.
  ///
  /// [type] is the type of the instance to create.
  /// [args] is the list of arguments to pass to the constructor.
  /// [namedArgs] is the list of named arguments to pass to the constructor.
  /// Throws an [ArgumentError] if [type] is not a class.
  /// Throws an [ArgumentError] if [type] is not a subclass of [BaseModel].
  /// Returns the instance of the specified type.
  static createInstance(Type type,
      [Symbol? constructor,
      List? arguments,
      Map<Symbol, dynamic>? namedArguments]) {
    var typeMirror = reflectType(type);
    assert(
        typeMirror is ClassMirror &&
            typeMirror.superclass == reflectType(BaseModel),
        "Cannot create the instance of the type '$type'. It's not a subclass of 'BaseModel'.");
    if (typeMirror is ClassMirror) {
      return typeMirror
          .newInstance(constructor ?? const Symbol(""), arguments ?? [],
              namedArguments ?? {})
          .reflectee;
    } else {
      throw ArgumentError("Cannot create the instance of the type '$type'.");
    }
  }
}
