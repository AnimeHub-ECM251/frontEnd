import 'package:animehub/pages/classes/controller.dart';
import 'package:animehub/pages/mainPage/widges/cards/anime_card_fill.dart';
import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/variables.dart';
import 'package:animehub/pages/mainPage/mainPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var animeIDSArray = [];
  Controller controller = Controller();

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    var animesIDS = await controller.getData(url, 'watchlist/user/' + userID);

    setState(
      () {
        if (animesIDS == null) {
          // return page 1 data
          animeIDSArray = [1, 2, 3, 4, 5];
        } else {
          // get page requested
          animeIDSArray = animesIDS;
          print(animesIDS);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // semi mock

    return Scaffold(
      /*##########################################################
      #                        AppBar                            #
      ##########################################################*/
      backgroundColor: kdarkGrey,
      appBar: AppBar(
        backgroundColor: kblack,
        // Home Page btn
        title: Center(
          child: TextButton(
            child: Image.network(
              logo,
              width: 120,
              height: 80,
            ),
            onPressed: () => {
              // Return to main page and clear Nav stack
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(currentPage: 1),
                ),
                (route) => false,
              ),
            },
          ),
        ),
        // Rigth btn (here is for logout)
        actions: [
          IconButton(
            onPressed: () {
              userID = '-1';
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(currentPage: 1),
                ),
                (route) => false,
              );
            },
            icon: Icon(
              Icons.logout_rounded,
            ),
          )
        ],
      ),
      /*##########################################################
      #                          Body                            #
      ##########################################################*/
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [],
          ),
          // fav list feeding
          Container(
            child: Text(
              'Animes para assistir:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: korange,
                fontSize: 32,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kblack,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: -5,
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < animeIDSArray.length; i++)
                        BodyCardFill(animeID: animeIDSArray[i].toString()),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
