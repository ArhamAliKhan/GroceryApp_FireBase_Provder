import 'package:flutter/material.dart';
import 'package:grocery_firebase_provider/Utils/contants.dart';
import 'package:grocery_firebase_provider/Views/grocery_home_page.dart';
import 'package:grocery_firebase_provider/Views/shopping_cart.dart';
import 'package:iconsax/iconsax.dart';

import 'favorite.dart';

class GroceryAppMainScreen extends StatefulWidget {
  const GroceryAppMainScreen({super.key});

  @override
  State<GroceryAppMainScreen> createState() => _GroceryAppMainScreenState();
}

class _GroceryAppMainScreenState extends State<GroceryAppMainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List pages = [
      GroceryHomePage(),
      FavoriteScreen(),
      // Scaffold(body: Center(child: Text("Shopping cart"))),
      // ShoppingCartPage(),
      CartScreen(),
      Scaffold(body: Center(child: Text("Profile"))),
    ];

    return Scaffold(
      backgroundColor: secondaryColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: primaryColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.black45,
        elevation: 0,
        backgroundColor: secondaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: "Home",
            activeIcon: Icon(Iconsax.home5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            label: "Favorite",
            activeIcon: Icon(Iconsax.heart5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart),
            label: "Cart",
            activeIcon: Icon(Iconsax.shopping_cart5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
