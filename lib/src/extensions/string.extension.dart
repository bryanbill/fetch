import 'dart:io';

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
  Future<Response> get(
      {Map<String, dynamic>? headers,
      String? path,
      Map<String, dynamic>? queryParams}) async {
    return await RequestHandler(this,
            path: path, headers: headers, queryParameters: queryParams)
        .get();
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
  Future<Response> post(Object body,
      {Map<String, dynamic>? headers, String? path}) async {
    return await RequestHandler(this, body: body, headers: headers, path: path)
        .post();
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
  Future<Response> put(Object body,
      {Map<String, dynamic>? headers, String? path}) async {
    return await RequestHandler(this, body: body, headers: headers, path: path)
        .put();
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// Example:
  /// ```dart
  /// final response = await "https://example.com/api/v1/users/1".delete();
  /// ```
  Future<Response> delete(
      {Object? body, Map<String, dynamic>? headers, String? path}) async {
    return await RequestHandler(this, headers: headers, body: body, path: path)
        .delete();
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
  Future<Response> patch(Object body,
      {Map<String, dynamic>? headers, String? path}) async {
    return await RequestHandler(this, body: body, headers: headers, path: path)
        .patch();
  }

  Future<Response?> cache(
      {bool? preferNetwork = true,
      String? path = "fetchx_cache",
      Map<String, dynamic>? headers}) async {
    Hive.init(path);
    late Response response;
    // Check if preferNetwork is set to true
    if (preferNetwork!) {
      response = await get(headers: headers);
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
    }
    // Check network first
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

  Future<Response?> clearCache({String? path = "fetchx_cache"}) async {
    Hive.init(path);
    return await Hive.openBox('cache').then((box) {
      box.clear();
      return null;
    });
  }

  Future<Response?> head({Map<String, dynamic>? headers, String? path}) async {
    return await RequestHandler(this, headers: headers, path: path).head();
  }

  Future<File?> download(
      {Map<String, dynamic>? headers,
      String? path,
      String? savePath,
      String? fileName}) async {
    return await RequestHandler(this, headers: headers, path: path).download(
      filePath: savePath,
    );
  }
}
