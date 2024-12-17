import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/models/playlist_model.dart';
import 'package:samify/providers/player_provider.dart';
import 'package:samify/widgets/common/song_list_item.dart';

class PlaylistScreen extends StatelessWidget {
  final PlaylistModel playlist;

  const PlaylistScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(playlist.name),
              background: playlist.coverUrl != null
                  ? Image.network(
                      playlist.coverUrl!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.music_note,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.play_circle_filled),
                onPressed: () => _playAll(context),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () => _showOptions(context),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SongListItem(
                song: playlist.songs[index],
                showAlbum: true,
              ),
              childCount: playlist.songs.length,
            ),
          ),
        ],
      ),
    );
  }

  void _playAll(BuildContext context) {
    final playerProvider = context.read<PlayerProvider>();
    if (playlist.songs.isNotEmpty) {
      playerProvider.updateQueue(playlist.songs);
      playerProvider.playSong(playlist.songs.first);
    }
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Playlist'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement edit playlist
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Playlist'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement delete playlist
            },
          ),
        ],
      ),
    );
  }
}