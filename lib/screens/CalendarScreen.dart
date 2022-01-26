import 'package:basecode/constants.dart';
import 'package:basecode/widgets/CustomDenseListTile.dart';
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
  List<DateTime> bookedDates = [
    DateTime.utc(2022, 1, 1),
    DateTime.utc(2022, 1, 2),
    DateTime.utc(2022, 1, 3),
    DateTime.utc(2022, 1, 4),
    DateTime.utc(2022, 1, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2021),
              lastDay: DateTime(2050),
              selectedDayPredicate: (date) {
                return bookedDates.contains(date);
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(101, 101, 101, 0.35),
                      spreadRadius: 5,
                      blurRadius: 7,
                    )
                  ],
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
                  color: kPrimaryColor,
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
            SizedBox(
              height: 14.0,
            ),
            Flexible(
              child: ListView(
                children: [
                  CustomDenseListTile(
                      title: "Booked by Tim Cook", trailing: "January 1-3"),
                  CustomDenseListTile(
                      title: "Booked by Noel Miller", trailing: "January 4"),
                  CustomDenseListTile(
                      title: "Booked by Hasbullah", trailing: "January 5"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
