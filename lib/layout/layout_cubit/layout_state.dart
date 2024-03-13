import 'package:finalproject/models/products_model.dart';

abstract class LayoutStates{} 

class LayoutInitialState extends LayoutStates{}
 class ChangeButtomNavIndexState extends LayoutStates{}

class GetUserDataSuccessState extends LayoutStates{}
class GetUserDataLoadingState extends LayoutStates{}
class FailedToGetUserDataState extends LayoutStates{
  String error;
  FailedToGetUserDataState({required this.error});
}



class GetCategotiesSuccessState extends LayoutStates{}
class GetCategotiessLoadingState extends LayoutStates{}
class FailedToGetCategotiesState extends LayoutStates{}


class GetProductsSuccessState extends LayoutStates{}
class GetProductsLoadingState extends LayoutStates{}
class FailedToGetProductsState extends LayoutStates{}


class GetProductDetailssSuccessState extends LayoutStates{
  final ProductModel model;

  GetProductDetailssSuccessState(this.model);
}
class GetProductsDetailsLoadingState extends LayoutStates{}
class FailedToGetProductsDetailsState extends LayoutStates{}


class filterproductSuccessState extends LayoutStates{}
class filtercategoriesSuccessState extends LayoutStates{}

class FavoritesInitial  extends LayoutStates {}


class FavoritesSuccess extends LayoutStates{}
class FavoritesLoaded extends LayoutStates {
  final List<dynamic> favorites;

  FavoritesLoaded(this.favorites);
}

class FavoritesaddSuccess extends LayoutStates{}

class FavoritesError extends LayoutStates {
  final String errorMessage;

  FavoritesError(this.errorMessage);
}

class FavoritesDeleted extends LayoutStates {}
