import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              cursorColor: const Color.fromRGBO(37, 174, 135, 1),
              decoration: InputDecoration(
                hintText: "Search Recipes",
                suffixIcon: IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.search),
                ),
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                    ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.only(
                  top: 14,
                  bottom: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final TextEditingController searchController = TextEditingController();
