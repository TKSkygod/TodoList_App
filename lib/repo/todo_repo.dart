import 'package:flutter_todolist_app/database/todo_table.dart';
import 'package:flutter_todolist_app/model/todo.dart';
import 'package:flutter_todolist_app/service/todo_service.dart';

class TodoRepo {
  TodoTable _todoTable = TodoTable();
  TodoService todoService = TodoService();

  Future<int> insertTodo(ToDo todo) {
    return _todoTable.insertTodo(todo);
  }

  Future<void> deleteTodo(ToDo todo) {
    return _todoTable.deleteTodo(todo);
  }

  Future<List<ToDo>> selectAllTodo() async {
    return _todoTable.selectAllTodo();
  }

  Future<List<ToDo>> initData() async {
    List<ToDo> data = <ToDo>[];
    data = await _todoTable.selectAllTodo();
    if (data.length == 0) {
      return await todoService.getTodoList();
    }
    return data;
  }
}
