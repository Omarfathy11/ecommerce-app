class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  //double? price;
  int? quantity;
 

  // Nmaed constrcutor | refaatoring

  ProductModel.fromJson({required Map<String , dynamic> data}){
    id = data['id'].toInt();
    description = data['description'].toString();
    image = data['image'].toString();
    name = data['name'].toString();
  //  price = data['price'].toDouble();
    quantity = data['quantity'].toInt();
    

  }

}