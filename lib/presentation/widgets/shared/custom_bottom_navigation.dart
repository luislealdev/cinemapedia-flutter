import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined), label: 'Categories'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
    ]);
  }
}
