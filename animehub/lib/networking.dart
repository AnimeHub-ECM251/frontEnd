import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.urlBase);

  final String urlBase;

  /// Request to get data
  Future getData(String endpoint) async{
    http.Response response = await http.get(Uri.parse(urlBase+endpoint));
    
    if (response.statusCode == 200){
      String data = response.body;

      return jsonDecode(data);

    } else{
      print(response.statusCode);
    }
  }

  /// Request to post data
  Future postData(String endpoint, var json) async{
    // print(json);
    final response = await http.post(Uri.parse(urlBase+endpoint),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
    },
    body: json);
    if (response != 400){
      print(response.statusCode);
      return response;
    }
    else{
      return null;
    }
  }
}