import 'package:finalproject/layout/layout_screen.dart';
import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_cubit.dart';
import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_state.dart';
import 'package:finalproject/screens/homepage.dart';
import 'package:finalproject/screens/login_screen.dart';
import 'package:finalproject/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey =  GlobalKey<FormState>();
   RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {

        if(state is RegisterSuccessState){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LayoutScreen()));
        }
        else if (state is FailedToRegisterState){
          showDialog(context: context, builder: (context) => AlertDialog(
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formkey,
            
              child: ListView(
              children: [
                  Center(child: Container(height: 300,width: 300,child: Image.asset("images/Ecommerce campaign-rafiki.png"))),
                 const Text("create an account", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 20,),

                 const Text("Enter your details below", style: TextStyle(fontSize: 15),),
                 const SizedBox(height: 20,),
                _textFielditem(controller: nameController, hintText: "User name"),
                const SizedBox(height: 20,),
                _textFielditem(controller: emailController, hintText: "email"),
                const SizedBox(height: 20,),
                _textFielditem(controller: phoneController, hintText: "phone"),
                const SizedBox(height: 20,),
                _textFielditem (isScure : true,controller: passwordController, hintText: "Password"),
                const SizedBox(height: 20,),
                Center(
                  child: MaterialButton(onPressed: (){

                   if(formkey.currentState!.validate()){
                    // Register
                    BlocProvider.of<AuthCubit>(context).register(full_name: nameController.text, email: emailController.text, password: passwordController.text, phone_number: phoneController.text);
                   } 
                  },
                   child:  Text(state is RegisterLoadingState ? "Loading ..." :  "create account", style: TextStyle(fontSize: 17,color: Colors.black),),
                   padding: const EdgeInsets.symmetric(vertical: 15.0),
                   textColor: Colors.black,
                  color: Colors.redAccent,
                  minWidth: double.infinity,
                  ),
                ),
              const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            const Text('Already have an account? ',style: TextStyle(color: Colors.black)),
                            const SizedBox(width: 4,),
                            InkWell(
                              onTap: ()
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              },
                              child: const Text('login ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                  
                            ),
                           
                          ],
                          
                        ),
                SizedBox(height: 20,),
              ],),
            ),
          ),
        );
      },
    )
    ;
  }
}
Widget _textFielditem({bool? isScure  ,required TextEditingController controller, required String hintText}){
  return  TextFormField(
                controller: controller,
                validator: (input) {
                  if (controller.text.isEmpty){
                    return "$hintText name must not be empyt";
                  }
                  else{
                    return null;
                  }
                },
                obscureText: isScure ?? false,
                  decoration:  InputDecoration(
                    hintText: hintText,
                    border: OutlineInputBorder()
                  ),
               )
;
}