/// Define function alias [ItemCreator] type for the [Activator] class.
/// This alias is used to create instances of the specified class.
typedef ItemCreator<S> = S Function();

class Activator<T> {
  ItemCreator<T> creator;

  Activator(this.creator);

  /// Creates an instance of the specified class.
  /// Returns an instance of the specified class.
  /// Example:
  /// ```dart
  /// class MyClass {
  ///  MyClass() {
  ///   print('MyClass created');
  /// }
  /// }
  /// ...
  /// Activator<MyClass> activator =
  /// new Activator<MyClass>(() => new MyClass()).createInstance();
  /// ```
  createInstance() => creator();
}
