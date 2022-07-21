import 'package:flutter/material.dart';

class ArticlePageProvider with ChangeNotifier {
  int _currentIndex = 5;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
