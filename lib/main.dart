import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodListScreen(),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  final List<Map<String, String>> foods = const [
    {"icon": "🍔", "name": "Cheese Burger", "price": "₹149"},
    {"icon": "🍕", "name": "Veg Pizza", "price": "₹199"},
    {"icon": "🍝", "name": "Pasta", "price": "₹179"},
    {"icon": "🥪", "name": "Sandwich", "price": "₹99"},
    {"icon": "🥤", "name": "Cold Drink", "price": "₹49"},
    {"icon": "🍰", "name": "Chocolate Cake", "price": "₹149"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Example"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: foods.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Text(
                foods[index]["icon"]!,
                style: const TextStyle(fontSize: 35),
              ),
              title: Text(
                foods[index]["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(foods[index]["price"]!),
              trailing: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}