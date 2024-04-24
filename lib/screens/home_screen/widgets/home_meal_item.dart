import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meal_mate/models/meal.dart';
import 'package:meal_mate/providers/favourites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMealItem extends ConsumerWidget {
  const HomeMealItem({
    super.key,
    required this.categorizedMeals,
  });
  final List<Meal> categorizedMeals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: categorizedMeals.isNotEmpty
          ? SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categorizedMeals.length,
                itemBuilder: (context, index) {
                  final meal = categorizedMeals[index];
                  final isFavourite = favouriteMeals.contains(meal);
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                meal.imageUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 3,
                              right: 5,
                              child: IconButton(
                                onPressed: () {
                                  final wasAdded = ref
                                      .read(favouriteMealsProvider.notifier)
                                      .toggleMealfavouriteStatus(meal);

                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        wasAdded
                                            ? 'Meal marked as a favorite.'
                                            : 'Meal no longer a favorite.',
                                      ),
                                    ),
                                  );
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(40, 40),
                                ),
                                icon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (child, animation) =>
                                      ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  ),
                                  child: Icon(
                                    isFavourite
                                        ? Iconsax.heart5
                                        : Iconsax.heart,
                                    color: isFavourite ? Colors.red : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Iconsax.flash_1,
                              size: 18,
                              color: Colors.grey,
                            ),
                            Text(
                              '  ${meal.calorie} Cal',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              '  •  ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Icon(
                              Iconsax.clock,
                              size: 18,
                              color: Colors.grey,
                            ),
                            Text(
                              '  ${meal.duration} Min',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          : const SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Uh ohh...nothing here!",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "Try Selecting a different category",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
