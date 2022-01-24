import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';

class BookingTile extends StatelessWidget {
  final String header;
  final String details;
  final String image;

  BookingTile(
      {@required this.header, @required this.details, @required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
          child: ListTile(
            leading: Container(
              width: width * 0.15,
              height: width * 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  header,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "8m ago",
                  style: TextStyle(color: kSecondaryColor),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                details,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
