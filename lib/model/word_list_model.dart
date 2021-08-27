import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class WordListModel extends ChangeNotifier {
  final List<WordPair> wordPairs = [];

  int get totalCount => wordPairs.length;

  void add() {
    wordPairs.addAll(generateWordPairs().take(10));
    notifyListeners();
  }

  WordPair getByPosition(int i) {
    return wordPairs[i];
  }
}
