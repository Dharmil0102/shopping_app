import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _categoryNameController = TextEditingController();
  final _categories = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Category',
           // Text color
        ),
        centerTitle: true,
         // App bar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch widgets horizontally
          children: [
            // Add space between app bar and content
            SizedBox(height: 20.0),

            // Category name text field with decoration
            TextField(
              controller: _categoryNameController,
              decoration: InputDecoration(
                labelText: 'Category Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                fillColor: Colors.white, // Background color for text field
                filled: true, // Fill the text field background
              ),
            ),
            SizedBox(height: 20.0),

            // Add Category button with rounded corners
            ElevatedButton(
              onPressed: () {
                String categoryName = _categoryNameController.text;
                // Add category logic here

                setState(() {
                  _categories.add(categoryName);
                  _categoryNameController.clear();
                });

                // Show a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Category added successfully!'),
                  ),
                );
              },
              child: Text('Add Category'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Fill available width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ), // Button color
                textStyle: TextStyle(color: Colors.white), // Button text color
              ),
            ),

            SizedBox(height: 20.0),

            // Display table of added categories (if any)
            if (_categories.isNotEmpty)
              Card(
                elevation: 5.0, // Add a shadow effect
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Category',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (String category in _categories)
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                child: Text(category),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
