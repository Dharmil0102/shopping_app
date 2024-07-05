import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = ['Electronics', 'Fashion', 'Home'];
  final List<Product> products = [
    Product(name: "Product 1", imageUrl: "", price: 10.0),
    Product(name: "Product 2", imageUrl: "", price: 20.0),
    // ... Add more product data (name, price)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting and profile section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey, Dharmil",
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Good Morning",
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "images/profile.jpg", // Replace with your asset path
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),

            // Search bar
            Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Product",
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Categories section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {}, // Add functionality for "See all"
                  child: Row(
                    children: [
                      Text(
                        "See all",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.arrow_right_rounded,
                        color: Colors.blue,
                        size: 18.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => createCategoryTile(categories[index]),
              ),
            ),

            // All products section
            SizedBox(height: 20.0),
            Text(
              "All Products",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),

            // Display products in a grid
            Container(
              height: 300.0, // Adjust height as needed
              child: GridView.count(
                crossAxisCount: 2, // Two products per row
                childAspectRatio: 0.7, // Adjust aspect ratio for product display
                mainAxisSpacing: 10,
                                crossAxisSpacing: 10.0, // Spacing between products
                children: products.map((product) => createProductCard(product)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createCategoryTile(String category) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: () {}, // Add functionality for category tile press
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Container(
              height: 5.0,
              width: 20.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget createProductCard(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          // Product image placeholder
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
            child: Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.grey[200], // Placeholder color
              child: Center(
                child: Icon(Icons.image, size: 50.0, color: Colors.black26), // Placeholder icon
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product name
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                // Product price
                Text(
                  "\$${product.price}",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10.0),
                // Add to cart button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add product to cart logic here (optional)
                      },
                      child: Icon(Icons.add, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Product class (optional, if you want more structured product data)
class Product {
  final String name;
  final String imageUrl; // Assuming image URL property
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

