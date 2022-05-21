extension FutureResolve on Future {
  Future<T> resolve<T>() async {
    return await this;
  }
}
