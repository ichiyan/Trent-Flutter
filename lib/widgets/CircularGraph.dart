import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircularGraph extends StatefulWidget {
  final double amount;
  double percentage;

  CircularGraph({@required this.amount, @required this.percentage});

  @override
  _CircularGraphState createState() => _CircularGraphState();
}

class _CircularGraphState extends State<CircularGraph>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _animation = Tween<double>(begin: 0, end: widget.percentage)
        .animate(_animationController)
      ..addListener(() {
        setState(() {
          widget.percentage = _animation.value;
        });
      });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final size = height * 0.25;
    return Container(
      height: size,
      width: size,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return SweepGradient(
                      startAngle: 0.0,
                      endAngle: 3.14 * 2,
                      stops: [widget.percentage, widget.percentage],
                      colors: [kPrimaryColor, Color(0xFFE8E8E8)])
                  .createShader(rect);
            },
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Container(
              height: size - 12,
              width: size - 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[50],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$ ${widget.amount}",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(4, 4),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${(widget.percentage * 100).ceil()}% spent",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
