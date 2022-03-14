import 'package:flutter/material.dart';
import 'package:nekocan/model/shops.dart';
import 'package:nekocan/common/shops_helper.dart';
import 'package:nekocan/settings/shops/view/shop_detail.dart';
import 'package:nekocan/settings/shops/view/shop_edit.dart';

// itemテーブルの内容全件を一覧表示するクラス
class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ShopList> {
  List<Shops> itemList = [];  //shopsテーブルの全件を保有する
  bool isLoading = false;   //テーブル読み込み中の状態を保有する

// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、初期処理としてShopsの全データを取得する。
  @override
  void initState() {
    super.initState();
    getShopsList();
  }

// initStateで動かす処理。
// shopsテーブルに登録されている全データを取ってくる
  Future getShopsList() async {
    setState(() => isLoading = true);                   //テーブル読み込み前に「読み込み中」の状態にする
    itemList = await ShopsHelper.instance.selectAllShops();  //shopsテーブルを全件読み込む
    setState(() => isLoading = false);                  //「読み込み済」の状態にする
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('店一覧')),
      body: isLoading                               //「読み込み中」だったら「グルグル」が表示される
        ? const Center(
            child: CircularProgressIndicator(),   // これが「グルグル」の処理
          )
        : SizedBox(
            child: ListView.builder(              // 取得したshopsテーブル全件をリスト表示する
              itemCount: itemList.length,          // 取得したデータの件数を取得
              itemBuilder: (BuildContext context, int index) {
                final item = itemList[index];       // 1件分のデータをitemに取り出す
                return Card(                      // ここで1件分のデータを表示
                  child: InkWell(                 // cardをtapしたときにそのcardの詳細画面に遷移させる
                    child: Padding(               // cardのpadding設定
                      padding: const EdgeInsets.all(15.0),
                        child: Row(                 // cardの中身をRowで設定
                          children: <Widget>[               // Rowの中身を設定
                            Text(item.shopName,style: const TextStyle(fontSize: 30),),     // itemのnameを表示
                          ]
                        ),
                    ),
                    onTap: () async {                     // cardをtapしたときの処理を設定
                      await Navigator.of(context).push(   // ページ遷移をNavigatorで設定
                        MaterialPageRoute(
                          builder: (context) => ShopDetail(id: item.id!),   // cardのデータの詳細を表示するitem_detail.dartへ遷移
                        ),
                      );
                      getShopsList();    // データが更新されているかもしれないので、shopsテーブル全件読み直し
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
              builder: (context) => const ShopEdit()           // 詳細更新画面（元ネタがないから新規登録）を表示するitem_detail_edit.dartへ遷移
            ),
          );
          getShopsList();                                            // 新規登録されているので、Itemテーブル全件読み直し
        },
      ),
    );
  }
}
