import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List colors=[
    Colors.yellow,
    Colors.red,
    Colors.orange,
    Colors.brown,
    Colors.deepPurple
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cine Samachaar'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: GNav(
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
