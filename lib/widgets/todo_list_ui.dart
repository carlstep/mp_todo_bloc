import 'package:flutter/material.dart';
import 'package:mp_todo_bloc/widgets/todo_list_row.dart';

import '../model/todo.dart';

class ToDoListUI extends StatelessWidget {
  const ToDoListUI({
    super.key,
    required this.toDos,
    required this.onListTap,
  });

  final List<ToDo> toDos;
  final Function(ToDo) onListTap;

  @override
  Widget build(BuildContext context) {
    if (toDos.isEmpty) {
      return const Center(
        child: Text('No ToDos Added...'),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      itemBuilder: (context, index) => ToDoListRow(
        toDo: toDos[index],
        onListTap: onListTap,
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: toDos.length,
    );
  }
}
