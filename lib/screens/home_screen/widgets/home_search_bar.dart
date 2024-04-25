import 'package:flutter/material.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

final TextEditingController searchController = TextEditingController();
bool hasvalue = false;

class _HomeSearchBarState extends State<HomeSearchBar> {
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
          const Icon(Icons.search),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              cursorColor: const Color.fromRGBO(37, 174, 135, 1),
              controller: searchController,
              onChanged: (value) {
                print(searchController.text);
                setState(() {
                  hasvalue = true;
                });
              },
              decoration: InputDecoration(
                hintText: "Search Recipes",
                suffixIcon: hasvalue
                    ? IconButton(
                        onPressed: () {
                          searchController.clear();

                          setState(() {
                            hasvalue = false;
                          });
                        },
                        icon: const Icon(Icons.close),
                      )
                    : null,
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
