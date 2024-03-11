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

class GetFavorietsSuccessState extends LayoutStates{}
class FailedToGetFavorietsState extends LayoutStates{}

class AddFavorietsSuccessState extends LayoutStates{}

class AddFavorietsFailedState extends LayoutStates{}

class RemoveFavorietsSuccessState extends LayoutStates{}
class RemoveFavorietsFailedState extends LayoutStates{}
