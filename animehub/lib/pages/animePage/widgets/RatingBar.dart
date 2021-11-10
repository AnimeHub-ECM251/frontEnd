import 'package:animehub/globals/styleColors.dart';
import 'package:animehub/mock/dataAnimePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


/// Widget to rate anime. If user already voted it's locked in the rate given.
/// If there is no logged user can't vote
class RateBar extends StatefulWidget {
  const RateBar({required this.rating, required this.updateUI, required this.userId});
  final rating;
  final Function updateUI;
  final userId;

  @override
  State<RateBar> createState() => _RateBarState();
}

class _RateBarState extends State<RateBar> {
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
        //TODO change widget if voted or not
        child: RatingBar.builder(
          initialRating: (widget.rating != '-1.0') ? double.parse(widget.rating) : 0,
          minRating: 0,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          ignoreGestures: (widget.rating != '-1.0' || widget.userId == '-1.0'),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: (widget.rating != '-1.0') ? kwhite : korange,
          ),
          onRatingUpdate: (value) {
            //TODO post rating
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