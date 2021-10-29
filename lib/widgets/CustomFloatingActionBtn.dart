import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionBtn extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onPress;
  final double height;

  CustomFloatingActionBtn(this.text, this.onPress, this.height,
      [this.iconData]);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        onPress();
      },
      label: Text(text),
      elevation: 8.0,
      backgroundColor: Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
