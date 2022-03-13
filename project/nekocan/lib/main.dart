import 'package:flutter/material.dart';
import 'package:nekocan/settings/setting_menu.dart';

void main() {
  runApp(const NekocanApp());
}

class NekocanApp extends StatelessWidget {
  const NekocanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nekocan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NekocanHomePage(title: '猫缶'),
    );
  }
}

class NekocanHomePage extends StatefulWidget {
  const NekocanHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NekocanHomePage> createState() => _NekocanHomePageState();
}

class _NekocanHomePageState extends State<NekocanHomePage> {
  final List _cardList = ['あげたもの', '買ったもの', '設定'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
        settings: const RouteSettings(name: '/settings/setting_menu'),
        builder: (BuildContext context) => SettingMenu(),
      );
      Navigator.push(context, route);
    } else {
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
        }
      }
    }
  }
}
