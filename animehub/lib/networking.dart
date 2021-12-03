import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.urlBase);

  final String urlBase;

  /// Request to get data
  Future getData(String endpoint) async {
    http.Response response = await http.get(Uri.parse(urlBase + endpoint));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  /// Request to post data
  Future postData(String endpoint, var json) async {
    // print(json);
    final response = await http.post(Uri.parse(urlBase + endpoint), body: json);
    // ignore: unrelated_type_equality_checks
    if (response != 400) {
      print(response.statusCode);
      return response;
    } else {
      return null;
    }
  }
}
