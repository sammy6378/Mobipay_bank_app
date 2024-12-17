import 'package:flutter/material.dart';
import 'package:samify/widgets/playlists/my_favorites.dart';
import 'package:samify/widgets/playlists/recommended_songs.dart';
import 'package:samify/widgets/playlists/trending_songs.dart';

class MusicWrapper extends StatelessWidget {
  const MusicWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
             TrendingSongs(),
              const RecommendedSongs(),
              MyFavorites()
            ],
          ),
        )
      ),
      
    );
  }
}