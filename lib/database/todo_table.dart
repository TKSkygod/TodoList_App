import 'package:flutter_todolist_app/database/todo_database.dart';
import '../model/todo.dart';
import 'todo_database.dart';
import 'package:sqflite/sqflite.dart';

class TodoTable {
  static const TABLE_NAME = 'todonew2';
  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME (
      id INTEGER PRIMARY KEY,
      content TEXT
    );
''';
  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME;
''';

  Future<int> insertTodo(ToDo todo) {
    final Database? db = TodoDatabase.instance.database;
    return db!.insert(
      TABLE_NAME,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTodo(ToDo todo) async {
    final Database? db = TodoDatabase.instance.database;
    await db!.delete(
      TABLE_NAME,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<List<ToDo>> selectAllTodo() async {
    final Database? db = TodoDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db!.query('todonew2');

    return List.generate(maps.length, (index) {
      return ToDo.fromData(
        maps[index]['id'],
        maps[index]['content'],
      );
    });
  }
}
