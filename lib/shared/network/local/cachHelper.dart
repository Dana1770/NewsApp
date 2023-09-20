/*
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cach_helper{
  static SharedPreferences? sharesPerferecces;
  static init()async{
    sharesPerferecces=await SharedPreferences.getInstance();
  }
  static Future<dynamic> PutBool({
      required String key,
      required bool val,
  }
      )async{
    return await sharesPerferecces?.setBool(key,val);
  }

  static dynamic GetBool({
    required String key,
  }
      ){
    return  sharesPerferecces!.getBool(key);
  }

}*/
