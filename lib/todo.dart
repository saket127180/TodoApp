
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'todo.g.dart';

@HiveType(typeId:01)
@JsonSerializable()
class Todo {
  String? title;
  String? id;
  bool? isDone;
  int? priority;

  Todo({
    this.title,
    this.id,
    this.isDone,
    this.priority,
  });
}
