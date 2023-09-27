import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Details.dart';
import 'package:movie_app/Screens/ViewAll.dart';
import 'package:movie_app/UI/Partition.dart';
import 'package:movie_app/UI/TextStyle.dart';
import 'package:movie_app/backend/backend.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  List colors=[
    Colors.yellow,
    Colors.red,
    Colors.orange,
    Colors.brown,
    Colors.deepPurple
  ];
  var imgUrl='https://image.tmdb.org/t/p/original';
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: getTrending(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        return Column(
                          children: [
                            Partition(
                                'Top Airing', onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      ViewAll(
                                        title: 'Top Airing', data: data['results'],)));
                            }),
                            CarouselSlider.builder(

                              itemBuilder: (context, index, currindex) {
                                int id = data['results'][index]['id'];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyMovieDetailPage(data: data['results'][index],name: 'Top Airing',)));
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10),
                                        child: Hero(

                                          tag: 'Top Airing $id',
                                          child: Image.network(
                                              '$imgUrl${data['results'][index]['backdrop_path']}'),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 25,
                                          left: 0,
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 0.5*width
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xffffef00),
                                                borderRadius: BorderRadius
                                                    .only(
                                                    topRight: Radius
                                                        .circular(5),
                                                    bottomRight: Radius
                                                        .circular(5))),
                                            child: Text(
                                              '  ${data['results'][index]['title']}   ',
                                              style: title(
                                                  size: 18,
                                                  bold: true,
                                                  color: Colors.black),maxLines: 1,),
                                          )),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 7,
                              options: CarouselOptions(

                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  padEnds: true,
                                  enableInfiniteScroll: false,
                                  autoPlayAnimationDuration: Duration(
                                      seconds: 2),
                                  scrollPhysics: BouncingScrollPhysics()
                              ),
                            ),
                          ],
                        );
                      }
                      else {
                        return const SizedBox(
                          height: 200,


                        );
                      }
                    }
                ),
                FutureBuilder(
                  future: getHotPicks(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Column(
                        children: [
                          Partition('Hot Picks For You',onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    ViewAll(
                                      title: 'Hot Picks', data: data['results'])));
                          }),
                          CarouselSlider.builder(
                            itemBuilder: (context, index, currindex) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>
                                              MyMovieDetailPage(data: data['results'][index],name: 'Hot Picks',)));
                                },
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Hero(
                                        tag:'Hot Picks ${data['results'][index]['id']}',
                                        child: Image.network(
                                            '$imgUrl${snapshot
                                                .data['results'][index]['backdrop_path']}'
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 15,
                                        left: 0,

                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xffffef00),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight: Radius.circular(5))
                                          ),
                                          child: Text(
                                              '  ${data['results'][index]['title']}   ',

                                              style: title(size: 18,
                                                  bold: true,
                                                  color: Colors.black)
                                          ),
                                        )


                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount: colors.length,
                            options: CarouselOptions(

                                enableInfiniteScroll: false,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                autoPlay: true,
                                autoPlayAnimationDuration: Duration(
                                    seconds: 2),

                                padEnds: false

                            ),
                          ),
                        ],
                      );
                    }
                    else {
                      return SizedBox(height: 200);
                    }
                  },

                ),
                getCateory(genre: 28,name: 'Action'),
                getCateory(genre:18 ,name: 'Drama'),
                getCateory(genre:16 ,name: 'Animation'),
                getCateory(genre:878,name: 'Science fiction'),
                getCateory(genre:9648,name: 'Mystery'),
                getCateory(genre:12,name: 'Adventure'),
                getCateory(genre:27,name: 'Horror'),


              ],
            ),
          ),
        )
    );
  }
  dynamic getCateory({int genre=0,String name=''}){
    return FutureBuilder(
      future: getGenre(genre),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          return Container(
            child: Column(
              children: [
                Partition(name,onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>ViewAll(title: name,data: data['results'],)
                      ));
                }),
                CarouselSlider.builder(
                  itemBuilder: (context, index, currindex) {
                    var mid=data['results'][index]['id'];
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>MyMovieDetailPage(data: data['results'][index],name: name,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(


                          child: Hero(
                            tag:'$name $mid',
                            child: Image.network(
                                '$imgUrl${data['results'][index]['poster_path']}'),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: colors.length,
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.4,
                      padEnds: false
                  ),
                ),
              ],
            ),
          );
        }
        else {
          return SizedBox(height: 100);
        }
      },
    );
  }
}
