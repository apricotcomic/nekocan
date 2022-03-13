import 'package:nekocan/common/items_helper.dart';
import 'package:intl/intl.dart';

// 商品テーブルの定義
class Items {
  int? id;
  String itemName;
  String buyShop;
  int? quantity;
  DateTime createdAt;

  Items(
      {this.id,
      required this.itemName,
      required this.buyShop,
      required this.quantity,
      required this.createdAt});

// 更新時のデータを入力項目からコピーする処理
  Items copy({
    int? id,
    String? itemName,
    String? buyShop,
    int? quantity,
    DateTime? createdAt,
  }) =>
      Items(
          id: id ?? this.id,
          itemName: itemName ?? this.itemName,
          buyShop: buyShop ?? this.buyShop,
          quantity: quantity ?? this.quantity,
          createdAt: createdAt ?? this.createdAt,
        );
  
  static Items fromJson(Map<String, Object?> json) => Items(
    id: json[columnId] as int,
    itemName: json[columnItemName] as String,
    buyShop: json[columnBuyShop] as String,
    quantity: json[columnQuantity] as int,
    createdAt: DateTime.parse(json[columnCreatedAt] as String),
    );

  Map<String, Object?> toJson() => {
    columnItemName: itemName,
    columnBuyShop: buyShop,
    columnQuantity: quantity,
    columnCreatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt),
  };
}
