import 'package:book_tickets/models/Movie.model.dart';
import 'package:book_tickets/repositories/movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieController{

  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository){
    fetch();
  }
  
  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  fetch() async{
    movies.value = await _moviesRepository.getMovies();
  }

}