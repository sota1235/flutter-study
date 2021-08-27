import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sota1235_todo_app/model/favorite_model.dart';
import 'package:sota1235_todo_app/model/word_list_model.dart';

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [IconButton(
            onPressed: () => Navigator.pushNamed(context, '/favorite'),
            icon: Icon(Icons.list))
        ],
      ),
      body: _Suggestions(),
    );
  }
}

class _Suggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final suggestions = context.select<WordListModel, List<String>>(
        (wordList) => wordList.wordPairs.map((e) => e.asPascalCase).toList(),
    );

    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }

          final int index = i ~/ 2;

          if (index >= suggestions.length) {
            final wordList = context.read<WordListModel>();
            wordList.add();
          }

          return _Row(index);
        });
  }
}

class _Row extends StatelessWidget {
  final int _index;

  _Row(this._index);

  Widget build(BuildContext context) {
    final wordPair = context.select<WordListModel, WordPair>(
        (wordList) => wordList.getByPosition(_index),
    );
    final alreadySaved = context.select<FavoriteModel, bool>(
        (favorite) => favorite.wordPairs.contains(wordPair),
    );

    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        final favorite = context.read<FavoriteModel>();
        if (alreadySaved) {
          favorite.remove(wordPair);
        } else {
          favorite.add(wordPair);
        }
      },
    );
  }
}
