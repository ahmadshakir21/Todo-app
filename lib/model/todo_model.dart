final String myTodoTableName = 'myTodoTable';

class TodoModel {
  final int? id;
  final String title;
  final String description;
  DateTime time;

  TodoModel(
      {this.id,
      required this.title,
      required this.description,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'time': time.toIso8601String()
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        time: DateTime.parse(json['time'] as String));
  }
}
