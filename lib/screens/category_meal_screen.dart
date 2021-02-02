import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_items.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> AvailableMeal ;

  CategoryMealScreen(this.AvailableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeal;
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    categoryMeal = widget.AvailableMeal.where((meal) {return meal.categories.contains(categoryId);}).toList();
    super.didChangeDependencies();
  }
  void _removeItems(String mealId){setState(() {categoryMeal.removeWhere((meal)=> meal.id== mealId);});}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
          return MealItem(
            id:  categoryMeal[index].id,
            imageurl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
           // removeItem: _removeItems,
          ); },
            itemCount: categoryMeal.length,
      ),
    );
  }
}