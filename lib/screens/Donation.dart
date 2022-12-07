import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/donation1.dart';
import 'donation1_detail.dart';

class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu_sharp,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "hhttps://www.vecteezy.com/vector-art/1546003-indian-woman-s-face-avatar"),
            ),
          ),
        ],
      ),
      //BODY
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //TITLE
            Text(
              "Receive\n Donation",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            //SPACE
            SizedBox(
              height: 48,
            ),
            //search bar
            Row(
              children: [
                //SEARCH AND FILTER SECTION
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(66, 95, 93, 93),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Find donation to receive",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            //SPACE
            SizedBox(
              height: 20,
            ),
            //todo grid
            //card design
            Row(
              children: [
                Expanded(
                  child: Donation1(
                    onClick: () {},
                    img: 'images/dashboard1.jpg', 
                    title: 'Blue Jeans(Female)\n Size Small',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Donation1( 
                    onClick: () {
                      Get.to(() => Donation1Detail());
                    },
                    img: 'images/dashboard2.jpg',
                    title: 'Blue Jeans(Male)\n Size Medium',),
                ),
              ],
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
          //Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "Places"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "News"),
        ],
      ),
    );
  }
}
