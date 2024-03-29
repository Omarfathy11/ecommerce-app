import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
         return BlocConsumer<LayoutCubit, LayoutStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<LayoutCubit>(context);
              print(cubit.userModel);
              return Scaffold(
                
                body: cubit.userModel != null
                    ? Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: SizedBox(height: 150,width: 150,child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.network(cubit.userModel!.image!,)))),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Edit Your profile',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                    
                            TextFormField(
                              decoration: InputDecoration(
                                
                                  hintText: 'Full name',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  label: Text(cubit.userModel!.customer!.fullName!),
                                  prefixIcon: const Icon(LineAwesomeIcons.user)),
                            ),
                        //      Text(cubit.userModel!.full_name!),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  label: Text(cubit.userModel!.customer!.email!),
                                  prefixIcon:
                                      const Icon(LineAwesomeIcons.envelope_1)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'phone',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  label: Text(cubit.userModel!.customer!.phoneNumber!),
                                  prefixIcon: const Icon(LineAwesomeIcons.phone)),
                            ),
                          ],
                        ),
                    )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              );
            },
          );
      }
    
  }

