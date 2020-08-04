import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

import 'todo_list_widget.dart';

class TodoListConnector extends StatelessWidget {
  const TodoListConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
      model: _ViewModel(),
      builder: (context, vm) => TodoListWidget(
        itemIds: vm.itemIds,
        onAddItem: vm.onAddItem,
      ),
    );
  }
}

class _ViewModel extends BaseModel<TodoState> {
  _ViewModel();

  _ViewModel.build({
    @required this.itemIds,
    @required this.onAddItem,
  }) : super(equals: [itemIds.length]);

  List<int> itemIds;
  VoidCallback onAddItem;

  @override
  _ViewModel fromStore() {
    return _ViewModel.build(
      itemIds: state.todos.map((item) => item.id).toList(),
      onAddItem: () => dispatch(AddItemAction(
        title: 'Item #${state.currentId}',
        description: 'Some description of this item.',
      )),
    );
  }
}
