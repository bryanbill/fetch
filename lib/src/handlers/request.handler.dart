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

  Future<Response> post() async {
    var request = await HttpClient().postUrl(Uri.parse(url));
    if (body != null) {
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
    }
    if (headers != null) {
      headers!.forEach((key, value) {
        request.headers.set(key, value);
      });
    }
    var response = await request.close();
    return Response.fromClient(
        response, await response.transform(Utf8Decoder()).join());
  }
}
