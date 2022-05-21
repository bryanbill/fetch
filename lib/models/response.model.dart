class Response {
  final int? statusCode;
  final String? body;
  final String? contentType;
  final Map<String, String>? headers;
  final String? url;
  final int? contentLength;
  final int? redirectCount;
  final bool? persistentConnection;
  final bool? chunkedTransferEncoding;
  final bool? connectionClose;

  Response(
      {this.statusCode,
      this.body,
      this.contentType,
      this.headers,
      this.url,
      this.contentLength,
      this.redirectCount,
      this.persistentConnection,
      this.chunkedTransferEncoding,
      this.connectionClose});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      statusCode: json['statusCode'] as int,
      body: json['body'] as String,
      contentType: json['contentType'] as String,
      headers: json['headers'] as Map<String, String>,
      url: json['url'] as String,
      contentLength: json['contentLength'] as int,
      redirectCount: json['redirectCount'] as int,
      persistentConnection: json['persistentConnection'] as bool,
      chunkedTransferEncoding: json['chunkedTransferEncoding'] as bool,
      connectionClose: json['connectionClose'] as bool,
    );
  }
}
