import 'package:flutter/material.dart';
import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/screens/component/meal_detail_screen.dart';
import 'package:meal_mate/screens/home_screen/widgets/home_meal_item.dart';

class HomeTrendingMeals extends StatelessWidget {
  const HomeTrendingMeals({
    super.key,
    required this.availableMeals,
  });
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    void onSelectMeal(BuildContext context, Meal meal) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MealDetailsScreen(
            meal: meal,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Trending Recipe",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(37, 174, 135, 1),
                ),
          ),
        ),
        HomeMealItem(
          categorizedMeals: availableMeals,
          onSelectMeal: (Meal meal) {
            onSelectMeal(context, meal);
          },
        ),
      ],
    );
  }
}
