import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:animehub/pages/mainPage/widges/page_bar/page_bar.dart';
import 'package:animehub/pages/mainPage/widges/cards/anime_card_conteiner.dart';

class BodyCardFill extends StatelessWidget {
  /*############################################################################
  #                      Class to render animes Cards with loop                #
  ############################################################################*/
  final int nCards;
  final int currentPage;
  const BodyCardFill(
      {Key? key, required this.nCards, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //###############################################################   MOCK BEGUIN  ################################################################################
    var jsonData =
        '{"0":["https://cdn.myanimelist.net/images/anime/1081/111338l.jpg","Fruits Basket: The Final"],"1":["https://cdn.myanimelist.net/images/anime/5/87048l.jpg","Kimi no Na wa."],"2":["https://cdn.myanimelist.net/images/anime/1299/110774.jpg","Clannad: After Story"],"3":["https://cdn.myanimelist.net/images/anime/3/52133.jpg","Monogatari Series: Second Season"],"4":["https://cdn.myanimelist.net/images/anime/1807/102419.jpg","Rurouni Kenshin: Meiji Kenkaku Romantan - Tsuioku-hen"],"5":["https://cdn.myanimelist.net/images/anime/3/67177.jpg","Shigatsu wa Kimi no Uso"],"6":["https://cdn.myanimelist.net/images/anime/5/75810.jpg","Howl no Ugoku Shiro"],"7":["https://cdn.myanimelist.net/images/anime/1764/106659.jpg","Kaguya-sama wa Kokurasetai?"],"8":["https://cdn.myanimelist.net/images/anime/1613/102179.jpg","Seishun Buta Yarou wa Yumemiru Shoujo no Yume wo Minai"],"9":["https://cdn.myanimelist.net/images/anime/1248/112352.jpg","Suzumiya Haruhi no Shoushitsu"],}';
    var parsedJson = json.decode(jsonData);
    //###############################################################     MOCK END   #################################################################################

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < nCards; i++)
              AnimeCardConteiner(
                cardImage: parsedJson[i.toString()][0], //mock
                cardTitle: parsedJson[i.toString()][1], //mock
              ),
            PageBarConteiner(
              currentPage: currentPage,
            ),
          ],
        ),
      ),
    );
  }
}
