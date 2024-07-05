import 'package:flutter/material.dart';
import 'package:shopping_app/Admin_pages/add_category.dart'; // Import AddCategoryPage (for future use)

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _productNameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            // Image selection (replace with your image picker implementation)
            ElevatedButton.icon(
              onPressed: () {
                // Implement image selection logic (e.g., using a package)
              },
              icon: Icon(Icons.image),
              label: Text('Select Image'),
            ),
            SizedBox(height: 20.0),

            // Product name text field
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Product price text field
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number, // For numeric input
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Add Product button
            ElevatedButton(
              onPressed: () {
                String productName = _productNameController.text;
                double price = double.parse(_priceController.text); // Parse price as double

                // Add product logic here (including image upload and saving to database)

                // Clear the text fields after adding
                _productNameController.clear();
                _priceController.clear();

                // Show a success message or navigate back (optional)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product added successfully!'),
                  ),
                );
              },
              child: Text('Add Product'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Fill the available width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
