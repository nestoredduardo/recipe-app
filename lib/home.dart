import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card1.dart';
import 'card2.dart';
import 'models/models.dart';
import 'screens/grocery_screen.dart';


// 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // 8
  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    const GroceryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // 1
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Recipe App',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // 2
        // TODO: Replace body
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context)
              .textSelectionTheme.selectionColor,
          // 3
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            // 4
            tabManager.goToTab(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    },
    );
  }
}
