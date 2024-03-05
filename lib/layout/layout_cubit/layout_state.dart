abstract class LayoutStates{} 

class LayoutInitialState extends LayoutStates{}
 class ChangeButtomNavIndexState extends LayoutStates{}

class GetUserDataSuccessState extends LayoutStates{}
class GetUserDataLoadingState extends LayoutStates{}
class FailedToGetUserDataState extends LayoutStates{
  String error;
  FailedToGetUserDataState({required this.error});
}
class GetBannersSuccessState extends LayoutStates{}
class GetBannersLoadingState extends LayoutStates{}
class FailedToGetBannersState extends LayoutStates{}


class GetCategotiesSuccessState extends LayoutStates{}
class GetCategotiessLoadingState extends LayoutStates{}
class FailedToGetCategotiesState extends LayoutStates{}


class GetProductsSuccessState extends LayoutStates{}
class GetProductsLoadingState extends LayoutStates{}
class FailedToGetProductsState extends LayoutStates{}


class GetProductDetailssSuccessState extends LayoutStates{}
class GetProductsDetailsLoadingState extends LayoutStates{}
class FailedToGetProductsDetailsState extends LayoutStates{}


class filterproductSuccessState extends LayoutStates{}