import 'package:flutter/material.dart';
import 'package:movie_app/UI/TextStyle.dart';

Widget Partition(String name,{VoidCallback? onPressed}){
  return Column(
    children: [
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,style: heading(),),
          InkWell(
            onTap: onPressed,
            child: Text('  view all',style: heading(size: 14,color: Colors.blue),),
          ),


        ],
      ),
      SizedBox(height: 10),
    ],
  );
}