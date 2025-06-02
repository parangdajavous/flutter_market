import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market/screens/chatting/chatting_screen.dart';
import 'package:flutter_market/screens/home/home_screen.dart';
import 'package:flutter_market/screens/home/my_carrot/my_carrrot_screen.dart';
import 'package:flutter_market/screens/near_me/near_me_screen.dart';
import 'package:flutter_market/screens/neighborhood_life/neighborhoodlife_screen.dart';

class MainScreens extends StatefulWidget {
  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int selectedIndex = 0;
  List<int> loadPages = [0]; // 크기는 1

  void selectMenuButton(int index) {
    if (!loadPages.contains(index)) {
      loadPages.add(index); // [0,1]  <- 없으면 배열에 담기면서 크기가 늘어난다 / 크기 2
    }

    selectedIndex = index;
    setState(() {}); // 강제로 rebuild 하기 때문에 깊은 복사 필요 없음 / 현재 상태대로(0,1이 들어온 상태) 다시 그린다
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          loadPages.contains(0) ? const HomeScreen() : Container(),
          loadPages.contains(1) ? const NeighborhoodlifeScreen() : Container(),
          loadPages.contains(2) ? const NearMeScreen() : Container(),
          loadPages.contains(3) ? const ChattingScreen() : Container(),
          loadPages.contains(4) ? const MyCarrrotScreen() : Container(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //showSelectedLabels: false,
      //showUnselectedLabels: false,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      currentIndex: selectedIndex,
      onTap: selectMenuButton,
      selectedLabelStyle: TextStyle(fontSize: 12), // 고정 크기
      unselectedLabelStyle: TextStyle(fontSize: 12), // 고정 크기
      items: [
        BottomNavigationBarItem(label: "홈", icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(label: "동네생활", icon: Icon(CupertinoIcons.square_on_square)),
        BottomNavigationBarItem(label: "내 근처", icon: Icon(CupertinoIcons.placemark)),
        BottomNavigationBarItem(label: "채팅", icon: Icon(CupertinoIcons.chat_bubble_2)),
        BottomNavigationBarItem(label: "나의 당근", icon: Icon(CupertinoIcons.person)),
      ],
    );
  }
}
