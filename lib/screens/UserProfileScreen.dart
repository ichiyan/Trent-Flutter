import 'dart:ui';

import 'package:basecode/widgets/BookingTile.dart';
import 'package:basecode/widgets/Review.dart';
import 'package:flutter/material.dart';
import 'package:basecode/widgets/Avatar.dart';
import 'package:basecode/constants.dart';
import 'package:basecode/data/bookingsData.dart';

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
      child: DefaultTabController(
        length: 2,
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
                        child: Avatar(height * 0.2, imageUrl),
                        bottom: -50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.09,
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
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xF666666),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.grey[300],
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TabBar(
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                labelColor: Color(0xFFF58F29),
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(4, 4),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                unselectedLabelColor: kSecondaryColor,
                                unselectedLabelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                                tabs: [
                                  Tab(text: "Bookings"),
                                  Tab(text: "Reviews"),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          height: height * 0.4,
                          child: TabBarView(
                            children: [
                              ListView.builder(
                                itemCount: bookings.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: BookingTile(
                                      header: bookings[index].header,
                                      details: bookings[index].details,
                                      image: bookings[index].image,
                                    ),
                                    onTap: () {},
                                  );
                                },
                              ),
                              ListView(
                                children: [
                                  Review(
                                    truckName: "Truck 1",
                                    dateBooked: "March 1, 2020",
                                    rating: 2.5,
                                    image:
                                        "https://cdn.motor1.com/images/mgl/3KVzA/s1/fastest-trucks-lead.jpg",
                                  ),
                                  Review(
                                    truckName: "Truck 2",
                                    dateBooked: "December 1, 2020",
                                    rating: 4,
                                    image:
                                        "https://cdn.motor1.com/images/mgl/3KVzA/s1/fastest-trucks-lead.jpg",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
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
