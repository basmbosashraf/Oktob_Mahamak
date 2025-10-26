class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  // للتحويل من Map عند القراءة
  factory Task.fromMap(Map<dynamic, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}
