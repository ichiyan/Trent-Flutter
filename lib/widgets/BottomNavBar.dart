import 'package:basecode/constants.dart';
import 'package:basecode/screens/BookingScreen.dart';
import 'package:basecode/screens/TruckCatalogScreen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  List<Widget> tabs = <Widget>[
    TruckCatalogScreen(),
    BookingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients) {
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_rounded),
            title: Text("Home"),
            selectedColor: kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            title: Text("Likes"),
            selectedColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
