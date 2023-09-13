import 'package:flutter/material.dart';
class ViewAll extends StatefulWidget {
  String title;
  dynamic data;
  ViewAll({Key? key,this.title='',this.data}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,index){
            return Container(margin:EdgeInsets.all(10),height: 300,color: Colors.cyan,);

      }),
    );
  }
}
