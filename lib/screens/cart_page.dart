import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(color: Theme.of(context).accentColor),
          ),
      ),
    );
  }
}