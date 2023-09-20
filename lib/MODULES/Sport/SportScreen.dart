import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SportsScreen extends StatelessWidget{
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list=NewsCubit.get(context).sports;
    // TODO: implement build
    return BlocConsumer<NewsCubit,NewsStates>(
    builder: (BuildContext context, NewsStates state) {
      return articleBuilder(list,context);
    },
    listener: (BuildContext context, NewsStates state) {},
    );
  }
  
}