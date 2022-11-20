class Request {
  final Map<String, dynamic>? headers;
  final bool isMultipart;
  final String? url;
  final dynamic body;
  final String method;

  Request({
    this.url,
    this.body,
    this.headers,
    this.isMultipart = false,
    this.method = 'GET',
  });

  @override
  String toString() {
    return 'Request{headers: $headers, isMultipart: $isMultipart, url: $url, body: $body, method: $method}';
  }
}
