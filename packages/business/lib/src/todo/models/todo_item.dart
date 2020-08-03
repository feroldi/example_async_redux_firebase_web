import 'package:meta/meta.dart';

@immutable
class TodoItem {
  const TodoItem({
    @required this.id,
    @required this.title,
    this.description,
    @required this.isDone,
  })  : assert(id != null, 'id is required.'),
        assert(title != null, 'title is required'),
        assert(isDone != null, 'isDone is required');

  final int id;
  final String title;
  final String description;
  final bool isDone;

  TodoItem copyWith({
    int id,
    String title,
    String description,
    bool isDone,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TodoItem &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            title == other.title &&
            description == other.description &&
            isDone == other.isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isDone.hashCode;
  }
}
