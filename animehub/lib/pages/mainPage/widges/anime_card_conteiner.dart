import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/pages/mainPage/widges/anime_card_title.dart';

class AnimeCardConteiner extends StatefulWidget {
  /*############################################################################
  #                       Class for make a any card                            #
  ############################################################################*/
  final String cardImage;
  final String cardTitle;

  const AnimeCardConteiner(
      {Key? key, required this.cardImage, required this.cardTitle})
      : super(key: key);

  @override
  State<AnimeCardConteiner> createState() =>
      // ignore: no_logic_in_create_state
      _AnimeCardState(cardImage, cardTitle);
}

class _AnimeCardState extends State<AnimeCardConteiner> {
  String cardImage;
  String cardTitle;

  _AnimeCardState(this.cardImage, this.cardTitle);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimeCardTitle(cardTitle: cardTitle),
        ),
        decoration: anime_card_image(),
        height: 450,
        width: 300,
        margin: const EdgeInsets.only(bottom: 16),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BoxDecoration anime_card_image() {
    // Function to define image and some styles for card
    return BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
            cardImage,
          ),
          fit: BoxFit.cover),
      boxShadow: const [
        BoxShadow(
          color: klightGrey,
          blurRadius: 3,
          spreadRadius: -4,
        ),
      ],
    );
  }
}
