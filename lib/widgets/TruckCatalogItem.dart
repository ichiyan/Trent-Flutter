import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TruckCatalogItem extends StatefulWidget {
  final int truckId;
  final List<String> images;
  final String title;
  final String body;
  final String timePassed;

  TruckCatalogItem({
    @required this.truckId,
    @required this.images,
    @required this.title,
    @required this.body,
    @required this.timePassed,
  });

  @override
  _TruckCatalogItemState createState() => _TruckCatalogItemState();
}

class _TruckCatalogItemState extends State<TruckCatalogItem> {
  final controller = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          if (widget.images.length > 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: widget.images.length,
                  effect: WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    dotColor: Color(0xFFE8E8E8),
                    activeDotColor: kPrimaryColor,
                  ),
                  onDotClicked: (index) => controller.animateToPage(index),
                ),
              ),
            ),
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              return buildImage(widget.images[index]);
            },
            options: CarouselOptions(
              // height: height * 0.28,
              viewportFraction: widget.images.length > 1 ? 0.8 : 1,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.body,
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
              widget.timePassed + " ago",
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

  Widget buildImage(String urlImg) => Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image(
          image: NetworkImage(urlImg),
          fit: BoxFit.cover,
        ),
      );
}
