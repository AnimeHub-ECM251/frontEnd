import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.urlBase);

  final String urlBase;

  Future getData(String endpoint) async{
    http.Response response = await http.get(Uri.parse(urlBase+endpoint));
    
    if (response.statusCode == 200){
      String data = response.body;

      return jsonDecode(data);

    } else{
      print(response.statusCode);
    }
  }

  Future postData(String endpoint, var json) async{
    print(json);
    final response = await http.post(Uri.parse(urlBase+endpoint),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin' : '*'
    },
    body: json);
    if (response == 201){
      return response;
    }
    else{
      print(response);
      return null;
    }
  }

  

  

}