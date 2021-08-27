
import 'package:english_words/english_words.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sota1235_todo_app/model/favorite_model.dart';

void main() {
  test('add word', () {
    final favorite = FavoriteModel();
    favorite.addListener(() {
      expect(favorite.totalCount, 1);
    });
    favorite.add(WordPair.random());
  });
}
