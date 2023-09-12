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
            child: Container(

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)

              ),
              child: Row(
                children: [
                  Text('  view all',style: heading(size: 14),),
                  Icon(Icons.arrow_right_alt,color: Colors.white)
                ],
              ),
            ),
          ),

        ],
      ),
      SizedBox(height: 10),
    ],
  );
}