import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  GetPopularMovies(this.movieRepository);

  final MovieRepository movieRepository;

  Future<List<Movie>> execute() async {
    return movieRepository.getPopularMovies();
  }
}
