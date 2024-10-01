import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_states.dart';
import 'package:mp_todo_bloc/utils/bloc_utils.dart';

import '../model/todo.dart';

class BtnDeleteToDo extends StatelessWidget {
  const BtnDeleteToDo({
    super.key,
    required this.toDo,
  });

  final ToDo toDo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => deleteToDo(context, toDo),
          icon: const Icon(Icons.delete_outline),
        );
      },
    );
  }
}
