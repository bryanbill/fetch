/// Define [ItemCreator] type for the [Activator] class.
/// This type is used to create instances of the specified type.
typedef ItemCreator<S> = S Function();

class Activator<T> {
  ItemCreator<T> creator;

  Activator(this.creator);

  /// Creates an instance of the specified type.
  /// Returns an instance of the specified type.
  createInstance() => creator();
}
