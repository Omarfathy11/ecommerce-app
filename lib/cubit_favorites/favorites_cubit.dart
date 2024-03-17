import 'dart:convert';
import 'package:finalproject/cubit_favorites/favorites_state.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/models/products_model.dart';
import 'package:finalproject/shared/constants/constants.dart';
import 'package:http/http.dart%20';
import 'package:meta/meta.dart';


class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());


   List<ProductModel> favorites = [];

Future<void> getFavorites() async {
  emit(FavoritesLoadnigState());
  try {
    favorites.clear();

    Response response = await http.get(
      Uri.parse("https://django-server-kiaw-production.up.railway.app/whishlists/my-whishlist/"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        'Authorization': 'Bearer $token'
      },
    );
    var responseBody = jsonDecode(response.body);
    print(responseBody);

    if (response.statusCode == 200) {
      for (var item in responseBody) {
        favorites.add(ProductModel.fromJson(data: item['product']));
      }

      print("favorites number is: ${favorites.length}");
      emit(FavoritesSuccessState(favorites));
    } else {
      emit(FavoritesErrorState());
    }
  } catch (error) {
    print('Error: $error');
  }
}

  void addFavorites({required String productId}) async {
    Response response = await http.post(
        Uri.parse(
            "https://django-server-kiaw-production.up.railway.app/whishlists/my-whishlist/"),
        headers: {'Authorization': 'Bearer $token'},
        body: {"product_id": productId});
    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      emit(FavoritesaddSuccess());
    } else {
      emit(FavoritesError('Failed to fetch favorites'));
    }
  }
  void deleteFavorite({required String productId}) async {
    emit(FavoritesLoadingDeleted());
    Response response = await http.delete(
        Uri.parse(
            "https://django-server-kiaw-production.up.railway.app/whishlists/my-whishlist/"),
        headers: {'Authorization': 'Bearer $token'},
        body: {"product_id": productId});

    if (response.statusCode == 200) {
        
      emit(FavoritesDeleted());
      await getFavorites();
    
    } else {
      emit(FavoritesError('Failed to delete favorite'));
    }
  }
}

