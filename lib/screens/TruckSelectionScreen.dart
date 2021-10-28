import 'package:basecode/screens/BookingConfirmationScreen.dart';
import 'package:basecode/widgets/TruckTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              width: width * .95,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  TruckTile(
                      1,
                      this.navigateToConfirmation,
                      "Truck 1",
                      "4.2 x 2.2 x 4.2",
                      "2000Kg",
                      "assets/images/truck-orange.png"),
                  TruckTile(
                      2,
                      this.navigateToConfirmation,
                      "Truck 1",
                      "4.2 x 2.2 x 4.2",
                      "2000Kg",
                      "assets/images/truck-orange.png"),
                  TruckTile(
                      3,
                      this.navigateToConfirmation,
                      "Truck 1",
                      "4.2 x 2.2 x 4.2",
                      "2000Kg",
                      "assets/images/truck-orange.png"),
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

  navigateToConfirmation(int id) {
    Get.toNamed(BookingConfirmationScreen.routeName);
  }
}
