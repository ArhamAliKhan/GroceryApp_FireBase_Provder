// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Provider/cart_provider.dart';
//
// class CartScreen extends StatelessWidget {
//   final Map<String, dynamic> grocery;
//
//   const CartScreen({super.key, required this.grocery});
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final cartItems = cartProvider.cartItems;
//     final quantityController = TextEditingController(
//       text: grocery['quantity'].toString(),
//     );
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Shopping Cart'), centerTitle: true),
//       body:
//           cartItems.isEmpty
//               ? const Center(child: Text('Cart is empty 🛒'))
//               : Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: cartItems.length,
//                       itemBuilder: (context, index) {
//                         final item = cartItems[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 8,
//                           ),
//                           child: ListTile(
//                             leading: Image.network(
//                               item['image'],
//                               width: 60,
//                               height: 60,
//                               fit: BoxFit.cover,
//                             ),
//                             title: Text(item['name']),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Price: \$${item['price']}"),
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.remove),
//                                       onPressed: () {
//                                         if (item['quantity'] > 1) {
//                                           item['quantity'] -= 1;
//                                           cartProvider.notifyListeners();
//                                         }
//                                       },
//                                     ),
//                                     SizedBox(
//                                       width: 40,
//                                       child: TextFormField(
//                                         controller: quantityController,
//                                         keyboardType: TextInputType.number,
//                                         textAlign: TextAlign.center,
//                                         onChanged: (value) {
//                                           final qty = int.tryParse(value);
//                                           if (qty != null && qty > 0) {
//                                             item['quantity'] = qty;
//                                             cartProvider.notifyListeners();
//                                           }
//                                         },
//                                       ),
//                                     ),
//
//                                     IconButton(
//                                       icon: const Icon(Icons.add),
//                                       onPressed: () {
//                                         item['quantity'] += 1;
//                                         cartProvider.notifyListeners();
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.delete),
//                               onPressed: () {
//                                 cartProvider.removeFromCart(item['id']);
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       border: Border(
//                         top: BorderSide(color: Colors.grey.shade300),
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'Total Price:',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // You can add checkout logic here
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text("Checkout pressed"),
//                                 ),
//                               );
//                             },
//                             child: const Text("Proceed to Checkout"),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    // Dispose all controllers to avoid memory leaks
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart'), centerTitle: true),
      body:
          cartItems.isEmpty
              ? const Center(child: Text('Cart is empty 🛒'))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        final itemId = item['id'].toString();

                        // Create controller if not already created
                        _controllers.putIfAbsent(
                          itemId,
                          () => TextEditingController(
                            text: item['quantity'].toString(),
                          ),
                        );

                        final quantityController = _controllers[itemId]!;

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: ListTile(
                            leading: Image.network(
                              item['image'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            title: Text(item['name']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Price: \$${item['price']}"),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (item['quantity'] > 1) {
                                          setState(() {
                                            item['quantity'] -= 1;
                                            quantityController.text =
                                                item['quantity'].toString();
                                          });
                                          cartProvider.notifyListeners();
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: TextFormField(
                                        controller: quantityController,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          final qty = int.tryParse(value);
                                          if (qty != null && qty > 0) {
                                            setState(() {
                                              item['quantity'] = qty;
                                            });
                                            cartProvider.notifyListeners();
                                          }
                                        },
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          item['quantity'] += 1;
                                          quantityController.text =
                                              item['quantity'].toString();
                                        });
                                        cartProvider.notifyListeners();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  _controllers.remove(itemId)?.dispose();
                                  cartProvider.removeFromCart(item['id']);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Price:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Checkout pressed"),
                                ),
                              );
                            },
                            child: const Text("Proceed to Checkout"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
