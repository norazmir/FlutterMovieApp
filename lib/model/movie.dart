import 'dart:convert';

import 'package:movie_app/shared/webservice.dart';

class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String posterUrl;

  Movie(this.title, this.year, this.imdbId, this.type, this.posterUrl);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['Title'],
      json['Year'],
      json['imdbID'],
      json['Type'],
      json['Poster'],
    );
  }

  static Resource<List<Movie>> get all{
    return Resource(
      "url here",
      (response){
        final result = json.decode(response.body);
        Iterable list = result['Search'];
        return list.map((model) => Movie.fromJson(model)).toList();
      }
    );
  }
}
