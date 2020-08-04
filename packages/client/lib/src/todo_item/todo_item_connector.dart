import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

import 'todo_item_widget.dart';

class TodoItemConnector extends StatelessWidget {
  const TodoItemConnector({
    Key key,
    @required this.itemId,
  }) : super(key: key);

  final int itemId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
      model: _ViewModel(this),
      builder: (context, vm) => TodoItemWidget(
        item: vm.item,
        onToggleItemDone: vm.onToggleItemDone,
      ),
    );
  }
}

class _ViewModel extends BaseModel<TodoState> {
  _ViewModel(TodoItemConnector widget) : super(widget: widget);

  _ViewModel.build({
    @required this.item,
    @required this.onToggleItemDone,
  }) : super(equals: [item]);

  int get itemId => (widget as TodoItemConnector).itemId;

  TodoItem item;
  VoidCallback onToggleItemDone;

  @override
  _ViewModel fromStore() {
    return _ViewModel.build(
      item: state.todos.singleWhere((item) => item.id == itemId),
      onToggleItemDone: () => dispatch(ToggleItemDoneAction(itemId: itemId)),
    );
  }
}
