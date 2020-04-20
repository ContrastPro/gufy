import 'dart:io';
import 'package:gufy/model/person.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class StudiosDatabaseProvider {
  StudiosDatabaseProvider._();

  static final StudiosDatabaseProvider db = StudiosDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "studios.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Person ("
          "id integer primary key AUTOINCREMENT,"
          "rating DOUBLE,"
          "work TEXT,"
          "picture TEXT,"
          "name TEXT,"
          "surname TEXT,"
          "phone TEXT,"
          "gender TEXT,"
          "aboutMe TEXT,"
          "payment TEXT,"
          "time TEXT"
          ")");
    });
  }

  addPersonToDatabase(Person person) async {
    final db = await database;
    var raw = await db.insert(
      "Person",
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updatePerson({Person person, String raw, String newValue}) async {
    final db = await database;
    var response = await db.rawUpdate(
      /*sql=*/
      '''UPDATE Person
                    SET $raw = ?
                    WHERE id = ?''',
      /*args=*/ [newValue, person.id],
    );
    return response;
  }

  Future<Person> getPersonWithId(int id) async {
    final db = await database;
    var response = await db.query("Person", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Person.fromMap(response.first) : null;
  }

  Future<List<Person>> getAllPersons() async {
    final db = await database;
    var response = await db.query("Person");
    List<Person> list = response.map((c) => Person.fromMap(c)).toList();
    return list;
  }

  deletePersonWithId(int id) async {
    final db = await database;
    return db.delete("Person", where: "id = ?", whereArgs: [id]);
  }

  deleteAllPersons() async {
    final db = await database;
    db.delete("Person");
  }
}
