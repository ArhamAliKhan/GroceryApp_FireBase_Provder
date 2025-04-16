import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadCategoryDataToFirestore() async {
  final CollectionReference ref =
  FirebaseFirestore.instance.collection("Category");
  for (final CategoryModel place in groceryCategory) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    // ref.doc("das");
    await ref.doc(id).set(place.toMap());
  }
}


class CategoryModel {
  final String image;
  final String name;

  CategoryModel({
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }
}

List<CategoryModel> groceryCategory = [
  CategoryModel(
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREJq0qVBiutQ0JhUSuY7JRANu-yM3KLhNE3Q&s",
    name: "Vegetables",
  ),
  CategoryModel(
    image: "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-3foodgroups_fruits_detailfeature_thumb.jpg?sfvrsn=7abe71fe_4",
    name: "Fruits",
  ),
  CategoryModel(
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpEmx2UNl2XE6DZZLJrZHGjXEiEtntW-BdKw&s",
    name: "Bakery",
  ),
  CategoryModel(
    image: "https://info.ehl.edu/hubfs/1440/1440x960-spices.jpg",
    name: "Spices",
  ),
  CategoryModel(
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH-s2jyutIDLmtXuCg1J0iEi2aSkKTCSoFxA&s",
    name: "Meat",
  ),
];
