import 'package:flutter/material.dart';
import 'firstPage.dart';

class TreePage extends StatelessWidget {
  List<Widget> kek() {
    List<Widget> a = [];
    return a = [
      Text(
        '''Последнее  произведение  Гарри   Гаррисона   из   его ''' 
        '''знаменитой серии о Крысе из Нержавеющей стали представляет ''' 
        '''собой  роман-игру  -  жанр,  популярный  на   Западе,   но ''' 
        '''неизвестный  отечественному  читателю.  Поэтому  несколько ''' 
        '''предварительных замечаний: ''' 

            '''\n  - следуйте советам вашего инструктора; ''' 
            '''\n  - попав в лабиринт, непременно запаситесь  бумагой и карандашом, иначе вам из него не выбраться; '''  
            '''\n  Желаем удачи! Помните: только от вас зависит спасение Вселенной! '''
         
        '''\n\n P.S. Мое первое приложение написаное при помощи Flutter. '''
        '''Задача стояла не особо сложная, но с трудностями ''' 
        '''конечно сталкивался. Выбрал эту книгу, т.к/ нравятся произведения '''
        '''Гарри Гаррисона, чего только стоит "Неукротимая планета" и конечно '''
        '''же вся серия Стальной Крысы.'''
        '''\n\nПредложения по улучшению можно скинуть мне на почту steammoisuk@gmail.com либо же пишите в комментах. '''
            '''\n\nПриятного Вам приключения! ''',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 18.0,
          color: Colors.black,
          height: 1.5,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: ListView(
                    padding: EdgeInsets.all(8.0),
                    children: kek(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                      child: Text(
                        'В меню',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.grey[400],
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstPage()),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
