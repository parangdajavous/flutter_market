import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    print("HomeScreen Build");
    return Scaffold(
      body: Center(child: Text("HomeScreen")),
    );
  }
}
