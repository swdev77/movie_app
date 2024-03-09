import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/domain/entities/movie.dart';

import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<List<Movie>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTrendingMovies() async {
    final movieModels = await movieRemoteDataSource
      .getTrendingMovies();
    final movies = movieModels.map((movieModel) => Movie(
      id: movieModel.id,
      title: movieModel.title,
      overview: movieModel.overview,
      posterPath: movieModel.posterPath,
    ));
    return movies.toList();
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
