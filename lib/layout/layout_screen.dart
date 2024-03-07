import 'package:finalproject/layout/layout_cubit/layout_cubit.dart';
import 'package:finalproject/layout/layout_cubit/layout_state.dart';
import 'package:finalproject/shared/style/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context); // عشام اوصل  للداتا
    return BlocConsumer<LayoutCubit, LayoutStates>(
              listener: (context,state){},

     
      builder: (context, state) {
        return Scaffold(appBar: AppBar(backgroundColor: thirdColor,title: Image.asset('images/Frame 928.png', height: 150,width: 150,),
        
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        currentIndex: cubit.buttomNavindex, // بيبقي واقف علي اول ايتم 
        onTap: ((index) {
          cubit.changeButtomNavIndex(index: index);
        }),
        items: 
        
        const[
           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ]
        ),
        body: cubit.LayoutScreens[cubit.buttomNavindex],
        
    );
  } 
    );
}
    
}
