import 'package:finalproject/layout/layout_screen.dart';
import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_cubit.dart';
import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_state.dart';
import 'package:finalproject/screens/register_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidden = true;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const LayoutScreen()));
        } else if (state is FailedToLoginState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  Center(
                      child:  Container(
                          height: 300,
                          width: 300,
                          child: Image.asset(
                              "images/Ecommerce campaign-rafiki.png"))),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (input) {
                      if (passwordController.text.isEmpty) {
                        return "email name must not be empyt";
                      } else {
                        return null;
                      }
                    },
                    
                    decoration: const InputDecoration(
                        hintText: "email", border: OutlineInputBorder()),
                  ),
             
                  const SizedBox(
                    height: 20,
                  ),
               
                  TextFormField(
                    controller: passwordController,
                    validator: (input) {
                      if (passwordController.text.isEmpty) {
                        return "password name must not be empyt";
                      } else {
                        return null;
                      }
                    },
                    obscureText: hidden ?? false,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidden = !hidden;
                              });
                            },
                            icon: hidden ? const Icon(Icons.visibility_off, color: Colors.red,) :const Icon(Icons.visibility, color: Colors.red,)),
                        hintText: "password",
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          // Register
                          BlocProvider.of<AuthCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      textColor: Colors.black,
                      color: Colors.redAccent,
                      minWidth: double.infinity,
                       child:  Text(
                        state is RegisterLoadingState ? "Loading ..." : "Login",
                        style: const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Do not have account ? ',
                          style: TextStyle(color: Colors.black)),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: const Text('Signup ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
