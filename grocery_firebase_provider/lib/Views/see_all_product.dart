import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_firebase_provider/Utils/contants.dart';
import 'package:grocery_firebase_provider/Widgets/groceryItems.dart';
import 'package:grocery_firebase_provider/Widgets/my_search_bar.dart';
import 'package:provider/provider.dart';

import '../Model/category_model.dart';
import '../Provider/cart_provider.dart';

class SeeAllProduct extends StatefulWidget {
  const SeeAllProduct({super.key});

  @override
  State<SeeAllProduct> createState() => _SeeAllProductState();
}

class _SeeAllProductState extends State<SeeAllProduct> {
  List<Map<String, dynamic>> groceryItems = [];
  List<Map<String, dynamic>> filerItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAllProduct();
  }

  Future<void> fetchAllProduct() async {
    setState(() {
      _isLoading = true;
    });
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('myAppCollection').get();
      setState(() {
        groceryItems = snapshot.docs.map((docs) => docs.data()).toList();
        filerItems = groceryItems;
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    } finally {
      _isLoading = false;
    }
  }

  void searchFilterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        filerItems = groceryItems;
      });
    } else {
      setState(() {
        filerItems =
            groceryItems.where((item) {
              return item['name'].toString().toLowerCase().contains(
                query.toLowerCase(),
              );
            }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(left: 17),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        title: Text(
          'All Grocery Product',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Consumer<CartProvider>(
            builder:
                (_, cart, ch) => Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart_outlined),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                    ),
                  ],
                ),
          ),

          SizedBox(width: 15),
        ],
      ),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MySearchBar(onSearch: searchFilterItems),
                      SizedBox(height: 25),
                      Expanded(
                        child: GridView.builder(
                          itemCount: filerItems.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.662,
                              ),

                          itemBuilder: (context, index) {
                            return GroceryItems(grocery: filerItems[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
