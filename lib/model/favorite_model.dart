import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class FavoriteModel extends ChangeNotifier{
  final List<String> words = [];

  int get totalCount => words.length;

  void add(WordPair wordPair) {
    words.add(wordPair.asPascalCase);
    notifyListeners();
  }

  void remove(WordPair wordPair) {
    words.remove(wordPair.asPascalCase);
    notifyListeners();
  }

  void removeAll() {
    words.clear();
    notifyListeners();
  }
}
