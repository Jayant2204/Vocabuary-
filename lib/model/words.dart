import 'package:flutter/foundation.dart';

enum Category { all, gre, toefl, others, }

class Words {
  const Words({
    @required this.category,
    @required this.id,
    @required this.isFeatured,
    @required this.name,
    @required this.meaning,
  })  : assert(category != null),
        assert(id != null),
        assert(isFeatured != null),
        assert(name != null),
        assert(meaning != null);

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final String meaning;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'words_images';

  @override
  String toString() => "$name (id=$id)";
}