import 'dart:io';

class Response {
  final int? statusCode;
  final String? body;
  final HttpConnectionInfo? connectionInfo;
  final HttpHeaders? headers;

  Response({this.statusCode, this.body, this.connectionInfo, this.headers});

  factory Response.fromClient(HttpClientResponse clientResponse, body) {
    return Response(
        statusCode: clientResponse.statusCode,
        body: body,
        connectionInfo: clientResponse.connectionInfo,
        headers: clientResponse.headers);
  }
}
