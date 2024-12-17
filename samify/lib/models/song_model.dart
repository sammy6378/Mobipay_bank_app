class SongModel {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String albumArt;
  final String url;
  final Duration duration;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.albumArt,
    required this.url,
    required this.duration,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      albumArt: json['albumArt'] as String,
      url: json['url'] as String,
      duration: Duration(milliseconds: json['duration'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'albumArt': albumArt,
      'url': url,
      'duration': duration.inMilliseconds,
    };
  }
}