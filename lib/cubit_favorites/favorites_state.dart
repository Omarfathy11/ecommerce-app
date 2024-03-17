
import 'package:finalproject/models/products_model.dart';

abstract class FavoritesState {}

 class FavoritesInitial extends FavoritesState {}
 


class FavoritesLoadnigState extends FavoritesState{}
class  FavoritesSuccessState extends FavoritesState {
  final List<ProductModel> favorites;

  FavoritesSuccessState(this.favorites);
}
class FavoritesErrorState extends FavoritesState{}
class FavoritesErrorStatError extends FavoritesState{}


class FavoritesaddSuccess extends FavoritesState{}

class FavoritesError extends FavoritesState {
  final String errorMessage;

  FavoritesError(this.errorMessage);
}
class FavoritesLoadingDeleted extends FavoritesState {}
class FavoritesDeleted extends FavoritesState {
 
}
