import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

import 'src/todo_list/todo_list_connector.dart';

void main() {
  final store = Store(initialState: TodoState.initial());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  MyApp(this.store);

  final Store<TodoState> store;

  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title: 'To-Do list',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListConnector(),
    );

    return StoreProvider<TodoState>(
      store: store,
      child: materialApp,
    );
  }
}
