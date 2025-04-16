import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_firebase_provider/Utils/contants.dart';
import 'package:grocery_firebase_provider/Views/product_detail.dart';
import 'package:grocery_firebase_provider/Views/see_all_product.dart';
import 'package:grocery_firebase_provider/Widgets/groceryItems.dart';
import 'package:grocery_firebase_provider/Widgets/my_search_bar.dart';
import 'package:provider/provider.dart';

import '../Provider/cart_provider.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  String category = '';
  List<Map<String, dynamic>> groceryItems = [];
  List<Map<String, dynamic>> groceryCategory = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await fetchCategory();
    if (groceryCategory.isNotEmpty) {
      category = groceryCategory[0]["name"];
      await filterProductByCategory(category);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> fetchCategory() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Category').get();
      setState(() {
        groceryCategory = snapshot.docs.map((docs) => docs.data()).toList();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> filterProductByCategory(String selectedCategory) async {
    setState(() {
      _isLoading = true;
    });
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('myAppCollection')
              .where('category', isEqualTo: selectedCategory)
              .get();
      setState(() {
        category = selectedCategory;
        groceryItems = snapshot.docs.map((docs) => docs.data()).toList();
      });
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                        children: [
                          TextSpan(text: "Hello,"),
                          TextSpan(
                            text: "Smith\n",
                            style: TextStyle(color: primaryColor),
                          ),
                          TextSpan(
                            text: "What do you need",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'Quality you can taste, freshness you can trust',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: MySearchBar(onSearch: (p) {}),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Spacer(),
                        Text(
                          "See All",
                          style: TextStyle(fontSize: 16, color: Colors.black38),
                        ),
                        Icon(Icons.keyboard_arrow_right, color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          groceryCategory.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                filterProductByCategory(
                                  groceryCategory[index]["name"],
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width:
                                        category ==
                                                groceryCategory[index]["name"]
                                            ? 2
                                            : 1,
                                    color:
                                        category ==
                                                groceryCategory[index]["name"]
                                            ? primaryColor
                                            : Colors.black45,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            groceryCategory[index]["image"],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      groceryCategory[index]["name"],
                                      style: TextStyle(
                                        fontWeight:
                                            category ==
                                                    groceryCategory[index]["name"]
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeeAllProduct(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Find By Categories",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              groceryItems.isEmpty
                  ? Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "No products available in this category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(groceryItems.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            top: 15,
                            bottom: 15,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ProductDetail(
                                        grocery: groceryItems[index],
                                      ),
                                ),
                              );
                            },
                            child: GroceryItems(grocery: groceryItems[index]),
                          ),
                        );
                      }),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
