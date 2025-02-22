import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_states.dart';
import 'package:mp_todo_bloc/utils/bloc_utils.dart';
import 'package:mp_todo_bloc/utils/utils.dart';

import '../model/todo.dart';

class BtnSave extends StatelessWidget {
  const BtnSave({super.key, this.toDo});

  final ToDo? toDo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => _addOrUpdateToDo(context, state),
          icon: Icon(null == toDo ? Icons.check : Icons.update),
        );
      },
    );
  }

  Future<void> _addOrUpdateToDo(BuildContext context, ToDoState state) async {
    if (null != toDo) {
      if (toDo?.note == null || toDo!.note!.isEmpty) {
        unawaited(showToast('Please enter a note'));
        return;
      }
      updateToDo(context, toDo!);
      return;
    }
    if (state is ToDoCurrentState) {
      if (state.toDo.note == null || state.toDo.note!.isEmpty) {
        unawaited(showToast('Please enter a note'));
        return;
      }
      addToDo(context, state.toDo);
      return;
    }
  }
}
