import 'package:flutter/material.dart';

class RecommendedSongs extends StatefulWidget {
  const RecommendedSongs({super.key});

  @override
  _RecommendedSongsState createState() => _RecommendedSongsState();
}

class _RecommendedSongsState extends State<RecommendedSongs> {
  final List<List<String>> recommendedSongs = [
    ['Recommended 1A', 'Recommended 1B', 'Recommended 1C', 'Recommended 1D'],
    ['Recommended 2A', 'Recommended 2B', 'Recommended 2C', 'Recommended 2D'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recommended Songs Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Recommended For You',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Column(
            children: recommendedSongs.map((songRow) {
              return SizedBox(
                height: 150, // Fixed height for each horizontal grid
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songRow.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      elevation: 4,
                      child: SizedBox(
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.library_music,
                              size: 48,
                              color: Colors.greenAccent,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              songRow[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ],
    );
  }
}
