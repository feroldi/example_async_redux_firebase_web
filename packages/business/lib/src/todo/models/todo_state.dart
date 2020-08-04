import 'package:meta/meta.dart';

import 'todo_list.dart';

@immutable
class TodoState {
  const TodoState({
    @required this.todos,
    @required this.currentId,
  });

  const TodoState.initial()
      : this(
          todos: const TodoList.empty(),
          currentId: 0,
        );

  final TodoList todos;
  final int currentId;

  TodoState addItemAndIncrementCurrentId({
    @required String title,
    String description,
  }) {
    return copyWith(
      todos: todos.addItem(
        id: currentId,
        title: title,
        description: description,
      ),
      currentId: currentId + 1,
    );
  }

  TodoState toggleItemDone({@required int itemId}) {
    return copyWith(
      todos: todos.toggleItemDone(itemId: itemId),
    );
  }

  TodoState copyWith({
    TodoList todos,
    int currentId,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      currentId: currentId ?? this.currentId,
    );
  }
}
