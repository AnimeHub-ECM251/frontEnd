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
  final int currentPage;
  const HomePage({Key? key, required this.currentPage}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String logo =
      'https://cdn.discordapp.com/attachments/822141817520652299/907415173944463420/unknown.png';
  var currentPageAux;
  var animeIDSArray = [];
  Controller controller = Controller();

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    var animesIDS = await controller.getData('http://cat-boxes.ddns.net:8081/',
        'todos-animes/id/' + widget.currentPage.toString());
    setState(() {
      if (animesIDS == null) {
        animeIDSArray = [1, 2, 3, 4, 5];
        currentPageAux = animesIDS[4].toString();
      } else {
        currentPageAux = animesIDS[4].toString();
        animeIDSArray = animesIDS;
      }
    });
  }

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
              // redirect func to main page
            },
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < animeIDSArray.length; i++)
                BodyCardFill(animeID: animeIDSArray[i].toString()),
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
//TODO: LINKAMENTO PAG
//TODO: RESPONSIVIDADE COM TAMANHO DA TELA