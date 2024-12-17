import 'package:flutter/foundation.dart';
import 'package:samify/models/playlist_model.dart';
import 'package:samify/models/song_model.dart';
import 'package:samify/services/firebase_service.dart';

class PlaylistProvider with ChangeNotifier {
  List<PlaylistModel> _playlists = [];
  bool _isLoading = false;
  String? _error;

  List<PlaylistModel> get playlists => List.unmodifiable(_playlists);
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUserPlaylists(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _playlists = await FirebaseService.getUserPlaylists(userId);
    } catch (e) {
      _error = 'Failed to load playlists';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createPlaylist(String userId, String name) async {
    try {
      final playlist = await FirebaseService.createPlaylist(userId, name);
      _playlists.add(playlist);
      notifyListeners();
    } catch (e) {
      _error = 'Failed to create playlist';
      notifyListeners();
    }
  }

  Future<void> addSongToPlaylist(String playlistId, SongModel song) async {
    try {
      await FirebaseService.addSongToPlaylist(playlistId, song);
      final index = _playlists.indexWhere((p) => p.id == playlistId);
      if (index != -1) {
        final updatedPlaylist = await FirebaseService.getPlaylist(playlistId);
        _playlists[index] = updatedPlaylist;
        notifyListeners();
      }
    } catch (e) {
      _error = 'Failed to add song to playlist';
      notifyListeners();
    }
  }

  Future<void> removeSongFromPlaylist(String playlistId, String songId) async {
    try {
      await FirebaseService.removeSongFromPlaylist(playlistId, songId);
      final index = _playlists.indexWhere((p) => p.id == playlistId);
      if (index != -1) {
        final updatedPlaylist = await FirebaseService.getPlaylist(playlistId);
        _playlists[index] = updatedPlaylist;
        notifyListeners();
      }
    } catch (e) {
      _error = 'Failed to remove song from playlist';
      notifyListeners();
    }
  }
}