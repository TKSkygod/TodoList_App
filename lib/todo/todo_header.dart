// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_todolist_app/bloc/todo_bloc.dart';
import 'package:flutter_todolist_app/event/add_todo_event.dart';
import 'package:provider/provider.dart';

class TodoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: InputDecoration(
              labelText: "Add todos",
              hintText: "Add todos",
            ),
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton.icon(
            onPressed: () {
              bloc.event.add(AddTodoEvent(txtTodoController.text));
            },
            icon: Icon(Icons.add),
            label: Text("Add")),
      ],
    );
  }
}
