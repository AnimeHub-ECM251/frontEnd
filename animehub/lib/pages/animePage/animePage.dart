import 'dart:convert';

import 'package:animehub/globals/styleText.dart';
import 'package:animehub/mock/dataAnimePage.dart';
import 'package:animehub/pages/animePage/CommentPage.dart';
import 'package:animehub/pages/animePage/classes/controller.dart';
import 'package:animehub/pages/animePage/widgets/Comment.dart';
import 'package:animehub/pages/animePage/widgets/ButtonCard.dart';
import 'package:animehub/pages/animePage/widgets/CommentList.dart';
import 'package:animehub/pages/animePage/widgets/InfoCard.dart';
import 'package:animehub/pages/animePage/widgets/Information.dart';
import 'package:animehub/pages/animePage/widgets/Synopsis.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';

/// Template page for showing an Anime

class AnimePage extends StatefulWidget {
  const AnimePage({this.animeData});

  final animeData;

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  Controller controller = Controller();
  String title = '';
  String image = '';
  String studio = '';
  String synopsis = '';
  String launchDate = '';
  String webRating = '-1';
  String pubRating = '-1';
  String episodes = '-1';

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  bool verify(str) {
    if (str == '-1.0') {
      return true;
    } else {
      return false;
    }
  }

  void updateUI() async {
    var animeData = await controller
        .getData('https://animehubteste2.free.beeceptor.com/anime/1');
    // var commentData =
    // await controller.getData('http://localhost:8081/comentarios/2');
    setState(() {
      if (animeData == null) {
        title = '-';
        image = '-';
        studio = '-';
        synopsis = '-';
        launchDate = '-';
        webRating = '-1';
        pubRating = '-1';
        episodes = '0';
      }
      title = animeData['title'].toString();
      image = animeData['image'].toString();
      studio = animeData['studio'].toString();
      synopsis = animeData['synopsis'].toString();
      launchDate = animeData['launchDate'].toString();
      webRating = animeData['websiteRating'].toString();
      pubRating = animeData['publicRating'].toString();
      episodes = animeData['episodes'].toString();

      // comments = List.castFrom(commentData);
    });
  }

  // Map<String, dynamic> anime = jsonDecode(getAnime_);
  List<dynamic> comments = jsonDecode(getComments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kdarkGrey,
          title: Text(
            title,
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
                image,
                height: 500,
              ),
              // ButtonCard(text: "Add to favorites"),
              ButtonCard(text: "Add to watch list"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoCard(
                    label: "Public Rating",
                    info: verify(pubRating) ? '?' : pubRating,
                  ),
                  Padding(padding: const EdgeInsets.all(8.0)),
                  InfoCard(
                    label: "Web Rating",
                    info: verify(webRating) ? '?' : webRating,
                  ),
                ],
              ),

              Information(
                  studio: studio,
                  launchDate: launchDate,
                  episodes: episodes.toString()),

              /// Sinopse widget
              Synopsis(synopsis: synopsis),

              CommentList(
                comments: comments,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async{
                      var newComment = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CommentPage();
                          }),
                      );
                      print(newComment);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kdarkGrey)),
                    child: Text(
                      'Add comment',
                      textAlign: TextAlign.center,
                      style: kbuttonCardTextStyle,
                    )),
              )
            ],
          ),
        ),
    );
  }
}
