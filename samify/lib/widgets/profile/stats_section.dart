import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/playlist_provider.dart';

class StatsSection extends StatelessWidget {
  final String userId;

  const StatsSection({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, playlistProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem(
              context,
              'Playlists',
              playlistProvider.playlists.length.toString(),
            ),
            _buildStatItem(
              context,
              'Favorites',
              playlistProvider.playlists
                  .expand((p) => p.songs)
                  .where((s) => s.id.isNotEmpty)
                  .length
                  .toString(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}