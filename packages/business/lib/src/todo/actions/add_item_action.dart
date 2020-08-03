import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';

import '../models/todo_state.dart';

class AddItemAction extends ReduxAction<TodoState> {
  AddItemAction({@required this.title});

  final String title;

  @override
  TodoState reduce() {
    return state.addItemAndIncrementCurrentId(title: title);
  }
}
