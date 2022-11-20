import 'dart:convert';
import 'dart:io';

import 'package:fetchx/src/models/request.model.dart';

class Response {
  final int? statusCode;
  final String? body;
  final HttpConnectionInfo? connectionInfo;
  final HttpHeaders? headers;
  final Request? request;

  Response(
      {required this.request,
      this.statusCode,
      this.body,
      this.connectionInfo,
      this.headers});

  /// Maps the client response to [Response]
  factory Response.fromClient(HttpClientResponse clientResponse, body,
      {Map<String, dynamic>? originHeaders, String? origin}) {
    return Response(
        request: Request(
          url: origin,
          body: body,
          headers: originHeaders,
        ),
        statusCode: clientResponse.statusCode,
        body: body,
        connectionInfo: clientResponse.connectionInfo,
        headers: clientResponse.headers);
  }

  /// Returns the json object of the body from [Response].
  dynamic get json => body != null ? jsonDecode(body!) : null;

  /// Returns the bytes of the body from [Response].
  /// Example:
  /// ```dart
  /// Response response = await RequestHandler('https://www.google.com').get();
  /// print(response.bytes);
  /// ```

  List<int> get bytes => body != null ? utf8.encode(body!) : [];

  @override
  String toString() {
    return 'Response{statusCode: $statusCode, body: $body, connectionInfo: $connectionInfo, headers: $headers}';
  }
}
