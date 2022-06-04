import 'dart:convert';
import 'dart:io';

import 'package:fetchx/src/handlers/activator.handler.dart';

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
  dynamic get json => jsonDecode(body!);
  dynamic to<T>() {
    var activated = Activator.createInstance(T);
    return activated.fromJson(json);
  }
}
