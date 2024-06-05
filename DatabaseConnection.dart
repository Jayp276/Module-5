import "package:path/path.dart";
import "package:path_provider/path_provider.dart";
import "package:sqflite/sqflite.dart";





class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "mydbExample");

    var database = await openDatabase(path, version: 1, onCreate: createTable);

    return database;
  }






  Future<void> createTable(Database databse, int version) async {
    String? sql =
        "create table Student (id INTEGER primary key AUTOINCREMENT, name text, subject text, marks text)";

    await databse.execute(sql);
  }
}






