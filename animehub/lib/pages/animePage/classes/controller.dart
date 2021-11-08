import 'dart:convert';

import 'package:animehub/networking.dart';
import 'package:http/http.dart' as http;

class Controller {
  
 Future<dynamic> getData(url, endpoint) async{
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData(endpoint);
    return data;   
 } 
  //TODO: POST do comentário. Infos TUDO EM STRING: "text" , "idUser" , "idAnime"
  Future<dynamic> postComment(String url, String endpoint, String text, String idUser, String idAnime) async{
    var json = jsonEncode(<String, String>{
      'text': text,
      'idUser' : idUser,
      'idAnime' : idAnime}
    );
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = networkHelper.postData(endpoint, json);
    return response; 
  }
}