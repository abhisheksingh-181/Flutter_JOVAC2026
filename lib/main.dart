import 'package:flutter/material.dart';

// Main Function
void main() {
  runApp(const MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmartCafeScreen(),
    );
  }
}

// StatefulWidget because UI changes dynamically
class SmartCafeScreen extends StatefulWidget {
  const SmartCafeScreen({super.key});

  @override
  State<SmartCafeScreen> createState() => _SmartCafeScreenState();
}

class _SmartCafeScreenState extends State<SmartCafeScreen> {

  // Dropdown categories
  final List<String> categories = [
    "Burger",
    "Pizza",
    "Sandwich",
    "Cold Coffee",
    "French Fries"
  ];

  // Selected Category
  String selectedCategory = "Burger";

  // Quantity
  int quantity = 1;

  // AppBar Title
  String title = "Smart Café";

  // AppBar Color
  Color appBarColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // AppBar
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
        title: Text(title),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert),
          )
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        icon: const Icon(Icons.local_offer,color: Colors.white),
        label: const Text(
          "Today's\nSpecial",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Category Heading
            const Text(
              "Choose Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:8),

            // Dropdown Button
            DropdownButtonFormField<String>(

              value: selectedCategory,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(10),
                ),
              ),

              items: categories.map((item){

                return DropdownMenuItem(

                  value:item,

                  child: Row(
                    children: [

                      const Text(
                        "🍔",
                        style: TextStyle(fontSize:20),
                      ),

                      const SizedBox(width:8),

                      Text(item),

                    ],
                  ),

                );

              }).toList(),

              onChanged:(value){

                setState(() {

                  selectedCategory=value!;

                });

              },

            ),

            const SizedBox(height:20),

            const Text(
              "Selected Item",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            Card(

              elevation:4,

              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(12),
              ),

              child: Padding(

                padding: const EdgeInsets.all(10),

                child: Row(

                  children: [

                    ClipRRect(

                      borderRadius:
                      BorderRadius.circular(10),

                      child: Image.network(

                        "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400",

                        width:80,
                        height:80,
                        fit: BoxFit.cover,

                      ),

                    ),

                    const SizedBox(width:12),

                    Expanded(

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          const Text(

                            "Veg Burger",

                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize:18,
                            ),

                          ),

                          const SizedBox(height:5),

                          const Text(

                            "Delicious veg burger\nwith fresh veggies and cheese.",

                            style: TextStyle(
                              color: Colors.grey,
                              fontSize:12,
                            ),

                          ),

                          const SizedBox(height:5),

                          const Text(

                            "₹120",

                            style: TextStyle(
                              color: Colors.green,
                              fontWeight:
                              FontWeight.bold,
                            ),

                          ),

                        ],

                      ),

                    ),

                    PopupMenuButton(

                      itemBuilder:(context)=>const[

                        PopupMenuItem(
                          child: Row(
                            children:[
                              Icon(Icons.add,color:Colors.orange),
                              SizedBox(width:10),
                              Text("Add Cheese"),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          child: Row(
                            children:[
                              Icon(Icons.local_fire_department,color:Colors.red),
                              SizedBox(width:10),
                              Text("Extra Sauce"),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          child: Row(
                            children:[
                              Icon(Icons.info,color:Colors.green),
                              SizedBox(width:10),
                              Text("View Nutrition"),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          child: Row(
                            children:[
                              Icon(Icons.share,color:Colors.blue),
                              SizedBox(width:10),
                              Text("Share Item"),
                            ],
                          ),
                        ),

                      ],

                    ),

                  ],

                ),

              ),

            ),
                        const SizedBox(height: 20),

            // Quantity Heading
            const Text(
              "Quantity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Quantity Buttons
            Row(
              children: [

                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffEFE9FF),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.remove,
                        color: Colors.deepPurple),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                  ),
                ),

                const SizedBox(width: 20),

                Text(
                  "$quantity",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 20),

                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffEFE9FF),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add,
                        color: Colors.deepPurple),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: const Text(
                        "Order Placed Successfully!!",
                      ),
                      action: SnackBarAction(
                        label: "DISMISS",
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  );

                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Place Order"),
              ),
            ),

            const SizedBox(height: 10),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
                label: const Text("Save for Later"),
              ),
            ),

            // Clear Selection
            Center(
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    selectedCategory = "Burger";
                    quantity = 1;
                  });
                },
                icon: const Icon(Icons.delete_outline,
                    color: Colors.red),
                label: const Text(
                  "Clear Selection",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Order Button
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Order on iPhone Style",
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                icon: const Icon(Icons.apple),
                label:
                    const Text("Order on iPhone Style"),
              ),
            ),

            const SizedBox(height: 20),

            // Today's Special Card
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Text(
                  "🎉",
                  style: TextStyle(fontSize: 40),
                ),
                title: const Text(
                  "Today's Special",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Veg Burger\n₹99",
                ),
                trailing: CircleAvatar(
                  backgroundColor:
                      Colors.deepPurple.shade50,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}