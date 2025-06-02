import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market/screens/chatting/chatting_screen.dart';
import 'package:flutter_market/screens/home/home_screen.dart';
import 'package:flutter_market/screens/my_carrot/my_carrrot_screen.dart';
import 'package:flutter_market/screens/near_me/near_me_screen.dart';
import 'package:flutter_market/screens/neighborhood_life/neighborhoodlife_screen.dart';

class MainScreens extends StatefulWidget {
  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int selectedIndex = 0;
  final List<Widget?> _screens = List.filled(5, null);

  @override
  void initState() {
    super.initState();
    _screens[0] = HomeScreen(); // 처음은 미리 생성
  }

  void selectBottomMenu(int index) {
    if (_screens[index] == null) {
      _screens[index] = _buildScreen(index); // 처음 클릭 시 생성
    }

    setState(() {
      selectedIndex = index;
    });
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return NeighborhoodlifeScreen();
      case 2:
        return NearMeScreen();
      case 3:
        return ChattingScreen();
      case 4:
        return MyCarrrotScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _screens.map((screen) => screen ?? Container()).toList(),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black54,
      currentIndex: selectedIndex,
      onTap: selectBottomMenu,
      items: const [
        BottomNavigationBarItem(label: "홈", icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(label: "동네생활", icon: Icon(CupertinoIcons.square_on_square)),
        BottomNavigationBarItem(label: "내근처", icon: Icon(CupertinoIcons.placemark)),
        BottomNavigationBarItem(label: "채팅", icon: Icon(CupertinoIcons.chat_bubble_2)),
        BottomNavigationBarItem(label: "나의당근", icon: Icon(CupertinoIcons.person)),
      ],
    );
  }
}
