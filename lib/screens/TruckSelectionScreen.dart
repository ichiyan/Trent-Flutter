import 'package:basecode/constants.dart';
import 'package:basecode/screens/BookingConfirmationScreen.dart';
import 'package:basecode/widgets/PrimaryButton.dart';
import 'package:basecode/widgets/TruckTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TruckSelectionScreen extends StatefulWidget {
  static String routeName = "/truckSelection";

  @override
  _TruckSelectionScreenState createState() => _TruckSelectionScreenState();
}

class _TruckSelectionScreenState extends State<TruckSelectionScreen> {
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: kAccentColor,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * .95,
              child: Column(
                children: [
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      TruckTile(
                        1,
                        "Truck 1",
                        "4.2 x 2.2 x 4.2",
                        "2000Kg",
                      ),
                      TruckTile(
                        2,
                        "Truck 1",
                        "4.2 x 2.2 x 4.2",
                        "2000Kg",
                      ),
                      TruckTile(
                        3,
                        "Truck 1",
                        "4.2 x 2.2 x 4.2",
                        "2000Kg",
                      ),
                      TruckTile(
                        3,
                        "Truck 1",
                        "4.2 x 2.2 x 4.2",
                        "2000Kg",
                      ),
                      TruckTile(
                        3,
                        "Truck 1",
                        "4.2 x 2.2 x 4.2",
                        "2000Kg",
                      ),
                      TruckTile(
                        3,
                        "Truck 1",
                        "4.2 x 2.2 x 4.2",
                        "2000Kg",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrimaryButton(
                text: "Select Vehicles",
                iconData: null,
                onPress: () {
                  pushNewScreen(context,
                      screen: BookingConfirmationScreen(),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.fade);
                },
                height: 48,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
