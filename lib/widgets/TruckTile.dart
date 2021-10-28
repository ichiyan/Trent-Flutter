import 'package:basecode/screens/BookingConfirmationScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TruckTile extends StatelessWidget {
  final int id;
  final Function onTap;
  final String name;
  final String dimensions;
  final String capacity;
  final String imageUrl;

  TruckTile(this.id, this.onTap, this.name, this.dimensions, this.capacity,
      this.imageUrl);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        this.onTap(id);
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border:
                Border.all(color: Color.fromRGBO(229, 229, 229, 1), width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: width * 0.25,
                ),
                child: Image.asset(this.imageUrl, fit: BoxFit.cover),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                this.name,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      this.dimensions,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(" Meters"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      this.capacity,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(" Maximum"),
                  ],
                )
              ],
            ),
            isThreeLine: true,
            dense: true,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(FontAwesomeIcons.box)],
            ),
          ),
        ),
      ),
    );
  }
}
