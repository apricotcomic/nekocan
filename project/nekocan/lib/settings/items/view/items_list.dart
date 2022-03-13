import 'package:flutter/material.dart';
import 'package:nekocan/model/items.dart';
import 'package:nekocan/common/items_helper.dart';
import 'package:nekocan/settings/items/view/item_detail.dart';
import 'package:nekocan/settings/items/view/item_edit.dart';

// itemテーブルの内容全件を一覧表示するクラス
class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemList> {
  List<Items> itemList = [];  //itemsテーブルの全件を保有する
  bool isLoading = false;   //テーブル読み込み中の状態を保有する

// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、初期処理としてItemsの全データを取得する。
  @override
  void initState() {
    super.initState();
    getItemsList();
  }

// initStateで動かす処理。
// itemsテーブルに登録されている全データを取ってくる
  Future getItemsList() async {
    setState(() => isLoading = true);                   //テーブル読み込み前に「読み込み中」の状態にする
    itemList = await ItemsHelper.instance.selectAllItems();  //itemsテーブルを全件読み込む
    setState(() => isLoading = false);                  //「読み込み済」の状態にする
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('商品一覧')),
      body: isLoading                               //「読み込み中」だったら「グルグル」が表示される
        ? const Center(
            child: CircularProgressIndicator(),   // これが「グルグル」の処理
          )
        : SizedBox(
            child: ListView.builder(              // 取得したitemsテーブル全件をリスト表示する
              itemCount: itemList.length,          // 取得したデータの件数を取得
              itemBuilder: (BuildContext context, int index) {
                final item = itemList[index];       // 1件分のデータをitemに取り出す
                return Card(                      // ここで1件分のデータを表示
                  child: InkWell(                 // cardをtapしたときにそのcardの詳細画面に遷移させる
                    child: Padding(               // cardのpadding設定
                      padding: const EdgeInsets.all(15.0),
                        child: Row(                 // cardの中身をRowで設定
                          children: <Widget>[               // Rowの中身を設定
                            Container(                      // アイコンを表示
                              width: 80,height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,     // 丸にする
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/picture/kinkan_maguro.png')
                                )
                              )
                            ),
                            Text(item.itemName,style: const TextStyle(fontSize: 30),),     // itemのnameを表示
                          ]
                        ),
                    ),
                    onTap: () async {                     // cardをtapしたときの処理を設定
                      await Navigator.of(context).push(   // ページ遷移をNavigatorで設定
                        MaterialPageRoute(
                          builder: (context) => ItemDetail(id: item.id!),   // cardのデータの詳細を表示するitem_detail.dartへ遷移
                        ),
                      );
                      getItemsList();    // データが更新されているかもしれないので、itemsテーブル全件読み直し
                    },
                  ),
                );
              },
            ),
          ),
      floatingActionButton: FloatingActionButton(                   // ＋ボタンを下に表示する
        child: const Icon(Icons.add),                               // ボタンの形を指定
        onPressed: () async {                                       // ＋ボタンを押したときの処理を設定
          await Navigator.of(context).push(                         // ページ遷移をNavigatorで設定
            MaterialPageRoute(
              builder: (context) => const ItemEdit()           // 詳細更新画面（元ネタがないから新規登録）を表示するitem_detail_edit.dartへ遷移
            ),
          );
          getItemsList();                                            // 新規登録されているので、Itemテーブル全件読み直し
        },
      ),
    );
  }
}
