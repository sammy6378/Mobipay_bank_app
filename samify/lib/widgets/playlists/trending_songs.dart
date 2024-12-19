import 'package:flutter/material.dart';
import 'package:samify/providers/spotify_service.dart';
import './components/trending_card.dart';

class TrendingSongs extends StatefulWidget {
  const TrendingSongs({Key? key}) : super(key: key);

  @override
  _TrendingSongsState createState() => _TrendingSongsState();
}

class _TrendingSongsState extends State<TrendingSongs> {
  late Future<List<Map<String, String>>> _trendingSongs;

  @override
  void initState() {
    super.initState();
    _trendingSongs = SpotifyService.getTrendingSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Now',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<Map<String, String>>>(
            future: _trendingSongs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load trending songs'));
              }

              final songs = snapshot.data ?? [];
              return SizedBox(
                height: 180, // Adjusted for card height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    final song = songs[index];
                    return SongCard(
                      songName: song['songName']!,
                      author: song['author']!,
                      imageUrl: song['imageUrl']!,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
