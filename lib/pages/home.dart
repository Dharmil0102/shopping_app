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
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        title: Text(
          'My Shop',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            ),
          ),
        ],
        backgroundColor: Colors.blue, // Add a blue app bar
      ),
      body: SingleChildScrollView( // Allow scrolling for long content
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Darker text for better contrast
                      ),
                    ),
                   
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0), // Circular profile image
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
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
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
                  'Categories',
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

            // All Products section
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All products',
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

            // Display products in a grid
            Container(
              child: GridView.count(
                shrinkWrap: true, // Wrap GridView content to avoid overflow
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ], // Add subtle shadow for depth
      ),
      child: Column(
        children: [
          // Product image placeholder
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
            child: Container(
              height: 120.0, // Adjust image height as needed
              width: double.infinity,
              child: product.imageUrl.isEmpty
                  ? Center(
                      child: Icon(Icons.image, size: 50.0, color: Colors.grey[200]),
                    )
                  : Image.network(
                      product.imageUrl, // Use network image if available
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Center(child: Icon(Icons.error)), // Display error icon
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
                  style: TextStyle(color: Colors.blue),
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

// Cart Page (assuming a separate class for CartPage)
class CartPage extends StatelessWidget {
  // Add logic to manage cart items here (e.g., displaying them, handling removal)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Center(
        child: Text(
          "Your cart is empty.",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
