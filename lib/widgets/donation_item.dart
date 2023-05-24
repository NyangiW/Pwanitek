import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class DonationItem extends StatelessWidget {
  const DonationItem(
      {Key? key,
      required this.onClick,
      required this.img,
      required this.title,
      required this.content})
      : super(key: key);

  final VoidCallback onClick;
  final String img;
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  image: NetworkImage("$img"),
                ),
              ),
            ),
            //SPACE
            SizedBox(
              height: 5,
            ),
            //TITLE TEXT
            Text(
              "$title",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            //SPACE
            SizedBox(
              height: 5,
            ),
            //TITLE TEXT
            Text(
              "$content",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
