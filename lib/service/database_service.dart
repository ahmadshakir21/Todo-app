import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo_model.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'myTodo.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(''' CREATE TABLE $myTodoTableName(
                                        id INTEGER PRIMARY KEY AUTOINCREMENT , 
                                        title TEXT NOT NULL , 
                                        description TEXT NOT NULL , 
                                        time TEXT NOT NULL) 
                                        ''');
  }

  Future<List<TodoModel>> getTodo() async {
    Database db = await instance.database;

    var todos = await db.query(myTodoTableName, orderBy: "time");

    List<TodoModel> todoList =
        todos.isNotEmpty ? todos.map((e) => TodoModel.fromMap(e)).toList() : [];
    return todoList;
  }

  Future<int> insertTodo(TodoModel todoModel) async {
    Database db = await instance.database;

    return await db.insert(myTodoTableName, todoModel.toMap());
  }

  Future<int> update(TodoModel todoModel) async {
    Database db = await instance.database;
    return await db.update(myTodoTableName, todoModel.toMap(),
        where: 'id = ?', whereArgs: [todoModel.id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(myTodoTableName, where: 'id = ?', whereArgs: [id]);
  }
}
