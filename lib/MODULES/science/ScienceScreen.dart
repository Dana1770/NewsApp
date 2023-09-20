import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget{
  const ScienceScreen({super.key});

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    var list=NewsCubit.get(context).science;
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (BuildContext context, NewsStates state) {

        return articleBuilder(list,context);
      },
      listener: (BuildContext context, NewsStates state) {},
    );
  }
  
}