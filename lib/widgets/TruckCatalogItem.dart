import 'package:flutter/material.dart';

class TruckCatalogItem extends StatelessWidget {
  final int truckId;
  final String image;
  final String title;
  final String body;
  final String timePassed;

  TruckCatalogItem({
    @required this.truckId,
    @required this.image,
    @required this.title,
    @required this.body,
    @required this.timePassed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.grey,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image(
              image: NetworkImage(image),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              body,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              timePassed + " ago",
              style: TextStyle(
                color: Colors.grey[350],
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
