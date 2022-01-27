import 'package:basecode/constants.dart';
import 'package:basecode/widgets/CustomDenseListTile.dart';
import 'package:flutter/material.dart';
import 'package:basecode/widgets/CircularGraph.dart';

class InsightsScreen extends StatefulWidget {
  // const InsightsScreen({ Key? key }) : super(key: key);

  @override
  _InsightsScreenState createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
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
              "Insights",
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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: height,
              width: width * 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: CircularGraph(amount: 32.01, percentage: 0.7),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Income Flow",
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        CustomDenseListTile(
                            title: "Item", trailing: "Statistic"),
                        CustomDenseListTile(
                            title: "Item", trailing: "Statistic"),
                        CustomDenseListTile(
                            title: "Item", trailing: "Statistic"),
                        CustomDenseListTile(
                            title: "Item", trailing: "Statistic"),
                        CustomDenseListTile(
                            title: "Item", trailing: "Statistic"),
                        CustomDenseListTile(
                            title: "Item", trailing: "Statistic"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
