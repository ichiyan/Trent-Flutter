import 'package:basecode/constants.dart';
import 'package:basecode/screens/RegistrationScreen.dart';
import 'package:basecode/screens/SignupScreen.dart';
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.12,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: width * 0.2,
        titleSpacing: 0,
        title: Container(
          child: Text(
            "Log In",
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
            child: Icon(
              Icons.close,
              color: kSecondaryColor,
            ),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.offNamed(SignupScreen.routeName);
                },
                child: Text(
                  "Sign Up",
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
                    onPress: () {
                      //add auth logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()));
                    },
                    height: 60,
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
                            color: kAccentColor2,
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
