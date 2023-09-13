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

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getTrending(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(15),
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
                                            title: 'Top Airing', data: data,)));
                                }),
                                CarouselSlider.builder(

                                  itemBuilder: (context, index, currindex) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Details()));
                                      },
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            child: Image.network(
                                                '$imgUrl${data['results'][index]['backdrop_path']}'),
                                          ),
                                          Positioned(
                                              bottom: 25,
                                              left: 0,
                                              child: Container(
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
                                                        color: Colors.black)),
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
                              Partition('Hot Picks For You'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                            '$imgUrl${snapshot
                                                .data['results'][index]['backdrop_path']}'
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 15,
                                          left: 0,

                                          child: Container(


                                            decoration: BoxDecoration(
                                                color: Color(0xffffef00),
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        5),
                                                    bottomRight: Radius
                                                        .circular(5))
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
                    FutureBuilder(
                      future: getGenre(28),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return Column(
                            children: [
                              Partition('Action'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(


                                      child: Image.network(
                                          '$imgUrl${data['results'][index]['poster_path']}'),
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
                          );
                        }
                        else {
                          return SizedBox(height: 100);
                        }
                      },
                    ),
                    FutureBuilder(
                      future: getGenre(18),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return Column(
                            children: [
                              Partition('Drama'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(


                                      child: Image.network(
                                          '$imgUrl${data['results'][index]['poster_path']}'),
                                    ),
                                  );
                                },
                                itemCount: colors.length,
                                options: CarouselOptions(
                                    height: 190,

                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.4,
                                    padEnds: false

                                ),
                              ),
                            ],
                          );
                        }
                        else {
                          return SizedBox(height: 100);
                        }
                      },
                    ),
                    FutureBuilder(
                      future: getGenre(16),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return Column(
                            children: [
                              Partition('Animation'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(


                                      child: Image.network(
                                          '$imgUrl${data['results'][index]['poster_path']}'),
                                    ),
                                  );
                                },
                                itemCount: colors.length,
                                options: CarouselOptions(
                                    height: 190,

                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.4,
                                    padEnds: false

                                ),
                              ),
                            ],
                          );
                        }
                        else {
                          return SizedBox(height: 100);
                        }
                      },
                    ),
                    FutureBuilder(
                      future: getGenre(878),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return Column(
                            children: [
                              Partition('Sci-fi'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(


                                      child: Image.network(
                                          '$imgUrl${data['results'][index]['poster_path']}'),
                                    ),
                                  );
                                },
                                itemCount: colors.length,
                                options: CarouselOptions(
                                    height: 190,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.4,
                                    padEnds: false

                                ),
                              ),
                            ],
                          );
                        }
                        else {
                          return SizedBox(height: 100);
                        }
                      },
                    ),
                    FutureBuilder(
                      future: getGenre(9648),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return Column(
                            children: [
                              Partition('Mystery'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(


                                      child: Image.network(
                                          '$imgUrl${data['results'][index]['poster_path']}'),
                                    ),
                                  );
                                },
                                itemCount: colors.length,
                                options: CarouselOptions(
                                    height: 190,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.4,
                                    padEnds: false

                                ),
                              ),
                            ],
                          );
                        }
                        else {
                          return SizedBox(height: 100);
                        }
                      },
                    ),
                    FutureBuilder(
                      future: getGenre(12),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return Column(
                            children: [
                              Partition('Adventure'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(


                                      child: Image.network(
                                          '$imgUrl${data['results'][index]['poster_path']}'),
                                    ),
                                  );
                                },
                                itemCount: colors.length,
                                options: CarouselOptions(
                                    height: 190,

                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.4,
                                    padEnds: false

                                ),
                              ),
                            ],
                          );
                        }
                        else {
                          return SizedBox(height: 100);
                        }
                      },
                    ),
                    FutureBuilder(
                      future: getGenre(27),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return Column(
                            children: [
                              Partition('Horror'),
                              CarouselSlider.builder(
                                itemBuilder: (context, index, currindex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Container(


                                      child: Image.network(
                                          '$imgUrl${data['results'][index]['poster_path']}'),
                                    ),
                                  );
                                },
                                itemCount: colors.length,
                                options: CarouselOptions(
                                    height: 190,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.4,
                                    padEnds: false

                                ),
                              ),
                            ],
                          );
                        }
                        else {
                          return SizedBox(height: 100);
                        }
                      },
                    ),


                  ],
                ),
              ),
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }

        },
      ),
    );
  }
}
