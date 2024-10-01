import 'package:flutter/material.dart';
import 'package:mp_todo_bloc/screens/add_todo.dart';

import '../model/todo.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> openAddToDoScreen({ToDo? toDo}) async {
  Navigator.of(navigatorKey.currentContext!).push(
    MaterialPageRoute(
      builder: (context) => AddToDoScreen(
        toDo: toDo,
      ),
    ),
  );
}

Future<void> closeScreen() async {
  Navigator.pop(navigatorKey.currentContext!);
}
