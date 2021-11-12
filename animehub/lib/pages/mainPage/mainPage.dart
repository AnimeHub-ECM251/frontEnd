import 'package:animehub/globals/url.dart';
import 'package:animehub/pages/LoginPage/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:animehub/pages/mainPage/widges/cards/anime_card_fill.dart';
import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/pages/classes/controller.dart';
import 'package:animehub/pages/mainPage/widges/page_bar/page_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage(
      currentPage: 1,
    );
  }
}

class HomePage extends StatefulWidget {
  //var
  final int currentPage;

  //constructor
  const HomePage({Key? key, required this.currentPage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Vars to request and feed the page widget
  final String logo =
      'https://cdn.discordapp.com/attachments/822141817520652299/907415173944463420/unknown.png';
  var currentPageAux;
  var animeIDSArray = [];
  Controller controller = Controller();

  /*##########################################################################################
  #                                    Request Code                                          #
  ##########################################################################################*/
  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    var animesIDS = await controller.getData(
        url, 'todos-animes/id/' + widget.currentPage.toString());
    setState(() {
      if (animesIDS == null) {
        // return page 1 data
        animeIDSArray = [1, 2, 3, 4, 5];
        currentPageAux = animesIDS[4].toString();
      } else {
        // get page requested
        currentPageAux = animesIDS[4].toString();
        animeIDSArray = animesIDS;
      }
    });
  }

  /*##########################################################################################
  #                                    Widget Code                                           #
  ##########################################################################################*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkGrey,
      appBar: AppBar(
        backgroundColor: kblack,
        title: Center(
          child: TextButton(
            child: Image.network(
              logo,
              width: 120,
              height: 80,
            ),
            onPressed: () => {
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }),
                );
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Reder number of cards in request respons (1~5)
              for (int i = 0; i < animeIDSArray.length; i++)
                BodyCardFill(animeID: animeIDSArray[i].toString()),
              // After render the cards render the pags bar
              PageBarConteiner(
                currentPage: widget.currentPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: LOGIN PAGE
//TODO: RESPONSIVIDADE COM TAMANHO DA TELA