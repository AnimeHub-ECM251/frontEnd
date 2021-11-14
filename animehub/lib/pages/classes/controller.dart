import 'dart:convert';
import 'package:animehub/networking.dart';

/// Class to make specifics requests.
class Controller {
  /// Method to get data from an endpoint
  Future<dynamic> getData(url, endpoint) async {
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData(endpoint);
    return data;
  }

  /// Method to post comment about anime
  Future<dynamic> postComment(String url, String endpoint, String text,
      String idUser, String idAnime) async {
    var json = jsonEncode(
        <String, String>{'text': text, 'idUser': idUser, 'idAnime': idAnime});
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = networkHelper.postData(endpoint, json);
    return response;
  }

  /// Method to register new user
  Future<dynamic> postRegister(String url, String endpoint, String user,
      String password, String email) async {
    var json = jsonEncode(
        <String, String>{'text': user, 'password': password, 'email': email});
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = networkHelper.postData(endpoint, json);
    return response;
  }

  /// Method to register new user
  Future<dynamic> postLogin(
      String url, String endpoint, String user, String password) async {
    var json = jsonEncode(<String, String>{'text': user, 'password': password});
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = networkHelper.postData(endpoint, json);
    return response;
  }

  /// Method to add or remove from watchlist
  Future<dynamic> postAddRmWatchlist(
      String url, String endpoint, String idUser, String idAnime) async {
    var json =
        jsonEncode(<String, String>{'idUser': idUser, 'idAnime': idAnime});
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = networkHelper.postData(endpoint, json);
    return response;
  }

  Future<dynamic> postUserRating(String url, String endpoint, String idUser,
      String idAnime, String rating) {
    var json = jsonEncode(<String, String>{
      'idUser': idUser,
      'idAnime': idAnime,
      'rating': rating
    });
    NetworkHelper networkHelper = NetworkHelper(url);
    var response = networkHelper.postData(endpoint, json);
    return response;
  }
}
