import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomHttpClient {
  //perform post requests
  Future<http.Response> post(String url, Map<String, Object> body) async {
    final header = <String, String>{
      'X-ListenAPI-Key': 'c4b1810a44a84f22935e1c3a66c2737d',
    };
    return http.post(url, headers: header, body: jsonEncode(body));
  }

//perforn get requests
  Future<http.Response> get({String url}) async {
    final header = <String, String>{
      'X-ListenAPI-Key': 'c4b1810a44a84f22935e1c3a66c2737d',
    };
    return http.get(url, headers: header);
  }

//perform edit
  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    final header = <String, String>{
      'X-ListenAPI-Key': 'c4b1810a44a84f22935e1c3a66c2737d',
    };
    return http.put(url, headers: header, body: jsonEncode(body));
  }

//perform delete
  Future<http.Response> delete(String url) async {
    return http.delete(url);
  }

//check if response is successful
  bool isSuccessful(http.Response r) =>
      r.statusCode >= 200 && r.statusCode < 400;
}
