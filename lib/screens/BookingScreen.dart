import 'package:basecode/constants.dart';
import 'package:basecode/screens/TruckSelectionScreen.dart';
import 'package:basecode/widgets/Avatar.dart';
import 'package:basecode/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = "/booking";

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
//replace with user image
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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * .90,
              height: height * .90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: height * .05),
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
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.location_searching_sharp,
                                color: kPrimaryColor,
                                size: 35.0,
                              ),
                              Dash(
                                direction: Axis.vertical,
                                length: height * 0.06,
                                dashLength: 5,
                                dashThickness: 2,
                                dashColor: kPrimaryColor,
                              ),
                              Icon(
                                Icons.location_on_sharp,
                                color: kPrimaryColor,
                                size: 35.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Starting Destination...",
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(),
                                TextFormField(
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Booking Destination...",
                                      style: TextStyle(
                                        color: kSecondaryColor,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * .05),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: PrimaryButton(
                        text: "Select Vehicles",
                        iconData: null,
                        onPress: () {
                          // navigateToPage(TruckSelectionScreen.routeName);
                          pushNewScreen(context,
                              screen: TruckSelectionScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade);
                        },
                        height: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
