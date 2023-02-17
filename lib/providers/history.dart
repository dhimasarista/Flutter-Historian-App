import 'package:flutter/foundation.dart';

class History with ChangeNotifier {
  int id;
  String image;
  String title;
  String involved;
  String location;
  String year;
  String description;
  bool bookmarked;

  History({
    required this.id,
    required this.image,
    required this.title,
    required this.year,
    required this.involved,
    required this.location,
    required this.description,
    this.bookmarked = false,
  });

  void updateBookmark() {
    bookmarked = !bookmarked;
    notifyListeners();
  }
}
