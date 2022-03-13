import 'package:flutter/material.dart';
import 'package:nekocan/model/items.dart';
import 'package:nekocan/common/items_helper.dart';
import 'package:nekocan/settings/items/view/item_edit.dart';

// itemsテーブルの中の1件のデータに対する操作を行うクラス
class ItemDetail extends StatefulWidget {
  final int id;

  const ItemDetail({Key? key, required this.id}) : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  late Items items;
  bool isLoading = false;
  static const int textExpandedFlex = 1; // 見出しのexpaded flexの比率
  static const int dataExpandedFlex = 4; // 項目のexpanede flexの比率


// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、渡されたidをキーとしてitemsテーブルからデータを取得する
  @override
  void initState() {
    super.initState();
    itemData();
  }

// initStateで動かす処理
// itemsテーブルから指定されたidのデータを1件取得する
  Future itemData() async {
    setState(() => isLoading = true);
    items = await ItemsHelper.instance.itemData(widget.id);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('猫詳細'),
        actions: [
          IconButton(
            onPressed: () async {                          // 鉛筆のアイコンが押されたときの処理を設定
              await Navigator.of(context).push(            // ページ遷移をNavigatorで設定
                MaterialPageRoute(
                  builder: (context) => ItemEdit(    // 詳細更新画面を表示する
                    items: items,
                  ),
                ),
              );
              itemData();                                  // 更新後のデータを読み込む
            },
            icon: const Icon(Icons.edit),                 // 鉛筆マークのアイコンを表示
          ),
          IconButton(
            onPressed: () async {                         // ゴミ箱のアイコンが押されたときの処理を設定
              await ItemsHelper.instance.delete(widget.id);  // 指定されたidのデータを削除する
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
                Container(                      // アイコンを表示
                  width: 80,height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/picture/kinkan_maguro.png')
                    )
                  )
                ),
                  Column(                                             // 縦並びで項目を表示
                    crossAxisAlignment: CrossAxisAlignment.stretch,   // 子要素の高さを合わせる
                    children: [
                      Row(children: [
                        const Expanded(                               // 見出しの設定
                          flex: textExpandedFlex,
                          child: Text('商品名',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: dataExpandedFlex,
                          child: Container(                           // itemsテーブルのitemNameの表示を設定
                            padding: const EdgeInsets.all(5.0),
                            child: Text(items.itemName),
                          ),
                        ),
                      ],),
                      Row(children: [
                        const Expanded(                              // 見出しの設定（店名)
                          flex: textExpandedFlex,
                          child: Text('買った店',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: dataExpandedFlex,
                          child: Container(                          // itemsテーブルのbuyShopの表示を設定
                            padding: const EdgeInsets.all(5.0),
                            child: Text(items.buyShop),
                          ),
                        ),
                      ],),
                      Row(children: [
                        const Expanded(           // 「数量」の見出し行の設定
                          flex: textExpandedFlex,
                          child: Text('数',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: dataExpandedFlex,
                          child: Container(                                      // itemsテーブルのquantityの表示を設定
                            padding: const EdgeInsets.all(5.0),
                            child: Text(items.quantity.toString()),
                          ),
                        )
                      ],),
                    ],
                  ),
              //  ),
              ],
          )
    
    );
  }
}
