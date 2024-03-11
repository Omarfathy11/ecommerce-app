import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavorietsScreen extends StatelessWidget {
  const FavorietsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(builder: ((context, state) {
      print(cubit.favorites.length);
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12.5),
          child: Column(
            children: [
              TextFormField(
                onChanged: (input) {},
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    suffixIcon: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavorietsScreen()),
                          );
                        },
                        child: const Icon(
                          Icons.clear,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    contentPadding: EdgeInsets.zero),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: cubit.favorites.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.network(
                                cubit.favorites[index].main_image!,
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
                                  Text(cubit.favorites[index].name!),
                                  Text(cubit.favorites[index].price!),
                                  MaterialButton(
                                    onPressed: () {
                                      cubit.deleteFavorite(
                                          productId: cubit.favorites[index].id
                                              .toString());
                                    },
                                    child: Text("Remove"),
                                    textColor: Colors.white,
                                    color: mainColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                  )
                                ],
                              ))
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ),
      );
      ;
    }), listener: (context, state) {
       {
      }
    });
  }
}
