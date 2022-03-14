import 'package:nekocan/model/shops.dart';
import 'package:nekocan/common/db_helper.dart';

// shopsテーブルのカラム名を設定
const String columnId = 'id';
const String columnShopName = 'shopName';
const String columnCreatedAt = 'createdAt';

// shopsテーブルのカラム名をListに設定
const List<String> columns = [
  columnId,
  columnShopName,
  columnCreatedAt,
];

// shopsテーブルへのアクセスをまとめたクラス
class ShopsHelper {
  // DbHelperをinstance化する
  static final ShopsHelper instance = ShopsHelper._createInstance();

  ShopsHelper._createInstance();

  // shopsテーブルのデータを全件取得する
  Future<List<Shops>> selectAllShops() async {
    final db = await DbHelper.instance.database;
    final shopsData = await db.query('shops');          // 条件指定しないでshopsテーブルを読み込む

    return shopsData.map((json) => Shops.fromJson(json)).toList();    // 読み込んだテーブルデータをListにパースしてreturn
  }

// _idをキーにして1件のデータを読み込む
  Future<Shops> shopData(int id) async {
    final db = await  DbHelper.instance.database;
    var item = [];
    item = await db.query(
      'shops',
      columns: columns,
      where: 'id = ?',                     // 渡されたidをキーにしてshopsテーブルを読み込む
      whereArgs: [id],
    );
      return Shops.fromJson(item.first);      // 1件だけなので.toListは不要
  }

// データをinsertする
  Future insert(Shops shops) async {
    final db = await  DbHelper.instance.database;
    return await db.insert(
      'shops',
      shops.toJson()                         // shops.dartで定義しているtoJson()で渡されたshopsをパースして書き込む
      );
  }

// データをupdateする
  Future update(Shops shops) async {
    final db = await  DbHelper.instance.database;
    return await db.update(
      'shops',
      shops.toJson(),
      where: 'id = ?',                   // idで指定されたデータを更新する
      whereArgs: [shops.id],
    );
  }

// データを削除する
  Future delete(int id) async {
    final db = await  DbHelper.instance.database;
    return await db.delete(
      'shops',
      where: 'id = ?',                   // idで指定されたデータを削除する
      whereArgs: [id],
    );
  }
}
