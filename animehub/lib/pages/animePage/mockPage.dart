import 'package:animehub/pages/animePage/animePage.dart';
import 'package:animehub/pages/animePage/classes/anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    print("this line of code is triggered");
  }

  void getLocationData() async {
    var weatherData = await AnimeModel().getAnimeData('url');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AnimePage(
        animeData: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}