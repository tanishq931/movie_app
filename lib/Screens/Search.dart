import 'package:flutter/material.dart';
import 'package:movie_app/Screens/MySearchBar.dart';
import 'package:movie_app/Screens/ViewAll.dart';
import 'package:movie_app/UI/TextStyle.dart';
import 'package:movie_app/backend/backend.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Color> manyColors = [
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.yellowAccent,
    Colors.brown,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.blueGrey,
    Colors.lightGreen
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=>MySearchBar()));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 10,left: 10),
                child: TextField(
                  enabled: false,

                  decoration: InputDecoration(

                    suffixIconColor: Colors.white,

                    suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.search),),
                   disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.white,
                        )
                    ),

                  ),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: FutureBuilder(
              future: getmovie(),
              builder: (context, AsyncSnapshot snapshot) {
                if(snapshot.hasData) {
                  var data = snapshot.data;
                  return GridView.builder(

                      itemCount: manyColors.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        mainAxisExtent: 100,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        String name =
                        data
                        ['genres']
                        [index]
                        ['name'];
                        return FutureBuilder(
                          future: getGenre(data['genres'][index]['id']),
                          builder: (context, AsyncSnapshot snapshot1) {
                            if (snapshot1.hasData) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewAll(
                                                  title: name,
                                                  data: snapshot1
                                                      .data['results'],
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: manyColors[index],
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                          child: Text(name,
                                              style: title(bold: true))),
                                    ),
                                  ));
                            }
                            else {
                              return Container();
                            }
                          },
                        );
                      }
                  );
                }
                else {
                  return Text("");
                }

              },
            ),
          ),
        ],
      ),

    );
  }

}
