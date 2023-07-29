

class TodoMdel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoMdel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TodoMdel.fromJson(Map<String, dynamic> json) => TodoMdel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
