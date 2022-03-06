import 'package:flutter/material.dart';



class SettingMenu extends StatelessWidget {
  final List _cardList = ['猫', '商品', '店'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    if (index == 1) {
      var route = MaterialPageRoute(
        settings: const RouteSettings(name: '/settings/setting_menu'),
        builder: (BuildContext context) => SettingMenu(),
      );
      Navigator.push(context, route);
    } else {
      if (index == 2) {
        var route = MaterialPageRoute(
          settings: const RouteSettings(name: '/settings/setting_menu'),
          builder: (BuildContext context) => SettingMenu(),
        );
        Navigator.push(context, route);
      } else {
        if (index == 3) {
          var route = MaterialPageRoute(
            settings: const RouteSettings(name: '/settings/setting_menu'),
            builder: (BuildContext context) => SettingMenu(),
          );
          Navigator.push(context, route);
        }
      }
    }
  }
  
}