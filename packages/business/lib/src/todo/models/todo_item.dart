import 'package:meta/meta.dart';

@immutable
class TodoItem {
  const TodoItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.isDone,
  });

  final int id;
  final String title;
  final String description;
  final bool isDone;
}
