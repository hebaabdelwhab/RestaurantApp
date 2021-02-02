import 'package:flutter/material.dart';
import '../widgets/meal_items.dart';
import '../models/meal.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> FavoriteMeals;
  FavouriteScreen(this.FavoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(FavoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - Start adding some!!"),
      );
    }
    else
      {
       return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id:  FavoriteMeals[index].id,
              imageurl: FavoriteMeals[index].imageUrl,
              title: FavoriteMeals[index].title,
              duration: FavoriteMeals[index].duration,
              affordability: FavoriteMeals[index].affordability,
              complexity: FavoriteMeals[index].complexity,); },
          itemCount: FavoriteMeals.length,
        );
      }
  }
}
