import 'dart:convert';

import 'package:movie_app/shared/webservice.dart';

class MovieDetail{
  final String title;
  final String year;
  final String rated;
  final String released;
  final String plot;
  final String poster;

  MovieDetail(this.title, this.year, this.rated, this.released, this.plot, this.poster);

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      json['Title'],
      json['Year'],
      json['Rated'],
      json['Released'],
      json['Plot'],
      json['Poster'],
    );
  }

  static Resource<MovieDetail> getById(String id){
    return Resource(
        "url here",
            (response){
          final result = json.decode(response.body);
          return MovieDetail.fromJson(result);
        }
    );
  }

}