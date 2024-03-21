import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Column(
        children: const [
          Text('Cart', style: TextStyle(fontSize: 40),)
        ],
      ),
    );;
  }
}