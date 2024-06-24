import 'package:madang/features/home/models/restaurant_api.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  static const _tblDatabase = 'restaurant';

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = await openDatabase(
      '$path/favorite.db',
      onCreate: (db, version) async {
        await db.execute('''
              CREATE TABLE $_tblDatabase (
                id TEXT PRIMARY KEY,
                name TEXT,
                description TEXT,
                pictureId TEXT,
                city TEXT,
                rating REAL
              )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<List<Restaurants>> getAllRestoDb() async {
    final db = await database;
    try {
      List<Map<String, dynamic>> data = await db.query(_tblDatabase);

      return List.generate(
        data.length,
        (index) {
          return Restaurants.fromJson(data[index]);
        },
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> insertFavorite(Restaurants restaurants) async {
    final db = await database;

    await db.insert(
      _tblDatabase,
      restaurants.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    await db.delete(
      _tblDatabase,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
