import 'package:basecode/constants.dart';
import 'package:basecode/screens/BookingScreen.dart';
import 'package:basecode/screens/TruckCatalogScreen.dart';
import 'package:basecode/screens/UserProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    UserProfileScreen(),
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
            icon: FaIcon(FontAwesomeIcons.bookOpen),
            title: Text("Catalog"),
            selectedColor: kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: FaIcon(FontAwesomeIcons.truckMoving),
            title: Text("Book"),
            selectedColor: kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: FaIcon(FontAwesomeIcons.userAlt),
            title: Text("Profile"),
            selectedColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
