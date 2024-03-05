import 'dart:convert';

import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/layout/user_model.dart';
import 'package:finalproject/models/banner_model.dart';
import 'package:finalproject/models/categories.dart';
import 'package:finalproject/models/products_model.dart';
import 'package:finalproject/screens/cart.dart';
import 'package:finalproject/screens/categories.dart';
import 'package:finalproject/screens/favoriets.dart';
import 'package:finalproject/screens/homepage.dart';
import 'package:finalproject/screens/profile_screen/profile_screen.dart';
import 'package:finalproject/shared/constants/constants.dart';
import 'package:finalproject/shared/network/local_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  int buttomNavindex = 0;
  List<Widget>  LayoutScreens = [
    Homepage(),
    const CategoriesScreen(),
    const FavorietsScreen(),
    const CartScreen(),
    const ProfileScreen()
  ]; // لازم بالترتيب

  void changeButtomNavIndex({required int index}) {
    buttomNavindex = index;
    // Emit state
    emit(ChangeButtomNavIndexState());
  }

  UserModel? userModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());

    try {
      Response response = await http.get(
        Uri.parse(
            "https://django-server-kiaw-production.up.railway.app/customers/profiles/"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          'Authorization': 'Bearer $token',
        },
      );
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        userModel = UserModel.fromjson(data: responseBody[0]['customer']);

      //  print("response is : $responseBody");

        // print(userModel!.email);

        emit(GetUserDataSuccessState());
      }
    } catch (e) {
      // Handle exceptions
      print("Error fetching user data: $e");
    }
  }

  List<BannerModel> banners = [];
  void getBannersData() async {
    Response response =
        await http.get(Uri.parse("https://student.valuxapps.com/api/banners"));
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(GetBannersSuccessState());
    } else {
      emit(FailedToGetBannersState());
    }
  }

  List<CategoriesModel> categories = [];
  void getCategoriesData() async {
    Response response = await http.get(Uri.parse(
        'https://django-server-kiaw-production.up.railway.app/api/home/'));
    final responseBody = jsonDecode(response.body);
    print("response is  $responseBody");

    if (response.statusCode == 200) {
      for (var item in responseBody['categories']) {
        categories.add(CategoriesModel.fromJson(data: item));
      }
      emit(GetCategotiesSuccessState());
    } else {
      emit(FailedToGetCategotiesState());
    }
  }

  List<ProductModel> products = [];
  void getProductsData() async {
    emit(GetProductsLoadingState());
    Response response = await http.get(
      Uri.parse(
          'https://django-server-kiaw-production.up.railway.app/api/products/'),
    );
    var responseBody = jsonDecode(response.body);
    print(" products data id : $responseBody");
    if (response.statusCode == 200) {
      for (var item in responseBody) {
        products.add(ProductModel.fromJson(data: item));
        emit(GetProductsSuccessState());
      }
    } else {
      emit(FailedToGetProductsState());
    }
  }

  List<ProductModel> filteredProducts = [];
  void filterProducts({required String input}) {
    filteredProducts = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(filterproductSuccessState());
  }
  
 
  void getproductDetails({int? productid}) async {
        emit(GetProductsDetailsLoadingState());

    Response response = await http.get(Uri.parse(
        'https://django-server-kiaw-production.up.railway.app/api/products/$productid'));
    var responseBody = jsonDecode(response.body);
    print(" details : $responseBody");
    if (response.statusCode == 200) {
      emit(GetProductDetailssSuccessState());
    } else {
      emit(FailedToGetProductsDetailsState());
    }
  }
}
