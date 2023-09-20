import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit.dart';
import 'package:news/shared/component.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';

class Search extends StatelessWidget{

  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

   return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
     builder: (context,state){
       var list=NewsCubit.get(context).search;
       return Scaffold(
         appBar: AppBar(),
         body: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 10.0,right: 25,left: 25),
               child: TextFormField(
                 onChanged: (val){
NewsCubit.get(context).getSearch(val);
                 },
                 style: TextStyle(color: AppCubit.get(context).isDark?Colors.white:Colors.black),
                 controller:searchController ,
                 keyboardType: TextInputType.text,
                 validator: (val){
                   if(val!.isEmpty){
                     return 'Search must not be empty';
                   }
                   return null;
                 },
                 decoration: const InputDecoration(
                   contentPadding: EdgeInsets.all(10),
                   border: OutlineInputBorder(),
                   label: Text('Search',style: TextStyle(fontSize: 15),),
                    prefix: Icon(Icons.search,size: 20,),
                 ),
               ),
             ),
             Expanded(
                 child: articleBuilder(list, context,isSearch: true)),
           ],
         ),
       );
     }
   );
  }

}

