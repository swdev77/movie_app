import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository movieRepository;

  SearchMovies({required this.movieRepository});

  Future<List<Movie>> execute(String query) async {
    return await movieRepository.searchMovies(query);
  }
}
