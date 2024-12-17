import 'package:flutter/material.dart';
import 'package:samify/widgets/playlists/components/music_wrapper.dart';
import 'package:samify/widgets/playlists/music_player.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavigationMenu> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MusicWrapper(),
    const MusicPlayerPage(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samify'),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'PlayList',
          ),
          
        ],
      ),
    );
  }
}
