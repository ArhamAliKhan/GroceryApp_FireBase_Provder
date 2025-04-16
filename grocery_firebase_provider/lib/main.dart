import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_firebase_provider/Views/shopping_cart.dart';
import 'package:provider/provider.dart';

import 'Model/category_model.dart';
import 'Model/grocery_model.dart';
import 'Provider/cart_provider.dart';
import 'Provider/favorite_provider.dart';
import 'Views/grocery_app_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: GroceryAppMainScreen(),
      ),
    );
  }
}

class UploadData extends StatelessWidget {
  const UploadData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // uploadDataToFirestore();
            // uploadDataToFirestore();
            uploadCategoryDataToFirestore();
          },
          child: const Text("Upload Data"),
        ),
      ),
    );
  }
}
