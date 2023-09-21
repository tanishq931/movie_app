import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movierating/login.dart';
import 'HomePage.dart';

class MySignUp extends StatelessWidget {

  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  MySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         SafeArea(
           child: DecoratedBox(
             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)
             ),
             child: Container(
               height: double.infinity,
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Container(
                         padding: EdgeInsets.only(left: 25,right: 25, top: 50, bottom: 30),
                         child: Text(
                           'Cine Samachaar',
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 35,
                               color: Colors.red
                           ),),
                       ),
                       SizedBox(height: 100,),
                       TextField(
                         controller: userName,
                         decoration: InputDecoration(
                             fillColor: Colors.grey.shade100,
                             filled: true,
                             hintText: 'UserName',
                             border: OutlineInputBorder(
                                 borderSide: BorderSide(width: 10, color: Colors.red),
                                 borderRadius: BorderRadius.circular(8)
                             )
                         ),
                       ),
                       SizedBox(height: 20,),
                       TextField(
                         controller: email,
                         decoration: InputDecoration(
                             fillColor: Colors.grey.shade100,
                             filled: true,
                             hintText: 'Email',
                             border: OutlineInputBorder(
                                 borderSide: BorderSide(width: 10, color: Colors.red),
                                 borderRadius: BorderRadius.circular(8)
                             )
                         ),
                       ),
                       SizedBox(height: 20,),
                       TextField(
                         controller: password,
                         obscureText: true,
                         decoration: InputDecoration(
                             fillColor: Colors.grey.shade100,
                             filled: true,
                             hintText: 'Password',
                             border: OutlineInputBorder(
                                 borderSide: BorderSide(width: 3, color: Colors.redAccent),
                                 borderRadius: BorderRadius.circular(8)
                             )
                         ),
                       ),
                       SizedBox(height: 20),
                       // TextField(
                       //   obscureText: false,
                       //   decoration: InputDecoration(
                       //       fillColor: Colors.grey.shade100,
                       //       filled: true,
                       //       hintText: 'Confirm Password',
                       //       border: OutlineInputBorder(
                       //           borderSide: BorderSide(width: 3, color: Colors.redAccent),
                       //           borderRadius: BorderRadius.circular(8)
                       //       )
                       //   ),
                       // ),
                       // SizedBox(height: 20,),d
                       ElevatedButton(
                           onPressed: (){
                             if(userName.text.isNotEmpty && email.text.isNotEmpty && password.text.length > 6){
                               FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) =>
                               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())));
                             }
                             else{
                               Text('All the fields are mandatory');
                             }
                           },
                           style: ElevatedButton.styleFrom(primary: Colors.red),
                           child: Text('SignUp')
                       ),
                       SizedBox(height: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Already have an account.', style: TextStyle(color: Colors.grey),),
                           TextButton(
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => MyLogin()));
                             },
                             child: Text('LogIn'),
                           )
                         ],
                       )
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
