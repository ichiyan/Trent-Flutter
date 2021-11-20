import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAlertDialog extends StatelessWidget {
  final String text;
  final String btnText;
  final IconData iconData;
  final Function onPress;

  CustomAlertDialog(
      {@required this.text,
      @required this.btnText,
      @required this.iconData,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  text,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0),
                  child: ElevatedButton(
                    child: Text(btnText),
                    onPressed: onPress,
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 50.0,
              child: FaIcon(
                iconData,
                color: Colors.white,
                size: 28.0,
              ),
            ),
            top: -50,
          ),
        ],
      ),
    );
  }
}
