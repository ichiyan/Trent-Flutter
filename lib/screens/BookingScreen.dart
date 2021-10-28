import 'package:basecode/screens/TruckSelectionScreen.dart';
import 'package:basecode/widgets/Avatar.dart';
import 'package:basecode/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = "/booking";

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
//replace this url during integration with driver image
  String imageUrl = "https://picsum.photos/200/305";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset(
            'assets/images/logo.png',
            width: width * .45,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * .90,
              child: Column(
                children: [
                  SizedBox(height: height * .1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Avatar(width * .30, imageUrl),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                            child: Text(
                              "Welcome",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                            child: Text(
                              "Victoria Robertson",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height * .1),
                  PrimaryButton(
                    text: "Select Vehicles",
                    iconData: null,
                    onPress: () {
                      navigateToPage(TruckSelectionScreen.routeName);
                    },
                    height: 60,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  navigateToPage(String routeName) {
    Get.toNamed(routeName);
  }
}
