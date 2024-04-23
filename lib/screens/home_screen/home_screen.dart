import 'package:flutter/material.dart';

import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/screens/home_screen/widgets/home_ads.dart';
import 'package:meal_mate/screens/home_screen/widgets/home_categories.dart';
import 'package:meal_mate/screens/home_screen/widgets/home_trending.dart';
import 'package:meal_mate/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.availableMeals,
  });
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 24,
        bottom: MediaQuery.of(context).padding.bottom + 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppbar(),
          const HomeAds(),
          HomeCategories(availableMeals: availableMeals),
          HomeTrendingMeals(availableMeals: availableMeals),
        ],
      ),
    );
  }
}
