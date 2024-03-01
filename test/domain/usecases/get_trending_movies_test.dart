import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';

import 'helper.dart';
import 'mock_movie_repository.dart';

void main() {
  late GetTrendingMovies usecases;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecases = GetTrendingMovies(mockMovieRepository);
  });

  final moviesList = Movies.list;

  test('should get trending movies from the repository', () async {
    // arrange
    when(() => mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => moviesList);

    // act
    final result = await usecases.execute();

    // assert
    expect(result, moviesList);
    verify(() => mockMovieRepository.getTrendingMovies()).called(1);
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test(
    'should call the getTrendingMovies method from the MovieRepository',
    () async {
      when(
        () => mockMovieRepository.getTrendingMovies(),
      ).thenAnswer(
        (_) => Future.value([]),
      );
      await usecases.execute();
      verify(() => mockMovieRepository.getTrendingMovies()).called(1);
    },
  );
}
