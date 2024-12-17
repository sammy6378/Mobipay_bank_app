import 'package:samify/models/song_model.dart';

class PlaylistModel {
  final String id;
  final String name;
  final String userId;
  final String? coverUrl;
  final List<SongModel> songs;
  final DateTime createdAt;

  PlaylistModel({
    required this.id,
    required this.name,
    required this.userId,
    this.coverUrl,
    required this.songs,
    required this.createdAt,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'] as String,
      name: json['name'] as String,
      userId: json['userId'] as String,
      coverUrl: json['coverUrl'] as String?,
      songs: (json['songs'] as List).map((s) => SongModel.fromJson(s)).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'coverUrl': coverUrl,
      'songs': songs.map((s) => s.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}