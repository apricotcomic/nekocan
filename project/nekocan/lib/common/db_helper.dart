import 'package:nekocan/model/cats.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// catsテーブルのカラム名を設定
const String columnId = 'id';
const String columnName = 'name';
const String columnGender = 'gender';
const String columnBirthday = 'birthday';
const String columnMemo = 'memo';
const String columnCreatedAt = 'createdAt';

// catsテーブルのカラム名をListに設定
const List<String> columns = [
  columnId,
  columnName,
  columnGender,
  columnBirthday,
  columnMemo,
  columnCreatedAt,
];

// catsテーブルへのアクセスをまとめたクラス
class DbHelper {
  // DbHelperをinstance化する
  static final DbHelper instance = DbHelper._createInstance();
  static Database? _database;

  DbHelper._createInstance();

  // databaseをオープンしてインスタンス化する
  Future<Database> get database async {
    return _database ??= await _initDB(); // 初回だったら_initDB()=DBオープンする
  }

  // データベースをオープンする
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'cats.db'); // cats.dbのパスを取得する

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate, // cats.dbがなかった時の処理を指定する（DBは勝手に作られる）
    );
  }

  // データベースがなかった時の処理
  Future _onCreate(Database database, int version) async {
    //catsテーブルをcreateする
    _catsCreate(database, version);
  }

  Future _catsCreate(Database database, int version) async {
    //catsテーブルをcreateする
    await database.execute('''
      CREATE TABLE cats(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        gender TEXT,
        birthday TEXT,
        memo TEXT,
        createdAt TEXT
      )
    ''');
  }
}
