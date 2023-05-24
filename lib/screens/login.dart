import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutoa/screens/intro.dart';
import 'package:kutoa/screens/signup.dart';

import '../controllers/auth_controller.dart';
import '../utils/utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        //text
        title: Center(
          child: Text("Login here!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              )),
        ),
      ),
      body: Container(
        //background image
        padding: EdgeInsets.all(20),
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/login.jpg"), fit: BoxFit.cover),
        ),
        //image
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width * .3,
                height: Get.height * .3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/login.png"),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: 10,
              ),
              //text
              Text(
                "Welcome back!",
                style: TextStyle(
                  backgroundColor: Colors.white10,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              //space
              SizedBox(
                height: 10,
              ),
              //text
              Text(
                "Login to your account",
                style: TextStyle(
                  backgroundColor: Colors.white10,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white24,
                ),
              ),
              //space
              SizedBox(
                height: 10,
              ),
              //Textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: 'Enter email',
                    hintText: "Enter vaild email",
                  ),
                  controller: _emailController,
                ),
              ),
              //space
              SizedBox(
                height: 20,
              ),
              //Textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: 'Enter Password',
                    hintText: "Enter vaild password",
                  ),
                  controller: _passwordController,
                  obscureText: true,
                ),
              ),
              //space
              SizedBox(
                height: 30,
              ),
              TextButton(
                child: Text("Log in".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blue)))),
                onPressed: () async {
                  if (_emailController.text.trim().isEmpty ||
                      !_emailController.text.trim().isEmail) {
                    Utils.showError("Please Enter valid email!");
                  } else if (_passwordController.text.trim().isEmpty) {
                    Utils.showError("No field should be empty!");
                  } else {
                    await AuthController.to.login(_emailController.text.trim(),
                        _passwordController.text.trim());
                  }
                },
              ),

              SizedBox(
                height: 30,
              ),
              TextButton(
                  child: Text("Do not have an account? Sign up".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: () {
                    Get.to(() => Signup());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
