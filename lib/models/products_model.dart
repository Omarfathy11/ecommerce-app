class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  String? main_image;
 

  // Nmaed constrcutor | refaatoring

  ProductModel.fromJson({required Map<String , dynamic> data}){
    id = data['id'].toInt();
    description = data['description'].toString();
    image = data['image'].toString();
    main_image = data['main_image'].toString();
    name = data['name'].toString();
    price = data['price'].toString();
    

  }

}