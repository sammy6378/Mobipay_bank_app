import 'package:flutter/material.dart';

class MyFavorites extends StatelessWidget {
  final List<String> favoriteSongs = [
    'Favorite 1',
    'Favorite 2',
    'Favorite 3',
    'Favorite 4',
    'Favorite 5',
    'Favorite 6',
  ];

  MyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'My Favourites',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 2, // Card aspect ratio
          ),
          itemCount: favoriteSongs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 48,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      favoriteSongs[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
