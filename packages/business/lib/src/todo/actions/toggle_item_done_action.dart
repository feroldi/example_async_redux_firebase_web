import 'package:async_redux/async_redux.dart';
import 'package:meta/meta.dart';

import '../models/todo_state.dart';

class ToggleItemDoneAction extends ReduxAction<TodoState> {
  ToggleItemDoneAction({@required this.itemId});

  final int itemId;

  @override
  TodoState reduce() {
    return state.toggleItemDone(itemId: itemId);
  }
}
