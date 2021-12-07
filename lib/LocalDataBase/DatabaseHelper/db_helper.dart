import 'package:helioz/LocalDataBase/Model/registration_model.dart';
import 'package:helioz/LocalDataBase/Model/signup_user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "helioz.db"),
      onCreate: (database, version) async {
        await database.execute("""
        CREATE TABLE Registration(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        country TEXT NOT NULL,
        state TEXT NOT NULL,
        district TEXT NOT NULL,
        tehsil TEXT NOT NULL,
        block TEXT NOT NULL,
        panchayat TEXT NOT NULL,
         village TEXT NOT NULL,
         gender TEXT NOT NULL,
         hh_uniqe_indefy TEXT NOT NULL,
         name_of_beneficiary TEXT NOT NULL,
         education TEXT NOT NULL,
         occupation TEXT NOT NULL,
         number_hh_member  INTEGER NOT NULL,
         phone_no INTEGER NOT NULL,
         aadhar INTEGER NOT NULL,
         caste_category TEXT NOT NULL,
         hh_disability TEXT NOT NULL,
         hh_disability_number INTEGER ,
         season_migration TEXT NOT NULL,
         image TEXT NOT NULL,
         distribution TEXT NOT NULL,
         model_project_tech TEXT NOT NULL,
         type_project_tech TEXT NOT NULL,
         quantity_project_tech TEXT NOT NULL,
         quantity_equip TEXT NOT NULL,
         serial_num_project TEXT NOT NULL,
         date_of_sale TEXT NOT NULL,
         date_of_tech_training TEXT NOT NULL
        )
        """);
      },
      version: 1,
    );
  }

  Future<int> insertData(UserRegisterModel userRegisterModel) async {
    final Database db = await initDB();
    int result = await db.insert("Registration", userRegisterModel.toMap());
    return result;
  }

  Future<List<UserRegisterModel>> getData() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query("Registration");
    return datas.map((e) => UserRegisterModel.fromMap(e)).toList();
  }

  Future<void> update(UserRegisterModel userRegisterModel, int id) async {
    final Database db = await initDB();
    await db.update("Registration", userRegisterModel.toMap(),
        where: "id=?", whereArgs: [id]);
  }
}
