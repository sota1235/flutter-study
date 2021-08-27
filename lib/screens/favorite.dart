import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sota1235_todo_app/model/favorite_model.dart';

class Favorite extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final words = context.select<FavoriteModel, List<String>>(
        (favorite) => favorite.wordPairs.map((e) => e.asPascalCase).toList(),
    );
    final tiles = words.map(
          (String pair) {
        return ListTile(
          title: Text(
            pair,
            style: _biggerFont,
          ),
        );
      },
    );
    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(tiles: tiles, context: context).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
      bottomNavigationBar: BottomAppBar(
        child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.primary),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    final favorite = context.read<FavoriteModel>();
                    favorite.removeAll();
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            )
        ),
      ),
    );
  }
}
