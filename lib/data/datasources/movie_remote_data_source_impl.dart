import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants.dart';
import '../../core/errors/server_exception.dart';
import '../models/movie_model.dart';
import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey'),
    );

    return parseResponseResult(response);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/popular/movie/day?api_key=$apiKey'),
    );

    return parseResponseResult(response);
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.get(
      Uri.parse('$baseUrl/search/movie?query=$query&api_key=$apiKey'),
    );

    return parseResponseResult(response);
  }

  List<MovieModel> parseResponseResult(http.Response response) {
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
    
      final movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    
      return movies;
    } else {
      throw ServerException();
    }
  }
}
