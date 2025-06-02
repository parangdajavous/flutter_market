import 'package:flutter/material.dart';
import 'package:flutter_market/models/icon_menu.dart';
import 'package:flutter_market/screens/home/my_carrot/components/card_icon_menu.dart';
import 'package:flutter_market/screens/home/my_carrot/components/my_carrot_header.dart';

class MyCarrrotScreen extends StatelessWidget {
  const MyCarrrotScreen();

  @override
  Widget build(BuildContext context) {
    print("MyCarrrotScreen Build");
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("나의 당근"),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0.5),
          child: Divider(
            thickness: 0.5,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        children: [
          MyCarrotHeader(),
          SizedBox(height: 8),
          CardIconMenu(iconMenuList: iconMenu1),
          SizedBox(height: 8),
          CardIconMenu(iconMenuList: iconMenu2),
          SizedBox(height: 8),
          CardIconMenu(iconMenuList: iconMenu3),
        ],
      ),
    );
  }
}
