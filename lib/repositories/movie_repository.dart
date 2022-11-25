
import 'package:book_tickets/models/Movie.model.dart';

abstract class MoviesRepository{
  Future <Movies> getMovies();
}