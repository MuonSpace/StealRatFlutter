import 'dart:math';

import 'package:become_a_steel_rat/StringStructure.dart';
import 'package:flutter/foundation.dart';
import 'treePage.dart';
import 'firstPage.dart';
import 'package:flutter/material.dart';
import 'textStory.dart';
import 'StringStructure.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(BecomeASteelRat());
}

addIntToSF(int se) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('intValue', se);
}

getIntValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return int
  int intValue = prefs.getInt('intValue');
  return intValue;
}

TextGame textGame = TextGame(2);

class BecomeASteelRat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FirstPage(),
        ),
      ),
    );
  }
}

class FirstGame extends StatefulWidget {
  @override
  _FirstGameState createState() => _FirstGameState();
}

class _FirstGameState extends State<FirstGame> {
  List<Widget> textChapter() {
    String str = textGame.getChapterString(); //получаем в строку текс главы
    //разбиваем строку в местах перехода на выбранную главу
    //и получаем инт номер для создания кнопки
    List<StringStructure> moreStr = replaceStr(str);
    int b;
    String a;
    List<Widget> widgets = [];
    //циклом проходим по списку, выводим на экран текст и создаем кнопки
    for (int i = 0; i < moreStr.length; i++) {
      a = moreStr[i].getText();
      widgets.add(
        Text(
          '$a ',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 18.0,
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ); //Печатаем текст
      if (i == moreStr.length - 1) {
        break;
      }
      b = moreStr[i].getNumberChapter();
      print(b);
      widgets.add(
        FlatButton(
          //создаем кнопку
          onPressed: () {
            setState(() {
              int step = moreStr[i].getNumberChapter();
              if (b == step)
                neextChapter(b - 1);
              else
                neextChapter(step - 1);
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstGame()),
                      );
            });
          },
          child: Text('$b '),
          color: Colors.grey[400],
        ),
      );
    }
    return widgets;
  }

  void neextChapter(int se) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (textGame.getChapterInt() == 3) {
      textGame.nextChapter(prefs.getInt('intValue'));
    } else {
      textGame.nextChapter(se); //передача номера новой главы
      addIntToSF(se);
      await prefs.setInt('intValue', se);
    }
  }
  String moneta(){
    var rng = Random();
    String returned;
    if(rng.nextBool()==true)return  returned = 'Решка';
    else return returned = 'Орёл';
  }

  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Двусторонний Определитель Случайных Процессов'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(moneta()),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Продолжить'),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstGame()),
                      );
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('Стань Стальной Крысой!', 
                style: TextStyle(
                  fontSize: 20.0),),
              ),
              ListTile(
                title: Text('Начать с начала'),
                onTap: () {
                  setState(() {
                    neextChapter(350);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstGame()),
                    );
                  });
                },
              ),
              Divider(),
              ListTile(
                title: Text('В меню'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text('ДОСП'),
                onTap: () {
                  setState(() {
                    _showMyDialog();
                  });
                },
              ),
              Divider(),
              ListTile(
                title: Text('О книге'),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TreePage()),
                    );
                  });
                },
              ),
              Divider(),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(8.0),
                    children: textChapter(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


