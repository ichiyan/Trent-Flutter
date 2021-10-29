import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String imageUrl;

  Avatar(this.size, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(this.imageUrl),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(101, 101, 101, 0.15),
            spreadRadius: 5,
            blurRadius: 7,
          )
        ],
      ),
    );
  }
}
