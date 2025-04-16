import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/favorite_provider.dart';
import '../Utils/contants.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteProvider>(context).favorites;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorites"),
        backgroundColor: primaryColor,
      ),
      body:
          favorites.isEmpty
              ? Center(child: Text("No favorite items"))
              : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final item = favorites[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Image on Left
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item['image'],
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          // Info on Right
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("Price: ${item['price']}"),
                                Text("Category: ${item['category']}"),
                                SizedBox(height: 5),
                                TextButton(
                                  onPressed: () {
                                    Provider.of<FavoriteProvider>(
                                      context,
                                      listen: false,
                                    ).removeFavorite(item);
                                  },
                                  child: Text(
                                    "Remove",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
