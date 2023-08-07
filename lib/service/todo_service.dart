import 'package:flutter_todolist_app/model/todo.dart';

class TodoService {
  Future<List<ToDo>> getTodoList() async {
    return [
      ToDo.fromData(1, 'content1'),
      ToDo.fromData(2, 'content2'),
    ];
  }
}
