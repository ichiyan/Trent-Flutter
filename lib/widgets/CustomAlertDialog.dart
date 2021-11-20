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
            height: height * 0.29,
            child: Center(
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
                ],
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: height * 0.08,
              child: FaIcon(
                iconData,
                color: Colors.white,
                size: height * 0.056,
              ),
            ),
            top: -50,
          ),
        ],
      ),
    );
  }
}
