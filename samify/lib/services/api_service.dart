import 'package:dio/dio.dart';
import 'package:samify/models/song_model.dart';
import 'package:samify/utils/api_config.dart';

class ApiService {
  final Dio _dio;
  
  ApiService() : _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    headers: {
      'Authorization': 'Bearer ${ApiConfig.apiKey}',
    },
  ));

  Future<List<SongModel>> searchSongs(String query) async {
    try {
      final response = await _dio.get('/search', queryParameters: {
        'q': query,
        'type': 'track',
      });
      
      return (response.data['tracks'] as List)
          .map((track) => SongModel.fromJson(track))
          .toList();
    } catch (e) {
      throw Exception('Failed to search songs: $e');
    }
  }

  Future<List<SongModel>> getTrendingSongs() async {
    try {
      final response = await _dio.get('/trending');
      return (response.data['tracks'] as List)
          .map((track) => SongModel.fromJson(track))
          .toList();
    } catch (e) {
      throw Exception('Failed to get trending songs: $e');
    }
  }

  Future<List<SongModel>> getRecommendedSongs(String userId) async {
    try {
      final response = await _dio.get('/recommendations/$userId');
      return (response.data['tracks'] as List)
          .map((track) => SongModel.fromJson(track))
          .toList();
    } catch (e) {
      throw Exception('Failed to get recommendations: $e');
    }
  }
}