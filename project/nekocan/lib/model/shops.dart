import 'package:nekocan/common/shops_helper.dart';
import 'package:intl/intl.dart';

// 商品テーブルの定義
class Shops {
  int? id;
  String shopName;
  DateTime createdAt;

  Shops(
      {this.id,
      required this.shopName,
      required this.createdAt});

// 更新時のデータを入力項目からコピーする処理
  Shops copy({
    int? id,
    String? shopName,
    DateTime? createdAt,
  }) =>
      Shops(
          id: id ?? this.id,
          shopName: shopName ?? this.shopName,
          createdAt: createdAt ?? this.createdAt,
        );
  
  static Shops fromJson(Map<String, Object?> json) => Shops(
    id: json[columnId] as int,
    shopName: json[columnShopName] as String,
    createdAt: DateTime.parse(json[columnCreatedAt] as String),
    );

  Map<String, Object?> toJson() => {
    columnShopName: shopName,
    columnCreatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt),
  };
}
