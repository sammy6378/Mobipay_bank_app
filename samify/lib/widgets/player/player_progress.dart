import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/player_provider.dart';
import 'package:samify/utils/duration_formatter.dart';

class PlayerProgress extends StatelessWidget {
  const PlayerProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, player, child) {
        return Column(
          children: [
            Slider(
              value: player.position.inSeconds.toDouble(),
              max: player.duration.inSeconds.toDouble(),
              onChanged: (value) {
                player.seek(Duration(seconds: value.toInt()));
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(player.position)),
                  Text(formatDuration(player.duration)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}