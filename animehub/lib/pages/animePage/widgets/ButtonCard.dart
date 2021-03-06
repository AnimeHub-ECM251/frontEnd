import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/styleText.dart';
import 'package:animehub/globals/variables.dart';
import 'package:animehub/pages/classes/controller.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatefulWidget {
  /// Widget to do card buttons to add or remove to watchlist
  /// Verification must be the boolean from is added endpoint
  ButtonCard(
      {required this.verifyInList,
      required this.userId,
      required this.updateUI,
      required this.animeId});
  final verifyInList;
  final userId;
  final animeId;
  final Function updateUI;

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Controller();
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kdarkGrey)),
        onPressed: () async {
          if (widget.userId != '-1.0') {
            await controller.postAddRmWatchlist(url,
                'anime-watchlist', widget.userId, widget.animeId);
            setState(() {
              widget.updateUI();
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.verifyInList ? "Remove from watchlist" : "Add to watchlist",
            textAlign: TextAlign.center,
            style: kbuttonCardTextStyle,
          ),
        ),
      ),
    );
  }
}
