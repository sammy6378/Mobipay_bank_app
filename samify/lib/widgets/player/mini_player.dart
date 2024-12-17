import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/player_provider.dart';
import 'package:samify/screens/player/player_screen.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, player, child) {
        if (player.currentSong == null) return const SizedBox.shrink();

        return GestureDetector(
          onTap: () => _openPlayerScreen(context),
          child: Container(
            height: 64,
            color: _getMiniPlayerBackgroundColor(context), // Adjust color based on theme
            child: Row(
              children: [
                Image.network(
                  player.currentSong!.albumArt,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          player.currentSong!.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          player.currentSong!.artist,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(player.isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () => player.togglePlay(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openPlayerScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PlayerScreen()),
    );
  }

  Color _getMiniPlayerBackgroundColor(BuildContext context) {
    // Return a background color that works well in both light and dark themes
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.black54; // Dark theme, set mini player background to dark gray
    } else {
      return Colors.white; // Light theme, set mini player background to white
    }
  }
}
