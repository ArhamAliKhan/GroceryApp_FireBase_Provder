// import 'package:flutter/material.dart';
// import 'package:grocery_firebase_provider/Utils/contants.dart';
// import 'package:grocery_firebase_provider/Widgets/unit_conversation.dart';
// import 'package:provider/provider.dart';
//
// import '../Provider/favorite_provider.dart';
//
// class GroceryItems extends StatelessWidget {
//   final Map<String, dynamic> grocery;
//
//   const GroceryItems({super.key, required this.grocery});
//
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<FavoriteProvider>(context).isFavorite(product);
//
//     return Container(
//       width: 192,
//       height: 280,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         gradient: LinearGradient(
//           colors: [Colors.white, Color(0xffF7FFF7)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 0,
//             blurRadius: 7,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 160,
//             width: double.maxFinite,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(grocery['image']),
//               ),
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             grocery['name'],
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 "\$",
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: -1,
//                 ),
//               ),
//               Text(
//                 "${grocery['price']}/${getUnit(grocery['category'])}",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: -1,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: primaryColor),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(25),
//                       topRight: Radius.circular(10),
//                     ),
//                   ),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: IconButton(
//                       icon: Icon(
//                         Provider.of<FavoriteProvider>(
//                               context,
//                             ).isFavorite(product)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         color:
//                             Provider.of<FavoriteProvider>(
//                                   context,
//                                 ).isFavorite(product)
//                                 ? Colors.red
//                                 : Colors.grey,
//                       ),
//                       onPressed: () {
//                         Provider.of<FavoriteProvider>(
//                           context,
//                           listen: false,
//                         ).toggleFavorite(product);
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: primaryColor,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(25),
//                       topLeft: Radius.circular(10),
//                     ),
//                   ),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Icon(
//                       Icons.shopping_cart,
//                       color: Colors.white,
//                       size: 27,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:grocery_firebase_provider/Utils/contants.dart';
import 'package:grocery_firebase_provider/Widgets/unit_conversation.dart';
import 'package:provider/provider.dart';

import '../Provider/cart_provider.dart';
import '../Provider/favorite_provider.dart';

class GroceryItems extends StatelessWidget {
  final Map<String, dynamic> grocery;

  const GroceryItems({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    final isFav = Provider.of<FavoriteProvider>(context).isFavorite(grocery);

    return Container(
      width: 192,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xffF7FFF7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(grocery['image']),
              ),
            ),
          ),

          const SizedBox(height: 4),

          // Product Name
          Text(
            grocery['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          // Price
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "\$",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
              Text(
                "${grocery['price']}/${getUnit(grocery['category'])}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Favorite Button
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      Provider.of<FavoriteProvider>(
                        context,
                        listen: false,
                      ).toggleFavorite(grocery);
                    },
                  ),
                ),
              ),

              // Cart Button
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // You can implement cart logic here
                    },
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        final cartProvider = Provider.of<CartProvider>(
                          context,
                          listen: false,
                        );
                        cartProvider.addToCart({
                          'id': grocery['id'],
                          'name': grocery['name'],
                          'price': grocery['price'],
                          'image': grocery['image'],
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${grocery['name']} added to cart'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
