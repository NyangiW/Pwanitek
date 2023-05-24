import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kutoa/controllers/main_controller.dart';
import 'package:kutoa/screens/Donations.dart';
import 'package:kutoa/utils/utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MakeDonation extends StatefulWidget {
  const MakeDonation({Key? key}) : super(key: key);

  @override
  State<MakeDonation> createState() => _MakeDonationState();
}

class _MakeDonationState extends State<MakeDonation> {
  //To handle form input changes
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  File? image;

  Uint8List? imageBytes;
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  String fileName = "image";

  _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      if (kIsWeb) {
        setState(() {
          fileName =
              "${DateTime.now().microsecondsSinceEpoch}.${result.files.single.extension}";
        });
        File pickedImage = await writeToFile(result.files.single.bytes!);
        print(result.files.single.extension);
        setState(() {
          image = pickedImage;
        });
      } else {
        File pickedImage = File(result.files.single.path!);
        setState(() {
          image = pickedImage;
          fileName = basename(pickedImage.path);
        });
      }
    } else {
      // User canceled the picker
    }

    // Pick an image
    // if (kIsWeb) {
    //   setState(() async {
    //     html.File? imageFile = await ImagePickerWeb.getImageAsFile();

    //     image = imageFile != null ? imageFile : null;
    //   });
    // } else {

    // final XFile? pickedImage =
    //     await _picker.pickImage(source: ImageSource.gallery);
    // var mImageBytes =
    //     pickedImage != null ? await pickedImage.readAsBytes() : null;

    //}
  }

  @override
  void initState() {
    print("id = ${MainController.to.donationSelectedId.value}");

    super.initState();
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
      body: SingleChildScrollView(
        child: Padding(
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
                          ? DecorationImage(
                              image: AssetImage("images/dash.jpg"))
                          : kIsWeb && image?.readAsBytesSync() != null
                              ? DecorationImage(
                                  image: MemoryImage(image!.readAsBytesSync()))
                              : DecorationImage(image: FileImage(image!))),
                ),

                //space
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  child: Text("Pick Image".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.blue)))),
                  onPressed: () async {
                    _pickImage();
                  },
                ),
                //space
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: titleController,
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
                  controller: contentController,
                  decoration: InputDecoration(labelText: 'Content'),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  obscureText: false,
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
                  onPressed: () async => await _submit(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submit() async {
    if (titleController.text.isEmpty) {
      Utils.showError("Title should not be empty!");
    } else if (contentController.text.isEmpty) {
      Utils.showError("Content should not be empty!");
    } else if (image == null) {
      Utils.showError("Image should not be empty!");
    } else {
      if (MainController.to.donationSelectedId.value.isNotEmpty) {
        await MainController.to.updateDonation(
            titleController.text, image, contentController.text, fileName);
      } else {
        await MainController.to.createDonation(
            titleController.text, image, contentController.text, fileName);
      }

      Get.to(() => const Donations());
    }
  }

  Future<File> writeToFile(Uint8List data) async {
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath =
        tempPath + '$fileName'; // file_01.tmp is dump file, can be anything
    return File(filePath).writeAsBytes(data);
  }
}
