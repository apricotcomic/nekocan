import 'package:nekocan/model/items.dart';
import 'package:nekocan/common/db_helper.dart';

// itemsテーブルのカラム名を設定
const String columnId = 'id';
const String columnItemName = 'itemName';
const String columnBuyShop = 'buyShop';
const String columnQuantity = 'quantity';
const String columnCreatedAt = 'createdAt';

// itemsテーブルのカラム名をListに設定
const List<String> columns = [
  columnId,
  columnItemName,
  columnBuyShop,
  columnQuantity,
  columnCreatedAt,
];

// itemsテーブルへのアクセスをまとめたクラス
class ItemsHelper {
  // DbHelperをinstance化する
  static final ItemsHelper instance = ItemsHelper._createInstance();

  ItemsHelper._createInstance();

  // itemsテーブルのデータを全件取得する
  Future<List<Items>> selectAllItems() async {
    final db = await DbHelper.instance.database;
    final itemsData = await db.query('items');          // 条件指定しないでitemsテーブルを読み込む

    return itemsData.map((json) => Items.fromJson(json)).toList();    // 読み込んだテーブルデータをListにパースしてreturn
  }

// _idをキーにして1件のデータを読み込む
  Future<Items> itemData(int id) async {
    final db = await  DbHelper.instance.database;
    var item = [];
    item = await db.query(
      'items',
      columns: columns,
      where: 'id = ?',                     // 渡されたidをキーにしてitemsテーブルを読み込む
      whereArgs: [id],
    );
      return Items.fromJson(item.first);      // 1件だけなので.toListは不要
  }

// データをinsertする
  Future insert(Items items) async {
    final db = await  DbHelper.instance.database;
    return await db.insert(
      'items',
      items.toJson()                         // items.dartで定義しているtoJson()で渡されたitemsをパースして書き込む
      );
  }

// データをupdateする
  Future update(Items items) async {
    final db = await  DbHelper.instance.database;
    return await db.update(
      'items',
      items.toJson(),
      where: 'id = ?',                   // idで指定されたデータを更新する
      whereArgs: [items.id],
    );
  }

// データを削除する
  Future delete(int id) async {
    final db = await  DbHelper.instance.database;
    return await db.delete(
      'items',
      where: 'id = ?',                   // idで指定されたデータを削除する
      whereArgs: [id],
    );
  }
}
