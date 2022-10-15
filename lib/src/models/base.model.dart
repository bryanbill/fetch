abstract class BaseModel<T> {
  /// Method to convert json to model.
  T fromJson(Map<String, dynamic> json);
}
