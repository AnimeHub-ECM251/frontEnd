import 'dart:convert';

import 'package:animehub/globals/styleText.dart';
import 'package:animehub/mock/dataAnimePage.dart';
import 'package:animehub/pages/animePage/classes/anime.dart';
import 'package:animehub/pages/animePage/widgets/Comment.dart';
import 'package:animehub/pages/animePage/widgets/ButtonCard.dart';
import 'package:animehub/pages/animePage/widgets/InfoCard.dart';
import 'package:animehub/pages/animePage/widgets/Information.dart';
import 'package:animehub/pages/animePage/widgets/Synopsis.dart';
import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';

/// Template page for showing an Anime

class AnimePage extends StatelessWidget {
  const AnimePage({Key? key}) : super(key: key);

  /// Request aqui e separar dados.

  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> anime = jsonDecode(getAnime_);
    List<dynamic> comments = jsonDecode(getComments);

    dynamic getAnime(url) async{
      Anime aux_anime =  Anime();
      final anime = await aux_anime.getAnimeData(url);
      return anime;
    }
    
    final anime_ =  getAnime("");

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: kblack),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kdarkGrey,
          title: Text(
            anime['title'],
            style: kappBarTextStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// Cartaz do Anime
              Image.network(
                "https://http2.mlstatic.com/D_NQ_NP_753531-MLB25585825705_052017-O.jpg",
                height: 500,
              ),
              // ButtonCard(text: "Add to favorites"),
              ButtonCard(text: "Add to watch list"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoCard(
                    label: "Rating",
                    info: "4.6",
                  ),
                  Padding(padding: const EdgeInsets.all(8.0)),
                  InfoCard(
                    label: "Popularity",
                    info: "9",
                  ),
                ],
              ),

              Information(studio: anime['studio'], launchDate: anime['launchDate'], episodes: anime['episodes']),

              /// Sinopse widget
              Synopsis(synopsis: anime['synopsis']),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: klightGrey),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4,4,4,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [ 
                        for (var item in comments) Comment(user: item['idUser'].toString(), comment: item['text'])
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
