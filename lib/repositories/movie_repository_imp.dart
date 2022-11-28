import 'package:book_tickets/models/Movie.model.dart';
import 'package:book_tickets/repositories/movie_repository.dart';
import 'package:book_tickets/services/dio_service.dart';
import 'package:book_tickets/utils/api.dart';

class MoviesRepositoryImp implements MoviesRepository{
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movie> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movie.fromJson(result.data);
  }
}