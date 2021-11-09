import 'package:flutter/material.dart';
import 'package:animehub/pages/mainPage/widges/anime_card_fill.dart';
import 'package:animehub/globals/styleColors.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String logo =
      'https://cdn.discordapp.com/attachments/822141817520652299/907415173944463420/unknown.png';
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
              //TODO redirect func
            },
          ),
        ),
      ),
      body: const BodyCardFill(nCards: 10),
    );
  }
}

//TODO: MAINPAGE -> PAGES FILTER
//TODO: LOGIN PAGE
//TODO: LINKAMENTO PAG
//TODO: LINKAMENTO BACKEND
//TODO: RESPONSIVIDADE COM TAMANHO DA TELA
