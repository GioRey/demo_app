import 'package:demo_app/src/recipe_app/constants/constants.dart';
import 'package:demo_app/src/recipe_app/widgets/bottom_panel.dart';
import 'package:demo_app/src/recipe_app/widgets/recipe_card.dart';
import 'package:demo_app/src/recipe_app/widgets/tabs_widget.dart';
import 'package:flutter/material.dart';

class RecipeApp extends StatefulWidget {
  RecipeApp({Key key}) : super(key: key);

  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: true,
        top: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.search),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.settings),
                  ),
                ],
              ),
              Text(
                'Hello Sophia!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Your Recipes For Today',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3),
              Container(
                height: size.height * 0.31,
                child: ListView.builder(
                  itemCount: demoRecipes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var recipe = demoRecipes[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          bottomPanel(
                              recipe: recipe,
                              context: context,
                              size: size,
                              animationController: _animationController);
                        },
                        child: RecipeCard(
                          size: size,
                          name: recipe.name,
                          image: recipe.image,
                        ),
                      ),
                    );
                  },
                ),
              ),
              tabsWidget(),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    itemCount: demoRecipes.length,
                    semanticChildCount: demoRecipes.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var recipe = demoRecipes[index];
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            bottomPanel(
                                recipe: recipe,
                                context: context,
                                size: size,
                                animationController: _animationController);
                          },
                          child: RecipeCard(
                            size: size,
                            name: recipe.name,
                            image: recipe.image,
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
