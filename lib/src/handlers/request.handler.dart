import 'dart:convert';
import 'dart:io';

import 'package:fetch/src/models/response.model.dart';

class RequestHandler {
  final String url;
  final Object? body;
  final Map<String, String>? headers;

  RequestHandler(this.url, this.body, this.headers);

  Future<Response> get() async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    return Response.fromClient(
        response, await response.transform(Utf8Decoder()).join());
  }
}
