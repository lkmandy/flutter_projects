import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/todo.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  // name of table
  String tblTodo = 'todo';

  // db columns
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  // Implementation of a singleton
  // named empty  constructor
  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    // from th io package returns the dir for the docs of our app
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo';
    var dbTodo = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodo;
  }

  // create database method
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT,'
        ' $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  // query methods

  // insert
  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result;
  }

  // select
  Future<List> getTodo() async {
    Database db = await this.db;
    var result = await db
        .rawQuery('SELECT * FROM $tblTodo order by $colDescription ASC');
    return result;
  }

  // counting number of records
  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery('select count (*) from $tblTodo'));
    return result;
  }

  // update
  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(),
        where: '$colId = ?', whereArgs: [todo.id]);
    return result;
  }

  // delete
  Future<int> deleteTodo(int id) async {
    int result;
    var db = await this.db;
    result =
        await db.rawDelete('DELETE FROM $tblTodo WHERE $colDescription = $id');
    return result;
  }
}
