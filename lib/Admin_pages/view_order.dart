import 'package:flutter/material.dart';

class ViewOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Orders'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Orders will be displayed here.'),
      ),
    );
  }
}
