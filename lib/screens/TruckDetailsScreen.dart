import 'package:basecode/constants.dart';
import 'package:basecode/models/Truck.dart';
import 'package:basecode/widgets/PrimaryButton.dart';
import 'package:basecode/widgets/SecondaryButton.dart';
import 'package:flutter/material.dart';
import 'package:basecode/screens/CalendarScreen.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TruckDetailsScreen extends StatefulWidget {
  static String routeName = "/truckDetails";
  final Truck truck;

  TruckDetailsScreen({@required this.truck});

  @override
  _TruckDetailsScreenState createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  final controller = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.12,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: width * 0.2,
        titleSpacing: 0,
        title: Container(
          child: Text(
            "Vehicles",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: TextStyle(
                color: kAccentColor,
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
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Filter",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kAccentColor,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(4, 4),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: widget.truck.images.length,
                  itemBuilder: (context, index, realIndex) {
                    final img = widget.truck.images[index];
                    return buildImage(img, index);
                  },
                  options: CarouselOptions(
                    height: height * 0.3,
                    // viewportFraction: 1,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: widget.truck.images.length,
                      effect: WormEffect(
                        dotWidth: 12,
                        dotHeight: 12,
                        dotColor: Color(0xFFE8E8E8),
                        activeDotColor: kPrimaryColor,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.truck.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Status: " + widget.truck.status.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.truck.body,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey[600],
                      height: 1.25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                PrimaryButton(
                  text: "Book Truck Services",
                  onPress: () {},
                  height: 55.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SecondaryButton(
                  text: "Check Available Dates",
                  onPress: () {
                    pushNewScreen(context,
                        screen: CalendarScreen(truck: widget.truck),
                        withNavBar: true,
                        pageTransitionAnimation: PageTransitionAnimation.fade);
                  },
                  height: 55.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildImage(String urlImg, int index) => Card(
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
