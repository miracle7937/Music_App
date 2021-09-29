import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  Future post({String uri}) async {
    try {
      var url = Uri.parse(uri);
      var response = await http.post(url, body: {});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw "Error occurred";
      }
    } catch (e) {
      print(e);
      throw "Error occurred";
    }
  }
}
