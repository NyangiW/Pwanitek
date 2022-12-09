import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutoa/screens/login.dart';

import '../controllers/auth_controller.dart';
import '../utils/utils.dart'; 

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
   @override
  State<Signup> createState() => _SignUpState();
}
class _SignUpState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _LocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        //text
        title: Center(
          child: Text("Signup here!",
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
              image: AssetImage("images/sinup.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            //Textfield
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  labelText: 'Enter Name',
                  hintText: "Enter Two Names",
                ),
                 controller: _nameController,
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
                  labelText: 'Enter Email',
                  hintText: "Enter vaild Email",
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
                  labelText: 'Enter Location',
                  hintText: "Enter Current Location",
                ),
                 controller: _LocationController,
              ),
            ),
            //space
            SizedBox(
              height: 30,
            ),
            TextButton(
                child: Text("Sign Up".toUpperCase(),
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
                } else if (_passwordController.text.trim().isEmpty ||
                    _nameController.text.trim().isEmpty ||
                    _LocationController.text.trim().isEmpty) {
                  Utils.showError("No field should be empty!");
                } else {
                  AuthController.to.register(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _nameController.text.trim(),
                      _LocationController.text.trim());
                }},),
              //space
            SizedBox(
              height: 30,
            ), 
             //space
            SizedBox(
              height: 30,
            ), 
              TextButton(
                child: Text("Already have an account? Log in".toUpperCase(),
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
                  Get.to(() => Login());
                }), 
          ],
        ),
    ),
   
    );
  }
}