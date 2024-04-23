import 'package:flutter/material.dart';
import 'package:meal_mate/data/dummy_data.dart';

class HomeAds extends StatelessWidget {
  const HomeAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Image.asset(
              ImageAssets.pasta,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            Positioned(
              top: 20,
              left: 15,
              child: Text(
                "10 best pasta recipes from \nMeal Mate",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
