import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/models/products_model.dart';
import 'package:finalproject/shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavorietsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => LayoutCubit()..getFavorites(),
        child: BlocBuilder<LayoutCubit, LayoutStates>(
        
          builder: (context, state) {
        if (state is FavoritesInitial ) {
          return Center(child: CircularProgressIndicator());
        } else
            if (state is FavoritesLoadedState) {
              final favorites = state.favorites;
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final favorite = favorites[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.network(
                          favorites[index].main_image!,
                          height: 100,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(favorites[index].name!),
                            Text(favorites[index].price!),
                            MaterialButton(
                              onPressed: () {
                                  BlocProvider.of<LayoutCubit>(context)
                            .deleteFavorite( productId: favorites[index].id.toString());
                              },
                              child: Text("Remove"),
                              textColor: Colors.white,
                              color: mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)),
                            )
                          ],
                        ))
                      ],
                    ),
                  );
                },
              );
            } else {
             return Scaffold(
      body: BlocProvider(
        create: (context) => LayoutCubit()..getFavorites(),
        child: BlocBuilder<LayoutCubit, LayoutStates>(
        
          builder: (context, state) {
        if (state is FavoritesInitial ) {
          return Center(child: CircularProgressIndicator());
        } else
            if (state is FavoritesLoadedState) {
              final favorites = state.favorites;
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final favorite = favorites[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.network(
                          favorites[index].main_image!,
                          height: 100,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(favorites[index].name!),
                            Text(favorites[index].price!),
                            MaterialButton(
                              onPressed: () {
                                  BlocProvider.of<LayoutCubit>(context)
                            .deleteFavorite( productId: favorites[index].id.toString());
                              },
                              child: Text("Remove"),
                              textColor: Colors.white,
                              color: mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)),
                            )
                          ],
                        ))
                      ],
                    ),
                  );
                },
              );
            } else {
              return  const Center(
                      child: CupertinoActivityIndicator(),
                    );
            }
          },
        ),
      ),
    );
  }})));
            }
          }

