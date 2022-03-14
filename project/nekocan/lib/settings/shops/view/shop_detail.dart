import 'package:flutter/material.dart';
import 'package:nekocan/model/shops.dart';
import 'package:nekocan/common/shops_helper.dart';
import 'package:nekocan/settings/shops/view/shop_edit.dart';

// shopsテーブルの中の1件のデータに対する操作を行うクラス
class ShopDetail extends StatefulWidget {
  final int id;

  const ShopDetail({Key? key, required this.id}) : super(key: key);

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  late Shops shops;
  bool isLoading = false;
  static const int textExpandedFlex = 1; // 見出しのexpaded flexの比率
  static const int dataExpandedFlex = 4; // 項目のexpanede flexの比率


// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、渡されたidをキーとしてshopsテーブルからデータを取得する
  @override
  void initState() {
    super.initState();
    shopData();
  }

// initStateで動かす処理
// shopsテーブルから指定されたidのデータを1件取得する
  Future shopData() async {
    setState(() => isLoading = true);
    shops = await ShopsHelper.instance.shopData(widget.id);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店詳細'),
        actions: [
          IconButton(
            onPressed: () async {                          // 鉛筆のアイコンが押されたときの処理を設定
              await Navigator.of(context).push(            // ページ遷移をNavigatorで設定
                MaterialPageRoute(
                  builder: (context) => ShopEdit(    // 詳細更新画面を表示する
                    shops: shops,
                  ),
                ),
              );
              shopData();                                  // 更新後のデータを読み込む
            },
            icon: const Icon(Icons.edit),                 // 鉛筆マークのアイコンを表示
          ),
          IconButton(
            onPressed: () async {                         // ゴミ箱のアイコンが押されたときの処理を設定
              await ShopsHelper.instance.delete(widget.id);  // 指定されたidのデータを削除する
              Navigator.of(context).pop();                // 削除後に前の画面に戻る
            },
            icon: const Icon(Icons.delete),               // ゴミ箱マークのアイコンを表示
          )
        ],
      ),
      body: isLoading                                     //「読み込み中」だったら「グルグル」が表示される
          ? const Center(
              child: CircularProgressIndicator(),         // これが「グルグル」の処理
            )
          : Column(
              children :[
                  Column(                                             // 縦並びで項目を表示
                    crossAxisAlignment: CrossAxisAlignment.stretch,   // 子要素の高さを合わせる
                    children: [
                      Row(children: [
                        const Expanded(                               // 見出しの設定
                          flex: textExpandedFlex,
                          child: Text('店名',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: dataExpandedFlex,
                          child: Container(                           // shopsテーブルのshopNameの表示を設定
                            padding: const EdgeInsets.all(5.0),
                            child: Text(shops.shopName),
                          ),
                        ),
                      ],),
                    ],
                  ),
              //  ),
              ],
          )
    
    );
  }
}
