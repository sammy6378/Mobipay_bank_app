import 'package:flutter/material.dart';
import 'package:samify/providers/spotify_service.dart';
import 'package:samify/providers/spotify_auth.dart';
import 'package:samify/widgets/common/song_list_item.dart';
import 'package:samify/models/song_model.dart';

class TrendingSongs extends StatefulWidget {
  const TrendingSongs({Key? key}) : super(key: key);

  @override
  _TrendingSongsState createState() => _TrendingSongsState();
}

class _TrendingSongsState extends State<TrendingSongs> {
  late String _accessToken; // Store the access token here

  @override
  void initState() {
    super.initState();
    // Authenticate the user and get the access token
    _authenticateAndFetch();
  }

  Future<void> _authenticateAndFetch() async {
    try {
      // Authenticate the user and get the authorization code
      final code = await SpotifyAuth.authenticate();
      if (code != null) {
        // Exchange the authorization code for an access token
        final accessToken = await SpotifyAuth.getAccessToken(code);
        if (accessToken != null) {
          setState(() {
            _accessToken = accessToken;
          });
        }
      }
    } catch (e) {
      // Handle error if authentication or token fetch fails
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Now',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        FutureBuilder<List<Map<String, dynamic>>>(
          future: SpotifyService.getTrendingSongs(_accessToken),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error loading trending songs'));
            }

            final songs = snapshot.data ?? [];
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: songs.length,
              itemBuilder: (context, index) => SongListItem(song: SongModel.fromJson(songs[index])),
            );
          },
        ),
      ],
    );
  }
}
