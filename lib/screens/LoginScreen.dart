import 'package:basecode/screens/BookingScreen.dart';
import 'package:basecode/screens/DashboardScreen.dart';
import 'package:basecode/screens/TruckCatalogScreen.dart';
import 'package:basecode/widgets/BottomNavBar.dart';
import 'package:basecode/widgets/CustomTextFormField.dart';
import 'package:basecode/widgets/PasswordField.dart';
import 'package:basecode/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log In",
          style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.chevron_left,
            size: 35.0,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * .90,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: "Email Address",
                    hintText: "Enter your email address",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PasswordField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    labelText: "Password",
                    obscureText: obscurePassword,
                    onTap: handleObscurePassword,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  PrimaryButton(
                    text: "Log In",
                    iconData: null,
                    onPress: () {
                      //add auth logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()));
                    },
                    height: 50,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        //add navigation to forgot password screen
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
}
