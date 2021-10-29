import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

// ignore: must_be_immutable
class TruckTile extends StatefulWidget {
  final int id;
  final Function onTap;
  final String name;
  final String dimensions;
  final String capacity;
  bool selected;

  final String imageUrl = "assets/images/truck-orange.png";
  final String selectedImageUrl = "assets/images/truck-white.png";

  TruckTile(this.id, this.onTap, this.name, this.dimensions, this.capacity,
      [this.selected = false]);

  @override
  _TruckTileState createState() => _TruckTileState();
}

class _TruckTileState extends State<TruckTile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = true;
        });
        Timer(Duration(seconds: 1), () {
          widget.onTap();
          setState(() {
            widget.selected = false;
          });
        });
      },
      child: Container(
        height: 116,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: widget.selected == true ? kPrimaryColor : null,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: Color.fromRGBO(229, 229, 229, 1),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: width * 0.25,
                    ),
                    child: Image.asset(
                        widget.selected == true
                            ? widget.selectedImageUrl
                            : widget.imageUrl,
                        fit: BoxFit.cover),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: widget.selected == true
                          ? Colors.white
                          : kPrimaryColor,
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
                          widget.dimensions,
                          style: TextStyle(
                            color: widget.selected == true
                                ? Color(0XFFFFD6BF)
                                : kSecondaryColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " Meters",
                          style: TextStyle(
                            color: widget.selected == true
                                ? Color(0XFFFFD6BF)
                                : kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.capacity,
                          style: TextStyle(
                            color: widget.selected == true
                                ? Color(0XFFFFD6BF)
                                : kSecondaryColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " Maximum",
                          style: TextStyle(
                            color: widget.selected == true
                                ? Color(0XFFFFD6BF)
                                : kSecondaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                isThreeLine: true,
                dense: true,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      FontAwesomeIcons.box,
                      color: widget.selected == true
                          ? Colors.white
                          : Colors.grey.withOpacity(0.5),
                    )
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
