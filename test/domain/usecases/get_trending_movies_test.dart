import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetTrendingMovies getTrendingMovies;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getTrendingMovies = GetTrendingMovies(mockMovieRepository);
  });

  test(
    'should call the getTrendingMovies method from the MovieRepository',
    () async {
      when(
        () => mockMovieRepository.getTrendingMovies(),
      ).thenAnswer(
        (_) => Future.value([]),
      );
      await getTrendingMovies.execute();
      verify(() => mockMovieRepository.getTrendingMovies()).called(1);
    },
  );
}
