import 'package:demo_app/src/recipe_app/constants/constants.dart';
import 'package:flutter/material.dart';

Widget tabsWidget() {
  return Container(
    height: 35,
    child: Row(
      children: [
        Expanded(
          child: Opacity(
            opacity: 1.0,
            child: Card(
              elevation: 8,
              color: Colors.deepOrange[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    tabs[0],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Opacity(
            opacity: 0.5,
            child: Card(
              elevation: 0,
              //color: Colors.deepOrange[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  tabs[1],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
