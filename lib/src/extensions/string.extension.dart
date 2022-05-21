import 'package:fetch/src/handlers/request.handler.dart';
import 'package:fetch/src/models/response.model.dart';

extension RequestParsing on String {
  Future<Response> get({Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, headers: headers).get();
  }

  Future<Response> post(Object body, {Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, body: body, headers: headers).post();
  }

  Future<Response> put(Object body, {Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, body: body, headers: headers).put();
  }

  Future<Response> delete({Object? body, Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, headers: headers, body: body).delete();
  }

  Future<Response> patch(Object body, {Map<String, dynamic>? headers}) async {
    return await RequestHandler(this, body: body, headers: headers).patch();
  }
}
