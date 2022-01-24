import 'package:basecode/data/data.dart';
import 'package:basecode/widgets/Chat.dart';
import 'package:basecode/widgets/ChatTextField.dart';
import 'package:basecode/widgets/StickyBottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConversationScreen extends StatefulWidget {
  static String routeName = "/conversation";
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

//call service to get the messages using id
class _ConversationScreenState extends State<ConversationScreen> {
  int id = int.parse(Get.parameters["id"]) ?? 0;
  String name = Get.parameters["name"] ?? "";
  String chatInput = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            this.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.chevron_left,
              color: Theme.of(context).accentColor,
              size: 40,
            ),
          ),
          actions: [
            Container(
              child: Icon(
                Icons.info,
                size: 30,
                color: Theme.of(context).accentColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 15),
            )
          ],
          leadingWidth: 40,
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            physics: ScrollPhysics(),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Chat(
                      messages[index].message, messages[index].isReceiver);
                })),
        bottomNavigationBar: StickyBottomAppBar(
            child: ChatTextField(this.handleChatInput, () {})),
      ),
    );
  }

  void handleChatInput(String value) {
    setState(() {
      chatInput = value;
    });
  }
}
