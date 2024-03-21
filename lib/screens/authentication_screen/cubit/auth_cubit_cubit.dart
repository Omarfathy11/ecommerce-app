import 'dart:convert';

import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_state.dart';
import 'package:finalproject/shared/network/local_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';


class AuthCubit extends Cubit<AuthStates>{
  AuthCubit() : super(AuthInitialState());



  // Todo: API URL => https://student.valuxapps.com/api/
  // Todo: Register endpoint => register
  void register(
      {required String email,
      required String full_name,
      required String phone_number,
      required String password}) async {
    emit(RegisterLoadingState());

    Response response = await http.post(
      // request Url = base url + method url ( endpoint ) = https://student.valuxapps.com + /api/register
      Uri.parse(
          'https://django-server-kiaw-production.up.railway.app/customers/signup/'),
      body: {
        'full_name': full_name,
        'email': email,
        'password': password,
        'phone_number': phone_number,
      },
    );
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);

      
        emit(RegisterSuccessState());
     
    }
  }

  // Account : mo.ha@gmail.com , password : 123456
  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
     
      Response response = await http.post(
        // request => url = base url + method url
        Uri.parse(
            'https://django-server-kiaw-production.up.railway.app/customers/login/'),
        body: {'email_or_phone': email, 'password': password},
      );
      if (response.statusCode == 200) {
              var responseData = jsonDecode(response.body);
              print(responseData);

              var accessToken = responseData['access'];
  
              await CacheNetwork.insertToCache(key: 'accesstoken', value: accessToken);

        emit(LoginSuccessState());
      }
    
  }
}

