import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mp_todo_bloc/model/todo.dart';

// @immutable - This annotation indicates that the ToDoEvent
// class is immutable, meaning its instances cannot be modified
// after creation. This helps ensure data integrity and
// predictability in your application.
@immutable
abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

// Used for initial setup or loading of TO-DO data.
class InitializeEvent extends ToDoEvent {
  @override
  List<Object?> get props => [];
}

// Sets a note for a specific TO-DO.
class SetToDoNoteEvent extends ToDoEvent {
  final ToDo toDo;
  const SetToDoNoteEvent(this.toDo);
  @override
  List<Object?> get props => [];
}

// Loads TO-DO data from a data source.
class LoadToDoEvent extends ToDoEvent {
  const LoadToDoEvent();
  @override
  List<Object?> get props => [];
}

// Adds a new TO-DO.
class AddToDoEvent extends ToDoEvent {
  final ToDo toDo;
  const AddToDoEvent(this.toDo);
  @override
  List<Object?> get props => [];
}

// Indicates that an add TO-DO operation is in progress.
class AddToDoInProgressEvent extends ToDoEvent {
  @override
  List<Object?> get props => [];
}

// Updates an existing TO-DO.
class UpdateToDoEvent extends ToDoEvent {
  final ToDo toDo;
  const UpdateToDoEvent(this.toDo);
  @override
  List<Object?> get props => [];
}

// Indicates that an update TO-DO operation is in progress.
class UpdateTodoInProgressEvent extends ToDoEvent {
  @override
  List<Object?> get props => [];
}

// Updates an existing TO-DO.
class DeleteToDoEvent extends ToDoEvent {
  final ToDo toDo;
  const DeleteToDoEvent(this.toDo);
  @override
  List<Object?> get props => [];
}

// Indicates that a delete TO-DO operation is in progress.
class DeleteTodoInProgressEvent extends ToDoEvent {
  @override
  List<Object?> get props => [];
}



/*
Purpose:

- Event-Driven Architecture: This code defines a set of events that can be used to 
  trigger actions and updates in a TODO application.
- State Management: These events are typically used in conjunction with a state management 
  solution like BLoC or Redux to manage the application's state and update the UI accordingly.
- Equality Comparison: The Equatable implementation in each event class allows for efficient 
  comparison of event instances, which is important for various use cases, such as determining 
  if an event has already been handled or for caching purposes.

*/