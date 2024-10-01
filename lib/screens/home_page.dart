import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_bloc.dart';
import 'package:mp_todo_bloc/bloc/todo_states.dart';
import 'package:mp_todo_bloc/utils/bloc_utils.dart';
import 'package:mp_todo_bloc/utils/nav_utils.dart';
import 'package:mp_todo_bloc/utils/utils.dart';
import 'package:mp_todo_bloc/widgets/todo_error_ui.dart';

import '../widgets/btn_add_todo.dart';
import '../widgets/todo_list_ui.dart';
import '../widgets/todo_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        actions: const [
          BtnAddToDo(),
          // TODO
        ],
      ),
      body: BlocListener<ToDoBloc, ToDoState>(
        listener: toDoBlocListener,
        child: BlocBuilder<ToDoBloc, ToDoState>(
          buildWhen: (previous, current) => previous is! ToDoLoadedState,
          builder: (context, state) {
            if (state is Initialized) {
              return const Text('Initialized...');
            }
            if (state is ToDoLoadingState) {
              return const LoadingUI();
            }
            if (state is ToDoLoadedState) {
              return ToDoListUI(
                toDos: state.toDos,
                onListTap: (toDo) async {
                  clearAllSnackbars();
                  setToDo(context, toDo);
                  unawaited(openAddToDoScreen(toDo: toDo));
                },
              );
            }
            if (state is ToDoErrorState) {
              return ToDoErrorUI(message: state.error);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<void> toDoBlocListener(BuildContext context, ToDoState state) async {
    if (state is Initialized) {
      refreshToDo(context);
    }
  }
}
