import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class FavoriteModel extends ChangeNotifier{
  final List<WordPair> wordPairs = [];

  int get totalCount => wordPairs.length;

  void add(WordPair wordPair) {
    wordPairs.add(wordPair);
    notifyListeners();
  }

  void remove(WordPair wordPair) {
    wordPairs.remove(wordPair);
    notifyListeners();
  }

  void removeAll() {
    wordPairs.clear();
    notifyListeners();
  }
}
