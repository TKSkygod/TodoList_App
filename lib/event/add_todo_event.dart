import 'package:flutter_todolist_app/base/base_event.dart';

class AddTodoEvent extends BaseEvent {
  String content;
  AddTodoEvent(this.content);
}
