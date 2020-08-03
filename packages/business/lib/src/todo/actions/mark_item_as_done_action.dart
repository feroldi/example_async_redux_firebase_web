import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';

import '../models/todo_state.dart';

class MarkItemAsDoneAction extends ReduxAction<TodoState> {
  MarkItemAsDoneAction({@required this.itemId});

  final int itemId;

  @override
  TodoState reduce() {
    return state.markItemAsDone(itemId: itemId);
  }
}
