import 'package:flutter/material.dart';
import 'package:animehub/pages/mainPage/widges/cards/anime_card_fill.dart';
import 'package:animehub/globals/styleColors.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage(
      currentPage: -1,
    );
  }
}

class HomePage extends StatelessWidget {
  final String logo =
      'https://cdn.discordapp.com/attachments/822141817520652299/907415173944463420/unknown.png';
  final int currentPage;
  const HomePage({Key? key, required this.currentPage}) : super(key: key);
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
              BodyCardFill(
                  nCards: 5, currentPage: (currentPage < 0) ? 0 : currentPage),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO: PAGES LOAD MORE DATA
//TODO: LOGIN PAGE
//TODO: LINKAMENTO PAG
//TODO: LINKAMENTO BACKEND
//TODO: RESPONSIVIDADE COM TAMANHO DA TELA