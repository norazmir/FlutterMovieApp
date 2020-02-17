import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/shared/webservice.dart';
import 'package:movie_app/ui/detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> _movies = List<Movie>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OMDB App"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter movie name"),
                  ),
                ),
                FlatButton(
                  child: Text("Search"),
                  color: Colors.yellow,
                  onPressed: () {
                    _populateMovies();
                  },
                )
              ],
            ),
            _generateListView()
          ],
        ),
      ),
    );
  }

  void _populateMovies() {
    WebService().load(Movie.all).then((movies) {
      setState(() {
        _movies = movies;
      });
    });
  }

  _generateListView() {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(_movies[index].posterUrl),
              title: Text(_movies[index].title),
              subtitle: Text("${_movies[index].year}"),
              trailing: Icon(Icons.arrow_forward),
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => DetailPage(_movies[index].imdbId)));
              },
            );
          },
          itemCount: _movies.length),
    );
  }
}
