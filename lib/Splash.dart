
import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/HomeScreen.dart';
import 'package:movie_app/UI/TextStyle.dart';
import 'package:movie_app/auth/Login.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var list=[
    "चलो, फिल्मों की दुनिया में सफर करें, रेटिंग्स के साथ",
    "फिल्मी जगह जहाँ रेटिंग्स बोलती हैं",
    "आपकी पसंद, हमारी रेटिंग्स",
    "सिनेमा की दुनिया, हमारी रेटिंग्स के साथ",
    "फिल्मों की भरमार, हर रेटिंग की गरमागरम खबर",
    'देखो रेटिंग्स, बनाओ फैसला',
    'रेटिंग्स से देखो, फिल्म का असली रंग',
    'रेटिंग्स नहीं हैं अदालत, बस सिनेमा की वास्तविकता की बात',
    'जुजारी नहीं, रेटिंग्स से चुनो अपनी फ़िल्म',
    'फिल्म विचार का नया आयाम, रेटिंग्स की दृष्टि से'
  ];
  FirebaseAuth auth = FirebaseAuth.instance;
  late Animation animation;
  late AnimationController controller;
  int index=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index=choose();
    var user=auth.currentUser;
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    controller.addListener(() {
      setState(() {

      });
    });
    controller.forward();
    Timer(Duration(seconds: 4),(){
      if(user!=null){
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context)=>HomeScreen()));
      }
      else{
        Navigator.pushReplacement(
            context,MaterialPageRoute(
            builder: (context)=>MyLogin()));
      }
    });

  }
  int choose(){
    return Random().nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Cine Samachaar',style: TextStyle(fontFamily:'Splash',fontSize: 50.0*controller.value,color: Colors.red)),
                  SizedBox(height: 50,),
                  Text(list[index],style: title(size: 20.0*controller.value),maxLines: 2,)
                ],

              ),
            )) ),
    );
  }
}
