class ApiSettings {
  static String baseUrl = '';
  static String baseUnencodedPath = '';
  static Uri baseUri(String path, [Map<String, String?>? queryParameter]) =>
      Uri.https(baseUrl, baseUnencodedPath + path, queryParameter);

  static String token = '';
  static Map<String, String> get headers {
    return {
      'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer ' + token,
    };
  }

  static Map<String, String> get noAuthHeaders {
    return {'Content-type': 'application/json'};
  }
}
