import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<HttpHelperResponse> get(String endPoint) async {
    print(endPoint);
    try {
      http.Response res = await http.get(Uri.parse(endPoint));

      print(res.body);
      return HttpHelperResponse(res.statusCode, jsonDecode(res.body));
    } catch (e) {
      print("error: $e");
      return HttpHelperResponse(400, null);
    }
  }
}

class HttpHelperResponse {
  int? statusCode;
  dynamic response;

  HttpHelperResponse(
    this.statusCode,
    this.response,
  );
}
