import 'package:animehub/widgets/ButtonCard.dart';
import 'package:animehub/widgets/Comment.dart';
import 'package:animehub/widgets/InfoCard.dart';
import 'package:animehub/widgets/Sinopse.dart';
import 'package:flutter/material.dart';
import 'package:animehub/consts.dart';

/// Template page for showing an Anime

class AnimePage extends StatelessWidget {
  const AnimePage({Key? key}) : super(key: key);

  /// Request aqui e separar dados.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: kblack),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kdarkGrey,
          title: Text(
            "Boku no Pico",
            style: kappBarTextStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Cartaz do Anime
              Image.network(
                "https://www.animesgratisbr.biz/wp-content/uploads/2021/03/bokunohero5.jpg",
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

              /// Sinopse widget
              Synopsis(synopsis: "Aqui vai ter a parte de sinopse do recurso."),
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
                        Comment(user: 'user', comment: 'Aquele random q n manja de nada'),
                        Comment(user: 'IGN', comment: 'Isso ai é bait!'),
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
