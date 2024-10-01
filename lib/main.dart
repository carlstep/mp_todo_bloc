import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_events.dart';
import 'package:mp_todo_bloc/repo/todo_repo.dart';
import 'package:mp_todo_bloc/screens/home_page.dart';
import 'package:mp_todo_bloc/utils/nav_utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoBloc(ToDoRepo())..add(InitializeEvent()),
      child: MaterialApp(
        title: 'Flutter BLoC/ISAR Todo App',
        navigatorKey: navigatorKey,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const HomePage(),
      ),
    );
  }
}
