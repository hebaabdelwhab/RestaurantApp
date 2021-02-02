import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/Fliters_screens.dart';
import './screens/Meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';

void main() =>runApp(App());

class App extends StatefulWidget{
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Map<String , bool> _Filters = {
    'gluten':false,
    'lactose':false,
    'vegan' :false,
    'vegetarian' : false,
  };
  List<Meal> _AvailableMeal = DUMMY_MEALS ;
  List<Meal> _FavouriteMeals = [];

  void _toggleFavorites(String mealId) {
    final existingindex = _FavouriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingindex>=0){
      setState(() {
        _FavouriteMeals.removeAt(existingindex);
      });
    }
    else {
      setState(() {
        _FavouriteMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id == mealId));
      });
    }
  }
  void _setFilters(Map<String , bool> _FiltersData){
      setState(() {
      _Filters = _FiltersData ;
      _AvailableMeal = DUMMY_MEALS.where((meal){
         if(_Filters['gluten']&& !meal.isGlutenFree){
          return false ;
         }
         if(_Filters['lactose']&& !meal.isLactoseFree){
           return false ;
         }
         if(_Filters['vegan']&& !meal.isVegan){
           return false ;
         }
         if(_Filters['vegetarian'] && ! meal.isVegetarian){
           return false ;
         }
         return true ;
      }).toList();
    });
  }
  bool _isMealFavorite(String id){
        return _FavouriteMeals.any((meal)=> meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229,1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
              color:Color.fromARGB(20, 50, 50, 1)),
          body2: TextStyle(color:Color.fromARGB(20, 50, 50, 1)),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes:{
        '/':(ctx) => TabsScreen(_FavouriteMeals),
        CategoryMealScreen.routeName:(context)=>CategoryMealScreen(_AvailableMeal),
        MealDetailsScreen.routeName:(context)=>MealDetailsScreen(_toggleFavorites , _isMealFavorite),
        FlitersScreen.routeName: (context)=> FlitersScreen(_Filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}