import 'package:flutter/material.dart';
import 'package:meal_mate/data/dummy_data.dart';
import 'package:meal_mate/screens/tabs.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(ImageAssets.getStarted),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [
                  0.2,
                  1,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + 16,
              16,
              MediaQuery.of(context).padding.top + 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Cook Like A Chef",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  "De Chef is a user-friendly recipe app designed for those who are new to cooking and want to try new recipes at home",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white60,
                      ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const TabsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 174, 135, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Get Started',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
