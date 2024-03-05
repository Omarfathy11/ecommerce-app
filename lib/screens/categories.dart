import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Column(
        children:const [
          Text('Categories', style: TextStyle(fontSize: 40),)
        ],
      ),
    );
  }
}