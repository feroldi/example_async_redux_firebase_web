import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'todo_item.dart';

@immutable
class TodoList extends DelegatingIterable<TodoItem> {
  const TodoList.empty() : _todos = const [], super(const []);
  const TodoList._(this._todos) : super(_todos);

  final List<TodoItem> _todos;

  TodoList markItemAsDone({@required int itemId}) {
    final itemIndex = _todos.indexWhere((item) => item.id == itemId);
    final item = _todos[itemIndex];

    assert(!item.isDone, 'Item is already marked as done!');

    return copyWith(
        todos: List.of(_todos)..[itemIndex] = item.copyWith(isDone: true),
    );
  }

  TodoList addItem({
    @required int id,
    @required String title,
    String description,
  }) {
    return copyWith(
      todos: List.of(_todos)
        ..add(TodoItem(
          id: id,
          title: title,
          description: description,
          isDone: false,
        )),
    );
  }

  TodoList copyWith({List<TodoItem> todos}) => TodoList._(todos ?? _todos);
}
