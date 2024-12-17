import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samify/models/playlist_model.dart';
import 'package:samify/models/song_model.dart';
import 'package:samify/models/user_model.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // User Methods
  static Future<void> createUser(UserModel user) async {
    await _firestore.collection('users').doc(user.id).set(user.toJson());
  }

  static Future<UserModel> getUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return UserModel.fromJson(doc.data()!..['id'] = doc.id);
  }

  // Playlist Methods
  static Future<List<PlaylistModel>> getUserPlaylists(String userId) async {
    final snapshot = await _firestore
        .collection('playlists')
        .where('userId', isEqualTo: userId)
        .get();
    
    return snapshot.docs
        .map((doc) => PlaylistModel.fromJson(doc.data()..['id'] = doc.id))
        .toList();
  }

  static Future<PlaylistModel> createPlaylist(String userId, String name) async {
    final docRef = _firestore.collection('playlists').doc();
    final playlist = PlaylistModel(
      id: docRef.id,
      name: name,
      userId: userId,
      songs: [],
      createdAt: DateTime.now(),
    );
    
    await docRef.set(playlist.toJson());
    return playlist;
  }

  static Future<PlaylistModel> getPlaylist(String playlistId) async {
    final doc = await _firestore.collection('playlists').doc(playlistId).get();
    return PlaylistModel.fromJson(doc.data()!..['id'] = doc.id);
  }

  static Future<void> addSongToPlaylist(
    String playlistId,
    SongModel song,
  ) async {
    await _firestore.collection('playlists').doc(playlistId).update({
      'songs': FieldValue.arrayUnion([song.toJson()]),
    });
  }

  static Future<void> removeSongFromPlaylist(
    String playlistId,
    String songId,
  ) async {
    final playlist = await getPlaylist(playlistId);
    final updatedSongs = playlist.songs.where((s) => s.id != songId).toList();
    
    await _firestore.collection('playlists').doc(playlistId).update({
      'songs': updatedSongs.map((s) => s.toJson()).toList(),
    });
  }
}