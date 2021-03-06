import 'package:basecode/constants.dart';
import 'package:basecode/screens/TruckDetailsScreen.dart';
import 'package:basecode/data/truckCatalogData.dart';
import 'package:basecode/widgets/TruckCatalogItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TruckCatalogScreen extends StatefulWidget {
  static String routeName = "/truckCatalog";

  @override
  _TruckCatalogScreenState createState() => _TruckCatalogScreenState();
}

class _TruckCatalogScreenState extends State<TruckCatalogScreen> {
  TextEditingController textEditingController = TextEditingController();

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
              Get.back();
            },
            child: Text(
              "Back",
              style: TextStyle(
                color: kAccentColor2,
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
                    color: kAccentColor2,
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.09),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: Color(0xFFE8E8E8),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  )
                ],
              ),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Color(0xFFBDBDBD), fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width * 0.95,
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: trucks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: TruckCatalogItem(
                          truckId: trucks[index].truckId,
                          images: trucks[index].images,
                          title: trucks[index].title,
                          body: trucks[index].body,
                          timePassed: trucks[index].timePassed,
                        ),
                        onTap: () {
                          pushNewScreen(context,
                              screen: TruckDetailsScreen(truck: trucks[index]),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade);
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
