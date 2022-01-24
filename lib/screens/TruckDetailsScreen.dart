import 'package:basecode/constants.dart';
import 'package:basecode/models/Truck.dart';
import 'package:basecode/widgets/PrimaryButton.dart';
import 'package:basecode/widgets/SecondaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TruckDetailsScreen extends StatefulWidget {
  static String routeName = "/truckDetails";
  final Truck truck;

  TruckDetailsScreen({@required this.truck});

  @override
  _TruckDetailsScreenState createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.12,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: width * 0.2,
        titleSpacing: 0,
        title: Container(
          child: Text(
            "Vehicles",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Back",
              style: TextStyle(
                color: kAccentColor,
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
                  "Filter",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kAccentColor,
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
          child: Container(
            width: width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.grey,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image(
                    image: NetworkImage(widget.truck.image),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.truck.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Status: " + widget.truck.status.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.truck.body,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey[600],
                      height: 1.25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                PrimaryButton(
                  text: "Book Truck Services",
                  onPress: () {},
                  height: 55.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SecondaryButton(
                  text: "Check Available Dates",
                  onPress: () {},
                  height: 55.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
