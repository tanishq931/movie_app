import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/Screens/Main_Screen.dart';
import 'package:movie_app/UI/TextStyle.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _Screens=[
    Main_Screen(),
    Center(child: Icon(Icons.search,color: Colors.white,),),
    Center(child: Icon(Icons.menu,color: Colors.white,),),
  ];
  int _currindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cine Samachaar'),
        centerTitle: true,
      ),
      body: _Screens[_currindex],
      backgroundColor: Colors.black,
      bottomNavigationBar: GNav(
        onTabChange: (index){
          setState(() {
            _currindex=index;
          });
        },
        textStyle: heading(size: 15),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        tabs:[
            GButton(
              icon: Icons.home,
              text:'Home',textColor: Colors.blue,
              iconColor: Colors.white,iconActiveColor: Colors.blue,),
            GButton(
              icon: Icons.search,
              text:'Search',textColor: Colors.blue,
              iconColor: Colors.white,iconActiveColor: Colors.blue,),
            GButton(
              icon: Icons.menu,
              text:'Menu',textColor: Colors.blue,
              iconColor: Colors.white,iconActiveColor: Colors.blue,),
          ],

      ),

    );
  }
}
