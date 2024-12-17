class UserModel {
  final String id;
  final String email;
  final String displayName;
  final String? photoUrl;
  final List<String> favorites;
  final List<String> playlists;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.favorites = const [],
    this.playlists = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      photoUrl: json['photoUrl'] as String?,
      favorites: List<String>.from(json['favorites'] ?? []),
      playlists: List<String>.from(json['playlists'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'favorites': favorites,
      'playlists': playlists,
    };
  }
}