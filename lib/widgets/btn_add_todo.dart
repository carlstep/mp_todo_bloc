import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_states.dart';

import '../model/todo.dart';
import '../utils/bloc_utils.dart';
import '../utils/nav_utils.dart';
import '../utils/utils.dart';

class BtnAddToDo extends StatelessWidget {
  const BtnAddToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        if (state is ToDoDeleteInProgressState) {
          return const CircularProgressIndicator();
        }
        return IconButton(
          onPressed: () async {
            clearAllSnackbars();
            setToDo(context, ToDo());
            unawaited(openAddToDoScreen());
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }
}
