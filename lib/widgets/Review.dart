import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class Review extends StatefulWidget {
  double rating;
  final String truckName;
  final String image;
  final String dateBooked;

  Review(
      {@required this.rating,
      @required this.truckName,
      @required this.image,
      @required this.dateBooked});

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shadowColor: Colors.grey,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image(
              image: NetworkImage(
                  "https://cdn.motor1.com/images/mgl/3KVzA/s1/fastest-trucks-lead.jpg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, right: 9.0, left: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.truckName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                RatingBar.builder(
                  initialRating: widget.rating,
                  minRating: 0,
                  itemSize: width * 0.07,
                  allowHalfRating: true,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) => setState(() {
                    widget.rating = rating;
                  }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, top: 2.5),
            child: Text('Booked on ' + widget.dateBooked),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
