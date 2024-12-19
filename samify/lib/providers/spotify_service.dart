import 'package:http/http.dart' as http;
import 'dart:convert';

class SpotifyService {
  static const String _baseUrl = 'https://api.spotify.com/v1';
  static const String _authUrl = 'https://accounts.spotify.com/api/token';

  static const String _clientId = '';
  static const String _clientSecret = '';

  // Function to fetch the access token
  static Future<String> _getAccessToken() async {
    final response = await http.post(
      Uri.parse(_authUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic ${base64Encode(utf8.encode("$_clientId:$_clientSecret"))}',
      },
      body: 'grant_type=client_credentials',
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['access_token'] as String;
    } else {
      throw Exception('Failed to fetch access token');
    }
  }

  // Function to fetch recommended songs
static Future<List<Map<String, String>>> getRecommendedSongs() async {
  final token = await _getAccessToken();

  final response = await http.get(
    Uri.parse('$_baseUrl/browse/featured-playlists'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final playlists = data['playlists']['items'] as List<dynamic>;

    return playlists.map((playlist) {
      return {
        'name': playlist['name'] as String,
        'image': playlist['images'][0]['url'] as String,
        'uri': playlist['uri'] as String,
      };
    }).toList();
  } else {
    throw Exception('Failed to fetch featured playlists');
  }
}


// trending songs
  // Fetch Trending Songs
  static Future<List<Map<String, String>>> getTrendingSongs() async {
    final token = await _getAccessToken();

    final response = await http.get(
      Uri.parse('$_baseUrl/browse/new-releases'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final albums = data['albums']['items'] as List<dynamic>;

      return albums.map((album) {
        final artists = (album['artists'] as List<dynamic>)
            .map((artist) => artist['name'])
            .join(', ');
        return {
          'songName': album['name'] as String,
          'author': artists,
          'imageUrl': album['images'][0]['url'] as String,
        };
      }).toList();
    } else {
      throw Exception('Failed to fetch new releases');
    }
  }
}
