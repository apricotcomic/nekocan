import 'package:flutter/material.dart';
import 'package:nekocan/model/shops.dart';
import 'package:nekocan/common/shops_helper.dart';

class ShopEdit extends StatefulWidget {
  final Shops? shops;

  const ShopEdit({Key? key, this.shops}) : super(key: key);

  @override
  _ShopEditState createState() => _ShopEditState();
}

class _ShopEditState extends State<ShopEdit> {
  late int id;
  late String shopName;
  late DateTime createdAt;
  static const int textExpandedFlex = 1; // 見出しのexpaded flexの比率
  static const int dataExpandedFlex = 4; // 項目のexpanede flexの比率

// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、各項目の初期値を設定する
  @override
  void initState() {
    super.initState();
    id = widget.shops?.id ?? 0;
    shopName = widget.shops?.shopName ?? '';
    createdAt = widget.shops?.createdAt ?? DateTime.now();
  }

// 詳細編集画面を表示する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店編集'),
        actions: [
          buildSaveButton(), // 保存ボタンを表示する
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Row(children: [
            // 名前の行の設定
            const Expanded(                   // 見出し（名前）
              flex: textExpandedFlex,
              child: Text('店名',
                textAlign: TextAlign.center,
              ), 
            ),
            Expanded(                         // 商品名入力エリアの設定
              flex: dataExpandedFlex,
              child: TextFormField(
                maxLines: 1,
                initialValue: shopName,
                decoration: const InputDecoration(
                  //labelText: '商品名',
                  hintText: '店名を入力してください',
                ),
                validator: (shopName) => shopName != null && shopName.isEmpty
                    ? '店名は必ず入れてね'
                    : null, // validateを設定
                onChanged: (shopName) => setState(() => this.shopName = shopName),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

// 保存ボタンの設定
  Widget buildSaveButton() {
    final isFormValid = shopName.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: const Text('保存'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? Colors.redAccent : Colors.grey.shade700,
        ),
        onPressed: createOrUpdateShop, // 保存ボタンを押したら実行する処理を指定する
      ),
    );
  }

// 保存ボタンを押したとき実行する処理
  void createOrUpdateShop() async {
    final isUpdate = (widget.shops != null);     // 画面が空でなかったら

    if (isUpdate) {
      await updateShop();                        // updateの処理
    } else {
      await createShop();                        // insertの処理
    }

    Navigator.of(context).pop();                // 前の画面に戻る
  }

  // 更新処理の呼び出し
  Future updateShop() async {
    final cat = widget.shops!.copy(              // 画面の内容をcatにセット
      shopName: shopName,
    );

    await ShopsHelper.instance.update(cat);        // catの内容で更新する
  }

  // 追加処理の呼び出し
  Future createShop() async {
    final shop = Shops(                           // 入力された内容をcatにセット
      id: id,
      shopName: shopName,
      createdAt: createdAt,
    );
    await ShopsHelper.instance.insert(shop);        // catの内容で追加する
  }
}
