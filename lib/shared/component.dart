import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/MODULES/WebView/WebView.dart';
Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

              borderRadius:BorderRadius.circular(10) ,

              image: DecorationImage(

                image: NetworkImage("${article['urlToImage']}",),fit: BoxFit.cover,

              )

          ),

          //  child: ,

        ),

        const SizedBox(width: 20,),

        Expanded(

          child: SizedBox(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(child: Text("${article['title']}",

                  style:Theme.of(context).textTheme.bodyLarge,

                ),),

                Text("${article['publishedAt']}",style: const TextStyle(color:Colors.grey),),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
Widget mydivider()=>Padding(padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],


  ),
);
Widget articleBuilder(list,context,{isSearch=false})=>ConditionalBuilder(
  condition:list.length>0,
  builder: (context)=>ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=>mydivider(),
      itemCount: 20),
  fallback:(context)=>isSearch?Container():const Center(child: CircularProgressIndicator()),

);
void navigateTo (
    BuildContext context,
    Widget w,
    )=>Navigator.push(context, MaterialPageRoute(builder: (context)=>w));