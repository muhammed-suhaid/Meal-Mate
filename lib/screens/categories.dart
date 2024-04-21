import 'package:flutter/material.dart';
import 'package:meal_mate/data/dummy_data.dart';
import 'package:meal_mate/models/category.dart';
import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/screens/meals.dart';
import 'package:meal_mate/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavourite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  void _selectcategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectcategory(context, category);
            },
          )
      ],
    );
  }
}
