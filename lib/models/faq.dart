class Faq {
  final int id;
  final String title;
  final String description;

  Faq({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json['userId'],
      title: json['id'],
      description: json['title'],
    );
  }
}
