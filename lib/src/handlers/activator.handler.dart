import "dart:mirrors";

class Activator {
  static createInstance(Type type,
      [Symbol? constructor,
      List? arguments,
      Map<Symbol, dynamic>? namedArguments]) {
    var typeMirror = reflectType(type);
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
