import 'package:flutter/material.dart';
import 'package:nekocan/settings/cats/view/cats_list.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({Key? key}) : super(key: key);

  static const List _cardList = ['猫', '商品', '店'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Container(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: _cardList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
                  onTap: () {
                    // tap処理
                    gotoNextScreen(context, index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ListTile(
                        title: Text(_cardList[index]),
                      ),
                    ],
                  )));
        },
      ),
    ));
  }

  void gotoNextScreen(BuildContext context, int index) {
    if (index == 0) {
      var route = MaterialPageRoute(
        settings: const RouteSettings(name: '/settings/cats/cats_list'),
        builder: (BuildContext context) => const CatList(),
      );
      Navigator.push(context, route);
    } else {
      if (index == 1) {
        var route = MaterialPageRoute(
          settings: const RouteSettings(name: '/settings/setting_menu'),
          builder: (BuildContext context) => const SettingMenu(),
        );
        Navigator.push(context, route);
      } else {
        if (index == 2) {
          var route = MaterialPageRoute(
            settings: const RouteSettings(name: '/settings/setting_menu'),
            builder: (BuildContext context) => const SettingMenu(),
          );
          Navigator.push(context, route);
        }
      }
    }
  }
}
