import 'package:flutter/material.dart';
import 'package:samify/models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: user.photoUrl != null
              ? NetworkImage(user.photoUrl!)
              : null,
          child: user.photoUrl == null
              ? Text(
                  user.displayName[0].toUpperCase(),
                  style: const TextStyle(fontSize: 32),
                )
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          user.displayName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          user.email,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}