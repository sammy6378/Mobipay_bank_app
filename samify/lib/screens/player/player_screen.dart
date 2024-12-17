import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/player_provider.dart';
import 'package:samify/widgets/player/player_controls.dart';
import 'package:samify/widgets/player/player_progress.dart';
import 'package:samify/widgets/player/song_info.dart';
import 'package:samify/widgets/player/player_queue.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.expand_more),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Now Playing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.playlist_play),
            onPressed: () => _showQueue(context),
          ),
        ],
      ),
      body: Consumer<PlayerProvider>(
        builder: (context, player, child) {
          return const Column(
            children: [
              Expanded(child: SongInfo()),
              PlayerProgress(),
              PlayerControls(),
              SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }

  void _showQueue(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const PlayerQueue(),
      isScrollControlled: true,
    );
  }
}