import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model/user_profile.dart';

class DbFactory {
  static final Future<Database> database = openLocalDatabase();
  static const String dbNameUserProfile = "UserProfile";

  static Future<Database> openLocalDatabase() async {
    String a = await getDatabasesPath();
    String myDbPath = join(a, "work_helper");
    return await openDatabase(
      myDbPath,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $dbNameUserProfile("
          "userName TEXT PRIMARY KEY, "
          "phoneNumber TEXT"
          ")",
        );
      },
      version: 1,
    );
  }

  static Future<void> insertUserProfile(UserProfile userProfile) async {
    final Database db = await database;

    await db.insert(
      dbNameUserProfile,
      userProfile.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<UserProfile?> getUserProfile() async {
    //引用資料庫
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(dbNameUserProfile);

    if(maps.isEmpty){
      return null;
    }
    return UserProfile(
        userName: maps[0]['userName'], phoneNumber: maps[0]['phoneNumber']);
    //將 List<Map<String, dynamic> 轉換成 List<Dog> 資料類型
  }

  static void deleteUserProfile() async {
    //引用資料庫
    final Database db = await database;
    db.delete(dbNameUserProfile);
  }
}
