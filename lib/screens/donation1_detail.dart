import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Donation1Detail extends StatefulWidget {
  const Donation1Detail({Key? key}) : super(key: key);

  @override
  State<Donation1Detail> createState() => _Donation1DetailState();
}

class _Donation1DetailState extends State<Donation1Detail> {
  final TextEditingController _phonenumberController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
            )),
        //ACTION SECTION
        actions: [
          Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_checkout,
                ),
                color: Color.fromARGB(66, 62, 62, 62),
                onPressed: () {},
              )),
        ],
      ),
      //body
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //Title
            Text(
              "Men's Clothes",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey),
            ),
            //Space
            SizedBox(
              height: 10,
            ),
            //Text
            Text(
              "Blue Jeans",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            //space
            SizedBox(
              height: 10,
            ),
            //Image
            Container(
              width: Get.width,
              height: Get.height * .5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/final.jpg"),
                ),
              ),
            ),
            //space
            SizedBox(
              height: 10,
            ),
            //text
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Size",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: Text(
                    "Small",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
            //space
            SizedBox(
              height: 20,
            ),
            Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            //Text
            Text(
              "Donated with love, this blue jeans can fit individuals ranging from 45kg-55kg\n It's a unique mensware currently in fashion",
              style: TextStyle(),
            ),
            //space
            SizedBox(
              height: 20,
            ),
            //title
            Text(
              "Enter Your Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            //Textfield
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Enter Name',
                  // hintText: "Enter official Name",
                ),
                controller: _nameController,
              ),
            ),
            //Textfield
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  labelText: 'Enter Location',
                ),
                controller: _locationController,
              ),
            ),
            //Textfield
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  labelText: 'Enter Phone Number',
                ),
                controller: _phonenumberController,
              ),
            ),
          ],
        ),
      ),
      //BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(49, 48, 62, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          if (value == 0) {
            // Get.to(() => Donation());
          } else if (value == 1) {
            Get.to(() => Donation1Detail());
          }
          //Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_rounded), label: "Favourite"),
        ],
      ),
    );
  }
}
