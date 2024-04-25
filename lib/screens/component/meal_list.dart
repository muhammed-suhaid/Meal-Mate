import 'package:flutter/material.dart';
import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/screens/component/meal_detail_screen.dart';
import 'package:meal_mate/screens/component/meal_item.dart';

class MealListScreen extends StatelessWidget {
  const MealListScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 250,
          ),
          Text(
            'Uh Ohh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try Selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          physics: title == null
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          shrinkWrap: title == null ? true : false,
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                onSelectMeal(context, meal);
              },
            );
          });
    }
    if (title == null) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    "Your Favourite\nRecipes",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(37, 174, 135, 1),
                        ),
                  ),
                ),
                content,
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
