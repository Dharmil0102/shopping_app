import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Replace with your logic to manage cart items (quantity, price, etc.)
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty.",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1.0,
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        item['image'],
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '\$${item['price']}',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Quantity: ${item['quantity']}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(width: 10.0),
                                // Add buttons to increase/decrease quantity or remove item
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {}, // Implement logic to decrease quantity
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {}, // Implement logic to increase quantity
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {}, // Implement logic to remove item from cart
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$ ${calculateTotal()}', // Replace with logic to calculate total price
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {}, // Implement checkout logic
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Replace with your logic to calculate total price based on cart items
  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
}
