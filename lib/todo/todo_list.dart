import 'package:flutter/material.dart';
import 'package:flutter_todolist_app/bloc/todo_bloc.dart';
import 'package:flutter_todolist_app/event/delete_todo_event.dart';
import 'package:provider/provider.dart';

import '../model/todo.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<ToDo>>(
            stream: bloc.todoListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            snapshot.data![index].content,
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              bloc.event
                                  .add(DeleteTodoEvent(snapshot.data![index]));
                              print("Delete");
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red[400],
                            ),
                          ),
                        );
                      });
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      child: Text(
                        "Empty",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                case ConnectionState.none:
                default:
                  return Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
            }));
  }
}
