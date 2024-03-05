import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/core/errors/server_exception.dart';
import 'package:movie_app/data/models/movie_model.dart';

import 'movie_remote_data_source.dart';
import '../../core/constants.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      return movies;
    } else {
      throw ServerException();
    }
  }
}
