import 'package:path/path.dart';
import 'package:projeto_agenda/app/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _database;

  static Future<Database> get() async {
    if (_database == null) {
      var path = join(await getDatabasesPath(), 'grades.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(createTable);
          await db.execute(insertGrades);
        },
      );
    }
    return _database!;
  }
}
