import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';

import '../../helper.dart';
import 'mock_movie_repository.dart';

void main() {
  final mockMovieRepository = MockMovieRepository();
  final usecases = GetPopularMovies(mockMovieRepository);

  final moviesList = Movies.list;

  test('should get popular movies list', () async {
    // arrange
    when(() => mockMovieRepository.getPopularMovies())
        .thenAnswer((_) async => moviesList);

    // act
    final result = await usecases.execute();

    // assert
    expect(result, moviesList);
    verify(() => mockMovieRepository.getPopularMovies()).called(1);
  });
}
