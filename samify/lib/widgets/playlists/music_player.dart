import 'package:flutter/material.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key});

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  bool _isPlaying = false;
  double _currentPosition = 0.0;
  final double _duration = 240.0; // Example duration of 4 minutes (240 seconds)

  // For now, just mock data for song details
  final String _songTitle = 'Song Title';
  final String _artistName = 'Artist Name';

  // Dummy function to toggle play/pause
  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  // Dummy function to skip to the next song
  void _skipNext() {
    setState(() {
      _currentPosition = 0.0; // Reset position for the next song
    });
  }

  // Dummy function to skip to the previous song
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
              child: const Icon(
                Icons.music_note,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            // Song Title and Artist
            Text(
              _songTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              _artistName,
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
