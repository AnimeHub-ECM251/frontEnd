import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/pages/mainPage/widges/cards/anime_card_title.dart';

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
  State<AnimeCardConteiner> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<AnimeCardConteiner> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimeCardTitle(cardTitle: widget.cardTitle),
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
            widget.cardImage,
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
