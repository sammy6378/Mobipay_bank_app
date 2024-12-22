class Transaction {
  final String name;
  final String category;
  final String imageUrl;
  final double amount;

  Transaction({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.amount,
  });
}


class Reports {
  final String title;
  final double amount;
  final String status;
  final DateTime date;
  final String icon;

  Reports({
    required this.title,
    required this.amount,
    required this.status,
    required this.date,
    required this.icon,
  });
}