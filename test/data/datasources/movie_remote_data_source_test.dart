import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/errors/server_exception.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source_impl.dart';
import 'package:movie_app/core/constants.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late MovieRemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  test(
    'should perform a GET request on a url to get trending movies',
    () async {
      // arrange
      final trendingMoviesUrl =
          Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey');
      when(() => mockHttpClient.get(trendingMoviesUrl))
          .thenAnswer((_) async => http.Response('{"results": []}', 200));

      // act
      await dataSource.getTrendingMovies();

      // assert
      verify(() => mockHttpClient.get(trendingMoviesUrl)).called(1);
    },
  );

  test(
    'should perform a GET request on a url to get popular movies',
    () async {
      // arrange
      final popularMoviesUrl =
          Uri.parse('$baseUrl/popular/movie/day?api_key=$apiKey');

      when(() => mockHttpClient.get(popularMoviesUrl))
          .thenAnswer((_) async => http.Response('{"results": []}', 200));

      // act
      await dataSource.getPopularMovies();

      // assert
      verify(() => mockHttpClient.get(popularMoviesUrl)).called(1);
    },
  );

  test(
    'should perform a GET request on a url to search movies',
    () async {
      // arrange
      const query = 'spiderman';
      final searchMoviesUrl =
          Uri.parse('$baseUrl/search/movie?query=$query&api_key=$apiKey');

      when(() => mockHttpClient.get(searchMoviesUrl))
          .thenAnswer((_) async => http.Response('{"results": []}', 200));

      // act
      await dataSource.searchMovies(query);

      // assert
      verify(() => mockHttpClient.get(searchMoviesUrl)).called(1);
    },
  );

  test(
    'should throw a ServerException when the response code is not 200',
    () {
      // arrange
      when(() => mockHttpClient.get(trendingMoviesUrl))
          .thenAnswer((_) async => http.Response('Something went wrong', 500));

      final call = dataSource.getTrendingMovies;

      expect(() => call(), throwsA(isA<ServerException>()));
    },
  );
}
