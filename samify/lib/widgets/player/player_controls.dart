import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/player_provider.dart';
import 'package:samify/providers/repeat_mode.dart';


class PlayerControls extends StatelessWidget {
  const PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, player, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                player.isShuffleEnabled
                    ? Icons.shuffle
                    : Icons.shuffle_outlined,
              ),
              onPressed: () => player.toggleShuffle(),
            ),
            IconButton(
              icon: const Icon(Icons.skip_previous),
              onPressed: () {}, // TODO: Implement previous
            ),
            FloatingActionButton(
              onPressed: () => player.togglePlay(),
              child: Icon(
                player.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              onPressed: () {}, // TODO: Implement next
            ),
            IconButton(
              icon: _getRepeatIcon(player.repeatMode),
              onPressed: () => player.toggleRepeatMode(),
            ),
          ],
        );
      },
    );
  }

  Icon _getRepeatIcon(RepeatMode mode) {
    switch (mode) {
      case RepeatMode.off:
        return const Icon(Icons.repeat_outlined);
      case RepeatMode.all:
        return const Icon(Icons.repeat);
      case RepeatMode.one:
        return const Icon(Icons.repeat_one);
    }
    return const Icon(Icons.error); // Default return statement
  }
}