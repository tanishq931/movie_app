import 'package:flutter/material.dart';
import 'package:movie_app/UI/TextStyle.dart';

Widget Partition(String name){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(name,style: heading(),),
      Row(
        children: [
          Text('view all',style: heading(size: 14,color: Colors.blue),),
          Icon(Icons.arrow_right_alt,color: Colors.blue,)
        ],
      ),

    ],
  );
}