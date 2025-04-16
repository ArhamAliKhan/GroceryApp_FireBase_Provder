// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:grocery_firebase_provider/Model/category_model.dart';
// import 'package:grocery_firebase_provider/Model/grocery_model.dart';
// import 'package:grocery_firebase_provider/Provider/cart_provider.dart';
//
// import '../Utils/contants.dart';
// import '../Widgets/unit_conversation.dart';
//
// class ProductDetail extends StatelessWidget {
//   final Map<String, dynamic> grocery;
//
//   const ProductDetail({super.key, required this.grocery});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: secondaryColor,
//         elevation: 0,
//         centerTitle: true,
//         leading: Container(
//           margin: const EdgeInsets.only(left: 17),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           ),
//         ),
//         title: const Text(
//           "Product Detail",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // You can navigate to cart screen here if needed
//             },
//             icon: const Icon(Icons.shopping_cart_outlined),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               Image(
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 325,
//                 image: NetworkImage(grocery['image']),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Column(
//                   children: [
//                     Text(grocery['name'], style: const TextStyle(fontSize: 35)),
//                     Text(
//                       "\$ ${grocery['price']}/${getUnit(grocery['category'])}",
//                       style: const TextStyle(fontSize: 21, color: Colors.red),
//                     ),
//                     Text(
//                       grocery['category'],
//                       style: TextStyle(
//                         fontSize: 21,
//                         color: Colors.green.shade400,
//                       ),
//                     ),
//                     const Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Description:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       grocery['description'].join(" "),
//                       style: const TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 21.0),
//                 child: Row(
//                   children: [
//                     // Buy button
//                     GestureDetector(
//                       child: Container(
//                         height: 50,
//                         width: 160,
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(21),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Buy',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 25),
//                     // Add to Cart button
//                     GestureDetector(
//                       onTap: () {
//                         CartProvider.addToCart({
//                           ...grocery,
//                           'quantity': 1, // default quantity when adding
//                         });
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Added to cart successfully 🛒'),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 160,
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(21),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Add to Cart',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     backgroundColor: secondaryColor,
//     //     elevation: 0,
//     //     centerTitle: true,
//     //     leading: Container(
//     //       margin: EdgeInsets.only(left: 17),
//     //       child: GestureDetector(
//     //         onTap: () {
//     //           Navigator.pop(context);
//     //         },
//     //         child: Icon(Icons.arrow_back_ios, color: Colors.black),
//     //       ),
//     //     ),
//     //     title: Text(
//     //       "Product Detail",
//     //       style: TextStyle(fontWeight: FontWeight.bold),
//     //     ),
//     //     actions: [
//     //       IconButton(
//     //         onPressed: () {},
//     //         icon: Icon(Icons.shopping_cart_outlined),
//     //       ),
//     //     ],
//     //   ),
//     //   body: SingleChildScrollView(
//     //     child: SafeArea(
//     //       child: Column(
//     //         children: [
//     //           Container(
//     //             child: Image(
//     //               fit: BoxFit.cover,
//     //               width: double.infinity,
//     //               height: 325,
//     //               image: NetworkImage(grocery['image']),
//     //             ),
//     //           ),
//     //           Padding(
//     //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     //             child: Column(
//     //               children: [
//     //                 Align(
//     //                   alignment: Alignment.center,
//     //                   child: Text(
//     //                     grocery['name'],
//     //                     style: TextStyle(fontSize: 35),
//     //                   ),
//     //                 ),
//     //                 Align(
//     //                   alignment: Alignment.center,
//     //                   child: Text(
//     //                     "\$ ${grocery['price']}/${getUnit(grocery['category'])}",
//     //                     style: TextStyle(fontSize: 21, color: Colors.red),
//     //                   ),
//     //                 ),
//     //                 Align(
//     //                   alignment: Alignment.center,
//     //                   child: Text(
//     //                     grocery['category'],
//     //                     style: TextStyle(
//     //                       fontSize: 21,
//     //                       color: Colors.green.shade400,
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 Align(
//     //                   alignment: Alignment.topLeft,
//     //                   child: Text(
//     //                     'Decription:',
//     //                     style: TextStyle(
//     //                       fontWeight: FontWeight.bold,
//     //                       fontSize: 24,
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 Align(
//     //                   alignment: Alignment.center,
//     //                   child: Text(
//     //                     grocery['description'].join(" "),
//     //                     style: TextStyle(fontSize: 18, color: Colors.black),
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //           SizedBox(height: 25),
//     //           Padding(
//     //             padding: const EdgeInsets.symmetric(horizontal: 21.0),
//     //             child: Row(
//     //               children: [
//     //                 GestureDetector(
//     //                   child: Container(
//     //                     height: 50,
//     //                     width: 160,
//     //                     decoration: BoxDecoration(
//     //                       color: Colors.green,
//     //                       borderRadius: BorderRadius.circular(21),
//     //                     ),
//     //                     child: Center(
//     //                       child: Text(
//     //                         'Buy',
//     //                         style: TextStyle(
//     //                           fontSize: 18,
//     //                           color: Colors.white,
//     //                           fontWeight: FontWeight.bold,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(width: 25),
//     //                 GestureDetector(
//     //                   onTap: () {},
//     //                   child: Container(
//     //                     height: 50,
//     //                     width: 160,
//     //                     decoration: BoxDecoration(
//     //                       color: Colors.green,
//     //                       borderRadius: BorderRadius.circular(21),
//     //                     ),
//     //                     child: Center(
//     //                       child: Text(
//     //                         'Add to Cart',
//     //                         style: TextStyle(
//     //                           fontWeight: FontWeight.bold,
//     //                           fontSize: 18,
//     //                           color: Colors.white,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure you have Provider in your project

import '../Model/category_model.dart';
import '../Model/grocery_model.dart';
import '../Utils/contants.dart';
import '../Widgets/unit_conversation.dart';
import '../Provider/cart_provider.dart'; // Import the CartProvider

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> grocery;

  const ProductDetail({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Product Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to cart screen (if you have a CartScreen)
              Navigator.pushNamed(context, '/cart');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Image(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 325,
                  image: NetworkImage(grocery['image']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        grocery['name'],
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "\$ ${grocery['price']}/${getUnit(grocery['category'])}",
                        style: TextStyle(fontSize: 21, color: Colors.red),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        grocery['category'],
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.green.shade400,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Description:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        grocery['description'].join(" "),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    GestureDetector(
                      onTap: () {
                        // Add the product to the cart using CartProvider
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addToCart(grocery);

                        // Show a Snackbar confirming the product was added to the cart
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${grocery['name']} added to cart!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
