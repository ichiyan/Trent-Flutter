import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

class BookingDetailsScreen extends StatefulWidget {
  static String routeName = "/bookingDetails";

  @override
  _BookingDetailsScreenState createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
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
          child: Padding(
            padding: EdgeInsets.only(bottom: height * 0.1),
            child: Container(
              width: width,
              height: height,
              color: kPrimaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Image.asset('assets/images/truck-search.png'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Searching for truck...",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: kPrimaryColor,
                          size: 38.0,
                        ),
                      ),
                      Dash(
                        direction: Axis.vertical,
                        length: height * 0.03,
                        dashLength: 5,
                        dashThickness: 2,
                        dashColor: kPrimaryColor,
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: kPrimaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Icon(
                          Icons.location_on_sharp,
                          color: kPrimaryColor,
                          size: 35.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Unit 12 Aurora Garden Plaza,...",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Pick Up Location",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: kSecondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 65.0,
                      ),
                      Text(
                        "41 Langka Road, FTI Comple,...",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Destination",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total",
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PHP ",
                      style: TextStyle(color: kSecondaryColor),
                    ),
                    Text(
                      "1,000.00",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
