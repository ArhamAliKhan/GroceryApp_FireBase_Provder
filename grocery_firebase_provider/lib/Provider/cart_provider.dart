// // import 'package:flutter/material.dart';
// //
// // class CartProvider with ChangeNotifier {
// //   final List<Map<String, dynamic>> _cartItems = [];
// //
// //   List<Map<String, dynamic>> get cartItems => _cartItems;
// //
// //   void addToCart(Map<String, dynamic> product) {
// //     // Check if item already exists (optional logic based on 'id')
// //     final index = _cartItems.indexWhere((item) => item['id'] == product['id']);
// //
// //     if (index == -1) {
// //       _cartItems.add({...product, 'quantity': 1});
// //     } else {
// //       _cartItems[index]['quantity'] += 1;
// //     }
// //
// //     notifyListeners();
// //   }
// //
// //   void removeFromCart(String productId) {
// //     _cartItems.removeWhere((item) => item['id'] == productId);
// //     notifyListeners();
// //   }
// //
// //   void clearCart() {
// //     _cartItems.clear();
// //     notifyListeners();
// //   }
// //
// //   int get totalItems =>
// //       _cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
// //
// //   double get totalPrice => _cartItems.fold(
// //     0,
// //     (sum, item) => sum + (item['price'] * item['quantity']),
// //   );
// // }
// import 'package:flutter/material.dart';
//
// class CartProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> _cartItems = [];
//
//   List<Map<String, dynamic>> get cartItems => _cartItems;
//
//   void addToCart(Map<String, dynamic> product) {
//     final index = _cartItems.indexWhere((item) => item['id'] == product['id']);
//
//     if (index == -1) {
//       _cartItems.add({...product, 'quantity': 1});
//     } else {
//       _cartItems[index]['quantity'] += 1;
//     }
//
//     notifyListeners();
//   }
//
//   void removeFromCart(String productId) {
//     _cartItems.removeWhere((item) => item['id'] == productId);
//     notifyListeners();
//   }
//
//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }
//
//   int get totalItems =>
//       _cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
//
//   double get totalPrice => _cartItems.fold(
//     0,
//     (sum, item) =>
//         sum +
//         ((double.tryParse(item['price'].toString()) ?? 0.0) *
//             (item['quantity'] as int)),
//   );
// }

import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(Map<String, dynamic> product) {
    final index = _cartItems.indexWhere((item) => item['id'] == product['id']);

    if (index == -1) {
      // Adding new item with initial quantity of 1
      _cartItems.add({...product, 'quantity': 1});
    } else {
      // If item already exists, increase the quantity
      _cartItems[index]['quantity'] += 1;
    }

    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item['id'] == productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // Ensure quantity is an integer and always valid
  void updateQuantity(String productId, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item['id'] == productId);
    if (index != -1 && newQuantity > 0) {
      _cartItems[index]['quantity'] = newQuantity;
      notifyListeners();
    }
  }

  int get totalItems =>
      _cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));

  double get totalPrice => _cartItems.fold(
    0.0,
    (sum, item) =>
        sum +
        ((double.tryParse(item['price'].toString()) ?? 0.0) *
            (item['quantity'] as int)),
  );
}
