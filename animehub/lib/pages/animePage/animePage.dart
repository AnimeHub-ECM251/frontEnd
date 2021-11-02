import 'package:flutter/material.dart';

class AnimePage extends StatelessWidget {
  const AnimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Boku no Pico"),
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Add to favorites",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Add to my list",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          "Rating: 4.6",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    height: 50,
                    width: 200,
                  ),
                  Padding(padding: const EdgeInsets.all(8.0)),
                  SizedBox(
                    child: Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          "Popularity: 9",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    height: 50,
                    width: 200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
