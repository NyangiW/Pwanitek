
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Donation1 extends StatelessWidget {
  const Donation1({Key? key, required this.onClick, required this.img, required this.title}) : super(key: key);

  final VoidCallback onClick;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
              onTap: onClick,
              child: Container(
                width: Get.width * .45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    //hearticon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    //SPACE
                    SizedBox(
                      height: 5,
                    ),
                    //IMAGE
                    Container(
                      width: Get.width * .7,
                      height: Get.height * .5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/dashboard2.jpg"),),
                      ),
                    ),
                    //SPACE
                    SizedBox(
                      height: 5,
                    ),
                    //TITLE TEXT
                    Text(
                     "Blue Jeans(Female)\n Size Small",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}