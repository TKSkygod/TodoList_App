import 'package:flutter_todolist_app/database/todo_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoDatabase {
  static const DB_NAME = "todo.db";
  static const DB_VERSION = 1;
  static Database? _database;

  TodoDatabase._internal();
  Database? get database => _database;
  static final TodoDatabase instance = TodoDatabase._internal();

  static const initScript = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: (db, version) {
      initScript.forEach((script) async => await db.execute(script));
    }, onUpgrade: (db, oldVersion, newVersion) {
      migrationScripts.forEach((script) async => await db.execute(script));
    }, version: DB_VERSION);
  }
}
