class Contact {
  final String name;
  final String imageUrl;
  final String? cardNumber;

  Contact({
    required this.name,
    required this.imageUrl,
    this.cardNumber,
  });
}


class Message {
  final String title;
  final String subtitle;
  final String date;
  final String icon;

  Message({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.icon,
  });
}