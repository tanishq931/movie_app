import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/UI/Partition.dart';
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
              Stack(
                children: [
                  CarouselSlider.builder(
                   itemBuilder: (context,index,currindex){
                     return Container(color: colors[index],);
                     },
                    itemCount: colors.length,

                    options: CarouselOptions(
                      onPageChanged: (index,reason){
                        setState(() {
                          _currindex=index;
                        });
                      },
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      padEnds: false,
                      enlargeCenterPage: true

                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: DotsIndicator(
                      dotsCount: colors.length,
                      position: _currindex,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue.shade800
                      ),),
                  )
                ],
              ),
              SizedBox(height: 10),
              Partition('Hot Picks For You'),
              SizedBox(height: 10),
              CarouselSlider.builder(
                itemBuilder: (context,index,currindex){
                  return Container(color: colors[index],);
                },
                itemCount: colors.length,
                options: CarouselOptions(
                  height: 190,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,

                    onPageChanged: (index,reason){
                      setState(() {
                        _currindex=index;
                      });
                    },
                    viewportFraction: 1,
                    padEnds: false

                ),
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


            ],
          ),
        ),
      ),
    );
  }
}
