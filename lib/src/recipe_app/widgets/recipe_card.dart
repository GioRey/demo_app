import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final size;
  final String name;
  final String image;
  //final String description;

  const RecipeCard({
    Key key,
    @required this.size,
    @required this.name,
    @required this.image,
    //@required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //color: Colors.black26,
        border: Border.all(
          width: 1,
          color: Colors.deepOrange[400],
        ),
      ),
      width: size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
