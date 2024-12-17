import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:samify/models/song_model.dart';
import 'package:samify/providers/repeat_mode.dart';


class PlayerProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  SongModel? _currentSong;
  List<SongModel> _queue = [];
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  RepeatMode _repeatMode = RepeatMode.off;
  bool _isShuffleEnabled = false;

  // Getters
  SongModel? get currentSong => _currentSong;
  List<SongModel> get queue => List.unmodifiable(_queue);
  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;
  RepeatMode get repeatMode => _repeatMode;
  bool get isShuffleEnabled => _isShuffleEnabled;

  PlayerProvider() {
    _initializePlayer();
  }

  void _initializePlayer() {
    _player.playerStateStream.listen((state) {
      _isPlaying = state.playing;
      notifyListeners();
    });

    _player.positionStream.listen((pos) {
      _position = pos;
      notifyListeners();
    });

    _player.durationStream.listen((dur) {
      _duration = dur ?? Duration.zero;
      notifyListeners();
    });
  }

  Future<void> playSong(SongModel song) async {
    _currentSong = song;
    await _player.setUrl(song.url);
    await _player.play();
    notifyListeners();
  }

  Future<void> togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  void updateQueue(List<SongModel> songs) {
    _queue = songs;
    notifyListeners();
  }

  Future<void> toggleRepeatMode() async {
    switch (_repeatMode) {
      case RepeatMode.off:
        _repeatMode = RepeatMode.all;
        break;
      case RepeatMode.all:
        _repeatMode = RepeatMode.one;
        break;
      case RepeatMode.one:
        _repeatMode = RepeatMode.off;
        break;
    }
    await _player.setLoopMode(_convertRepeatModeToLoopMode(_repeatMode));
    notifyListeners();
  }

  Future<void> toggleShuffle() async {
    _isShuffleEnabled = !_isShuffleEnabled;
    await _player.setShuffleModeEnabled(_isShuffleEnabled);
    notifyListeners();
  }

  LoopMode _convertRepeatModeToLoopMode(RepeatMode repeatMode) {
    switch (repeatMode) {
      case RepeatMode.off:
        return LoopMode.off;
      case RepeatMode.all:
        return LoopMode.all;
      case RepeatMode.one:
        return LoopMode.one;
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}