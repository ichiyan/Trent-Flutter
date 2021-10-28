import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';

class ConfirmationDetailTile extends StatelessWidget {
  final String label;
  final String detail;
  final IconData leadingIcon;
  final Function onTap;

  ConfirmationDetailTile(this.detail, this.leadingIcon, this.onTap,
      [this.label]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 0.5, color: Colors.grey[300]),
      )),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              this.leadingIcon,
              color: kPrimaryColor,
              size: 32,
            ),
          ),
          title: Text(
            this.detail,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: this.label != null
              ? Text(
                  this.label,
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 14.0,
                  ),
                )
              : null,
          dense: true,
          trailing: GestureDetector(
            onTap: this.onTap,
            child: Icon(
              Icons.arrow_forward_ios,
              color: kSecondaryColor,
              size: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
