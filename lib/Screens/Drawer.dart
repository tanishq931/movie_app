import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/TextStyle.dart';
import 'package:movie_app/auth/Login.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(

              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('Movie\nka\nkidda',textAlign: TextAlign.center,style: heading(size: 10,color: Colors.black,bold: true),)
                  ),
                    accountName:Text(
                      'Cine Samachaar',style: title(size:18),),
                    accountEmail:Text(
                      '${_auth.currentUser!.email}',style: title(),) ),
                Divider(thickness: 3,color: Colors.white,),
                SizedBox(height: 10,),

                InkWell(
                  onTap: (){
                    _auth.signOut().then((value){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=>MyLogin()));
                    });
                  },
                  child: Row(children: [
                    Icon(Icons.logout,color: Colors.white,),
                    SizedBox(width: 20,),
                    Text('Logout',style: heading(),)
                  ],),
                )
              ],
            ),
            Text(
            'This is a App made by Us \nfor project purpose but anyone can use it \nfor fair use only All right Reserved \n\@ copyright CineSamachaar Ltd.',
              maxLines: 5,style: title(size: 18),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
