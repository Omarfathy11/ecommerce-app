
import 'package:finalproject/screens/login_screen.dart';
import 'package:finalproject/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    
    Future.delayed(Duration(seconds: 4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
    } );  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Image.asset("images/full-shot-woman-online-fashion-shopping.jpg", fit: BoxFit.cover, height: 800,width: 800,),
          
        ],
      ),
    );
  }
}