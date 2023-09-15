import 'package:flutter/material.dart';
import 'package:movie_app/backend/backend.dart';

class MyMovieDetailPage extends StatefulWidget {
  MyMovieDetailPage({super.key,this.imgsrc1,this.titletext,this.daterel1,this.rate,this.origlang1,this.description,required this.movieidresult});

  String? imgsrc1;
  String? titletext;
  String? daterel1;
  String? rate;
  String? origlang1;
  String? description;
  int movieidresult;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyMovieDetailPage> createState() => _MyMovieDetailPageState(img: imgsrc1,movietitle: titletext,origlang: origlang1,ratings: rate,daterel: daterel1,movdesc: description,movieid: movieidresult);
}

class _MyMovieDetailPageState extends State<MyMovieDetailPage> {

  _MyMovieDetailPageState({this.img,this.movietitle,this.ratings,this.origlang,this.daterel,this.movdesc,required this.movieid});

  String? img;
  String? movietitle;
  String? ratings;
  String? origlang;
  String? daterel;
  String? movdesc;
  int movieid;
  var imgUrl='https://image.tmdb.org/t/p/original';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Padding(padding: EdgeInsets.only(left: width/105),child: Text("CINE SAMACHAAR",style: TextStyle(color: Colors.red,fontSize: 32,fontWeight: FontWeight.bold),)),
          backgroundColor: Colors.black,
        ),
        body:Stack(
          children: [
            Container(height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,

              ),

            ),
            Positioned(
              top: 2,
              left: 0,
              child: Container(height: height/3,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade500,
                          spreadRadius: 2,
                          blurRadius: 2
                      ),
                    ],

                ),
                child: Container(
                  width: width-10,
                  child: Image.network("$imgUrl$img",fit:BoxFit.cover,),
                ),
              ),
            ),
            Positioned(
              top: (height/3.5)+(height/36),
              left: 0,
              child: Container(height: height-(height/3.5),
                width: width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),

                ),
                child: Column(
                  children: [
                    Container(padding:EdgeInsets.only(left: 10,top: 15),height:50,width:width,child: Text("$movietitle",overflow:TextOverflow.fade,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 1,),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10),child: Text("Original Language. $origlang",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)),
                        Padding(
                          padding: EdgeInsets.only(left: width/3),
                          child: Row(
                            children: [
                              Text("$ratings",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500) ,),
                              SizedBox(width: 5,),
                              Icon(Icons.star,color: Colors.orange,),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10),child: Text("$daterel",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)),
                        Padding(
                          padding: EdgeInsets.only(left: width/3),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 30,
                                    child: IconButton(onPressed: () {

                                    }, icon: Icon(Icons.add),color: Colors.white,
                                      padding: EdgeInsets.only(left: 30),
                                    ),
                                  ),
                                  Padding(padding:EdgeInsets.only(left: 25),child: Text("WatchList",style: TextStyle(color: Colors.white,fontSize: 12,),)),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 30,
                                    child: IconButton(onPressed: () {

                                    }, icon: Icon(Icons.share),color: Colors.white,
                                      padding: EdgeInsets.only(left: 37),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Text("Share",style: TextStyle(color: Colors.white,fontSize: 12,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(height: height/8,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.black,

                      ),
                     child: Positioned(top:0,left:2,child: SingleChildScrollView(reverse:true ,padding:EdgeInsets.only(top: 5),child: Text("$movdesc",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,),textAlign: TextAlign.justify,))),
                    ),
                    SizedBox(height: 5,),
                    Positioned(left: 0,right:0,child: Container(height:30,width:width,padding:EdgeInsets.only(left: 10),child: Text("Star Cast",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.left,))),
                    SizedBox(height: 3,),
                    Positioned(
                      top: height-(height/64),
                      left: 0,
                      child: Container(
                        height: height/7.5,
                        width: width,
                        padding: EdgeInsets.only(left: 3),
                        child: FutureBuilder(
                          future: getCast(movieid),
                          builder: (context,AsyncSnapshot snapshot) {

                             if(snapshot.hasData){
    return ListView.builder(itemBuilder: (context,index){
         var data = snapshot.data;

           return Column(
             children: [
               Container(margin: EdgeInsets.only(right: 10),
                 height: height / 10,
                 width: width / 4,
                 color: Colors.blue,child: Container(
                   child: Image.network("$imgUrl${data['credits']['cast'][index]['profile_path']}",fit: BoxFit.cover,),
                 ),),
               SizedBox(height: 2,),
               Container(height: height / 52,
                 width: width / 4,
                 child: Text("${data['credits']['cast'][index]['original_name']}", style: TextStyle(color: Colors.white,
                     fontSize: 12,
                     fontWeight: FontWeight.bold),
                   textAlign: TextAlign.center,
                   softWrap: true,
                   overflow: TextOverflow.fade,),)
             ],
           );

        },itemCount: 5,scrollDirection: Axis.horizontal,
        );

    }
                             else{
                               return CircularProgressIndicator();
                             }
                            }

                        ),
                      ),
                    ),
                    Positioned(
                      top: height-(height/100),
                      left: 0,
                      child: Row(
                        children: [
                          Text("Genres: ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Container(
                            height: height/12,
                            width: width-100,
                            padding: EdgeInsets.only(left: 3),
                            child: FutureBuilder(
                                future: getMovieParticularGenre(movieid),
                                builder: (context,AsyncSnapshot snapshot) {

                                  if(snapshot.hasData){
                                    var data = snapshot.data;
                                    return ListView.builder(itemBuilder: (context,index){
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:  EdgeInsets.only(top: 15),
                                                  child: Container(
                                                    height: 30,
                                                    width: width-250,
                                                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.blue.shade900,width: 2),
                                                     borderRadius: BorderRadius.circular(30),

                                                    ),
                                                    child: Center(child: Text("${data['genres'][index]['name']}",style: TextStyle(color: Colors.blue.shade900,fontSize: 20,),softWrap: true,overflow: TextOverflow.fade,)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                            ],
                                          ),

                                        ],
                                      );
                                    },itemCount: 3,scrollDirection: Axis.horizontal,);





                                  }
                                  else{
                                    return CircularProgressIndicator();
                                  }
                                }

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        )
    );
  }
}
