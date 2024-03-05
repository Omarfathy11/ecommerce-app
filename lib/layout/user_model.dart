import 'package:flutter/material.dart';


class UserModel {
  String? full_name;
  String? email;
  String? phone_number;
  int? id;
  // constrcutor
  UserModel({this.id, this.full_name, this.email, this.phone_number});

  // named constrcutor
  UserModel.fromjson({required Map<String, dynamic> data}){
       // Refactoring map/json
       full_name  = data['full_name'];
       email  = data['email'];
       phone_number  = data['phone_number'];
       id = data['id'];

  }


  // to map 
  Map<String, dynamic> toMap(){
    return {
      'name' : full_name,
      'email' : email,
      'phone_number' : phone_number,

    };
  }

}
/*
class UserModel {
  String? full_name;
  String? email;
  String? phone_number;
  int? id;
  // constrcutor
  UserModel({this.id, this.full_name, this.email, this.phone_number});

  // named constrcutor
  UserModel.fromjson({required Map<String, dynamic> data}){
       // Refactoring map/json
       full_name  = data['full_name'];
       email  = data['email'];
       phone_number  = data['phone_number'];
       id = data['id'];

  }


  // to map 
  Map<String, dynamic> toMap(){
    return {
      'full_name' : full_name,
      'email' : email,
      'phone_number' : phone_number,

    };
  }

}
*/
