import 'package:flutter/cupertino.dart';

class Recipe {
  const Recipe({
    @required this.image,
    @required this.name,
    @required this.description,
  });

  final String image;
  final String name;
  final String description;
}
