import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_screen.dart';
import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_cubit.dart';
import 'package:finalproject/screens/login_screen.dart';
import 'package:finalproject/shared/constants/constants.dart';
import 'package:finalproject/shared/network/local_network.dart';
import 'package:finalproject/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  token = await CacheNetwork.getCacheData(key: 'accesstoken');
  print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getUserData()
            ..getCategoriesData()
            ..getProductsData()
            
            ,
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        home:  token != null && token == " " ?  const LoginScreen() : const LayoutScreen()),
    );
  }
}
