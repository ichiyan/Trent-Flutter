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
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: width * 0.45,
        titleSpacing: 0,
        title: Text(
          "Vehicles",
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Back",
              style: TextStyle(
                color: kAccentColor,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                "Filter",
                style: TextStyle(
                  color: kAccentColor,
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
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
