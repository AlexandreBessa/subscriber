class Signature {
  final int id;
  final String title;
  final int value;
  final String description;
  final String createdAt;
  final String updatedAt;

  Signature(
    this.id,
    this.title,
    this.value,
    this.description,
    this.createdAt,
    this.updatedAt,
  );

  @override
  String toString() {
    return 'Signature{id: $id, title: $title, value: $value}, description: $description}, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  Signature.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        value = json['value'],
        description = json['description'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
        'description': description,
      };
}
