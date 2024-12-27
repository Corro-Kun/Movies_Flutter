import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_movil/core/config/app_config.dart';
import 'package:movies_movil/core/constants/api.dart';

class MoviesDatasource {
  Future<Map<String, dynamic>> getPopular() async {
    final token = AppConfig.apiToken;

    final response = await http.get(
        Uri.parse('$apiBaseUrl/movie/popular?language=es-LATAM&page=1'),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getTopRated() async {
    final token = AppConfig.apiToken;

    final response = await http.get(
        Uri.parse('$apiBaseUrl/movie/top_rated?language=es-LATAM&page=1'),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<dynamic> getDetail(int id) async {
    final token = AppConfig.apiToken;

    final response = await http.get(
        Uri.parse('$apiBaseUrl/movie/$id?language=es-LATAM'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Map<String, dynamic>> getSearch(String query) async {
    final token = AppConfig.apiToken;

    final response = await http.get(
        Uri.parse('$apiBaseUrl/search/movie?language=es-LATAM&query=$query'),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
