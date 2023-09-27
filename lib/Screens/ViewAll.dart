import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Details.dart';
class ViewAll extends StatefulWidget {
  final title;
  final data;
  ViewAll({Key? key,this.title='',this.data}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState(data: data,title: title);
}

class _ViewAllState extends State<ViewAll> {

  _ViewAllState({this.data,this.title});
  var data;
  var title;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 118,
                crossAxisSpacing: 10,
                mainAxisExtent: 180,
                mainAxisSpacing: 10
            ),
            itemCount: data.length,
            itemBuilder:(context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>
                              MyMovieDetailPage(data: data[index],name: title,)));
                },
                child: Hero(
                  tag: '$title ${data[index]['id']}',
                  child: movies(path:data![index]['poster_path']),
                ),
              );
            }),

      ),
    );
  }
  Widget movies({String? path}){
    return  Container(width: 118,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network('https://image.tmdb.org/t/p/original$path'),
      ),
    );
  }
}
