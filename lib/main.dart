import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'recipe_theme.dart';
import 'models/models.dart';
import 'home.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // 2
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = RecipeTheme.light();

    return MaterialApp(
      theme: theme,
      title: 'Recipe App',
      home: MultiProvider(
        providers: [
          // 2
          ChangeNotifierProvider(create: (context) => TabManager()),
          // TODO 10: Add GroceryManager Provider
        ],
        child: const Home(),
      ),
    );
  }
}
