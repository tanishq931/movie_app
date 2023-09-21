import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController search =TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(right: 270),
                child: Text("Search", style: TextStyle(fontSize: 30),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: search,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.search),),
                      hintText: ("what do you want to listen to ?"),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.black,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.black,
                          )
                      )
                  ),
                  cursorColor: Colors.white,

                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text("Browse all", style: TextStyle(fontSize: 30),),
              )
            ],),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: FutureBuilder(
              future: getsong(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;


                  return ListView.builder(


                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [


                          Container(


                            margin: EdgeInsets.all(8),
                            height: 100,
                            width: 180,
                            color: Colors.yellow,

                            child: Text(data['genres'][index]['name']),


                          ),

                          Container(
                            child: Text("hII"),

                            margin: EdgeInsets.all(8),
                            height: 100,
                            width: 180,
                            color: Colors.red,

                          ),


                        ],


                      );
                    },

                  );
                }
                return Text("");
              },
            ),

          ),

        ],
      ),

    );
  }
  getsong()async{
    var  url='https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=7d1b38486a31ddec36e3b9183959ae39';
    dynamic response = await http.get(Uri.parse(url));
    var pick = jsonDecode(response.body.toString());
    return pick;
  }

}
