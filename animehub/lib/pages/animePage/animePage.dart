import 'package:animehub/globals/styleText.dart';
import 'package:animehub/mock/dataAnimePage.dart';
import 'package:animehub/pages/commentPage/CommentPage.dart';
import 'package:animehub/pages/classes/controller.dart';
import 'package:animehub/pages/animePage/widgets/ButtonCard.dart';
import 'package:animehub/pages/animePage/widgets/CommentList.dart';
import 'package:animehub/pages/animePage/widgets/InfoCard.dart';
import 'package:animehub/pages/animePage/widgets/Information.dart';
import 'package:animehub/pages/animePage/widgets/RatingBar.dart';
import 'package:animehub/pages/animePage/widgets/Synopsis.dart';
import 'package:flutter/material.dart';
import 'package:animehub/globals/styleColors.dart';

/// Template page for showing an Anime

class AnimePage extends StatefulWidget {
  const AnimePage({this.animeData, required this.animeID});
  final animeData;
  final animeID;
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
  String genre = '';
  String userID = '1';
  var comments;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  /// Update the user inteface with refreshed data
  void updateUI() async {
    var animeData = await controller.getData(
        'http://localhost:8081/', 'anime/' + widget.animeID);
    var commentData = await controller.getData(
        'http://localhost:8081/', 'comentarios/' + widget.animeID);
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
        genre = '-';
      }
      title = animeData['title'].toString();
      image = animeData['image'].toString();
      studio = animeData['studio'].toString();
      synopsis = animeData['synopsis'].toString();
      launchDate = animeData['launchDate'].toString();
      webRating = animeData['websiteRating'].toString();
      pubRating = animeData['publicRating'].toString();
      episodes = animeData['episodes'].toString();
      comments = commentData;
    });
  }

  // Map<String, dynamic> anime = jsonDecode(getAnime_);
  // List<dynamic> comments = jsonDecode(getComments);

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

            /// Buttons to add to list
            // ButtonCard(text: "Add to favorites"),
            ButtonCard(
              text: "Add to watch list",
              verifyInList: true,
              userId: '-1.0',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoCard(
                  label: "Public Rating",
                  info: (pubRating == '-1.0') ? '?' : pubRating,
                ),
                Padding(padding: const EdgeInsets.all(8.0)),
                InfoCard(
                  label: "Web Rating",
                  info: (webRating == '-1.0') ? '?' : webRating,
                ),
              ],
            ),
            RateBar(
              rating: rating_,
              updateUI: updateUI,
              userId: '-1.0',
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
                onPressed: () async {
                  var text = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CommentPage();
                    }),
                  );
                  controller.postComment('http://localhost:8081/',
                      'criar-comentario', text, "1", "1");
                  setState(() {
                    updateUI();
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kdarkGrey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add comment',
                    textAlign: TextAlign.center,
                    style: kbuttonCardTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
