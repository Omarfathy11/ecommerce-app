import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/models/products_model.dart';
import 'package:finalproject/screens/details_screen.dart';
import 'package:finalproject/shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  final pagecotroller = PageController();
  final ProductModel? productModel;
  final int? productId;
  Homepage({
    super.key, this.productModel,  this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        print(cubit.products.length);
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                onChanged: (input) {
                  cubit.filterProducts(input: input);
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.clear),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    contentPadding: EdgeInsets.zero),
              ),
              const SizedBox(
                height: 14,
              ),
              cubit.banners.isEmpty
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: PageView.builder(
                          controller: pagecotroller,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Image.network(
                                cubit.banners[index].url!,
                                fit: BoxFit.fill,
                              ),
                            );
                          }),
                    ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: pagecotroller,
                  count: 5,
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                      spacing: 8.0,
                      radius: 25,
                      dotWidth: 24.0,
                      dotHeight: 16.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: secondColor),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "categories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: secondColor),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              cubit.categories.isEmpty
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.categories.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: ((context, index) {
                            return const SizedBox(
                              width: 15,
                            );
                          }),
                          itemBuilder: (context, index) {
                            return Text(
                              cubit.categories[index].name!,
                              style: TextStyle(fontSize: 20),
                            );
                          }),
                    ),
              Row(
                children: const [
                  Text(
                    "Products",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                ],
              ),
              cubit.products.isEmpty
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                 productId: productId, productModel: productModel,),
                          ),
                        );
                      },
                      child: GridView.builder(
                          itemCount: cubit.filteredProducts.isEmpty
                              ? cubit.products.length
                              : cubit.filteredProducts.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return _productItem(
                                model: cubit.filteredProducts.isEmpty
                                    ? cubit.products[index]
                                    : cubit.filteredProducts[index]);
                          }),
                    ),
            ],
          ),
        ));
      },
    );
  }
}

Widget _productItem({required ProductModel model}) {
  return Container(
    height: 200,
    color: Colors.grey.withOpacity(0.2),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Column(
      children: [
        Expanded(
            child: Image.network(
          model.image!,
          fit: BoxFit.fill,
        )),
        Text(
          model.name!,
          style: const TextStyle(
              fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Row(
              children: [
                Text(
                  "${model.quantity!} \$",
                  style: const TextStyle(fontSize: 13),
                ),
                Text(
                  "${model.quantity!}  ",
                  style: const TextStyle(
                      fontSize: 13, overflow: TextOverflow.ellipsis),
                ),
              ],
            )),
            GestureDetector(
              child: const Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 20,
              ),
              onTap: () {},
            )
          ],
        ),
        Text(
          model.description!,
          style: const TextStyle(fontSize: 5),
        )
      ],
    ),
  );
}
