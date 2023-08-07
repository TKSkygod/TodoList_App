// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_todolist_app/bloc/todo_bloc.dart';
import 'todo/todo_list_container.dart';
import 'package:provider/provider.dart';
import 'database/todo_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Todo List")),
        body: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: TodoListContainer(),
        ),
      ),
    );
  }
}
