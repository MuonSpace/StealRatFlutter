import 'package:become_a_steel_rat/treePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  void neextChapter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    textGame.nextChapter(prefs.getInt('intValue'));
  }

  void startChapter(int a) async {
    textGame.nextChapter(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/LassRollen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              //Container(
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                  child: Text(
                    'Стань Стальной Крысой!',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 35.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            FlatButton(
                                child: Text(
                                  'Начать с начала',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                color: Colors.grey[300],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FirstGame()),
                                  );
                                  startChapter(350);
                                }),
                            FlatButton(
                                child: Text(
                                  'Продолжить',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                color: Colors.grey[300],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FirstGame()),
                                  );
                                  neextChapter();
                                }),
                            FlatButton(
                                child: Text(
                                  'О книге',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                color: Colors.grey[300],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TreePage()),
                                  );
                                  neextChapter();
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
