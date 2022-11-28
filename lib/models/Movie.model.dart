class Movie {
  late final double ? popularity;
  late final int ? voteCount;
  late final bool ? video;
  late final String posterPath;
  late final int id;
  late final bool ? adult;
  late final String backdropPath;
  late final String ? originalLanguage;
  late final String ? originalTitle;
  late final String ? title;
  late final dynamic voteAverage;
  late final String ? overview;
  late final String ? releaseDate;
  late final int ? page;
  late final int ? totalResults;
  late final int ? totalPages;
  late final List<Movie> movies;

  Movie(
      {
      required this.popularity,
      required this.voteCount,
      required this.video,
      required this.posterPath,
      required this.id,
      required this.adult,
      required this.backdropPath,
      required this.originalLanguage,
      required this.originalTitle,
      required this.title,
      required this.voteAverage,
      required this.overview,
      required this.releaseDate,
      required this.page, 
      required this.totalResults, 
      required this.totalPages, 
      required this.movies
      });

  Movie.fromJson(Map<String, dynamic> json) {
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    title = json['title'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      movies = <Movie>[];
      json['results'].forEach((v) {
        movies.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['popularity'] = popularity;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['poster_path'] = posterPath;
    data['id'] = id;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['page'] = page;
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    data['results'] = movies.map((v) => v.toJson()).toList();
    return data;
  }
}