import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int? productId;
  final ProductModel? productModel;

  ProductDetailsScreen({required this.productId, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
                  final cubit = BlocProvider.of<LayoutCubit>(context);

          return  Column(
                    children: [
                      Image.network(productModel!.image!),
                      Text(productModel!.name!),
                      Text(productModel!.description!),
                                          // Add more information as needed
                    ],
                  );
        },
      ),
    );
  }
}
