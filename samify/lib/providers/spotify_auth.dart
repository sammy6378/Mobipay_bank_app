import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpotifyAuth {
  static const String _clientId = 'c337735e2eb84ab9a5a5c5054847b4ee';
  static const String _clientSecret = 'cce105c24dd14cbbbf65d028e08c315a';
  static const String _redirectUri = 'https://samify.com/redirect';
  static const String _authUrl = 'https://accounts.spotify.com/authorize';
  static const String _tokenUrl = 'https://accounts.spotify.com/api/token';
  static const String _scopes = 'user-library-read playlist-read-private';

  // Method to start the authentication process
  static Future<String?> authenticate() async {
    final url = Uri.parse(
      '$_authUrl?client_id=$_clientId&response_type=code&redirect_uri=$_redirectUri&scope=$_scopes'
    );

    final result = await FlutterWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme: _redirectUri,
    );

    // Extract the code from the callback URL
    final code = Uri.parse(result).queryParameters['code'];
    if (code != null) {
      return code;
    }
    return null;
  }

  // Method to exchange the code for an access token
  static Future<String?> getAccessToken(String code) async {
    final response = await http.post(
      Uri.parse(_tokenUrl),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$_clientId:$_clientSecret'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'code': code,
        'redirect_uri': _redirectUri,
        'grant_type': 'authorization_code',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['access_token']; // Return the access token
    } else {
      throw Exception('Failed to get access token');
    }
  }
}
