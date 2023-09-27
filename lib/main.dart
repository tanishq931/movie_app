import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_app/Splash.dart';
import 'package:movie_app/auth/Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.red,fontFamily: 'Netflix',fontSize: 35,fontWeight: FontWeight.bold)
        ),
      ),

      home: Splash()
    );
  }
}
