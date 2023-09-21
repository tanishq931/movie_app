import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/HomeScreen.dart';
import 'package:movie_app/auth/Reusable.dart';
import 'package:movie_app/auth/SignUp.dart';

class MyLogin extends StatelessWidget {
  MyLogin({super.key,});
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),colorFilter: ColorFilter.srgbToLinearGamma(),fit: BoxFit.cover)
          ),
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 150, bottom: 50, left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      child: Text(
                        'Welcome to\nCine Samachaar',
                        style:  TextStyle(
                            color: Colors.red,
                            fontFamily: 'Netflix',
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: Column(
                          children: [
                            TextField(
                              controller: email,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Email/UserName',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 10, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Colors.red),
                                onPressed: (){
                                  FirebaseAuth.instance.signInWithEmailAndPassword(
                                      email: email.text, password: password.text).then((value) =>
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())));

                                }, child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                              child: Text('LogIn', style: TextStyle(color: Colors.white,),),
                            )),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){},
                                  child: CircleAvatar(
                                    radius: 21,
                                    backgroundColor: Colors.white,
                                    child:  Icon(Icons.phone_android,
                                      color: Colors.black,size: 25,),
                                  ),
                                ),



                                SizedBox(width: 40,),
                                InkWell(
                                  onTap: ()async{
                                    await AuthGoogle().signInWithGoogle(context);
                                  },
                                  child: CircleAvatar(

                                      radius: 21,
                                      backgroundColor: Colors.white,
                                      child: Image.asset('assets/images/google.png',height: 20,)),
                                )
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have an accoount!', style: TextStyle(color: Colors.white),),
                                TextButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MySignUp()),
                                      );
                                    },
                                    child: Text('SignUp', style: TextStyle(color: Colors.blue),))

                              ],
                            ),
                          ]
                      ),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
