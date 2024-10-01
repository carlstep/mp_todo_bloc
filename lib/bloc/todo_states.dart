import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/todo.dart';

// @immutable - This annotation indicates that the ToDoEvent
// class is immutable, meaning its instances cannot be modified
// after creation. This helps ensure data integrity and
// predictability in your application.
@immutable
abstract class ToDoState extends Equatable {
  const ToDoState();
}

// This class represents the initial state for TO-DOs.
// It extends Equatable and overrides the props getter
//to return an empty list. This means that ToDoInitState
// instances are considered equal regardless of their content.
class ToDoInitState extends ToDoState {
  const ToDoInitState();
  @override
  List<Object?> get props => [];
}

//  This class represents the INITIALIZED state for TO-DOs.
class Initialized extends ToDoState {
  const Initialized();
  @override
  List<Object?> get props => [];
}

// This class represents the CURRENT state for TO-DOs.
class ToDoCurrentState extends ToDoState {
  final ToDo toDo;
  const ToDoCurrentState(this.toDo);
  @override
  List<Object?> get props => [toDo];
}

// This class represents the LOADING state for TO-DOs.
class ToDoLoadingState extends ToDoState {
  const ToDoLoadingState();
  @override
  List<Object?> get props => [];
}

// This class represents the LOADED state for TO-DOs.
class ToDoLoadedState extends ToDoState {
  final List<ToDo> toDos;
  const ToDoLoadedState(this.toDos);
  @override
  List<Object?> get props => [toDos];
}

// This class represents the ERROR state for TO-DOs.
class ToDoErrorState extends ToDoState {
  final String error;
  const ToDoErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

// This class represents the state indicating that adding a TO-DO is in progress.
class ToDoAddInProgressState extends ToDoState {
  const ToDoAddInProgressState();
  @override
  List<Object?> get props => [];
}

// This class represents the state after a TO-DO has been added.
class ToDoAddState extends ToDoState {
  final bool success;
  const ToDoAddState(this.success);

  @override
  List<Object?> get props => [success];
}

// This class represents the state indicating that updating a TO-DO is in progress.
class ToDoUpdateInProgressState extends ToDoState {
  const ToDoUpdateInProgressState();
  @override
  List<Object?> get props => [];
}

// This class represents the state after a TO-DO has been updated.
class ToDoUpdateState extends ToDoState {
  final bool success;
  const ToDoUpdateState(this.success);
  @override
  List<Object?> get props => [success];
}

// This class represents the state indicating that deleting a TO-DO is in progress.
class ToDoDeleteInProgressState extends ToDoState {
  const ToDoDeleteInProgressState();
  @override
  List<Object?> get props => [];
}

// This class represents the state after a TO-DO has been deleted.
class ToDoDeleteState extends ToDoState {
  final bool success;
  const ToDoDeleteState(this.success);

  @override
  List<Object?> get props => [success];
}


/*
Purpose:

- State Management: These classes represent the different states that a TODO application 
  can be in. They are typically used in conjunction with a state management solution like 
  BLoC or Redux to manage the application's state and update the UI accordingly.
- Equality Comparison: The Equatable implementation in each state class allows for efficient 
  comparison of state instances, which is important for various use cases, such as determining 
  if the state has changed or for caching purposes.

*/
