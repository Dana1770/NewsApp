import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/MODULES/search/search.dart';
import 'package:news/shared/component.dart';


import '../../cubit.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class News extends StatelessWidget{
  const News({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return BlocConsumer<NewsCubit,  NewsStates>(
  listener: (context, state){ },
  builder: (context,state){
   return Scaffold(
  body: NewsCubit.get(context).screens[NewsCubit.get(context).currentIndex],
  drawer: Drawer(
    child: Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Column(
        children: [
          TextButton(onPressed: (){
            NewsCubit.get(context).changeBottomNavBar(0);
            Navigator.pop(context);

          }, child:
          Row(
            children: [
              const Icon(Icons.business),
              const SizedBox(width: 5,),
              Text("Business news",style: TextStyle(color:AppCubit.get(context).isDark?Colors.black:Colors.white,fontSize: 20),),
            ],
          )),
          const SizedBox(height: 20,),

          TextButton(onPressed: (){
            NewsCubit.get(context).changeBottomNavBar(1);
            Navigator.pop(context);
          }, child:
          Row(
            children: [
              const Icon(Icons.sports_baseball),
              const SizedBox(width: 5,),
              Text("Sports news",style: TextStyle(color:AppCubit.get(context).isDark?Colors.black:Colors.white,fontSize: 20),),
            ],
          )),
          const SizedBox(height: 20,),
          TextButton(onPressed: (){
            NewsCubit.get(context).changeBottomNavBar(2);
            Navigator.pop(context);

          }, child:
          Row(
            children: [
              const Icon(Icons.science),
              const SizedBox(width: 5,),
              Text("Science news",style: TextStyle(color:AppCubit.get(context).isDark?Colors.black:Colors.white,fontSize: 20),),
            ],
          )),

        ],
      ),
    ),
  ),

  appBar: AppBar(
  title: const Text("Exclusive News",),

  actions: [


    IconButton(onPressed: (){

     AppCubit.get(context).changeAppMode( );

    }, icon: const Icon(Icons.dark_mode,size: 20,),),
  IconButton(onPressed: (){
    navigateTo(context, Search());
  }, icon: const Icon(Icons.search,size: 20,),),




  ],



  ),


  bottomNavigationBar: BottomNavigationBar(
    currentIndex: NewsCubit.get(context).currentIndex,
    onTap: (index){NewsCubit.get(context).changeBottomNavBar(index);},
    items: NewsCubit.get(context).bottomNavigation,),

  );}
  );
    }
  }
//65f7f556ec76449fa7dc7c0069f040ca