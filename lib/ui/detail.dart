import 'package:flutter/material.dart';
import 'package:movie_app/model/moviedetail.dart';
import 'package:movie_app/shared/webservice.dart';

class DetailPage extends StatefulWidget {
  final String omdbId;

  const DetailPage(this.omdbId);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MovieDetail currentMovie;

  @override
  void initState() {
    WebService().load(MovieDetail.getById(widget.omdbId)).then((response) {
      setState(() {
        currentMovie = response;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Container(
        child: _retrieveMovie()
      ),
    );
  }

  _retrieveMovie() {
    if(currentMovie != null){
      return Column(
        children: <Widget>[
          Text(currentMovie.title)
        ],
      );
    }
    else{
      return
          Center(
            child: Text("Loading..."),
          );
    }
  }
}
