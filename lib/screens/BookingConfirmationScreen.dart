import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingConfirmationScreen extends StatefulWidget {
  static String routeName = "/bookingConfirmation";

  @override
  _BookingConfirmationScreenState createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  navigateToPage(String routeName) {
    Get.toNamed(routeName);
  }
}
