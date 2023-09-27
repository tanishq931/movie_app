import 'dart:convert';
import 'package:http/http.dart' as http;

var api_key='7d1b38486a31ddec36e3b9183959ae39';

getTrending() async{
  var url= 'https://api.themoviedb.org/3/trending/movie/day?language=en-US%27&api_key=$api_key';
  dynamic response = await http.get(Uri.parse(url));
  var trending = jsonDecode(response.body);
  return trending;
}
getHotPicks() async{
  var url = 'https://api.themoviedb.org/3/discover/movie?&api_key=$api_key&with_origin_country=IN';
  dynamic response = await http.get(Uri.parse(url));
  var hotpicks=jsonDecode(response.body.toString());
  return hotpicks;
}


getGenre(int genre) async{
  var url='https://api.themoviedb.org/3/discover/movie?&sort_by=popularity.desc&with_genres=$genre&api_key=$api_key';
  var response = await http.get(Uri.parse(url));
  var movies = jsonDecode(response.body);
  return movies;

}
getCast(int id) async{
  var url='https://api.themoviedb.org/3/movie/$id?api_key=$api_key&append_to_response=credits';
  var response = await http.get(Uri.parse(url));
  var movies = jsonDecode(response.body);
  return movies;

}

getMovieParticularGenre(int id) async{
  var url='https://api.themoviedb.org/3/movie/$id?api_key=$api_key';
  var response = await http.get(Uri.parse(url));
  var movies = jsonDecode(response.body);
  return movies;

}
getmovie() async{
  var  url='https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=7d1b38486a31ddec36e3b9183959ae39';
  dynamic response = await http.get(Uri.parse(url));
  var pick = jsonDecode(response.body.toString());
  return pick;
}

getSearch( String controller) async{
  var url='https://api.themoviedb.org/3/search/movie?query=${controller}&api_key=7d1b38486a31ddec36e3b9183959ae39';
  dynamic response = await http.get(Uri.parse(url));
  var action = jsonDecode(response.body.toString());
  return action;
}
