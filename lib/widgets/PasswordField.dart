import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final Function onTap;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  PasswordField(
      {@required this.obscureText,
      @required this.onTap,
      @required this.labelText,
      @required this.hintText,
      @required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(top: 12.0, right: 15.0, bottom: 10.0),
            child: Text(
              obscureText ? "Show" : "Hide",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kAccentColor2,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(4, 4),
                    blurRadius: 15,
                  ),
                ],
              ),
            ),
          ),
          onTap: onTap,
        ),
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}
