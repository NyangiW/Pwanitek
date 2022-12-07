import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutoa/screens/donation.dart';
import 'package:kutoa/screens/intro.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                onPressed: () {
                  Get.to(() => Intro());
                }),
          ],
        ),
      ),
     
    );
  }
}
