import 'package:flutter/material.dart';
import 'package:meal_mate/data/dummy_data.dart';
import 'package:meal_mate/models/category.dart';
import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/screens/home_screen/widgets/home_meal_item.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({
    super.key,
    required this.availableMeals,
  });
  final List<Meal> availableMeals;

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int currentCategory = 0;
  List<Meal> filteredMeals = [];

  List<Meal> _categorizedMeals(Category category) {
    return filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(37, 174, 135, 1),
                ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 40,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: availableCategories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      currentCategory = index;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: currentCategory == index
                          ? const Color.fromRGBO(37, 174, 135, 1)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        availableCategories[index].title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: currentCategory == index
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.5),
                            ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
        ),
        HomeMealItem(
          categorizedMeals:
              _categorizedMeals(availableCategories[currentCategory]),
        ),
      ],
    );
  }
}
