import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ContactListItem({
    super.key,
    required this.contact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(contact.imageUrl),
      ),
      title: Text(
        contact.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}