import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../utils/utils.dart';
import 'auth_controller.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  var firestore;

//creating tables for donations and donation request
  var donation = <String, dynamic>{}.obs;
  var donationRequest = <String, dynamic>{}.obs;

  //selecting single item
  var donationSelectedId = "".obs;
  var donationRequestSelectedId = "".obs;

  @override
  void onReady() {
    super.onReady();
    firestore = FirebaseFirestore.instance;

    //Reactive list
    donation.bindStream(donationStream());
  }

  //creating data
  createDonation(title, imageUrl, content) async {
    Utils.showLoading(message: "Creating Donation");
    var userId = AuthController.to.firebaseUser.value?.uid;
    var donorName = AuthController.to.firebaseUser.value?.displayName;
    try {
      await firestore.collection('Donation').add({
        "title": title,
        "imageUrl": imageUrl,
        "content": content,
        "donorId": userId,
        "donorName": donorName,
        "created": Timestamp.now()
      });
      Utils.showSuccess("Creation Successful!");
      Utils.dismissLoader();
    } catch (e) {
      Utils.showError("Creation Failed. Try again!");
      Utils.dismissLoader();
    }
  }

  createDonationRequest(
      donationId, approvalStatus, donationTitle, donorName) async {
    Utils.showLoading(message: "Creating DonationRequest");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('DonationRequest').add({
        "userId": userId,
        "donorName": donorName,
        "donationTitle": donationTitle,
        "donationId": donationId,
        "approvalStatus": approvalStatus,
        "created": Timestamp.now()
      });
      Utils.showSuccess("Creation Successful!");
      Utils.dismissLoader();
    } catch (e) {
      Utils.showError("Creation Failed. Try again!");
      Utils.dismissLoader();
    }
  }

  //updating methods
  updateDonation(title, imageUrl, content, donorId) async {
    Utils.showLoading(message: "Updating Donation");
    try {
      await firestore.collection('Donation').doc(donationSelectedId).update({
        "title": title,
        "imageUrl": imageUrl,
        "content": content,
      });
      Utils.showSuccess("Update Successful!");
      Utils.dismissLoader();
    } catch (e) {
      Utils.showError("Update Failed. Try again!");
      Utils.dismissLoader();
    }
  }

  // updateDonationRequest(donationId, approvalStatus) async {
  //   Utils.showLoading(message: "Updating DonationRequest");
  //   var userId = AuthController.to.firebaseUser.value?.uid;
  //   try {
  //     await firestore.collection('DonationRequest').set({
  //       "userId": userId,
  //       "donationId": donationId,
  //       "approvalStatus": approvalStatus
  //     });
  //     Utils.showSuccess("Update Successful!");
  //     Utils.dismissLoader();
  //   } catch (e) {
  //     Utils.showError("Update Failed. Try again!");
  //     Utils.dismissLoader();
  //   }
  // }

  //deleting methods
  deleteDonation(id) async {
    Utils.showLoading(message: "Deleting Donation");
    try {
      await firestore.collection('Donation').doc(id).delete();
      Utils.showSuccess("Deletion Successful!");
      Utils.dismissLoader();
    } catch (e) {
      Utils.showError("Deleting Failed. Try again!");
      Utils.dismissLoader();
    }
  }

  deleteDonationRequest(id) async {
    Utils.showLoading(message: "Deleting DonationRequest");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('DonationRequest').doc(id).delete();
      Utils.showSuccess("Deletion Successful!");
      Utils.dismissLoader();
    } catch (e) {
      Utils.showError("Deleting Failed. Try again!");
      Utils.dismissLoader();
    }
  }

  //Fetch livestream
  Stream<Map<String, dynamic>> donationStream() {
    var ref = FirebaseFirestore.instance
        .collection('donation')
        .orderBy("created")
        .snapshots();
    return ref.map((list) {
      return {for (var element in list.docs) element.id: element.data()};
    });
  }

//Select Item Id
  selectDonation(id) {
    donationSelectedId.value = id;
    update();
  }

//Fetch livestream
  Stream<Map<String, dynamic>> donationRequestStream() {
    var userId = AuthController.to.firebaseUser.value?.uid;
    var ref = FirebaseFirestore.instance
        .collection('donationRequest')
        .where("userId", isEqualTo: userId)
        .orderBy("created")
        .snapshots();
    return ref.map((list) {
      return {for (var element in list.docs) element.id: element.data()};
    });
  }

//Select Item Id
  selectDonationRequest(id) {
    donationRequestSelectedId.value = id;
    update();
  }

  //uploading image function
  uploadImage(File image) async {
// Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

    final imageRef = storageRef.child(basename(image.path));
    try {
      await imageRef.putFile(image);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
