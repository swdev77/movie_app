import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_app/domain/usecases/search_movies.dart';
import 'helper.dart';
import 'mock_movie_repository.dart';

void main() {
  
  const searchQuery = 'search movie';
  final moviesList = Movies.list;

  final MockMovieRepository mockMovieRepository = MockMovieRepository();
  final usecases = SearchMovies(movieRepository: mockMovieRepository);

  test('should get movies from the query', () async {
    // arrange
    when(() => mockMovieRepository.searchMovies(searchQuery))
        .thenAnswer((_) async => moviesList);
    // act
    final result = await usecases.execute(searchQuery);

    // assert
    expect(result, moviesList);
    verify(() => mockMovieRepository.searchMovies(searchQuery)).called(1);
  });
}
