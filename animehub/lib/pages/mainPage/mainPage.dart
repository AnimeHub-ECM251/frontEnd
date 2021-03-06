import 'package:animehub/globals/variables.dart';
import 'package:animehub/pages/LoginPage/LoginPage.dart';
import 'package:animehub/pages/userPage/UserPage.dart';
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
    if (animesIDS == null) {
      //try one time
      animesIDS = await controller.getData(
          url, 'todos-animes/id/' + widget.currentPage.toString());
    }
    if (animesIDS == null) {
      //try last time
      animesIDS = await controller.getData(
          url, 'todos-animes/id/' + widget.currentPage.toString());
    }
    setState(() {
      if (animesIDS == null) {
        // return page 1 data
        animeIDSArray = [1, 2, 3, 4, 5];
        currentPageAux = animesIDS[4].toString();
      } else {
        // get page requested
        currentPageAux = animesIDS[animesIDS.length - 1].toString();
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
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return (int.parse(userID) != -1)
                              ? UserPage()
                              : LoginPage();
                        },
                      ),
                    ),
                  },
              icon: Icon(Icons.account_circle))
        ],
      ),
      /*##########################################################################################
      #                                      Menu Code                                           #
      ##########################################################################################*/
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: FittedBox(
                  child: Image.network(
                    logoMenu,
                  ),
                  fit: BoxFit.contain,
                )),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 40,
              ),
              title: Text('Minha conta'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return (int.parse(userID) != -1)
                          ? UserPage()
                          : LoginPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
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