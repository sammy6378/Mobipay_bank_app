import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // To handle audio playback

class MusicPlayerPage extends StatefulWidget {
  final String songTitle;
  final String artistName;
  final String imageUrl;
  final String audioUrl; // URL of the song to play

  const MusicPlayerPage({
    super.key,
    required this.songTitle,
    required this.artistName,
    required this.imageUrl,
    required this.audioUrl,
  });

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  bool _isPlaying = false;
  double _currentPosition = 0.0;
  final double _duration = 240.0; // Example duration of 4 minutes (240 seconds)
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Function to toggle play/pause
  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _audioPlayer.pause();
      } else {
        _audioPlayer.setUrl(widget.audioUrl).then((_) {
          _audioPlayer.play();
        });
      }
      _isPlaying = !_isPlaying;
    });
  }

  // Skip to next song (reset for now)
  void _skipNext() {
    setState(() {
      _currentPosition = 0.0; // Reset position for the next song
    });
  }

  // Skip to previous song (reset for now)
  void _skipPrevious() {
    setState(() {
      _currentPosition = 0.0; // Reset position for the previous song
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Song Image Placeholder
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: widget.imageUrl.isNotEmpty
                  ? Image.network(widget.imageUrl, fit: BoxFit.cover)
                  : const Icon(
                      Icons.music_note,
                      size: 100,
                      color: Colors.white,
                    ),
            ),
            const SizedBox(height: 24),
            // Song Title and Artist
            Text(
              widget.songTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              widget.artistName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 32),
            // Music Progress Bar
            Slider(
              value: _currentPosition,
              min: 0,
              max: _duration,
              onChanged: (value) {
                setState(() {
                  _currentPosition = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Play/Pause Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: _skipPrevious,
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                  ),
                  onPressed: _togglePlayPause,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: _skipNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
