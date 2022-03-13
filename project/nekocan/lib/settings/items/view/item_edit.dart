import 'package:flutter/material.dart';
import 'package:nekocan/model/items.dart';
import 'package:nekocan/common/items_helper.dart';

class ItemEdit extends StatefulWidget {
  final Items? items;

  const ItemEdit({Key? key, this.items}) : super(key: key);

  @override
  _ItemEditState createState() => _ItemEditState();
}

class _ItemEditState extends State<ItemEdit> {
  late int id;
  late String itemName;
  late String buyShop;
  late int quantity;
  late DateTime createdAt;
  static const int textExpandedFlex = 1; // 見出しのexpaded flexの比率
  static const int dataExpandedFlex = 4; // 項目のexpanede flexの比率

// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、各項目の初期値を設定する
  @override
  void initState() {
    super.initState();
    id = widget.items?.id ?? 0;
    itemName = widget.items?.itemName ?? '';
    buyShop = widget.items?.buyShop ?? '';
    quantity = widget.items?.quantity ?? 0;
    createdAt = widget.items?.createdAt ?? DateTime.now();
  }

// 詳細編集画面を表示する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品編集'),
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
              child: Text('商品名',
                textAlign: TextAlign.center,
              ), 
            ),
            Expanded(                         // 商品名入力エリアの設定
              flex: dataExpandedFlex,
              child: TextFormField(
                maxLines: 1,
                initialValue: itemName,
                decoration: const InputDecoration(
                  //labelText: '商品名',
                  hintText: '商品名を入力してください',
                ),
                validator: (itemName) => itemName != null && itemName.isEmpty
                    ? '商品名は必ず入れてね'
                    : null, // validateを設定
                onChanged: (itemName) => setState(() => this.itemName = itemName),
              ),
            ),
          ]),
          Row(children: [
            const Expanded(                 // 見出し（店舗名）
              flex: textExpandedFlex,
              child: Text('買った店',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(                     // 店舗名入力エリアの設定
              flex: dataExpandedFlex,
              child: TextFormField(
                maxLines: 1,
                initialValue: buyShop,
                decoration: const InputDecoration(
                  hintText: '買った店を入力してください',
                ),
                onChanged: (buyShop) =>
                    setState(() => this.buyShop = buyShop),
              ),
            ),
          ]),
          Row(children: [
            const Expanded(                     // 見出し（数量）
              flex: textExpandedFlex,
              child: Text('数',
                textAlign: TextAlign.center,
                )
            ),
            Expanded(                           // 数量入力エリアの設定
              flex: dataExpandedFlex,
              child: TextFormField(
                maxLines: 1,
                initialValue: quantity.toString(),
                decoration: const InputDecoration(
                  hintText: '数を入力してください',
                ),
                onChanged: (quantity) => setState(() => this.quantity = int.parse(quantity)),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

// 保存ボタンの設定
  Widget buildSaveButton() {
    final isFormValid = itemName.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: const Text('保存'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? Colors.redAccent : Colors.grey.shade700,
        ),
        onPressed: createOrUpdateItem, // 保存ボタンを押したら実行する処理を指定する
      ),
    );
  }

// 保存ボタンを押したとき実行する処理
  void createOrUpdateItem() async {
    final isUpdate = (widget.items != null);     // 画面が空でなかったら

    if (isUpdate) {
      await updateItem();                        // updateの処理
    } else {
      await createItem();                        // insertの処理
    }

    Navigator.of(context).pop();                // 前の画面に戻る
  }

  // 更新処理の呼び出し
  Future updateItem() async {
    final cat = widget.items!.copy(              // 画面の内容をcatにセット
      itemName: itemName,
      buyShop: buyShop,
      quantity: quantity,
    );

    await ItemsHelper.instance.update(cat);        // catの内容で更新する
  }

  // 追加処理の呼び出し
  Future createItem() async {
    final item = Items(                           // 入力された内容をcatにセット
      id: id,
      itemName: itemName,
      buyShop: buyShop,
      quantity: quantity,
      createdAt: createdAt,
    );
    await ItemsHelper.instance.insert(item);        // catの内容で追加する
  }
}
