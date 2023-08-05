// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
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
            onPressed: () {}, icon: Icon(Icons.add), label: Text("Add")),
      ],
    );
  }
}
