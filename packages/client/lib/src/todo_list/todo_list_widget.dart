import 'package:flutter/material.dart';

import '../todo_item/todo_item_connector.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    Key key,
    @required this.itemIds,
    @required this.onAddItem,
  })  : assert(itemIds != null, 'itemIds is required.'),
        super(key: key);

  final List<int> itemIds;
  final VoidCallback onAddItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do list'),
      ),
      body: Center(
        child: _createItemList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddItem,
        tooltip: 'New item',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _createItemList() {
    return ListView.builder(
      itemCount: itemIds.length,
      itemBuilder: (context, index) => TodoItemConnector(
        itemId: itemIds[index],
      ),
    );
  }
}
