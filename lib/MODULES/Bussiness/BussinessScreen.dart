import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/component.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget{
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (BuildContext context, NewsStates state) {
        var list=NewsCubit.get(context).business;
        return articleBuilder(list,context);
        },
      listener: (BuildContext context, NewsStates state) {},
    );}

}