// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository movieRepository;
  GetTrendingMovies(this.movieRepository);

  Future<List<Movie>> execute() async {
    return await movieRepository.getTrendingMovies();
  }
}
