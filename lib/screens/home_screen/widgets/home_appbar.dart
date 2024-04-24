import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meal_mate/screens/home_screen/widgets/home_search_bar.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                "Discover Best \nRecipes",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(37, 174, 135, 1),
                    ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.setting_5),
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.grey[300],
                  fixedSize: const Size(50, 50),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        
        HomeSearchBar()
      ],
    );
  }
}
