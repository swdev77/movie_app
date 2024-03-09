import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/entities/movie.dart';

import '../../helper.dart';

class MockRemoteDataSource extends Mock implements MovieRemoteDataSource {}

void main() {
  final mockRemoteDataSource = MockRemoteDataSource();
  final movieRepository =
      MovieRepositoryImpl(movieRemoteDataSource: mockRemoteDataSource);

  final List<MovieModel> movieModels = MovieModels.list ;
  final List<Movie> movies = Movies.list;

  test('should get trending movies', () async {
    // arrange
    when(() => mockRemoteDataSource.getTrendingMovies())
        .thenAnswer((_) async => movieModels);

    // act
    final result = await movieRepository.getTrendingMovies();

    // assert
    expect(result, movies);
    verify(() => mockRemoteDataSource.getTrendingMovies()).called(1);
  });
}
