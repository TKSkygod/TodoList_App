import 'dart:async';
import 'dart:math';

import 'package:flutter_todolist_app/base/base_bloc.dart';
import 'package:flutter_todolist_app/base/base_event.dart';
import 'package:flutter_todolist_app/event/add_todo_event.dart';
import 'package:flutter_todolist_app/event/delete_todo_event.dart';
import 'package:flutter_todolist_app/model/todo.dart';

import '../database/todo_table.dart';

class TodoBloc extends BaseBloc {
  TodoTable _todoTable = TodoTable();

  StreamController<List<ToDo>> _todoListStreamController =
      StreamController<List<ToDo>>();
  Stream<List<ToDo>> get todoListStream => _todoListStreamController.stream;
  var _random = Random();
  // ignore: prefer_final_fields
  List<ToDo> _todoListData = <ToDo>[];

  initData() async {
    _todoListData = await _todoTable.selectAllTodo() as List<ToDo>;
    if (_todoListData == null) {
      return;
    }
    _todoListStreamController.sink.add(_todoListData);
  }

  _addTodo(ToDo todo) async {
    //insert to database
    await _todoTable.insertTodo(todo);

    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(ToDo todo) async {
    await _todoTable.deleteTodo(todo);

    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      ToDo todo = ToDo.fromData(_random.nextInt(1000000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoListStreamController.close();
  }
}
