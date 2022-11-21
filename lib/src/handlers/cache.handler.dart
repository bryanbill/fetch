import 'dart:async';
import 'dart:isolate';

import 'package:fetchx/fetchx.dart';
import 'package:fetchx/src/models/request.model.dart';
import 'package:hive/hive.dart';

class CacheHandler {
  final String url;
  final Object? body;
  final String? path;
  final Map<String, dynamic>? headers;
  final bool isMultipart;

  late Box box;
  late StreamSubscription _subscription;

  StreamSubscription get cacheStream => _subscription;

  CacheHandler(this.url,
      {this.body,
      this.headers,
      this.isMultipart = false,
      this.path = "fetchx_cache"}) {
    if (path == null) {
      throw ArgumentError.notNull("path");
    }
    Hive.init(path);

    Hive.openBox('cache').then((value) {
      box = value;
    });
  }

  bool get isCacheable => body != null && !isMultipart;

  Future<Response> cache() {
    if (isCacheable) {
      ReceivePort receivePort = ReceivePort();
      Isolate.spawn(_saveToCache, [receivePort.sendPort]);
      _subscription = receivePort.listen((message) {});
    }
    return Future.value(Response(
      body: body.toString(),
      headers: null,
      statusCode: 200,
      request: Request(
        url: url,
        body: body,
        headers: headers,
        isMultipart: isMultipart,
      ),
    ));
  }

  void _saveToCache(List data) async{
    await box.put(url, body);
    SendPort sendPort = data[0];
    sendPort.send(body);
  }
}
