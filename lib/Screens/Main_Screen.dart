import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:movie_app/UI/Partition.dart';
import 'package:movie_app/UI/TextStyle.dart';
import 'package:movie_app/backend/Trending.dart';
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
  int _currindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Partition('Top Airing'),
              SizedBox(height: 10),
              FutureBuilder(
                  future: getTrending(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if(snapshot.hasData) {
                      var data = snapshot.data;
                      return CarouselSlider.builder(
                          itemBuilder: (context, index, currindex) {
                            return Container(color: colors[index],
                                child: Stack(
                                  children: [
                                    Image.network(
                                        '$imgUrl${snapshot
                                            .data['results'][index]['backdrop_path']}'
                                    ),
                                    Positioned(
                                         bottom: 30,
                                         left: 20,

                                         child: Text(data['results'][index]['title'],
                                              style: heading(color: Colors.yellow,size: 15)
                                            )


                                    )
                                  ],
                                )
                            );
                          },
                          itemCount:data.length,
                          options: CarouselOptions(
                            onPageChanged: (index,reason){
                              setState(() {
                                _currindex=index;
                              });
                            },
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            autoPlay: true,
                            padEnds: true,
                            scrollPhysics: BouncingScrollPhysics()


                          ),
                      );
                    }
                    else{
                      return CircularProgressIndicator();
                    }
                  }
                ),
              SizedBox(height: 10),
              Partition('Hot Picks For You'),
              SizedBox(height: 10),
              FutureBuilder(
                future: getHotPicks(),
                builder: (context,AsyncSnapshot snapshot){
                  if(snapshot.hasData)
                  {
                    var data=snapshot.data;
                    return CarouselSlider.builder(
                      itemBuilder: (context, index, currindex) {
                        return Container(color: colors[index],
                          child:Image.network('$imgUrl${data['results'][index]['backdrop_path']}')
                        );
                      },
                      itemCount: colors.length,
                      options: CarouselOptions(
                          height: 200,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,

                          onPageChanged: (index, reason) {
                            setState(() {
                              _currindex = index;
                            });
                          },
                          viewportFraction: 1,

                          padEnds: false

                      ),
                    );

                }
                  else{
                    return Container();
                  }
                },

              ),
              SizedBox(height: 10),
              Partition('Action'),
              CarouselSlider.builder(
                itemBuilder: (context,index,currindex){
                  return Container(margin: EdgeInsets.all(10),color: colors[index],);
                },
                itemCount: colors.length,
                options: CarouselOptions(
                    height: 190,

                    enableInfiniteScroll: false,


                    onPageChanged: (index,reason){
                      setState(() {
                        _currindex=index;
                      });
                    },
                    viewportFraction: 0.4,
                    padEnds: false

                ),
              ),
              SizedBox(height: 10),
              Partition('Drama'),
              CarouselSlider.builder(
                itemBuilder: (context,index,currindex){
                  return Container(margin: EdgeInsets.all(10),color: colors[index],);
                },
                itemCount: colors.length,
                options: CarouselOptions(
                    height: 190,

                    enableInfiniteScroll: false,


                    onPageChanged: (index,reason){
                      setState(() {
                        _currindex=index;
                      });
                    },
                    viewportFraction: 0.4,
                    padEnds: false

                ),
              ),
              SizedBox(height: 10),
              Partition('Adventure'),
              CarouselSlider.builder(
                itemBuilder: (context,index,currindex){
                  return Container(margin: EdgeInsets.all(10),color: colors[index],);
                },
                itemCount: colors.length,
                options: CarouselOptions(
                    height: 190,

                    enableInfiniteScroll: false,


                    onPageChanged: (index,reason){
                      setState(() {
                        _currindex=index;
                      });
                    },
                    viewportFraction: 0.4,
                    padEnds: false

                ),
              ),
              SizedBox(height: 10),
              Partition('Sci-fi'),
              CarouselSlider.builder(
                itemBuilder: (context,index,currindex){
                  return Container(margin: EdgeInsets.all(10),color: colors[index],);
                },
                itemCount: colors.length,
                options: CarouselOptions(
                    height: 190,

                    enableInfiniteScroll: false,


                    onPageChanged: (index,reason){
                      setState(() {
                        _currindex=index;
                      });
                    },
                    viewportFraction: 0.4,
                    padEnds: false

                ),
              ),
              SizedBox(height: 10),
              Partition('Mystery'),
              CarouselSlider.builder(
                itemBuilder: (context,index,currindex){
                  return Container(margin: EdgeInsets.all(10),color: colors[index],);
                },
                itemCount: colors.length,
                options: CarouselOptions(
                    height: 190,

                    enableInfiniteScroll: false,


                    onPageChanged: (index,reason){
                      setState(() {
                        _currindex=index;
                      });
                    },
                    viewportFraction: 0.4,
                    padEnds: false

                ),
              ),
              TextField(onChanged: (value){
                 setState(() {

                 });
              },)


            ],
          ),
        ),
      ),
    );
  }
}
