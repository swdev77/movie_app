import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/movie.dart';

import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<List<Movie>> getPopularMovies() async {
    final movieModels = await movieRemoteDataSource.getPopularMovies();
    return _mapMovieModels(movieModels);
  }


  @override
  Future<List<Movie>> getTrendingMovies() async {
    final movieModels = await movieRemoteDataSource.getTrendingMovies();
    return _mapMovieModels(movieModels);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final movieModels = await movieRemoteDataSource.searchMovies(query); 
    return _mapMovieModels(movieModels);
  }
  
  List<Movie> _mapMovieModels(List<MovieModel> movieModels) {
    return movieModels
        .map(
          (movieModel) => Movie(
            id: movieModel.id,
            title: movieModel.title,
            overview: movieModel.overview,
            posterPath: movieModel.posterPath,
          ),
        )
        .toList();
  }
}
