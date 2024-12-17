import 'package:flutter/material.dart';

class TrendingSongs extends StatelessWidget {
  final List<String> trendingSongs = [
    'Trending Song 1',
    'Trending Song 2',
    'Trending Song 3',
    'Trending Song 4',
  ];

  TrendingSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Now',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150, // Fixed height for horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingSongs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(left: 16),
                  elevation: 4,
                  child: SizedBox(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.music_note,
                          size: 48,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          trendingSongs[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
