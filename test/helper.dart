import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieModels {
  static final List<MovieModel> list = [
    MovieModel(
      id: 1,
      title: 'Movie 1',
      overview: 'Overview 1',
      posterPath: 'Poster 1',
    ),
    MovieModel(
      id: 2,
      title: 'Movie 2',
      overview: 'Overview 2',
      posterPath: 'Poster 2',
    ),
  ];
}

class Movies {
  static final List<Movie> list = [
    const Movie(
      id: 1,
      title: 'Movie 1',
      overview: 'Overview 1',
      posterPath: 'Poster 1',
    ),
    const Movie(
      id: 2,
      title: 'Movie 2',
      overview: 'Overview 2',
      posterPath: 'Poster 2',
    ),
  ];
}
