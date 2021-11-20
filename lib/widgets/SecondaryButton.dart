import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onPress;
  final double height;

  SecondaryButton({
    @required this.text,
    this.iconData,
    @required this.onPress,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      minWidth: double.maxFinite,
      height: height,
      child: RaisedButton(
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            this.iconData != null ? Icon(iconData) : SizedBox.shrink(),
            SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 17.0, color: Colors.white),
            ),
          ],
        ),
        elevation: 8.0,
        color: kSecondaryButtonColor,
      ),
    );
  }
}
