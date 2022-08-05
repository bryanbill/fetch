import 'package:fetchx/src/handlers/request.handler.dart';
import 'package:fetchx/src/models/response.model.dart';
import 'package:hive/hive.dart';

extension RequestParsing on String {
  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// and a non-null [Response.statusCode].
  /// Example:
  /// ```dart
  /// Response response = await "https://www.google.com".get();
  /// ```
  Future<Response> get({Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, headers: headers).get();
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// and [Response.statusCode] will be set to the status code of the error.
  /// Example:
  /// ```dart
  /// Response response = await "https://example.com/api/v1/users".post(
  ///                     {'name': 'John Doe'},
  ///                     headers: {'content-type': 'application/json'})
  ///                     .post();
  /// ```
  Future<Response> post(Object body, {Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, body: body, headers: headers).post();
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// Example:
  /// ```dart
  /// final response = await "https://example.com/api/v1/users/1".put(
  ///                   body: {'name': 'John Doe'},
  ///                   headers: {'content-type': 'application/json'})
  ///                  .put();
  /// ```
  Future<Response> put(Object body, {Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, body: body, headers: headers).put();
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// Example:
  /// ```dart
  /// final response = await "https://example.com/api/v1/users/1".delete();
  /// ```
  Future<Response> delete({Object? body, Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, headers: headers, body: body).delete();
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// Example:
  /// ```dart
  /// final response = await "https://example.com/api/v1/users/1".patch(
  ///                    {'name': 'John Doe'},
  ///                   headers: {'content-type': 'application/json'})
  ///                  .patch();
  /// ```
  Future<Response> patch(Object body, {Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, body: body, headers: headers).patch();
  }

  Future<Response?> cache({String? path, Map<String, dynamic>? headers}) async {
    Hive.init(path?? "fetchx_cache");
    // Check network first
    final response = await get(headers: headers);
    if (response.statusCode == 200) {
      // Save to cache
      await Hive.openBox('cache');
      await Hive.box('cache').put(this, {
        'body': response.body,
        'statusCode': response.statusCode,
      });
      Hive.close();
      return response;
    }
    return await Hive.openBox('cache').then((box) {
      final cachedResponse = box.get(this);
      if (cachedResponse != null) {
        return Response(
          body: cachedResponse['body'],
          headers: response.headers,
          statusCode: cachedResponse['statusCode'],
          request: response.request,
        );
      }
      print("Cache is empty");
      return null;
    });
  }
}
