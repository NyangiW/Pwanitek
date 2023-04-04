import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutoa/main.dart';
import 'package:kutoa/screens/donation.dart';
import 'package:kutoa/screens/login.dart';
import 'package:kutoa/screens/receive.dart';
import 'package:kutoa/screens/signup.dart';
import 'package:kutoa/widgets/donation1.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //BACKGROUND IMAGE
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/dash.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/donation3.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/dashboard1.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            //text sesction
            Column(
              children: [
                Text(
                  "Your",
                  style: TextStyle(
                    fontSize: 28,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Donating and Receiving",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(height: 5),
                Text(
                  "App",
                  style: TextStyle(
                    fontSize: 28,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Giving does not only preceede receiving;it is the reason for it. It is in giving that we receive",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            Row(children: [
              Expanded(
                child: TextButton(
                    child: Text("Receive a Donation".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.orange)))),
                    onPressed: () {
                      Get.to(() => Donation());
                    }),
              ),
              SizedBox(width: 25),
              Expanded(
                child: ElevatedButton(
                    child: Text("Make Donations".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.orange)))),
                    onPressed: () {
                      Get.to(() => Receive());
                    }),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
