import 'package:flutter/material.dart';
import 'package:basecode/widgets/Avatar.dart';
import 'package:basecode/constants.dart';

class UserProfileScreen extends StatefulWidget {
  static String routeName = "/userprofile";

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  //replace this url during integration with user image
  String imageUrl = "https://picsum.photos/200/305";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.12,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          leadingWidth: width * 0.2,
          titleSpacing: 0,
          title: Container(
            child: Text(
              "Profile",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          leading: Center(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(4, 4),
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(4, 4),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(101, 101, 101, 0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      child: Avatar(158.0, imageUrl),
                      bottom: -50,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "Victoria Robertson",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "A mantra goes here",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
