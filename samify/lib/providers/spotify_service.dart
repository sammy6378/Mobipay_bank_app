import 'package:http/http.dart' as http;
import 'dart:convert';

class SpotifyService {
  static const String _baseUrl = 'https://api.spotify.com/v1';

  // Fetch trending songs (top tracks)
  static Future<List<Map<String, dynamic>>> getTrendingSongs(String accessToken) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/me/top/artists'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> songs = List<Map<String, dynamic>>.from(data['items']);
      return songs;
    } else {
      throw Exception('Failed to load trending songs');
    }
  }
}
