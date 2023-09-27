import 'package:flutter/material.dart';
import 'package:movie_app/UI/TextStyle.dart';
import 'package:movie_app/backend/backend.dart';

class MyMovieDetailPage extends StatefulWidget {
  MyMovieDetailPage({super.key,required this.data,required this.name});

  dynamic data;
  String name;




  @override
  State<MyMovieDetailPage> createState() => _MyMovieDetailPageState(data: data,name: name);
}

class _MyMovieDetailPageState extends State<MyMovieDetailPage> {

  _MyMovieDetailPageState({this.data,required this.name});
  var data;
  String name;
  String? img;
  String? movietitle;
  var ratings;
  String? origlang;
  String? daterel;
  String? movdesc;
  int movieid=0;
  var imgUrl='https://image.tmdb.org/t/p/original';

  @override
  Widget build(BuildContext context) {
    img=data['backdrop_path'];
    movietitle=data['title'];
    ratings=data['vote_average'];
    origlang=data['original_language'];
    daterel=data['release_date'];
    movdesc=data['overview'];
    movieid=data['id'];
    var key = GlobalKey();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(

          title: Text('Cine Samachaar'),
          centerTitle: true,
        ),
        body:Stack(
          children: [

            Positioned(
              top: 0,
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
                  child: Hero(
                      tag: '$name ${data['id']}',
                      child: Image.network("$imgUrl$img",fit:BoxFit.cover,)),
                ),
              ),
            ),
            Positioned(
              top: (height/3.5)+(height/36),
              left: 0,
              child: Container(height: 0.6*height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),

                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 40),
                    child: Column(
                      children: [
                        Padding(
                            padding:EdgeInsets.only(left: 10,top: 15),

                            child: Text("$movietitle",overflow:TextOverflow.fade,maxLines: 2,style: heading(size: 24),)),
                        const SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 10),child: Text("Original Language:   ${origlang!.toUpperCase()}",style: heading(size: 15))),
                            Row(
                              children: [
                                Text("$ratings",style: heading(size: 16) ,),
                                SizedBox(width: 5,),
                                Icon(Icons.star,color: Colors.orange,),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 10),child: Text("$daterel",style: heading(size: 16))),
                            Row(
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
                                    Padding(
                                        padding:EdgeInsets.only(left: 25),child: Text("WatchList",style: heading(size: 12),)),
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
                                      child: Text("Share",style:heading(size: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text('$movdesc', style: heading(size: 16),maxLines: 10,),
                        SizedBox(height: 10,),
                        Container(height:30,width:width,padding:EdgeInsets.only(left: 10),child: Text("Star Cast",style: title(size: 24,bold: true),textAlign: TextAlign.left,)),
                        SizedBox(height: 3,),
                        Container(
                          height: height/7.5,
                          width: width,
                          padding: EdgeInsets.only(left: 3),
                          child: FutureBuilder(
                              future: getCast(movieid),
                              builder: (context,AsyncSnapshot snapshot) {

                                if(snapshot.hasData){
                                    var data = snapshot.data;
                                  return ListView.builder(itemBuilder: (context,index){

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
                                          child: Text("${data['credits']['cast'][index]['original_name']}", style:heading(size: 12),
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                           ),)
                                      ]
                                    );

                                  },itemCount:data['credits']['cast'].length<4?data['credits']['cast'].length:4,
                                    scrollDirection: Axis.horizontal,
                                  );

                                }
                                else{
                                  return SizedBox(height: 20);
                                }
                              }

                          ),
                        ),
                        Container(
                          height: 40,
                          child: FutureBuilder(
                              future: getMovieParticularGenre(movieid),
                              builder: (context,AsyncSnapshot snapshot) {
                                if(snapshot.hasData){
                                  var data = snapshot.data;
                                  return ListView.builder(
                                    itemBuilder: (context,index){
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text("${data['genres'][index]['name']}",
                                              style: heading(size: 18,bold: true),
                                              softWrap: true,
                                              overflow: TextOverflow.fade,)),
                                      );
                                    },itemCount:data['genres'].length ,scrollDirection: Axis.horizontal,);





                                }
                                else{
                                  return SizedBox(height: 20);
                                }
                              }

                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            )

          ],
        )
    );
  }
}