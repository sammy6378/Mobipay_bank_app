import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/models/song_model.dart';
import 'package:samify/providers/player_provider.dart';

class SongListItem extends StatelessWidget {
  final SongModel song;
  final bool showArtist;
  final bool showAlbum;

  const SongListItem({
    Key? key,
    required this.song,
    this.showArtist = true,
    this.showAlbum = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        song.albumArt,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      ),
      title: Text(
        song.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: showArtist || showAlbum
          ? Text(
              [
                if (showArtist) song.artist,
                if (showAlbum) song.album,
              ].join(' • '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      trailing: PopupMenuButton<String>(
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'add_to_playlist',
            child: Text('Add to Playlist'),
          ),
          const PopupMenuItem(
            value: 'add_to_queue',
            child: Text('Add to Queue'),
          ),
        ],
        onSelected: (value) {
          // TODO: Implement menu actions
        },
      ),
      onTap: () {
        context.read<PlayerProvider>().playSong(song);
      },
    );
  }
}