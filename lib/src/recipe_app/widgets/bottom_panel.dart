import 'package:demo_app/src/recipe_app/model/recipe.dart';
import 'package:flutter/material.dart';

void bottomPanel(
    {@required Recipe recipe,
    @required BuildContext context,
    @required Size size,
    @required AnimationController animationController}) {
  showBottomSheet(
    context: context,
    transitionAnimationController: animationController,
    builder: (_) {
      print(animationController.value);
      return Stack(
        children: [
          Positioned.fill(
            bottom: 350,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(
                milliseconds: 500,
              ), //animationController.duration,
              tween: Tween<double>(begin: 1.0, end: 0.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0.0, 600 * value),
                  child: Opacity(
                    opacity: animationController.value,
                    child: child,
                  ),
                );
              },
              child: Container(
                color: Colors.deepOrange[300],
                child: Image.asset(recipe.image),
              ),
            ),
          ),
          Positioned.fill(
            top: size.height * 0.4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Color(0xff303030),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 8.0, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      recipe.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 5,
                      color: Colors.deepOrange[400],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      recipe.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
