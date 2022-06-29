class Request {
  final Map<String, dynamic>? headers;
  final bool isMultipart;
  final String? url;
  final Map<String, dynamic>? body;
  final String method;

  Request({
    this.url,
    this.body,
    this.headers,
    this.isMultipart = false,
    this.method = 'GET',
  });
}
