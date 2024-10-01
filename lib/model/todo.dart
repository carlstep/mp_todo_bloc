import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class ToDo {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? note;

  bool completed = false;
}
