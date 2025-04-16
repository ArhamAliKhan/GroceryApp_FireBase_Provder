import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadDataToFirestore() async {
  final CollectionReference ref =
  FirebaseFirestore.instance.collection("myAppCollection");

  for (final GroceryModel item in groceries) {
    // Generate a unique ID for each item
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();

    // Assign the unique ID to the item
    final GroceryModel itemWithId = GroceryModel(
      id: id, // Assign the unique ID
      image: item.image,
      name: item.name,
      price: item.price,
      rating: item.rating,
      description: item.description,
      category: item.category,
    );

    // Upload the item to Firestore
    await ref.doc(id).set(itemWithId.toMap());
  }
}

// final docRef = FirebaseFirestore.instance.collection('groceries').doc();

class GroceryModel {
  String id;
  String image;
  String name;
  dynamic price;
  double rating;
  List<String>? description;
  String category;

  GroceryModel({
    required this.id, // Include ID
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.category,
  });

  // Convert GroceryModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include in Firestore
      'image': image,
      'name': name,
      'price': price,
      'rating': rating,
      'description': description,
      'category': category,
    };
  }
}

List<GroceryModel> groceries = [
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBrPtB4GtayFzrxj9LIJNEXpwlU2Gj6ybuzw&s",
    name: "Fresh Red Apples",
    price: "3.99",
    rating: 4.8,
    description: [
      "Juicy and crisp red apples from organic farms.",
      " - Great for apple pies and juices.",
      " - Rich in antioxidants.",
      " - Supports digestion.",
      " - Refrigerate for longer freshness."
    ],
    category: "Fruits",
  ),
  GroceryModel(
    id: '',
    image: "https://nutritionsource.hsph.harvard.edu/wp-content/uploads/2018/08/bananas-1354785_1920.jpg",
    name: "Bananas",
    price: "1.20",
    rating: 4.7,
    description: [
      "Sweet and ripe bananas, perfect for snacking.",
      " - High in potassium.",
      " - Boosts energy levels.",
      " - Great in smoothies.",
      " - Peel and enjoy."
    ],
    category: "Fruits",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBfK7wMBFw8o8jumEze28KjZGQRtEFO5il_g&s",
    name: "Navel Oranges",
    price: "2.50",
    rating: 4.6,
    description: [
      "Fresh, juicy oranges with a tangy taste.",
      " - High in Vitamin C.",
      " - Immune system booster.",
      " - Great for juicing.",
      " - Store in a cool place."
    ],
    category: "Fruits",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8inXnVMJWa4ZL1359dg4St7YLJ81AZOFPGQ&s",
    name: "Seedless Grapes",
    price: "3.75",
    rating: 4.5,
    description: [
      "Sweet and crunchy seedless grapes.",
      " - Ideal for snacking.",
      " - Helps with hydration.",
      " - Contains natural sugars.",
      " - Keep refrigerated."
    ],
    category: "Fruits",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfVpw_7I1DtwsMRt_3ei1xIQaSXg6DHMPsUw&s",
    name: "Alphonso Mangoes",
    price: "5.99",
    rating: 4.9,
    description: [
      "Premium Alphonso mangoes, rich in flavor.",
      " - Perfect for desserts.",
      " - High in Vitamin A.",
      " - Sweet and aromatic.",
      " - Best served chilled."
    ],
    category: "Fruits",
  ),
  GroceryModel(
    id: '',
    image: "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2023/01/Air-Fryer-Chicken-Breast-main.jpg",
    name: "Chicken Breast",
    price: "7.99",
    rating: 4.6,
    description: [
      "Skinless, boneless chicken breasts.",
      " - Lean protein source.",
      " - Ideal for grilling or baking.",
      " - No added hormones.",
      " - Keep frozen until use."
    ],
    category: "Meat",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRorvgNF6L6fMUgESUQ-cTrN3zqqsBUAYUuLA&s",
    name: "Ground Beef",
    price: "6.49",
    rating: 4.5,
    description: [
      "Fresh ground beef, 80% lean.",
      " - Great for burgers or tacos.",
      " - Rich in flavor.",
      " - USDA certified.",
      " - Keep refrigerated or freeze."
    ],
    category: "Meat",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2KAuVBavfAKbfHgmx6h0xMJQbDflT72H3Qw&s",
    name: "Lamb Chops",
    price: "12.99",
    rating: 4.7,
    description: [
      "Tender lamb chops from grass-fed lambs.",
      " - Ideal for grilling.",
      " - High in protein and iron.",
      " - Premium cut.",
      " - Store in freezer if not used."
    ],
    category: "Meat",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDz2TQPv8vcYRS5az9XomA7xzCHspUWD6jPw&s",
    name: "Ground Turkey",
    price: "5.99",
    rating: 4.4,
    description: [
      "Lean ground turkey with mild flavor.",
      " - Low-fat alternative to beef.",
      " - Cooks quickly.",
      " - Excellent for healthy meals.",
      " - Refrigerate immediately."
    ],
    category: "Meat",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpSBYw3w8O0ryYmn8MFOr3ziCbGnm0uMwwoQ&s",
    name: "Smoked Bacon",
    price: "4.99",
    rating: 4.8,
    description: [
      "Crispy smoked bacon slices.",
      " - Great for breakfast.",
      " - Rich smoky flavor.",
      " - Fully cooked.",
      " - Keep refrigerated after opening."
    ],
    category: "Meat",
  ),

  GroceryModel(
    id: '',
    image: "https://www.tasteofhome.com/wp-content/uploads/2019/01/carrots-shutterstock_789443206.jpg",
    name: "Carrots",
    price: "1.50",
    rating: 4.6,
    description: [
      "Fresh and crunchy organic carrots.",
      " - Great for snacks or cooking.",
      " - Rich in beta-carotene.",
      " - Good for vision.",
      " - Store in fridge."
    ],
    category: "Vegetables",
  ),
  GroceryModel(
    id: '',
    image: "https://www.inspiredtaste.net/wp-content/uploads/2021/02/Garlic-Sauteed-Spinach-1-1200.jpg",
    name: "Spinach",
    price: "2.00",
    rating: 4.7,
    description: [
      "Washed and ready-to-eat spinach leaves.",
      " - Packed with iron.",
      " - Good for bones and eyes.",
      " - Add to smoothies or salads.",
      " - Keep refrigerated."
    ],
    category: "Vegetables",
  ),
  GroceryModel(
    id: '',
    image: "https://www.allrecipes.com/thmb/zubQvhsfRJO8K5SnyqimqyKrG1k=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8760150-How-to-Steam-Broccoli-ddmfs-7559-4x3-beauty-b270504788b64c51996dfcf3d61fcab9.jpg",
    name: "Broccoli",
    price: "2.30",
    rating: 4.5,
    description: [
      "Fresh green broccoli heads.",
      " - High in fiber and vitamin C.",
      " - Great for steaming.",
      " - Aids in detoxification.",
      " - Store in crisper."
    ],
    category: "Vegetables",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5B62fXmxWeGjDSdcvmGf3WP1QAb9Duqty2A&s",
    name: "Tomatoes",
    price: "2.10",
    rating: 4.6,
    description: [
      "Juicy red tomatoes, vine-ripened.",
      " - Great for salads and sauces.",
      " - Rich in lycopene.",
      " - Boosts immunity.",
      " - Store at room temp or chill."
    ],
    category: "Vegetables",
  ),
  GroceryModel(
    id: '',
    image: "https://s.yimg.com/ny/api/res/1.2/HrDrhD05jo1ivvzrdz8TJw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyNDI7aD02OTc-/https://media.zenfs.com/en/the_daily_meal_185/0e12a1e884a241d095f7a75102c2ea1b",
    name: "Yellow Onions",
    price: "1.25",
    rating: 4.4,
    description: [
      "Versatile yellow onions.",
      " - Essential in cooking.",
      " - Adds flavor and depth.",
      " - Can be caramelized.",
      " - Store in a dry place."
    ],
    category: "Vegetables",
  ),

  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhvnmSPfI3Ch2ZqQsq_4f-sXkJGuOhmWe4YQ&s",
    name: "Whole Wheat Bread",
    price: "2.99",
    rating: 4.6,
    description: [
      "Soft and healthy whole wheat loaf.",
      " - Rich in fiber.",
      " - Good for heart health.",
      " - Perfect for sandwiches.",
      " - Keep sealed to stay fresh."
    ],
    category: "Bakery",
  ),
  GroceryModel(
    id: '',
    image: "https://www.aheadofthyme.com/wp-content/uploads/2020/05/quick-and-easy-butter-croissants-2.jpg",
    name: "Butter Croissants",
    price: "4.50",
    rating: 4.7,
    description: [
      "Flaky and buttery French-style croissants.",
      " - Great with coffee.",
      " - Warm before serving.",
      " - Classic breakfast treat.",
      " - Store in airtight container."
    ],
    category: "Bakery",
  ),
  GroceryModel(
    id: '',
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Awk673j2JC3bxIPB-a00NRIDouupvWjy9Q&s",
    name: "Plain Bagels",
    price: "3.25",
    rating: 4.5,
    description: [
      "Classic plain bagels, freshly baked.",
      " - Toast and serve with cream cheese.",
      " - Dense and chewy texture.",
      " - Good for sandwiches too.",
      " - Store in a breadbox or fridge."
    ],
    category: "Bakery",
  ),
  GroceryModel(
    id: '',
    image: "https://cambreabakes.com/wp-content/uploads/2024/03/bakery-style-blueberry-muffins-featured-2.jpg",
    name: "Blueberry Muffins",
    price: "4.80",
    rating: 4.8,
    description: [
      "Moist and fluffy muffins with real blueberries.",
      " - Ideal for snacks or breakfast.",
      " - Naturally sweetened.",
      " - Individually wrapped.",
      " - Keep in a cool place."
    ],
    category: "Bakery",
  ),
  GroceryModel(
    id: '',
    image: "https://static01.nyt.com/images/2018/12/11/dining/as-garlic-bread/as-garlic-bread-square640.jpg",
    name: "Garlic Bread",
    price: "3.99",
    rating: 4.6,
    description: [
      "Ready-to-bake garlic bread.",
      " - Perfect side for pasta.",
      " - Buttery and flavorful.",
      " - Oven-ready.",
      " - Best served hot."
    ],
    category: "Bakery",
  ),

];

