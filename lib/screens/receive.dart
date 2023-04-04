import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Receive extends StatefulWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  //To handle form input changes
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  File? image;
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedImage != null ? File(pickedImage.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: Text("Mind Giving out an Item?"),
        leading: IconButton(
          icon: Icon(Icons.filter_vintage),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Donate items to others ",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //image
              Container(
                height: Get.height * .35,
                width: Get.width,
                decoration: BoxDecoration(
                    image: image == null
                        ? DecorationImage(image: AssetImage("images/dash.jpg"))
                        : DecorationImage(image: NetworkImage(""))),
              ),
              //space
              SizedBox(
                height: 25,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                keyboardType: TextInputType.name,
                onFieldSubmitted: (value) {
                  //Validator
                },
              ),
//box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input
              TextFormField(
                decoration: InputDecoration(labelText: 'Content'),
                keyboardType: TextInputType.name,
                onFieldSubmitted: (value) {},
                obscureText: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextButton(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () => _submit(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
