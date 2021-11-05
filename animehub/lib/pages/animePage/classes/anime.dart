import 'package:animehub/networking.dart';

class Anime {
  
 Future<dynamic> getAnimeData(url) async{
    NetworkHelper networkHelper = NetworkHelper(url);
    var animeData = await networkHelper.getData();
    return animeData;
  
 } 

}