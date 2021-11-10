import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';

class AnimeCardTitle extends StatelessWidget {
  /*#########################################################
  #           Class for make the card Title                 #
  #########################################################*/
  final String cardTitle;

  const AnimeCardTitle({
    Key? key,
    required this.cardTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cardTitle,
            style: const TextStyle(
              color: korange,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.85),
      ),
    );
  }
}
