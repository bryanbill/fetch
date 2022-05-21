import 'package:fetch/src/handlers/request.handler.dart';
import 'package:fetch/src/models/response.model.dart';

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
}
