import 'package:business/src/todo/models/todo_item.dart';
import 'package:test/test.dart';
import 'package:business/src/todo/models/todo_list.dart';

void main() {
  test(
      'Given: an empty todo-list. '
      'Then: the todo-list has length 0.', () {
    const todos = TodoList.empty();
    expect(todos, isEmpty);
    expect(todos, hasLength(0));
  });

  test(
      'Given: a todo-list which has 1 item marked as done. '
      'When: adding a new item to the todo-list. '
      'Then: the todo-list should have 2 items. '
      'And: the new added item should be marked as not-done. '
      'And: the new added item should be at the end of the todo-list.', () {
    final todos = const TodoList.empty()
        .addItem(id: 0, title: 'Item #0')
        .toggleItemDone(itemId: 0);

    expect(todos, hasLength(1));
    expect(
      todos,
      contains(const TodoItem(id: 0, title: 'Item #0', isDone: true)),
    );

    final todosWithAddedItem = todos.addItem(id: 1, title: 'Item #1');

    expect(todosWithAddedItem, hasLength(2));
    expect(
      todosWithAddedItem,
      containsAllInOrder(const <TodoItem>[
        TodoItem(id: 0, title: 'Item #0', isDone: true),
        TodoItem(id: 1, title: 'Item #1', isDone: false),
      ]),
    );
  });

  test(
      'Given: a todo-list which has 2 items. '
      'And: the two items are marked as not-done. '
      'When: toggling the first item as done. '
      'Then: the first item should be marked as done. '
      'And: the second item should still be marked as not-done.', () {
    final todos = const TodoList.empty()
        .addItem(id: 0, title: 'Item #0')
        .addItem(id: 1, title: 'Item #1');

    expect(todos, hasLength(2));
    expect(
      todos,
      containsAllInOrder(const <TodoItem>[
        TodoItem(id: 0, title: 'Item #0', isDone: false),
        TodoItem(id: 1, title: 'Item #1', isDone: false),
      ]),
    );

    final todosWithFirstItemMarkedAsDone = todos.toggleItemDone(itemId: 0);

    expect(todosWithFirstItemMarkedAsDone, hasLength(2));
    expect(
      todosWithFirstItemMarkedAsDone,
      containsAllInOrder(const <TodoItem>[
        TodoItem(id: 0, title: 'Item #0', isDone: true),
        TodoItem(id: 1, title: 'Item #1', isDone: false),
      ]),
    );
  });
}
