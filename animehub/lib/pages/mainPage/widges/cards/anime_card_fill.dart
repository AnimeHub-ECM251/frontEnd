import 'package:animehub/globals/url.dart';
import 'package:flutter/material.dart';
import 'package:animehub/pages/classes/controller.dart';
import 'package:animehub/pages/mainPage/widges/cards/anime_card_conteiner.dart';

class BodyCardFill extends StatefulWidget {
  final String animeID;
  const BodyCardFill({Key? key, required this.animeID}) : super(key: key);

  @override
  _BodyCardFillState createState() => _BodyCardFillState();
}

class _BodyCardFillState extends State<BodyCardFill> {
  Controller controller = Controller();
  String animeTitle = '';
  String animeImage = '';

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    var animeData = await controller.getData(url, 'anime/' + widget.animeID);
    if (animeData == null) {
      //if the request is empy, try one more time
      animeData = await controller.getData(url, 'anime/' + widget.animeID);
    }
    setState(() {
      if (animeData == null) {
        animeTitle = '-';
        animeImage = '-';
      } else {
        animeImage = animeData["image"];
        animeTitle = animeData["title"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimeCardConteiner(
              cardImage: animeImage,
              cardTitle: animeTitle,
              animeID: widget.animeID,
            ),
          ],
        ),
      ),
    );
  }
}
