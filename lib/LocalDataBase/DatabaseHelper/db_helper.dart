import 'package:helioz/LocalDataBase/Model/signup_user_model.dart';
import 'package:helioz/LocalDataBase/Model/user_register_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "helioz.db"),
      onCreate: (database, version) async {
        await database.execute("""
        CREATE TABLE SignUp(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        password TEXT NOT NULL,
        email TEXT NOT NULL
        // mobile TEXT NOT NULL,
        // address TEXT NOT NULL,
        // date TEXT NOT NULL,
        // profession TEXT NOT NULL
        )
        """);
      },
      version: 1,
    );
  }

  Future<int> insertData(SignUpUserModel signUpUserModel) async {
    final Database db = await initDB();
    int result = await db.insert("SignUp", signUpUserModel.toMap());
    return result;
  }

  Future<List<SignUpUserModel>> getData() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query("SignUp");
    return datas.map((e) => SignUpUserModel.fromMap(e)).toList();
  }

  Future<void> update(SignUpUserModel signUpUserModel, int id) async {
    final Database db = await initDB();
    await db.update("SignUp", signUpUserModel.toMap(),
        where: "id=?", whereArgs: [id]);
  }
}
