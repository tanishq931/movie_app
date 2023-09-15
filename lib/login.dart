import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movierating/HomePage.dart';
import 'package:movierating/reusable.dart';
import 'SignUp.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'forgotpassword.dart';

class MyLogin extends StatelessWidget {
  MyLogin({super.key,});
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)
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
                        'Cine Samachaar',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 35,
                           color: Colors.red
                         ),),
                    ),
                    SizedBox(height: 100),
                    Container(

                      child: Column(
                        children: [
                          TextField(
                            //controller: email,
                            decoration: InputDecoration(
                              fillColor: Colors.white.withOpacity(0.7),
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
                            //controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.7),
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())));

                              }, child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                                child: Text('LogIn', style: TextStyle(color: Colors.white,),),
                              )),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyForgotPassword()));
                              },
                              child: Text('Forgot Password', style: TextStyle(color: Colors.grey),),)
                          ),

                          SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: (){

                                  },
                                  icon: Icon(Icons.phone,color: Colors.grey, size: 40,)),
                              SizedBox(width: 40,),
                              RawMaterialButton(
                                onPressed: () {
                                  AuthGoogle().signInWithGoogle();
                                },
                                elevation: 2.0,
                                fillColor: Colors.transparent,
                                child: Image.asset('assets/Google-Symbol.webp',
                                          height: 45,),
                                padding: EdgeInsets.all(5.0),
                                shape: CircleBorder(),
                              ),
                            ],
                      ),
                          SizedBox(height: 50),
                          Positioned(
                            bottom: 0.0,
                            child: Row(
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



