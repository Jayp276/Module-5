import "package:sqflite/sqflite.dart";

import "DatabaseConnection.dart";

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection(); // initlization
  }

  static Database? _database;

  Future<Database> get myDatabse async {
    if (_database != null) {
      return _database!;
    } else {
      _database =await _databaseConnection.setDatabase();
      return _database!;
    }
  }



  insertRecord(table, data) async {
    var con = await myDatabse;
    return await con.insert(table, data);
  }

  fetchRecord(table) async {
    var con = await myDatabse;
   return await con.query(table);
  }

  fetchSingleRecord(table, data) async {
    var con = await myDatabse;
   return await con.query(table, where: "id = ?", whereArgs: data[["id"]]);
  }

  updataRecord(table, data) async {
    var con = await myDatabse;
    return await con.update(table, data, where: "id = ?", whereArgs: data[["id"]]);
  }

  deletRecord(table, data) async {
    var con = await myDatabse;
    return await con.delete(table, where: "id = ?", whereArgs: data[["id"]]);
  }
}
