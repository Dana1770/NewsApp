import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/news_layout/news.dart';
import 'package:news/shared/bloc_observer.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/network/local/cachHelper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';
import 'package:news/states.dart';


import 'cubit.dart';

void main()
{
  //WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  DioHelper.init();
// cach_helper.init();
//bool isDark=cach_helper.GetBool(key:'isDark');

  //Bloc.observer=MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSport()..getScience(),),
          BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSport()..getScience(),),


        ],
        child: BlocProvider(
        create: (context)=>AppCubit()..changeAppMode(),
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state) {  },
          builder: (context,state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.purple,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurple[300],
                ),
                drawerTheme: DrawerThemeData(

                  width: 200,
                  backgroundColor: Colors.deepPurpleAccent.shade100,
                ),


                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                  backgroundColor:Colors.white,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:Colors.white ,
                    statusBarIconBrightness:Brightness.dark ,

                  ),
                ),
                bottomNavigationBarTheme:BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  unselectedItemColor: Colors.grey,
                  elevation: 25,
                  backgroundColor:Colors.white ,

                ) ,
                textTheme:TextTheme(

                    bodyLarge: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,

                    )

                ) ,

              ),
             themeMode: (AppCubit.get(context).isDark) ? ThemeMode.dark:ThemeMode.light,
              darkTheme: ThemeData(

                primarySwatch: Colors.purple,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurple[300],
                ),
                drawerTheme: DrawerThemeData(
                  width: 200,
                  backgroundColor: Colors.deepPurpleAccent.shade100,
                ),
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                  backgroundColor:HexColor('333739'),
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:HexColor('333739') ,
                    statusBarIconBrightness:Brightness.light ,

                  ),
                ),
                bottomNavigationBarTheme:BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  unselectedItemColor: Colors.grey,
                  elevation: 25,
                  backgroundColor: HexColor('333739'),

                ) ,
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme:TextTheme(
                    bodyLarge: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    )
                ) ,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              home: Directionality(

                  textDirection: TextDirection.ltr,
                  child: News()),

        );
          },


        ),
    ),
      );
  }

}

