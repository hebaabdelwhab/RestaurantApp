import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/maindrawer.dart';
import './categories_screen.dart';
import './favoruite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> FavoriteMeals;
  const TabsScreen(this.FavoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _Pages;
  int _selectedpageindex = 0;
  @override
  void initState() {
    _Pages=[
      {
        'page':CategoriesScreen(),
        'title':'Categories',
      },
      {
        'page':FavouriteScreen(widget.FavoriteMeals),
        'title':'Your Favorites',
      },
    ];
    super.initState();
  }
  void _selectPage(int index) {
   setState(() {
     _selectedpageindex = index;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_Pages[_selectedpageindex]['title'])),
      body: _Pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        currentIndex: _selectedpageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}