
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

import 'Notes.dart';

class DBhelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Notes.db');
    var db = openDatabase(path, version: 1, onCreate: oncreate);
  }

  oncreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT NOT NULL, age INTEGER NOT NULL,description NOT NULL, email TEXT)");
  }

  Future<NotesModel> insert(NotesModel model) async {

    var dbclient=await db;
    await dbclient!.insert('notes',model.toMap());

    return model;
  }
}
