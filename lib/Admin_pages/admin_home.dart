import 'package:flutter/material.dart';
import 'package:shopping_app/Admin_pages/add_category.dart'; 
import 'package:shopping_app/Admin_pages/add_product.dart';
import 'package:shopping_app/Admin_pages/view_order.dart';// Import AddCategoryPage

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add Product button (implementation required)
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Add Product page (your implementation)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Add Product'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 20.0),

            // Add Category button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCategoryPage()),
                );
              },
              icon: Icon(Icons.category),
              label: Text('Add Category'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 20.0),

            // View Orders button (implementation required)
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to View Orders page (your implementation)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewOrdersPage()),
                );
              },
              icon: Icon(Icons.list),
              label: Text('View Orders'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
