import 'package:animehub/networking.dart';

class Controller {
  
 Future<dynamic> getData(url) async{
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    return data;

    
 } 

}