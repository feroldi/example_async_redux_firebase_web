import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';

import '../models/todo_state.dart';

class AddItemAction extends ReduxAction<TodoState> {
  AddItemAction({@required this.title, this.description});

  final String title;
  final String description;

  @override
  TodoState reduce() {
    return state.addItemAndIncrementCurrentId(
      title: title,
      description: description,
    );
  }
}
