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

  TodoState addItemAndIncrementCurrentId({@required String title}) {
    return copyWith(
      todos: todos.addItem(id: currentId, title: title),
      currentId: currentId + 1,
    );
  }

  TodoState markItemAsDone({@required int itemId}) {
    return copyWith(
      todos: todos.markItemAsDone(itemId: itemId),
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
