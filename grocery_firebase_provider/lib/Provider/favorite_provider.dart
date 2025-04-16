import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  bool isFavorite(Map<String, dynamic> item) {
    return _favorites.any((element) => element['name'] == item['name']);
  }

  void toggleFavorite(Map<String, dynamic> item) {
    if (isFavorite(item)) {
      _favorites.removeWhere((element) => element['name'] == item['name']);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  void removeFavorite(Map<String, dynamic> item) {
    _favorites.removeWhere((element) => element['name'] == item['name']);
    notifyListeners();
  }
}
