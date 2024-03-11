import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

   ProductDetailsScreen({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
      ),
      body: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
           final cubit = BlocProvider.of<LayoutCubit>(context);

          return ListView(
            children: [
              Image.network(
                productModel.image!,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                productModel.name!,
                style: const TextStyle(fontSize: 20),
              )),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text("description ",
                    style: TextStyle(fontSize: 20, color: Colors.brown)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(productModel.description!,
                    style: const TextStyle(fontSize: 14)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    const Text(
                      "Price : ",
                      style: TextStyle(fontSize: 16, color: Colors.brown),
                    ),
                    Text(
                      productModel.price!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                  
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
