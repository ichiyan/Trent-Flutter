import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:basecode/models/Truck.dart';

class CalendarScreen extends StatefulWidget {
  static String routeName = "/calendar";
  final Truck truck;

  CalendarScreen({@required this.truck});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // DateTime selectedDay = DateTime(2022, 1, 1);
  // List<DateTime> bookedDates = [
  //   DateTime(2022, 1, 1),
  //   DateTime(2022, 1, 2),
  //   DateTime(2022, 1, 3)
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime(2021),
          lastDay: DateTime(2050),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            titleCentered: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
            headerPadding: EdgeInsets.only(top: 25.0, bottom: 25.0),
            headerMargin: EdgeInsets.only(bottom: 15.0),
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
          calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
            ),
            selectedTextStyle: TextStyle(
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
            selectedDecoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
