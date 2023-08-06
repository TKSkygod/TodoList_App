import 'package:flutter_todolist_app/base/base_event.dart';

import '../model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  ToDo todo;
  DeleteTodoEvent(this.todo);
}
