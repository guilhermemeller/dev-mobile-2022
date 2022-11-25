import 'package:book_tickets/services/dio_service.dart';
import 'package:dio/dio.dart';

class DioServiceImp implements DioService{
  @override 
  Dio getDio(){
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization': 
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYTU4OWNkODQxZWRjYTBmNzc1MjRhYTQxOGQzNzI2MCIsInN1YiI6IjYzN2VlODcwNmU5MzhhMDA3Y2U3NmJkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NqzI02tNz-cUDinPM5JtC5nPgVoj4_gG5CeEWfRM2vg',
        },
      ),
    );
  }
}