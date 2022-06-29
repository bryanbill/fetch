import 'dart:convert';
import 'dart:io';
import 'package:fetchx/src/models/response.model.dart';

class RequestHandler {
  final String url;
  final Object? body;
  final Map<String, dynamic>? headers;
  final bool isMultipart;

  RequestHandler(this.url, {this.body, this.headers, this.isMultipart = false});

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// and a non-null [Response.statusCode].
  /// Example:
  /// ```dart
  /// Response response = await RequestHandler('https://www.google.com').get();
  /// ```
  Future<Response> get() async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    if (headers != null) {
      headers?.forEach((key, value) {
        request.headers.add(key, value);
      });
    }
    var response = await request.close();
    return Response.fromClient(
        response, await response.transform(Utf8Decoder()).join());
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// and [Response.statusCode] will be set to the status code of the error.
  /// Example:
  /// ```dart
  /// Response response = await await RequestHandler('https://example.com/api/v1/users',
  ///                        {'name': 'John Doe'}).post();
  /// ```
  Future<Response> post() async {
    var request = await HttpClient().postUrl(Uri.parse(url));
    if (isMultipart) {
      request.headers.contentType = ContentType.parse('multipart/form-data');
    }
    if (headers != null) {
      headers!.forEach((key, value) {
        request.headers.set(key, value);
      });
    }
    request.add(utf8.encode(json.encode(body)));
    var response = await request.close();
    return Response.fromClient(
        response, await response.transform(Utf8Decoder()).join());
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// Example:
  /// ```dart
  /// final response = await RequestHandler('https://example.com/api/v1/users/1',
  ///                        {'name': 'John Doe'})
  ///                        .put();
  /// ```
  Future<Response> put() async {
    var request = await HttpClient().putUrl(Uri.parse(url));
    if (headers != null) {
      headers!.forEach((key, value) {
        request.headers.set(key, value);
      });
    }
    request.add(utf8.encode(json.encode(body)));
    var response = await request.close();
    return Response.fromClient(
        response, await response.transform(Utf8Decoder()).join());
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// /// Example:
  /// ```dart
  /// final response = await RequestHandler('https://example.com/api/v1/users/1')
  ///                        .delete();
  /// ```
  Future<Response> delete() async {
    var request = await HttpClient().deleteUrl(Uri.parse(url));

    if (headers != null) {
      headers!.forEach((key, value) {
        request.headers.set(key, value);
      });
    }

    request.add(utf8.encode(json.encode(body)));
    var response = await request.close();
    return Response.fromClient(
        response, await response.transform(Utf8Decoder()).join());
  }

  /// Returns a [Response] object with the response from the server.
  ///
  /// If the request fails, the [Response] object will have a null [Response.body]
  /// Example:
  /// ```dart
  /// final response = await RequestHandler('https://example.com/api/v1/users/1',
  ///                        {'name': 'John Doe'})
  ///                        .patch();
  /// ```
  Future<Response> patch() async {
    var request = await HttpClient().patchUrl(Uri.parse(url));

    if (headers != null) {
      headers!.forEach((key, value) {
        request.headers.set(key, value);
      });
    }
    request.add(utf8.encode(json.encode(body)));
    var response = await request.close();
    return Response.fromClient(
        response, await response.transform(Utf8Decoder()).join());
  }
}
