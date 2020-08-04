import 'package:business/business.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    Key key,
    @required this.item,
    this.onToggleItemDone,
  })  : assert(item != null, 'item is required.'),
        super(key: key);

  final TodoItem item;
  final VoidCallback onToggleItemDone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        item.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        color: item.isDone ? Colors.green : Colors.black,
      ),
      title: Text(item.title),
      subtitle: item.description != null ? Text(item.description) : null,
      onTap: onToggleItemDone,
    );
  }
}
