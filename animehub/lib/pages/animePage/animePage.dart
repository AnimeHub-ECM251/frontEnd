import 'package:animehub/widgets/ButtonCard.dart';
import 'package:animehub/widgets/InfoCard.dart';
import 'package:flutter/material.dart';
import 'package:animehub/consts.dart';

/// Template page for showing an Anime

class AnimePage extends StatelessWidget {
  const AnimePage({Key? key}) : super(key: key);

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
              Image.network(
                "https://www.animesgratisbr.biz/wp-content/uploads/2021/03/bokunohero5.jpg",
                height: 500,
              ),
              ButtonCard(text: "Add to favorites"),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sinopse",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: korange, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text("Esse anime é um bait do Boku no Hero!",
                        style: TextStyle(fontWeight: FontWeight.w500, color: kwhite),)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: kdarkGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
