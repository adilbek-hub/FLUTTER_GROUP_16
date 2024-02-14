import 'dart:convert';

class Todo {
  Todo({
    this.id,
    required this.name,
    required this.biography,
    required this.isComplated,
  });
  String? id;
  final String name;
  final String biography;
  final bool isComplated;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'biography': biography});
    result.addAll({'isComplated': isComplated});

    return result;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      isComplated: map['isComplated'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
