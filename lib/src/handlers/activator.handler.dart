typedef ItemCreator<S> = S Function();

class Activator<T> {
  ItemCreator<T> creator;

  Activator(this.creator);

  createInstance() => creator();
}
