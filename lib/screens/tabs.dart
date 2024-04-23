import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meal_mate/providers/favourites_provider.dart';
import 'package:meal_mate/providers/filters_provider.dart';
import 'package:meal_mate/screens/categories.dart';
import 'package:meal_mate/screens/filters.dart';
import 'package:meal_mate/screens/home_screen/home_screen.dart';
import 'package:meal_mate/screens/meals.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageindex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  void _setString(String identifier) {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = HomeScreen(
      availableMeals: availableMeals,
    );

    if (_selectedPageindex == 1) {
      activePage = CategoriesScreen(
        availableMeals: availableMeals,
      );
    }
    if (_selectedPageindex == 2) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageindex,
        selectedItemColor: const Color.fromRGBO(37, 174, 135, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home5),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart5),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
