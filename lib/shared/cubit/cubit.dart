import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/MODULES/Bussiness/BussinessScreen.dart';
import 'package:news/MODULES/Sport/SportScreen.dart';
import 'package:news/MODULES/science/ScienceScreen.dart';
import 'package:news/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';
class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(InitialState());
static NewsCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;

List<BottomNavigationBarItem>bottomNavigation=[
  const BottomNavigationBarItem(icon: Icon(Icons.business),label: "Business"),
  const BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
  const BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),
 // BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
];
List<Widget>screens=[
const BusinessScreen(),
const SportsScreen(),
const ScienceScreen(),
  //Setting()
];
void changeBottomNavBar(int index){
currentIndex=index;
if(index==1) {
  getSport();
}
if(index==2) {
  getScience();
}
emit(ButtonNavigatorBar());

}
List<dynamic>business=[];
List<dynamic>sports=[];
List<dynamic>science=[];
List<dynamic>search=[];
void getBusiness(){
  emit(NewsGetBusinessLoadingState());
  if(business.isEmpty){

    DioHelper.Get_data(url:'https://newsapi.org/v2/top-headlines', query: {
      'country':'us',
      'category':'business',
      'apiKey':'e7a26be97d0742ea9de960846a050208',

    }).then((value) {
      //  print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });

  }
  else{
    emit(NewsGetBusinessSuccessState());
  }

}
void getSport(){
  emit(NewsGetSportsLoadingState());
  if(sports.isEmpty){

    DioHelper.Get_data(url: 'v2/top-headlines', query: {
      'country':'us',
      'category':'sports',
      'apiKey':'e7a26be97d0742ea9de960846a050208',

    }).then((value) {
      //  print(value.data['articles'][0]['title']);
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }
  else{
    emit(NewsGetSportsSuccessState());
  }

  }
  void getScience(){
    emit(NewsGetScienceLoadingState());
  if(science.isEmpty){

    DioHelper.Get_data(url: 'v2/top-headlines', query: {
      'country':'us',
      'category':'science',
      'apiKey':'e7a26be97d0742ea9de960846a050208',

    }).then((value) {
      //  print(value.data['articles'][0]['title']);
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }
  else{
    emit(NewsGetScienceSuccessState());
  }

  }
  void getSearch(String val){
    emit(NewsGetSearchLoadingState());
    search=[];

      DioHelper.Get_data(url: 'v2/everything', query: {
        'q':val,

        'apiKey':'e7a26be97d0742ea9de960846a050208',

      }).then((value) {
        //  print(value.data['articles'][0]['title']);
        search=value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessState());

      }).catchError((error){
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });





  }




}