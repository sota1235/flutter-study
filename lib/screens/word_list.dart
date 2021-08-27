import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18);

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
  Widget build(BuildContext context) {
    final _suggestions = [WordPair.random()];

    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }

          final int index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _Row();
        });
  }
}

class _Row extends StatelessWidget {
  Widget build(BuildContext context) {
    final word = 'word';
    final alreadySaved = true;

    return ListTile(
      title: Text(
        word,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        print('TODO');
      },
    );
  }
}
