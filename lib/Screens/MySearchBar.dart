import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Details.dart';
import 'package:movie_app/UI/TextStyle.dart';
import 'package:movie_app/backend/backend.dart';
class MySearchBar extends StatefulWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController _controller = TextEditingController();
  bool selected=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
         body: Padding(
           padding: const EdgeInsets.all(10.0),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 TextField(
                   controller: _controller,
                   style: heading(size: 15),
                   onTap: (){
                     setState(() {
                       selected=true;
                     });
                   },
                   onChanged: (value){
                     setState(() {

                     });
                   },
                   maxLines: 1,
                   decoration: InputDecoration(
                     prefixIconColor: selected?Colors.blue:Colors.white,

                    prefixIcon:  IconButton(icon: Icon(Icons.arrow_back,),
                      onPressed: (){
                      Navigator.pop(context);
                      },),
                     suffixIcon:  Icon(Icons.search),
                     suffixIconColor: selected?Colors.blue:Colors.white,
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                           width: 3,
                           color: Colors.white,
                         )
                     ),
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                           width: 3,
                           color: Colors.blue,
                         )
                     ),
                   ),),
                 Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: FutureBuilder(
                        future: getSearch(_controller.text.toString()),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData && _controller.text.isNotEmpty) {
                            var data = snapshot.data;
                            return SizedBox(
                              height: 500,
                              width: 500,
                              child: ListView.builder(
                                  itemCount: data['results'].length >8? 8
                                      : data['results'].length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  MyMovieDetailPage(
                                                      data: data['results'][index],
                                                      name: 'Search')));
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text(
                                              '${data['results'][index]['title']}',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 20),),
                                            SizedBox(height: 5,),
                                            Divider(thickness: 2, color: Colors.white,),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }
                          else{
                            return Center(child: Padding(
                              padding: const EdgeInsets.only(top:100.0),
                              child: Text('Enter anything to search',
                                style: heading(),
                                textAlign: TextAlign.center,),
                            ));
                          }
                        }

                    ),
                  ),
               ],
             ),
           ),
         )
      ),
    );
  }
}
