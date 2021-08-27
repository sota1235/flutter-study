import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sota1235_todo_app/model/favorite_model.dart';
import 'package:sota1235_todo_app/model/word_list_model.dart';
import 'package:sota1235_todo_app/screens/favorite.dart';
import 'package:sota1235_todo_app/screens/word_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => WordListModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: WordList(),
        routes: {
          '/favorite': (context) => Favorite(),
        },
      ),
    );
  }
}
