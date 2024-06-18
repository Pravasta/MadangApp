class UriHelper {
  static createUrl({
    required String host,
    String? path,
    Map<String, dynamic>? querryParameters,
  }) {
    return Uri(
      scheme: 'https',
      host: host,
      path: path,
      queryParameters: querryParameters,
    );
  }
}
