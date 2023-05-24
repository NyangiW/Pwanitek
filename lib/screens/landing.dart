import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kutoa/screens/login.dart';
import 'package:kutoa/screens/signup.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/dash.jpg"), fit: BoxFit.cover),
        ),
        //text
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text(
                "Welcome to Kutoa!",
                style: TextStyle(
                  backgroundColor: Colors.white10,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            //space
            const SizedBox(
              height: 20,
            ),
            //text
            Center(
              child: Text(
                "Your Donations and Receiving App!",
                style: TextStyle(
                  backgroundColor: Colors.white10,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            //space
            const SizedBox(
              height: 20,
            ),
            //text
            Center(
              child: Text(
                "Donate your unused item or choose a donated item to receive",
                style: TextStyle(
                  backgroundColor: Colors.white10,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            //space
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child:
                    Text("Login".toUpperCase(), style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.orange)))),
                onPressed: () async {
                  Get.to(() => Login());
                }),
            //space
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child: Text("Signup".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.orange)))),
                onPressed: () async {
                  Get.to(() => Signup());
                }),
          ],
        ),
      ),
    );
  }
}
