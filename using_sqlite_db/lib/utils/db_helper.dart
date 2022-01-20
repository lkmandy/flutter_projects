
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:using_sqlite_db/models/dog.dart';

class SqliteDatabase {

  /// Initialize the database
  final database = openDatabase(
    // Define the path to the database file
      join(await getDatabasesPath(), 'db_file.db'), version: 1,

  // When the database is first created, create a table to store dogs.
  onCreate: (db, version) => db.execute(
  'CREATE TABLE dogs(id INTEGER PRIMARY KEY, age INTEGER, name TEXT)',),);

  /// Insert an entry into the database
  Future<void> insertDog(Dog dog) async {
    final db = await database;

    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Map>> dogs() async {
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        age: maps[i]['age'],
        name: maps[i]['name'],
      ).toMap();
    });
  }

 /// Update an entry from the database
  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  /// Delete an entry from the database
  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}