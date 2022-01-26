import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';

class CustomDenseListTile extends StatelessWidget {
  final String title;
  final String trailing;

  CustomDenseListTile({@required this.title, @required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 3.5,
          dense: true,
          leading: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 4),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ],
            ),
          ),
          title: Text(
            this.title,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            this.trailing,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Divider(
          thickness: 0.5,
        ),
      ],
    );
  }
}
