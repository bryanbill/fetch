extension ListUtils on List {
  List take(int length) {
    assert(this.length > length);
    return sublist(0, length);
  }
}
