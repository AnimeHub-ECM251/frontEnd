import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/globals/url.dart';
import 'package:animehub/mock/dataAnimePage.dart';
import 'package:animehub/pages/classes/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


/// Widget to rate anime. If user already voted it's locked in the rate given.
/// If there is no logged user can't vote
class RateBar extends StatefulWidget {
  const RateBar({required this.rated, required this.rating, required this.updateUI, required this.userId, required this.animeId});
  final rating;
  final Function updateUI;
  final userId;
  final animeId;
  final rated;

  @override
  State<RateBar> createState() => _RateBarState();
}

class _RateBarState extends State<RateBar> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: klightGrey,
              blurRadius: 3,
              spreadRadius: -4,
            ),
          ],
          color: kdarkGrey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: RatingBar.builder(
          initialRating: widget.rated=='true' ? double.parse(widget.rating) : 0,
          minRating: 0,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          ignoreGestures: (widget.rated=='true' || widget.userId == '-1.0'),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: widget.rated=='true' ? kwhite : korange,
          ),
          onRatingUpdate: (value) async{
            await controller.postUserRating(url, 'user-rating', widget.userId, widget.animeId, value.toString());
            rating_ = value.toString();
            print(rating_);
            setState(() {
              widget.updateUI();
            });
          },
        ),
      ),
    );
  }
}